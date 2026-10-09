-- bill.sql


/* =============================================
 * CREATE TABLE public."bill"
 * ============================================*/
create table public."bill" (
	bill_id bigint not null,
	constraint bill_pk primary key (bill_id)
);
comment on table public."bill" is '';	


-- =============================================
-- FIELD: bill_doc text
-- =============================================
-- ADD bill_doc
alter table public."bill" add bill_doc text  ;
comment on column public."bill".bill_doc is '';

-- MODIFY bill_doc
alter table public."bill"
	alter column bill_doc type text,
	ALTER COLUMN bill_doc DROP DEFAULT,
	ALTER COLUMN bill_doc DROP NOT NULL;
comment on column public."bill".bill_doc is '';


-- =============================================
-- FIELD: bill_version smallint
-- =============================================
-- ADD bill_version
alter table public."bill" add bill_version smallint  default 0;
comment on column public."bill".bill_version is '';

-- MODIFY bill_version
alter table public."bill"
	alter column bill_version type smallint,
	ALTER COLUMN bill_version SET DEFAULT 0,
	ALTER COLUMN bill_version DROP NOT NULL;
comment on column public."bill".bill_version is '';


-- =============================================
-- FIELD: _iscommit boolean
-- =============================================
-- ADD _iscommit
alter table public."bill" add _iscommit boolean not null default false;
comment on column public."bill"._iscommit is '';

-- MODIFY _iscommit
alter table public."bill"
	alter column _iscommit type boolean,
	ALTER COLUMN _iscommit SET DEFAULT false,
	ALTER COLUMN _iscommit SET NOT NULL;
comment on column public."bill"._iscommit is '';


-- =============================================
-- FIELD: _isposted boolean
-- =============================================
-- ADD _isposted
alter table public."bill" add _isposted boolean not null default false;
comment on column public."bill"._isposted is '';

-- MODIFY _isposted
alter table public."bill"
	alter column _isposted type boolean,
	ALTER COLUMN _isposted SET DEFAULT false,
	ALTER COLUMN _isposted SET NOT NULL;
comment on column public."bill"._isposted is '';


-- =============================================
-- FIELD: billtype_id smallint
-- =============================================
-- ADD billtype_id
alter table public."bill" add billtype_id smallint  ;
comment on column public."bill".billtype_id is '';

-- MODIFY billtype_id
alter table public."bill"
	alter column billtype_id type smallint,
	ALTER COLUMN billtype_id DROP DEFAULT,
	ALTER COLUMN billtype_id DROP NOT NULL;
comment on column public."bill".billtype_id is '';


-- =============================================
-- FIELD: bill_isadvance boolean
-- =============================================
-- ADD bill_isadvance
alter table public."bill" add bill_isadvance boolean not null default false;
comment on column public."bill".bill_isadvance is '';

-- MODIFY bill_isadvance
alter table public."bill"
	alter column bill_isadvance type boolean,
	ALTER COLUMN bill_isadvance SET DEFAULT false,
	ALTER COLUMN bill_isadvance SET NOT NULL;
comment on column public."bill".bill_isadvance is '';


-- =============================================
-- FIELD: bill_invoice text
-- =============================================
-- ADD bill_invoice
alter table public."bill" add bill_invoice text  ;
comment on column public."bill".bill_invoice is '';

-- MODIFY bill_invoice
alter table public."bill"
	alter column bill_invoice type text,
	ALTER COLUMN bill_invoice DROP DEFAULT,
	ALTER COLUMN bill_invoice DROP NOT NULL;
comment on column public."bill".bill_invoice is '';


-- =============================================
-- FIELD: unit_id int
-- =============================================
-- ADD unit_id
alter table public."bill" add unit_id int  ;
comment on column public."bill".unit_id is '';

-- MODIFY unit_id
alter table public."bill"
	alter column unit_id type int,
	ALTER COLUMN unit_id DROP DEFAULT,
	ALTER COLUMN unit_id DROP NOT NULL;
