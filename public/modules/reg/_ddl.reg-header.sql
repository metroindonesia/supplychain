-- reg.sql


/* =============================================
 * CREATE TABLE public."reg"
 * ============================================*/
create table public."reg" (
	reg_id bigint not null,
	constraint reg_pk primary key (reg_id)
);
comment on table public."reg" is '';	


-- =============================================
-- FIELD: reg_doc text
-- =============================================
-- ADD reg_doc
alter table public."reg" add reg_doc text  ;
comment on column public."reg".reg_doc is '';

-- MODIFY reg_doc
alter table public."reg"
	alter column reg_doc type text,
	ALTER COLUMN reg_doc DROP DEFAULT,
	ALTER COLUMN reg_doc DROP NOT NULL;
comment on column public."reg".reg_doc is '';


-- =============================================
-- FIELD: _iscommit boolean
-- =============================================
-- ADD _iscommit
alter table public."reg" add _iscommit boolean not null default false;
comment on column public."reg"._iscommit is '';

-- MODIFY _iscommit
alter table public."reg"
	alter column _iscommit type boolean,
	ALTER COLUMN _iscommit SET DEFAULT false,
	ALTER COLUMN _iscommit SET NOT NULL;
comment on column public."reg"._iscommit is '';


-- =============================================
-- FIELD: _isgenerated boolean
-- =============================================
-- ADD _isgenerated
alter table public."reg" add _isgenerated boolean not null default false;
comment on column public."reg"._isgenerated is '';

-- MODIFY _isgenerated
alter table public."reg"
	alter column _isgenerated type boolean,
	ALTER COLUMN _isgenerated SET DEFAULT false,
	ALTER COLUMN _isgenerated SET NOT NULL;
comment on column public."reg"._isgenerated is '';


-- =============================================
-- FIELD: reg_version int
-- =============================================
-- ADD reg_version
alter table public."reg" add reg_version int not null default 0;
comment on column public."reg".reg_version is '';

-- MODIFY reg_version
alter table public."reg"
	alter column reg_version type int,
	ALTER COLUMN reg_version SET DEFAULT 0,
	ALTER COLUMN reg_version SET NOT NULL;
comment on column public."reg".reg_version is '';


-- =============================================
-- FIELD: brand_id int
-- =============================================
-- ADD brand_id
alter table public."reg" add brand_id int  ;
comment on column public."reg".brand_id is '';

-- MODIFY brand_id
alter table public."reg"
	alter column brand_id type int,
	ALTER COLUMN brand_id DROP DEFAULT,
	ALTER COLUMN brand_id DROP NOT NULL;
comment on column public."reg".brand_id is '';


-- =============================================
-- FIELD: regtype_id int
-- =============================================
-- ADD regtype_id
alter table public."reg" add regtype_id int  ;
comment on column public."reg".regtype_id is '';

-- MODIFY regtype_id
alter table public."reg"
	alter column regtype_id type int,
	ALTER COLUMN regtype_id DROP DEFAULT,
	ALTER COLUMN regtype_id DROP NOT NULL;
comment on column public."reg".regtype_id is '';


-- =============================================
-- FIELD: reg_descr text
-- =============================================
-- ADD reg_descr
alter table public."reg" add reg_descr text  ;
comment on column public."reg".reg_descr is '';

-- MODIFY reg_descr
alter table public."reg"
	alter column reg_descr type text,
	ALTER COLUMN reg_descr DROP DEFAULT,
	ALTER COLUMN reg_descr DROP NOT NULL;
comment on column public."reg".reg_descr is '';


-- =============================================
-- FIELD: sea_id smallint
-- =============================================
-- ADD sea_id
alter table public."reg" add sea_id smallint  ;
comment on column public."reg".sea_id is '';

-- MODIFY sea_id
alter table public."reg"
	alter column sea_id type smallint,
	ALTER COLUMN sea_id DROP DEFAULT,
	ALTER COLUMN sea_id DROP NOT NULL;
