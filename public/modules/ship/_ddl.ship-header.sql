-- ship.sql


/* =============================================
 * CREATE TABLE public."ship"
 * ============================================*/
create table public."ship" (
	ship_id bigint not null,
	constraint ship_pk primary key (ship_id)
);
comment on table public."ship" is '';	


-- =============================================
-- FIELD: ship_doc text
-- =============================================
-- ADD ship_doc
alter table public."ship" add ship_doc text  ;
comment on column public."ship".ship_doc is '';

-- MODIFY ship_doc
alter table public."ship"
	alter column ship_doc type text,
	ALTER COLUMN ship_doc DROP DEFAULT,
	ALTER COLUMN ship_doc DROP NOT NULL;
comment on column public."ship".ship_doc is '';


-- =============================================
-- FIELD: ship_version smallint
-- =============================================
-- ADD ship_version
alter table public."ship" add ship_version smallint not null default 0;
comment on column public."ship".ship_version is '';

-- MODIFY ship_version
alter table public."ship"
	alter column ship_version type smallint,
	ALTER COLUMN ship_version SET DEFAULT 0,
	ALTER COLUMN ship_version SET NOT NULL;
comment on column public."ship".ship_version is '';


-- =============================================
-- FIELD: _commit boolean
-- =============================================
-- ADD _commit
alter table public."ship" add _commit boolean not null default false;
comment on column public."ship"._commit is '';

-- MODIFY _commit
alter table public."ship"
	alter column _commit type boolean,
	ALTER COLUMN _commit SET DEFAULT false,
	ALTER COLUMN _commit SET NOT NULL;
comment on column public."ship"._commit is '';


-- =============================================
-- FIELD: _verify boolean
-- =============================================
-- ADD _verify
alter table public."ship" add _verify boolean not null default false;
comment on column public."ship"._verify is '';

-- MODIFY _verify
alter table public."ship"
	alter column _verify type boolean,
	ALTER COLUMN _verify SET DEFAULT false,
	ALTER COLUMN _verify SET NOT NULL;
comment on column public."ship"._verify is '';


-- =============================================
-- FIELD: periode_id smallint
-- =============================================
-- ADD periode_id
alter table public."ship" add periode_id smallint  ;
comment on column public."ship".periode_id is '';

-- MODIFY periode_id
alter table public."ship"
	alter column periode_id type smallint,
	ALTER COLUMN periode_id DROP DEFAULT,
	ALTER COLUMN periode_id DROP NOT NULL;
comment on column public."ship".periode_id is '';


-- =============================================
-- FIELD: bookdate date
-- =============================================
-- ADD bookdate
alter table public."ship" add bookdate date  default now();
comment on column public."ship".bookdate is '';

-- MODIFY bookdate
alter table public."ship"
	alter column bookdate type date,
	ALTER COLUMN bookdate SET DEFAULT now(),
	ALTER COLUMN bookdate DROP NOT NULL;
comment on column public."ship".bookdate is '';


-- =============================================
-- FIELD: ship_descr text
-- =============================================
-- ADD ship_descr
alter table public."ship" add ship_descr text  ;
comment on column public."ship".ship_descr is '';

-- MODIFY ship_descr
alter table public."ship"
	alter column ship_descr type text,
	ALTER COLUMN ship_descr DROP DEFAULT,
	ALTER COLUMN ship_descr DROP NOT NULL;
comment on column public."ship".ship_descr is '';


-- =============================================
-- FIELD: partner_id int
-- =============================================
-- ADD partner_id
alter table public."ship" add partner_id int  ;
comment on column public."ship".partner_id is '';

-- MODIFY partner_id
alter table public."ship"
	alter column partner_id type int,
	ALTER COLUMN partner_id DROP DEFAULT,
	ALTER COLUMN partner_id DROP NOT NULL;
comment on column public."ship".partner_id is '';


-- =============================================
-- FIELD: brand_id int
-- =============================================
-- ADD brand_id
alter table public."ship" add brand_id int  ;
comment on column public."ship".brand_id is '';

-- MODIFY brand_id
alter table public."ship"
	alter column brand_id type int,
	ALTER COLUMN brand_id DROP DEFAULT,
	ALTER COLUMN brand_id DROP NOT NULL;
comment on column public."ship".brand_id is '';


-- =============================================
-- FIELD: totalqty int
-- =============================================
-- ADD totalqty
alter table public."ship" add totalqty int not null default 0;
comment on column public."ship".totalqty is '';

-- MODIFY totalqty
alter table public."ship"
	alter column totalqty type int,
	ALTER COLUMN totalqty SET DEFAULT 0,
	ALTER COLUMN totalqty SET NOT NULL;
comment on column public."ship".totalqty is '';


-- =============================================
-- FIELD: itemidr int
-- =============================================
-- ADD itemidr
alter table public."ship" add itemidr int not null default 0;
comment on column public."ship".itemidr is '';

