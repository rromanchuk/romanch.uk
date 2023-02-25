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

ALTER TABLE IF EXISTS ONLY public.wx_station_observations DROP CONSTRAINT IF EXISTS wx_station_observations_pkey;
ALTER TABLE IF EXISTS ONLY public.schema_migrations DROP CONSTRAINT IF EXISTS schema_migrations_pkey;
ALTER TABLE IF EXISTS ONLY public.ar_internal_metadata DROP CONSTRAINT IF EXISTS ar_internal_metadata_pkey;
DROP TABLE IF EXISTS public.wx_station_observations;
DROP TABLE IF EXISTS public.schema_migrations;
DROP TABLE IF EXISTS public.ar_internal_metadata;
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
-- Name: wx_station_observations wx_station_observations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.wx_station_observations
    ADD CONSTRAINT wx_station_observations_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

SET search_path TO public, postgis;

INSERT INTO "schema_migrations" (version) VALUES
('20230224052502'),
('20230225040548'),
('20230225042930'),
('20230225043320');


