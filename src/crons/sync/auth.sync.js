import QueryStream from 'pg-query-stream';
import * as syncHelper from '@agung_dhewe/webapps/src/sync-helper.js'

const { resetTimestamp, prepareData, syncChangedData, clearBatch, createSqlUpsert } = syncHelper

const tableAuth = 'core.auth'
const tableSyncAuth = '"temp".syncauth'
const tableDeletedAuth = '"log".deletedauth'
const pkAuth = 'auth_id'

export default async function syncAuth(dbSource, dbTarget, batch_id, options = {}) {
	try {
		const syncAllData = typeof options === 'boolean' ? options : Boolean(options?.all)
		if (syncAllData) {
			await resetTimestamp(dbSource, dbTarget, tableAuth)
		}

		await prepareData(dbSource, dbTarget, batch_id, tableAuth, tableSyncAuth, tableDeletedAuth, pkAuth)
		await syncChangedData(dbSource, dbTarget, batch_id, tableAuth, tableSyncAuth, tableDeletedAuth, pkAuth, processBatch)
		await clearBatch(dbSource, batch_id, tableAuth, tableSyncAuth, tableDeletedAuth, pkAuth)

	} catch (err) {
		throw err
	}
}


async function processBatch(dbSource, dbTarget, batch) {
	console.log(`${tableAuth}: syncing ${batch.length} data`)

	try {
		for (let row of batch) {
			const { auth_id, _isdelete } = row

			if (_isdelete) {
				await deleteAuth(dbTarget, auth_id)
			} else {
				await copyAuth(dbTarget, row)
			}
		}
	} catch (err) {
		throw err
	}
}

async function copyAuth(dbTarget, data) {
	try {
		const sql = createSqlUpsert(tableAuth, [pkAuth], [
			'auth_id', 'auth_name', 'auth_label', 'auth_descr', 'user_id',
			'delegate_start', 'delegate_end', 'delegate_user_id',
			'_createby', '_createdate', '_modifyby', '_modifydate', '_timestamp'
		])
		await dbTarget.none(sql, data);

	} catch (err) {
		throw err
	}
}

async function deleteAuth(dbTarget, auth_id) {
	try {
		const sql = `delete from ${tableAuth} where ${pkAuth}=$[${pkAuth}]`
		await dbTarget.none(sql, { auth_id })
	} catch (err) {
		throw err
	}
}