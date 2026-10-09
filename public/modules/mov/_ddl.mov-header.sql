-- mov.sql


/* =============================================
 * CREATE TABLE public."mov"
 * ============================================*/
create table public."mov" (
	mov_id bigint not null,
	constraint mov_pk primary key (mov_id)
);
comment on table public."mov" is '';	


-- =============================================
-- FIELD: mov_doc text
-- =============================================
-- ADD mov_doc
alter table public."mov" add mov_doc text  ;
comment on column public."mov".mov_doc is 'id dokumen (formated)';

-- MODIFY mov_doc
alter table public."mov"
	alter column mov_doc type text,
	ALTER COLUMN mov_doc DROP DEFAULT,
	ALTER COLUMN mov_doc DROP NOT NULL;
comment on column public."mov".mov_doc is 'id dokumen (formated)';


-- =============================================
-- FIELD: mov_version text
-- =============================================
-- ADD mov_version
alter table public."mov" add mov_version text not null default '0';
comment on column public."mov".mov_version is 'versi dokumen (increase saat uncommit)';

-- MODIFY mov_version
alter table public."mov"
	alter column mov_version type text,
	ALTER COLUMN mov_version SET DEFAULT '0',
	ALTER COLUMN mov_version SET NOT NULL;
comment on column public."mov".mov_version is 'versi dokumen (increase saat uncommit)';


-- =============================================
-- FIELD: mov_date date
-- =============================================
-- ADD mov_date
alter table public."mov" add mov_date date  default now();
comment on column public."mov".mov_date is 'tanggal dokumen dibuat';

-- MODIFY mov_date
alter table public."mov"
	alter column mov_date type date,
	ALTER COLUMN mov_date SET DEFAULT now(),
	ALTER COLUMN mov_date DROP NOT NULL;
comment on column public."mov".mov_date is 'tanggal dokumen dibuat';


-- =============================================
-- FIELD: mov_datesent date
-- =============================================
-- ADD mov_datesent
alter table public."mov" add mov_datesent date  default now();
comment on column public."mov".mov_datesent is 'tanggal barang dikirimkan';

-- MODIFY mov_datesent
alter table public."mov"
	alter column mov_datesent type date,
	ALTER COLUMN mov_datesent SET DEFAULT now(),
	ALTER COLUMN mov_datesent DROP NOT NULL;
comment on column public."mov".mov_datesent is 'tanggal barang dikirimkan';


-- =============================================
-- FIELD: mov_daterecv date
-- =============================================
-- ADD mov_daterecv
alter table public."mov" add mov_daterecv date  default now();
comment on column public."mov".mov_daterecv is 'tanggal barang diterima';

-- MODIFY mov_daterecv
alter table public."mov"
	alter column mov_daterecv type date,
	ALTER COLUMN mov_daterecv SET DEFAULT now(),
	ALTER COLUMN mov_daterecv DROP NOT NULL;
comment on column public."mov".mov_daterecv is 'tanggal barang diterima';


-- =============================================
-- FIELD: mov_ref text
-- =============================================
-- ADD mov_ref
alter table public."mov" add mov_ref text  ;
comment on column public."mov".mov_ref is 'refernsi dokumen (misalnya kode packing list dari origin / principal)';

-- MODIFY mov_ref
alter table public."mov"
	alter column mov_ref type text,
	ALTER COLUMN mov_ref DROP DEFAULT,
	ALTER COLUMN mov_ref DROP NOT NULL;
comment on column public."mov".mov_ref is 'refernsi dokumen (misalnya kode packing list dari origin / principal)';


-- =============================================
-- FIELD: mov_descr text
-- =============================================
-- ADD mov_descr
alter table public."mov" add mov_descr text  ;
comment on column public."mov".mov_descr is '';

-- MODIFY mov_descr
alter table public."mov"
	alter column mov_descr type text,
	ALTER COLUMN mov_descr DROP DEFAULT,
	ALTER COLUMN mov_descr DROP NOT NULL;
comment on column public."mov".mov_descr is '';


-- =============================================
-- FIELD: mov_qty decimal(12, 2)
-- =============================================
-- ADD mov_qty
alter table public."mov" add mov_qty decimal(12, 2) not null default 0;
comment on column public."mov".mov_qty is '';

