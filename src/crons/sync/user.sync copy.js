import QueryStream from 'pg-query-stream';
import { resetTimestamp, prepareData, syncChangedData, clearBatch } from './sync-helper.js'


const tableUser = 'core.user'
const tableUserLogin = 'core.userlogin'
const tableSyncUser = '"temp".syncuser'
const tableDeletedUser = '"log".deleteduser'



export default async function syncUser(dbSource, dbTarget, batch_id, options = {}) {
	try {
		const syncAllData = typeof options === 'boolean' ? options : Boolean(options?.all)
		if (syncAllData) {
			await resetTimestamp(dbSource, dbTarget, tableUser)
		}

		await prepareData(dbSource, dbTarget, batch_id)
		await syncChangedData(dbSource, dbTarget, batch_id)
		await clearBatch(dbSource, batch_id)

	} catch (err) {
		throw err
	}
}



async function prepareData(dbSource, dbTarget, batch_id) {
	try {

		// hapus data temp.syncuser yang expired
		await dbSource.query(`delete from ${tableSyncUser} where _expired<NOW()`)

		// cek timestamp terbaru dari dbTarget saat ini
		const row = await dbTarget.oneOrNone(`select max(_timestamp) as maxtimestamp from ${tableUser}`)
		const { maxtimestamp } = row

		// siapkan data yang akan di sync UPDATE
		const sqlPrepareUpdate = `
				insert into ${tableSyncUser} (batch_id, user_id, _expired, _timestamp)
				select 
					$[batch_id] as batch_id, 
					user_id, 
					NOW() + ($[minutes] * INTERVAL '1 minute') as _expired,
					_timestamp
				from ${tableUser} 
				where 
					_timestamp > $[maxtimestamp] 
				order by _timestamp
			`
		await dbSource.none(sqlPrepareUpdate, {
			batch_id,
			minutes: 10,
			maxtimestamp
		})


		// siapkan data yang akan di sync DELETE
		const sqlPrepareDelete = `
			insert into ${tableSyncUser} (batch_id, user_id, _expired, _timestamp, _isdelete)
			select 
				$[batch_id] as batch_id, 
				user_id, 
				NOW() + ($[minutes] * INTERVAL '1 minute') as _expired,
				_timestamp,
				true as _isdelete
			from ${tableDeletedUser}
			where 
				_timestamp > $[maxtimestamp] 
			order by _timestamp`

		await dbSource.none(sqlPrepareDelete, {
			batch_id,
			minutes: 10,
			maxtimestamp
		})

	} catch (err) {
		throw err
	}
}




async function syncChangedData(dbSource, dbTarget, batch_id) {
	try {
		// ambil data
		const sql = `
			select B.*, A._isdelete 
			from ${tableSyncUser} A left join ${tableUser} B on B.user_id=A.user_id
			where
				A.batch_id = $1
			and B.user_id is not null
			order by A._timestamp, A.user_id
		`
		const qs = new QueryStream(sql, [batch_id], { batchSize: 10 });
		await dbSource.stream(qs, (stream) => {
			return new Promise((resolve, reject) => {
				let batch = [];

				stream.on('data', async (row) => {
					batch.push(row);

					if (batch.length === 10) {
						stream.pause();
						try {
							const currentBatch = batch;
							batch = [];
							await processBatch(dbSource, dbTarget, currentBatch);
							stream.resume();
						} catch (error) {
							stream.destroy(error);
						}
					}
				});

				stream.on('end', async () => {
					try {
						if (batch.length > 0) {
							await processBatch(dbSource, dbTarget, batch);
							batch = [];
						}
						resolve();
					} catch (error) {
						reject(error);
					}
				});

				stream.on('error', (error) => {
					reject(error);
				});
			});
		});
	} catch (err) {
		throw err
	}
}


async function clearBatch(dbSource, batch_id) {
	try {
		await dbSource.none(`delete from ${tableSyncUser}  where batch_id = $[batch_id]`, { batch_id })
	} catch (err) {
		throw err
	}
}



async function processBatch(dbSource, dbTarget, batch) {
	console.log(`syncing ${batch.length} data`)

	try {
		for (let row of batch) {
			const { user_id, _isdelete } = row

			if (_isdelete) {
				// DELETE DATA
				await deleteUserlogin(dbTarget, user_id)
				await deleteUserprop(dbTarget, user_id)
				await deleteUsergroup(dbTarget, user_id)
				await deleteUserfavouriteprogram(dbTarget, user_id)
				await deleteUserrole(dbTarget, user_id)
				await deleteUser(dbTarget, user_id)
			} else {
				await copyUser(dbTarget, row)
				await copyUserLogin(dbSource, dbTarget, user_id)
			}
		}
	} catch (err) {
		throw err
	}
}

