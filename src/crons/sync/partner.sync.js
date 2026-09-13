import QueryStream from 'pg-query-stream';
import * as syncHelper from '@agung_dhewe/webapps/src/sync-helper.js'

const { resetTimestamp, prepareData, syncChangedData, clearBatch, createSqlUpsert } = syncHelper

const tablePartner = 'public.partner'
const tableSyncPartner = '"temp".syncpartner'
const tableDeletedPartner = '"log".deletedpartner'
const pkPartner = 'partner_id'

export default async function syncAuth(dbSource, dbTarget, batch_id, options = {}) {
	try {
		const syncAllData = typeof options === 'boolean' ? options : Boolean(options?.all)
		if (syncAllData) {
			await resetTimestamp(dbSource, dbTarget, tablePartner)
		}

		await prepareData(dbSource, dbTarget, batch_id, tablePartner, tableSyncPartner, tableDeletedPartner, pkPartner)
		await syncChangedData(dbSource, dbTarget, batch_id, tablePartner, tableSyncPartner, tableDeletedPartner, pkPartner, processBatch)
		await clearBatch(dbSource, batch_id, tablePartner, tableSyncPartner, tableDeletedPartner, pkPartner)

	} catch (err) {
		throw err
	}
}


async function processBatch(dbSource, dbTarget, batch) {
	console.log(`${tablePartner}: syncing ${batch.length} data`)

	try {
		for (let row of batch) {
			const { partner_id, _isdelete } = row

			if (_isdelete) {
				await deletePartner(dbTarget, partner_id)
			} else {
				await copyPartner(dbTarget, row)
			}
		}
	} catch (err) {
		throw err
	}
}


async function copyPartner(dbTarget, data) {
	try {
		const sql = createSqlUpsert(tablePartner, [pkPartner], [
			'partner_id', 'partner_isdisabled', 'partner_isemployee', 'partner_name',
			'partner_legaltitle', 'partnertype_id', 'employee_nip', 'partner_address',
			'partner_city', 'partner_email', 'partner_npwp', 'partner_isnonpkp',
			'_createby', '_createdate', '_modifyby', '_modifydate', '_timestamp'
		])

		await dbTarget.none(sql, data);

	} catch (err) {
		throw err
	}
}

async function deletePartner(dbTarget, partner_id) {
	try {
		const sql = `delete from ${tablePartner} where ${pkPartner}=$[${pkPartner}]`
		await dbTarget.none(sql, { partner_id })
	} catch (err) {
		throw err
	}
}