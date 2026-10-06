-- model.sql


/* =============================================
 * CREATE TABLE public."modelprop"
 * ============================================*/
create table public."modelprop" (
	modelprop_id bigint not null,
	constraint modelprop_pk primary key (modelprop_id)
);
comment on table public."modelprop" is '';	


-- =============================================
-- FIELD: prop_id smallint
-- =============================================
-- ADD prop_id
alter table public."modelprop" add prop_id smallint  ;
comment on column public."modelprop".prop_id is '';

-- MODIFY prop_id
alter table public."modelprop"
	alter column prop_id type smallint,
	ALTER COLUMN prop_id DROP DEFAULT,
	ALTER COLUMN prop_id DROP NOT NULL;
comment on column public."modelprop".prop_id is '';


-- =============================================
-- FIELD: prop_descr text
-- =============================================
-- ADD prop_descr
alter table public."modelprop" add prop_descr text  ;
comment on column public."modelprop".prop_descr is '';

-- MODIFY prop_descr
alter table public."modelprop"
	alter column prop_descr type text,
	ALTER COLUMN prop_descr DROP DEFAULT,
	ALTER COLUMN prop_descr DROP NOT NULL;
comment on column public."modelprop".prop_descr is '';


-- =============================================
-- FIELD: model_id int
-- =============================================
-- ADD model_id
alter table public."modelprop" add model_id int  ;
comment on column public."modelprop".model_id is '';

-- MODIFY model_id
alter table public."modelprop"
	alter column model_id type int,
	ALTER COLUMN model_id DROP DEFAULT,
	ALTER COLUMN model_id DROP NOT NULL;
comment on column public."modelprop".model_id is '';


-- =============================================
-- FIELD: _createby integer
-- =============================================
-- ADD _createby
alter table public."modelprop" add _createby integer not null ;
comment on column public."modelprop"._createby is 'user yang pertama kali membuat record ini';

-- MODIFY _createby
alter table public."modelprop"
	alter column _createby type integer,
	ALTER COLUMN _createby DROP DEFAULT,
	ALTER COLUMN _createby SET NOT NULL;
comment on column public."modelprop"._createby is 'user yang pertama kali membuat record ini';


-- =============================================
-- FIELD: _createdate timestamp with time zone
-- =============================================
-- ADD _createdate
alter table public."modelprop" add _createdate timestamp with time zone not null default now();
comment on column public."modelprop"._createdate is 'waktu record dibuat pertama kali';

-- MODIFY _createdate
alter table public."modelprop"
	alter column _createdate type timestamp with time zone,
	ALTER COLUMN _createdate SET DEFAULT now(),
	ALTER COLUMN _createdate SET NOT NULL;
comment on column public."modelprop"._createdate is 'waktu record dibuat pertama kali';


-- =============================================
-- FIELD: _modifyby integer
-- =============================================
-- ADD _modifyby
alter table public."modelprop" add _modifyby integer  ;
comment on column public."modelprop"._modifyby is 'user yang terakhir modifikasi record ini';

-- MODIFY _modifyby
alter table public."modelprop"
	alter column _modifyby type integer,
	ALTER COLUMN _modifyby DROP DEFAULT,
	ALTER COLUMN _modifyby DROP NOT NULL;
comment on column public."modelprop"._modifyby is 'user yang terakhir modifikasi record ini';


-- =============================================
-- FIELD: _modifydate timestamp with time zone
-- =============================================
-- ADD _modifydate
alter table public."modelprop" add _modifydate timestamp with time zone  ;
comment on column public."modelprop"._modifydate is 'waktu terakhir record dimodifikasi';

-- MODIFY _modifydate
alter table public."modelprop"
	alter column _modifydate type timestamp with time zone,
	ALTER COLUMN _modifydate DROP DEFAULT,
	ALTER COLUMN _modifydate DROP NOT NULL;
comment on column public."modelprop"._modifydate is 'waktu terakhir record dimodifikasi';


-- =============================================
-- FIELD: _timestamp timestamp with time zone
-- =============================================
-- ADD _timestamp
alter table public."modelprop" add _timestamp timestamp with time zone not null default now();
comment on column public."modelprop"._timestamp is 'data timestamp';

-- MODIFY _timestamp
alter table public."modelprop"
	alter column _timestamp type timestamp with time zone,
	ALTER COLUMN _timestamp SET DEFAULT now(),
	ALTER COLUMN _timestamp SET NOT NULL;
comment on column public."modelprop"._timestamp is 'data timestamp';


-- =============================================
-- INDEX
-- =============================================
DROP INDEX IF EXISTS public.idx$public$modelprop$_timestamp;
CREATE INDEX idx$public$modelprop$_timestamp ON public.modelprop (_timestamp);


-- =============================================
-- FOREIGN KEY CONSTRAINT
-- =============================================
-- Drop Existing Foreign Key Constraint 
ALTER TABLE public."modelprop" DROP CONSTRAINT fk$public$modelprop$prop_id;


-- Add Foreign Key Constraint  
ALTER TABLE public."modelprop"
	ADD CONSTRAINT fk$public$modelprop$prop_id
	FOREIGN KEY (prop_id)
	REFERENCES public."prop"(prop_id);


-- Add As Index, drop dulu jika sudah ada
DROP INDEX IF EXISTS public.idx_fk$public$modelprop$prop_id;
CREATE INDEX idx_fk$public$modelprop$prop_id ON public."modelprop"(prop_id);	

	


-- =============================================
-- UNIQUE INDEX
-- =============================================