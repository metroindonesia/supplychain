-- sku.sql


/* =============================================
 * CREATE TABLE public."sku"
 * ============================================*/
create table public."sku" (
	sku_id bigint not null,
	constraint sku_pk primary key (sku_id)
);
comment on table public."sku" is '';	


-- =============================================
-- FIELD: sku_isdisabled boolean
-- =============================================
-- ADD sku_isdisabled
alter table public."sku" add sku_isdisabled boolean not null default false;
comment on column public."sku".sku_isdisabled is '';

-- MODIFY sku_isdisabled
alter table public."sku"
	alter column sku_isdisabled type boolean,
	ALTER COLUMN sku_isdisabled SET DEFAULT false,
	ALTER COLUMN sku_isdisabled SET NOT NULL;
comment on column public."sku".sku_isdisabled is '';


-- =============================================
-- FIELD: sku_isopentobuy boolean
-- =============================================
-- ADD sku_isopentobuy
alter table public."sku" add sku_isopentobuy boolean not null default true;
comment on column public."sku".sku_isopentobuy is '';

-- MODIFY sku_isopentobuy
alter table public."sku"
	alter column sku_isopentobuy type boolean,
	ALTER COLUMN sku_isopentobuy SET DEFAULT true,
	ALTER COLUMN sku_isopentobuy SET NOT NULL;
comment on column public."sku".sku_isopentobuy is '';


-- =============================================
-- FIELD: sku_code text
-- =============================================
-- ADD sku_code
alter table public."sku" add sku_code text  ;
comment on column public."sku".sku_code is '';

-- MODIFY sku_code
alter table public."sku"
	alter column sku_code type text,
	ALTER COLUMN sku_code DROP DEFAULT,
	ALTER COLUMN sku_code DROP NOT NULL;
comment on column public."sku".sku_code is '';


-- =============================================
-- FIELD: brand_id int
-- =============================================
-- ADD brand_id
alter table public."sku" add brand_id int  ;
comment on column public."sku".brand_id is '';

-- MODIFY brand_id
alter table public."sku"
	alter column brand_id type int,
	ALTER COLUMN brand_id DROP DEFAULT,
	ALTER COLUMN brand_id DROP NOT NULL;
comment on column public."sku".brand_id is '';


-- =============================================
-- FIELD: product_id bigint
-- =============================================
-- ADD product_id
alter table public."sku" add product_id bigint  ;
comment on column public."sku".product_id is '';

-- MODIFY product_id
alter table public."sku"
	alter column product_id type bigint,
	ALTER COLUMN product_id DROP DEFAULT,
	ALTER COLUMN product_id DROP NOT NULL;
comment on column public."sku".product_id is '';


-- =============================================
-- FIELD: model_id int
-- =============================================
-- ADD model_id
alter table public."sku" add model_id int  ;
comment on column public."sku".model_id is '';

-- MODIFY model_id
alter table public."sku"
	alter column model_id type int,
	ALTER COLUMN model_id DROP DEFAULT,
	ALTER COLUMN model_id DROP NOT NULL;
comment on column public."sku".model_id is '';


-- =============================================
-- FIELD: variancetype_id smallint
-- =============================================
-- ADD variancetype_id
alter table public."sku" add variancetype_id smallint  ;
comment on column public."sku".variancetype_id is '';

-- MODIFY variancetype_id
alter table public."sku"
	alter column variancetype_id type smallint,
	ALTER COLUMN variancetype_id DROP DEFAULT,
	ALTER COLUMN variancetype_id DROP NOT NULL;
comment on column public."sku".variancetype_id is '';


-- =============================================
-- FIELD: skuopt_id smallint
-- =============================================
-- ADD skuopt_id
alter table public."sku" add skuopt_id smallint  ;
comment on column public."sku".skuopt_id is '';

-- MODIFY skuopt_id
alter table public."sku"
	alter column skuopt_id type smallint,
	ALTER COLUMN skuopt_id DROP DEFAULT,
	ALTER COLUMN skuopt_id DROP NOT NULL;
comment on column public."sku".skuopt_id is '';


-- =============================================
-- FIELD: product_code text
-- =============================================
-- ADD product_code
alter table public."sku" add product_code text not null default '';
comment on column public."sku".product_code is '';

