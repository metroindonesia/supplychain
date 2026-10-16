-- batch.sql


/* =============================================
 * CREATE TABLE public."batch"
 * ============================================*/
create table public."batch" (
	batch_id int not null,
	constraint batch_pk primary key (batch_id)
);
comment on table public."batch" is '';	


-- =============================================
-- FIELD: sku_id bigint
-- =============================================
-- ADD sku_id
alter table public."batch" add sku_id bigint  ;
comment on column public."batch".sku_id is '';

-- MODIFY sku_id
alter table public."batch"
	alter column sku_id type bigint,
	ALTER COLUMN sku_id DROP DEFAULT,
	ALTER COLUMN sku_id DROP NOT NULL;
comment on column public."batch".sku_id is '';


-- =============================================
-- FIELD: batch_expdate date
-- =============================================
-- ADD batch_expdate
alter table public."batch" add batch_expdate date  default now();
comment on column public."batch".batch_expdate is '';

-- MODIFY batch_expdate
alter table public."batch"
	alter column batch_expdate type date,
	ALTER COLUMN batch_expdate SET DEFAULT now(),
	ALTER COLUMN batch_expdate DROP NOT NULL;
comment on column public."batch".batch_expdate is '';


-- =============================================
-- FIELD: _createby integer
-- =============================================
-- ADD _createby
alter table public."batch" add _createby integer not null ;
comment on column public."batch"._createby is 'user yang pertama kali membuat record ini';

-- MODIFY _createby
alter table public."batch"
	alter column _createby type integer,
	ALTER COLUMN _createby DROP DEFAULT,
	ALTER COLUMN _createby SET NOT NULL;
comment on column public."batch"._createby is 'user yang pertama kali membuat record ini';


-- =============================================
-- FIELD: _createdate timestamp with time zone
-- =============================================
-- ADD _createdate
alter table public."batch" add _createdate timestamp with time zone not null default now();
comment on column public."batch"._createdate is 'waktu record dibuat pertama kali';

-- MODIFY _createdate
alter table public."batch"
	alter column _createdate type timestamp with time zone,
	ALTER COLUMN _createdate SET DEFAULT now(),
	ALTER COLUMN _createdate SET NOT NULL;
comment on column public."batch"._createdate is 'waktu record dibuat pertama kali';


-- =============================================
-- FIELD: _modifyby integer
-- =============================================
-- ADD _modifyby
alter table public."batch" add _modifyby integer  ;
comment on column public."batch"._modifyby is 'user yang terakhir modifikasi record ini';

-- MODIFY _modifyby
alter table public."batch"
	alter column _modifyby type integer,
	ALTER COLUMN _modifyby DROP DEFAULT,
	ALTER COLUMN _modifyby DROP NOT NULL;
comment on column public."batch"._modifyby is 'user yang terakhir modifikasi record ini';


-- =============================================
-- FIELD: _modifydate timestamp with time zone
-- =============================================
-- ADD _modifydate
alter table public."batch" add _modifydate timestamp with time zone  ;
comment on column public."batch"._modifydate is 'waktu terakhir record dimodifikasi';

-- MODIFY _modifydate
alter table public."batch"
	alter column _modifydate type timestamp with time zone,
	ALTER COLUMN _modifydate DROP DEFAULT,
	ALTER COLUMN _modifydate DROP NOT NULL;
comment on column public."batch"._modifydate is 'waktu terakhir record dimodifikasi';


-- =============================================
-- FIELD: _timestamp timestamp with time zone
-- =============================================
-- ADD _timestamp
alter table public."batch" add _timestamp timestamp with time zone not null default now();
comment on column public."batch"._timestamp is 'data timestamp';

-- MODIFY _timestamp
alter table public."batch"
	alter column _timestamp type timestamp with time zone,
	ALTER COLUMN _timestamp SET DEFAULT now(),
	ALTER COLUMN _timestamp SET NOT NULL;
comment on column public."batch"._timestamp is 'data timestamp';


-- =============================================
-- INDEX
-- =============================================
DROP INDEX IF EXISTS public.idx$public$batch$_timestamp;
CREATE INDEX idx$public$batch$_timestamp ON public.batch (_timestamp);


-- =============================================
-- FOREIGN KEY CONSTRAINT
-- =============================================
-- Drop Existing Foreign Key Constraint 
ALTER TABLE public."batch" DROP CONSTRAINT fk$public$batch$sku_id;


-- Add Foreign Key Constraint  
ALTER TABLE public."batch"
	ADD CONSTRAINT fk$public$batch$sku_id
	FOREIGN KEY (sku_id)
	REFERENCES public."sku"(sku_id);


-- Add As Index, drop dulu jika sudah ada
DROP INDEX IF EXISTS public.idx_fk$public$batch$sku_id;
CREATE INDEX idx_fk$public$batch$sku_id ON public."batch"(sku_id);	

	


-- =============================================
-- UNIQUE INDEX
-- =============================================
-- Drop existing unique index 
alter table public."batch"
	drop constraint uq$public$batch$batch_pair;
	

-- Add unique index 
alter table  public."batch"
	add constraint uq$public$batch$batch_pair unique (sku_id, batch_expdate); 