comment on column public."bill".unit_id is '';


-- =============================================
-- FIELD: po_id bigint
-- =============================================
-- ADD po_id
alter table public."bill" add po_id bigint  ;
comment on column public."bill".po_id is '';

-- MODIFY po_id
alter table public."bill"
	alter column po_id type bigint,
	ALTER COLUMN po_id DROP DEFAULT,
	ALTER COLUMN po_id DROP NOT NULL;
comment on column public."bill".po_id is '';


-- =============================================
-- FIELD: bill_date date
-- =============================================
-- ADD bill_date
alter table public."bill" add bill_date date  default now();
comment on column public."bill".bill_date is '';

-- MODIFY bill_date
alter table public."bill"
	alter column bill_date type date,
	ALTER COLUMN bill_date SET DEFAULT now(),
	ALTER COLUMN bill_date DROP NOT NULL;
comment on column public."bill".bill_date is '';


-- =============================================
-- FIELD: bill_datedue date
-- =============================================
-- ADD bill_datedue
alter table public."bill" add bill_datedue date  default now();
comment on column public."bill".bill_datedue is '';

-- MODIFY bill_datedue
alter table public."bill"
	alter column bill_datedue type date,
	ALTER COLUMN bill_datedue SET DEFAULT now(),
	ALTER COLUMN bill_datedue DROP NOT NULL;
comment on column public."bill".bill_datedue is '';


-- =============================================
-- FIELD: bill_descr text
-- =============================================
-- ADD bill_descr
alter table public."bill" add bill_descr text  ;
comment on column public."bill".bill_descr is '';

-- MODIFY bill_descr
alter table public."bill"
	alter column bill_descr type text,
	ALTER COLUMN bill_descr DROP DEFAULT,
	ALTER COLUMN bill_descr DROP NOT NULL;
comment on column public."bill".bill_descr is '';


-- =============================================
-- FIELD: partner_id int
-- =============================================
-- ADD partner_id
alter table public."bill" add partner_id int  ;
comment on column public."bill".partner_id is '';

-- MODIFY partner_id
alter table public."bill"
	alter column partner_id type int,
	ALTER COLUMN partner_id DROP DEFAULT,
	ALTER COLUMN partner_id DROP NOT NULL;
comment on column public."bill".partner_id is '';


-- =============================================
-- FIELD: partnercontact_id bigint
-- =============================================
-- ADD partnercontact_id
alter table public."bill" add partnercontact_id bigint  ;
comment on column public."bill".partnercontact_id is '';

-- MODIFY partnercontact_id
alter table public."bill"
	alter column partnercontact_id type bigint,
	ALTER COLUMN partnercontact_id DROP DEFAULT,
	ALTER COLUMN partnercontact_id DROP NOT NULL;
comment on column public."bill".partnercontact_id is '';


-- =============================================
-- FIELD: paymtype_id smallint
-- =============================================
-- ADD paymtype_id
alter table public."bill" add paymtype_id smallint  ;
comment on column public."bill".paymtype_id is '';

-- MODIFY paymtype_id
alter table public."bill"
	alter column paymtype_id type smallint,
	ALTER COLUMN paymtype_id DROP DEFAULT,
	ALTER COLUMN paymtype_id DROP NOT NULL;
comment on column public."bill".paymtype_id is '';


-- =============================================
-- FIELD: curr_id smallint
-- =============================================
-- ADD curr_id
alter table public."bill" add curr_id smallint  ;
comment on column public."bill".curr_id is '';

-- MODIFY curr_id
alter table public."bill"
	alter column curr_id type smallint,
	ALTER COLUMN curr_id DROP DEFAULT,
	ALTER COLUMN curr_id DROP NOT NULL;
comment on column public."bill".curr_id is '';


-- =============================================
-- FIELD: partnerbank_id bigint
-- =============================================
-- ADD partnerbank_id
alter table public."bill" add partnerbank_id bigint  ;
comment on column public."bill".partnerbank_id is '';

