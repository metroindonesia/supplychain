-- movrv.sql


/* =============================================
 * CREATE TABLE public."movitem"
 * ============================================*/
create table public."movitem" (
	movitem_id bigint not null,
	constraint movitem_pk primary key (movitem_id)
);
comment on table public."movitem" is '';	


-- =============================================
-- FIELD: brand_id int
-- =============================================
-- ADD brand_id
alter table public."movitem" add brand_id int  ;
comment on column public."movitem".brand_id is '';

-- MODIFY brand_id
alter table public."movitem"
	alter column brand_id type int,
	ALTER COLUMN brand_id DROP DEFAULT,
	ALTER COLUMN brand_id DROP NOT NULL;
comment on column public."movitem".brand_id is '';


-- =============================================
-- FIELD: sku_id bigint
-- =============================================
-- ADD sku_id
alter table public."movitem" add sku_id bigint  ;
comment on column public."movitem".sku_id is '';

-- MODIFY sku_id
alter table public."movitem"
	alter column sku_id type bigint,
	ALTER COLUMN sku_id DROP DEFAULT,
	ALTER COLUMN sku_id DROP NOT NULL;
comment on column public."movitem".sku_id is '';


-- =============================================
-- FIELD: product_code text
-- =============================================
-- ADD product_code
alter table public."movitem" add product_code text  ;
comment on column public."movitem".product_code is '';

-- MODIFY product_code
alter table public."movitem"
	alter column product_code type text,
	ALTER COLUMN product_code DROP DEFAULT,
	ALTER COLUMN product_code DROP NOT NULL;
comment on column public."movitem".product_code is '';


-- =============================================
-- FIELD: variance_code text
-- =============================================
-- ADD variance_code
alter table public."movitem" add variance_code text  ;
comment on column public."movitem".variance_code is '';

-- MODIFY variance_code
alter table public."movitem"
	alter column variance_code type text,
	ALTER COLUMN variance_code DROP DEFAULT,
	ALTER COLUMN variance_code DROP NOT NULL;
comment on column public."movitem".variance_code is '';


-- =============================================
-- FIELD: skuopt_code text
-- =============================================
-- ADD skuopt_code
alter table public."movitem" add skuopt_code text  ;
comment on column public."movitem".skuopt_code is '';

-- MODIFY skuopt_code
alter table public."movitem"
	alter column skuopt_code type text,
	ALTER COLUMN skuopt_code DROP DEFAULT,
	ALTER COLUMN skuopt_code DROP NOT NULL;
comment on column public."movitem".skuopt_code is '';


-- =============================================
-- FIELD: sku_name text
-- =============================================
-- ADD sku_name
alter table public."movitem" add sku_name text  ;
comment on column public."movitem".sku_name is '';

-- MODIFY sku_name
alter table public."movitem"
	alter column sku_name type text,
	ALTER COLUMN sku_name DROP DEFAULT,
	ALTER COLUMN sku_name DROP NOT NULL;
comment on column public."movitem".sku_name is '';


-- =============================================
-- FIELD: movitem_qty decimal(9, 2)
-- =============================================
-- ADD movitem_qty
alter table public."movitem" add movitem_qty decimal(9, 2) not null default 0;
comment on column public."movitem".movitem_qty is '';

-- MODIFY movitem_qty
alter table public."movitem"
	alter column movitem_qty type decimal(9, 2),
	ALTER COLUMN movitem_qty SET DEFAULT 0,
	ALTER COLUMN movitem_qty SET NOT NULL;
comment on column public."movitem".movitem_qty is '';


-- =============================================
-- FIELD: movitem_qtysent decimal(9, 2)
-- =============================================
-- ADD movitem_qtysent
alter table public."movitem" add movitem_qtysent decimal(9, 2) not null default 0;
comment on column public."movitem".movitem_qtysent is '';

-- MODIFY movitem_qtysent
alter table public."movitem"
	alter column movitem_qtysent type decimal(9, 2),
	ALTER COLUMN movitem_qtysent SET DEFAULT 0,
	ALTER COLUMN movitem_qtysent SET NOT NULL;
comment on column public."movitem".movitem_qtysent is '';


-- =============================================
-- FIELD: movitem_qtyrecv decimal(9, 2)
-- =============================================
-- ADD movitem_qtyrecv
alter table public."movitem" add movitem_qtyrecv decimal(9, 2) not null default 0;
comment on column public."movitem".movitem_qtyrecv is '';

-- MODIFY movitem_qtyrecv
alter table public."movitem"
	alter column movitem_qtyrecv type decimal(9, 2),
	ALTER COLUMN movitem_qtyrecv SET DEFAULT 0,
	ALTER COLUMN movitem_qtyrecv SET NOT NULL;
