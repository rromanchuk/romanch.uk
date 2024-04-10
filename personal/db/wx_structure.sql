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

ALTER TABLE IF EXISTS ONLY public.tds_tafs DROP CONSTRAINT IF EXISTS fk_rails_fe1468a814;
ALTER TABLE IF EXISTS ONLY public.tds_metars DROP CONSTRAINT IF EXISTS fk_rails_eb5c317d7c;
ALTER TABLE IF EXISTS ONLY public.tds_pireps DROP CONSTRAINT IF EXISTS fk_rails_e59afeba9c;
ALTER TABLE IF EXISTS ONLY public.tds_pireps DROP CONSTRAINT IF EXISTS fk_rails_e4969e5c79;
ALTER TABLE IF EXISTS ONLY public.tds_tafs DROP CONSTRAINT IF EXISTS fk_rails_ccc08fea2d;
ALTER TABLE IF EXISTS ONLY public.tds_metars DROP CONSTRAINT IF EXISTS fk_rails_b83b18ba97;
ALTER TABLE IF EXISTS ONLY public.tds_aireps DROP CONSTRAINT IF EXISTS fk_rails_1724f0fc97;
ALTER TABLE IF EXISTS ONLY public.tds_pireps DROP CONSTRAINT IF EXISTS fk_rails_07dff79a58;
DROP INDEX IF EXISTS public.index_unique_tds_stations_code;
DROP INDEX IF EXISTS public.index_unique_tds_batches_key;
DROP INDEX IF EXISTS public.index_unique_tds_aircraft_type_designators_icao_code;
DROP INDEX IF EXISTS public.index_tds_tafs_uniqueness;
DROP INDEX IF EXISTS public.index_tds_tafs_on_station_id;
DROP INDEX IF EXISTS public.index_tds_tafs_on_issue_time;
DROP INDEX IF EXISTS public.index_tds_tafs_on_batch_id;
DROP INDEX IF EXISTS public.index_tds_pireps_uniqueness;
DROP INDEX IF EXISTS public.index_tds_pireps_on_urgent;
DROP INDEX IF EXISTS public.index_tds_pireps_on_station_id;
DROP INDEX IF EXISTS public.index_tds_pireps_on_observation_time;
DROP INDEX IF EXISTS public.index_tds_pireps_on_batch_id;
DROP INDEX IF EXISTS public.index_tds_pireps_on_aircraft_type_designator_id;
DROP INDEX IF EXISTS public.index_tds_metars_uniqueness;
DROP INDEX IF EXISTS public.index_tds_metars_on_station_id;
DROP INDEX IF EXISTS public.index_tds_metars_on_observation_time;
DROP INDEX IF EXISTS public.index_tds_metars_on_batch_id;
DROP INDEX IF EXISTS public.index_tds_batches_on_report_type;
DROP INDEX IF EXISTS public.index_tds_batches_on_processed_at;
DROP INDEX IF EXISTS public.index_tds_batches_on_failed_at;
DROP INDEX IF EXISTS public.index_tds_batches_on_created_at;
DROP INDEX IF EXISTS public.index_tds_aireps_uniqueness;
DROP INDEX IF EXISTS public.index_tds_aireps_on_observation_time;
DROP INDEX IF EXISTS public.index_tds_aireps_on_batch_id;
DROP INDEX IF EXISTS public.index_tds_aircraft_type_designators_on_slug;
ALTER TABLE IF EXISTS ONLY public.wx_station_observations DROP CONSTRAINT IF EXISTS wx_station_observations_pkey;
ALTER TABLE IF EXISTS ONLY public.tds_tafs DROP CONSTRAINT IF EXISTS tds_tafs_pkey;
ALTER TABLE IF EXISTS ONLY public.tds_stations DROP CONSTRAINT IF EXISTS tds_stations_pkey;
ALTER TABLE IF EXISTS ONLY public.tds_pireps DROP CONSTRAINT IF EXISTS tds_pireps_pkey;
ALTER TABLE IF EXISTS ONLY public.tds_metars DROP CONSTRAINT IF EXISTS tds_metars_pkey;
ALTER TABLE IF EXISTS ONLY public.tds_batches DROP CONSTRAINT IF EXISTS tds_batches_pkey;
ALTER TABLE IF EXISTS ONLY public.tds_aireps DROP CONSTRAINT IF EXISTS tds_aireps_pkey;
ALTER TABLE IF EXISTS ONLY public.tds_aircraft_type_designators DROP CONSTRAINT IF EXISTS tds_aircraft_type_designators_pkey;
ALTER TABLE IF EXISTS ONLY public.schema_migrations DROP CONSTRAINT IF EXISTS schema_migrations_pkey;
ALTER TABLE IF EXISTS ONLY public.ar_internal_metadata DROP CONSTRAINT IF EXISTS ar_internal_metadata_pkey;
DROP TABLE IF EXISTS public.wx_station_observations;
DROP TABLE IF EXISTS public.tds_tafs;
DROP TABLE IF EXISTS public.tds_stations;
DROP TABLE IF EXISTS public.tds_pireps;
DROP TABLE IF EXISTS public.tds_metars;
DROP TABLE IF EXISTS public.tds_batches;
DROP TABLE IF EXISTS public.tds_aireps;
DROP TABLE IF EXISTS public.tds_aircraft_type_designators;
DROP TABLE IF EXISTS public.schema_migrations;
DROP TABLE IF EXISTS public.ar_internal_metadata;
DROP EXTENSION IF EXISTS postgis;
DROP EXTENSION IF EXISTS pg_stat_statements;
--
-- Name: pg_stat_statements; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pg_stat_statements WITH SCHEMA public;


