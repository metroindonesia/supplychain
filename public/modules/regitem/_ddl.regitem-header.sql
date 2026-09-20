-- regitem.sql


/* =============================================
 * CREATE TABLE public."regitem"
 * ============================================*/
create table public."regitem" (
	regitem_id bigint not null,
	constraint regitem_pk primary key (regitem_id)
);
comment on table public."regitem" is '';	


-- =============================================
-- FIELD: regitemtype_id smallint
-- =============================================
-- ADD regitemtype_id
alter table public."regitem" add regitemtype_id smallint  ;
comment on column public."regitem".regitemtype_id is '';

-- MODIFY regitemtype_id
alter table public."regitem"
	alter column regitemtype_id type smallint,
	ALTER COLUMN regitemtype_id DROP DEFAULT,
	ALTER COLUMN regitemtype_id DROP NOT NULL;
comment on column public."regitem".regitemtype_id is '';


-- =============================================
-- FIELD: _createby integer
-- =============================================
-- ADD _createby
alter table public."regitem" add _createby integer not null ;
comment on column public."regitem"._createby is 'user yang pertama kali membuat record ini';

-- MODIFY _createby
alter table public."regitem"
	alter column _createby type integer,
	ALTER COLUMN _createby DROP DEFAULT,
	ALTER COLUMN _createby SET NOT NULL;
comment on column public."regitem"._createby is 'user yang pertama kali membuat record ini';


-- =============================================
-- FIELD: _createdate timestamp with time zone
-- =============================================
-- ADD _createdate
alter table public."regitem" add _createdate timestamp with time zone not null default now();
comment on column public."regitem"._createdate is 'waktu record dibuat pertama kali';

-- MODIFY _createdate
alter table public."regitem"
	alter column _createdate type timestamp with time zone,
	ALTER COLUMN _createdate SET DEFAULT now(),
	ALTER COLUMN _createdate SET NOT NULL;
comment on column public."regitem"._createdate is 'waktu record dibuat pertama kali';


-- =============================================
-- FIELD: _modifyby integer
-- =============================================
-- ADD _modifyby
alter table public."regitem" add _modifyby integer  ;
comment on column public."regitem"._modifyby is 'user yang terakhir modifikasi record ini';

-- MODIFY _modifyby
alter table public."regitem"
	alter column _modifyby type integer,
	ALTER COLUMN _modifyby DROP DEFAULT,
	ALTER COLUMN _modifyby DROP NOT NULL;
comment on column public."regitem"._modifyby is 'user yang terakhir modifikasi record ini';


-- =============================================
-- FIELD: _modifydate timestamp with time zone
-- =============================================
-- ADD _modifydate
alter table public."regitem" add _modifydate timestamp with time zone  ;
comment on column public."regitem"._modifydate is 'waktu terakhir record dimodifikasi';

-- MODIFY _modifydate
alter table public."regitem"
	alter column _modifydate type timestamp with time zone,
	ALTER COLUMN _modifydate DROP DEFAULT,
	ALTER COLUMN _modifydate DROP NOT NULL;
comment on column public."regitem"._modifydate is 'waktu terakhir record dimodifikasi';


-- =============================================
-- FIELD: _timestamp timestamp with time zone
-- =============================================
-- ADD _timestamp
alter table public."regitem" add _timestamp timestamp with time zone not null default now();
comment on column public."regitem"._timestamp is 'data timestamp';

-- MODIFY _timestamp
alter table public."regitem"
	alter column _timestamp type timestamp with time zone,
	ALTER COLUMN _timestamp SET DEFAULT now(),
	ALTER COLUMN _timestamp SET NOT NULL;
comment on column public."regitem"._timestamp is 'data timestamp';


-- =============================================
-- INDEX
-- =============================================
DROP INDEX IF EXISTS public.idx$public$regitem$_timestamp;
CREATE INDEX idx$public$regitem$_timestamp ON public.regitem (_timestamp);


-- =============================================
-- FOREIGN KEY CONSTRAINT
-- =============================================
-- Add Foreign Key Constraint  
ALTER TABLE public."regitem"
	ADD CONSTRAINT fk$public$regitem$regitemtype_id
	FOREIGN KEY (regitemtype_id)
	REFERENCES public."regitemtype"(regitemtype_id);


-- Add As Index, drop dulu jika sudah ada
DROP INDEX IF EXISTS public.idx_fk$public$regitem$regitemtype_id;
CREATE INDEX idx_fk$public$regitem$regitemtype_id ON public."regitem"(regitemtype_id);	

	


-- =============================================
-- UNIQUE INDEX
-- =============================================