-- MODIFY partnerbank_id
alter table public."bill"
	alter column partnerbank_id type bigint,
	ALTER COLUMN partnerbank_id DROP DEFAULT,
	ALTER COLUMN partnerbank_id DROP NOT NULL;
comment on column public."bill".partnerbank_id is '';


-- =============================================
-- FIELD: partnerbank_account text
-- =============================================
-- ADD partnerbank_account
alter table public."bill" add partnerbank_account text  ;
comment on column public."bill".partnerbank_account is '';

-- MODIFY partnerbank_account
alter table public."bill"
	alter column partnerbank_account type text,
	ALTER COLUMN partnerbank_account DROP DEFAULT,
	ALTER COLUMN partnerbank_account DROP NOT NULL;
comment on column public."bill".partnerbank_account is '';


-- =============================================
-- FIELD: partnerbank_accountname text
-- =============================================
-- ADD partnerbank_accountname
alter table public."bill" add partnerbank_accountname text  ;
comment on column public."bill".partnerbank_accountname is '';

-- MODIFY partnerbank_accountname
alter table public."bill"
	alter column partnerbank_accountname type text,
	ALTER COLUMN partnerbank_accountname DROP DEFAULT,
	ALTER COLUMN partnerbank_accountname DROP NOT NULL;
comment on column public."bill".partnerbank_accountname is '';


-- =============================================
-- FIELD: partnerbank_bankname text
-- =============================================
-- ADD partnerbank_bankname
alter table public."bill" add partnerbank_bankname text  ;
comment on column public."bill".partnerbank_bankname is '';

-- MODIFY partnerbank_bankname
alter table public."bill"
	alter column partnerbank_bankname type text,
	ALTER COLUMN partnerbank_bankname DROP DEFAULT,
	ALTER COLUMN partnerbank_bankname DROP NOT NULL;
comment on column public."bill".partnerbank_bankname is '';


-- =============================================
-- FIELD: ppn_id smallint
-- =============================================
-- ADD ppn_id
alter table public."bill" add ppn_id smallint  ;
comment on column public."bill".ppn_id is '';

-- MODIFY ppn_id
alter table public."bill"
	alter column ppn_id type smallint,
	ALTER COLUMN ppn_id DROP DEFAULT,
	ALTER COLUMN ppn_id DROP NOT NULL;
comment on column public."bill".ppn_id is '';


-- =============================================
-- FIELD: pph_id smallint
-- =============================================
-- ADD pph_id
alter table public."bill" add pph_id smallint  ;
comment on column public."bill".pph_id is '';

-- MODIFY pph_id
alter table public."bill"
	alter column pph_id type smallint,
	ALTER COLUMN pph_id DROP DEFAULT,
	ALTER COLUMN pph_id DROP NOT NULL;
comment on column public."bill".pph_id is '';


-- =============================================
-- FIELD: bill_subtotal decimal(18, 2)
-- =============================================
-- ADD bill_subtotal
alter table public."bill" add bill_subtotal decimal(18, 2) not null default 0;
comment on column public."bill".bill_subtotal is '';

-- MODIFY bill_subtotal
alter table public."bill"
	alter column bill_subtotal type decimal(18, 2),
	ALTER COLUMN bill_subtotal SET DEFAULT 0,
	ALTER COLUMN bill_subtotal SET NOT NULL;
comment on column public."bill".bill_subtotal is '';


-- =============================================
-- FIELD: bill_ppn decimal(18, 2)
-- =============================================
-- ADD bill_ppn
alter table public."bill" add bill_ppn decimal(18, 2) not null default 0;
comment on column public."bill".bill_ppn is '';

-- MODIFY bill_ppn
alter table public."bill"
	alter column bill_ppn type decimal(18, 2),
	ALTER COLUMN bill_ppn SET DEFAULT 0,
	ALTER COLUMN bill_ppn SET NOT NULL;
comment on column public."bill".bill_ppn is '';


