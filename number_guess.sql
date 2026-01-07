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
-- Name: game_logs; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.game_logs (
    user_id integer NOT NULL,
    game_id integer NOT NULL,
    best_guess integer NOT NULL
);


ALTER TABLE public.game_logs OWNER TO freecodecamp;

--
-- Name: game_logs_game_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.game_logs_game_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.game_logs_game_id_seq OWNER TO freecodecamp;

--
-- Name: game_logs_game_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.game_logs_game_id_seq OWNED BY public.game_logs.game_id;


--
-- Name: user_table; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.user_table (
    username character varying(22),
    user_id integer NOT NULL
);


ALTER TABLE public.user_table OWNER TO freecodecamp;

--
-- Name: user_table_user_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.user_table_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_table_user_id_seq OWNER TO freecodecamp;

--
-- Name: user_table_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.user_table_user_id_seq OWNED BY public.user_table.user_id;


--
-- Name: game_logs game_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.game_logs ALTER COLUMN game_id SET DEFAULT nextval('public.game_logs_game_id_seq'::regclass);


--
-- Name: user_table user_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.user_table ALTER COLUMN user_id SET DEFAULT nextval('public.user_table_user_id_seq'::regclass);


--
-- Data for Name: game_logs; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.game_logs VALUES (1, 1, 5);
INSERT INTO public.game_logs VALUES (1, 2, 3);
INSERT INTO public.game_logs VALUES (2, 3, 8);
INSERT INTO public.game_logs VALUES (4, 4, 759);
INSERT INTO public.game_logs VALUES (4, 5, 480);
INSERT INTO public.game_logs VALUES (5, 6, 489);
INSERT INTO public.game_logs VALUES (5, 7, 97);
INSERT INTO public.game_logs VALUES (4, 8, 382);
INSERT INTO public.game_logs VALUES (4, 9, 928);
INSERT INTO public.game_logs VALUES (4, 10, 895);
INSERT INTO public.game_logs VALUES (6, 11, 479);
INSERT INTO public.game_logs VALUES (6, 12, 906);
INSERT INTO public.game_logs VALUES (7, 13, 563);
INSERT INTO public.game_logs VALUES (7, 14, 598);
INSERT INTO public.game_logs VALUES (6, 15, 351);
INSERT INTO public.game_logs VALUES (6, 16, 535);
INSERT INTO public.game_logs VALUES (6, 17, 94);


--
-- Data for Name: user_table; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.user_table VALUES ('test_user', 1);
INSERT INTO public.user_table VALUES ('test', 2);
INSERT INTO public.user_table VALUES ('test1', 3);
INSERT INTO public.user_table VALUES ('user_1767781326123', 4);
INSERT INTO public.user_table VALUES ('user_1767781326122', 5);
INSERT INTO public.user_table VALUES ('user_1767781395662', 6);
INSERT INTO public.user_table VALUES ('user_1767781395661', 7);


--
-- Name: game_logs_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.game_logs_game_id_seq', 17, true);


--
-- Name: user_table_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.user_table_user_id_seq', 7, true);


--
-- Name: game_logs game_logs_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.game_logs
    ADD CONSTRAINT game_logs_pkey PRIMARY KEY (game_id);


--
-- Name: user_table user_table_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.user_table
    ADD CONSTRAINT user_table_pkey PRIMARY KEY (user_id);


--
-- Name: game_logs game_logs_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.game_logs
    ADD CONSTRAINT game_logs_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.user_table(user_id);


--
-- PostgreSQL database dump complete
--

