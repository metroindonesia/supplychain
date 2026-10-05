-- regtype.sql


/* =============================================
 * CREATE TABLE public."regtypebrand"
 * ============================================*/
create table public."regtypebrand" (
	regtypebrand_id bigint not null,
	constraint regtypebrand_pk primary key (regtypebrand_id)
);
comment on table public."regtypebrand" is '';	


-- =============================================
-- FIELD: brand_id int
-- =============================================
-- ADD brand_id
alter table public."regtypebrand" add brand_id int not null default 0;
comment on column public."regtypebrand".brand_id is '';

-- MODIFY brand_id
alter table public."regtypebrand"
	alter column brand_id type int,
	ALTER COLUMN brand_id SET DEFAULT 0,
	ALTER COLUMN brand_id SET NOT NULL;
comment on column public."regtypebrand".brand_id is '';


-- =============================================
-- FIELD: regtypebrand_data json
-- =============================================
-- ADD regtypebrand_data
alter table public."regtypebrand" add regtypebrand_data json  ;
comment on column public."regtypebrand".regtypebrand_data is '';

-- MODIFY regtypebrand_data
alter table public."regtypebrand"
	alter column regtypebrand_data type json,
	ALTER COLUMN regtypebrand_data DROP DEFAULT,
	ALTER COLUMN regtypebrand_data DROP NOT NULL;
comment on column public."regtypebrand".regtypebrand_data is '';


-- =============================================
-- FIELD: regtype_id int
-- =============================================
-- ADD regtype_id
alter table public."regtypebrand" add regtype_id int  ;
comment on column public."regtypebrand".regtype_id is '';

-- MODIFY regtype_id
alter table public."regtypebrand"
	alter column regtype_id type int,
	ALTER COLUMN regtype_id DROP DEFAULT,
	ALTER COLUMN regtype_id DROP NOT NULL;
comment on column public."regtypebrand".regtype_id is '';


-- =============================================
-- FIELD: _createby integer
-- =============================================
-- ADD _createby
alter table public."regtypebrand" add _createby integer not null ;
comment on column public."regtypebrand"._createby is 'user yang pertama kali membuat record ini';

-- MODIFY _createby
alter table public."regtypebrand"
	alter column _createby type integer,
	ALTER COLUMN _createby DROP DEFAULT,
	ALTER COLUMN _createby SET NOT NULL;
comment on column public."regtypebrand"._createby is 'user yang pertama kali membuat record ini';


-- =============================================
-- FIELD: _createdate timestamp with time zone
-- =============================================
-- ADD _createdate
alter table public."regtypebrand" add _createdate timestamp with time zone not null default now();
comment on column public."regtypebrand"._createdate is 'waktu record dibuat pertama kali';

-- MODIFY _createdate
alter table public."regtypebrand"
	alter column _createdate type timestamp with time zone,
	ALTER COLUMN _createdate SET DEFAULT now(),
	ALTER COLUMN _createdate SET NOT NULL;
comment on column public."regtypebrand"._createdate is 'waktu record dibuat pertama kali';


-- =============================================
-- FIELD: _modifyby integer
-- =============================================
-- ADD _modifyby
alter table public."regtypebrand" add _modifyby integer  ;
comment on column public."regtypebrand"._modifyby is 'user yang terakhir modifikasi record ini';

-- MODIFY _modifyby
alter table public."regtypebrand"
	alter column _modifyby type integer,
	ALTER COLUMN _modifyby DROP DEFAULT,
	ALTER COLUMN _modifyby DROP NOT NULL;
comment on column public."regtypebrand"._modifyby is 'user yang terakhir modifikasi record ini';


-- =============================================
-- FIELD: _modifydate timestamp with time zone
-- =============================================
-- ADD _modifydate
alter table public."regtypebrand" add _modifydate timestamp with time zone  ;
comment on column public."regtypebrand"._modifydate is 'waktu terakhir record dimodifikasi';

-- MODIFY _modifydate
alter table public."regtypebrand"
	alter column _modifydate type timestamp with time zone,
	ALTER COLUMN _modifydate DROP DEFAULT,
	ALTER COLUMN _modifydate DROP NOT NULL;
comment on column public."regtypebrand"._modifydate is 'waktu terakhir record dimodifikasi';


-- =============================================
-- FIELD: _timestamp timestamp with time zone
-- =============================================
-- ADD _timestamp
alter table public."regtypebrand" add _timestamp timestamp with time zone not null default now();
comment on column public."regtypebrand"._timestamp is 'data timestamp';

-- MODIFY _timestamp
alter table public."regtypebrand"
	alter column _timestamp type timestamp with time zone,
	ALTER COLUMN _timestamp SET DEFAULT now(),
	ALTER COLUMN _timestamp SET NOT NULL;
comment on column public."regtypebrand"._timestamp is 'data timestamp';


-- =============================================
-- INDEX
-- =============================================
DROP INDEX IF EXISTS public.idx$public$regtypebrand$_timestamp;
CREATE INDEX idx$public$regtypebrand$_timestamp ON public.regtypebrand (_timestamp);


-- =============================================
-- FOREIGN KEY CONSTRAINT
-- =============================================
-- Drop Existing Foreign Key Constraint 
ALTER TABLE public."regtypebrand" DROP CONSTRAINT fk$public$regtypebrand$brand_id;


-- Add Foreign Key Constraint  
ALTER TABLE public."regtypebrand"
	ADD CONSTRAINT fk$public$regtypebrand$brand_id
	FOREIGN KEY (brand_id)
	REFERENCES public."brand"(brand_id);


-- Add As Index, drop dulu jika sudah ada
DROP INDEX IF EXISTS public.idx_fk$public$regtypebrand$brand_id;
CREATE INDEX idx_fk$public$regtypebrand$brand_id ON public."regtypebrand"(brand_id);	

	


-- =============================================
-- UNIQUE INDEX
-- =============================================
-- Drop existing unique index 
alter table public."regtypebrand"
	drop constraint uq$public$regtypebrand$regtypebrand_pair;
	

-- Add unique index 
alter table  public."regtypebrand"
	add constraint uq$public$regtypebrand$regtypebrand_pair unique (regtype_id, brand_id); 

