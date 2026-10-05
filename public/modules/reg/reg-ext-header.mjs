import Context from './reg-context.mjs'
import * as pageHelper from '/public/lib/fgta5app/pagehelper.mjs'

const VIEW_VARIANCE = 'view'

const _reg_id = 'regHeaderEdit-obj_reg_id'
const _reg_doc = 'regHeaderEdit-obj_reg_doc'
const _reg_version = 'regHeaderEdit-obj_reg_version'
const _unit_id = 'regHeaderEdit-obj_unit_id'
const _iscommit = 'regHeaderEdit-obj_iscommit'
const _isgenerated = 'regHeaderEdit-obj_isgenerated'

export function init_header(self, args) {

}

export function headerList_initSearchParams(self, SearchParams) {

	// select brand
	SearchParams['brand_id'].addEventListener('selecting', async (evt) => {
		const cbo = evt.detail.sender
		const dialog = evt.detail.dialog
		const url = 'brand/header-list'
		const sort = { brand_name: 'desc' }
		const criteria = {}

		cbo.wait()
		try {
			const result = await Module.apiCall(url, {
				sort,
				criteria,
				offset: evt.detail.offset,
				limit: evt.detail.limit,
			})

			for (var row of result.data) {
				evt.detail.addRow(row.brand_id, row.brand_name, row)
			}

			dialog.setNext(result.nextoffset, result.limit)
		} catch (err) {
			$fgta5.MessageBox.error(err.message)
		} finally {
			cbo.wait(false)
		}

	})

	// select season
	SearchParams['sea_id'].addEventListener('selecting', async (evt) => {
		const cbo = evt.detail.sender
		const dialog = evt.detail.dialog
		const url = 'sea/header-list'
		const sort = { sea_id: 'desc' }
		const criteria = {}

		cbo.wait()
		try {
			const result = await Module.apiCall(url, {
				sort,
				criteria,
				offset: evt.detail.offset,
				limit: evt.detail.limit,
			})

			for (var row of result.data) {
				evt.detail.addRow(row.sea_id, row.sea_name, row)
			}

			dialog.setNext(result.nextoffset, result.limit)
		} catch (err) {
			$fgta5.MessageBox.error(err.message)
		} finally {
			cbo.wait(false)
		}

	})
}

export function setupActionButtonEvent(self, frm, CurrentState, buttons) {
	const onView = Context.variance == VIEW_VARIANCE
	CurrentState.Actions.newdata.suspend(onView)
	CurrentState.Actions.edit.suspend(onView)


	CurrentState.Actions.commit.addEventListener('click', (evt) => { btn_actionCommit_click(self, frm, CurrentState, evt) })
	CurrentState.Actions.uncommit.addEventListener('click', (evt) => { btn_actionUncommit_click(self, frm, CurrentState, evt) })
	CurrentState.Actions.generate.addEventListener('click', (evt) => { btn_actionGenerate_click(self, frm, CurrentState, evt) })

}





export async function obj_brand_id_selected(self, obj_brand_id, frm, evt) {
	// console.log(evt.detail.data)
	const { unit_id, unit_name } = evt.detail.data

	frm.Inputs[_unit_id].setSelected(unit_id, unit_name)
}

export async function obj_regtype_id_selected(self, obj_regtype_id, frm, evt) {
	console.log(evt.detail.data)
}