-- MODIFY mov_qty
alter table public."mov"
	alter column mov_qty type decimal(12, 2),
	ALTER COLUMN mov_qty SET DEFAULT 0,
	ALTER COLUMN mov_qty SET NOT NULL;
comment on column public."mov".mov_qty is '';


-- =============================================
-- FIELD: mov_qtysend decimal(12, 2)
-- =============================================
-- ADD mov_qtysend
alter table public."mov" add mov_qtysend decimal(12, 2) not null default 0;
comment on column public."mov".mov_qtysend is '';

-- MODIFY mov_qtysend
alter table public."mov"
	alter column mov_qtysend type decimal(12, 2),
	ALTER COLUMN mov_qtysend SET DEFAULT 0,
	ALTER COLUMN mov_qtysend SET NOT NULL;
comment on column public."mov".mov_qtysend is '';


-- =============================================
-- FIELD: mov_qtyrecv decimal(12, 2)
-- =============================================
-- ADD mov_qtyrecv
alter table public."mov" add mov_qtyrecv decimal(12, 2) not null default 0;
comment on column public."mov".mov_qtyrecv is '';

-- MODIFY mov_qtyrecv
alter table public."mov"
	alter column mov_qtyrecv type decimal(12, 2),
	ALTER COLUMN mov_qtyrecv SET DEFAULT 0,
	ALTER COLUMN mov_qtyrecv SET NOT NULL;
comment on column public."mov".mov_qtyrecv is '';


-- =============================================
-- FIELD: mov_fobvalue decimal(18, 2)
-- =============================================
-- ADD mov_fobvalue
alter table public."mov" add mov_fobvalue decimal(18, 2) not null default 0;
comment on column public."mov".mov_fobvalue is 'subtotal fob dalam mata uang origin (hanya untuk RV)';

-- MODIFY mov_fobvalue
alter table public."mov"
	alter column mov_fobvalue type decimal(18, 2),
	ALTER COLUMN mov_fobvalue SET DEFAULT 0,
	ALTER COLUMN mov_fobvalue SET NOT NULL;
comment on column public."mov".mov_fobvalue is 'subtotal fob dalam mata uang origin (hanya untuk RV)';


-- =============================================
-- FIELD: mov_fobidr decimal(18, 2)
-- =============================================
-- ADD mov_fobidr
alter table public."mov" add mov_fobidr decimal(18, 2) not null default 0;
comment on column public."mov".mov_fobidr is 'subtotal fob dalam mata uang IDR (hanya untuk RV)';

-- MODIFY mov_fobidr
alter table public."mov"
	alter column mov_fobidr type decimal(18, 2),
	ALTER COLUMN mov_fobidr SET DEFAULT 0,
	ALTER COLUMN mov_fobidr SET NOT NULL;
comment on column public."mov".mov_fobidr is 'subtotal fob dalam mata uang IDR (hanya untuk RV)';


-- =============================================
-- FIELD: mov_addidr decimal(18, 2)
-- =============================================
-- ADD mov_addidr
alter table public."mov" add mov_addidr decimal(18, 2) not null default 0;
comment on column public."mov".mov_addidr is 'shipment / additional cost IDR (hanya RV)';

-- MODIFY mov_addidr
alter table public."mov"
	alter column mov_addidr type decimal(18, 2),
	ALTER COLUMN mov_addidr SET DEFAULT 0,
	ALTER COLUMN mov_addidr SET NOT NULL;
comment on column public."mov".mov_addidr is 'shipment / additional cost IDR (hanya RV)';


-- =============================================
-- FIELD: mov_landedidr decimal(18, 2)
-- =============================================
-- ADD mov_landedidr
alter table public."mov" add mov_landedidr decimal(18, 2) not null default 0;
comment on column public."mov".mov_landedidr is 'landed cost dalam IDR (hanya RV)';

-- MODIFY mov_landedidr
alter table public."mov"
	alter column mov_landedidr type decimal(18, 2),
	ALTER COLUMN mov_landedidr SET DEFAULT 0,
	ALTER COLUMN mov_landedidr SET NOT NULL;
comment on column public."mov".mov_landedidr is 'landed cost dalam IDR (hanya RV)';


-- =============================================
-- FIELD: movtype_id smallint
-- =============================================
-- ADD movtype_id
alter table public."mov" add movtype_id smallint  ;
comment on column public."mov".movtype_id is 'tipe moving, misalnya RV, TR, SL, dll';