--
-- Name: EXTENSION pg_stat_statements; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION pg_stat_statements IS 'track planning and execution statistics of all SQL statements executed';


--
-- Name: postgis; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS postgis WITH SCHEMA public;


--
-- Name: EXTENSION postgis; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION postgis IS 'PostGIS geometry and geography spatial types and functions';


SET default_tablespace = '';

SET default_table_access_method = heap;

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
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.schema_migrations (
    version character varying NOT NULL
);


--
-- Name: tds_aircraft_type_designators; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tds_aircraft_type_designators (
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
    slug text,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: tds_aireps; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tds_aireps (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    batch_id uuid,
    raw_text text NOT NULL,
    receipt_time timestamp(6) without time zone NOT NULL,
    observation_time timestamp(6) without time zone,
    aircraft_ref text,
    altitude_ft_msl integer,
    latitude double precision,
    longitude double precision,
    turbulence_condition jsonb,
    icing_condition jsonb,
    temp_c double precision,
    wind_dir_degrees integer,
    wind_speed_kt integer,
    vert_gust_kt integer,
    data jsonb,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: tds_batches; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tds_batches (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    key character varying NOT NULL,
    report_type text NOT NULL,
    source_url text,
    s3_select_expression text,
    num_records_processed integer DEFAULT 0 NOT NULL,
    content_length integer DEFAULT 0 NOT NULL,
    metars_count integer DEFAULT 0 NOT NULL,
    tafs_count integer DEFAULT 0 NOT NULL,
    pireps_count integer DEFAULT 0 NOT NULL,
    data jsonb DEFAULT '{}'::jsonb NOT NULL,
    start_time timestamp(6) without time zone,
    end_time timestamp(6) without time zone,
    processed_at timestamp(6) without time zone,
    failed_at timestamp(6) without time zone,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: tds_metars; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tds_metars (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    batch_id uuid,
    station_id uuid,
    raw_text text NOT NULL,
    observation_time timestamp(6) without time zone NOT NULL,
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
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: tds_pireps; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tds_pireps (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    batch_id uuid,
    station_id uuid,
    aircraft_type_designator_id uuid,
    raw_text text NOT NULL,
    urgent boolean DEFAULT false NOT NULL,
    remarks text,
    receipt_time timestamp(6) without time zone,
    observation_time timestamp(6) without time zone,
    aircraft_ref text,
    latitude double precision,
    longitude double precision,
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
    data jsonb,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: tds_stations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tds_stations (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    code text,
    elevation_m double precision,
    latitude double precision,
    longitude double precision,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: tds_tafs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tds_tafs (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    batch_id uuid,
    station_id uuid,
    raw_text text,
    issue_time timestamp(6) without time zone NOT NULL,
    bulletin_time timestamp(6) without time zone,
    valid_time_from timestamp(6) without time zone,
    valid_time_to timestamp(6) without time zone,
    remarks text,
    forecast jsonb,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: wx_station_observations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.wx_station_observations (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    winddir integer,
    windspeedmph double precision,
    windgustmph double precision,
    maxdailygust double precision,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    solarradiation double precision,
    uv integer,
    rainratein double precision,
    eventrainin double precision,
    hourlyrainin double precision,
    dailyrainin double precision,
    weeklyrainin double precision,
    monthlyrainin double precision,
    yearlyrainin double precision,
    totalrainin double precision,
    rrain_piezo double precision,
    erain_piezo double precision,
    hrain_piezo double precision,
    drain_piezo double precision,
    wrain_piezo double precision,
    mrain_piezo double precision,
    yrain_piezo double precision,
    ws90cap_volt double precision,
    ws90_ver integer,
    wh68batt double precision,
    wh40batt double precision,
    wh90batt double precision,
    freq character varying,
    model character varying,
    "interval" integer,
    tempinf double precision,
    humidityin integer,
    baromrelin double precision,
    baromabsin double precision,
    tempf double precision,
    humidity integer
);


--
-- Name: ar_internal_metadata ar_internal_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: tds_aircraft_type_designators tds_aircraft_type_designators_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tds_aircraft_type_designators
    ADD CONSTRAINT tds_aircraft_type_designators_pkey PRIMARY KEY (id);


--
-- Name: tds_aireps tds_aireps_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tds_aireps
    ADD CONSTRAINT tds_aireps_pkey PRIMARY KEY (id);


--
-- Name: tds_batches tds_batches_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tds_batches
    ADD CONSTRAINT tds_batches_pkey PRIMARY KEY (id);


--
-- Name: tds_metars tds_metars_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tds_metars
    ADD CONSTRAINT tds_metars_pkey PRIMARY KEY (id);


--
-- Name: tds_pireps tds_pireps_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tds_pireps
    ADD CONSTRAINT tds_pireps_pkey PRIMARY KEY (id);


--
-- Name: tds_stations tds_stations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tds_stations
    ADD CONSTRAINT tds_stations_pkey PRIMARY KEY (id);


--
-- Name: tds_tafs tds_tafs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tds_tafs
    ADD CONSTRAINT tds_tafs_pkey PRIMARY KEY (id);


--
-- Name: wx_station_observations wx_station_observations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.wx_station_observations
    ADD CONSTRAINT wx_station_observations_pkey PRIMARY KEY (id);


--
-- Name: index_tds_aircraft_type_designators_on_slug; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_tds_aircraft_type_designators_on_slug ON public.tds_aircraft_type_designators USING btree (slug);


--
-- Name: index_tds_aireps_on_batch_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_tds_aireps_on_batch_id ON public.tds_aireps USING btree (batch_id);


--
-- Name: index_tds_aireps_on_observation_time; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_tds_aireps_on_observation_time ON public.tds_aireps USING btree (observation_time);


--
-- Name: index_tds_aireps_uniqueness; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_tds_aireps_uniqueness ON public.tds_aireps USING btree (raw_text, observation_time);


--
-- Name: index_tds_batches_on_created_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_tds_batches_on_created_at ON public.tds_batches USING btree (created_at);


--
-- Name: index_tds_batches_on_failed_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_tds_batches_on_failed_at ON public.tds_batches USING btree (failed_at);


--
-- Name: index_tds_batches_on_processed_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_tds_batches_on_processed_at ON public.tds_batches USING btree (processed_at);


--
-- Name: index_tds_batches_on_report_type; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_tds_batches_on_report_type ON public.tds_batches USING btree (report_type);


--
-- Name: index_tds_metars_on_batch_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_tds_metars_on_batch_id ON public.tds_metars USING btree (batch_id);


--
-- Name: index_tds_metars_on_observation_time; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_tds_metars_on_observation_time ON public.tds_metars USING btree (observation_time);


--
-- Name: index_tds_metars_on_station_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_tds_metars_on_station_id ON public.tds_metars USING btree (station_id);


--
-- Name: index_tds_metars_uniqueness; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_tds_metars_uniqueness ON public.tds_metars USING btree (station_id, observation_time);


--
-- Name: index_tds_pireps_on_aircraft_type_designator_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_tds_pireps_on_aircraft_type_designator_id ON public.tds_pireps USING btree (aircraft_type_designator_id);


--
-- Name: index_tds_pireps_on_batch_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_tds_pireps_on_batch_id ON public.tds_pireps USING btree (batch_id);


--
-- Name: index_tds_pireps_on_observation_time; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_tds_pireps_on_observation_time ON public.tds_pireps USING btree (observation_time);


--
-- Name: index_tds_pireps_on_station_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_tds_pireps_on_station_id ON public.tds_pireps USING btree (station_id);


--
-- Name: index_tds_pireps_on_urgent; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_tds_pireps_on_urgent ON public.tds_pireps USING btree (urgent);


--
-- Name: index_tds_pireps_uniqueness; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_tds_pireps_uniqueness ON public.tds_pireps USING btree (raw_text, observation_time);


--
-- Name: index_tds_tafs_on_batch_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_tds_tafs_on_batch_id ON public.tds_tafs USING btree (batch_id);


--
-- Name: index_tds_tafs_on_issue_time; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_tds_tafs_on_issue_time ON public.tds_tafs USING btree (issue_time);


--
-- Name: index_tds_tafs_on_station_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_tds_tafs_on_station_id ON public.tds_tafs USING btree (station_id);


--
-- Name: index_tds_tafs_uniqueness; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_tds_tafs_uniqueness ON public.tds_tafs USING btree (station_id, issue_time);


--
-- Name: index_unique_tds_aircraft_type_designators_icao_code; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_unique_tds_aircraft_type_designators_icao_code ON public.tds_aircraft_type_designators USING btree (icao_code);


--
-- Name: index_unique_tds_batches_key; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_unique_tds_batches_key ON public.tds_batches USING btree (key);


--
-- Name: index_unique_tds_stations_code; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_unique_tds_stations_code ON public.tds_stations USING btree (code);


--
-- Name: tds_pireps fk_rails_07dff79a58; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tds_pireps
    ADD CONSTRAINT fk_rails_07dff79a58 FOREIGN KEY (station_id) REFERENCES public.tds_stations(id);


--
-- Name: tds_aireps fk_rails_1724f0fc97; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tds_aireps
    ADD CONSTRAINT fk_rails_1724f0fc97 FOREIGN KEY (batch_id) REFERENCES public.tds_batches(id);


--
-- Name: tds_metars fk_rails_b83b18ba97; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tds_metars
    ADD CONSTRAINT fk_rails_b83b18ba97 FOREIGN KEY (station_id) REFERENCES public.tds_stations(id);


--
-- Name: tds_tafs fk_rails_ccc08fea2d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tds_tafs
    ADD CONSTRAINT fk_rails_ccc08fea2d FOREIGN KEY (batch_id) REFERENCES public.tds_batches(id);


--
-- Name: tds_pireps fk_rails_e4969e5c79; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tds_pireps
    ADD CONSTRAINT fk_rails_e4969e5c79 FOREIGN KEY (aircraft_type_designator_id) REFERENCES public.tds_aircraft_type_designators(id);


--
-- Name: tds_pireps fk_rails_e59afeba9c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tds_pireps
    ADD CONSTRAINT fk_rails_e59afeba9c FOREIGN KEY (batch_id) REFERENCES public.tds_batches(id);


--
-- Name: tds_metars fk_rails_eb5c317d7c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tds_metars
    ADD CONSTRAINT fk_rails_eb5c317d7c FOREIGN KEY (batch_id) REFERENCES public.tds_batches(id);


--
-- Name: tds_tafs fk_rails_fe1468a814; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tds_tafs
    ADD CONSTRAINT fk_rails_fe1468a814 FOREIGN KEY (station_id) REFERENCES public.tds_stations(id);


--
-- PostgreSQL database dump complete
--

SET search_path TO "$user", public;

INSERT INTO "schema_migrations" (version) VALUES
('20240410023029'),
('20240102002232'),
('20231231175136'),
('20231231074449'),
('20231231040823'),
('20231231005753'),
('20231231003005'),
('20230403001620'),
('20230301150937'),
('20230227043115'),
('20230225215152'),
('20230225043320'),
('20230225042930'),
('20230225040548'),
('20230224052502');

