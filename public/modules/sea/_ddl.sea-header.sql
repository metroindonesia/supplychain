-- sea.sql


/* =============================================
 * CREATE TABLE public."sea"
 * ============================================*/
create table public."sea" (
	sea_id smallint not null,
	constraint sea_pk primary key (sea_id)
);
comment on table public."sea" is '';	


-- =============================================
-- FIELD: sea_isdisabled boolean
-- =============================================
-- ADD sea_isdisabled
alter table public."sea" add sea_isdisabled boolean not null default false;
comment on column public."sea".sea_isdisabled is '';

-- MODIFY sea_isdisabled
alter table public."sea"
	alter column sea_isdisabled type boolean,
	ALTER COLUMN sea_isdisabled SET DEFAULT false,
	ALTER COLUMN sea_isdisabled SET NOT NULL;
comment on column public."sea".sea_isdisabled is '';


-- =============================================
-- FIELD: sea_isactive boolean
-- =============================================
-- ADD sea_isactive
alter table public."sea" add sea_isactive boolean not null default false;
comment on column public."sea".sea_isactive is '';

-- MODIFY sea_isactive
alter table public."sea"
	alter column sea_isactive type boolean,
	ALTER COLUMN sea_isactive SET DEFAULT false,
	ALTER COLUMN sea_isactive SET NOT NULL;
comment on column public."sea".sea_isactive is '';


-- =============================================
-- FIELD: sea_name text
-- =============================================
-- ADD sea_name
alter table public."sea" add sea_name text  ;
comment on column public."sea".sea_name is '';

-- MODIFY sea_name
alter table public."sea"
	alter column sea_name type text,
	ALTER COLUMN sea_name DROP DEFAULT,
	ALTER COLUMN sea_name DROP NOT NULL;
comment on column public."sea".sea_name is '';


-- =============================================
-- FIELD: seagro_id smallint
-- =============================================
-- ADD seagro_id
alter table public."sea" add seagro_id smallint  ;
comment on column public."sea".seagro_id is '';

-- MODIFY seagro_id
alter table public."sea"
	alter column seagro_id type smallint,
	ALTER COLUMN seagro_id DROP DEFAULT,
	ALTER COLUMN seagro_id DROP NOT NULL;
comment on column public."sea".seagro_id is '';


-- =============================================
-- FIELD: sea_dtstart date
-- =============================================
-- ADD sea_dtstart
alter table public."sea" add sea_dtstart date  default now();
comment on column public."sea".sea_dtstart is '';

-- MODIFY sea_dtstart
alter table public."sea"
	alter column sea_dtstart type date,
	ALTER COLUMN sea_dtstart SET DEFAULT now(),
	ALTER COLUMN sea_dtstart DROP NOT NULL;
comment on column public."sea".sea_dtstart is '';


-- =============================================
-- FIELD: sea_dtend date
-- =============================================
-- ADD sea_dtend
alter table public."sea" add sea_dtend date  default now();
comment on column public."sea".sea_dtend is '';

-- MODIFY sea_dtend
alter table public."sea"
	alter column sea_dtend type date,
	ALTER COLUMN sea_dtend SET DEFAULT now(),
	ALTER COLUMN sea_dtend DROP NOT NULL;
comment on column public."sea".sea_dtend is '';


-- =============================================
-- FIELD: _createby integer
-- =============================================
-- ADD _createby
alter table public."sea" add _createby integer not null ;
comment on column public."sea"._createby is 'user yang pertama kali membuat record ini';

-- MODIFY _createby
alter table public."sea"
	alter column _createby type integer,
	ALTER COLUMN _createby DROP DEFAULT,
	ALTER COLUMN _createby SET NOT NULL;
comment on column public."sea"._createby is 'user yang pertama kali membuat record ini';


-- =============================================
-- FIELD: _createdate timestamp with time zone
-- =============================================
-- ADD _createdate
alter table public."sea" add _createdate timestamp with time zone not null default now();
comment on column public."sea"._createdate is 'waktu record dibuat pertama kali';

-- MODIFY _createdate
alter table public."sea"
	alter column _createdate type timestamp with time zone,
	ALTER COLUMN _createdate SET DEFAULT now(),
	ALTER COLUMN _createdate SET NOT NULL;
comment on column public."sea"._createdate is 'waktu record dibuat pertama kali';


-- =============================================
-- FIELD: _modifyby integer
-- =============================================
-- ADD _modifyby
alter table public."sea" add _modifyby integer  ;
comment on column public."sea"._modifyby is 'user yang terakhir modifikasi record ini';

-- MODIFY _modifyby
alter table public."sea"
	alter column _modifyby type integer,
	ALTER COLUMN _modifyby DROP DEFAULT,
	ALTER COLUMN _modifyby DROP NOT NULL;
comment on column public."sea"._modifyby is 'user yang terakhir modifikasi record ini';


-- =============================================
-- FIELD: _modifydate timestamp with time zone
-- =============================================
-- ADD _modifydate
alter table public."sea" add _modifydate timestamp with time zone  ;
comment on column public."sea"._modifydate is 'waktu terakhir record dimodifikasi';

-- MODIFY _modifydate
alter table public."sea"
	alter column _modifydate type timestamp with time zone,
	ALTER COLUMN _modifydate DROP DEFAULT,
	ALTER COLUMN _modifydate DROP NOT NULL;
comment on column public."sea"._modifydate is 'waktu terakhir record dimodifikasi';


-- =============================================
-- FIELD: _timestamp timestamp with time zone
-- =============================================
-- ADD _timestamp
alter table public."sea" add _timestamp timestamp with time zone not null default now();
comment on column public."sea"._timestamp is 'data timestamp';

-- MODIFY _timestamp
alter table public."sea"
	alter column _timestamp type timestamp with time zone,
	ALTER COLUMN _timestamp SET DEFAULT now(),
	ALTER COLUMN _timestamp SET NOT NULL;
comment on column public."sea"._timestamp is 'data timestamp';


-- =============================================
-- INDEX
-- =============================================
DROP INDEX IF EXISTS public.idx$public$sea$_timestamp;
CREATE INDEX idx$public$sea$_timestamp ON public.sea (_timestamp);


-- =============================================
-- FOREIGN KEY CONSTRAINT
-- =============================================
-- Drop Existing Foreign Key Constraint 
ALTER TABLE public."sea" DROP CONSTRAINT fk$public$sea$seagro_id;


-- Add Foreign Key Constraint  
ALTER TABLE public."sea"
	ADD CONSTRAINT fk$public$sea$seagro_id
	FOREIGN KEY (seagro_id)
	REFERENCES public."seagro"(seagro_id);


-- Add As Index, drop dulu jika sudah ada
DROP INDEX IF EXISTS public.idx_fk$public$sea$seagro_id;
CREATE INDEX idx_fk$public$sea$seagro_id ON public."sea"(seagro_id);	

	


-- =============================================
-- UNIQUE INDEX
-- =============================================
-- Drop existing unique index 
alter table public."sea"
	drop constraint uq$public$sea$sea_name;
	

-- Add unique index 
alter table  public."sea"
	add constraint uq$public$sea$sea_name unique (sea_name); 

