--
-- PostgreSQL database dump
--

-- Dumped from database version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)
-- Dumped by pg_dump version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)

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

DROP DATABASE number_guess;
--
-- Name: number_guess; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE number_guess WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE number_guess OWNER TO freecodecamp;

\connect number_guess

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

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: games; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.games (
    game_id integer NOT NULL,
    user_id integer NOT NULL,
    guesses integer NOT NULL
);


ALTER TABLE public.games OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.games_game_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.games_game_id_seq OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.games_game_id_seq OWNED BY public.games.game_id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.users (
    user_id integer NOT NULL,
    username character varying(22) NOT NULL
);


ALTER TABLE public.users OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_id_seq OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;


--
-- Name: games game_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games ALTER COLUMN game_id SET DEFAULT nextval('public.games_game_id_seq'::regclass);


--
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.games VALUES (1, 1, 5);
INSERT INTO public.games VALUES (2, 2, 930);
INSERT INTO public.games VALUES (3, 2, 363);
INSERT INTO public.games VALUES (4, 3, 985);
INSERT INTO public.games VALUES (5, 3, 7);
INSERT INTO public.games VALUES (6, 2, 451);
INSERT INTO public.games VALUES (7, 2, 24);
INSERT INTO public.games VALUES (8, 2, 948);
INSERT INTO public.games VALUES (9, 4, 887);
INSERT INTO public.games VALUES (10, 4, 798);
INSERT INTO public.games VALUES (11, 5, 716);
INSERT INTO public.games VALUES (12, 5, 669);
INSERT INTO public.games VALUES (13, 4, 827);
INSERT INTO public.games VALUES (14, 4, 479);
INSERT INTO public.games VALUES (15, 4, 135);
INSERT INTO public.games VALUES (16, 6, 786);
INSERT INTO public.games VALUES (17, 6, 939);
INSERT INTO public.games VALUES (18, 7, 884);
INSERT INTO public.games VALUES (19, 7, 790);
INSERT INTO public.games VALUES (20, 6, 934);
INSERT INTO public.games VALUES (21, 6, 893);
INSERT INTO public.games VALUES (22, 6, 547);
INSERT INTO public.games VALUES (23, 8, 111);
INSERT INTO public.games VALUES (24, 8, 927);
INSERT INTO public.games VALUES (25, 9, 397);
INSERT INTO public.games VALUES (26, 9, 480);
INSERT INTO public.games VALUES (27, 8, 203);
INSERT INTO public.games VALUES (28, 8, 224);
INSERT INTO public.games VALUES (29, 8, 630);
INSERT INTO public.games VALUES (30, 10, 11);
INSERT INTO public.games VALUES (31, 11, 280);
INSERT INTO public.games VALUES (32, 11, 879);
INSERT INTO public.games VALUES (33, 12, 9);
INSERT INTO public.games VALUES (34, 12, 693);
INSERT INTO public.games VALUES (35, 11, 615);
INSERT INTO public.games VALUES (36, 11, 396);
INSERT INTO public.games VALUES (37, 11, 658);
INSERT INTO public.games VALUES (38, 1, 20);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES (1, 'juli');
INSERT INTO public.users VALUES (2, 'user_1757294513143');
INSERT INTO public.users VALUES (3, 'user_1757294513142');
INSERT INTO public.users VALUES (4, 'user_1757294871304');
INSERT INTO public.users VALUES (5, 'user_1757294871303');
INSERT INTO public.users VALUES (6, 'user_1757295295256');
INSERT INTO public.users VALUES (7, 'user_1757295295255');
INSERT INTO public.users VALUES (8, 'user_1757295401476');
INSERT INTO public.users VALUES (9, 'user_1757295401475');
INSERT INTO public.users VALUES (10, '');
INSERT INTO public.users VALUES (11, 'user_1757295588302');
INSERT INTO public.users VALUES (12, 'user_1757295588301');


--
-- Name: games_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_game_id_seq', 38, true);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.users_user_id_seq', 12, true);


--
-- Name: games games_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_pkey PRIMARY KEY (game_id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- Name: users users_username_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key UNIQUE (username);


--
-- Name: games games_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id);


--
-- PostgreSQL database dump complete
--

