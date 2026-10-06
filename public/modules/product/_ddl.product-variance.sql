-- product.sql


/* =============================================
 * CREATE TABLE public."variance"
 * ============================================*/
create table public."variance" (
	variance_id bigint not null,
	constraint variance_pk primary key (variance_id)
);
comment on table public."variance" is '';	


-- =============================================
-- FIELD: variance_isdisabled boolean
-- =============================================
-- ADD variance_isdisabled
alter table public."variance" add variance_isdisabled boolean not null default false;
comment on column public."variance".variance_isdisabled is '';

-- MODIFY variance_isdisabled
alter table public."variance"
	alter column variance_isdisabled type boolean,
	ALTER COLUMN variance_isdisabled SET DEFAULT false,
	ALTER COLUMN variance_isdisabled SET NOT NULL;
comment on column public."variance".variance_isdisabled is '';


-- =============================================
-- FIELD: variance_code varchar(30)
-- =============================================
-- ADD variance_code
alter table public."variance" add variance_code varchar(30) not null default '';
comment on column public."variance".variance_code is '';

-- MODIFY variance_code
alter table public."variance"
	alter column variance_code type varchar(30),
	ALTER COLUMN variance_code SET DEFAULT '',
	ALTER COLUMN variance_code SET NOT NULL;
comment on column public."variance".variance_code is '';


-- =============================================
-- FIELD: variance_name text
-- =============================================
-- ADD variance_name
alter table public."variance" add variance_name text  ;
comment on column public."variance".variance_name is '';

-- MODIFY variance_name
alter table public."variance"
	alter column variance_name type text,
	ALTER COLUMN variance_name DROP DEFAULT,
	ALTER COLUMN variance_name DROP NOT NULL;
comment on column public."variance".variance_name is '';


-- =============================================
-- FIELD: variance_descr text
-- =============================================
-- ADD variance_descr
alter table public."variance" add variance_descr text  ;
comment on column public."variance".variance_descr is '';

-- MODIFY variance_descr
alter table public."variance"
	alter column variance_descr type text,
	ALTER COLUMN variance_descr DROP DEFAULT,
	ALTER COLUMN variance_descr DROP NOT NULL;
comment on column public."variance".variance_descr is '';


-- =============================================
-- FIELD: product_id bigint
-- =============================================
-- ADD product_id
alter table public."variance" add product_id bigint  ;
comment on column public."variance".product_id is '';

-- MODIFY product_id
alter table public."variance"
	alter column product_id type bigint,
	ALTER COLUMN product_id DROP DEFAULT,
	ALTER COLUMN product_id DROP NOT NULL;
comment on column public."variance".product_id is '';


-- =============================================
-- FIELD: _createby integer
-- =============================================
-- ADD _createby
alter table public."variance" add _createby integer not null ;
comment on column public."variance"._createby is 'user yang pertama kali membuat record ini';

-- MODIFY _createby
alter table public."variance"
	alter column _createby type integer,
	ALTER COLUMN _createby DROP DEFAULT,
	ALTER COLUMN _createby SET NOT NULL;
comment on column public."variance"._createby is 'user yang pertama kali membuat record ini';


-- =============================================
-- FIELD: _createdate timestamp with time zone
-- =============================================
-- ADD _createdate
alter table public."variance" add _createdate timestamp with time zone not null default now();
comment on column public."variance"._createdate is 'waktu record dibuat pertama kali';

-- MODIFY _createdate
alter table public."variance"
	alter column _createdate type timestamp with time zone,
	ALTER COLUMN _createdate SET DEFAULT now(),
	ALTER COLUMN _createdate SET NOT NULL;
comment on column public."variance"._createdate is 'waktu record dibuat pertama kali';


-- =============================================
-- FIELD: _modifyby integer
-- =============================================
-- ADD _modifyby
alter table public."variance" add _modifyby integer  ;
comment on column public."variance"._modifyby is 'user yang terakhir modifikasi record ini';

-- MODIFY _modifyby
alter table public."variance"
	alter column _modifyby type integer,
	ALTER COLUMN _modifyby DROP DEFAULT,
	ALTER COLUMN _modifyby DROP NOT NULL;
comment on column public."variance"._modifyby is 'user yang terakhir modifikasi record ini';


-- =============================================
-- FIELD: _modifydate timestamp with time zone
-- =============================================
-- ADD _modifydate
alter table public."variance" add _modifydate timestamp with time zone  ;
comment on column public."variance"._modifydate is 'waktu terakhir record dimodifikasi';

-- MODIFY _modifydate
alter table public."variance"
	alter column _modifydate type timestamp with time zone,
	ALTER COLUMN _modifydate DROP DEFAULT,
	ALTER COLUMN _modifydate DROP NOT NULL;
comment on column public."variance"._modifydate is 'waktu terakhir record dimodifikasi';


-- =============================================
-- FIELD: _timestamp timestamp with time zone
-- =============================================
-- ADD _timestamp
alter table public."variance" add _timestamp timestamp with time zone not null default now();
comment on column public."variance"._timestamp is 'data timestamp';

-- MODIFY _timestamp
alter table public."variance"
	alter column _timestamp type timestamp with time zone,
	ALTER COLUMN _timestamp SET DEFAULT now(),
	ALTER COLUMN _timestamp SET NOT NULL;
comment on column public."variance"._timestamp is 'data timestamp';


-- =============================================
-- INDEX
-- =============================================
DROP INDEX IF EXISTS public.idx$public$variance$_timestamp;
CREATE INDEX idx$public$variance$_timestamp ON public.variance (_timestamp);




-- =============================================
-- UNIQUE INDEX
-- =============================================