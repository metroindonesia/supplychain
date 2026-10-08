-- movtype.sql


/* =============================================
 * CREATE TABLE public."movtype"
 * ============================================*/
create table public."movtype" (
	movtype_id smallint not null,
	constraint movtype_pk primary key (movtype_id)
);
comment on table public."movtype" is '';	


-- =============================================
-- FIELD: movtype_code text
-- =============================================
-- ADD movtype_code
alter table public."movtype" add movtype_code text  ;
comment on column public."movtype".movtype_code is '';

-- MODIFY movtype_code
alter table public."movtype"
	alter column movtype_code type text,
	ALTER COLUMN movtype_code DROP DEFAULT,
	ALTER COLUMN movtype_code DROP NOT NULL;
comment on column public."movtype".movtype_code is '';


-- =============================================
-- FIELD: movtype_descr text
-- =============================================
-- ADD movtype_descr
alter table public."movtype" add movtype_descr text  ;
comment on column public."movtype".movtype_descr is '';

-- MODIFY movtype_descr
alter table public."movtype"
	alter column movtype_descr type text,
	ALTER COLUMN movtype_descr DROP DEFAULT,
	ALTER COLUMN movtype_descr DROP NOT NULL;
comment on column public."movtype".movtype_descr is '';


-- =============================================
-- FIELD: _createby integer
-- =============================================
-- ADD _createby
alter table public."movtype" add _createby integer not null ;
comment on column public."movtype"._createby is 'user yang pertama kali membuat record ini';

-- MODIFY _createby
alter table public."movtype"
	alter column _createby type integer,
	ALTER COLUMN _createby DROP DEFAULT,
	ALTER COLUMN _createby SET NOT NULL;
comment on column public."movtype"._createby is 'user yang pertama kali membuat record ini';


-- =============================================
-- FIELD: _createdate timestamp with time zone
-- =============================================
-- ADD _createdate
alter table public."movtype" add _createdate timestamp with time zone not null default now();
comment on column public."movtype"._createdate is 'waktu record dibuat pertama kali';

-- MODIFY _createdate
alter table public."movtype"
	alter column _createdate type timestamp with time zone,
	ALTER COLUMN _createdate SET DEFAULT now(),
	ALTER COLUMN _createdate SET NOT NULL;
comment on column public."movtype"._createdate is 'waktu record dibuat pertama kali';


-- =============================================
-- FIELD: _modifyby integer
-- =============================================
-- ADD _modifyby
alter table public."movtype" add _modifyby integer  ;
comment on column public."movtype"._modifyby is 'user yang terakhir modifikasi record ini';

-- MODIFY _modifyby
alter table public."movtype"
	alter column _modifyby type integer,
	ALTER COLUMN _modifyby DROP DEFAULT,
	ALTER COLUMN _modifyby DROP NOT NULL;
comment on column public."movtype"._modifyby is 'user yang terakhir modifikasi record ini';


-- =============================================
-- FIELD: _modifydate timestamp with time zone
-- =============================================
-- ADD _modifydate
alter table public."movtype" add _modifydate timestamp with time zone  ;
comment on column public."movtype"._modifydate is 'waktu terakhir record dimodifikasi';

-- MODIFY _modifydate
alter table public."movtype"
	alter column _modifydate type timestamp with time zone,
	ALTER COLUMN _modifydate DROP DEFAULT,
	ALTER COLUMN _modifydate DROP NOT NULL;
comment on column public."movtype"._modifydate is 'waktu terakhir record dimodifikasi';


-- =============================================
-- FIELD: _timestamp timestamp with time zone
-- =============================================
-- ADD _timestamp
alter table public."movtype" add _timestamp timestamp with time zone not null default now();
comment on column public."movtype"._timestamp is 'data timestamp';

-- MODIFY _timestamp
alter table public."movtype"
	alter column _timestamp type timestamp with time zone,
	ALTER COLUMN _timestamp SET DEFAULT now(),
	ALTER COLUMN _timestamp SET NOT NULL;
comment on column public."movtype"._timestamp is 'data timestamp';


-- =============================================
-- INDEX
-- =============================================
DROP INDEX IF EXISTS public.idx$public$movtype$_timestamp;
CREATE INDEX idx$public$movtype$_timestamp ON public.movtype (_timestamp);




-- =============================================
-- UNIQUE INDEX
-- =============================================
-- Add unique index 
alter table  public."movtype"
	add constraint uq$public$movtype$movtype_code unique (movtype_code); 