-- MODIFY product_code
alter table public."sku"
	alter column product_code type text,
	ALTER COLUMN product_code SET DEFAULT '',
	ALTER COLUMN product_code SET NOT NULL;
comment on column public."sku".product_code is '';


-- =============================================
-- FIELD: variance_code text
-- =============================================
-- ADD variance_code
alter table public."sku" add variance_code text not null default '';
comment on column public."sku".variance_code is '';

-- MODIFY variance_code
alter table public."sku"
	alter column variance_code type text,
	ALTER COLUMN variance_code SET DEFAULT '',
	ALTER COLUMN variance_code SET NOT NULL;
comment on column public."sku".variance_code is '';


-- =============================================
-- FIELD: skuopt_code text
-- =============================================
-- ADD skuopt_code
alter table public."sku" add skuopt_code text not null default '';
comment on column public."sku".skuopt_code is '';

-- MODIFY skuopt_code
alter table public."sku"
	alter column skuopt_code type text,
	ALTER COLUMN skuopt_code SET DEFAULT '',
	ALTER COLUMN skuopt_code SET NOT NULL;
comment on column public."sku".skuopt_code is '';


-- =============================================
-- FIELD: sku_name text
-- =============================================
-- ADD sku_name
alter table public."sku" add sku_name text  ;
comment on column public."sku".sku_name is '';

-- MODIFY sku_name
alter table public."sku"
	alter column sku_name type text,
	ALTER COLUMN sku_name DROP DEFAULT,
	ALTER COLUMN sku_name DROP NOT NULL;
comment on column public."sku".sku_name is '';


-- =============================================
-- FIELD: origro text
-- =============================================
-- ADD origro
alter table public."sku" add origro text  ;
comment on column public."sku".origro is 'kode/nama kelompok original dari brand/principal';

-- MODIFY origro
alter table public."sku"
	alter column origro type text,
	ALTER COLUMN origro DROP DEFAULT,
	ALTER COLUMN origro DROP NOT NULL;
comment on column public."sku".origro is 'kode/nama kelompok original dari brand/principal';


-- =============================================
-- FIELD: orictg text
-- =============================================
-- ADD orictg
alter table public."sku" add orictg text  ;
comment on column public."sku".orictg is 'kode/nama kelompok original dari brand/principal';

-- MODIFY orictg
alter table public."sku"
	alter column orictg type text,
	ALTER COLUMN orictg DROP DEFAULT,
	ALTER COLUMN orictg DROP NOT NULL;
comment on column public."sku".orictg is 'kode/nama kelompok original dari brand/principal';


-- =============================================
-- FIELD: gro_id int
-- =============================================
-- ADD gro_id
alter table public."sku" add gro_id int  ;
comment on column public."sku".gro_id is '';

-- MODIFY gro_id
alter table public."sku"
	alter column gro_id type int,
	ALTER COLUMN gro_id DROP DEFAULT,
	ALTER COLUMN gro_id DROP NOT NULL;
comment on column public."sku".gro_id is '';


-- =============================================
-- FIELD: ctg_id int
-- =============================================
-- ADD ctg_id
alter table public."sku" add ctg_id int  ;
comment on column public."sku".ctg_id is '';

-- MODIFY ctg_id
alter table public."sku"
	alter column ctg_id type int,
	ALTER COLUMN ctg_id DROP DEFAULT,
	ALTER COLUMN ctg_id DROP NOT NULL;
comment on column public."sku".ctg_id is '';


-- =============================================
-- FIELD: uom_id smallint
-- =============================================
-- ADD uom_id
alter table public."sku" add uom_id smallint  ;
comment on column public."sku".uom_id is '';

-- MODIFY uom_id
alter table public."sku"
	alter column uom_id type smallint,
	ALTER COLUMN uom_id DROP DEFAULT,
	ALTER COLUMN uom_id DROP NOT NULL;
comment on column public."sku".uom_id is '';


-- =============================================
-- FIELD: sea_id smallint
-- =============================================
-- ADD sea_id
alter table public."sku" add sea_id smallint  ;
comment on column public."sku".sea_id is '';

-- MODIFY sea_id
alter table public."sku"
	alter column sea_id type smallint,
	ALTER COLUMN sea_id DROP DEFAULT,
	ALTER COLUMN sea_id DROP NOT NULL;
comment on column public."sku".sea_id is '';


