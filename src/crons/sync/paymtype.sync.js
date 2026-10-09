import QueryStream from 'pg-query-stream';
import * as syncHelper from '@agung_dhewe/webapps/src/sync-helper.js'

const { resetTimestamp, prepareData, syncChangedData, clearBatch, createSqlUpsert } = syncHelper

const tablePaymtype = 'public.Paymtype'
const tableSyncPaymtype = '"temp".syncpaymtype'
const tableDeletedPaymtype = '"log".deletedpaymtype'
const pkPaymtype = 'paymtype_id'

export default async function syncAuth(dbSource, dbTarget, batch_id, options = {}) {
	try {
		const syncAllData = typeof options === 'boolean' ? options : Boolean(options?.all)
		if (syncAllData) {
			await resetTimestamp(dbSource, dbTarget, tablePaymtype)
		}

		await prepareData(dbSource, dbTarget, batch_id, tablePaymtype, tableSyncPaymtype, tableDeletedPaymtype, pkPaymtype)
		await syncChangedData(dbSource, dbTarget, batch_id, tablePaymtype, tableSyncPaymtype, tableDeletedPaymtype, pkPaymtype, processBatch)
		await clearBatch(dbSource, batch_id, tablePaymtype, tableSyncPaymtype, tableDeletedPaymtype, pkPaymtype)

	} catch (err) {
		throw err
	}
}


async function processBatch(dbSource, dbTarget, batch) {
	console.log(`${tablePaymtype}: syncing ${batch.length} data`)

	try {
		for (let row of batch) {
			const { paymtype_id, _isdelete } = row

			if (_isdelete) {
				await deletePaymtype(dbTarget, paymtype_id)
			} else {
				await copyPaymtype(dbTarget, row)
			}
		}
	} catch (err) {
		throw err
	}
}

async function copyPaymtype(dbTarget, data) {
	try {
		const sql = createSqlUpsert(tablePaymtype, [pkPaymtype], [
			'paymtype_id', 'paymtype_name', 'ishaspartnercontact', 'ishaspartnerbankselector',
			'ishasbankaccount', 'ishasbankaccountname', 'ishasbankname', 'ishasgiro',
			'_createby', '_createdate', '_modifyby', '_modifydate', '_timestamp'
		])
		await dbTarget.none(sql, data);
	} catch (err) {
		throw err
	}
}

async function deletePaymtype(dbTarget, paymtype_id) {
	try {
		const sql = `delete from ${tablePaymtype} where ${pkPaymtype}=$[${pkPaymtype}]`
		await dbTarget.none(sql, { paymtype_id })
	} catch (err) {
		throw err
	}
}