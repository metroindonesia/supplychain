-- product.sql


/* =============================================
 * CREATE TABLE public."productchannel"
 * ============================================*/
create table public."productchannel" (
	productchannel_id bigint not null,
	constraint productchannel_pk primary key (productchannel_id)
);
comment on table public."productchannel" is '';	


-- =============================================
-- FIELD: channel_id smallint
-- =============================================
-- ADD channel_id
alter table public."productchannel" add channel_id smallint  ;
comment on column public."productchannel".channel_id is '';

-- MODIFY channel_id
alter table public."productchannel"
	alter column channel_id type smallint,
	ALTER COLUMN channel_id DROP DEFAULT,
	ALTER COLUMN channel_id DROP NOT NULL;
comment on column public."productchannel".channel_id is '';


-- =============================================
-- FIELD: issuspended boolean
-- =============================================
-- ADD issuspended
alter table public."productchannel" add issuspended boolean not null default false;
comment on column public."productchannel".issuspended is '';

-- MODIFY issuspended
alter table public."productchannel"
	alter column issuspended type boolean,
	ALTER COLUMN issuspended SET DEFAULT false,
	ALTER COLUMN issuspended SET NOT NULL;
comment on column public."productchannel".issuspended is '';


-- =============================================
-- FIELD: product_id bigint
-- =============================================
-- ADD product_id
alter table public."productchannel" add product_id bigint  ;
comment on column public."productchannel".product_id is '';

-- MODIFY product_id
alter table public."productchannel"
	alter column product_id type bigint,
	ALTER COLUMN product_id DROP DEFAULT,
	ALTER COLUMN product_id DROP NOT NULL;
comment on column public."productchannel".product_id is '';


-- =============================================
-- FIELD: _createby integer
-- =============================================
-- ADD _createby
alter table public."productchannel" add _createby integer not null ;
comment on column public."productchannel"._createby is 'user yang pertama kali membuat record ini';

-- MODIFY _createby
alter table public."productchannel"
	alter column _createby type integer,
	ALTER COLUMN _createby DROP DEFAULT,
	ALTER COLUMN _createby SET NOT NULL;
comment on column public."productchannel"._createby is 'user yang pertama kali membuat record ini';


-- =============================================
-- FIELD: _createdate timestamp with time zone
-- =============================================
-- ADD _createdate
alter table public."productchannel" add _createdate timestamp with time zone not null default now();
comment on column public."productchannel"._createdate is 'waktu record dibuat pertama kali';

-- MODIFY _createdate
alter table public."productchannel"
	alter column _createdate type timestamp with time zone,
	ALTER COLUMN _createdate SET DEFAULT now(),
	ALTER COLUMN _createdate SET NOT NULL;
comment on column public."productchannel"._createdate is 'waktu record dibuat pertama kali';


-- =============================================
-- FIELD: _modifyby integer
-- =============================================
-- ADD _modifyby
alter table public."productchannel" add _modifyby integer  ;
comment on column public."productchannel"._modifyby is 'user yang terakhir modifikasi record ini';

-- MODIFY _modifyby
alter table public."productchannel"
	alter column _modifyby type integer,
	ALTER COLUMN _modifyby DROP DEFAULT,
	ALTER COLUMN _modifyby DROP NOT NULL;
comment on column public."productchannel"._modifyby is 'user yang terakhir modifikasi record ini';


-- =============================================
-- FIELD: _modifydate timestamp with time zone
-- =============================================
-- ADD _modifydate
alter table public."productchannel" add _modifydate timestamp with time zone  ;
comment on column public."productchannel"._modifydate is 'waktu terakhir record dimodifikasi';

-- MODIFY _modifydate
alter table public."productchannel"
	alter column _modifydate type timestamp with time zone,
	ALTER COLUMN _modifydate DROP DEFAULT,
	ALTER COLUMN _modifydate DROP NOT NULL;
comment on column public."productchannel"._modifydate is 'waktu terakhir record dimodifikasi';


-- =============================================
-- FIELD: _timestamp timestamp with time zone
-- =============================================
-- ADD _timestamp
alter table public."productchannel" add _timestamp timestamp with time zone not null default now();
comment on column public."productchannel"._timestamp is 'data timestamp';

-- MODIFY _timestamp
alter table public."productchannel"
	alter column _timestamp type timestamp with time zone,
	ALTER COLUMN _timestamp SET DEFAULT now(),
	ALTER COLUMN _timestamp SET NOT NULL;
comment on column public."productchannel"._timestamp is 'data timestamp';


-- =============================================
-- INDEX
-- =============================================
DROP INDEX IF EXISTS public.idx$public$productchannel$_timestamp;
CREATE INDEX idx$public$productchannel$_timestamp ON public.productchannel (_timestamp);


-- =============================================
-- FOREIGN KEY CONSTRAINT
-- =============================================
-- Drop Existing Foreign Key Constraint 
ALTER TABLE public."productchannel" DROP CONSTRAINT fk$public$productchannel$channel_id;


-- Add Foreign Key Constraint  
ALTER TABLE public."productchannel"
	ADD CONSTRAINT fk$public$productchannel$channel_id
	FOREIGN KEY (channel_id)
	REFERENCES public."channel"(channel_id);


-- Add As Index, drop dulu jika sudah ada
DROP INDEX IF EXISTS public.idx_fk$public$productchannel$channel_id;
CREATE INDEX idx_fk$public$productchannel$channel_id ON public."productchannel"(channel_id);	

	


-- =============================================
-- UNIQUE INDEX
-- =============================================