-- =============================================
-- FIELD: bill_pph decimal(18, 2)
-- =============================================
-- ADD bill_pph
alter table public."bill" add bill_pph decimal(18, 2) not null default 0;
comment on column public."bill".bill_pph is '';

-- MODIFY bill_pph
alter table public."bill"
	alter column bill_pph type decimal(18, 2),
	ALTER COLUMN bill_pph SET DEFAULT 0,
	ALTER COLUMN bill_pph SET NOT NULL;
comment on column public."bill".bill_pph is '';


-- =============================================
-- FIELD: bill_amount int
-- =============================================
-- ADD bill_amount
alter table public."bill" add bill_amount int not null default 0;
comment on column public."bill".bill_amount is '';

-- MODIFY bill_amount
alter table public."bill"
	alter column bill_amount type int,
	ALTER COLUMN bill_amount SET DEFAULT 0,
	ALTER COLUMN bill_amount SET NOT NULL;
comment on column public."bill".bill_amount is '';


-- =============================================
-- FIELD: bill_total int
-- =============================================
-- ADD bill_total
alter table public."bill" add bill_total int not null default 0;
comment on column public."bill".bill_total is '';

-- MODIFY bill_total
alter table public."bill"
	alter column bill_total type int,
	ALTER COLUMN bill_total SET DEFAULT 0,
	ALTER COLUMN bill_total SET NOT NULL;
comment on column public."bill".bill_total is '';


-- =============================================
-- FIELD: _commitby int
-- =============================================
-- ADD _commitby
alter table public."bill" add _commitby int  ;
comment on column public."bill"._commitby is '';

-- MODIFY _commitby
alter table public."bill"
	alter column _commitby type int,
	ALTER COLUMN _commitby DROP DEFAULT,
	ALTER COLUMN _commitby DROP NOT NULL;
comment on column public."bill"._commitby is '';


-- =============================================
-- FIELD: _commitdate timestamp with time zone
-- =============================================
-- ADD _commitdate
alter table public."bill" add _commitdate timestamp with time zone  ;
comment on column public."bill"._commitdate is '';

-- MODIFY _commitdate
alter table public."bill"
	alter column _commitdate type timestamp with time zone,
	ALTER COLUMN _commitdate DROP DEFAULT,
	ALTER COLUMN _commitdate DROP NOT NULL;
comment on column public."bill"._commitdate is '';


-- =============================================
-- FIELD: _postby int
-- =============================================
-- ADD _postby
alter table public."bill" add _postby int  ;
comment on column public."bill"._postby is '';

-- MODIFY _postby
alter table public."bill"
	alter column _postby type int,
	ALTER COLUMN _postby DROP DEFAULT,
	ALTER COLUMN _postby DROP NOT NULL;
comment on column public."bill"._postby is '';


-- =============================================
-- FIELD: _postdate timestamp with time zone
-- =============================================
-- ADD _postdate
alter table public."bill" add _postdate timestamp with time zone  ;
comment on column public."bill"._postdate is '';

-- MODIFY _postdate
alter table public."bill"
	alter column _postdate type timestamp with time zone,
	ALTER COLUMN _postdate DROP DEFAULT,
	ALTER COLUMN _postdate DROP NOT NULL;
comment on column public."bill"._postdate is '';


-- =============================================
-- FIELD: _createby integer
-- =============================================
-- ADD _createby
alter table public."bill" add _createby integer not null ;
comment on column public."bill"._createby is 'user yang pertama kali membuat record ini';

-- MODIFY _createby
alter table public."bill"
	alter column _createby type integer,
	ALTER COLUMN _createby DROP DEFAULT,
	ALTER COLUMN _createby SET NOT NULL;
comment on column public."bill"._createby is 'user yang pertama kali membuat record ini';


-- =============================================
-- FIELD: _createdate timestamp with time zone
-- =============================================
-- ADD _createdate
alter table public."bill" add _createdate timestamp with time zone not null default now();
comment on column public."bill"._createdate is 'waktu record dibuat pertama kali';

