-- variance.sql


/* =============================================
 * CREATE TABLE public."varianceprop"
 * ============================================*/
create table public."varianceprop" (
	varianceprop_id bigint not null,
	constraint varianceprop_pk primary key (varianceprop_id)
);
comment on table public."varianceprop" is '';	


-- =============================================
-- FIELD: prop_name text
-- =============================================
-- ADD prop_name
alter table public."varianceprop" add prop_name text  ;
comment on column public."varianceprop".prop_name is '';

-- MODIFY prop_name
alter table public."varianceprop"
	alter column prop_name type text,
	ALTER COLUMN prop_name DROP DEFAULT,
	ALTER COLUMN prop_name DROP NOT NULL;
comment on column public."varianceprop".prop_name is '';


-- =============================================
-- FIELD: prop_value text
-- =============================================
-- ADD prop_value
alter table public."varianceprop" add prop_value text  ;
comment on column public."varianceprop".prop_value is '';

-- MODIFY prop_value
alter table public."varianceprop"
	alter column prop_value type text,
	ALTER COLUMN prop_value DROP DEFAULT,
	ALTER COLUMN prop_value DROP NOT NULL;
comment on column public."varianceprop".prop_value is '';


-- =============================================
-- FIELD: prop_data json
-- =============================================
-- ADD prop_data
alter table public."varianceprop" add prop_data json  ;
comment on column public."varianceprop".prop_data is '';

-- MODIFY prop_data
alter table public."varianceprop"
	alter column prop_data type json,
	ALTER COLUMN prop_data DROP DEFAULT,
	ALTER COLUMN prop_data DROP NOT NULL;
comment on column public."varianceprop".prop_data is '';


-- =============================================
-- FIELD: variance_id bigint
-- =============================================
-- ADD variance_id
alter table public."varianceprop" add variance_id bigint  ;
comment on column public."varianceprop".variance_id is '';

-- MODIFY variance_id
alter table public."varianceprop"
	alter column variance_id type bigint,
	ALTER COLUMN variance_id DROP DEFAULT,
	ALTER COLUMN variance_id DROP NOT NULL;
comment on column public."varianceprop".variance_id is '';


-- =============================================
-- FIELD: _createby integer
-- =============================================
-- ADD _createby
alter table public."varianceprop" add _createby integer not null ;
comment on column public."varianceprop"._createby is 'user yang pertama kali membuat record ini';

-- MODIFY _createby
alter table public."varianceprop"
	alter column _createby type integer,
	ALTER COLUMN _createby DROP DEFAULT,
	ALTER COLUMN _createby SET NOT NULL;
comment on column public."varianceprop"._createby is 'user yang pertama kali membuat record ini';


-- =============================================
-- FIELD: _createdate timestamp with time zone
-- =============================================
-- ADD _createdate
alter table public."varianceprop" add _createdate timestamp with time zone not null default now();
comment on column public."varianceprop"._createdate is 'waktu record dibuat pertama kali';

-- MODIFY _createdate
alter table public."varianceprop"
	alter column _createdate type timestamp with time zone,
	ALTER COLUMN _createdate SET DEFAULT now(),
	ALTER COLUMN _createdate SET NOT NULL;
comment on column public."varianceprop"._createdate is 'waktu record dibuat pertama kali';


-- =============================================
-- FIELD: _modifyby integer
-- =============================================
-- ADD _modifyby
alter table public."varianceprop" add _modifyby integer  ;
comment on column public."varianceprop"._modifyby is 'user yang terakhir modifikasi record ini';

-- MODIFY _modifyby
alter table public."varianceprop"
	alter column _modifyby type integer,
	ALTER COLUMN _modifyby DROP DEFAULT,
	ALTER COLUMN _modifyby DROP NOT NULL;
comment on column public."varianceprop"._modifyby is 'user yang terakhir modifikasi record ini';


-- =============================================
-- FIELD: _modifydate timestamp with time zone
-- =============================================
-- ADD _modifydate
alter table public."varianceprop" add _modifydate timestamp with time zone  ;
comment on column public."varianceprop"._modifydate is 'waktu terakhir record dimodifikasi';

-- MODIFY _modifydate
alter table public."varianceprop"
	alter column _modifydate type timestamp with time zone,
	ALTER COLUMN _modifydate DROP DEFAULT,
	ALTER COLUMN _modifydate DROP NOT NULL;
comment on column public."varianceprop"._modifydate is 'waktu terakhir record dimodifikasi';


-- =============================================
-- FIELD: _timestamp timestamp with time zone
-- =============================================
-- ADD _timestamp
alter table public."varianceprop" add _timestamp timestamp with time zone not null default now();
comment on column public."varianceprop"._timestamp is 'data timestamp';

-- MODIFY _timestamp
alter table public."varianceprop"
	alter column _timestamp type timestamp with time zone,
	ALTER COLUMN _timestamp SET DEFAULT now(),
	ALTER COLUMN _timestamp SET NOT NULL;
comment on column public."varianceprop"._timestamp is 'data timestamp';


-- =============================================
-- INDEX
-- =============================================
DROP INDEX IF EXISTS public.idx$public$varianceprop$_timestamp;
CREATE INDEX idx$public$varianceprop$_timestamp ON public.varianceprop (_timestamp);




-- =============================================
-- UNIQUE INDEX
-- =============================================
-- Drop existing unique index 
alter table public."varianceprop"
	drop constraint uq$public$varianceprop$varianceprop_prop;
	

-- Add unique index 
alter table  public."varianceprop"
	add constraint uq$public$varianceprop$varianceprop_prop unique (variance_id,  prop_name); 

