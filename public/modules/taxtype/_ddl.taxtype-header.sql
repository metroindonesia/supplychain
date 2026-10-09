-- taxtype.sql


/* =============================================
 * CREATE TABLE public."taxtype"
 * ============================================*/
create table public."taxtype" (
	taxtype_id smallint not null,
	constraint taxtype_pk primary key (taxtype_id)
);
comment on table public."taxtype" is '';	


-- =============================================
-- FIELD: taxtype_name text
-- =============================================
-- ADD taxtype_name
alter table public."taxtype" add taxtype_name text  ;
comment on column public."taxtype".taxtype_name is '';

-- MODIFY taxtype_name
alter table public."taxtype"
	alter column taxtype_name type text,
	ALTER COLUMN taxtype_name DROP DEFAULT,
	ALTER COLUMN taxtype_name DROP NOT NULL;
comment on column public."taxtype".taxtype_name is '';


-- =============================================
-- FIELD: _createby integer
-- =============================================
-- ADD _createby
alter table public."taxtype" add _createby integer not null ;
comment on column public."taxtype"._createby is 'user yang pertama kali membuat record ini';

-- MODIFY _createby
alter table public."taxtype"
	alter column _createby type integer,
	ALTER COLUMN _createby DROP DEFAULT,
	ALTER COLUMN _createby SET NOT NULL;
comment on column public."taxtype"._createby is 'user yang pertama kali membuat record ini';


-- =============================================
-- FIELD: _createdate timestamp with time zone
-- =============================================
-- ADD _createdate
alter table public."taxtype" add _createdate timestamp with time zone not null default now();
comment on column public."taxtype"._createdate is 'waktu record dibuat pertama kali';

-- MODIFY _createdate
alter table public."taxtype"
	alter column _createdate type timestamp with time zone,
	ALTER COLUMN _createdate SET DEFAULT now(),
	ALTER COLUMN _createdate SET NOT NULL;
comment on column public."taxtype"._createdate is 'waktu record dibuat pertama kali';


-- =============================================
-- FIELD: _modifyby integer
-- =============================================
-- ADD _modifyby
alter table public."taxtype" add _modifyby integer  ;
comment on column public."taxtype"._modifyby is 'user yang terakhir modifikasi record ini';

-- MODIFY _modifyby
alter table public."taxtype"
	alter column _modifyby type integer,
	ALTER COLUMN _modifyby DROP DEFAULT,
	ALTER COLUMN _modifyby DROP NOT NULL;
comment on column public."taxtype"._modifyby is 'user yang terakhir modifikasi record ini';


-- =============================================
-- FIELD: _modifydate timestamp with time zone
-- =============================================
-- ADD _modifydate
alter table public."taxtype" add _modifydate timestamp with time zone  ;
comment on column public."taxtype"._modifydate is 'waktu terakhir record dimodifikasi';

-- MODIFY _modifydate
alter table public."taxtype"
	alter column _modifydate type timestamp with time zone,
	ALTER COLUMN _modifydate DROP DEFAULT,
	ALTER COLUMN _modifydate DROP NOT NULL;
comment on column public."taxtype"._modifydate is 'waktu terakhir record dimodifikasi';


-- =============================================
-- FIELD: _timestamp timestamp with time zone
-- =============================================
-- ADD _timestamp
alter table public."taxtype" add _timestamp timestamp with time zone not null default now();
comment on column public."taxtype"._timestamp is 'data timestamp';

-- MODIFY _timestamp
alter table public."taxtype"
	alter column _timestamp type timestamp with time zone,
	ALTER COLUMN _timestamp SET DEFAULT now(),
	ALTER COLUMN _timestamp SET NOT NULL;
comment on column public."taxtype"._timestamp is 'data timestamp';


-- =============================================
-- INDEX
-- =============================================
DROP INDEX IF EXISTS public.idx$public$taxtype$_timestamp;
CREATE INDEX idx$public$taxtype$_timestamp ON public.taxtype (_timestamp);




-- =============================================
-- UNIQUE INDEX
-- =============================================
-- Drop existing unique index 
alter table public."taxtype"
	drop constraint uq$public$taxtype$taxtype_name;
	

-- Add unique index 
alter table  public."taxtype"
	add constraint uq$public$taxtype$taxtype_name unique (taxtype_name); 