comment on column public."movitem".movitem_qtyrecv is '';


-- =============================================
-- FIELD: movitem_fobvalue int
-- =============================================
-- ADD movitem_fobvalue
alter table public."movitem" add movitem_fobvalue int not null default 0;
comment on column public."movitem".movitem_fobvalue is '';

-- MODIFY movitem_fobvalue
alter table public."movitem"
	alter column movitem_fobvalue type int,
	ALTER COLUMN movitem_fobvalue SET DEFAULT 0,
	ALTER COLUMN movitem_fobvalue SET NOT NULL;
comment on column public."movitem".movitem_fobvalue is '';


-- =============================================
-- FIELD: movitem_rate decimal(9, 0)
-- =============================================
-- ADD movitem_rate
alter table public."movitem" add movitem_rate decimal(9, 0) not null default 0;
comment on column public."movitem".movitem_rate is '';

-- MODIFY movitem_rate
alter table public."movitem"
	alter column movitem_rate type decimal(9, 0),
	ALTER COLUMN movitem_rate SET DEFAULT 0,
	ALTER COLUMN movitem_rate SET NOT NULL;
comment on column public."movitem".movitem_rate is '';


-- =============================================
-- FIELD: curr_id smallint
-- =============================================
-- ADD curr_id
alter table public."movitem" add curr_id smallint  ;
comment on column public."movitem".curr_id is '';

-- MODIFY curr_id
alter table public."movitem"
	alter column curr_id type smallint,
	ALTER COLUMN curr_id DROP DEFAULT,
	ALTER COLUMN curr_id DROP NOT NULL;
comment on column public."movitem".curr_id is '';


-- =============================================
-- FIELD: movitem_fobidr decimal(18, 2)
-- =============================================
-- ADD movitem_fobidr
alter table public."movitem" add movitem_fobidr decimal(18, 2) not null default 0;
comment on column public."movitem".movitem_fobidr is '';

-- MODIFY movitem_fobidr
alter table public."movitem"
	alter column movitem_fobidr type decimal(18, 2),
	ALTER COLUMN movitem_fobidr SET DEFAULT 0,
	ALTER COLUMN movitem_fobidr SET NOT NULL;
comment on column public."movitem".movitem_fobidr is '';


-- =============================================
-- FIELD: movitem_addidr decimal(18, 2)
-- =============================================
-- ADD movitem_addidr
alter table public."movitem" add movitem_addidr decimal(18, 2) not null default 0;
comment on column public."movitem".movitem_addidr is '';

-- MODIFY movitem_addidr
alter table public."movitem"
	alter column movitem_addidr type decimal(18, 2),
	ALTER COLUMN movitem_addidr SET DEFAULT 0,
	ALTER COLUMN movitem_addidr SET NOT NULL;
comment on column public."movitem".movitem_addidr is '';


-- =============================================
-- FIELD: movitem_landedcost decimal(18, 2)
-- =============================================
-- ADD movitem_landedcost
alter table public."movitem" add movitem_landedcost decimal(18, 2) not null default 0;
comment on column public."movitem".movitem_landedcost is '';

-- MODIFY movitem_landedcost
alter table public."movitem"
	alter column movitem_landedcost type decimal(18, 2),
	ALTER COLUMN movitem_landedcost SET DEFAULT 0,
	ALTER COLUMN movitem_landedcost SET NOT NULL;
comment on column public."movitem".movitem_landedcost is '';


-- =============================================
-- FIELD: movitem_value decimal(18, 2)
-- =============================================
-- ADD movitem_value
alter table public."movitem" add movitem_value decimal(18, 2) not null default 0;
comment on column public."movitem".movitem_value is '';

-- MODIFY movitem_value
alter table public."movitem"
	alter column movitem_value type decimal(18, 2),
	ALTER COLUMN movitem_value SET DEFAULT 0,
	ALTER COLUMN movitem_value SET NOT NULL;
comment on column public."movitem".movitem_value is '';


-- =============================================
-- FIELD: poitem_id bigint
-- =============================================
-- ADD poitem_id
alter table public."movitem" add poitem_id bigint  ;
comment on column public."movitem".poitem_id is '';

-- MODIFY poitem_id
alter table public."movitem"
	alter column poitem_id type bigint,
	ALTER COLUMN poitem_id DROP DEFAULT,
	ALTER COLUMN poitem_id DROP NOT NULL;
comment on column public."movitem".poitem_id is '';


-- =============================================
-- FIELD: uom_id smallint
-- =============================================
-- ADD uom_id
alter table public."movitem" add uom_id smallint  ;
comment on column public."movitem".uom_id is '';

