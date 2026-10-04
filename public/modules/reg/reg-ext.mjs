import Context from './reg-context.mjs'
import * as ExtHeader from './reg-ext-header.mjs'
import * as ExtItem from './reg-ext-item.mjs'


export const extenderHeader = ExtHeader
export const extenderItem = ExtItem



export async function init(self, args) {
	console.log('initializing regExtender ...')
	ExtHeader.init_header(self, args)
	ExtItem.init_item(self, args)


}

