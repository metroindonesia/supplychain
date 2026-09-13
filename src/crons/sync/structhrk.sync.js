import QueryStream from 'pg-query-stream';
import * as syncHelper from '@agung_dhewe/webapps/src/sync-helper.js'

const { resetTimestamp, prepareData, syncChangedData, clearBatch, createSqlUpsert } = syncHelper

const tableStructhrk = 'public.structhrk'
const tableSyncStructhrk = '"temp".syncstructhrk'
const tableDeletedStructhrk = '"log".deletedstructhrk'
const pkStructhrk = 'structhrk_id'


export default async function syncAuth(dbSource, dbTarget, batch_id, options = {}) {
	try {
		const syncAllData = typeof options === 'boolean' ? options : Boolean(options?.all)
		if (syncAllData) {
			await resetTimestamp(dbSource, dbTarget, tableStructhrk)
		}

		await prepareData(dbSource, dbTarget, batch_id, tableStructhrk, tableSyncStructhrk, tableDeletedStructhrk, pkStructhrk)
		await syncChangedData(dbSource, dbTarget, batch_id, tableStructhrk, tableSyncStructhrk, tableDeletedStructhrk, pkStructhrk, processBatch)
		await clearBatch(dbSource, batch_id, tableStructhrk, tableSyncStructhrk, tableDeletedStructhrk, pkStructhrk)

	} catch (err) {
		throw err
	}
}

async function processBatch(dbSource, dbTarget, batch) {
	console.log(`${tableStructhrk}: syncing ${batch.length} data`)

	try {
		for (let data of batch) {
			const { structhrk_id, _isdelete } = data

			if (_isdelete) {
				await deleteStructhrk(dbTarget, structhrk_id)
			} else {
				await copyStructhrk(dbTarget, data)
			}
		}
	} catch (err) {
		throw err
	}
}

async function copyStructhrk(dbTarget, data) {
	try {

		const sql = createSqlUpsert(tableStructhrk, [pkStructhrk], [
			'structhrk_id', 'structhrk_name', 'structhrk_level',
			'_createby', '_createdate', '_modifyby', '_modifydate', '_timestamp'
		])
		await dbTarget.none(sql, data);

	} catch (err) {
		throw err
	}
}

async function deleteStructhrk(dbTarget, structhrk_id) {
	try {
		const sql = `delete from ${tableStructhrk} where ${pkStructhrk}=$[${pkStructhrk}]`
		await dbTarget.none(sql, { structhrk_id })
	} catch (err) {
		throw err
	}
}