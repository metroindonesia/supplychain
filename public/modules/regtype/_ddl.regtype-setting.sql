-- regtype.sql


/* =============================================
 * CREATE TABLE public."regtypesetting"
 * ============================================*/
create table public."regtypesetting" (
	regtypesetting_id bigint not null,
	constraint regtypesetting_pk primary key (regtypesetting_id)
);
comment on table public."regtypesetting" is '';	


-- =============================================
-- FIELD: setting_name text
-- =============================================
-- ADD setting_name
alter table public."regtypesetting" add setting_name text  ;
comment on column public."regtypesetting".setting_name is '';

-- MODIFY setting_name
alter table public."regtypesetting"
	alter column setting_name type text,
	ALTER COLUMN setting_name DROP DEFAULT,
	ALTER COLUMN setting_name DROP NOT NULL;
comment on column public."regtypesetting".setting_name is '';


-- =============================================
-- FIELD: setting_value text
-- =============================================
-- ADD setting_value
alter table public."regtypesetting" add setting_value text  ;
comment on column public."regtypesetting".setting_value is '';

-- MODIFY setting_value
alter table public."regtypesetting"
	alter column setting_value type text,
	ALTER COLUMN setting_value DROP DEFAULT,
	ALTER COLUMN setting_value DROP NOT NULL;
comment on column public."regtypesetting".setting_value is '';


-- =============================================
-- FIELD: setting_descr text
-- =============================================
-- ADD setting_descr
alter table public."regtypesetting" add setting_descr text  ;
comment on column public."regtypesetting".setting_descr is '';

-- MODIFY setting_descr
alter table public."regtypesetting"
	alter column setting_descr type text,
	ALTER COLUMN setting_descr DROP DEFAULT,
	ALTER COLUMN setting_descr DROP NOT NULL;
comment on column public."regtypesetting".setting_descr is '';


-- =============================================
-- FIELD: setting_data json
-- =============================================
-- ADD setting_data
alter table public."regtypesetting" add setting_data json  ;
comment on column public."regtypesetting".setting_data is '';

-- MODIFY setting_data
alter table public."regtypesetting"
	alter column setting_data type json,
	ALTER COLUMN setting_data DROP DEFAULT,
	ALTER COLUMN setting_data DROP NOT NULL;
comment on column public."regtypesetting".setting_data is '';


-- =============================================
-- FIELD: regtype_id int
-- =============================================
-- ADD regtype_id
alter table public."regtypesetting" add regtype_id int  ;
comment on column public."regtypesetting".regtype_id is '';

-- MODIFY regtype_id
alter table public."regtypesetting"
	alter column regtype_id type int,
	ALTER COLUMN regtype_id DROP DEFAULT,
	ALTER COLUMN regtype_id DROP NOT NULL;
comment on column public."regtypesetting".regtype_id is '';


-- =============================================
-- FIELD: _createby integer
-- =============================================
-- ADD _createby
alter table public."regtypesetting" add _createby integer not null ;
comment on column public."regtypesetting"._createby is 'user yang pertama kali membuat record ini';

-- MODIFY _createby
alter table public."regtypesetting"
	alter column _createby type integer,
	ALTER COLUMN _createby DROP DEFAULT,
	ALTER COLUMN _createby SET NOT NULL;
comment on column public."regtypesetting"._createby is 'user yang pertama kali membuat record ini';


-- =============================================
-- FIELD: _createdate timestamp with time zone
-- =============================================
-- ADD _createdate
alter table public."regtypesetting" add _createdate timestamp with time zone not null default now();
comment on column public."regtypesetting"._createdate is 'waktu record dibuat pertama kali';

-- MODIFY _createdate
alter table public."regtypesetting"
	alter column _createdate type timestamp with time zone,
	ALTER COLUMN _createdate SET DEFAULT now(),
	ALTER COLUMN _createdate SET NOT NULL;
comment on column public."regtypesetting"._createdate is 'waktu record dibuat pertama kali';


-- =============================================
-- FIELD: _modifyby integer
-- =============================================
-- ADD _modifyby
alter table public."regtypesetting" add _modifyby integer  ;
comment on column public."regtypesetting"._modifyby is 'user yang terakhir modifikasi record ini';

-- MODIFY _modifyby
alter table public."regtypesetting"
	alter column _modifyby type integer,
	ALTER COLUMN _modifyby DROP DEFAULT,
	ALTER COLUMN _modifyby DROP NOT NULL;
comment on column public."regtypesetting"._modifyby is 'user yang terakhir modifikasi record ini';


-- =============================================
-- FIELD: _modifydate timestamp with time zone
-- =============================================
-- ADD _modifydate
alter table public."regtypesetting" add _modifydate timestamp with time zone  ;
comment on column public."regtypesetting"._modifydate is 'waktu terakhir record dimodifikasi';

-- MODIFY _modifydate
alter table public."regtypesetting"
	alter column _modifydate type timestamp with time zone,
	ALTER COLUMN _modifydate DROP DEFAULT,
	ALTER COLUMN _modifydate DROP NOT NULL;
comment on column public."regtypesetting"._modifydate is 'waktu terakhir record dimodifikasi';


-- =============================================
-- FIELD: _timestamp timestamp with time zone
-- =============================================
-- ADD _timestamp
alter table public."regtypesetting" add _timestamp timestamp with time zone not null default now();
comment on column public."regtypesetting"._timestamp is 'data timestamp';

-- MODIFY _timestamp
alter table public."regtypesetting"
	alter column _timestamp type timestamp with time zone,
	ALTER COLUMN _timestamp SET DEFAULT now(),
	ALTER COLUMN _timestamp SET NOT NULL;
comment on column public."regtypesetting"._timestamp is 'data timestamp';


-- =============================================
-- INDEX
-- =============================================
DROP INDEX IF EXISTS public.idx$public$regtypesetting$_timestamp;
CREATE INDEX idx$public$regtypesetting$_timestamp ON public.regtypesetting (_timestamp);




-- =============================================
-- UNIQUE INDEX
-- =============================================
-- Add unique index 
alter table  public."regtypesetting"
	add constraint uq$public$regtypesetting$regtypesetting_pair unique (regtype_id, setting_name); 

