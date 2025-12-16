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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: celestial_event; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.celestial_event (
    celestial_event_id integer NOT NULL,
    name character varying(40) NOT NULL,
    planet_id integer,
    event_type text
);


ALTER TABLE public.celestial_event OWNER TO freecodecamp;

--
-- Name: celestial_event_event_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.celestial_event_event_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.celestial_event_event_id_seq OWNER TO freecodecamp;

--
-- Name: celestial_event_event_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.celestial_event_event_id_seq OWNED BY public.celestial_event.celestial_event_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(40) NOT NULL,
    age_in_billions_of_years numeric(5,2),
    morphological_type character varying(30),
    distance_from_earth_mly numeric
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(15) NOT NULL,
    planet_id integer,
    equatorial_radius_km numeric,
    is_geologically_active integer
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(20) NOT NULL,
    star_id integer,
    has_life boolean,
    has_ring_system boolean
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(25) NOT NULL,
    galaxy_id integer,
    mass_solar_units numeric,
    absolute_magnitude_rank integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: celestial_event celestial_event_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.celestial_event ALTER COLUMN celestial_event_id SET DEFAULT nextval('public.celestial_event_event_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: celestial_event; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.celestial_event VALUES (1, 'The Great Red Spot''s Persistence', 3, 'Phenomenon');
INSERT INTO public.celestial_event VALUES (2, 'Impact that Formed the Moon', 1, 'Collision');
INSERT INTO public.celestial_event VALUES (3, 'Ring System Formation', 4, 'Formation');


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 13.60, 'Barred Spiral (SBbc)', 0.0);
INSERT INTO public.galaxy VALUES (2, 'Andromeda (M31)', 10.00, 'Spiral (SA(s)b)', 2.537);
INSERT INTO public.galaxy VALUES (3, 'Messier 87 (M87)', 12.00, 'Elliptical (E0)', 53.5);
INSERT INTO public.galaxy VALUES (4, 'Triangulum (M33)', 5.00, 'Spiral (SA(s)cd)', 3.2);
INSERT INTO public.galaxy VALUES (5, 'Centaurus A (NGC 5128)', 13.00, 'Lenticular/Elliptical (S0)', 12.0);
INSERT INTO public.galaxy VALUES (6, 'The Large Magellanic Cloud (LMC)', 11.00, 'Irregular (Irr)', 0.163);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'The Moon', 1, 1737.4, 0);
INSERT INTO public.moon VALUES (2, 'Phobos', 2, 11.2, 0);
INSERT INTO public.moon VALUES (3, 'Deimos', 2, 6.2, 0);
INSERT INTO public.moon VALUES (4, 'Io', 3, 1821.6, 1);
INSERT INTO public.moon VALUES (5, 'Europa', 3, 1560.8, 1);
INSERT INTO public.moon VALUES (6, 'Ganymede', 3, 2634.1, 1);
INSERT INTO public.moon VALUES (7, 'Callisto', 3, 2410.3, 0);
INSERT INTO public.moon VALUES (8, 'Amalthea', 3, 83.5, 0);
INSERT INTO public.moon VALUES (9, 'Titan', 4, 2574.7, 1);
INSERT INTO public.moon VALUES (10, 'Rhea', 4, 763.8, 0);
INSERT INTO public.moon VALUES (11, 'Iapetus', 4, 734.5, 0);
INSERT INTO public.moon VALUES (12, 'Dione', 4, 561.4, 0);
INSERT INTO public.moon VALUES (13, 'Tethys', 4, 531.1, 0);
INSERT INTO public.moon VALUES (14, 'Enceladus', 4, 252.1, 1);
INSERT INTO public.moon VALUES (15, 'Mimas', 4, 198.2, 0);
INSERT INTO public.moon VALUES (16, 'Miranda', 6, 235.8, 0);
INSERT INTO public.moon VALUES (17, 'Ariel', 6, 578.9, 0);
INSERT INTO public.moon VALUES (18, 'Umbriel', 6, 584.7, 0);
INSERT INTO public.moon VALUES (19, 'Titania', 6, 788.9, 0);
INSERT INTO public.moon VALUES (20, 'Oberon', 6, 761.4, 0);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 1, true, false);
INSERT INTO public.planet VALUES (2, 'Mars', 1, false, false);
INSERT INTO public.planet VALUES (3, 'Jupiter', 1, false, true);
INSERT INTO public.planet VALUES (4, 'Saturn', 1, false, true);
INSERT INTO public.planet VALUES (5, 'Venus', 1, false, false);
INSERT INTO public.planet VALUES (6, 'Uranus', 1, false, true);
INSERT INTO public.planet VALUES (7, 'Proxima b', 2, false, false);
INSERT INTO public.planet VALUES (8, 'Proxima d', 2, false, false);
INSERT INTO public.planet VALUES (9, 'Kepler-186f', 7, false, false);
INSERT INTO public.planet VALUES (10, 'HD 189733 b', 8, false, false);
INSERT INTO public.planet VALUES (11, 'WASP-12b', 9, false, false);
INSERT INTO public.planet VALUES (12, 'HR 5183 b', 10, false, true);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun (Sol)', 1, 1.00, 5);
INSERT INTO public.star VALUES (2, 'Proxima Centauri', 1, 0.12, 15);
INSERT INTO public.star VALUES (3, 'Betelgeuse', 1, 15.00, -6);
INSERT INTO public.star VALUES (4, 'Alpheratz', 2, 3.80, 1);
INSERT INTO public.star VALUES (5, 'R136a1', 6, 150.00, -10);
INSERT INTO public.star VALUES (6, 'NGC 5128 E', 5, 1.00, -5);
INSERT INTO public.star VALUES (7, 'Kepler-186', 1, 0.54, 8);
INSERT INTO public.star VALUES (8, 'HD 189733', 1, 0.82, 7);
INSERT INTO public.star VALUES (9, 'WASP-12', 1, 1.40, 3);
INSERT INTO public.star VALUES (10, 'HR 5183', 1, 1.30, 4);


--
-- Name: celestial_event_event_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.celestial_event_event_id_seq', 3, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 10, true);


--
-- Name: celestial_event celestial_event_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.celestial_event
    ADD CONSTRAINT celestial_event_name_key UNIQUE (name);


--
-- Name: celestial_event celestial_event_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.celestial_event
    ADD CONSTRAINT celestial_event_pkey PRIMARY KEY (celestial_event_id);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: celestial_event celestial_event_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.celestial_event
    ADD CONSTRAINT celestial_event_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