comment on column public."reg".sea_id is '';


-- =============================================
-- FIELD: unit_id int
-- =============================================
-- ADD unit_id
alter table public."reg" add unit_id int  ;
comment on column public."reg".unit_id is '';

-- MODIFY unit_id
alter table public."reg"
	alter column unit_id type int,
	ALTER COLUMN unit_id DROP DEFAULT,
	ALTER COLUMN unit_id DROP NOT NULL;
comment on column public."reg".unit_id is '';


-- =============================================
-- FIELD: _commitby bigint
-- =============================================
-- ADD _commitby
alter table public."reg" add _commitby bigint  ;
comment on column public."reg"._commitby is '';

-- MODIFY _commitby
alter table public."reg"
	alter column _commitby type bigint,
	ALTER COLUMN _commitby DROP DEFAULT,
	ALTER COLUMN _commitby DROP NOT NULL;
comment on column public."reg"._commitby is '';


-- =============================================
-- FIELD: _commitdate timestamp with time zone
-- =============================================
-- ADD _commitdate
alter table public."reg" add _commitdate timestamp with time zone  ;
comment on column public."reg"._commitdate is '';

-- MODIFY _commitdate
alter table public."reg"
	alter column _commitdate type timestamp with time zone,
	ALTER COLUMN _commitdate DROP DEFAULT,
	ALTER COLUMN _commitdate DROP NOT NULL;
comment on column public."reg"._commitdate is '';


-- =============================================
-- FIELD: _generateby bigint
-- =============================================
-- ADD _generateby
alter table public."reg" add _generateby bigint  ;
comment on column public."reg"._generateby is '';

-- MODIFY _generateby
alter table public."reg"
	alter column _generateby type bigint,
	ALTER COLUMN _generateby DROP DEFAULT,
	ALTER COLUMN _generateby DROP NOT NULL;
comment on column public."reg"._generateby is '';


-- =============================================
-- FIELD: _generatedate timestamp with time zone
-- =============================================
-- ADD _generatedate
alter table public."reg" add _generatedate timestamp with time zone  ;
comment on column public."reg"._generatedate is '';

-- MODIFY _generatedate
alter table public."reg"
	alter column _generatedate type timestamp with time zone,
	ALTER COLUMN _generatedate DROP DEFAULT,
	ALTER COLUMN _generatedate DROP NOT NULL;
comment on column public."reg"._generatedate is '';


-- =============================================
-- FIELD: _createby integer
-- =============================================
-- ADD _createby
alter table public."reg" add _createby integer not null ;
comment on column public."reg"._createby is 'user yang pertama kali membuat record ini';

-- MODIFY _createby
alter table public."reg"
	alter column _createby type integer,
	ALTER COLUMN _createby DROP DEFAULT,
	ALTER COLUMN _createby SET NOT NULL;
comment on column public."reg"._createby is 'user yang pertama kali membuat record ini';


-- =============================================
-- FIELD: _createdate timestamp with time zone
-- =============================================
-- ADD _createdate
alter table public."reg" add _createdate timestamp with time zone not null default now();
comment on column public."reg"._createdate is 'waktu record dibuat pertama kali';

-- MODIFY _createdate
alter table public."reg"
	alter column _createdate type timestamp with time zone,
	ALTER COLUMN _createdate SET DEFAULT now(),
	ALTER COLUMN _createdate SET NOT NULL;
comment on column public."reg"._createdate is 'waktu record dibuat pertama kali';


-- =============================================
-- FIELD: _modifyby integer
-- =============================================
-- ADD _modifyby
alter table public."reg" add _modifyby integer  ;
comment on column public."reg"._modifyby is 'user yang terakhir modifikasi record ini';

-- MODIFY _modifyby
alter table public."reg"
	alter column _modifyby type integer,
	ALTER COLUMN _modifyby DROP DEFAULT,
	ALTER COLUMN _modifyby DROP NOT NULL;
comment on column public."reg"._modifyby is 'user yang terakhir modifikasi record ini';


