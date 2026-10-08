-- coa.sql


/* =============================================
 * CREATE TABLE public."coa"
 * ============================================*/
create table public."coa" (
	coa_id int not null,
	constraint coa_pk primary key (coa_id)
);
comment on table public."coa" is '';	


-- =============================================
-- FIELD: coa_code text
-- =============================================
-- ADD coa_code
alter table public."coa" add coa_code text  ;
comment on column public."coa".coa_code is '';

-- MODIFY coa_code
alter table public."coa"
	alter column coa_code type text,
	ALTER COLUMN coa_code DROP DEFAULT,
	ALTER COLUMN coa_code DROP NOT NULL;
comment on column public."coa".coa_code is '';


-- =============================================
-- FIELD: coa_name text
-- =============================================
-- ADD coa_name
alter table public."coa" add coa_name text  ;
comment on column public."coa".coa_name is '';

-- MODIFY coa_name
alter table public."coa"
	alter column coa_name type text,
	ALTER COLUMN coa_name DROP DEFAULT,
	ALTER COLUMN coa_name DROP NOT NULL;
comment on column public."coa".coa_name is '';


-- =============================================
-- FIELD: _createby integer
-- =============================================
-- ADD _createby
alter table public."coa" add _createby integer not null ;
comment on column public."coa"._createby is 'user yang pertama kali membuat record ini';

-- MODIFY _createby
alter table public."coa"
	alter column _createby type integer,
	ALTER COLUMN _createby DROP DEFAULT,
	ALTER COLUMN _createby SET NOT NULL;
comment on column public."coa"._createby is 'user yang pertama kali membuat record ini';


-- =============================================
-- FIELD: _createdate timestamp with time zone
-- =============================================
-- ADD _createdate
alter table public."coa" add _createdate timestamp with time zone not null default now();
comment on column public."coa"._createdate is 'waktu record dibuat pertama kali';

-- MODIFY _createdate
alter table public."coa"
	alter column _createdate type timestamp with time zone,
	ALTER COLUMN _createdate SET DEFAULT now(),
	ALTER COLUMN _createdate SET NOT NULL;
comment on column public."coa"._createdate is 'waktu record dibuat pertama kali';


-- =============================================
-- FIELD: _modifyby integer
-- =============================================
-- ADD _modifyby
alter table public."coa" add _modifyby integer  ;
comment on column public."coa"._modifyby is 'user yang terakhir modifikasi record ini';

-- MODIFY _modifyby
alter table public."coa"
	alter column _modifyby type integer,
	ALTER COLUMN _modifyby DROP DEFAULT,
	ALTER COLUMN _modifyby DROP NOT NULL;
comment on column public."coa"._modifyby is 'user yang terakhir modifikasi record ini';


-- =============================================
-- FIELD: _modifydate timestamp with time zone
-- =============================================
-- ADD _modifydate
alter table public."coa" add _modifydate timestamp with time zone  ;
comment on column public."coa"._modifydate is 'waktu terakhir record dimodifikasi';

-- MODIFY _modifydate
alter table public."coa"
	alter column _modifydate type timestamp with time zone,
	ALTER COLUMN _modifydate DROP DEFAULT,
	ALTER COLUMN _modifydate DROP NOT NULL;
comment on column public."coa"._modifydate is 'waktu terakhir record dimodifikasi';


-- =============================================
-- FIELD: _timestamp timestamp with time zone
-- =============================================
-- ADD _timestamp
alter table public."coa" add _timestamp timestamp with time zone not null default now();
comment on column public."coa"._timestamp is 'data timestamp';

-- MODIFY _timestamp
alter table public."coa"
	alter column _timestamp type timestamp with time zone,
	ALTER COLUMN _timestamp SET DEFAULT now(),
	ALTER COLUMN _timestamp SET NOT NULL;
comment on column public."coa"._timestamp is 'data timestamp';


-- =============================================
-- INDEX
-- =============================================
DROP INDEX IF EXISTS public.idx$public$coa$_timestamp;
CREATE INDEX idx$public$coa$_timestamp ON public.coa (_timestamp);




-- =============================================
-- UNIQUE INDEX
-- =============================================
-- Add unique index 
alter table  public."coa"
	add constraint uq$public$coa$coa_name unique (coa_name); 

alter table  public."coa"
	add constraint uq$public$coa$coa_code unique (coa_code); 

