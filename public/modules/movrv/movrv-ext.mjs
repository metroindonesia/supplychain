import Context from './movrv-context.mjs'


export const extenderHeader = null


const _sku_id = 'movrvItemEdit-obj_sku_id'
const _isedtrack = 'movrvItemEdit-obj_isedtrack'
const _isusedecimal = 'movrvItemEdit-obj_isusedecimal'
const _brand_id = 'movrvItemEdit-obj_brand_id'
const _unit_id = 'movrvItemEdit-obj_unit_id'
const _product_code = 'movrvItemEdit-obj_product_code'
const _variance_code = 'movrvItemEdit-obj_variance_code'
const _skuopt_code = 'movrvItemEdit-obj_skuopt_code'
const _sku_name = 'movrvItemEdit-obj_sku_name'
const _movitem_qtyrecv = 'movrvItemEdit-obj_movitem_qtyrecv'
const _uom_id = 'movrvItemEdit-obj_uom_id'

const _expdate = 'movrvItemEdit-obj_expdate'


const VIEW_VARIANCE = 'view'

export async function init(self, args) {
	console.log('initializing movrvExtender ...')




}


export function setupActionButtonEvent(self, frm, CurrentState, buttons) {
	const onView = Context.variance == VIEW_VARIANCE
	CurrentState.Actions.newdata.suspend(onView)
	CurrentState.Actions.edit.suspend(onView)
}


export async function obj_poitem_id_selected(self, obj_poitem_id, frm, evt) {
	const data = evt.detail.data

	console.log(data)

	frm.Inputs[_isedtrack].value = data.isedtrack
	frm.Inputs[_isusedecimal].value = data.isusedecimal
	frm.Inputs[_brand_id].setSelected(data.brand_id, data.brand_name)
	frm.Inputs[_unit_id].setSelected(data.unit_id, data.unit_name)
	frm.Inputs[_product_code].value = data.product_code
	frm.Inputs[_variance_code].value = data.variance_code
	frm.Inputs[_skuopt_code].value = data.skuopt_code
	frm.Inputs[_sku_name].value = data.sku_name
	frm.Inputs[_movitem_qtyrecv].value = data.poitem_qty
	frm.Inputs[_uom_id].setSelected(data.uom_id, data.uom_name)


	isedtrack_changed(self, frm.Inputs[_isedtrack], frm, data.isedtrack)
}


export function movrvItemEdit_formOpened(self, frm, CurrentState) {
	const obj_isedtrack = frm.Inputs[_isedtrack]
	const isedtrack = obj_isedtrack.value
	isedtrack_changed(self, obj_isedtrack, frm, isedtrack)
}

export async function obj_isedtrack_changed(self, obj_isedtrack, frm, evt) {
	console.log(evt)

	// isedtrack_changed(self, obj_isedtrack, )
}


function isedtrack_changed(self, obj, frm, checked) {
	const expdatec = document.getElementById(_expdate + '-container')
	if (checked) {
		console.log('show exp date')
		expdatec.classList.remove('hidden')
	} else {
		console.log('hide exp date')
		expdatec.classList.add('hidden')
	}
}