-- =============================================
-- FIELD: _modifydate timestamp with time zone
-- =============================================
-- ADD _modifydate
alter table public."reg" add _modifydate timestamp with time zone  ;
comment on column public."reg"._modifydate is 'waktu terakhir record dimodifikasi';

-- MODIFY _modifydate
alter table public."reg"
	alter column _modifydate type timestamp with time zone,
	ALTER COLUMN _modifydate DROP DEFAULT,
	ALTER COLUMN _modifydate DROP NOT NULL;
comment on column public."reg"._modifydate is 'waktu terakhir record dimodifikasi';


-- =============================================
-- FIELD: _timestamp timestamp with time zone
-- =============================================
-- ADD _timestamp
alter table public."reg" add _timestamp timestamp with time zone not null default now();
comment on column public."reg"._timestamp is 'data timestamp';

-- MODIFY _timestamp
alter table public."reg"
	alter column _timestamp type timestamp with time zone,
	ALTER COLUMN _timestamp SET DEFAULT now(),
	ALTER COLUMN _timestamp SET NOT NULL;
comment on column public."reg"._timestamp is 'data timestamp';


-- =============================================
-- INDEX
-- =============================================
DROP INDEX IF EXISTS public.idx$public$reg$_timestamp;
CREATE INDEX idx$public$reg$_timestamp ON public.reg (_timestamp);


-- =============================================
-- FOREIGN KEY CONSTRAINT
-- =============================================
-- Drop Existing Foreign Key Constraint 
ALTER TABLE public."reg" DROP CONSTRAINT fk$public$reg$brand_id;
ALTER TABLE public."reg" DROP CONSTRAINT fk$public$reg$regtype_id;
ALTER TABLE public."reg" DROP CONSTRAINT fk$public$reg$sea_id;
ALTER TABLE public."reg" DROP CONSTRAINT fk$public$reg$unit_id;


-- Add Foreign Key Constraint  
ALTER TABLE public."reg"
	ADD CONSTRAINT fk$public$reg$brand_id
	FOREIGN KEY (brand_id)
	REFERENCES public."brand"(brand_id);


-- Add As Index, drop dulu jika sudah ada
DROP INDEX IF EXISTS public.idx_fk$public$reg$brand_id;
CREATE INDEX idx_fk$public$reg$brand_id ON public."reg"(brand_id);	


ALTER TABLE public."reg"
	ADD CONSTRAINT fk$public$reg$regtype_id
	FOREIGN KEY (regtype_id)
	REFERENCES public."regtype"(regtype_id);


-- Add As Index, drop dulu jika sudah ada
DROP INDEX IF EXISTS public.idx_fk$public$reg$regtype_id;
CREATE INDEX idx_fk$public$reg$regtype_id ON public."reg"(regtype_id);	


ALTER TABLE public."reg"
	ADD CONSTRAINT fk$public$reg$sea_id
	FOREIGN KEY (sea_id)
	REFERENCES public."sea"(sea_id);


-- Add As Index, drop dulu jika sudah ada
DROP INDEX IF EXISTS public.idx_fk$public$reg$sea_id;
CREATE INDEX idx_fk$public$reg$sea_id ON public."reg"(sea_id);	


ALTER TABLE public."reg"
	ADD CONSTRAINT fk$public$reg$unit_id
	FOREIGN KEY (unit_id)
	REFERENCES public."unit"(unit_id);


-- Add As Index, drop dulu jika sudah ada
DROP INDEX IF EXISTS public.idx_fk$public$reg$unit_id;
CREATE INDEX idx_fk$public$reg$unit_id ON public."reg"(unit_id);	

	


-- =============================================
-- UNIQUE INDEX
-- =============================================
-- Drop existing unique index 
alter table public."reg"
	drop constraint uq$public$reg$reg_doc;
	

-- Add unique index 
alter table  public."reg"
	add constraint uq$public$reg$reg_doc unique (reg_doc); 

