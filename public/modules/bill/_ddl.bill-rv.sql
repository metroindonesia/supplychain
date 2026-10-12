-- bill.sql


/* =============================================
 * CREATE TABLE public."billrv"
 * ============================================*/
create table public."billrv" (
	billrv_id bigint not null,
	constraint billrv_pk primary key (billrv_id)
);
comment on table public."billrv" is '';	


-- =============================================
-- FIELD: mov_id bigint
-- =============================================
-- ADD mov_id
alter table public."billrv" add mov_id bigint  ;
comment on column public."billrv".mov_id is '';

-- MODIFY mov_id
alter table public."billrv"
	alter column mov_id type bigint,
	ALTER COLUMN mov_id DROP DEFAULT,
	ALTER COLUMN mov_id DROP NOT NULL;
comment on column public."billrv".mov_id is '';


-- =============================================
-- FIELD: billrv_descr text
-- =============================================
-- ADD billrv_descr
alter table public."billrv" add billrv_descr text  ;
comment on column public."billrv".billrv_descr is '';

-- MODIFY billrv_descr
alter table public."billrv"
	alter column billrv_descr type text,
	ALTER COLUMN billrv_descr DROP DEFAULT,
	ALTER COLUMN billrv_descr DROP NOT NULL;
comment on column public."billrv".billrv_descr is '';


-- =============================================
-- FIELD: billrv_totalfob decimal(18, 2)
-- =============================================
-- ADD billrv_totalfob
alter table public."billrv" add billrv_totalfob decimal(18, 2) not null default 0;
comment on column public."billrv".billrv_totalfob is '';

-- MODIFY billrv_totalfob
alter table public."billrv"
	alter column billrv_totalfob type decimal(18, 2),
	ALTER COLUMN billrv_totalfob SET DEFAULT 0,
	ALTER COLUMN billrv_totalfob SET NOT NULL;
comment on column public."billrv".billrv_totalfob is '';


-- =============================================
-- FIELD: curr_id smallint
-- =============================================
-- ADD curr_id
alter table public."billrv" add curr_id smallint  ;
comment on column public."billrv".curr_id is '';

-- MODIFY curr_id
alter table public."billrv"
	alter column curr_id type smallint,
	ALTER COLUMN curr_id DROP DEFAULT,
	ALTER COLUMN curr_id DROP NOT NULL;
comment on column public."billrv".curr_id is '';


-- =============================================
-- FIELD: bill_id bigint
-- =============================================
-- ADD bill_id
alter table public."billrv" add bill_id bigint  ;
comment on column public."billrv".bill_id is '';

-- MODIFY bill_id
alter table public."billrv"
	alter column bill_id type bigint,
	ALTER COLUMN bill_id DROP DEFAULT,
	ALTER COLUMN bill_id DROP NOT NULL;
comment on column public."billrv".bill_id is '';


-- =============================================
-- FIELD: _createby integer
-- =============================================
-- ADD _createby
alter table public."billrv" add _createby integer not null ;
comment on column public."billrv"._createby is 'user yang pertama kali membuat record ini';

-- MODIFY _createby
alter table public."billrv"
	alter column _createby type integer,
	ALTER COLUMN _createby DROP DEFAULT,
	ALTER COLUMN _createby SET NOT NULL;
comment on column public."billrv"._createby is 'user yang pertama kali membuat record ini';


-- =============================================
-- FIELD: _createdate timestamp with time zone
-- =============================================
-- ADD _createdate
alter table public."billrv" add _createdate timestamp with time zone not null default now();
comment on column public."billrv"._createdate is 'waktu record dibuat pertama kali';

-- MODIFY _createdate
alter table public."billrv"
	alter column _createdate type timestamp with time zone,
	ALTER COLUMN _createdate SET DEFAULT now(),
	ALTER COLUMN _createdate SET NOT NULL;
comment on column public."billrv"._createdate is 'waktu record dibuat pertama kali';


-- =============================================
-- FIELD: _modifyby integer
-- =============================================
-- ADD _modifyby
alter table public."billrv" add _modifyby integer  ;
comment on column public."billrv"._modifyby is 'user yang terakhir modifikasi record ini';

-- MODIFY _modifyby
alter table public."billrv"
	alter column _modifyby type integer,
	ALTER COLUMN _modifyby DROP DEFAULT,
	ALTER COLUMN _modifyby DROP NOT NULL;
comment on column public."billrv"._modifyby is 'user yang terakhir modifikasi record ini';


-- =============================================
-- FIELD: _modifydate timestamp with time zone
-- =============================================
-- ADD _modifydate
alter table public."billrv" add _modifydate timestamp with time zone  ;
comment on column public."billrv"._modifydate is 'waktu terakhir record dimodifikasi';

-- MODIFY _modifydate
alter table public."billrv"
	alter column _modifydate type timestamp with time zone,
	ALTER COLUMN _modifydate DROP DEFAULT,
	ALTER COLUMN _modifydate DROP NOT NULL;
comment on column public."billrv"._modifydate is 'waktu terakhir record dimodifikasi';


-- =============================================
-- FIELD: _timestamp timestamp with time zone
-- =============================================
-- ADD _timestamp
alter table public."billrv" add _timestamp timestamp with time zone not null default now();
comment on column public."billrv"._timestamp is 'data timestamp';

-- MODIFY _timestamp
alter table public."billrv"
	alter column _timestamp type timestamp with time zone,
	ALTER COLUMN _timestamp SET DEFAULT now(),
	ALTER COLUMN _timestamp SET NOT NULL;
comment on column public."billrv"._timestamp is 'data timestamp';


-- =============================================
-- INDEX
-- =============================================
DROP INDEX IF EXISTS public.idx$public$billrv$_timestamp;
CREATE INDEX idx$public$billrv$_timestamp ON public.billrv (_timestamp);


-- =============================================
-- FOREIGN KEY CONSTRAINT
-- =============================================
-- Drop Existing Foreign Key Constraint 
ALTER TABLE public."billrv" DROP CONSTRAINT fk$public$billrv$mov_id;
ALTER TABLE public."billrv" DROP CONSTRAINT fk$public$billrv$curr_id;


-- Add Foreign Key Constraint  
ALTER TABLE public."billrv"
	ADD CONSTRAINT fk$public$billrv$mov_id
	FOREIGN KEY (mov_id)
	REFERENCES public."mov"(mov_id);


-- Add As Index, drop dulu jika sudah ada
DROP INDEX IF EXISTS public.idx_fk$public$billrv$mov_id;
CREATE INDEX idx_fk$public$billrv$mov_id ON public."billrv"(mov_id);	


ALTER TABLE public."billrv"
	ADD CONSTRAINT fk$public$billrv$curr_id
	FOREIGN KEY (curr_id)
	REFERENCES public."curr"(curr_id);


-- Add As Index, drop dulu jika sudah ada
DROP INDEX IF EXISTS public.idx_fk$public$billrv$curr_id;
CREATE INDEX idx_fk$public$billrv$curr_id ON public."billrv"(curr_id);	

	


-- =============================================
-- UNIQUE INDEX
-- =============================================