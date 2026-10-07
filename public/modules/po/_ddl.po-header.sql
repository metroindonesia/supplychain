-- po.sql


/* =============================================
 * CREATE TABLE public."po"
 * ============================================*/
create table public."po" (
	po_id bigint not null,
	constraint po_pk primary key (po_id)
);
comment on table public."po" is '';	


-- =============================================
-- FIELD: po_doc text
-- =============================================
-- ADD po_doc
alter table public."po" add po_doc text  ;
comment on column public."po".po_doc is '';

-- MODIFY po_doc
alter table public."po"
	alter column po_doc type text,
	ALTER COLUMN po_doc DROP DEFAULT,
	ALTER COLUMN po_doc DROP NOT NULL;
comment on column public."po".po_doc is '';


-- =============================================
-- FIELD: _iscommit boolean
-- =============================================
-- ADD _iscommit
alter table public."po" add _iscommit boolean not null default false;
comment on column public."po"._iscommit is '';

-- MODIFY _iscommit
alter table public."po"
	alter column _iscommit type boolean,
	ALTER COLUMN _iscommit SET DEFAULT false,
	ALTER COLUMN _iscommit SET NOT NULL;
comment on column public."po"._iscommit is '';


-- =============================================
-- FIELD: _isapproved boolean
-- =============================================
-- ADD _isapproved
alter table public."po" add _isapproved boolean not null default false;
comment on column public."po"._isapproved is '';

-- MODIFY _isapproved
alter table public."po"
	alter column _isapproved type boolean,
	ALTER COLUMN _isapproved SET DEFAULT false,
	ALTER COLUMN _isapproved SET NOT NULL;
comment on column public."po"._isapproved is '';


-- =============================================
-- FIELD: po_date date
-- =============================================
-- ADD po_date
alter table public."po" add po_date date  default now();
comment on column public."po".po_date is '';

-- MODIFY po_date
alter table public."po"
	alter column po_date type date,
	ALTER COLUMN po_date SET DEFAULT now(),
	ALTER COLUMN po_date DROP NOT NULL;
comment on column public."po".po_date is '';


-- =============================================
-- FIELD: po_dateeta date
-- =============================================
-- ADD po_dateeta
alter table public."po" add po_dateeta date  default now();
comment on column public."po".po_dateeta is '';

-- MODIFY po_dateeta
alter table public."po"
	alter column po_dateeta type date,
	ALTER COLUMN po_dateeta SET DEFAULT now(),
	ALTER COLUMN po_dateeta DROP NOT NULL;
comment on column public."po".po_dateeta is '';


-- =============================================
-- FIELD: po_descr text
-- =============================================
-- ADD po_descr
alter table public."po" add po_descr text  ;
comment on column public."po".po_descr is '';

-- MODIFY po_descr
alter table public."po"
	alter column po_descr type text,
	ALTER COLUMN po_descr DROP DEFAULT,
	ALTER COLUMN po_descr DROP NOT NULL;
comment on column public."po".po_descr is '';


-- =============================================
-- FIELD: partner_id int
-- =============================================
-- ADD partner_id
alter table public."po" add partner_id int  ;
comment on column public."po".partner_id is '';

-- MODIFY partner_id
alter table public."po"
	alter column partner_id type int,
	ALTER COLUMN partner_id DROP DEFAULT,
	ALTER COLUMN partner_id DROP NOT NULL;
comment on column public."po".partner_id is '';


-- =============================================
-- FIELD: tax_id smallint
-- =============================================
-- ADD tax_id
alter table public."po" add tax_id smallint  ;
comment on column public."po".tax_id is '';

-- MODIFY tax_id
alter table public."po"
	alter column tax_id type smallint,
	ALTER COLUMN tax_id DROP DEFAULT,
	ALTER COLUMN tax_id DROP NOT NULL;
comment on column public."po".tax_id is '';


-- =============================================
-- FIELD: brand_id int
-- =============================================
-- ADD brand_id
alter table public."po" add brand_id int  ;
comment on column public."po".brand_id is '';

-- MODIFY brand_id
alter table public."po"
	alter column brand_id type int,
	ALTER COLUMN brand_id DROP DEFAULT,
	ALTER COLUMN brand_id DROP NOT NULL;
comment on column public."po".brand_id is '';


-- =============================================
-- FIELD: sea_id smallint
-- =============================================
-- ADD sea_id
alter table public."po" add sea_id smallint  ;
comment on column public."po".sea_id is '';

-- MODIFY sea_id
alter table public."po"
	alter column sea_id type smallint,
	ALTER COLUMN sea_id DROP DEFAULT,
	ALTER COLUMN sea_id DROP NOT NULL;
comment on column public."po".sea_id is '';


