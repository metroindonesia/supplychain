-- product.sql


/* =============================================
 * CREATE TABLE public."product"
 * ============================================*/
create table public."product" (
	product_id bigint not null,
	constraint product_pk primary key (product_id)
);
comment on table public."product" is '';	


-- =============================================
-- FIELD: product_isdisabled boolean
-- =============================================
-- ADD product_isdisabled
alter table public."product" add product_isdisabled boolean not null default false;
comment on column public."product".product_isdisabled is '';

-- MODIFY product_isdisabled
alter table public."product"
	alter column product_isdisabled type boolean,
	ALTER COLUMN product_isdisabled SET DEFAULT false,
	ALTER COLUMN product_isdisabled SET NOT NULL;
comment on column public."product".product_isdisabled is '';


-- =============================================
-- FIELD: product_code varchar(30)
-- =============================================
-- ADD product_code
alter table public."product" add product_code varchar(30)  ;
comment on column public."product".product_code is '';

-- MODIFY product_code
alter table public."product"
	alter column product_code type varchar(30),
	ALTER COLUMN product_code DROP DEFAULT,
	ALTER COLUMN product_code DROP NOT NULL;
comment on column public."product".product_code is '';


-- =============================================
-- FIELD: model_id int
-- =============================================
-- ADD model_id
alter table public."product" add model_id int  ;
comment on column public."product".model_id is '';

-- MODIFY model_id
alter table public."product"
	alter column model_id type int,
	ALTER COLUMN model_id DROP DEFAULT,
	ALTER COLUMN model_id DROP NOT NULL;
comment on column public."product".model_id is '';


-- =============================================
-- FIELD: product_name text
-- =============================================
-- ADD product_name
alter table public."product" add product_name text  ;
comment on column public."product".product_name is '';

-- MODIFY product_name
alter table public."product"
	alter column product_name type text,
	ALTER COLUMN product_name DROP DEFAULT,
	ALTER COLUMN product_name DROP NOT NULL;
comment on column public."product".product_name is '';


-- =============================================
-- FIELD: brand_id int
-- =============================================
-- ADD brand_id
alter table public."product" add brand_id int  ;
comment on column public."product".brand_id is '';

-- MODIFY brand_id
alter table public."product"
	alter column brand_id type int,
	ALTER COLUMN brand_id DROP DEFAULT,
	ALTER COLUMN brand_id DROP NOT NULL;
comment on column public."product".brand_id is '';


-- =============================================
-- FIELD: variancetype_id smallint
-- =============================================
-- ADD variancetype_id
alter table public."product" add variancetype_id smallint  ;
comment on column public."product".variancetype_id is '';

-- MODIFY variancetype_id
alter table public."product"
	alter column variancetype_id type smallint,
	ALTER COLUMN variancetype_id DROP DEFAULT,
	ALTER COLUMN variancetype_id DROP NOT NULL;
comment on column public."product".variancetype_id is '';


-- =============================================
-- FIELD: skuopt smallint
-- =============================================
-- ADD skuopt
alter table public."product" add skuopt smallint  ;
comment on column public."product".skuopt is '';

-- MODIFY skuopt
alter table public."product"
	alter column skuopt type smallint,
	ALTER COLUMN skuopt DROP DEFAULT,
	ALTER COLUMN skuopt DROP NOT NULL;
comment on column public."product".skuopt is '';


-- =============================================
-- FIELD: product_descr text
-- =============================================
-- ADD product_descr
alter table public."product" add product_descr text  ;
comment on column public."product".product_descr is '';

-- MODIFY product_descr
alter table public."product"
	alter column product_descr type text,
	ALTER COLUMN product_descr DROP DEFAULT,
	ALTER COLUMN product_descr DROP NOT NULL;
comment on column public."product".product_descr is '';


-- =============================================
-- FIELD: origro text
-- =============================================
-- ADD origro
alter table public."product" add origro text  ;
comment on column public."product".origro is '';

-- MODIFY origro
alter table public."product"
	alter column origro type text,
	ALTER COLUMN origro DROP DEFAULT,
	ALTER COLUMN origro DROP NOT NULL;
comment on column public."product".origro is '';


-- =============================================
-- FIELD: orictg text
-- =============================================
-- ADD orictg
alter table public."product" add orictg text  ;
comment on column public."product".orictg is '';