-- =============================================
-- FIELD: iscf boolean
-- =============================================
-- ADD iscf
alter table public."sku" add iscf boolean not null default false;
comment on column public."sku".iscf is '';

-- MODIFY iscf
alter table public."sku"
	alter column iscf type boolean,
	ALTER COLUMN iscf SET DEFAULT false,
	ALTER COLUMN iscf SET NOT NULL;
comment on column public."sku".iscf is '';


-- =============================================
-- FIELD: _createby integer
-- =============================================
-- ADD _createby
alter table public."sku" add _createby integer not null ;
comment on column public."sku"._createby is 'user yang pertama kali membuat record ini';

-- MODIFY _createby
alter table public."sku"
	alter column _createby type integer,
	ALTER COLUMN _createby DROP DEFAULT,
	ALTER COLUMN _createby SET NOT NULL;
comment on column public."sku"._createby is 'user yang pertama kali membuat record ini';


-- =============================================
-- FIELD: _createdate timestamp with time zone
-- =============================================
-- ADD _createdate
alter table public."sku" add _createdate timestamp with time zone not null default now();
comment on column public."sku"._createdate is 'waktu record dibuat pertama kali';

-- MODIFY _createdate
alter table public."sku"
	alter column _createdate type timestamp with time zone,
	ALTER COLUMN _createdate SET DEFAULT now(),
	ALTER COLUMN _createdate SET NOT NULL;
comment on column public."sku"._createdate is 'waktu record dibuat pertama kali';


-- =============================================
-- FIELD: _modifyby integer
-- =============================================
-- ADD _modifyby
alter table public."sku" add _modifyby integer  ;
comment on column public."sku"._modifyby is 'user yang terakhir modifikasi record ini';

-- MODIFY _modifyby
alter table public."sku"
	alter column _modifyby type integer,
	ALTER COLUMN _modifyby DROP DEFAULT,
	ALTER COLUMN _modifyby DROP NOT NULL;
comment on column public."sku"._modifyby is 'user yang terakhir modifikasi record ini';


-- =============================================
-- FIELD: _modifydate timestamp with time zone
-- =============================================
-- ADD _modifydate
alter table public."sku" add _modifydate timestamp with time zone  ;
comment on column public."sku"._modifydate is 'waktu terakhir record dimodifikasi';

-- MODIFY _modifydate
alter table public."sku"
	alter column _modifydate type timestamp with time zone,
	ALTER COLUMN _modifydate DROP DEFAULT,
	ALTER COLUMN _modifydate DROP NOT NULL;
comment on column public."sku"._modifydate is 'waktu terakhir record dimodifikasi';


-- =============================================
-- FIELD: _timestamp timestamp with time zone
-- =============================================
-- ADD _timestamp
alter table public."sku" add _timestamp timestamp with time zone not null default now();
comment on column public."sku"._timestamp is 'data timestamp';

-- MODIFY _timestamp
alter table public."sku"
	alter column _timestamp type timestamp with time zone,
	ALTER COLUMN _timestamp SET DEFAULT now(),
	ALTER COLUMN _timestamp SET NOT NULL;
comment on column public."sku"._timestamp is 'data timestamp';


-- =============================================
-- INDEX
-- =============================================
DROP INDEX IF EXISTS public.idx$public$sku$_timestamp;
CREATE INDEX idx$public$sku$_timestamp ON public.sku (_timestamp);


-- =============================================
-- FOREIGN KEY CONSTRAINT
-- =============================================
-- Drop Existing Foreign Key Constraint 
ALTER TABLE public."sku" DROP CONSTRAINT fk$public$sku$variancetype_id;
ALTER TABLE public."sku" DROP CONSTRAINT fk$public$sku$skuopt_id;
ALTER TABLE public."sku" DROP CONSTRAINT fk$public$sku$gro_id;
ALTER TABLE public."sku" DROP CONSTRAINT fk$public$sku$ctg_id;
ALTER TABLE public."sku" DROP CONSTRAINT fk$public$sku$uom_id;
ALTER TABLE public."sku" DROP CONSTRAINT fk$public$sku$sea_id;
ALTER TABLE public."sku" DROP CONSTRAINT fk$public$sku$brand_id;
ALTER TABLE public."sku" DROP CONSTRAINT fk$public$sku$product_id;
ALTER TABLE public."sku" DROP CONSTRAINT fk$public$sku$model_id;