async function btn_actionCommit_click(self, frm, CurrentState, evt) {
	const reg_id = frm.Inputs[_reg_id].value
	const reg_doc = frm.Inputs[_reg_doc].value

	// konfirmasi kommit
	const ret = await $fgta5.MessageBox.confirm(`anda mau <b>Commit</b> register '${reg_doc}'.<br>Lanjutkan?`)
	if (ret !== 'ok') {
		return;
	}


	const obj_iscommit = frm.Inputs[_iscommit]
	try {
		const url = 'reg/execute'
		const result = await Module.apiCall(url, {
			fnName: 'commit',
			reg_id: reg_id
		})

		if (result.iscommit == false) {
			throw new Error('<b>Gagal</b> saat proses commit')
		}

		// check unchanged status
		if (result.unchanged) {
			console.warn('already commited. Data unchanged')
			return
		}

		// check commit status
		obj_iscommit.value = result._iscommit
		frm.acceptChanges()

		self.Modules.regHeaderList.updateCurrentRow(self, { iscommit: result.iscommit })

		CurrentState.Actions.edit.suspend(true)
		CurrentState.Actions.commit.suspend(true)
		CurrentState.Actions.uncommit.suspend(false)
		CurrentState.Actions.generate.suspend(false)

		$fgta5.MessageBox.info(`register '${reg_doc}' berhasil di commit`)
	} catch (err) {
		$fgta5.MessageBox.error(err.message)
		throw err
	}
}

async function btn_actionUncommit_click(self, frm, CurrentState, evt) {
	const reg_id = frm.Inputs[_reg_id].value
	const reg_doc = frm.Inputs[_reg_doc].value

	// konfirmasi kommit
	const ret = await $fgta5.MessageBox.confirm(`anda mau <span style="font-weight:bold; color:red">un-Commit</span> register '${reg_doc}'.<br>Lanjutkan?`)
	if (ret !== 'ok') {
		return;
	}


	const obj_reg_version = frm.Inputs[_reg_version]
	const obj_iscommit = frm.Inputs[_iscommit]
	try {
		const url = 'reg/execute'
		const result = await Module.apiCall(url, {
			fnName: 'uncommit',
			reg_id: reg_id
		})

		if (result.iscommit == true) {
			throw new Error('<b>Gagal</b> saat proses un-commit')
		}

		// check unchanged status
		if (result.unchanged) {
			console.warn('still draft. Data unchanged')
			return
		}

		// uncheck commit status
		obj_iscommit.value = result._iscommit

		// update version
		obj_reg_version.value = result.version


		frm.acceptChanges()
		self.Modules.regHeaderList.updateCurrentRow(self, { iscommit: result.iscommit })


		CurrentState.Actions.edit.suspend(false)
		CurrentState.Actions.commit.suspend(false)
		CurrentState.Actions.uncommit.suspend(true)
		CurrentState.Actions.generate.suspend(true)

		$fgta5.MessageBox.info(`request '${reg_doc}' berhasil di un-commit`)
	} catch (err) {
		$fgta5.MessageBox.error(err.message)
		throw err
	}
}

async function btn_actionGenerate_click(self, frm, CurrentState, evt) {
	const reg_id = frm.Inputs[_reg_id].value
	const reg_doc = frm.Inputs[_reg_doc].value

	// konfirmasi kommit
	const ret = await $fgta5.MessageBox.confirm(`anda mau <b>Generate</b> register '${reg_doc}'.<br>Lanjutkan?`)
	if (ret !== 'ok') {
		return;
	}


	const obj_isgenerated = frm.Inputs[_isgenerated]
	try {
		const url = 'reg/execute'
		const result = await Module.apiCall(url, {
			fnName: 'generate',
			reg_id: reg_id
		})

		if (result.isgenerated == false) {
			throw new Error('<b>Gagal</b> saat proses generate')
		}

		// check unchanged status
		if (result.unchanged) {
			console.warn('already commited. Data unchanged')
			return
		}

		// check commit status
		obj_isgenerated.value = result.isgenerated
		frm.acceptChanges()

		self.Modules.regHeaderList.updateCurrentRow(self, { isgenerated: result.isgenerated })

		CurrentState.Actions.edit.suspend(true)
		CurrentState.Actions.commit.suspend(true)
		CurrentState.Actions.uncommit.suspend(false)
		CurrentState.Actions.generate.suspend(false)

		$fgta5.MessageBox.info(`register '${reg_doc}' berhasil di generate`)
	} catch (err) {
		$fgta5.MessageBox.error(err.message)
		throw err
	}
}
