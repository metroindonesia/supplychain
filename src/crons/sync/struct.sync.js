import QueryStream from 'pg-query-stream';
import * as syncHelper from '@agung_dhewe/webapps/src/sync-helper.js'

const { resetTimestamp, prepareData, syncChangedData, clearBatch, createSqlUpsert } = syncHelper

const tableStruct = 'public.struct'
const tableSyncStruct = '"temp".syncstruct'
const tableDeletedStruct = '"log".deletedstruct'
const pkStruct = 'struct_id'

export default async function syncAuth(dbSource, dbTarget, batch_id, options = {}) {
	try {
		const syncAllData = typeof options === 'boolean' ? options : Boolean(options?.all)
		if (syncAllData) {
			await resetTimestamp(dbSource, dbTarget, tableStruct)
		}

		await prepareData(dbSource, dbTarget, batch_id, tableStruct, tableSyncStruct, tableDeletedStruct, pkStruct)
		await syncChangedData(dbSource, dbTarget, batch_id, tableStruct, tableSyncStruct, tableDeletedStruct, pkStruct, processBatch)
		await clearBatch(dbSource, batch_id, tableStruct, tableSyncStruct, tableDeletedStruct, pkStruct)

	} catch (err) {
		throw err
	}
}


async function processBatch(dbSource, dbTarget, batch) {
	console.log(`${tableStruct}: syncing ${batch.length} data`)

	try {
		for (let row of batch) {
			const { struct_id, _isdelete } = row

			if (_isdelete) {
				await deleteStruct(dbTarget, struct_id)
			} else {
				await copyStruct(dbTarget, row)
			}
		}
	} catch (err) {
		throw err
	}
}

async function copyStruct(dbTarget, data) {

	try {
		const sql = createSqlUpsert(tableStruct, [pkStruct], [
			'struct_id', 'struct_code', 'struct_isdisabled', 'struct_isparent',
			'struct_istransaction', 'struct_name', 'structhrk_id', 'struct_level',
			'struct_pathid', 'struct_path', 'isitemowner', 'auth_id', 'struct_ishaspnl',
			'_createby', '_createdate', '_modifyby', '_modifydate', '_timestamp'
		])
		await dbTarget.none(sql, data);

		// sync parent
		const sqlParent = createSqlUpsert(tableStruct, [pkStruct], [
			'struct_id', 'struct_parent'
		]);
		await dbTarget.none(sql, data);

	} catch (err) {
		throw err
	}
}

async function deleteStruct(dbTarget, struct_id) {
	try {
		const sql = `delete from ${tableStruct} where ${pkStruct}=$[${pkStruct}]`
		await dbTarget.none(sql, { struct_id })
	} catch (err) {
		throw err
	}
}