-- MODIFY _createdate
alter table public."bill"
	alter column _createdate type timestamp with time zone,
	ALTER COLUMN _createdate SET DEFAULT now(),
	ALTER COLUMN _createdate SET NOT NULL;
comment on column public."bill"._createdate is 'waktu record dibuat pertama kali';


-- =============================================
-- FIELD: _modifyby integer
-- =============================================
-- ADD _modifyby
alter table public."bill" add _modifyby integer  ;
comment on column public."bill"._modifyby is 'user yang terakhir modifikasi record ini';

-- MODIFY _modifyby
alter table public."bill"
	alter column _modifyby type integer,
	ALTER COLUMN _modifyby DROP DEFAULT,
	ALTER COLUMN _modifyby DROP NOT NULL;
comment on column public."bill"._modifyby is 'user yang terakhir modifikasi record ini';


-- =============================================
-- FIELD: _modifydate timestamp with time zone
-- =============================================
-- ADD _modifydate
alter table public."bill" add _modifydate timestamp with time zone  ;
comment on column public."bill"._modifydate is 'waktu terakhir record dimodifikasi';

-- MODIFY _modifydate
alter table public."bill"
	alter column _modifydate type timestamp with time zone,
	ALTER COLUMN _modifydate DROP DEFAULT,
	ALTER COLUMN _modifydate DROP NOT NULL;
comment on column public."bill"._modifydate is 'waktu terakhir record dimodifikasi';


-- =============================================
-- FIELD: _timestamp timestamp with time zone
-- =============================================
-- ADD _timestamp
alter table public."bill" add _timestamp timestamp with time zone not null default now();
comment on column public."bill"._timestamp is 'data timestamp';

-- MODIFY _timestamp
alter table public."bill"
	alter column _timestamp type timestamp with time zone,
	ALTER COLUMN _timestamp SET DEFAULT now(),
	ALTER COLUMN _timestamp SET NOT NULL;
comment on column public."bill"._timestamp is 'data timestamp';


-- =============================================
-- INDEX
-- =============================================
DROP INDEX IF EXISTS public.idx$public$bill$_timestamp;
CREATE INDEX idx$public$bill$_timestamp ON public.bill (_timestamp);


-- =============================================
-- FOREIGN KEY CONSTRAINT
-- =============================================
-- Drop Existing Foreign Key Constraint 
ALTER TABLE public."bill" DROP CONSTRAINT fk$public$bill$billtype_id;
ALTER TABLE public."bill" DROP CONSTRAINT fk$public$bill$unit_id;
ALTER TABLE public."bill" DROP CONSTRAINT fk$public$bill$po_id;
ALTER TABLE public."bill" DROP CONSTRAINT fk$public$bill$partner_id;
ALTER TABLE public."bill" DROP CONSTRAINT fk$public$bill$partnercontact_id;
ALTER TABLE public."bill" DROP CONSTRAINT fk$public$bill$paymtype_id;
ALTER TABLE public."bill" DROP CONSTRAINT fk$public$bill$curr_id;
ALTER TABLE public."bill" DROP CONSTRAINT fk$public$bill$partnerbank_id;
ALTER TABLE public."bill" DROP CONSTRAINT fk$public$bill$ppn_id;
ALTER TABLE public."bill" DROP CONSTRAINT fk$public$bill$pph_id;


-- Add Foreign Key Constraint  
ALTER TABLE public."bill"
	ADD CONSTRAINT fk$public$bill$billtype_id
	FOREIGN KEY (billtype_id)
	REFERENCES public."billtype"(billtype_id);


-- Add As Index, drop dulu jika sudah ada
DROP INDEX IF EXISTS public.idx_fk$public$bill$billtype_id;
CREATE INDEX idx_fk$public$bill$billtype_id ON public."bill"(billtype_id);	


ALTER TABLE public."bill"
	ADD CONSTRAINT fk$public$bill$unit_id
	FOREIGN KEY (unit_id)
	REFERENCES public."unit"(unit_id);


