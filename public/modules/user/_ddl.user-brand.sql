-- user.sql


/* =============================================
 * CREATE TABLE public."userbrand"
 * ============================================*/
create table public."userbrand" (
	userbrand_id bigint not null,
	constraint userbrand_pk primary key (userbrand_id)
);
comment on table public."userbrand" is '';	


-- =============================================
-- FIELD: brand_id int
-- =============================================
-- ADD brand_id
alter table public."userbrand" add brand_id int not null default 0;
comment on column public."userbrand".brand_id is '';

-- MODIFY brand_id
alter table public."userbrand"
	alter column brand_id type int,
	ALTER COLUMN brand_id SET DEFAULT 0,
	ALTER COLUMN brand_id SET NOT NULL;
comment on column public."userbrand".brand_id is '';


-- =============================================
-- FIELD: userbrand_isdisabled boolean
-- =============================================
-- ADD userbrand_isdisabled
alter table public."userbrand" add userbrand_isdisabled boolean not null default false;
comment on column public."userbrand".userbrand_isdisabled is '';

-- MODIFY userbrand_isdisabled
alter table public."userbrand"
	alter column userbrand_isdisabled type boolean,
	ALTER COLUMN userbrand_isdisabled SET DEFAULT false,
	ALTER COLUMN userbrand_isdisabled SET NOT NULL;
comment on column public."userbrand".userbrand_isdisabled is '';


-- =============================================
-- FIELD: userbrand_data json
-- =============================================
-- ADD userbrand_data
alter table public."userbrand" add userbrand_data json  ;
comment on column public."userbrand".userbrand_data is '';

-- MODIFY userbrand_data
alter table public."userbrand"
	alter column userbrand_data type json,
	ALTER COLUMN userbrand_data DROP DEFAULT,
	ALTER COLUMN userbrand_data DROP NOT NULL;
comment on column public."userbrand".userbrand_data is '';


-- =============================================
-- FIELD: user_id int
-- =============================================
-- ADD user_id
alter table public."userbrand" add user_id int  ;
comment on column public."userbrand".user_id is '';

-- MODIFY user_id
alter table public."userbrand"
	alter column user_id type int,
	ALTER COLUMN user_id DROP DEFAULT,
	ALTER COLUMN user_id DROP NOT NULL;
comment on column public."userbrand".user_id is '';


-- =============================================
-- FIELD: _createby integer
-- =============================================
-- ADD _createby
alter table public."userbrand" add _createby integer not null ;
comment on column public."userbrand"._createby is 'user yang pertama kali membuat record ini';

-- MODIFY _createby
alter table public."userbrand"
	alter column _createby type integer,
	ALTER COLUMN _createby DROP DEFAULT,
	ALTER COLUMN _createby SET NOT NULL;
comment on column public."userbrand"._createby is 'user yang pertama kali membuat record ini';


-- =============================================
-- FIELD: _createdate timestamp with time zone
-- =============================================
-- ADD _createdate
alter table public."userbrand" add _createdate timestamp with time zone not null default now();
comment on column public."userbrand"._createdate is 'waktu record dibuat pertama kali';

-- MODIFY _createdate
alter table public."userbrand"
	alter column _createdate type timestamp with time zone,
	ALTER COLUMN _createdate SET DEFAULT now(),
	ALTER COLUMN _createdate SET NOT NULL;
comment on column public."userbrand"._createdate is 'waktu record dibuat pertama kali';


-- =============================================
-- FIELD: _modifyby integer
-- =============================================
-- ADD _modifyby
alter table public."userbrand" add _modifyby integer  ;
comment on column public."userbrand"._modifyby is 'user yang terakhir modifikasi record ini';

-- MODIFY _modifyby
alter table public."userbrand"
	alter column _modifyby type integer,
	ALTER COLUMN _modifyby DROP DEFAULT,
	ALTER COLUMN _modifyby DROP NOT NULL;
comment on column public."userbrand"._modifyby is 'user yang terakhir modifikasi record ini';


-- =============================================
-- FIELD: _modifydate timestamp with time zone
-- =============================================
-- ADD _modifydate
alter table public."userbrand" add _modifydate timestamp with time zone  ;
comment on column public."userbrand"._modifydate is 'waktu terakhir record dimodifikasi';

-- MODIFY _modifydate
alter table public."userbrand"
	alter column _modifydate type timestamp with time zone,
	ALTER COLUMN _modifydate DROP DEFAULT,
	ALTER COLUMN _modifydate DROP NOT NULL;
comment on column public."userbrand"._modifydate is 'waktu terakhir record dimodifikasi';


-- =============================================
-- FIELD: _timestamp timestamp with time zone
-- =============================================
-- ADD _timestamp
alter table public."userbrand" add _timestamp timestamp with time zone not null default now();
comment on column public."userbrand"._timestamp is 'data timestamp';

-- MODIFY _timestamp
alter table public."userbrand"
	alter column _timestamp type timestamp with time zone,
	ALTER COLUMN _timestamp SET DEFAULT now(),
	ALTER COLUMN _timestamp SET NOT NULL;
comment on column public."userbrand"._timestamp is 'data timestamp';


-- =============================================
-- INDEX
-- =============================================
DROP INDEX IF EXISTS public.idx$public$userbrand$_timestamp;
CREATE INDEX idx$public$userbrand$_timestamp ON public.userbrand (_timestamp);


-- =============================================
-- FOREIGN KEY CONSTRAINT
-- =============================================
-- Drop Existing Foreign Key Constraint 
ALTER TABLE public."userbrand" DROP CONSTRAINT fk$public$userbrand$brand_id;


-- Add Foreign Key Constraint  
ALTER TABLE public."userbrand"
	ADD CONSTRAINT fk$public$userbrand$brand_id
	FOREIGN KEY (brand_id)
	REFERENCES public."brand"(brand_id);


-- Add As Index, drop dulu jika sudah ada
DROP INDEX IF EXISTS public.idx_fk$public$userbrand$brand_id;
CREATE INDEX idx_fk$public$userbrand$brand_id ON public."userbrand"(brand_id);	

	


-- =============================================
-- UNIQUE INDEX
-- =============================================
-- Drop existing unique index 
alter table public."userbrand"
	drop constraint uq$public$userbrand$userbrand_pair;
	

-- Add unique index 
alter table  public."userbrand"
	add constraint uq$public$userbrand$userbrand_pair unique (user_id, brand_id); 

