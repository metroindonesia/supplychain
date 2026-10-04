export async function headerCreating(self, tx, data, seqdata, args) {
	data.reg_doc = seqdata.doc;
}