-- MODIFY orictg
alter table public."product"
	alter column orictg type text,
	ALTER COLUMN orictg DROP DEFAULT,
	ALTER COLUMN orictg DROP NOT NULL;
comment on column public."product".orictg is '';


-- =============================================
-- FIELD: gro_id int
-- =============================================
-- ADD gro_id
alter table public."product" add gro_id int  ;
comment on column public."product".gro_id is '';

-- MODIFY gro_id
alter table public."product"
	alter column gro_id type int,
	ALTER COLUMN gro_id DROP DEFAULT,
	ALTER COLUMN gro_id DROP NOT NULL;
comment on column public."product".gro_id is '';


-- =============================================
-- FIELD: ctg_id int
-- =============================================
-- ADD ctg_id
alter table public."product" add ctg_id int  ;
comment on column public."product".ctg_id is '';

-- MODIFY ctg_id
alter table public."product"
	alter column ctg_id type int,
	ALTER COLUMN ctg_id DROP DEFAULT,
	ALTER COLUMN ctg_id DROP NOT NULL;
comment on column public."product".ctg_id is '';


-- =============================================
-- FIELD: sea_id smallint
-- =============================================
-- ADD sea_id
alter table public."product" add sea_id smallint  ;
comment on column public."product".sea_id is '';

-- MODIFY sea_id
alter table public."product"
	alter column sea_id type smallint,
	ALTER COLUMN sea_id DROP DEFAULT,
	ALTER COLUMN sea_id DROP NOT NULL;
comment on column public."product".sea_id is '';


-- =============================================
-- FIELD: iscf boolean
-- =============================================
-- ADD iscf
alter table public."product" add iscf boolean not null default false;
comment on column public."product".iscf is '';

-- MODIFY iscf
alter table public."product"
	alter column iscf type boolean,
	ALTER COLUMN iscf SET DEFAULT false,
	ALTER COLUMN iscf SET NOT NULL;
comment on column public."product".iscf is '';


-- =============================================
-- FIELD: _createby integer
-- =============================================
-- ADD _createby
alter table public."product" add _createby integer not null ;
comment on column public."product"._createby is 'user yang pertama kali membuat record ini';

-- MODIFY _createby
alter table public."product"
	alter column _createby type integer,
	ALTER COLUMN _createby DROP DEFAULT,
	ALTER COLUMN _createby SET NOT NULL;
comment on column public."product"._createby is 'user yang pertama kali membuat record ini';


-- =============================================
-- FIELD: _createdate timestamp with time zone
-- =============================================
-- ADD _createdate
alter table public."product" add _createdate timestamp with time zone not null default now();
comment on column public."product"._createdate is 'waktu record dibuat pertama kali';

-- MODIFY _createdate
alter table public."product"
	alter column _createdate type timestamp with time zone,
	ALTER COLUMN _createdate SET DEFAULT now(),
	ALTER COLUMN _createdate SET NOT NULL;
comment on column public."product"._createdate is 'waktu record dibuat pertama kali';


-- =============================================
-- FIELD: _modifyby integer
-- =============================================
-- ADD _modifyby
alter table public."product" add _modifyby integer  ;
comment on column public."product"._modifyby is 'user yang terakhir modifikasi record ini';

-- MODIFY _modifyby
alter table public."product"
	alter column _modifyby type integer,
	ALTER COLUMN _modifyby DROP DEFAULT,
	ALTER COLUMN _modifyby DROP NOT NULL;
comment on column public."product"._modifyby is 'user yang terakhir modifikasi record ini';


-- =============================================
-- FIELD: _modifydate timestamp with time zone
-- =============================================
-- ADD _modifydate
alter table public."product" add _modifydate timestamp with time zone  ;
comment on column public."product"._modifydate is 'waktu terakhir record dimodifikasi';

-- MODIFY _modifydate
alter table public."product"
	alter column _modifydate type timestamp with time zone,
	ALTER COLUMN _modifydate DROP DEFAULT,
	ALTER COLUMN _modifydate DROP NOT NULL;
comment on column public."product"._modifydate is 'waktu terakhir record dimodifikasi';


-- =============================================
-- FIELD: _timestamp timestamp with time zone
-- =============================================
-- ADD _timestamp
alter table public."product" add _timestamp timestamp with time zone not null default now();
comment on column public."product"._timestamp is 'data timestamp';

-- MODIFY _timestamp
alter table public."product"
	alter column _timestamp type timestamp with time zone,
	ALTER COLUMN _timestamp SET DEFAULT now(),
	ALTER COLUMN _timestamp SET NOT NULL;
