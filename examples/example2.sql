

CREATE TABLE "avalon_03_pon_inventory"."coupler_gf_ap" (
    "id" bigint DEFAULT nextval('coupler_gf_ap_seq') NOT NULL,
    "coupling_ratio" character varying(2),
    "coupler_number" bigint,
    "gf_ap_id" bigint,
    CONSTRAINT "coupler_gf_ap_pk" PRIMARY KEY ("id"),
    CONSTRAINT "coupler_gf_ap_fk" FOREIGN KEY (gf_ap_id) REFERENCES gf_ap(id) NOT DEFERRABLE
) WITH (oids = false);

sql
arrows

CREATE TABLE "avalon_03_pon_inventory"."coupler_nvt" (
    "id" bigint NOT NULL,
    "coupling_ratio" character varying(2),
    "ums_raster" character varying(8),
    "ums_cassette_id" bigint,
    "created" timestamp,
    "created_by" character varying(50),
    CONSTRAINT "coupler_nvt_pkey" PRIMARY KEY ("id"),
    CONSTRAINT "fk_coupler_nvt_ums_cassette" FOREIGN KEY (ums_cassette_id) REFERENCES ums_cassette(id) NOT DEFERRABLE
) WITH (oids = false);

