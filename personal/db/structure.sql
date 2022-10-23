SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: public; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA public;


--
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON SCHEMA public IS 'standard public schema';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: active_storage_attachments; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.active_storage_attachments (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    name character varying NOT NULL,
    record_type character varying NOT NULL,
    record_id uuid NOT NULL,
    blob_id uuid NOT NULL,
    created_at timestamp(6) without time zone NOT NULL
);


--
-- Name: active_storage_blobs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.active_storage_blobs (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    key character varying NOT NULL,
    filename character varying NOT NULL,
    content_type character varying,
    metadata text,
    service_name character varying NOT NULL,
    byte_size bigint NOT NULL,
    checksum character varying,
    created_at timestamp(6) without time zone NOT NULL
);


--
-- Name: active_storage_variant_records; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.active_storage_variant_records (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    blob_id uuid NOT NULL,
    variation_digest character varying NOT NULL
);


--
-- Name: aircraft_type_designators; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.aircraft_type_designators (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    icao_code text NOT NULL,
    aircraft_class text,
    number_of_engines integer,
    engine_type text,
    weight_class text,
    icao_wtc text,
    recat text,
    recat_wtc_a text,
    recat_wtc_b text,
    cwtc text,
    srs text,
    lahso text,
    manufacturer text,
    model text,
    data jsonb DEFAULT '{}'::jsonb NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    slug text
);


