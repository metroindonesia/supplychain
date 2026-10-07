-- po.sql


/* =============================================
 * CREATE TABLE public."poitem"
 * ============================================*/
create table public."poitem" (
	poitem_id bigint not null,
	constraint poitem_pk primary key (poitem_id)
);
comment on table public."poitem" is '';	


-- =============================================
-- FIELD: sku_id bigint
-- =============================================
-- ADD sku_id
alter table public."poitem" add sku_id bigint  ;
comment on column public."poitem".sku_id is '';

-- MODIFY sku_id
alter table public."poitem"
	alter column sku_id type bigint,
	ALTER COLUMN sku_id DROP DEFAULT,
	ALTER COLUMN sku_id DROP NOT NULL;
comment on column public."poitem".sku_id is '';


-- =============================================
-- FIELD: product_code text
-- =============================================
-- ADD product_code
alter table public."poitem" add product_code text  ;
comment on column public."poitem".product_code is '';

-- MODIFY product_code
alter table public."poitem"
	alter column product_code type text,
	ALTER COLUMN product_code DROP DEFAULT,
	ALTER COLUMN product_code DROP NOT NULL;
comment on column public."poitem".product_code is '';


-- =============================================
-- FIELD: variance_code text
-- =============================================
-- ADD variance_code
alter table public."poitem" add variance_code text  ;
comment on column public."poitem".variance_code is '';

-- MODIFY variance_code
alter table public."poitem"
	alter column variance_code type text,
	ALTER COLUMN variance_code DROP DEFAULT,
	ALTER COLUMN variance_code DROP NOT NULL;
comment on column public."poitem".variance_code is '';


-- =============================================
-- FIELD: skuopt_code text
-- =============================================
-- ADD skuopt_code
alter table public."poitem" add skuopt_code text  ;
comment on column public."poitem".skuopt_code is '';

-- MODIFY skuopt_code
alter table public."poitem"
	alter column skuopt_code type text,
	ALTER COLUMN skuopt_code DROP DEFAULT,
	ALTER COLUMN skuopt_code DROP NOT NULL;
comment on column public."poitem".skuopt_code is '';


-- =============================================
-- FIELD: sku_name text
-- =============================================
-- ADD sku_name
alter table public."poitem" add sku_name text  ;
comment on column public."poitem".sku_name is '';

-- MODIFY sku_name
alter table public."poitem"
	alter column sku_name type text,
	ALTER COLUMN sku_name DROP DEFAULT,
	ALTER COLUMN sku_name DROP NOT NULL;
comment on column public."poitem".sku_name is '';


-- =============================================
-- FIELD: poitem_qty decimal(9, 2)
-- =============================================
-- ADD poitem_qty
alter table public."poitem" add poitem_qty decimal(9, 2) not null default 0;
comment on column public."poitem".poitem_qty is '';

-- MODIFY poitem_qty
alter table public."poitem"
	alter column poitem_qty type decimal(9, 2),
	ALTER COLUMN poitem_qty SET DEFAULT 0,
	ALTER COLUMN poitem_qty SET NOT NULL;
comment on column public."poitem".poitem_qty is '';


-- =============================================
-- FIELD: uom_id smallint
-- =============================================
-- ADD uom_id
alter table public."poitem" add uom_id smallint  ;
comment on column public."poitem".uom_id is '';

-- MODIFY uom_id
alter table public."poitem"
	alter column uom_id type smallint,
	ALTER COLUMN uom_id DROP DEFAULT,
	ALTER COLUMN uom_id DROP NOT NULL;
comment on column public."poitem".uom_id is '';


-- =============================================
-- FIELD: poitem_value decimal(18, 2)
-- =============================================
-- ADD poitem_value
alter table public."poitem" add poitem_value decimal(18, 2) not null default 0;
comment on column public."poitem".poitem_value is '';

-- MODIFY poitem_value
alter table public."poitem"
	alter column poitem_value type decimal(18, 2),
	ALTER COLUMN poitem_value SET DEFAULT 0,
	ALTER COLUMN poitem_value SET NOT NULL;
comment on column public."poitem".poitem_value is '';


-- =============================================
-- FIELD: poitem_subtotal decimal(18, 2)
-- =============================================
-- ADD poitem_subtotal
alter table public."poitem" add poitem_subtotal decimal(18, 2) not null default 0;
comment on column public."poitem".poitem_subtotal is '';

-- MODIFY poitem_subtotal
alter table public."poitem"
	alter column poitem_subtotal type decimal(18, 2),
	ALTER COLUMN poitem_subtotal SET DEFAULT 0,
	ALTER COLUMN poitem_subtotal SET NOT NULL;
comment on column public."poitem".poitem_subtotal is '';


