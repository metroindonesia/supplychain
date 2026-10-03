-- user.sql


/* =============================================
 * CREATE TABLE public."userunit"
 * ============================================*/
create table public."userunit" (
	userunit_id bigint not null,
	constraint userunit_pk primary key (userunit_id)
);
comment on table public."userunit" is '';	


-- =============================================
-- FIELD: unit_id int
-- =============================================
-- ADD unit_id
alter table public."userunit" add unit_id int not null default 0;
comment on column public."userunit".unit_id is '';

-- MODIFY unit_id
alter table public."userunit"
	alter column unit_id type int,
	ALTER COLUMN unit_id SET DEFAULT 0,
	ALTER COLUMN unit_id SET NOT NULL;
comment on column public."userunit".unit_id is '';


-- =============================================
-- FIELD: userunit_isdisabled boolean
-- =============================================
-- ADD userunit_isdisabled
alter table public."userunit" add userunit_isdisabled boolean not null default false;
comment on column public."userunit".userunit_isdisabled is '';

-- MODIFY userunit_isdisabled
alter table public."userunit"
	alter column userunit_isdisabled type boolean,
	ALTER COLUMN userunit_isdisabled SET DEFAULT false,
	ALTER COLUMN userunit_isdisabled SET NOT NULL;
comment on column public."userunit".userunit_isdisabled is '';


-- =============================================
-- FIELD: userunit_data json
-- =============================================
-- ADD userunit_data
alter table public."userunit" add userunit_data json  ;
comment on column public."userunit".userunit_data is '';

-- MODIFY userunit_data
alter table public."userunit"
	alter column userunit_data type json,
	ALTER COLUMN userunit_data DROP DEFAULT,
	ALTER COLUMN userunit_data DROP NOT NULL;
comment on column public."userunit".userunit_data is '';


-- =============================================
-- FIELD: user_id int
-- =============================================
-- ADD user_id
alter table public."userunit" add user_id int  ;
comment on column public."userunit".user_id is '';

-- MODIFY user_id
alter table public."userunit"
	alter column user_id type int,
	ALTER COLUMN user_id DROP DEFAULT,
	ALTER COLUMN user_id DROP NOT NULL;
comment on column public."userunit".user_id is '';


-- =============================================
-- FIELD: _createby integer
-- =============================================
-- ADD _createby
alter table public."userunit" add _createby integer not null ;
comment on column public."userunit"._createby is 'user yang pertama kali membuat record ini';

-- MODIFY _createby
alter table public."userunit"
	alter column _createby type integer,
	ALTER COLUMN _createby DROP DEFAULT,
	ALTER COLUMN _createby SET NOT NULL;
comment on column public."userunit"._createby is 'user yang pertama kali membuat record ini';


-- =============================================
-- FIELD: _createdate timestamp with time zone
-- =============================================
-- ADD _createdate
alter table public."userunit" add _createdate timestamp with time zone not null default now();
comment on column public."userunit"._createdate is 'waktu record dibuat pertama kali';

-- MODIFY _createdate
alter table public."userunit"
	alter column _createdate type timestamp with time zone,
	ALTER COLUMN _createdate SET DEFAULT now(),
	ALTER COLUMN _createdate SET NOT NULL;
comment on column public."userunit"._createdate is 'waktu record dibuat pertama kali';


-- =============================================
-- FIELD: _modifyby integer
-- =============================================
-- ADD _modifyby
alter table public."userunit" add _modifyby integer  ;
comment on column public."userunit"._modifyby is 'user yang terakhir modifikasi record ini';

-- MODIFY _modifyby
alter table public."userunit"
	alter column _modifyby type integer,
	ALTER COLUMN _modifyby DROP DEFAULT,
	ALTER COLUMN _modifyby DROP NOT NULL;
comment on column public."userunit"._modifyby is 'user yang terakhir modifikasi record ini';


-- =============================================
-- FIELD: _modifydate timestamp with time zone
-- =============================================
-- ADD _modifydate
alter table public."userunit" add _modifydate timestamp with time zone  ;
comment on column public."userunit"._modifydate is 'waktu terakhir record dimodifikasi';

-- MODIFY _modifydate
alter table public."userunit"
	alter column _modifydate type timestamp with time zone,
	ALTER COLUMN _modifydate DROP DEFAULT,
	ALTER COLUMN _modifydate DROP NOT NULL;
comment on column public."userunit"._modifydate is 'waktu terakhir record dimodifikasi';


-- =============================================
-- FIELD: _timestamp timestamp with time zone
-- =============================================
-- ADD _timestamp
alter table public."userunit" add _timestamp timestamp with time zone not null default now();
comment on column public."userunit"._timestamp is 'data timestamp';

-- MODIFY _timestamp
alter table public."userunit"
	alter column _timestamp type timestamp with time zone,
	ALTER COLUMN _timestamp SET DEFAULT now(),
	ALTER COLUMN _timestamp SET NOT NULL;
comment on column public."userunit"._timestamp is 'data timestamp';


-- =============================================
-- INDEX
-- =============================================
DROP INDEX IF EXISTS public.idx$public$userunit$_timestamp;
CREATE INDEX idx$public$userunit$_timestamp ON public.userunit (_timestamp);


-- =============================================
-- FOREIGN KEY CONSTRAINT
-- =============================================
-- Drop Existing Foreign Key Constraint 
ALTER TABLE public."userunit" DROP CONSTRAINT fk$public$userunit$unit_id;


-- Add Foreign Key Constraint  
ALTER TABLE public."userunit"
	ADD CONSTRAINT fk$public$userunit$unit_id
	FOREIGN KEY (unit_id)
	REFERENCES public."unit"(unit_id);


-- Add As Index, drop dulu jika sudah ada
DROP INDEX IF EXISTS public.idx_fk$public$userunit$unit_id;
CREATE INDEX idx_fk$public$userunit$unit_id ON public."userunit"(unit_id);	

	


-- =============================================
-- UNIQUE INDEX
-- =============================================
-- Drop existing unique index 
alter table public."userunit"
	drop constraint uq$public$userunit$userunit_pair;
	

-- Add unique index 
alter table  public."userunit"
	add constraint uq$public$userunit$userunit_pair unique (user_id, unit_id); 