-- MODIFY uom_id
alter table public."movitem"
	alter column uom_id type smallint,
	ALTER COLUMN uom_id DROP DEFAULT,
	ALTER COLUMN uom_id DROP NOT NULL;
comment on column public."movitem".uom_id is '';


-- =============================================
-- FIELD: expdate date
-- =============================================
-- ADD expdate
alter table public."movitem" add expdate date  default now();
comment on column public."movitem".expdate is '';

-- MODIFY expdate
alter table public."movitem"
	alter column expdate type date,
	ALTER COLUMN expdate SET DEFAULT now(),
	ALTER COLUMN expdate DROP NOT NULL;
comment on column public."movitem".expdate is '';


-- =============================================
-- FIELD: batch_id int
-- =============================================
-- ADD batch_id
alter table public."movitem" add batch_id int  ;
comment on column public."movitem".batch_id is '';

-- MODIFY batch_id
alter table public."movitem"
	alter column batch_id type int,
	ALTER COLUMN batch_id DROP DEFAULT,
	ALTER COLUMN batch_id DROP NOT NULL;
comment on column public."movitem".batch_id is '';


-- =============================================
-- FIELD: unit_id int
-- =============================================
-- ADD unit_id
alter table public."movitem" add unit_id int  ;
comment on column public."movitem".unit_id is '';

-- MODIFY unit_id
alter table public."movitem"
	alter column unit_id type int,
	ALTER COLUMN unit_id DROP DEFAULT,
	ALTER COLUMN unit_id DROP NOT NULL;
comment on column public."movitem".unit_id is '';


-- =============================================
-- FIELD: mov_id bigint
-- =============================================
-- ADD mov_id
alter table public."movitem" add mov_id bigint  ;
comment on column public."movitem".mov_id is '';

-- MODIFY mov_id
alter table public."movitem"
	alter column mov_id type bigint,
	ALTER COLUMN mov_id DROP DEFAULT,
	ALTER COLUMN mov_id DROP NOT NULL;
comment on column public."movitem".mov_id is '';


-- =============================================
-- FIELD: _createby integer
-- =============================================
-- ADD _createby
alter table public."movitem" add _createby integer not null ;
comment on column public."movitem"._createby is 'user yang pertama kali membuat record ini';

-- MODIFY _createby
alter table public."movitem"
	alter column _createby type integer,
	ALTER COLUMN _createby DROP DEFAULT,
	ALTER COLUMN _createby SET NOT NULL;
comment on column public."movitem"._createby is 'user yang pertama kali membuat record ini';


-- =============================================
-- FIELD: _createdate timestamp with time zone
-- =============================================
-- ADD _createdate
alter table public."movitem" add _createdate timestamp with time zone not null default now();
comment on column public."movitem"._createdate is 'waktu record dibuat pertama kali';

-- MODIFY _createdate
alter table public."movitem"
	alter column _createdate type timestamp with time zone,
	ALTER COLUMN _createdate SET DEFAULT now(),
	ALTER COLUMN _createdate SET NOT NULL;
comment on column public."movitem"._createdate is 'waktu record dibuat pertama kali';


-- =============================================
-- FIELD: _modifyby integer
-- =============================================
-- ADD _modifyby
alter table public."movitem" add _modifyby integer  ;
comment on column public."movitem"._modifyby is 'user yang terakhir modifikasi record ini';

-- MODIFY _modifyby
alter table public."movitem"
	alter column _modifyby type integer,
	ALTER COLUMN _modifyby DROP DEFAULT,
	ALTER COLUMN _modifyby DROP NOT NULL;
comment on column public."movitem"._modifyby is 'user yang terakhir modifikasi record ini';


-- =============================================
-- FIELD: _modifydate timestamp with time zone
-- =============================================
-- ADD _modifydate
alter table public."movitem" add _modifydate timestamp with time zone  ;
comment on column public."movitem"._modifydate is 'waktu terakhir record dimodifikasi';

-- MODIFY _modifydate
alter table public."movitem"
	alter column _modifydate type timestamp with time zone,
	ALTER COLUMN _modifydate DROP DEFAULT,
	ALTER COLUMN _modifydate DROP NOT NULL;
comment on column public."movitem"._modifydate is 'waktu terakhir record dimodifikasi';


-- =============================================
-- FIELD: _timestamp timestamp with time zone
-- =============================================
-- ADD _timestamp
alter table public."movitem" add _timestamp timestamp with time zone not null default now();
comment on column public."movitem"._timestamp is 'data timestamp';

-- MODIFY _timestamp
alter table public."movitem"
	alter column _timestamp type timestamp with time zone,
	ALTER COLUMN _timestamp SET DEFAULT now(),
	ALTER COLUMN _timestamp SET NOT NULL;