-- =============================================
-- FIELD: po_id bigint
-- =============================================
-- ADD po_id
alter table public."poitem" add po_id bigint  ;
comment on column public."poitem".po_id is '';

-- MODIFY po_id
alter table public."poitem"
	alter column po_id type bigint,
	ALTER COLUMN po_id DROP DEFAULT,
	ALTER COLUMN po_id DROP NOT NULL;
comment on column public."poitem".po_id is '';


-- =============================================
-- FIELD: _createby integer
-- =============================================
-- ADD _createby
alter table public."poitem" add _createby integer not null ;
comment on column public."poitem"._createby is 'user yang pertama kali membuat record ini';

-- MODIFY _createby
alter table public."poitem"
	alter column _createby type integer,
	ALTER COLUMN _createby DROP DEFAULT,
	ALTER COLUMN _createby SET NOT NULL;
comment on column public."poitem"._createby is 'user yang pertama kali membuat record ini';


-- =============================================
-- FIELD: _createdate timestamp with time zone
-- =============================================
-- ADD _createdate
alter table public."poitem" add _createdate timestamp with time zone not null default now();
comment on column public."poitem"._createdate is 'waktu record dibuat pertama kali';

-- MODIFY _createdate
alter table public."poitem"
	alter column _createdate type timestamp with time zone,
	ALTER COLUMN _createdate SET DEFAULT now(),
	ALTER COLUMN _createdate SET NOT NULL;
comment on column public."poitem"._createdate is 'waktu record dibuat pertama kali';


-- =============================================
-- FIELD: _modifyby integer
-- =============================================
-- ADD _modifyby
alter table public."poitem" add _modifyby integer  ;
comment on column public."poitem"._modifyby is 'user yang terakhir modifikasi record ini';

-- MODIFY _modifyby
alter table public."poitem"
	alter column _modifyby type integer,
	ALTER COLUMN _modifyby DROP DEFAULT,
	ALTER COLUMN _modifyby DROP NOT NULL;
comment on column public."poitem"._modifyby is 'user yang terakhir modifikasi record ini';


-- =============================================
-- FIELD: _modifydate timestamp with time zone
-- =============================================
-- ADD _modifydate
alter table public."poitem" add _modifydate timestamp with time zone  ;
comment on column public."poitem"._modifydate is 'waktu terakhir record dimodifikasi';

-- MODIFY _modifydate
alter table public."poitem"
	alter column _modifydate type timestamp with time zone,
	ALTER COLUMN _modifydate DROP DEFAULT,
	ALTER COLUMN _modifydate DROP NOT NULL;
comment on column public."poitem"._modifydate is 'waktu terakhir record dimodifikasi';


-- =============================================
-- FIELD: _timestamp timestamp with time zone
-- =============================================
-- ADD _timestamp
alter table public."poitem" add _timestamp timestamp with time zone not null default now();
comment on column public."poitem"._timestamp is 'data timestamp';

-- MODIFY _timestamp
alter table public."poitem"
	alter column _timestamp type timestamp with time zone,
	ALTER COLUMN _timestamp SET DEFAULT now(),
	ALTER COLUMN _timestamp SET NOT NULL;
comment on column public."poitem"._timestamp is 'data timestamp';


-- =============================================
-- INDEX
-- =============================================
DROP INDEX IF EXISTS public.idx$public$poitem$_timestamp;
CREATE INDEX idx$public$poitem$_timestamp ON public.poitem (_timestamp);


-- =============================================
-- FOREIGN KEY CONSTRAINT
-- =============================================
-- Drop Existing Foreign Key Constraint 
ALTER TABLE public."poitem" DROP CONSTRAINT fk$public$poitem$sku_id;
ALTER TABLE public."poitem" DROP CONSTRAINT fk$public$poitem$uom_id;


-- Add Foreign Key Constraint  
ALTER TABLE public."poitem"
	ADD CONSTRAINT fk$public$poitem$sku_id
	FOREIGN KEY (sku_id)
	REFERENCES public."sku"(sku_id);


-- Add As Index, drop dulu jika sudah ada
DROP INDEX IF EXISTS public.idx_fk$public$poitem$sku_id;
CREATE INDEX idx_fk$public$poitem$sku_id ON public."poitem"(sku_id);	


ALTER TABLE public."poitem"
	ADD CONSTRAINT fk$public$poitem$uom_id
	FOREIGN KEY (uom_id)
	REFERENCES public."uom"(uom_id);


-- Add As Index, drop dulu jika sudah ada
DROP INDEX IF EXISTS public.idx_fk$public$poitem$uom_id;
CREATE INDEX idx_fk$public$poitem$uom_id ON public."poitem"(uom_id);	

	


-- =============================================
-- UNIQUE INDEX
-- =============================================