-- Add As Index, drop dulu jika sudah ada
DROP INDEX IF EXISTS public.idx_fk$public$bill$unit_id;
CREATE INDEX idx_fk$public$bill$unit_id ON public."bill"(unit_id);	


ALTER TABLE public."bill"
	ADD CONSTRAINT fk$public$bill$po_id
	FOREIGN KEY (po_id)
	REFERENCES public."po"(po_id);


-- Add As Index, drop dulu jika sudah ada
DROP INDEX IF EXISTS public.idx_fk$public$bill$po_id;
CREATE INDEX idx_fk$public$bill$po_id ON public."bill"(po_id);	


ALTER TABLE public."bill"
	ADD CONSTRAINT fk$public$bill$partner_id
	FOREIGN KEY (partner_id)
	REFERENCES public."partner"(partner_id);


-- Add As Index, drop dulu jika sudah ada
DROP INDEX IF EXISTS public.idx_fk$public$bill$partner_id;
CREATE INDEX idx_fk$public$bill$partner_id ON public."bill"(partner_id);	


ALTER TABLE public."bill"
	ADD CONSTRAINT fk$public$bill$partnercontact_id
	FOREIGN KEY (partnercontact_id)
	REFERENCES public."partnercontact"(partnercontact_id);


-- Add As Index, drop dulu jika sudah ada
DROP INDEX IF EXISTS public.idx_fk$public$bill$partnercontact_id;
CREATE INDEX idx_fk$public$bill$partnercontact_id ON public."bill"(partnercontact_id);	


ALTER TABLE public."bill"
	ADD CONSTRAINT fk$public$bill$paymtype_id
	FOREIGN KEY (paymtype_id)
	REFERENCES public."paymtype"(paymtype_id);


-- Add As Index, drop dulu jika sudah ada
DROP INDEX IF EXISTS public.idx_fk$public$bill$paymtype_id;
CREATE INDEX idx_fk$public$bill$paymtype_id ON public."bill"(paymtype_id);	


ALTER TABLE public."bill"
	ADD CONSTRAINT fk$public$bill$curr_id
	FOREIGN KEY (curr_id)
	REFERENCES public."curr"(curr_id);


-- Add As Index, drop dulu jika sudah ada
DROP INDEX IF EXISTS public.idx_fk$public$bill$curr_id;
CREATE INDEX idx_fk$public$bill$curr_id ON public."bill"(curr_id);	


ALTER TABLE public."bill"
	ADD CONSTRAINT fk$public$bill$partnerbank_id
	FOREIGN KEY (partnerbank_id)
	REFERENCES public."partnerbank"(partnerbank_id);


-- Add As Index, drop dulu jika sudah ada
DROP INDEX IF EXISTS public.idx_fk$public$bill$partnerbank_id;
CREATE INDEX idx_fk$public$bill$partnerbank_id ON public."bill"(partnerbank_id);	


ALTER TABLE public."bill"
	ADD CONSTRAINT fk$public$bill$ppn_id
	FOREIGN KEY (ppn_id)
	REFERENCES public."tax"(tax_id);


-- Add As Index, drop dulu jika sudah ada
DROP INDEX IF EXISTS public.idx_fk$public$bill$ppn_id;
CREATE INDEX idx_fk$public$bill$ppn_id ON public."bill"(ppn_id);	


ALTER TABLE public."bill"
	ADD CONSTRAINT fk$public$bill$pph_id
	FOREIGN KEY (pph_id)
	REFERENCES public."tax"(tax_id);


-- Add As Index, drop dulu jika sudah ada
DROP INDEX IF EXISTS public.idx_fk$public$bill$pph_id;
CREATE INDEX idx_fk$public$bill$pph_id ON public."bill"(pph_id);	

	


-- =============================================
-- UNIQUE INDEX
-- =============================================
-- Drop existing unique index 
alter table public."bill"
	drop constraint uq$public$bill$bill_doc;
	

-- Add unique index 
alter table  public."bill"
	add constraint uq$public$bill$bill_doc unique (bill_doc); 

