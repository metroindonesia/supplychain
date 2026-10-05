export async function headerCreating(self, tx, data, seqdata, args) {
	data.reg_doc = seqdata.doc;
}

export async function commit(self, db, body, reg_log) {
	return {
		_iscommit: true,
		_commitby: 0,
		_commitdate: '',
		message: ''
	}
}

export async function uncommit(self, db, body, reg_log) {
	return {
		_iscommit: false,
		version: 1,
		message: ''
	}
}


export async function generate(self, db, body, reg_log) {
	return {
		_isgenerated: true,
		_commitby: 0,
		_commitdate: '',
		message: ''
	}
}