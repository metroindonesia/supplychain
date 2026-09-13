import QueryStream from 'pg-query-stream';
import * as syncHelper from '@agung_dhewe/webapps/src/sync-helper.js'

const { resetTimestamp, prepareData, syncChangedData, clearBatch, createSqlUpsert } = syncHelper

const tableUnit = 'public.unit'
const tableSyncUnit = '"temp".syncunit'
const tableDeletedUnit = '"log".deletedunit'
const pkUnit = 'unit_id'

export default async function syncAuth(dbSource, dbTarget, batch_id, options = {}) {
	try {
		const syncAllData = typeof options === 'boolean' ? options : Boolean(options?.all)
		if (syncAllData) {
			await resetTimestamp(dbSource, dbTarget, tableUnit)
		}

		await prepareData(dbSource, dbTarget, batch_id, tableUnit, tableSyncUnit, tableDeletedUnit, pkUnit)
		await syncChangedData(dbSource, dbTarget, batch_id, tableUnit, tableSyncUnit, tableDeletedUnit, pkUnit, processBatch)
		await clearBatch(dbSource, batch_id, tableUnit, tableSyncUnit, tableDeletedUnit, pkUnit)

	} catch (err) {
		throw err
	}
}


async function processBatch(dbSource, dbTarget, batch) {
	console.log(`${tableUnit}: syncing ${batch.length} data`)

	try {
		for (let row of batch) {
			const { unit_id, _isdelete } = row

			if (_isdelete) {
				await deleteUnit(dbTarget, unit_id)
			} else {
				await copyUnit(dbTarget, row)
			}
		}
	} catch (err) {
		throw err
	}
}

async function copyUnit(dbTarget, data) {
	try {
		const sql = createSqlUpsert(tableUnit, [pkUnit], [
			'unit_id', 'unit_isdisabled', 'unit_name', 'unit_descr',
			'_createby', '_createdate', '_modifyby', '_modifydate', '_timestamp'
		])
		await dbTarget.none(sql, data);
	} catch (err) {
		throw err
	}
}

async function deleteUnit(dbTarget, unit_id) {
	try {
		const sql = `delete from ${tableUnit} where ${pkUnit}=$[${pkUnit}]`
		await dbTarget.none(sql, { unit_id })
	} catch (err) {
		throw err
	}
}