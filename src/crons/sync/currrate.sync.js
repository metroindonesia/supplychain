import QueryStream from 'pg-query-stream';
import * as syncHelper from '@agung_dhewe/webapps/src/sync-helper.js'

const { resetTimestamp, prepareData, syncChangedData, clearBatch, createSqlUpsert } = syncHelper

const tableCurrrate = 'public.currrate'
const tableSyncCurrrate = '"temp".synccurrrate'
const tableDeletedCurrrate = '"log".deletedcurrrate'
const pkCurrrate = 'currrate_id'

export default async function syncAuth(dbSource, dbTarget, batch_id, options = {}) {
	try {
		const syncAllData = typeof options === 'boolean' ? options : Boolean(options?.all)
		if (syncAllData) {
			await resetTimestamp(dbSource, dbTarget, tableCurrrate)
		}

		await prepareData(dbSource, dbTarget, batch_id, tableCurrrate, tableSyncCurrrate, tableDeletedCurrrate, pkCurrrate)
		await syncChangedData(dbSource, dbTarget, batch_id, tableCurrrate, tableSyncCurrrate, tableDeletedCurrrate, pkCurrrate, processBatch)
		await clearBatch(dbSource, batch_id, tableCurrrate, tableSyncCurrrate, tableDeletedCurrrate, pkCurrrate)

	} catch (err) {
		throw err
	}
}


async function processBatch(dbSource, dbTarget, batch) {
	console.log(`${tableCurrrate}: syncing ${batch.length} data`)

	try {
		for (let row of batch) {
			const { currrate_id, _isdelete } = row

			if (_isdelete) {
				await deleteCurrrate(dbTarget, currrate_id)
			} else {
				await copyCurrrate(dbTarget, row)
			}
		}
	} catch (err) {
		throw err
	}
}

async function copyCurrrate(dbTarget, data) {
	try {
		const sql = createSqlUpsert(tableCurrrate, [pkCurrrate], [
			'currrate_id', 'currrate_date', 'currrate_value', 'curr_id',
			'_createby', '_createdate', '_modifyby', '_modifydate', '_timestamp'
		])
		await dbTarget.none(sql, data);
	} catch (err) {
		throw err
	}
}

async function deleteCurrrate(dbTarget, currrate_id) {
	try {
		const sql = `delete from ${tableCurrrate} where ${pkCurrrate}=$[${pkCurrrate}]`
		await dbTarget.none(sql, { currrate_id })
	} catch (err) {
		throw err
	}
}