-- MODIFY movtype_id
alter table public."mov"
	alter column movtype_id type smallint,
	ALTER COLUMN movtype_id DROP DEFAULT,
	ALTER COLUMN movtype_id DROP NOT NULL;
comment on column public."mov".movtype_id is 'tipe moving, misalnya RV, TR, SL, dll';


-- =============================================
-- FIELD: brand_id int
-- =============================================
-- ADD brand_id
alter table public."mov" add brand_id int  ;
comment on column public."mov".brand_id is '';

-- MODIFY brand_id
alter table public."mov"
	alter column brand_id type int,
	ALTER COLUMN brand_id DROP DEFAULT,
	ALTER COLUMN brand_id DROP NOT NULL;
comment on column public."mov".brand_id is '';


-- =============================================
-- FIELD: po_id bigint
-- =============================================
-- ADD po_id
alter table public."mov" add po_id bigint  ;
comment on column public."mov".po_id is 'khusus untuk RV, berisi sumner po dari receiving ini, nantinya berfungsi untuk filter sku yang bisa dipilih untuk receive.';

-- MODIFY po_id
alter table public."mov"
	alter column po_id type bigint,
	ALTER COLUMN po_id DROP DEFAULT,
	ALTER COLUMN po_id DROP NOT NULL;
comment on column public."mov".po_id is 'khusus untuk RV, berisi sumner po dari receiving ini, nantinya berfungsi untuk filter sku yang bisa dipilih untuk receive.';


-- =============================================
-- FIELD: partner_id int
-- =============================================
-- ADD partner_id
alter table public."mov" add partner_id int  ;
comment on column public."mov".partner_id is '';

-- MODIFY partner_id
alter table public."mov"
	alter column partner_id type int,
	ALTER COLUMN partner_id DROP DEFAULT,
	ALTER COLUMN partner_id DROP NOT NULL;
comment on column public."mov".partner_id is '';


-- =============================================
-- FIELD: sea_id smallint
-- =============================================
-- ADD sea_id
alter table public."mov" add sea_id smallint  ;
comment on column public."mov".sea_id is 'season khusus untuk dokumen RV';

-- MODIFY sea_id
alter table public."mov"
	alter column sea_id type smallint,
	ALTER COLUMN sea_id DROP DEFAULT,
	ALTER COLUMN sea_id DROP NOT NULL;
comment on column public."mov".sea_id is 'season khusus untuk dokumen RV';


-- =============================================
-- FIELD: curr_id smallint
-- =============================================
-- ADD curr_id
alter table public."mov" add curr_id smallint  ;
comment on column public."mov".curr_id is '';

-- MODIFY curr_id
alter table public."mov"
	alter column curr_id type smallint,
	ALTER COLUMN curr_id DROP DEFAULT,
	ALTER COLUMN curr_id DROP NOT NULL;
comment on column public."mov".curr_id is '';


-- =============================================
-- FIELD: ori_site_id int
-- =============================================
-- ADD ori_site_id
alter table public."mov" add ori_site_id int  ;
comment on column public."mov".ori_site_id is 'untuk TR, site asal barang (TR, SL, DO)';

-- MODIFY ori_site_id
alter table public."mov"
	alter column ori_site_id type int,
	ALTER COLUMN ori_site_id DROP DEFAULT,
	ALTER COLUMN ori_site_id DROP NOT NULL;
comment on column public."mov".ori_site_id is 'untuk TR, site asal barang (TR, SL, DO)';


-- =============================================
-- FIELD: des_site_id int
-- =============================================
-- ADD des_site_id
alter table public."mov" add des_site_id int  ;
comment on column public."mov".des_site_id is 'site tujuan pengiriman barang (TR, RV, AJ)';

-- MODIFY des_site_id
alter table public."mov"
	alter column des_site_id type int,
	ALTER COLUMN des_site_id DROP DEFAULT,
	ALTER COLUMN des_site_id DROP NOT NULL;
comment on column public."mov".des_site_id is 'site tujuan pengiriman barang (TR, RV, AJ)';


-- =============================================
-- FIELD: _commit boolean
-- =============================================
-- ADD _commit
alter table public."mov" add _commit boolean not null default false;
comment on column public."mov"._commit is '';

