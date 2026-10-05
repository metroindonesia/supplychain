-- regtype.sql


/* =============================================
 * CREATE TABLE public."regtypeunit"
 * ============================================*/
create table public."regtypeunit" (
	regtypeunit_id bigint not null,
	constraint regtypeunit_pk primary key (regtypeunit_id)
);
comment on table public."regtypeunit" is '';	


-- =============================================
-- FIELD: unit_id int
-- =============================================
-- ADD unit_id
alter table public."regtypeunit" add unit_id int not null default 0;
comment on column public."regtypeunit".unit_id is '';

-- MODIFY unit_id
alter table public."regtypeunit"
	alter column unit_id type int,
	ALTER COLUMN unit_id SET DEFAULT 0,
	ALTER COLUMN unit_id SET NOT NULL;
comment on column public."regtypeunit".unit_id is '';


-- =============================================
-- FIELD: regtypeunit_data json
-- =============================================
-- ADD regtypeunit_data
alter table public."regtypeunit" add regtypeunit_data json  ;
comment on column public."regtypeunit".regtypeunit_data is '';

-- MODIFY regtypeunit_data
alter table public."regtypeunit"
	alter column regtypeunit_data type json,
	ALTER COLUMN regtypeunit_data DROP DEFAULT,
	ALTER COLUMN regtypeunit_data DROP NOT NULL;
comment on column public."regtypeunit".regtypeunit_data is '';


-- =============================================
-- FIELD: regtype_id int
-- =============================================
-- ADD regtype_id
alter table public."regtypeunit" add regtype_id int  ;
comment on column public."regtypeunit".regtype_id is '';

-- MODIFY regtype_id
alter table public."regtypeunit"
	alter column regtype_id type int,
	ALTER COLUMN regtype_id DROP DEFAULT,
	ALTER COLUMN regtype_id DROP NOT NULL;
comment on column public."regtypeunit".regtype_id is '';


-- =============================================
-- FIELD: _createby integer
-- =============================================
-- ADD _createby
alter table public."regtypeunit" add _createby integer not null ;
comment on column public."regtypeunit"._createby is 'user yang pertama kali membuat record ini';

-- MODIFY _createby
alter table public."regtypeunit"
	alter column _createby type integer,
	ALTER COLUMN _createby DROP DEFAULT,
	ALTER COLUMN _createby SET NOT NULL;
comment on column public."regtypeunit"._createby is 'user yang pertama kali membuat record ini';


-- =============================================
-- FIELD: _createdate timestamp with time zone
-- =============================================
-- ADD _createdate
alter table public."regtypeunit" add _createdate timestamp with time zone not null default now();
comment on column public."regtypeunit"._createdate is 'waktu record dibuat pertama kali';

-- MODIFY _createdate
alter table public."regtypeunit"
	alter column _createdate type timestamp with time zone,
	ALTER COLUMN _createdate SET DEFAULT now(),
	ALTER COLUMN _createdate SET NOT NULL;
comment on column public."regtypeunit"._createdate is 'waktu record dibuat pertama kali';


-- =============================================
-- FIELD: _modifyby integer
-- =============================================
-- ADD _modifyby
alter table public."regtypeunit" add _modifyby integer  ;
comment on column public."regtypeunit"._modifyby is 'user yang terakhir modifikasi record ini';

-- MODIFY _modifyby
alter table public."regtypeunit"
	alter column _modifyby type integer,
	ALTER COLUMN _modifyby DROP DEFAULT,
	ALTER COLUMN _modifyby DROP NOT NULL;
comment on column public."regtypeunit"._modifyby is 'user yang terakhir modifikasi record ini';


-- =============================================
-- FIELD: _modifydate timestamp with time zone
-- =============================================
-- ADD _modifydate
alter table public."regtypeunit" add _modifydate timestamp with time zone  ;
comment on column public."regtypeunit"._modifydate is 'waktu terakhir record dimodifikasi';

-- MODIFY _modifydate
alter table public."regtypeunit"
	alter column _modifydate type timestamp with time zone,
	ALTER COLUMN _modifydate DROP DEFAULT,
	ALTER COLUMN _modifydate DROP NOT NULL;
comment on column public."regtypeunit"._modifydate is 'waktu terakhir record dimodifikasi';


-- =============================================
-- FIELD: _timestamp timestamp with time zone
-- =============================================
-- ADD _timestamp
alter table public."regtypeunit" add _timestamp timestamp with time zone not null default now();
comment on column public."regtypeunit"._timestamp is 'data timestamp';

-- MODIFY _timestamp
alter table public."regtypeunit"
	alter column _timestamp type timestamp with time zone,
	ALTER COLUMN _timestamp SET DEFAULT now(),
	ALTER COLUMN _timestamp SET NOT NULL;
comment on column public."regtypeunit"._timestamp is 'data timestamp';


-- =============================================
-- INDEX
-- =============================================
DROP INDEX IF EXISTS public.idx$public$regtypeunit$_timestamp;
CREATE INDEX idx$public$regtypeunit$_timestamp ON public.regtypeunit (_timestamp);


-- =============================================
-- FOREIGN KEY CONSTRAINT
-- =============================================
-- Add Foreign Key Constraint  
ALTER TABLE public."regtypeunit"
	ADD CONSTRAINT fk$public$regtypeunit$unit_id
	FOREIGN KEY (unit_id)
	REFERENCES public."unit"(unit_id);


-- Add As Index, drop dulu jika sudah ada
DROP INDEX IF EXISTS public.idx_fk$public$regtypeunit$unit_id;
CREATE INDEX idx_fk$public$regtypeunit$unit_id ON public."regtypeunit"(unit_id);	

	


-- =============================================
-- UNIQUE INDEX
-- =============================================
-- Add unique index 
alter table  public."regtypeunit"
	add constraint uq$public$regtypeunit$regtypeunit_pair unique (regtype_id, unit_id); 

