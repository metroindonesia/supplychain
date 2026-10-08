import QueryStream from 'pg-query-stream';
import * as syncHelper from '@agung_dhewe/webapps/src/sync-helper.js'

const { resetTimestamp, prepareData, syncChangedData, clearBatch, createSqlUpsert } = syncHelper

const tablePeriode = 'public.periode'
const tableSyncPeriode = '"temp".syncperiode'
const tableDeletedPeriode = '"log".deletedperiode'
const pkPeriode = 'periode_id'

export default async function syncAuth(dbSource, dbTarget, batch_id, options = {}) {
	try {
		const syncAllData = typeof options === 'boolean' ? options : Boolean(options?.all)
		if (syncAllData) {
			await resetTimestamp(dbSource, dbTarget, tablePeriode)
		}

		await prepareData(dbSource, dbTarget, batch_id, tablePeriode, tableSyncPeriode, tableDeletedPeriode, pkPeriode)
		await syncChangedData(dbSource, dbTarget, batch_id, tablePeriode, tableSyncPeriode, tableDeletedPeriode, pkPeriode, processBatch)
		await clearBatch(dbSource, batch_id, tablePeriode, tableSyncPeriode, tableDeletedPeriode, pkPeriode)

	} catch (err) {
		throw err
	}
}


async function processBatch(dbSource, dbTarget, batch) {
	console.log(`${tablePeriode}: syncing ${batch.length} data`)

	try {
		for (let row of batch) {
			const { periode_id, _isdelete } = row

			if (_isdelete) {
				await deletePeriode(dbTarget, periode_id)
			} else {
				await copyPeriode(dbTarget, row)
			}
		}
	} catch (err) {
		throw err
	}
}

async function copyPeriode(dbTarget, data) {
	try {
		const sql = createSqlUpsert(tablePeriode, [pkPeriode], [
			'periode_id', 'periode_isclosed', 'periode_isactive', 'periode_name',
			'periode_year', 'periode_month', 'periode_start', 'periode_end', 'previous_periode_id',
			'periode_closeby', 'periode_closedate',
			'_createby', '_createdate', '_modifyby', '_modifydate', '_timestamp'
		])
		await dbTarget.none(sql, data);
	} catch (err) {
		throw err
	}
}

async function deletePeriode(dbTarget, periode_id) {
	try {
		const sql = `delete from ${tablePeriode} where ${pkPeriode}=$[${pkPeriode}]`
		await dbTarget.none(sql, { periode_id })
	} catch (err) {
		throw err
	}
}