async function copyUser(dbTarget, data) {
	try {
		// INSERT OR UPDATE DATA
		const sql = `
			insert into ${tableUser} (
				user_id, user_name, user_nickname, user_fullname, user_email,
				user_password, user_isdisabled, user_isdev, 
				user_isallowallprogram, user_isshowallprogram,
				_createby, _createdate, _modifyby, _modifydate, _timestamp
			) values (
				$[user_id], $[user_name], $[user_nickname], $[user_fullname], $[user_email],
				$[user_password], $[user_isdisabled], $[user_isdev], 
				$[user_isallowallprogram], $[user_isshowallprogram],
				$[_createby], $[_createdate], $[_modifyby], $[_modifydate], $[_timestamp]
			)  ON CONFLICT (user_id) DO UPDATE SET
				user_id = EXCLUDED.user_id,
				user_name = EXCLUDED.user_name,
				user_nickname = EXCLUDED.user_nickname,
				user_fullname = EXCLUDED.user_fullname,
				user_email = EXCLUDED.user_email,
				user_password = EXCLUDED.user_password,
				user_isdisabled = EXCLUDED.user_isdisabled,
				user_isdev = EXCLUDED.user_isdev,
				user_isallowallprogram = EXCLUDED.user_isallowallprogram,
				user_isshowallprogram = EXCLUDED.user_isshowallprogram,
				_createby = EXCLUDED._createby,
				_createdate = EXCLUDED._createdate,
				_modifyby = EXCLUDED._modifyby,
				_modifydate = EXCLUDED._modifydate,
				_timestamp = EXCLUDED._timestamp`

		await dbTarget.none(sql, data);
	} catch (err) {
		throw err
	}
}

async function copyUserLogin(dbSource, dbTarget, user_id) {
	try {
		// sebelumnya marking delete dahulu, baru kemudian ditimpa
		await dbTarget.none(`update ${tableUserLogin} set _todelete=true where user_id=$[user_id]`, { user_id })

		// copy data
		const sql = `select * from ${tableUserLogin} where user_id=$[user_id]`
		const rows = await dbSource.any(sql, { user_id })
		for (let row of rows) {
			row._todelete = false
			const sql = `
				insert into ${tableUserLogin} (
					userlogin_id, userlogin_name, user_id,
					_createby, _createdate, _modifyby, _modifydate, _timestamp, _todelete
				) values (
					$[userlogin_id], $[userlogin_name], $[user_id],
					$[_createby], $[_createdate], $[_modifyby], $[_modifydate], $[_timestamp], $[_todelete]
				)  ON CONFLICT (userlogin_id) DO UPDATE SET
					userlogin_id = EXCLUDED.userlogin_id,
					userlogin_name = EXCLUDED.userlogin_name,
					user_id = EXCLUDED.user_id,
					_createby = EXCLUDED._createby,
					_createdate = EXCLUDED._createdate,
					_modifyby = EXCLUDED._modifyby,
					_modifydate = EXCLUDED._modifydate,
					_timestamp = EXCLUDED._timestamp,
					_todelete = EXCLUDED._todelete`

			await dbTarget.none(sql, row);
		}

		// hapus data yang di mark delete
		await dbTarget.none(`delete from ${tableUserLogin} where user_id=$[user_id] and _todelete=true`, { user_id })

	} catch (err) {
		throw err
	}
}

async function deleteUserlogin(dbTarget, user_id) {
	try {
		const sql = `delete from core.userlogin where user_id=$[user_id]`
		await dbTarget.none(sql, { user_id })
	} catch (err) {
		throw err
	}
}

async function deleteUserprop(dbTarget, user_id) {
	try {
		const sql = `delete from core.userprop where user_id=$[user_id]`
		await dbTarget.none(sql, { user_id })
	} catch (err) {
		throw err
	}
}


async function deleteUsergroup(dbTarget, user_id) {
	try {
		const sql = `delete from core.usergroup where user_id=$[user_id]`
		await dbTarget.none(sql, { user_id })
	} catch (err) {
		throw err
	}
}


async function deleteUserfavouriteprogram(dbTarget, user_id) {
	try {
		const sql = `delete from core.userfavouriteprogram where user_id=$[user_id]`
		await dbTarget.none(sql, { user_id })
	} catch (err) {
		throw err
	}
}


async function deleteUserrole(dbTarget, user_id) {
	try {
		const sql = `delete from core.userrole where user_id=$[user_id]`
		await dbTarget.none(sql, { user_id })
	} catch (err) {
		throw err
	}
}

async function deleteUser(dbTarget, user_id) {
	try {
		const sql = `delete from core.user where user_id=$[user_id]`
		await dbTarget.none(sql, { user_id })
	} catch (err) {
		throw err
	}
}