-- =============================================
-- FIELD: po_subtotalqty decimal(9, 2)
-- =============================================
-- ADD po_subtotalqty
alter table public."po" add po_subtotalqty decimal(9, 2) not null default 0;
comment on column public."po".po_subtotalqty is '';

-- MODIFY po_subtotalqty
alter table public."po"
	alter column po_subtotalqty type decimal(9, 2),
	ALTER COLUMN po_subtotalqty SET DEFAULT 0,
	ALTER COLUMN po_subtotalqty SET NOT NULL;
comment on column public."po".po_subtotalqty is '';


-- =============================================
-- FIELD: po_subtotalitem decimal(18, 2)
-- =============================================
-- ADD po_subtotalitem
alter table public."po" add po_subtotalitem decimal(18, 2) not null default 0;
comment on column public."po".po_subtotalitem is '';

-- MODIFY po_subtotalitem
alter table public."po"
	alter column po_subtotalitem type decimal(18, 2),
	ALTER COLUMN po_subtotalitem SET DEFAULT 0,
	ALTER COLUMN po_subtotalitem SET NOT NULL;
comment on column public."po".po_subtotalitem is '';


-- =============================================
-- FIELD: curr_id smallint
-- =============================================
-- ADD curr_id
alter table public."po" add curr_id smallint  ;
comment on column public."po".curr_id is '';

-- MODIFY curr_id
alter table public."po"
	alter column curr_id type smallint,
	ALTER COLUMN curr_id DROP DEFAULT,
	ALTER COLUMN curr_id DROP NOT NULL;
comment on column public."po".curr_id is '';


-- =============================================
-- FIELD: po_subtotaltax decimal(12, 0)
-- =============================================
-- ADD po_subtotaltax
alter table public."po" add po_subtotaltax decimal(12, 0) not null default 0;
comment on column public."po".po_subtotaltax is '';

-- MODIFY po_subtotaltax
alter table public."po"
	alter column po_subtotaltax type decimal(12, 0),
	ALTER COLUMN po_subtotaltax SET DEFAULT 0,
	ALTER COLUMN po_subtotaltax SET NOT NULL;
comment on column public."po".po_subtotaltax is '';


-- =============================================
-- FIELD: tax_value decimal(4, 2)
-- =============================================
-- ADD tax_value
alter table public."po" add tax_value decimal(4, 2) not null default 0;
comment on column public."po".tax_value is '';

-- MODIFY tax_value
alter table public."po"
	alter column tax_value type decimal(4, 2),
	ALTER COLUMN tax_value SET DEFAULT 0,
	ALTER COLUMN tax_value SET NOT NULL;
comment on column public."po".tax_value is '';


-- =============================================
-- FIELD: tax_isinclude boolean
-- =============================================
-- ADD tax_isinclude
alter table public."po" add tax_isinclude boolean not null default false;
comment on column public."po".tax_isinclude is '';

-- MODIFY tax_isinclude
alter table public."po"
	alter column tax_isinclude type boolean,
	ALTER COLUMN tax_isinclude SET DEFAULT false,
	ALTER COLUMN tax_isinclude SET NOT NULL;
comment on column public."po".tax_isinclude is '';


-- =============================================
-- FIELD: po_subtotal decimal(18, 2)
-- =============================================
-- ADD po_subtotal
alter table public."po" add po_subtotal decimal(18, 2) not null default 0;
comment on column public."po".po_subtotal is '';

-- MODIFY po_subtotal
alter table public."po"
	alter column po_subtotal type decimal(18, 2),
	ALTER COLUMN po_subtotal SET DEFAULT 0,
	ALTER COLUMN po_subtotal SET NOT NULL;
comment on column public."po".po_subtotal is '';


-- =============================================
-- FIELD: _createby integer
-- =============================================
-- ADD _createby
alter table public."po" add _createby integer not null ;
comment on column public."po"._createby is 'user yang pertama kali membuat record ini';

-- MODIFY _createby
alter table public."po"
	alter column _createby type integer,
	ALTER COLUMN _createby DROP DEFAULT,
	ALTER COLUMN _createby SET NOT NULL;
comment on column public."po"._createby is 'user yang pertama kali membuat record ini';


-- =============================================
-- FIELD: _createdate timestamp with time zone
-- =============================================
-- ADD _createdate
alter table public."po" add _createdate timestamp with time zone not null default now();
comment on column public."po"._createdate is 'waktu record dibuat pertama kali';

-- MODIFY _createdate
alter table public."po"
	alter column _createdate type timestamp with time zone,
	ALTER COLUMN _createdate SET DEFAULT now(),
	ALTER COLUMN _createdate SET NOT NULL;
comment on column public."po"._createdate is 'waktu record dibuat pertama kali';


