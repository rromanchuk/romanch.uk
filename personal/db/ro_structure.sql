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

DROP INDEX IF EXISTS public.index_players_on_slug;
DROP INDEX IF EXISTS public.index_images_on_tournament_id;
DROP INDEX IF EXISTS public.index_golfers_on_tournament_id;
DROP INDEX IF EXISTS public.index_golfers_on_player_id;
ALTER TABLE IF EXISTS ONLY public.tournaments DROP CONSTRAINT IF EXISTS tournaments_pkey;
ALTER TABLE IF EXISTS ONLY public.schema_migrations DROP CONSTRAINT IF EXISTS schema_migrations_pkey;
ALTER TABLE IF EXISTS ONLY public.players DROP CONSTRAINT IF EXISTS players_pkey;
ALTER TABLE IF EXISTS ONLY public.images DROP CONSTRAINT IF EXISTS images_pkey;
ALTER TABLE IF EXISTS ONLY public.golfers DROP CONSTRAINT IF EXISTS golfers_pkey;
ALTER TABLE IF EXISTS ONLY public.ar_internal_metadata DROP CONSTRAINT IF EXISTS ar_internal_metadata_pkey;
DROP TABLE IF EXISTS public.tournaments;
DROP TABLE IF EXISTS public.schema_migrations;
DROP TABLE IF EXISTS public.players;
DROP TABLE IF EXISTS public.images;
DROP TABLE IF EXISTS public.golfers;
DROP TABLE IF EXISTS public.ar_internal_metadata;
DROP EXTENSION IF EXISTS pg_stat_statements;
--
-- Name: pg_stat_statements; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pg_stat_statements WITH SCHEMA public;


--
-- Name: EXTENSION pg_stat_statements; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION pg_stat_statements IS 'track planning and execution statistics of all SQL statements executed';


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
-- Name: golfers; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.golfers (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    player_id uuid,
    tournament_id uuid,
    data jsonb DEFAULT '{}'::jsonb NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: images; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.images (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    tournament_id uuid,
    meta jsonb,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    slug character varying
);


--
-- Name: players; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.players (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    name character varying,
    slug character varying,
    data jsonb DEFAULT '{}'::jsonb NOT NULL,
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
-- Name: tournaments; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tournaments (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    city character varying,
    country character varying,
    title character varying,
    ocurred_on date,
    data jsonb DEFAULT '{}'::jsonb NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    slug character varying
);


--
-- Name: ar_internal_metadata ar_internal_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);


--
-- Name: golfers golfers_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.golfers
    ADD CONSTRAINT golfers_pkey PRIMARY KEY (id);


--
-- Name: images images_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.images
    ADD CONSTRAINT images_pkey PRIMARY KEY (id);


--
-- Name: players players_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.players
    ADD CONSTRAINT players_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: tournaments tournaments_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tournaments
    ADD CONSTRAINT tournaments_pkey PRIMARY KEY (id);


--
-- Name: index_golfers_on_player_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_golfers_on_player_id ON public.golfers USING btree (player_id);


--
-- Name: index_golfers_on_tournament_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_golfers_on_tournament_id ON public.golfers USING btree (tournament_id);


--
-- Name: index_images_on_tournament_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_images_on_tournament_id ON public.images USING btree (tournament_id);


--
-- Name: index_players_on_slug; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_players_on_slug ON public.players USING btree (slug);


--
-- PostgreSQL database dump complete
--

SET search_path TO public, postgis;

INSERT INTO "schema_migrations" (version) VALUES
('20231231010416'),
('20231231005823'),
('20230529180823'),
('20230529154437'),
('20230521071142'),
('20230508010552'),
('20230403190051');