--
-- Name: ar_internal_metadata; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.ar_internal_metadata (
    key character varying NOT NULL,
    value character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: attachments; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.attachments (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    blob_id uuid NOT NULL,
    record_type character varying NOT NULL,
    record_id uuid NOT NULL,
    name character varying NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: blobs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.blobs (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    key character varying NOT NULL,
    slug character varying,
    data jsonb DEFAULT '{}'::jsonb NOT NULL,
    content_type character varying,
    title character varying,
    description character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: friendly_id_slugs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.friendly_id_slugs (
    id bigint NOT NULL,
    slug character varying NOT NULL,
    sluggable_id integer NOT NULL,
    sluggable_type character varying(50),
    scope character varying,
    created_at timestamp(6) without time zone
);


--
-- Name: friendly_id_slugs_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.friendly_id_slugs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: friendly_id_slugs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.friendly_id_slugs_id_seq OWNED BY public.friendly_id_slugs.id;


--
-- Name: gutentag_taggings; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.gutentag_taggings (
    id bigint NOT NULL,
    tag_id integer NOT NULL,
    taggable_id uuid NOT NULL,
    taggable_type character varying NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: gutentag_taggings_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.gutentag_taggings_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: gutentag_taggings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.gutentag_taggings_id_seq OWNED BY public.gutentag_taggings.id;


--
-- Name: gutentag_tags; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.gutentag_tags (
    id bigint NOT NULL,
    name character varying NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    taggings_count integer DEFAULT 0
);


--
-- Name: gutentag_tags_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.gutentag_tags_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: gutentag_tags_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.gutentag_tags_id_seq OWNED BY public.gutentag_tags.id;


--
-- Name: pg_search_documents; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.pg_search_documents (
    id bigint NOT NULL,
    content text,
    searchable_type character varying,
    searchable_id bigint,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: pg_search_documents_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.pg_search_documents_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: pg_search_documents_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.pg_search_documents_id_seq OWNED BY public.pg_search_documents.id;


--
-- Name: pghero_query_stats; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.pghero_query_stats (
    id bigint NOT NULL,
    database text,
    "user" text,
    query text,
    query_hash bigint,
    total_time double precision,
    calls bigint,
    captured_at timestamp without time zone
);


--
-- Name: pghero_query_stats_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.pghero_query_stats_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: pghero_query_stats_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.pghero_query_stats_id_seq OWNED BY public.pghero_query_stats.id;


--
-- Name: pghero_space_stats; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.pghero_space_stats (
    id bigint NOT NULL,
    database text,
    schema text,
    relation text,
    size bigint,
    captured_at timestamp without time zone
);


--
-- Name: pghero_space_stats_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.pghero_space_stats_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: pghero_space_stats_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.pghero_space_stats_id_seq OWNED BY public.pghero_space_stats.id;


--
-- Name: posts; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.posts (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    title character varying,
    description character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    slug character varying,
    html_content text,
    markdown_content text,
    published boolean
);


--
-- Name: romanchuk_open_golfers; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.romanchuk_open_golfers (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    player_id uuid,
    tournament_id uuid,
    data jsonb DEFAULT '{}'::jsonb NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: romanchuk_open_players; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.romanchuk_open_players (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    name character varying,
    slug character varying,
    data jsonb DEFAULT '{}'::jsonb NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: romanchuk_open_tournaments; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.romanchuk_open_tournaments (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    city character varying,
    country character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    title character varying,
    data jsonb DEFAULT '{}'::jsonb NOT NULL,
    ocurred_on timestamp(6) without time zone,
    slug character varying
);


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.schema_migrations (
    version character varying NOT NULL
);


--
-- Name: users; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.users (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    cognito_id uuid,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    slug character varying,
    username character varying,
    data jsonb DEFAULT '{}'::jsonb
);


--
-- Name: wx_aireps; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.wx_aireps (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    batch_id uuid NOT NULL,
    raw_text text NOT NULL,
    receipt_time timestamp(6) without time zone NOT NULL,
    observation_time timestamp(6) without time zone,
    aircraft_ref text,
    altitude_ft_msl integer,
    sky_condition jsonb DEFAULT '[]'::jsonb NOT NULL,
    turbulence_condition jsonb DEFAULT '[]'::jsonb NOT NULL,
    icing_condition jsonb DEFAULT '[]'::jsonb NOT NULL,
    visibility_statute_mi integer,
    wx_string character varying,
    temp_c double precision,
    wind_dir_degrees integer,
    wind_speed_kt integer,
    vert_gust_kt integer,
    location public.geography(PointZ,4326),
    data jsonb DEFAULT '{}'::jsonb NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: wx_batches; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.wx_batches (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    key character varying NOT NULL,
    report_type text NOT NULL,
    source_url text,
    num_records_processed integer DEFAULT 0 NOT NULL,
    content_length integer DEFAULT 0 NOT NULL,
    data jsonb DEFAULT '{}'::jsonb NOT NULL,
    start_time timestamp(6) without time zone,
    end_time timestamp(6) without time zone,
    processed_at timestamp(6) without time zone,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    pireps_count integer DEFAULT 0,
    aireps_count integer DEFAULT 0,
    metars_count integer DEFAULT 0,
    tafs_count integer DEFAULT 0,
    failed_at timestamp(6) without time zone
);


--
-- Name: wx_metars; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.wx_metars (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    raw_text text NOT NULL,
    station_id text NOT NULL,
    observation_time timestamp(6) without time zone NOT NULL,
    location public.geography(PointZ,4326),
    temp_c double precision,
    dewpoint_c double precision,
    wind_dir_degrees integer,
    wind_speed_kt integer,
    wind_gust_kt integer,
    visibility_statute_mi double precision,
    altim_in_hg double precision,
    sea_level_pressure_mb double precision,
    wx_string text,
    sky_condition jsonb,
    flight_category text,
    three_hr_pressure_tendency_mb double precision,
    "maxT_c" double precision,
    "minT_c" double precision,
    "maxT24hr_c" double precision,
    "minT24hr_c" double precision,
    precip_in double precision,
    pcp3hr_in double precision,
    pcp6hr_in double precision,
    pcp24hr_in double precision,
    snow_in double precision,
    vert_vis_ft integer,
    metar_type text,
    data jsonb,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    batch_id uuid
);


--
-- Name: wx_pireps; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.wx_pireps (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    batch_id uuid NOT NULL,
    raw_text text NOT NULL,
    receipt_time timestamp(6) without time zone,
    observation_time timestamp(6) without time zone,
    aircraft_ref text,
    altitude_ft_msl integer,
    sky_condition jsonb,
    turbulence_condition jsonb,
    icing_condition jsonb,
    visibility_statute_mi integer,
    wx_string character varying,
    temp_c double precision,
    wind_dir_degrees integer,
    wind_speed_kt integer,
    vert_gust_kt integer,
    location public.geography(PointZ,4326),
    data jsonb DEFAULT '{}'::jsonb NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    urgent boolean DEFAULT false,
    aircraft_type_designator_id uuid,
    remarks text,
    station text
);


--
-- Name: wx_tafs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.wx_tafs (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    raw_text text,
    station_id text NOT NULL,
    issue_time timestamp(6) without time zone NOT NULL,
    bulletin_time timestamp(6) without time zone,
    valid_time_from timestamp(6) without time zone,
    valid_time_to timestamp(6) without time zone,
    remarks text,
    location public.geography(PointZ,4326),
    forecast jsonb,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    batch_id uuid
);


--
-- Name: friendly_id_slugs id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.friendly_id_slugs ALTER COLUMN id SET DEFAULT nextval('public.friendly_id_slugs_id_seq'::regclass);


--
-- Name: gutentag_taggings id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.gutentag_taggings ALTER COLUMN id SET DEFAULT nextval('public.gutentag_taggings_id_seq'::regclass);


--
-- Name: gutentag_tags id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.gutentag_tags ALTER COLUMN id SET DEFAULT nextval('public.gutentag_tags_id_seq'::regclass);


--
-- Name: pg_search_documents id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pg_search_documents ALTER COLUMN id SET DEFAULT nextval('public.pg_search_documents_id_seq'::regclass);


--
-- Name: pghero_query_stats id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pghero_query_stats ALTER COLUMN id SET DEFAULT nextval('public.pghero_query_stats_id_seq'::regclass);


--
-- Name: pghero_space_stats id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pghero_space_stats ALTER COLUMN id SET DEFAULT nextval('public.pghero_space_stats_id_seq'::regclass);


--
-- Name: active_storage_attachments active_storage_attachments_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.active_storage_attachments
    ADD CONSTRAINT active_storage_attachments_pkey PRIMARY KEY (id);


--
-- Name: active_storage_blobs active_storage_blobs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.active_storage_blobs
    ADD CONSTRAINT active_storage_blobs_pkey PRIMARY KEY (id);


--
-- Name: active_storage_variant_records active_storage_variant_records_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.active_storage_variant_records
    ADD CONSTRAINT active_storage_variant_records_pkey PRIMARY KEY (id);


--
-- Name: aircraft_type_designators aircraft_type_designators_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.aircraft_type_designators
    ADD CONSTRAINT aircraft_type_designators_pkey PRIMARY KEY (id);


--
-- Name: ar_internal_metadata ar_internal_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);


--
-- Name: attachments attachments_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.attachments
    ADD CONSTRAINT attachments_pkey PRIMARY KEY (id);


--
-- Name: blobs blobs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.blobs
    ADD CONSTRAINT blobs_pkey PRIMARY KEY (id);


--
-- Name: friendly_id_slugs friendly_id_slugs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.friendly_id_slugs
    ADD CONSTRAINT friendly_id_slugs_pkey PRIMARY KEY (id);


--
-- Name: gutentag_taggings gutentag_taggings_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.gutentag_taggings
    ADD CONSTRAINT gutentag_taggings_pkey PRIMARY KEY (id);


--
-- Name: gutentag_tags gutentag_tags_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.gutentag_tags
    ADD CONSTRAINT gutentag_tags_pkey PRIMARY KEY (id);


--
-- Name: pg_search_documents pg_search_documents_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pg_search_documents
    ADD CONSTRAINT pg_search_documents_pkey PRIMARY KEY (id);


--
-- Name: pghero_query_stats pghero_query_stats_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pghero_query_stats
    ADD CONSTRAINT pghero_query_stats_pkey PRIMARY KEY (id);


--
-- Name: pghero_space_stats pghero_space_stats_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pghero_space_stats
    ADD CONSTRAINT pghero_space_stats_pkey PRIMARY KEY (id);


--
-- Name: posts posts_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.posts
    ADD CONSTRAINT posts_pkey PRIMARY KEY (id);


--
-- Name: romanchuk_open_golfers romanchuk_open_golfers_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.romanchuk_open_golfers
    ADD CONSTRAINT romanchuk_open_golfers_pkey PRIMARY KEY (id);


--
-- Name: romanchuk_open_players romanchuk_open_players_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.romanchuk_open_players
    ADD CONSTRAINT romanchuk_open_players_pkey PRIMARY KEY (id);


--
-- Name: romanchuk_open_tournaments romanchuk_open_tournaments_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.romanchuk_open_tournaments
    ADD CONSTRAINT romanchuk_open_tournaments_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: wx_aireps wx_aireps_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.wx_aireps
    ADD CONSTRAINT wx_aireps_pkey PRIMARY KEY (id);


--
-- Name: wx_batches wx_batches_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.wx_batches
    ADD CONSTRAINT wx_batches_pkey PRIMARY KEY (id);


--
-- Name: wx_metars wx_metars_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.wx_metars
    ADD CONSTRAINT wx_metars_pkey PRIMARY KEY (id);


--
-- Name: wx_pireps wx_pireps_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.wx_pireps
    ADD CONSTRAINT wx_pireps_pkey PRIMARY KEY (id);


--
-- Name: wx_tafs wx_tafs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.wx_tafs
    ADD CONSTRAINT wx_tafs_pkey PRIMARY KEY (id);


--
-- Name: index_active_storage_attachments_on_blob_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_active_storage_attachments_on_blob_id ON public.active_storage_attachments USING btree (blob_id);


--
-- Name: index_active_storage_attachments_uniqueness; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_active_storage_attachments_uniqueness ON public.active_storage_attachments USING btree (record_type, record_id, name, blob_id);


--
-- Name: index_active_storage_blobs_on_key; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_active_storage_blobs_on_key ON public.active_storage_blobs USING btree (key);


--
-- Name: index_active_storage_variant_records_uniqueness; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_active_storage_variant_records_uniqueness ON public.active_storage_variant_records USING btree (blob_id, variation_digest);


--
-- Name: index_attachments_on_blob_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_attachments_on_blob_id ON public.attachments USING btree (blob_id);


--
-- Name: index_attachments_uniqueness; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_attachments_uniqueness ON public.attachments USING btree (record_type, record_id, name, blob_id);


--
-- Name: index_friendly_id_slugs_on_slug_and_sluggable_type; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_friendly_id_slugs_on_slug_and_sluggable_type ON public.friendly_id_slugs USING btree (slug, sluggable_type);


--
-- Name: index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope ON public.friendly_id_slugs USING btree (slug, sluggable_type, scope);


--
-- Name: index_friendly_id_slugs_on_sluggable_type_and_sluggable_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_friendly_id_slugs_on_sluggable_type_and_sluggable_id ON public.friendly_id_slugs USING btree (sluggable_type, sluggable_id);


--
-- Name: index_gutentag_taggings_on_tag_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_gutentag_taggings_on_tag_id ON public.gutentag_taggings USING btree (tag_id);


--
-- Name: index_gutentag_taggings_on_taggable_type_and_taggable_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_gutentag_taggings_on_taggable_type_and_taggable_id ON public.gutentag_taggings USING btree (taggable_type, taggable_id);


--
-- Name: index_gutentag_tags_on_name; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_gutentag_tags_on_name ON public.gutentag_tags USING btree (name);


--
-- Name: index_gutentag_tags_on_taggings_count; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_gutentag_tags_on_taggings_count ON public.gutentag_tags USING btree (taggings_count);


--
-- Name: index_pg_search_documents_on_searchable; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_pg_search_documents_on_searchable ON public.pg_search_documents USING btree (searchable_type, searchable_id);


--
-- Name: index_pghero_query_stats_on_database_and_captured_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_pghero_query_stats_on_database_and_captured_at ON public.pghero_query_stats USING btree (database, captured_at);


--
-- Name: index_pghero_space_stats_on_database_and_captured_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_pghero_space_stats_on_database_and_captured_at ON public.pghero_space_stats USING btree (database, captured_at);


--
-- Name: index_posts_on_slug; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_posts_on_slug ON public.posts USING btree (slug);


--
-- Name: index_romanchuk_open_golfers_on_player_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_romanchuk_open_golfers_on_player_id ON public.romanchuk_open_golfers USING btree (player_id);


--
-- Name: index_romanchuk_open_golfers_on_tournament_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_romanchuk_open_golfers_on_tournament_id ON public.romanchuk_open_golfers USING btree (tournament_id);


--
-- Name: index_romanchuk_open_players_on_slug; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_romanchuk_open_players_on_slug ON public.romanchuk_open_players USING btree (slug);


--
-- Name: index_romanchuk_open_tournaments_on_slug; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_romanchuk_open_tournaments_on_slug ON public.romanchuk_open_tournaments USING btree (slug);


--
-- Name: index_users_on_slug; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_users_on_slug ON public.users USING btree (slug);


--
-- Name: index_wx_aireps_on_batch_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_wx_aireps_on_batch_id ON public.wx_aireps USING btree (batch_id);


--
-- Name: index_wx_aireps_on_location; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_wx_aireps_on_location ON public.wx_aireps USING gist (location);


--
-- Name: index_wx_aireps_uniqueness; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_wx_aireps_uniqueness ON public.wx_aireps USING btree (raw_text, observation_time);


--
-- Name: index_wx_metars_on_batch_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_wx_metars_on_batch_id ON public.wx_metars USING btree (batch_id);


--
-- Name: index_wx_metars_on_location; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_wx_metars_on_location ON public.wx_metars USING gist (location);


--
-- Name: index_wx_metars_uniqueness; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_wx_metars_uniqueness ON public.wx_metars USING btree (station_id, observation_time);


--
-- Name: index_wx_pireps_on_aircraft_type_designator_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_wx_pireps_on_aircraft_type_designator_id ON public.wx_pireps USING btree (aircraft_type_designator_id);


--
-- Name: index_wx_pireps_on_batch_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_wx_pireps_on_batch_id ON public.wx_pireps USING btree (batch_id);


--
-- Name: index_wx_pireps_on_location; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_wx_pireps_on_location ON public.wx_pireps USING gist (location);


--
-- Name: index_wx_pireps_uniqueness; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_wx_pireps_uniqueness ON public.wx_pireps USING btree (raw_text, observation_time);


--
-- Name: index_wx_tafs_on_batch_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_wx_tafs_on_batch_id ON public.wx_tafs USING btree (batch_id);


--
-- Name: index_wx_tafs_on_location; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_wx_tafs_on_location ON public.wx_tafs USING gist (location);


--
-- Name: index_wx_tafs_uniqueness; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_wx_tafs_uniqueness ON public.wx_tafs USING btree (station_id, issue_time);


--
-- Name: unique_taggings; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX unique_taggings ON public.gutentag_taggings USING btree (taggable_type, taggable_id, tag_id);


--
-- Name: active_storage_variant_records fk_rails_993965df05; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.active_storage_variant_records
    ADD CONSTRAINT fk_rails_993965df05 FOREIGN KEY (blob_id) REFERENCES public.active_storage_blobs(id);


--
-- Name: active_storage_attachments fk_rails_c3b3935057; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.active_storage_attachments
    ADD CONSTRAINT fk_rails_c3b3935057 FOREIGN KEY (blob_id) REFERENCES public.active_storage_blobs(id);


--
-- Name: wx_pireps fk_rails_ddee484427; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.wx_pireps
    ADD CONSTRAINT fk_rails_ddee484427 FOREIGN KEY (batch_id) REFERENCES public.wx_batches(id);


--
-- Name: wx_aireps fk_rails_e049bf6b2e; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.wx_aireps
    ADD CONSTRAINT fk_rails_e049bf6b2e FOREIGN KEY (batch_id) REFERENCES public.wx_batches(id);


--
-- PostgreSQL database dump complete
--

SET search_path TO public, postgis;

INSERT INTO "schema_migrations" (version) VALUES
('20220416005025'),
('20220416012142'),
('20220416012143'),
('20220416012144'),
('20220417222217'),
('20220419065022'),
('20220419065040'),
('20220419065117'),
('20220420221740'),
('20220421233045'),
('20220422094735'),
('20220422095242'),
('20220422185122'),
('20220423051330'),
('20220428074500'),
('20220428075543'),
('20220428093506'),
('20220428093737'),
('20220428191854'),
('20220430012521'),
('20220516065126'),
('20220518024243'),
('20220521025558'),
('20220521030922'),
('20220521051700'),
('20220521071225'),
('20220521080055'),
('20220820234256'),
('20220821012755'),
('20220829035749'),
('20220829054151'),
('20220829165251'),
('20220830200808'),
('20220831094855'),
('20220831102142'),
('20220901053421'),
('20220901182250'),
('20220902173200'),
('20220902213500'),
('20220903083551'),
('20220903195645'),
('20220903210615'),
('20220904211826'),
('20220907061153'),
('20220907063711'),
('20220907201002'),
('20220907202226'),
('20220908030103'),
('20220908030135'),
('20220909141241'),
('20220909190019'),
('20220909194615'),
('20220909202215'),
('20220909215538'),
('20220909221031'),
('20220910200350'),
('20220910222737'),
('20220911031445'),
('20220912023844'),
('20220912032106'),
('20220912160222'),
('20220912170518'),
('20220915095311'),
('20220915172449'),
('20220918231901'),
('20220921060628'),
('20220924080503'),
('20221016052037');


