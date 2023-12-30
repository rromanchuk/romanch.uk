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

DROP INDEX IF EXISTS public.unique_taggings;
DROP INDEX IF EXISTS public.index_users_on_slug;
DROP INDEX IF EXISTS public.index_romanchuk_open_tournaments_on_slug;
DROP INDEX IF EXISTS public.index_romanchuk_open_players_on_slug;
DROP INDEX IF EXISTS public.index_romanchuk_open_golfers_on_tournament_id;
DROP INDEX IF EXISTS public.index_romanchuk_open_golfers_on_player_id;
DROP INDEX IF EXISTS public.index_posts_on_slug;
DROP INDEX IF EXISTS public.index_gutentag_tags_on_taggings_count;
DROP INDEX IF EXISTS public.index_gutentag_tags_on_name;
DROP INDEX IF EXISTS public.index_gutentag_taggings_on_taggable_type_and_taggable_id;
DROP INDEX IF EXISTS public.index_gutentag_taggings_on_tag_id;
DROP INDEX IF EXISTS public.index_friendly_id_slugs_on_sluggable_type_and_sluggable_id;
DROP INDEX IF EXISTS public.index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope;
DROP INDEX IF EXISTS public.index_friendly_id_slugs_on_slug_and_sluggable_type;
DROP INDEX IF EXISTS public.index_attachments_uniqueness;
DROP INDEX IF EXISTS public.index_attachments_on_blob_id;
ALTER TABLE IF EXISTS ONLY public.users DROP CONSTRAINT IF EXISTS users_pkey;
ALTER TABLE IF EXISTS ONLY public.schema_migrations DROP CONSTRAINT IF EXISTS schema_migrations_pkey;
ALTER TABLE IF EXISTS ONLY public.romanchuk_open_tournaments DROP CONSTRAINT IF EXISTS romanchuk_open_tournaments_pkey;
ALTER TABLE IF EXISTS ONLY public.romanchuk_open_players DROP CONSTRAINT IF EXISTS romanchuk_open_players_pkey;
ALTER TABLE IF EXISTS ONLY public.romanchuk_open_golfers DROP CONSTRAINT IF EXISTS romanchuk_open_golfers_pkey;
ALTER TABLE IF EXISTS ONLY public.posts DROP CONSTRAINT IF EXISTS posts_pkey;
ALTER TABLE IF EXISTS ONLY public.gutentag_tags DROP CONSTRAINT IF EXISTS gutentag_tags_pkey;
ALTER TABLE IF EXISTS ONLY public.gutentag_taggings DROP CONSTRAINT IF EXISTS gutentag_taggings_pkey;
ALTER TABLE IF EXISTS ONLY public.friendly_id_slugs DROP CONSTRAINT IF EXISTS friendly_id_slugs_pkey;
ALTER TABLE IF EXISTS ONLY public.blobs DROP CONSTRAINT IF EXISTS blobs_pkey;
ALTER TABLE IF EXISTS ONLY public.attachments DROP CONSTRAINT IF EXISTS attachments_pkey;
ALTER TABLE IF EXISTS ONLY public.ar_internal_metadata DROP CONSTRAINT IF EXISTS ar_internal_metadata_pkey;
ALTER TABLE IF EXISTS public.gutentag_tags ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.gutentag_taggings ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.friendly_id_slugs ALTER COLUMN id DROP DEFAULT;
DROP TABLE IF EXISTS public.users;
DROP TABLE IF EXISTS public.schema_migrations;
DROP TABLE IF EXISTS public.romanchuk_open_tournaments;
DROP TABLE IF EXISTS public.romanchuk_open_players;
DROP TABLE IF EXISTS public.romanchuk_open_golfers;
DROP TABLE IF EXISTS public.posts;
DROP SEQUENCE IF EXISTS public.gutentag_tags_id_seq;
DROP TABLE IF EXISTS public.gutentag_tags;
DROP SEQUENCE IF EXISTS public.gutentag_taggings_id_seq;
DROP TABLE IF EXISTS public.gutentag_taggings;
DROP SEQUENCE IF EXISTS public.friendly_id_slugs_id_seq;
DROP TABLE IF EXISTS public.friendly_id_slugs;
DROP TABLE IF EXISTS public.blobs;
DROP TABLE IF EXISTS public.attachments;
DROP TABLE IF EXISTS public.ar_internal_metadata;
DROP EXTENSION IF EXISTS postgis;
DROP EXTENSION IF EXISTS pg_trgm;
--
-- Name: pg_trgm; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pg_trgm WITH SCHEMA public;


--
-- Name: EXTENSION pg_trgm; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION pg_trgm IS 'text similarity measurement and index searching based on trigrams';


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
-- Name: unique_taggings; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX unique_taggings ON public.gutentag_taggings USING btree (taggable_type, taggable_id, tag_id);


--
-- PostgreSQL database dump complete
--

SET search_path TO public, postgis;

INSERT INTO "schema_migrations" (version) VALUES
('20231229222242'),
('20231229222241'),
('20231229222240'),
('20230509000927'),
('20230509000327'),
('20230508230531'),
('20230302171017'),
('20221222083614'),
('20221222083453'),
('20221222081620'),
('20221222081525'),
('20221222080407'),
('20221222074333'),
('20221218192908'),
('20221217055523'),
('20221016052037'),
('20220924080503'),
('20220921060628'),
('20220918231901'),
('20220915172449'),
('20220915095311'),
('20220912170518'),
('20220912160222'),
('20220912032106'),
('20220912023844'),
('20220911031445'),
('20220910222737'),
('20220910200350'),
('20220909221031'),
('20220909215538'),
('20220909202215'),
('20220909194615'),
('20220909190019'),
('20220909141241'),
('20220908030135'),
('20220908030103'),
('20220907202226'),
('20220907201002'),
('20220907063711'),
('20220907061153'),
('20220904211826'),
('20220903210615'),
('20220903195645'),
('20220903083551'),
('20220902213500'),
('20220902173200'),
('20220901182250'),
('20220901053421'),
('20220831102142'),
('20220831094855'),
('20220830200808'),
('20220829165251'),
('20220829054151'),
('20220829035749'),
('20220821012755'),
('20220820234256'),
('20220521080055'),
('20220521071225'),
('20220521051700'),
('20220521030922'),
('20220521025558'),
('20220518024243'),
('20220516065126'),
('20220430012521'),
('20220428191854'),
('20220428093737'),
('20220428093506'),
('20220428075543'),
('20220428074500'),
('20220423051330'),
('20220422185122'),
('20220422095242'),
('20220422094735'),
('20220421233045'),
('20220420221740'),
('20220419065117'),
('20220419065040'),
('20220419065022'),
('20220417222217'),
('20220416012144'),
('20220416012143'),
('20220416012142'),
('20220416005025');