-- MODIFY itemidr
alter table public."ship"
	alter column itemidr type int,
	ALTER COLUMN itemidr SET DEFAULT 0,
	ALTER COLUMN itemidr SET NOT NULL;
comment on column public."ship".itemidr is '';


-- =============================================
-- FIELD: itemppnidr decimal(18, 2)
-- =============================================
-- ADD itemppnidr
alter table public."ship" add itemppnidr decimal(18, 2) not null default 0;
comment on column public."ship".itemppnidr is '';

-- MODIFY itemppnidr
alter table public."ship"
	alter column itemppnidr type decimal(18, 2),
	ALTER COLUMN itemppnidr SET DEFAULT 0,
	ALTER COLUMN itemppnidr SET NOT NULL;
comment on column public."ship".itemppnidr is '';


-- =============================================
-- FIELD: addidr decimal(18, 2)
-- =============================================
-- ADD addidr
alter table public."ship" add addidr decimal(18, 2) not null default 0;
comment on column public."ship".addidr is '';

-- MODIFY addidr
alter table public."ship"
	alter column addidr type decimal(18, 2),
	ALTER COLUMN addidr SET DEFAULT 0,
	ALTER COLUMN addidr SET NOT NULL;
comment on column public."ship".addidr is '';


-- =============================================
-- FIELD: addppnidr bigint
-- =============================================
-- ADD addppnidr
alter table public."ship" add addppnidr bigint not null default 0;
comment on column public."ship".addppnidr is '';

-- MODIFY addppnidr
alter table public."ship"
	alter column addppnidr type bigint,
	ALTER COLUMN addppnidr SET DEFAULT 0,
	ALTER COLUMN addppnidr SET NOT NULL;
comment on column public."ship".addppnidr is '';


-- =============================================
-- FIELD: addpphidr decimal(18, 2)
-- =============================================
-- ADD addpphidr
alter table public."ship" add addpphidr decimal(18, 2) not null default 0;
comment on column public."ship".addpphidr is '';

-- MODIFY addpphidr
alter table public."ship"
	alter column addpphidr type decimal(18, 2),
	ALTER COLUMN addpphidr SET DEFAULT 0,
	ALTER COLUMN addpphidr SET NOT NULL;
comment on column public."ship".addpphidr is '';


-- =============================================
-- FIELD: landedidr decimal(18, 2)
-- =============================================
-- ADD landedidr
alter table public."ship" add landedidr decimal(18, 2) not null default 0;
comment on column public."ship".landedidr is '';

-- MODIFY landedidr
alter table public."ship"
	alter column landedidr type decimal(18, 2),
	ALTER COLUMN landedidr SET DEFAULT 0,
	ALTER COLUMN landedidr SET NOT NULL;
comment on column public."ship".landedidr is '';


-- =============================================
-- FIELD: _calculate boolean
-- =============================================
-- ADD _calculate
alter table public."ship" add _calculate boolean not null default false;
comment on column public."ship"._calculate is '';

-- MODIFY _calculate
alter table public."ship"
	alter column _calculate type boolean,
	ALTER COLUMN _calculate SET DEFAULT false,
	ALTER COLUMN _calculate SET NOT NULL;
comment on column public."ship"._calculate is '';


-- =============================================
-- FIELD: _commitby int
-- =============================================
-- ADD _commitby
alter table public."ship" add _commitby int  ;
comment on column public."ship"._commitby is '';

-- MODIFY _commitby
alter table public."ship"
	alter column _commitby type int,
	ALTER COLUMN _commitby DROP DEFAULT,
	ALTER COLUMN _commitby DROP NOT NULL;
comment on column public."ship"._commitby is '';


-- =============================================
-- FIELD: _commitdate timestamp with time zone
-- =============================================
-- ADD _commitdate
alter table public."ship" add _commitdate timestamp with time zone  ;
comment on column public."ship"._commitdate is '';

-- MODIFY _commitdate
alter table public."ship"
	alter column _commitdate type timestamp with time zone,
	ALTER COLUMN _commitdate DROP DEFAULT,
	ALTER COLUMN _commitdate DROP NOT NULL;
comment on column public."ship"._commitdate is '';


-- =============================================
-- FIELD: _verifyby int
-- =============================================
-- ADD _verifyby
alter table public."ship" add _verifyby int  ;
comment on column public."ship"._verifyby is '';

-- MODIFY _verifyby
alter table public."ship"
	alter column _verifyby type int,
	ALTER COLUMN _verifyby DROP DEFAULT,
	ALTER COLUMN _verifyby DROP NOT NULL;
comment on column public."ship"._verifyby is '';


-- =============================================
-- FIELD: _verifydate timestamp with time zone
-- =============================================
-- ADD _verifydate
alter table public."ship" add _verifydate timestamp with time zone  ;
comment on column public."ship"._verifydate is '';

-- MODIFY _verifydate
alter table public."ship"
	alter column _verifydate type timestamp with time zone,
	ALTER COLUMN _verifydate DROP DEFAULT,
	ALTER COLUMN _verifydate DROP NOT NULL;
