import QueryStream from 'pg-query-stream';
import * as syncHelper from '@agung_dhewe/webapps/src/sync-helper.js'

const { resetTimestamp, prepareData, syncChangedData, clearBatch, createSqlUpsert } = syncHelper

const tableUser = 'core.user'
const tableUserLogin = 'core.userlogin'
const tableSyncUser = '"temp".syncuser'
const tableDeletedUser = '"log".deleteduser'
const pkUser = 'user_id'



export default async function syncUser(dbSource, dbTarget, batch_id, options = {}) {
	try {
		const syncAllData = typeof options === 'boolean' ? options : Boolean(options?.all)
		if (syncAllData) {
			await resetTimestamp(dbSource, dbTarget, tableUser)
		}

		await prepareData(dbSource, dbTarget, batch_id, tableUser, tableSyncUser, tableDeletedUser, pkUser)
		await syncChangedData(dbSource, dbTarget, batch_id, tableUser, tableSyncUser, tableDeletedUser, pkUser, processBatch)
		await clearBatch(dbSource, batch_id, tableUser, tableSyncUser, tableDeletedUser, pkUser)

	} catch (err) {
		throw err
	}
}



async function processBatch(dbSource, dbTarget, batch) {
	console.log(`${tableUser}: syncing ${batch.length} data`)

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
		const sql = createSqlUpsert(tableUser, [pkUser], [
			'user_id', 'user_name', 'user_nickname', 'user_fullname', 'user_email',
			'user_password', 'user_isdisabled', 'user_isdev',
			'user_isallowallprogram', 'user_isshowallprogram',
			'_createby', '_createdate', '_modifyby', '_modifydate', '_timestamp'
		])
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

			const sql = createSqlUpsert(tableUserLogin, ['userlogin_id'], [
				'userlogin_id', 'userlogin_name', 'user_id',
				'_createby', '_createdate', '_modifyby', '_modifydate', '_timestamp',
				'_todelete'
			])
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