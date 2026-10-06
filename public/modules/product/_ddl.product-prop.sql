-- product.sql


/* =============================================
 * CREATE TABLE public."productprop"
 * ============================================*/
create table public."productprop" (
	productprop_id bigint not null,
	constraint productprop_pk primary key (productprop_id)
);
comment on table public."productprop" is '';	


-- =============================================
-- FIELD: prop_id smallint
-- =============================================
-- ADD prop_id
alter table public."productprop" add prop_id smallint  ;
comment on column public."productprop".prop_id is '';

-- MODIFY prop_id
alter table public."productprop"
	alter column prop_id type smallint,
	ALTER COLUMN prop_id DROP DEFAULT,
	ALTER COLUMN prop_id DROP NOT NULL;
comment on column public."productprop".prop_id is '';


-- =============================================
-- FIELD: prop_value text
-- =============================================
-- ADD prop_value
alter table public."productprop" add prop_value text  ;
comment on column public."productprop".prop_value is '';

-- MODIFY prop_value
alter table public."productprop"
	alter column prop_value type text,
	ALTER COLUMN prop_value DROP DEFAULT,
	ALTER COLUMN prop_value DROP NOT NULL;
comment on column public."productprop".prop_value is '';


-- =============================================
-- FIELD: prop_data json
-- =============================================
-- ADD prop_data
alter table public."productprop" add prop_data json  ;
comment on column public."productprop".prop_data is '';

-- MODIFY prop_data
alter table public."productprop"
	alter column prop_data type json,
	ALTER COLUMN prop_data DROP DEFAULT,
	ALTER COLUMN prop_data DROP NOT NULL;
comment on column public."productprop".prop_data is '';


-- =============================================
-- FIELD: product_id bigint
-- =============================================
-- ADD product_id
alter table public."productprop" add product_id bigint  ;
comment on column public."productprop".product_id is '';

-- MODIFY product_id
alter table public."productprop"
	alter column product_id type bigint,
	ALTER COLUMN product_id DROP DEFAULT,
	ALTER COLUMN product_id DROP NOT NULL;
comment on column public."productprop".product_id is '';


-- =============================================
-- FIELD: _createby integer
-- =============================================
-- ADD _createby
alter table public."productprop" add _createby integer not null ;
comment on column public."productprop"._createby is 'user yang pertama kali membuat record ini';

-- MODIFY _createby
alter table public."productprop"
	alter column _createby type integer,
	ALTER COLUMN _createby DROP DEFAULT,
	ALTER COLUMN _createby SET NOT NULL;
comment on column public."productprop"._createby is 'user yang pertama kali membuat record ini';


-- =============================================
-- FIELD: _createdate timestamp with time zone
-- =============================================
-- ADD _createdate
alter table public."productprop" add _createdate timestamp with time zone not null default now();
comment on column public."productprop"._createdate is 'waktu record dibuat pertama kali';

-- MODIFY _createdate
alter table public."productprop"
	alter column _createdate type timestamp with time zone,
	ALTER COLUMN _createdate SET DEFAULT now(),
	ALTER COLUMN _createdate SET NOT NULL;
comment on column public."productprop"._createdate is 'waktu record dibuat pertama kali';


-- =============================================
-- FIELD: _modifyby integer
-- =============================================
-- ADD _modifyby
alter table public."productprop" add _modifyby integer  ;
comment on column public."productprop"._modifyby is 'user yang terakhir modifikasi record ini';

-- MODIFY _modifyby
alter table public."productprop"
	alter column _modifyby type integer,
	ALTER COLUMN _modifyby DROP DEFAULT,
	ALTER COLUMN _modifyby DROP NOT NULL;
comment on column public."productprop"._modifyby is 'user yang terakhir modifikasi record ini';


-- =============================================
-- FIELD: _modifydate timestamp with time zone
-- =============================================
-- ADD _modifydate
alter table public."productprop" add _modifydate timestamp with time zone  ;
comment on column public."productprop"._modifydate is 'waktu terakhir record dimodifikasi';

-- MODIFY _modifydate
alter table public."productprop"
	alter column _modifydate type timestamp with time zone,
	ALTER COLUMN _modifydate DROP DEFAULT,
	ALTER COLUMN _modifydate DROP NOT NULL;
comment on column public."productprop"._modifydate is 'waktu terakhir record dimodifikasi';


-- =============================================
-- FIELD: _timestamp timestamp with time zone
-- =============================================
-- ADD _timestamp
alter table public."productprop" add _timestamp timestamp with time zone not null default now();
comment on column public."productprop"._timestamp is 'data timestamp';

-- MODIFY _timestamp
alter table public."productprop"
	alter column _timestamp type timestamp with time zone,
	ALTER COLUMN _timestamp SET DEFAULT now(),
	ALTER COLUMN _timestamp SET NOT NULL;
comment on column public."productprop"._timestamp is 'data timestamp';


-- =============================================
-- INDEX
-- =============================================
DROP INDEX IF EXISTS public.idx$public$productprop$_timestamp;
CREATE INDEX idx$public$productprop$_timestamp ON public.productprop (_timestamp);


-- =============================================
-- FOREIGN KEY CONSTRAINT
-- =============================================
-- Drop Existing Foreign Key Constraint 
ALTER TABLE public."productprop" DROP CONSTRAINT fk$public$productprop$prop_id;


-- Add Foreign Key Constraint  
ALTER TABLE public."productprop"
	ADD CONSTRAINT fk$public$productprop$prop_id
	FOREIGN KEY (prop_id)
	REFERENCES public."prop"(prop_id);


-- Add As Index, drop dulu jika sudah ada
DROP INDEX IF EXISTS public.idx_fk$public$productprop$prop_id;
CREATE INDEX idx_fk$public$productprop$prop_id ON public."productprop"(prop_id);	

	


-- =============================================
-- UNIQUE INDEX
-- =============================================
-- Drop existing unique index 
alter table public."productprop"
	drop constraint uq$public$productprop$productprop_pair;
	

-- Add unique index 
alter table  public."productprop"
	add constraint uq$public$productprop$productprop_pair unique (product_id, prop_id); 

