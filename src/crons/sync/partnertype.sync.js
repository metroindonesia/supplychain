import QueryStream from 'pg-query-stream';
import * as syncHelper from '@agung_dhewe/webapps/src/sync-helper.js'

const { resetTimestamp, prepareData, syncChangedData, clearBatch, createSqlUpsert } = syncHelper

const tablePartnertype = 'public.partnertype'
const tableSyncPartnertype = '"temp".syncpartnertype'
const tableDeletedPartnertype = '"log".deletedpartnertype'
const pkPartnertype = 'partnertype_id'

export default async function syncAuth(dbSource, dbTarget, batch_id, options = {}) {
	try {
		const syncAllData = typeof options === 'boolean' ? options : Boolean(options?.all)
		if (syncAllData) {
			await resetTimestamp(dbSource, dbTarget, tablePartnertype)
		}

		await prepareData(dbSource, dbTarget, batch_id, tablePartnertype, tableSyncPartnertype, tableDeletedPartnertype, pkPartnertype)
		await syncChangedData(dbSource, dbTarget, batch_id, tablePartnertype, tableSyncPartnertype, tableDeletedPartnertype, pkPartnertype, processBatch)
		await clearBatch(dbSource, batch_id, tablePartnertype, tableSyncPartnertype, tableDeletedPartnertype, pkPartnertype)

	} catch (err) {
		throw err
	}
}


async function processBatch(dbSource, dbTarget, batch) {
	console.log(`${tablePartnertype}: syncing ${batch.length} data`)

	try {
		for (let row of batch) {
			const { partnertype_id, _isdelete } = row

			if (_isdelete) {
				await deletePartnertype(dbTarget, partnertype_id)
			} else {
				await copyPartnertype(dbTarget, row)
			}
		}
	} catch (err) {
		throw err
	}
}

async function copyPartnertype(dbTarget, data) {
	try {
		const sql = createSqlUpsert(tablePartnertype, [pkPartnertype], [
			'partnertype_id', 'partnertype_name', 'partnertype_isemployee',
			'_createby', '_createdate', '_modifyby', '_modifydate', '_timestamp'
		])

		await dbTarget.none(sql, data);

	} catch (err) {
		throw err
	}
}

async function deletePartnertype(dbTarget, partnertype_id) {
	try {
		const sql = `delete from ${tablePartnertype} where ${pkPartnertype}=$[${pkPartnertype}]`
		await dbTarget.none(sql, { partnertype_id })
	} catch (err) {
		throw err
	}
}