-- MODIFY _commit
alter table public."mov"
	alter column _commit type boolean,
	ALTER COLUMN _commit SET DEFAULT false,
	ALTER COLUMN _commit SET NOT NULL;
comment on column public."mov"._commit is '';


-- =============================================
-- FIELD: _lock boolean
-- =============================================
-- ADD _lock
alter table public."mov" add _lock boolean not null default false;
comment on column public."mov"._lock is '';

-- MODIFY _lock
alter table public."mov"
	alter column _lock type boolean,
	ALTER COLUMN _lock SET DEFAULT false,
	ALTER COLUMN _lock SET NOT NULL;
comment on column public."mov"._lock is '';


-- =============================================
-- FIELD: _issent boolean
-- =============================================
-- ADD _issent
alter table public."mov" add _issent boolean not null default false;
comment on column public."mov"._issent is '';

-- MODIFY _issent
alter table public."mov"
	alter column _issent type boolean,
	ALTER COLUMN _issent SET DEFAULT false,
	ALTER COLUMN _issent SET NOT NULL;
comment on column public."mov"._issent is '';


-- =============================================
-- FIELD: _isrecv boolean
-- =============================================
-- ADD _isrecv
alter table public."mov" add _isrecv boolean not null default false;
comment on column public."mov"._isrecv is '';

-- MODIFY _isrecv
alter table public."mov"
	alter column _isrecv type boolean,
	ALTER COLUMN _isrecv SET DEFAULT false,
	ALTER COLUMN _isrecv SET NOT NULL;
comment on column public."mov"._isrecv is '';


-- =============================================
-- FIELD: _commitby int
-- =============================================
-- ADD _commitby
alter table public."mov" add _commitby int  ;
comment on column public."mov"._commitby is '';

-- MODIFY _commitby
alter table public."mov"
	alter column _commitby type int,
	ALTER COLUMN _commitby DROP DEFAULT,
	ALTER COLUMN _commitby DROP NOT NULL;
comment on column public."mov"._commitby is '';


-- =============================================
-- FIELD: _commitdate timestamp with time zone
-- =============================================
-- ADD _commitdate
alter table public."mov" add _commitdate timestamp with time zone  ;
comment on column public."mov"._commitdate is '';

-- MODIFY _commitdate
alter table public."mov"
	alter column _commitdate type timestamp with time zone,
	ALTER COLUMN _commitdate DROP DEFAULT,
	ALTER COLUMN _commitdate DROP NOT NULL;
comment on column public."mov"._commitdate is '';


-- =============================================
-- FIELD: _lockby int
-- =============================================
-- ADD _lockby
alter table public."mov" add _lockby int  ;
comment on column public."mov"._lockby is '';

-- MODIFY _lockby
alter table public."mov"
	alter column _lockby type int,
	ALTER COLUMN _lockby DROP DEFAULT,
	ALTER COLUMN _lockby DROP NOT NULL;
comment on column public."mov"._lockby is '';


-- =============================================
-- FIELD: _lockdate timestamp with time zone
-- =============================================
-- ADD _lockdate
alter table public."mov" add _lockdate timestamp with time zone  ;
comment on column public."mov"._lockdate is '';

-- MODIFY _lockdate
alter table public."mov"
	alter column _lockdate type timestamp with time zone,
	ALTER COLUMN _lockdate DROP DEFAULT,
	ALTER COLUMN _lockdate DROP NOT NULL;
comment on column public."mov"._lockdate is '';


-- =============================================
-- FIELD: _sentby int
-- =============================================
-- ADD _sentby
alter table public."mov" add _sentby int  ;
comment on column public."mov"._sentby is '';

-- MODIFY _sentby
alter table public."mov"
	alter column _sentby type int,
	ALTER COLUMN _sentby DROP DEFAULT,
	ALTER COLUMN _sentby DROP NOT NULL;
comment on column public."mov"._sentby is '';


-- =============================================
-- FIELD: _sentdate timestamp with time zone
-- =============================================
-- ADD _sentdate
alter table public."mov" add _sentdate timestamp with time zone  ;
comment on column public."mov"._sentdate is '';

-- MODIFY _sentdate
alter table public."mov"
	alter column _sentdate type timestamp with time zone,
	ALTER COLUMN _sentdate DROP DEFAULT,
	ALTER COLUMN _sentdate DROP NOT NULL;
