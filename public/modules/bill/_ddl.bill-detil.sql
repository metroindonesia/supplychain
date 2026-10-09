-- bill.sql


/* =============================================
 * CREATE TABLE public."billdetil"
 * ============================================*/
create table public."billdetil" (
	billdetil_id bigint not null,
	constraint billdetil_pk primary key (billdetil_id)
);
comment on table public."billdetil" is '';	


-- =============================================
-- FIELD: comp_id smallint
-- =============================================
-- ADD comp_id
alter table public."billdetil" add comp_id smallint  ;
comment on column public."billdetil".comp_id is '';

-- MODIFY comp_id
alter table public."billdetil"
	alter column comp_id type smallint,
	ALTER COLUMN comp_id DROP DEFAULT,
	ALTER COLUMN comp_id DROP NOT NULL;
comment on column public."billdetil".comp_id is '';


-- =============================================
-- FIELD: billdetil_descr text
-- =============================================
-- ADD billdetil_descr
alter table public."billdetil" add billdetil_descr text  ;
comment on column public."billdetil".billdetil_descr is '';

-- MODIFY billdetil_descr
alter table public."billdetil"
	alter column billdetil_descr type text,
	ALTER COLUMN billdetil_descr DROP DEFAULT,
	ALTER COLUMN billdetil_descr DROP NOT NULL;
comment on column public."billdetil".billdetil_descr is '';


-- =============================================
-- FIELD: billdetil_value decimal(18, 2)
-- =============================================
-- ADD billdetil_value
alter table public."billdetil" add billdetil_value decimal(18, 2) not null default 0;
comment on column public."billdetil".billdetil_value is '';

-- MODIFY billdetil_value
alter table public."billdetil"
	alter column billdetil_value type decimal(18, 2),
	ALTER COLUMN billdetil_value SET DEFAULT 0,
	ALTER COLUMN billdetil_value SET NOT NULL;
comment on column public."billdetil".billdetil_value is '';


-- =============================================
-- FIELD: curr_id smallint
-- =============================================
-- ADD curr_id
alter table public."billdetil" add curr_id smallint  ;
comment on column public."billdetil".curr_id is '';

-- MODIFY curr_id
alter table public."billdetil"
	alter column curr_id type smallint,
	ALTER COLUMN curr_id DROP DEFAULT,
	ALTER COLUMN curr_id DROP NOT NULL;
comment on column public."billdetil".curr_id is '';


-- =============================================
-- FIELD: bill_id bigint
-- =============================================
-- ADD bill_id
alter table public."billdetil" add bill_id bigint  ;
comment on column public."billdetil".bill_id is '';

-- MODIFY bill_id
alter table public."billdetil"
	alter column bill_id type bigint,
	ALTER COLUMN bill_id DROP DEFAULT,
	ALTER COLUMN bill_id DROP NOT NULL;
comment on column public."billdetil".bill_id is '';


-- =============================================
-- FIELD: _createby integer
-- =============================================
-- ADD _createby
alter table public."billdetil" add _createby integer not null ;
comment on column public."billdetil"._createby is 'user yang pertama kali membuat record ini';

-- MODIFY _createby
alter table public."billdetil"
	alter column _createby type integer,
	ALTER COLUMN _createby DROP DEFAULT,
	ALTER COLUMN _createby SET NOT NULL;
comment on column public."billdetil"._createby is 'user yang pertama kali membuat record ini';


-- =============================================
-- FIELD: _createdate timestamp with time zone
-- =============================================
-- ADD _createdate
alter table public."billdetil" add _createdate timestamp with time zone not null default now();
comment on column public."billdetil"._createdate is 'waktu record dibuat pertama kali';

-- MODIFY _createdate
alter table public."billdetil"
	alter column _createdate type timestamp with time zone,
	ALTER COLUMN _createdate SET DEFAULT now(),
	ALTER COLUMN _createdate SET NOT NULL;
comment on column public."billdetil"._createdate is 'waktu record dibuat pertama kali';


-- =============================================
-- FIELD: _modifyby integer
-- =============================================
-- ADD _modifyby
alter table public."billdetil" add _modifyby integer  ;
comment on column public."billdetil"._modifyby is 'user yang terakhir modifikasi record ini';

-- MODIFY _modifyby
alter table public."billdetil"
	alter column _modifyby type integer,
	ALTER COLUMN _modifyby DROP DEFAULT,
	ALTER COLUMN _modifyby DROP NOT NULL;
comment on column public."billdetil"._modifyby is 'user yang terakhir modifikasi record ini';


-- =============================================
-- FIELD: _modifydate timestamp with time zone
-- =============================================
-- ADD _modifydate
alter table public."billdetil" add _modifydate timestamp with time zone  ;
comment on column public."billdetil"._modifydate is 'waktu terakhir record dimodifikasi';

-- MODIFY _modifydate
alter table public."billdetil"
	alter column _modifydate type timestamp with time zone,
	ALTER COLUMN _modifydate DROP DEFAULT,
	ALTER COLUMN _modifydate DROP NOT NULL;
comment on column public."billdetil"._modifydate is 'waktu terakhir record dimodifikasi';


-- =============================================
-- FIELD: _timestamp timestamp with time zone
-- =============================================
-- ADD _timestamp
alter table public."billdetil" add _timestamp timestamp with time zone not null default now();
comment on column public."billdetil"._timestamp is 'data timestamp';

-- MODIFY _timestamp
alter table public."billdetil"
	alter column _timestamp type timestamp with time zone,
	ALTER COLUMN _timestamp SET DEFAULT now(),
	ALTER COLUMN _timestamp SET NOT NULL;
comment on column public."billdetil"._timestamp is 'data timestamp';


-- =============================================
-- INDEX
-- =============================================
DROP INDEX IF EXISTS public.idx$public$billdetil$_timestamp;
CREATE INDEX idx$public$billdetil$_timestamp ON public.billdetil (_timestamp);


-- =============================================
-- FOREIGN KEY CONSTRAINT
-- =============================================
-- Drop Existing Foreign Key Constraint 
ALTER TABLE public."billdetil" DROP CONSTRAINT fk$public$billdetil$comp_id;
ALTER TABLE public."billdetil" DROP CONSTRAINT fk$public$billdetil$curr_id;


-- Add Foreign Key Constraint  
ALTER TABLE public."billdetil"
	ADD CONSTRAINT fk$public$billdetil$comp_id
	FOREIGN KEY (comp_id)
	REFERENCES public."comp"(comp_id);


-- Add As Index, drop dulu jika sudah ada
DROP INDEX IF EXISTS public.idx_fk$public$billdetil$comp_id;
CREATE INDEX idx_fk$public$billdetil$comp_id ON public."billdetil"(comp_id);	


ALTER TABLE public."billdetil"
	ADD CONSTRAINT fk$public$billdetil$curr_id
	FOREIGN KEY (curr_id)
	REFERENCES public."curr"(curr_id);


-- Add As Index, drop dulu jika sudah ada
DROP INDEX IF EXISTS public.idx_fk$public$billdetil$curr_id;
CREATE INDEX idx_fk$public$billdetil$curr_id ON public."billdetil"(curr_id);	

	


-- =============================================
-- UNIQUE INDEX
-- =============================================