-- Add Foreign Key Constraint  
ALTER TABLE public."sku"
	ADD CONSTRAINT fk$public$sku$brand_id
	FOREIGN KEY (brand_id)
	REFERENCES public."brand"(brand_id);


-- Add As Index, drop dulu jika sudah ada
DROP INDEX IF EXISTS public.idx_fk$public$sku$brand_id;
CREATE INDEX idx_fk$public$sku$brand_id ON public."sku"(brand_id);	


ALTER TABLE public."sku"
	ADD CONSTRAINT fk$public$sku$product_id
	FOREIGN KEY (product_id)
	REFERENCES public."product"(product_id);


-- Add As Index, drop dulu jika sudah ada
DROP INDEX IF EXISTS public.idx_fk$public$sku$product_id;
CREATE INDEX idx_fk$public$sku$product_id ON public."sku"(product_id);	


ALTER TABLE public."sku"
	ADD CONSTRAINT fk$public$sku$model_id
	FOREIGN KEY (model_id)
	REFERENCES public."model"(model_id);


-- Add As Index, drop dulu jika sudah ada
DROP INDEX IF EXISTS public.idx_fk$public$sku$model_id;
CREATE INDEX idx_fk$public$sku$model_id ON public."sku"(model_id);	


ALTER TABLE public."sku"
	ADD CONSTRAINT fk$public$sku$variancetype_id
	FOREIGN KEY (variancetype_id)
	REFERENCES public."variancetype"(variancetype_id);


-- Add As Index, drop dulu jika sudah ada
DROP INDEX IF EXISTS public.idx_fk$public$sku$variancetype_id;
CREATE INDEX idx_fk$public$sku$variancetype_id ON public."sku"(variancetype_id);	


ALTER TABLE public."sku"
	ADD CONSTRAINT fk$public$sku$skuopt_id
	FOREIGN KEY (skuopt_id)
	REFERENCES public."skuopt"(skuopt_id);


-- Add As Index, drop dulu jika sudah ada
DROP INDEX IF EXISTS public.idx_fk$public$sku$skuopt_id;
CREATE INDEX idx_fk$public$sku$skuopt_id ON public."sku"(skuopt_id);	


ALTER TABLE public."sku"
	ADD CONSTRAINT fk$public$sku$gro_id
	FOREIGN KEY (gro_id)
	REFERENCES public."gro"(gro_id);


-- Add As Index, drop dulu jika sudah ada
DROP INDEX IF EXISTS public.idx_fk$public$sku$gro_id;
CREATE INDEX idx_fk$public$sku$gro_id ON public."sku"(gro_id);	


ALTER TABLE public."sku"
	ADD CONSTRAINT fk$public$sku$ctg_id
	FOREIGN KEY (ctg_id)
	REFERENCES public."ctg"(ctg_id);


-- Add As Index, drop dulu jika sudah ada
DROP INDEX IF EXISTS public.idx_fk$public$sku$ctg_id;
CREATE INDEX idx_fk$public$sku$ctg_id ON public."sku"(ctg_id);	


ALTER TABLE public."sku"
	ADD CONSTRAINT fk$public$sku$uom_id
	FOREIGN KEY (uom_id)
	REFERENCES public."uom"(uom_id);


-- Add As Index, drop dulu jika sudah ada
DROP INDEX IF EXISTS public.idx_fk$public$sku$uom_id;
CREATE INDEX idx_fk$public$sku$uom_id ON public."sku"(uom_id);	


ALTER TABLE public."sku"
	ADD CONSTRAINT fk$public$sku$sea_id
	FOREIGN KEY (sea_id)
	REFERENCES public."sea"(sea_id);


-- Add As Index, drop dulu jika sudah ada
DROP INDEX IF EXISTS public.idx_fk$public$sku$sea_id;
CREATE INDEX idx_fk$public$sku$sea_id ON public."sku"(sea_id);	

	


-- =============================================
-- UNIQUE INDEX
-- =============================================
-- Drop existing unique index 
alter table public."sku"
	drop constraint uq$public$sku$sku_pair;

alter table public."sku"
	drop constraint uq$public$sku$sku_code;
	

-- Add unique index 
alter table  public."sku"
	add constraint uq$public$sku$sku_code unique (brand_id, sku_code); 

alter table  public."sku"
	add constraint uq$public$sku$sku_pair unique (brand_id, product_code, variance_code); 