comment on column public."mov"._sentdate is '';


-- =============================================
-- FIELD: _recvby int
-- =============================================
-- ADD _recvby
alter table public."mov" add _recvby int  ;
comment on column public."mov"._recvby is '';

-- MODIFY _recvby
alter table public."mov"
	alter column _recvby type int,
	ALTER COLUMN _recvby DROP DEFAULT,
	ALTER COLUMN _recvby DROP NOT NULL;
comment on column public."mov"._recvby is '';


-- =============================================
-- FIELD: _recvdate timestamp with time zone
-- =============================================
-- ADD _recvdate
alter table public."mov" add _recvdate timestamp with time zone  ;
comment on column public."mov"._recvdate is '';

-- MODIFY _recvdate
alter table public."mov"
	alter column _recvdate type timestamp with time zone,
	ALTER COLUMN _recvdate DROP DEFAULT,
	ALTER COLUMN _recvdate DROP NOT NULL;
comment on column public."mov"._recvdate is '';


-- =============================================
-- FIELD: _createby integer
-- =============================================
-- ADD _createby
alter table public."mov" add _createby integer not null ;
comment on column public."mov"._createby is 'user yang pertama kali membuat record ini';

-- MODIFY _createby
alter table public."mov"
	alter column _createby type integer,
	ALTER COLUMN _createby DROP DEFAULT,
	ALTER COLUMN _createby SET NOT NULL;
comment on column public."mov"._createby is 'user yang pertama kali membuat record ini';


-- =============================================
-- FIELD: _createdate timestamp with time zone
-- =============================================
-- ADD _createdate
alter table public."mov" add _createdate timestamp with time zone not null default now();
comment on column public."mov"._createdate is 'waktu record dibuat pertama kali';

-- MODIFY _createdate
alter table public."mov"
	alter column _createdate type timestamp with time zone,
	ALTER COLUMN _createdate SET DEFAULT now(),
	ALTER COLUMN _createdate SET NOT NULL;
comment on column public."mov"._createdate is 'waktu record dibuat pertama kali';


-- =============================================
-- FIELD: _modifyby integer
-- =============================================
-- ADD _modifyby
alter table public."mov" add _modifyby integer  ;
comment on column public."mov"._modifyby is 'user yang terakhir modifikasi record ini';

-- MODIFY _modifyby
alter table public."mov"
	alter column _modifyby type integer,
	ALTER COLUMN _modifyby DROP DEFAULT,
	ALTER COLUMN _modifyby DROP NOT NULL;
comment on column public."mov"._modifyby is 'user yang terakhir modifikasi record ini';


-- =============================================
-- FIELD: _modifydate timestamp with time zone
-- =============================================
-- ADD _modifydate
alter table public."mov" add _modifydate timestamp with time zone  ;
comment on column public."mov"._modifydate is 'waktu terakhir record dimodifikasi';

-- MODIFY _modifydate
alter table public."mov"
	alter column _modifydate type timestamp with time zone,
	ALTER COLUMN _modifydate DROP DEFAULT,
	ALTER COLUMN _modifydate DROP NOT NULL;
comment on column public."mov"._modifydate is 'waktu terakhir record dimodifikasi';


-- =============================================
-- FIELD: _timestamp timestamp with time zone
-- =============================================
-- ADD _timestamp
alter table public."mov" add _timestamp timestamp with time zone not null default now();
comment on column public."mov"._timestamp is 'data timestamp';

-- MODIFY _timestamp
alter table public."mov"
	alter column _timestamp type timestamp with time zone,
	ALTER COLUMN _timestamp SET DEFAULT now(),
	ALTER COLUMN _timestamp SET NOT NULL;
comment on column public."mov"._timestamp is 'data timestamp';


-- =============================================
-- INDEX
-- =============================================
DROP INDEX IF EXISTS public.idx$public$mov$_timestamp;
CREATE INDEX idx$public$mov$_timestamp ON public.mov (_timestamp);