comment on column public."ship"._verifydate is '';


-- =============================================
-- FIELD: _createby integer
-- =============================================
-- ADD _createby
alter table public."ship" add _createby integer not null ;
comment on column public."ship"._createby is 'user yang pertama kali membuat record ini';

-- MODIFY _createby
alter table public."ship"
	alter column _createby type integer,
	ALTER COLUMN _createby DROP DEFAULT,
	ALTER COLUMN _createby SET NOT NULL;
comment on column public."ship"._createby is 'user yang pertama kali membuat record ini';


-- =============================================
-- FIELD: _createdate timestamp with time zone
-- =============================================
-- ADD _createdate
alter table public."ship" add _createdate timestamp with time zone not null default now();
comment on column public."ship"._createdate is 'waktu record dibuat pertama kali';

-- MODIFY _createdate
alter table public."ship"
	alter column _createdate type timestamp with time zone,
	ALTER COLUMN _createdate SET DEFAULT now(),
	ALTER COLUMN _createdate SET NOT NULL;
comment on column public."ship"._createdate is 'waktu record dibuat pertama kali';


-- =============================================
-- FIELD: _modifyby integer
-- =============================================
-- ADD _modifyby
alter table public."ship" add _modifyby integer  ;
comment on column public."ship"._modifyby is 'user yang terakhir modifikasi record ini';

-- MODIFY _modifyby
alter table public."ship"
	alter column _modifyby type integer,
	ALTER COLUMN _modifyby DROP DEFAULT,
	ALTER COLUMN _modifyby DROP NOT NULL;
comment on column public."ship"._modifyby is 'user yang terakhir modifikasi record ini';


-- =============================================
-- FIELD: _modifydate timestamp with time zone
-- =============================================
-- ADD _modifydate
alter table public."ship" add _modifydate timestamp with time zone  ;
comment on column public."ship"._modifydate is 'waktu terakhir record dimodifikasi';

-- MODIFY _modifydate
alter table public."ship"
	alter column _modifydate type timestamp with time zone,
	ALTER COLUMN _modifydate DROP DEFAULT,
	ALTER COLUMN _modifydate DROP NOT NULL;
comment on column public."ship"._modifydate is 'waktu terakhir record dimodifikasi';


-- =============================================
-- FIELD: _timestamp timestamp with time zone
-- =============================================
-- ADD _timestamp
alter table public."ship" add _timestamp timestamp with time zone not null default now();
comment on column public."ship"._timestamp is 'data timestamp';

-- MODIFY _timestamp
alter table public."ship"
	alter column _timestamp type timestamp with time zone,
	ALTER COLUMN _timestamp SET DEFAULT now(),
	ALTER COLUMN _timestamp SET NOT NULL;
comment on column public."ship"._timestamp is 'data timestamp';


-- =============================================
-- INDEX
-- =============================================
DROP INDEX IF EXISTS public.idx$public$ship$_timestamp;
CREATE INDEX idx$public$ship$_timestamp ON public.ship (_timestamp);


-- =============================================
-- FOREIGN KEY CONSTRAINT
-- =============================================
-- Drop Existing Foreign Key Constraint 
ALTER TABLE public."ship" DROP CONSTRAINT fk$public$ship$periode_id;
ALTER TABLE public."ship" DROP CONSTRAINT fk$public$ship$partner_id;
ALTER TABLE public."ship" DROP CONSTRAINT fk$public$ship$brand_id;


-- Add Foreign Key Constraint  
ALTER TABLE public."ship"
	ADD CONSTRAINT fk$public$ship$periode_id
	FOREIGN KEY (periode_id)
	REFERENCES public."periode"(periode_id);


-- Add As Index, drop dulu jika sudah ada
DROP INDEX IF EXISTS public.idx_fk$public$ship$periode_id;
CREATE INDEX idx_fk$public$ship$periode_id ON public."ship"(periode_id);	


ALTER TABLE public."ship"
	ADD CONSTRAINT fk$public$ship$partner_id
	FOREIGN KEY (partner_id)
	REFERENCES public."partner"(partner_id);


-- Add As Index, drop dulu jika sudah ada
DROP INDEX IF EXISTS public.idx_fk$public$ship$partner_id;
CREATE INDEX idx_fk$public$ship$partner_id ON public."ship"(partner_id);	


ALTER TABLE public."ship"
	ADD CONSTRAINT fk$public$ship$brand_id
	FOREIGN KEY (brand_id)
	REFERENCES public."brand"(brand_id);


-- Add As Index, drop dulu jika sudah ada
DROP INDEX IF EXISTS public.idx_fk$public$ship$brand_id;
CREATE INDEX idx_fk$public$ship$brand_id ON public."ship"(brand_id);	

	


-- =============================================
-- UNIQUE INDEX
-- =============================================
-- Drop existing unique index 
alter table public."ship"
	drop constraint uq$public$ship$ship_doc;
	

-- Add unique index 
alter table  public."ship"
	add constraint uq$public$ship$ship_doc unique (ship_doc); 