-- =============================================
-- FIELD: _modifyby integer
-- =============================================
-- ADD _modifyby
alter table public."po" add _modifyby integer  ;
comment on column public."po"._modifyby is 'user yang terakhir modifikasi record ini';

-- MODIFY _modifyby
alter table public."po"
	alter column _modifyby type integer,
	ALTER COLUMN _modifyby DROP DEFAULT,
	ALTER COLUMN _modifyby DROP NOT NULL;
comment on column public."po"._modifyby is 'user yang terakhir modifikasi record ini';


-- =============================================
-- FIELD: _modifydate timestamp with time zone
-- =============================================
-- ADD _modifydate
alter table public."po" add _modifydate timestamp with time zone  ;
comment on column public."po"._modifydate is 'waktu terakhir record dimodifikasi';

-- MODIFY _modifydate
alter table public."po"
	alter column _modifydate type timestamp with time zone,
	ALTER COLUMN _modifydate DROP DEFAULT,
	ALTER COLUMN _modifydate DROP NOT NULL;
comment on column public."po"._modifydate is 'waktu terakhir record dimodifikasi';


-- =============================================
-- FIELD: _timestamp timestamp with time zone
-- =============================================
-- ADD _timestamp
alter table public."po" add _timestamp timestamp with time zone not null default now();
comment on column public."po"._timestamp is 'data timestamp';

-- MODIFY _timestamp
alter table public."po"
	alter column _timestamp type timestamp with time zone,
	ALTER COLUMN _timestamp SET DEFAULT now(),
	ALTER COLUMN _timestamp SET NOT NULL;
comment on column public."po"._timestamp is 'data timestamp';


-- =============================================
-- INDEX
-- =============================================
DROP INDEX IF EXISTS public.idx$public$po$_timestamp;
CREATE INDEX idx$public$po$_timestamp ON public.po (_timestamp);


-- =============================================
-- FOREIGN KEY CONSTRAINT
-- =============================================
-- Drop Existing Foreign Key Constraint 
ALTER TABLE public."po" DROP CONSTRAINT fk$public$po$partner_id;
ALTER TABLE public."po" DROP CONSTRAINT fk$public$po$tax_id;
ALTER TABLE public."po" DROP CONSTRAINT fk$public$po$brand_id;
ALTER TABLE public."po" DROP CONSTRAINT fk$public$po$sea_id;
ALTER TABLE public."po" DROP CONSTRAINT fk$public$po$curr_id;


-- Add Foreign Key Constraint  
ALTER TABLE public."po"
	ADD CONSTRAINT fk$public$po$partner_id
	FOREIGN KEY (partner_id)
	REFERENCES public."partner"(partner_id);


-- Add As Index, drop dulu jika sudah ada
DROP INDEX IF EXISTS public.idx_fk$public$po$partner_id;
CREATE INDEX idx_fk$public$po$partner_id ON public."po"(partner_id);	


ALTER TABLE public."po"
	ADD CONSTRAINT fk$public$po$tax_id
	FOREIGN KEY (tax_id)
	REFERENCES public."tax"(tax_id);


-- Add As Index, drop dulu jika sudah ada
DROP INDEX IF EXISTS public.idx_fk$public$po$tax_id;
CREATE INDEX idx_fk$public$po$tax_id ON public."po"(tax_id);	


ALTER TABLE public."po"
	ADD CONSTRAINT fk$public$po$brand_id
	FOREIGN KEY (brand_id)
	REFERENCES public."brand"(brand_id);


-- Add As Index, drop dulu jika sudah ada
DROP INDEX IF EXISTS public.idx_fk$public$po$brand_id;
CREATE INDEX idx_fk$public$po$brand_id ON public."po"(brand_id);	


ALTER TABLE public."po"
	ADD CONSTRAINT fk$public$po$sea_id
	FOREIGN KEY (sea_id)
	REFERENCES public."sea"(sea_id);


-- Add As Index, drop dulu jika sudah ada
DROP INDEX IF EXISTS public.idx_fk$public$po$sea_id;
CREATE INDEX idx_fk$public$po$sea_id ON public."po"(sea_id);	


ALTER TABLE public."po"
	ADD CONSTRAINT fk$public$po$curr_id
	FOREIGN KEY (curr_id)
	REFERENCES public."curr"(curr_id);


-- Add As Index, drop dulu jika sudah ada
DROP INDEX IF EXISTS public.idx_fk$public$po$curr_id;
CREATE INDEX idx_fk$public$po$curr_id ON public."po"(curr_id);	

	


-- =============================================
-- UNIQUE INDEX
-- =============================================
-- Drop existing unique index 
alter table public."po"
	drop constraint uq$public$po$po_doc;
	

-- Add unique index 
alter table  public."po"
	add constraint uq$public$po$po_doc unique (po_doc); 

