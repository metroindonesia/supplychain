import Context from './brand-context.mjs'


export const extenderHeader = null



const VIEW_VARIANCE = 'view'

export async function init(self, args) {
	console.log('initializing brandExtender ...')

	// tambahkan extender inisiasi module brand

}


export function headerList_initSearchParams(self, SearchParams) {

	// Structure
	SearchParams['unit_id'].addEventListener('selecting', async (evt) => {
		const cbo = evt.detail.sender
		const dialog = evt.detail.dialog
		const url = 'unit/header-list'
		const sort = { unit_name: 'desc' }
		const criteria = {}

		cbo.wait()
		try {
			// cek apakah user punya role PAYMREQ
			const result = await Module.apiCall(url, {
				sort,
				criteria,
				offset: evt.detail.offset,
				limit: evt.detail.limit,
			})

			for (var row of result.data) {
				evt.detail.addRow(row.unit_id, row.unit_name, row)
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
}