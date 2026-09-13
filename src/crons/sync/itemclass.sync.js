import QueryStream from 'pg-query-stream';
import * as syncHelper from '@agung_dhewe/webapps/src/sync-helper.js'

const { resetTimestamp, prepareData, syncChangedData, clearBatch, createSqlUpsert } = syncHelper

const tableItemclass = 'public.itemclass'
const tableSyncItemclass = '"temp".syncitemclass'
const tableDeletedItemclass = '"log".deleteditemclass'
const pkItemclass = 'itemclass_id'

export default async function syncAuth(dbSource, dbTarget, batch_id, options = {}) {
	try {
		const syncAllData = typeof options === 'boolean' ? options : Boolean(options?.all)
		if (syncAllData) {
			await resetTimestamp(dbSource, dbTarget, tableItemclass)
		}

		await prepareData(dbSource, dbTarget, batch_id, tableItemclass, tableSyncItemclass, tableDeletedItemclass, pkItemclass)
		await syncChangedData(dbSource, dbTarget, batch_id, tableItemclass, tableSyncItemclass, tableDeletedItemclass, pkItemclass, processBatch)
		await clearBatch(dbSource, batch_id, tableItemclass, tableSyncItemclass, tableDeletedItemclass, pkItemclass)

	} catch (err) {
		throw err
	}
}


async function processBatch(dbSource, dbTarget, batch) {
	console.log(`${tableItemclass}: syncing ${batch.length} data`)

	try {
		for (let row of batch) {
			const { itemclass_id, _isdelete } = row

			if (_isdelete) {
				await deleteItemclass(dbTarget, itemclass_id)
			} else {
				await copyItemclass(dbTarget, row)
			}
		}
	} catch (err) {
		throw err
	}
}

async function copyItemclass(dbTarget, data) {
	try {
		const sql = createSqlUpsert(tableItemclass, [pkItemclass], [
			'itemclass_id', 'itemclass_isdisabled', 'itemclass_name',
			'itemclass_descr', 'owner_struct_id',
			'_createby', '_createdate', '_modifyby', '_modifydate', '_timestamp'
		])
		await dbTarget.none(sql, data);
	} catch (err) {
		throw err
	}
}

async function deleteItemclass(dbTarget, itemclass_id) {
	try {
		const sql = `delete from ${tableItemclass} where ${pkItemclass}=$[${pkItemclass}]`
		await dbTarget.none(sql, { itemclass_id })
	} catch (err) {
		throw err
	}
}