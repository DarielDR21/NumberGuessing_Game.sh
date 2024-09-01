--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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
    username_id integer NOT NULL,
    guesses integer,
    secret_number integer NOT NULL
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
    username_id integer NOT NULL,
    username character varying(22) NOT NULL
);


ALTER TABLE public.users OWNER TO freecodecamp;

--
-- Name: users_username_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.users_username_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_username_id_seq OWNER TO freecodecamp;

--
-- Name: users_username_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.users_username_id_seq OWNED BY public.users.username_id;


--
-- Name: games game_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games ALTER COLUMN game_id SET DEFAULT nextval('public.games_game_id_seq'::regclass);


--
-- Name: users username_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users ALTER COLUMN username_id SET DEFAULT nextval('public.users_username_id_seq'::regclass);


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.games VALUES (17359, 105, 1, 711);
INSERT INTO public.games VALUES (17360, 106, 42, 41);
INSERT INTO public.games VALUES (17361, 106, 610, 609);
INSERT INTO public.games VALUES (17362, 107, 393, 392);
INSERT INTO public.games VALUES (17363, 107, 193, 192);
INSERT INTO public.games VALUES (17364, 106, 318, 315);
INSERT INTO public.games VALUES (17365, 106, 757, 755);
INSERT INTO public.games VALUES (17366, 106, 875, 874);
INSERT INTO public.games VALUES (17367, 108, 317, 316);
INSERT INTO public.games VALUES (17368, 108, 63, 62);
INSERT INTO public.games VALUES (17369, 109, 403, 402);
INSERT INTO public.games VALUES (17370, 109, 487, 486);
INSERT INTO public.games VALUES (17371, 108, 244, 241);
INSERT INTO public.games VALUES (17372, 108, 941, 939);
INSERT INTO public.games VALUES (17373, 108, 634, 633);
INSERT INTO public.games VALUES (17374, 110, 829, 828);
INSERT INTO public.games VALUES (17375, 110, 280, 279);
INSERT INTO public.games VALUES (17376, 111, 764, 763);
INSERT INTO public.games VALUES (17377, 111, 80, 79);
INSERT INTO public.games VALUES (17378, 110, 379, 376);
INSERT INTO public.games VALUES (17379, 110, 207, 205);
INSERT INTO public.games VALUES (17380, 110, 950, 949);
INSERT INTO public.games VALUES (17381, 112, 933, 932);
INSERT INTO public.games VALUES (17382, 112, 27, 26);
INSERT INTO public.games VALUES (17383, 113, 567, 566);
INSERT INTO public.games VALUES (17384, 113, 900, 899);
INSERT INTO public.games VALUES (17385, 112, 821, 818);
INSERT INTO public.games VALUES (17386, 112, 816, 814);
INSERT INTO public.games VALUES (17387, 112, 459, 458);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES (105, 'DarielDR21');
INSERT INTO public.users VALUES (106, 'user_1725150604741');
INSERT INTO public.users VALUES (107, 'user_1725150604740');
INSERT INTO public.users VALUES (108, 'user_1725150716604');
INSERT INTO public.users VALUES (109, 'user_1725150716603');
INSERT INTO public.users VALUES (110, 'user_1725150780450');
INSERT INTO public.users VALUES (111, 'user_1725150780449');
INSERT INTO public.users VALUES (112, 'user_1725150987401');
INSERT INTO public.users VALUES (113, 'user_1725150987400');


--
-- Name: games_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_game_id_seq', 17387, true);


--
-- Name: users_username_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.users_username_id_seq', 113, true);


--
-- Name: games games_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_pkey PRIMARY KEY (game_id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (username_id);


--
-- Name: users users_username_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key UNIQUE (username);


--
-- Name: games games_username_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_username_id_fkey FOREIGN KEY (username_id) REFERENCES public.users(username_id);


--
-- PostgreSQL database dump complete
--

