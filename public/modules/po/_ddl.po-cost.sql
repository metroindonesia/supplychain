-- po.sql


/* =============================================
 * CREATE TABLE public."pocost"
 * ============================================*/
create table public."pocost" (
	pocost_id bigint not null,
	constraint pocost_pk primary key (pocost_id)
);
comment on table public."pocost" is '';	


-- =============================================
-- FIELD: comp_id smallint
-- =============================================
-- ADD comp_id
alter table public."pocost" add comp_id smallint  ;
comment on column public."pocost".comp_id is '';

-- MODIFY comp_id
alter table public."pocost"
	alter column comp_id type smallint,
	ALTER COLUMN comp_id DROP DEFAULT,
	ALTER COLUMN comp_id DROP NOT NULL;
comment on column public."pocost".comp_id is '';


-- =============================================
-- FIELD: pocost_descr text
-- =============================================
-- ADD pocost_descr
alter table public."pocost" add pocost_descr text  ;
comment on column public."pocost".pocost_descr is '';

-- MODIFY pocost_descr
alter table public."pocost"
	alter column pocost_descr type text,
	ALTER COLUMN pocost_descr DROP DEFAULT,
	ALTER COLUMN pocost_descr DROP NOT NULL;
comment on column public."pocost".pocost_descr is '';


-- =============================================
-- FIELD: pocost_value decimal(18, 2)
-- =============================================
-- ADD pocost_value
alter table public."pocost" add pocost_value decimal(18, 2) not null default 0;
comment on column public."pocost".pocost_value is '';

-- MODIFY pocost_value
alter table public."pocost"
	alter column pocost_value type decimal(18, 2),
	ALTER COLUMN pocost_value SET DEFAULT 0,
	ALTER COLUMN pocost_value SET NOT NULL;
comment on column public."pocost".pocost_value is '';


-- =============================================
-- FIELD: curr_id smallint
-- =============================================
-- ADD curr_id
alter table public."pocost" add curr_id smallint  ;
comment on column public."pocost".curr_id is '';

-- MODIFY curr_id
alter table public."pocost"
	alter column curr_id type smallint,
	ALTER COLUMN curr_id DROP DEFAULT,
	ALTER COLUMN curr_id DROP NOT NULL;
comment on column public."pocost".curr_id is '';


-- =============================================
-- FIELD: po_id bigint
-- =============================================
-- ADD po_id
alter table public."pocost" add po_id bigint  ;
comment on column public."pocost".po_id is '';

-- MODIFY po_id
alter table public."pocost"
	alter column po_id type bigint,
	ALTER COLUMN po_id DROP DEFAULT,
	ALTER COLUMN po_id DROP NOT NULL;
comment on column public."pocost".po_id is '';


-- =============================================
-- FIELD: _createby integer
-- =============================================
-- ADD _createby
alter table public."pocost" add _createby integer not null ;
comment on column public."pocost"._createby is 'user yang pertama kali membuat record ini';

-- MODIFY _createby
alter table public."pocost"
	alter column _createby type integer,
	ALTER COLUMN _createby DROP DEFAULT,
	ALTER COLUMN _createby SET NOT NULL;
comment on column public."pocost"._createby is 'user yang pertama kali membuat record ini';


-- =============================================
-- FIELD: _createdate timestamp with time zone
-- =============================================
-- ADD _createdate
alter table public."pocost" add _createdate timestamp with time zone not null default now();
comment on column public."pocost"._createdate is 'waktu record dibuat pertama kali';

-- MODIFY _createdate
alter table public."pocost"
	alter column _createdate type timestamp with time zone,
	ALTER COLUMN _createdate SET DEFAULT now(),
	ALTER COLUMN _createdate SET NOT NULL;
comment on column public."pocost"._createdate is 'waktu record dibuat pertama kali';


-- =============================================
-- FIELD: _modifyby integer
-- =============================================
-- ADD _modifyby
alter table public."pocost" add _modifyby integer  ;
comment on column public."pocost"._modifyby is 'user yang terakhir modifikasi record ini';

-- MODIFY _modifyby
alter table public."pocost"
	alter column _modifyby type integer,
	ALTER COLUMN _modifyby DROP DEFAULT,
	ALTER COLUMN _modifyby DROP NOT NULL;
comment on column public."pocost"._modifyby is 'user yang terakhir modifikasi record ini';


-- =============================================
-- FIELD: _modifydate timestamp with time zone
-- =============================================
-- ADD _modifydate
alter table public."pocost" add _modifydate timestamp with time zone  ;
comment on column public."pocost"._modifydate is 'waktu terakhir record dimodifikasi';

-- MODIFY _modifydate
alter table public."pocost"
	alter column _modifydate type timestamp with time zone,
	ALTER COLUMN _modifydate DROP DEFAULT,
	ALTER COLUMN _modifydate DROP NOT NULL;
comment on column public."pocost"._modifydate is 'waktu terakhir record dimodifikasi';


-- =============================================
-- FIELD: _timestamp timestamp with time zone
-- =============================================
-- ADD _timestamp
alter table public."pocost" add _timestamp timestamp with time zone not null default now();
comment on column public."pocost"._timestamp is 'data timestamp';

-- MODIFY _timestamp
alter table public."pocost"
	alter column _timestamp type timestamp with time zone,
	ALTER COLUMN _timestamp SET DEFAULT now(),
	ALTER COLUMN _timestamp SET NOT NULL;
comment on column public."pocost"._timestamp is 'data timestamp';


-- =============================================
-- INDEX
-- =============================================
DROP INDEX IF EXISTS public.idx$public$pocost$_timestamp;
CREATE INDEX idx$public$pocost$_timestamp ON public.pocost (_timestamp);


-- =============================================
-- FOREIGN KEY CONSTRAINT
-- =============================================
-- Drop Existing Foreign Key Constraint 
ALTER TABLE public."pocost" DROP CONSTRAINT fk$public$pocost$comp_id;
ALTER TABLE public."pocost" DROP CONSTRAINT fk$public$pocost$curr_id;


-- Add Foreign Key Constraint  
ALTER TABLE public."pocost"
	ADD CONSTRAINT fk$public$pocost$comp_id
	FOREIGN KEY (comp_id)
	REFERENCES public."comp"(comp_id);


-- Add As Index, drop dulu jika sudah ada
DROP INDEX IF EXISTS public.idx_fk$public$pocost$comp_id;
CREATE INDEX idx_fk$public$pocost$comp_id ON public."pocost"(comp_id);	


ALTER TABLE public."pocost"
	ADD CONSTRAINT fk$public$pocost$curr_id
	FOREIGN KEY (curr_id)
	REFERENCES public."curr"(curr_id);


-- Add As Index, drop dulu jika sudah ada
DROP INDEX IF EXISTS public.idx_fk$public$pocost$curr_id;
CREATE INDEX idx_fk$public$pocost$curr_id ON public."pocost"(curr_id);	

	


-- =============================================
-- UNIQUE INDEX
-- =============================================