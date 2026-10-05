-- user.sql


/* =============================================
 * CREATE TABLE public."usersite"
 * ============================================*/
create table public."usersite" (
	usersite_id bigint not null,
	constraint usersite_pk primary key (usersite_id)
);
comment on table public."usersite" is '';	


-- =============================================
-- FIELD: site_id int
-- =============================================
-- ADD site_id
alter table public."usersite" add site_id int not null default 0;
comment on column public."usersite".site_id is '';

-- MODIFY site_id
alter table public."usersite"
	alter column site_id type int,
	ALTER COLUMN site_id SET DEFAULT 0,
	ALTER COLUMN site_id SET NOT NULL;
comment on column public."usersite".site_id is '';


-- =============================================
-- FIELD: usersite_isdisabled boolean
-- =============================================
-- ADD usersite_isdisabled
alter table public."usersite" add usersite_isdisabled boolean not null default false;
comment on column public."usersite".usersite_isdisabled is '';

-- MODIFY usersite_isdisabled
alter table public."usersite"
	alter column usersite_isdisabled type boolean,
	ALTER COLUMN usersite_isdisabled SET DEFAULT false,
	ALTER COLUMN usersite_isdisabled SET NOT NULL;
comment on column public."usersite".usersite_isdisabled is '';


-- =============================================
-- FIELD: usersite_data json
-- =============================================
-- ADD usersite_data
alter table public."usersite" add usersite_data json  ;
comment on column public."usersite".usersite_data is '';

-- MODIFY usersite_data
alter table public."usersite"
	alter column usersite_data type json,
	ALTER COLUMN usersite_data DROP DEFAULT,
	ALTER COLUMN usersite_data DROP NOT NULL;
comment on column public."usersite".usersite_data is '';


-- =============================================
-- FIELD: user_id int
-- =============================================
-- ADD user_id
alter table public."usersite" add user_id int  ;
comment on column public."usersite".user_id is '';

-- MODIFY user_id
alter table public."usersite"
	alter column user_id type int,
	ALTER COLUMN user_id DROP DEFAULT,
	ALTER COLUMN user_id DROP NOT NULL;
comment on column public."usersite".user_id is '';


-- =============================================
-- FIELD: _createby integer
-- =============================================
-- ADD _createby
alter table public."usersite" add _createby integer not null ;
comment on column public."usersite"._createby is 'user yang pertama kali membuat record ini';

-- MODIFY _createby
alter table public."usersite"
	alter column _createby type integer,
	ALTER COLUMN _createby DROP DEFAULT,
	ALTER COLUMN _createby SET NOT NULL;
comment on column public."usersite"._createby is 'user yang pertama kali membuat record ini';


-- =============================================
-- FIELD: _createdate timestamp with time zone
-- =============================================
-- ADD _createdate
alter table public."usersite" add _createdate timestamp with time zone not null default now();
comment on column public."usersite"._createdate is 'waktu record dibuat pertama kali';

-- MODIFY _createdate
alter table public."usersite"
	alter column _createdate type timestamp with time zone,
	ALTER COLUMN _createdate SET DEFAULT now(),
	ALTER COLUMN _createdate SET NOT NULL;
comment on column public."usersite"._createdate is 'waktu record dibuat pertama kali';


-- =============================================
-- FIELD: _modifyby integer
-- =============================================
-- ADD _modifyby
alter table public."usersite" add _modifyby integer  ;
comment on column public."usersite"._modifyby is 'user yang terakhir modifikasi record ini';

-- MODIFY _modifyby
alter table public."usersite"
	alter column _modifyby type integer,
	ALTER COLUMN _modifyby DROP DEFAULT,
	ALTER COLUMN _modifyby DROP NOT NULL;
comment on column public."usersite"._modifyby is 'user yang terakhir modifikasi record ini';


-- =============================================
-- FIELD: _modifydate timestamp with time zone
-- =============================================
-- ADD _modifydate
alter table public."usersite" add _modifydate timestamp with time zone  ;
comment on column public."usersite"._modifydate is 'waktu terakhir record dimodifikasi';

-- MODIFY _modifydate
alter table public."usersite"
	alter column _modifydate type timestamp with time zone,
	ALTER COLUMN _modifydate DROP DEFAULT,
	ALTER COLUMN _modifydate DROP NOT NULL;
comment on column public."usersite"._modifydate is 'waktu terakhir record dimodifikasi';


-- =============================================
-- FIELD: _timestamp timestamp with time zone
-- =============================================
-- ADD _timestamp
alter table public."usersite" add _timestamp timestamp with time zone not null default now();
comment on column public."usersite"._timestamp is 'data timestamp';

-- MODIFY _timestamp
alter table public."usersite"
	alter column _timestamp type timestamp with time zone,
	ALTER COLUMN _timestamp SET DEFAULT now(),
	ALTER COLUMN _timestamp SET NOT NULL;
comment on column public."usersite"._timestamp is 'data timestamp';


-- =============================================
-- INDEX
-- =============================================
DROP INDEX IF EXISTS public.idx$public$usersite$_timestamp;
CREATE INDEX idx$public$usersite$_timestamp ON public.usersite (_timestamp);


-- =============================================
-- FOREIGN KEY CONSTRAINT
-- =============================================
-- Drop Existing Foreign Key Constraint 
ALTER TABLE public."usersite" DROP CONSTRAINT fk$public$usersite$site_id;


-- Add Foreign Key Constraint  
ALTER TABLE public."usersite"
	ADD CONSTRAINT fk$public$usersite$site_id
	FOREIGN KEY (site_id)
	REFERENCES public."site"(site_id);


-- Add As Index, drop dulu jika sudah ada
DROP INDEX IF EXISTS public.idx_fk$public$usersite$site_id;
CREATE INDEX idx_fk$public$usersite$site_id ON public."usersite"(site_id);	

	


-- =============================================
-- UNIQUE INDEX
-- =============================================
-- Drop existing unique index 
alter table public."usersite"
	drop constraint uq$public$usersite$usersite_pair;
	

-- Add unique index 
alter table  public."usersite"
	add constraint uq$public$usersite$usersite_pair unique (user_id, site_id); 

