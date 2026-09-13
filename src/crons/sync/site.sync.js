import QueryStream from 'pg-query-stream';
import * as syncHelper from '@agung_dhewe/webapps/src/sync-helper.js'

const { resetTimestamp, prepareData, syncChangedData, clearBatch, createSqlUpsert } = syncHelper

const tableSite = 'public.site'
const tableSyncSite = '"temp".syncsite'
const tableDeletedSite = '"log".deletedsite'
const pkSite = 'site_id'

export default async function syncAuth(dbSource, dbTarget, batch_id, options = {}) {
	try {
		const syncAllData = typeof options === 'boolean' ? options : Boolean(options?.all)
		if (syncAllData) {
			await resetTimestamp(dbSource, dbTarget, tableSite)
		}

		await prepareData(dbSource, dbTarget, batch_id, tableSite, tableSyncSite, tableDeletedSite, pkSite)
		await syncChangedData(dbSource, dbTarget, batch_id, tableSite, tableSyncSite, tableDeletedSite, pkSite, processBatch)
		await clearBatch(dbSource, batch_id, tableSite, tableSyncSite, tableDeletedSite, pkSite)

	} catch (err) {
		throw err
	}
}


async function processBatch(dbSource, dbTarget, batch) {
	console.log(`${tableSite}: syncing ${batch.length} data`)

	try {
		for (let row of batch) {
			const { site_id, _isdelete } = row

			if (_isdelete) {
				await deleteSite(dbTarget, site_id)
			} else {
				await copySite(dbTarget, row)
			}
		}
	} catch (err) {
		throw err
	}
}

async function copySite(dbTarget, data) {
	try {
		const sql = createSqlUpsert(tableSite, [pkSite], [
			'site_id', 'site_isdisabled', 'site_name', 'site_namereport',
			'site_location', 'site_city', 'site_code',
			'_createby', '_createdate', '_modifyby', '_modifydate', '_timestamp'
		])
		await dbTarget.none(sql, data);

	} catch (err) {
		throw err
	}
}

async function deleteSite(dbTarget, site_id) {
	try {
		const sql = `delete from ${tableSite} where ${pkSite}=$[${pkSite}]`
		await dbTarget.none(sql, { site_id })
	} catch (err) {
		throw err
	}
}