comment on column public."product"._timestamp is 'data timestamp';


-- =============================================
-- INDEX
-- =============================================
DROP INDEX IF EXISTS public.idx$public$product$_timestamp;
CREATE INDEX idx$public$product$_timestamp ON public.product (_timestamp);


-- =============================================
-- FOREIGN KEY CONSTRAINT
-- =============================================
-- Drop Existing Foreign Key Constraint 
ALTER TABLE public."product" DROP CONSTRAINT fk$public$product$model_id;
ALTER TABLE public."product" DROP CONSTRAINT fk$public$product$brand_id;
ALTER TABLE public."product" DROP CONSTRAINT fk$public$product$variancetype_id;
ALTER TABLE public."product" DROP CONSTRAINT fk$public$product$skuopt;
ALTER TABLE public."product" DROP CONSTRAINT fk$public$product$gro_id;
ALTER TABLE public."product" DROP CONSTRAINT fk$public$product$ctg_id;
ALTER TABLE public."product" DROP CONSTRAINT fk$public$product$sea_id;


-- Add Foreign Key Constraint  
ALTER TABLE public."product"
	ADD CONSTRAINT fk$public$product$model_id
	FOREIGN KEY (model_id)
	REFERENCES public."model"(model_id);


-- Add As Index, drop dulu jika sudah ada
DROP INDEX IF EXISTS public.idx_fk$public$product$model_id;
CREATE INDEX idx_fk$public$product$model_id ON public."product"(model_id);	


ALTER TABLE public."product"
	ADD CONSTRAINT fk$public$product$brand_id
	FOREIGN KEY (brand_id)
	REFERENCES public."brand"(brand_id);


-- Add As Index, drop dulu jika sudah ada
DROP INDEX IF EXISTS public.idx_fk$public$product$brand_id;
CREATE INDEX idx_fk$public$product$brand_id ON public."product"(brand_id);	


ALTER TABLE public."product"
	ADD CONSTRAINT fk$public$product$variancetype_id
	FOREIGN KEY (variancetype_id)
	REFERENCES public."variancetype"(variancetype_id);


-- Add As Index, drop dulu jika sudah ada
DROP INDEX IF EXISTS public.idx_fk$public$product$variancetype_id;
CREATE INDEX idx_fk$public$product$variancetype_id ON public."product"(variancetype_id);	


ALTER TABLE public."product"
	ADD CONSTRAINT fk$public$product$skuopt
	FOREIGN KEY (skuopt)
	REFERENCES public."skuopt"(skuopt_id);


-- Add As Index, drop dulu jika sudah ada
DROP INDEX IF EXISTS public.idx_fk$public$product$skuopt;
CREATE INDEX idx_fk$public$product$skuopt ON public."product"(skuopt);	


ALTER TABLE public."product"
	ADD CONSTRAINT fk$public$product$gro_id
	FOREIGN KEY (gro_id)
	REFERENCES public."gro"(gro_id);


-- Add As Index, drop dulu jika sudah ada
DROP INDEX IF EXISTS public.idx_fk$public$product$gro_id;
CREATE INDEX idx_fk$public$product$gro_id ON public."product"(gro_id);	


ALTER TABLE public."product"
	ADD CONSTRAINT fk$public$product$ctg_id
	FOREIGN KEY (ctg_id)
	REFERENCES public."ctg"(ctg_id);


-- Add As Index, drop dulu jika sudah ada
DROP INDEX IF EXISTS public.idx_fk$public$product$ctg_id;
CREATE INDEX idx_fk$public$product$ctg_id ON public."product"(ctg_id);	


ALTER TABLE public."product"
	ADD CONSTRAINT fk$public$product$sea_id
	FOREIGN KEY (sea_id)
	REFERENCES public."sea"(sea_id);


-- Add As Index, drop dulu jika sudah ada
DROP INDEX IF EXISTS public.idx_fk$public$product$sea_id;
CREATE INDEX idx_fk$public$product$sea_id ON public."product"(sea_id);	

	


-- =============================================
-- UNIQUE INDEX
-- =============================================
-- Drop existing unique index 
alter table public."product"
	drop constraint uq$public$product$product_code;
	

-- Add unique index 
alter table  public."product"
	add constraint uq$public$product$product_code unique (brand_id, product_code); 