comment on column public."movitem"._timestamp is 'data timestamp';


-- =============================================
-- INDEX
-- =============================================
DROP INDEX IF EXISTS public.idx$public$movitem$_timestamp;
CREATE INDEX idx$public$movitem$_timestamp ON public.movitem (_timestamp);


-- =============================================
-- FOREIGN KEY CONSTRAINT
-- =============================================
-- Drop Existing Foreign Key Constraint 
ALTER TABLE public."movitem" DROP CONSTRAINT fk$public$movitem$brand_id;
ALTER TABLE public."movitem" DROP CONSTRAINT fk$public$movitem$sku_id;
ALTER TABLE public."movitem" DROP CONSTRAINT fk$public$movitem$curr_id;
ALTER TABLE public."movitem" DROP CONSTRAINT fk$public$movitem$poitem_id;
ALTER TABLE public."movitem" DROP CONSTRAINT fk$public$movitem$uom_id;
ALTER TABLE public."movitem" DROP CONSTRAINT fk$public$movitem$batch_id;
ALTER TABLE public."movitem" DROP CONSTRAINT fk$public$movitem$unit_id;


-- Add Foreign Key Constraint  
ALTER TABLE public."movitem"
	ADD CONSTRAINT fk$public$movitem$brand_id
	FOREIGN KEY (brand_id)
	REFERENCES public."brand"(brand_id);


-- Add As Index, drop dulu jika sudah ada
DROP INDEX IF EXISTS public.idx_fk$public$movitem$brand_id;
CREATE INDEX idx_fk$public$movitem$brand_id ON public."movitem"(brand_id);	


ALTER TABLE public."movitem"
	ADD CONSTRAINT fk$public$movitem$sku_id
	FOREIGN KEY (sku_id)
	REFERENCES public."sku"(sku_id);


-- Add As Index, drop dulu jika sudah ada
DROP INDEX IF EXISTS public.idx_fk$public$movitem$sku_id;
CREATE INDEX idx_fk$public$movitem$sku_id ON public."movitem"(sku_id);	


ALTER TABLE public."movitem"
	ADD CONSTRAINT fk$public$movitem$curr_id
	FOREIGN KEY (curr_id)
	REFERENCES public."curr"(curr_id);


-- Add As Index, drop dulu jika sudah ada
DROP INDEX IF EXISTS public.idx_fk$public$movitem$curr_id;
CREATE INDEX idx_fk$public$movitem$curr_id ON public."movitem"(curr_id);	


ALTER TABLE public."movitem"
	ADD CONSTRAINT fk$public$movitem$poitem_id
	FOREIGN KEY (poitem_id)
	REFERENCES public."poitem"(poitem_id);


-- Add As Index, drop dulu jika sudah ada
DROP INDEX IF EXISTS public.idx_fk$public$movitem$poitem_id;
CREATE INDEX idx_fk$public$movitem$poitem_id ON public."movitem"(poitem_id);	


ALTER TABLE public."movitem"
	ADD CONSTRAINT fk$public$movitem$uom_id
	FOREIGN KEY (uom_id)
	REFERENCES public."uom"(uom_id);


-- Add As Index, drop dulu jika sudah ada
DROP INDEX IF EXISTS public.idx_fk$public$movitem$uom_id;
CREATE INDEX idx_fk$public$movitem$uom_id ON public."movitem"(uom_id);	


ALTER TABLE public."movitem"
	ADD CONSTRAINT fk$public$movitem$batch_id
	FOREIGN KEY (batch_id)
	REFERENCES public."batch"(batch_id);


-- Add As Index, drop dulu jika sudah ada
DROP INDEX IF EXISTS public.idx_fk$public$movitem$batch_id;
CREATE INDEX idx_fk$public$movitem$batch_id ON public."movitem"(batch_id);	


ALTER TABLE public."movitem"
	ADD CONSTRAINT fk$public$movitem$unit_id
	FOREIGN KEY (unit_id)
	REFERENCES public."unit"(unit_id);


-- Add As Index, drop dulu jika sudah ada
DROP INDEX IF EXISTS public.idx_fk$public$movitem$unit_id;
CREATE INDEX idx_fk$public$movitem$unit_id ON public."movitem"(unit_id);	

	


-- =============================================
-- UNIQUE INDEX
-- =============================================
-- Drop existing unique index 
alter table public."movitem"
	drop constraint uq$public$movitem$sku_id;

alter table public."movitem"
	drop constraint uq$public$movitem$poitem_id;
	

-- Add unique index 
alter table  public."movitem"
	add constraint uq$public$movitem$poitem_id unique (mov_id, poitem_id); 

alter table  public."movitem"
	add constraint uq$public$movitem$sku_id unique (mov_id, sku_id); 