-- =============================================
-- FOREIGN KEY CONSTRAINT
-- =============================================
-- Drop Existing Foreign Key Constraint 
ALTER TABLE public."mov" DROP CONSTRAINT fk$public$mov$movtype_id;
ALTER TABLE public."mov" DROP CONSTRAINT fk$public$mov$brand_id;
ALTER TABLE public."mov" DROP CONSTRAINT fk$public$mov$po_id;
ALTER TABLE public."mov" DROP CONSTRAINT fk$public$mov$partner_id;
ALTER TABLE public."mov" DROP CONSTRAINT fk$public$mov$sea_id;
ALTER TABLE public."mov" DROP CONSTRAINT fk$public$mov$curr_id;
ALTER TABLE public."mov" DROP CONSTRAINT fk$public$mov$ori_site_id;
ALTER TABLE public."mov" DROP CONSTRAINT fk$public$mov$des_site_id;


-- Add Foreign Key Constraint  
ALTER TABLE public."mov"
	ADD CONSTRAINT fk$public$mov$movtype_id
	FOREIGN KEY (movtype_id)
	REFERENCES public."movtype"(movtype_id);


-- Add As Index, drop dulu jika sudah ada
DROP INDEX IF EXISTS public.idx_fk$public$mov$movtype_id;
CREATE INDEX idx_fk$public$mov$movtype_id ON public."mov"(movtype_id);	


ALTER TABLE public."mov"
	ADD CONSTRAINT fk$public$mov$brand_id
	FOREIGN KEY (brand_id)
	REFERENCES public."brand"(brand_id);


-- Add As Index, drop dulu jika sudah ada
DROP INDEX IF EXISTS public.idx_fk$public$mov$brand_id;
CREATE INDEX idx_fk$public$mov$brand_id ON public."mov"(brand_id);	


ALTER TABLE public."mov"
	ADD CONSTRAINT fk$public$mov$po_id
	FOREIGN KEY (po_id)
	REFERENCES public."po"(po_id);


-- Add As Index, drop dulu jika sudah ada
DROP INDEX IF EXISTS public.idx_fk$public$mov$po_id;
CREATE INDEX idx_fk$public$mov$po_id ON public."mov"(po_id);	


ALTER TABLE public."mov"
	ADD CONSTRAINT fk$public$mov$partner_id
	FOREIGN KEY (partner_id)
	REFERENCES public."partner"(partner_id);


-- Add As Index, drop dulu jika sudah ada
DROP INDEX IF EXISTS public.idx_fk$public$mov$partner_id;
CREATE INDEX idx_fk$public$mov$partner_id ON public."mov"(partner_id);	


ALTER TABLE public."mov"
	ADD CONSTRAINT fk$public$mov$sea_id
	FOREIGN KEY (sea_id)
	REFERENCES public."sea"(sea_id);


-- Add As Index, drop dulu jika sudah ada
DROP INDEX IF EXISTS public.idx_fk$public$mov$sea_id;
CREATE INDEX idx_fk$public$mov$sea_id ON public."mov"(sea_id);	


ALTER TABLE public."mov"
	ADD CONSTRAINT fk$public$mov$curr_id
	FOREIGN KEY (curr_id)
	REFERENCES public."curr"(curr_id);


-- Add As Index, drop dulu jika sudah ada
DROP INDEX IF EXISTS public.idx_fk$public$mov$curr_id;
CREATE INDEX idx_fk$public$mov$curr_id ON public."mov"(curr_id);	


ALTER TABLE public."mov"
	ADD CONSTRAINT fk$public$mov$ori_site_id
	FOREIGN KEY (ori_site_id)
	REFERENCES public."site"(site_id);


-- Add As Index, drop dulu jika sudah ada
DROP INDEX IF EXISTS public.idx_fk$public$mov$ori_site_id;
CREATE INDEX idx_fk$public$mov$ori_site_id ON public."mov"(ori_site_id);	


ALTER TABLE public."mov"
	ADD CONSTRAINT fk$public$mov$des_site_id
	FOREIGN KEY (des_site_id)
	REFERENCES public."site"(site_id);


-- Add As Index, drop dulu jika sudah ada
DROP INDEX IF EXISTS public.idx_fk$public$mov$des_site_id;
CREATE INDEX idx_fk$public$mov$des_site_id ON public."mov"(des_site_id);	

	


-- =============================================
-- UNIQUE INDEX
-- =============================================
-- Drop existing unique index 
alter table public."mov"
	drop constraint uq$public$mov$mov_doc;
	

-- Add unique index 
alter table  public."mov"
	add constraint uq$public$mov$mov_doc unique (mov_doc); 

