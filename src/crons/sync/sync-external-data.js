import dotenv from 'dotenv';
import uniqid from '@agung_dhewe/webapps/src/uniqid.js'
import dbTarget from '@agung_dhewe/webapps/src/db.js'
import dbSource from './dbAccounting.js'


import syncUser from './user.sync.js'
import syncAuth from './auth.sync.js'
import syncStructhrk from './structhrk.sync.js'
import syncPartnertype from './partnertype.sync.js'

import syncPartner from './partner.sync.js'
import syncSite from './site.sync.js'
import syncStruct from './struct.sync.js'
import syncUnit from './unit.sync.js'
import syncCurr from './curr.sync.js'
import syncCurrrate from './currrate.sync.js'
import syncItemclass from './itemclass.sync.js'


const args = process.argv.slice(2)
const isAll = args.includes('--all')

try {
	const batch_id = uniqid()   // 6aa58c3d63f97
	// console.log(batch_id)

	// sync data mandatory
	await syncUser(dbSource, dbTarget, batch_id, { all: isAll })
	await syncAuth(dbSource, dbTarget, batch_id, { all: isAll })
	await syncStructhrk(dbSource, dbTarget, batch_id, { all: isAll })
	await syncPartnertype(dbSource, dbTarget, batch_id, { all: isAll })

	await syncPartner(dbSource, dbTarget, batch_id, { all: isAll })
	await syncSite(dbSource, dbTarget, batch_id, { all: isAll })
	await syncStruct(dbSource, dbTarget, batch_id, { all: isAll })
	await syncUnit(dbSource, dbTarget, batch_id, { all: isAll })
	await syncCurr(dbSource, dbTarget, batch_id, { all: isAll })
	await syncCurrrate(dbSource, dbTarget, batch_id, { all: isAll })
	await syncItemclass(dbSource, dbTarget, batch_id, { all: isAll })


	console.log('\n')
	console.log('Progress Stop')
} catch (err) {
	console.log(err.message)
} finally {
	// await dbSource?.$pool?.end()
	// await dbTarget?.$pool?.end()
}