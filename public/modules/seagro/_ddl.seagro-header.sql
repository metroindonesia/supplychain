-- seagro.sql


/* =============================================
 * CREATE TABLE public."seagro"
 * ============================================*/
create table public."seagro" (
	seagro_id smallint not null,
	constraint seagro_pk primary key (seagro_id)
);
comment on table public."seagro" is '';	


-- =============================================
-- FIELD: seagro_name text
-- =============================================
-- ADD seagro_name
alter table public."seagro" add seagro_name text  ;
comment on column public."seagro".seagro_name is '';

-- MODIFY seagro_name
alter table public."seagro"
	alter column seagro_name type text,
	ALTER COLUMN seagro_name DROP DEFAULT,
	ALTER COLUMN seagro_name DROP NOT NULL;
comment on column public."seagro".seagro_name is '';


-- =============================================
-- FIELD: seagro_descr text
-- =============================================
-- ADD seagro_descr
alter table public."seagro" add seagro_descr text  ;
comment on column public."seagro".seagro_descr is '';

-- MODIFY seagro_descr
alter table public."seagro"
	alter column seagro_descr type text,
	ALTER COLUMN seagro_descr DROP DEFAULT,
	ALTER COLUMN seagro_descr DROP NOT NULL;
comment on column public."seagro".seagro_descr is '';


-- =============================================
-- FIELD: _createby integer
-- =============================================
-- ADD _createby
alter table public."seagro" add _createby integer not null ;
comment on column public."seagro"._createby is 'user yang pertama kali membuat record ini';

-- MODIFY _createby
alter table public."seagro"
	alter column _createby type integer,
	ALTER COLUMN _createby DROP DEFAULT,
	ALTER COLUMN _createby SET NOT NULL;
comment on column public."seagro"._createby is 'user yang pertama kali membuat record ini';


-- =============================================
-- FIELD: _createdate timestamp with time zone
-- =============================================
-- ADD _createdate
alter table public."seagro" add _createdate timestamp with time zone not null default now();
comment on column public."seagro"._createdate is 'waktu record dibuat pertama kali';

-- MODIFY _createdate
alter table public."seagro"
	alter column _createdate type timestamp with time zone,
	ALTER COLUMN _createdate SET DEFAULT now(),
	ALTER COLUMN _createdate SET NOT NULL;
comment on column public."seagro"._createdate is 'waktu record dibuat pertama kali';


-- =============================================
-- FIELD: _modifyby integer
-- =============================================
-- ADD _modifyby
alter table public."seagro" add _modifyby integer  ;
comment on column public."seagro"._modifyby is 'user yang terakhir modifikasi record ini';

-- MODIFY _modifyby
alter table public."seagro"
	alter column _modifyby type integer,
	ALTER COLUMN _modifyby DROP DEFAULT,
	ALTER COLUMN _modifyby DROP NOT NULL;
comment on column public."seagro"._modifyby is 'user yang terakhir modifikasi record ini';


-- =============================================
-- FIELD: _modifydate timestamp with time zone
-- =============================================
-- ADD _modifydate
alter table public."seagro" add _modifydate timestamp with time zone  ;
comment on column public."seagro"._modifydate is 'waktu terakhir record dimodifikasi';

-- MODIFY _modifydate
alter table public."seagro"
	alter column _modifydate type timestamp with time zone,
	ALTER COLUMN _modifydate DROP DEFAULT,
	ALTER COLUMN _modifydate DROP NOT NULL;
comment on column public."seagro"._modifydate is 'waktu terakhir record dimodifikasi';


-- =============================================
-- FIELD: _timestamp timestamp with time zone
-- =============================================
-- ADD _timestamp
alter table public."seagro" add _timestamp timestamp with time zone not null default now();
comment on column public."seagro"._timestamp is 'data timestamp';

-- MODIFY _timestamp
alter table public."seagro"
	alter column _timestamp type timestamp with time zone,
	ALTER COLUMN _timestamp SET DEFAULT now(),
	ALTER COLUMN _timestamp SET NOT NULL;
comment on column public."seagro"._timestamp is 'data timestamp';


-- =============================================
-- INDEX
-- =============================================
DROP INDEX IF EXISTS public.idx$public$seagro$_timestamp;
CREATE INDEX idx$public$seagro$_timestamp ON public.seagro (_timestamp);




-- =============================================
-- UNIQUE INDEX
-- =============================================
-- Add unique index 
alter table  public."seagro"
	add constraint uq$public$seagro$seagro_name unique (seagro_name); 

