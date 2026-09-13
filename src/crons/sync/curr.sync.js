import QueryStream from 'pg-query-stream';
import * as syncHelper from '@agung_dhewe/webapps/src/sync-helper.js'

const { resetTimestamp, prepareData, syncChangedData, clearBatch, createSqlUpsert } = syncHelper

const tableCurr = 'public.curr'
const tableSyncCurr = '"temp".synccurr'
const tableDeletedCurr = '"log".deletedcurr'
const pkCurr = 'curr_id'

export default async function syncAuth(dbSource, dbTarget, batch_id, options = {}) {
	try {
		const syncAllData = typeof options === 'boolean' ? options : Boolean(options?.all)
		if (syncAllData) {
			await resetTimestamp(dbSource, dbTarget, tableCurr)
		}

		await prepareData(dbSource, dbTarget, batch_id, tableCurr, tableSyncCurr, tableDeletedCurr, pkCurr)
		await syncChangedData(dbSource, dbTarget, batch_id, tableCurr, tableSyncCurr, tableDeletedCurr, pkCurr, processBatch)
		await clearBatch(dbSource, batch_id, tableCurr, tableSyncCurr, tableDeletedCurr, pkCurr)

	} catch (err) {
		throw err
	}
}


async function processBatch(dbSource, dbTarget, batch) {
	console.log(`${tableCurr}: syncing ${batch.length} data`)

	try {
		for (let row of batch) {
			const { curr_id, _isdelete } = row

			if (_isdelete) {
				await deleteCurr(dbTarget, curr_id)
			} else {
				await copyCurr(dbTarget, row)
			}
		}
	} catch (err) {
		throw err
	}
}

async function copyCurr(dbTarget, data) {
	try {
		const sql = createSqlUpsert(tableCurr, [pkCurr], [
			'curr_id', 'curr_name', 'curr_descr', 'curr_code',
			'_createby', '_createdate', '_modifyby', '_modifydate', '_timestamp'
		])
		await dbTarget.none(sql, data);
	} catch (err) {
		throw err
	}
}

async function deleteCurr(dbTarget, curr_id) {
	try {
		const sql = `delete from ${tableCurr} where ${pkCurr}=$[${pkCurr}]`
		await dbTarget.none(sql, { curr_id })
	} catch (err) {
		throw err
	}
}