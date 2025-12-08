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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(50) NOT NULL,
    description text,
    age_in_billions_of_years numeric(4,1),
    galaxy_type character varying(30)
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
    name character varying(50) NOT NULL,
    description text,
    age_in_millions_of_years numeric(4,1),
    is_spherical boolean,
    planet_id integer
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
    name character varying(50) NOT NULL,
    description text,
    age_in_millions_of_years numeric(4,1),
    has_life boolean,
    star_id integer,
    number_of_moons integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_moon_star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet_moon_star (
    planet_moon_star_id integer NOT NULL,
    planet_id integer NOT NULL,
    moon_id integer NOT NULL,
    star_id integer NOT NULL,
    name character varying(50)
);


ALTER TABLE public.planet_moon_star OWNER TO freecodecamp;

--
-- Name: planet_moon_star_planet_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

ALTER TABLE public.planet_moon_star ALTER COLUMN planet_moon_star_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.planet_moon_star_planet_moon_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


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
    name character varying(50) NOT NULL,
    description text,
    age_in_millions_of_years numeric(4,1),
    galaxy_id integer,
    number_of_planets integer
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
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (3, 'Andromeda Galaxy', 'The most distant object visible to the naked eye', 100.0, 'spiral');
INSERT INTO public.galaxy VALUES (4, 'Triangulum Galaxy', 'the third-largest member of the Local Group of galaxies after the Milky Way and Andromeda', 100.0, 'spiral');
INSERT INTO public.galaxy VALUES (5, 'Whirlpool Galaxy', 'easily visible with amateur telescopes, known for its striking and well-defined arms that are actively forming new stars and are shaped by its gravitational interaction with a companion galaxy', 0.4, 'spiral');
INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'appears as a hazy band of light in the night sky from our perspective on Earth', 13.6, 'barred spiral');
INSERT INTO public.galaxy VALUES (6, 'Sombrero Galaxy', 'known for its hat-like appearance from its bright central bulge and a prominent, dark dust lane', 13.0, 'spiral');
INSERT INTO public.galaxy VALUES (7, 'Large Magellanic Cloud', 'A satellite dwarf galaxy of the Milky Way, located in the southern sky.', 13.0, 'irregular');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'moon1planet1Sirius', 'moon of planet1Sirius', 50.0, true, 1);
INSERT INTO public.moon VALUES (2, 'moon2planet1Sirius', 'moon of planet1Sirius', 50.0, true, 1);
INSERT INTO public.moon VALUES (3, 'moon1planet2Sirius', 'moon of planet2Sirius', 50.0, false, 3);
INSERT INTO public.moon VALUES (4, 'moon2planet2Sirius', 'moon of planet2Sirius', 50.0, false, 3);
INSERT INTO public.moon VALUES (5, 'moon1planet1Alpheratz', 'moon of planet1Alpheratz', 50.0, true, 4);
INSERT INTO public.moon VALUES (6, 'moon2planet1Alpheratz', 'moon of planet1Alpheratz', 50.0, true, 4);
INSERT INTO public.moon VALUES (7, 'moon1planet2Alpheratz', 'moon of planet2Alpheratz', 50.0, false, 5);
INSERT INTO public.moon VALUES (8, 'moon2planet2Alpheratz', 'moon of planet2Alpheratz', 50.0, false, 5);
INSERT INTO public.moon VALUES (9, 'moon1planet1NGC604', 'moon of planet1NGC604', 50.0, true, 6);
INSERT INTO public.moon VALUES (10, 'moon2planet1NGC604', 'moon of planet1NGC604', 50.0, true, 6);
INSERT INTO public.moon VALUES (11, 'moon1planet2NGC604', 'moon of planet2NGC604', 50.0, false, 7);
INSERT INTO public.moon VALUES (12, 'moon2planet2NGC604', 'moon of planet2NGC604', 50.0, false, 7);
INSERT INTO public.moon VALUES (13, 'moon1planet1Alkaid', 'moon of planet1Alkaid', 50.0, true, 8);
INSERT INTO public.moon VALUES (14, 'moon2planet1Alkaid', 'moon of planet1Alkaid', 50.0, true, 8);
INSERT INTO public.moon VALUES (15, 'moon1planet2Alkaid', 'moon of planet2Alkaid', 50.0, false, 9);
INSERT INTO public.moon VALUES (16, 'moon2planet2Alkaid', 'moon of planet2Alkaid', 50.0, false, 9);
INSERT INTO public.moon VALUES (17, 'moon1planet1Vega', 'moon of planet1Vega', 50.0, true, 10);
INSERT INTO public.moon VALUES (18, 'moon2planet1Vega', 'moon of planet1Vega', 50.0, true, 10);
INSERT INTO public.moon VALUES (19, 'moon1planet2Vega', 'moon of planet2Vega', 50.0, false, 11);
INSERT INTO public.moon VALUES (20, 'moon2planet2Vega', 'moon of planet2Vega', 50.0, false, 11);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (5, 'planet2Alpheratz', 'planet of Alpheratz', 100.0, false, 2, NULL);
INSERT INTO public.planet VALUES (6, 'planet1NGC604', 'planet of NGC 604', 100.0, true, 3, NULL);
INSERT INTO public.planet VALUES (7, 'planet2NGC604', 'planet of NGC 604', 100.0, true, 3, NULL);
INSERT INTO public.planet VALUES (8, 'planet1Alkaid', 'planet of Alkaid', 100.0, false, 4, NULL);
INSERT INTO public.planet VALUES (9, 'planet2Alkaid', 'planet of Alkaid', 100.0, false, 4, NULL);
INSERT INTO public.planet VALUES (10, 'planet1Vega', 'planet of Vega', 100.0, true, 5, NULL);
INSERT INTO public.planet VALUES (11, 'planet2Vega', 'planet of Vega', 100.0, true, 5, NULL);
INSERT INTO public.planet VALUES (12, 'planet1OrionNebula', 'planet of Orion Nebula', 100.0, false, 6, NULL);
INSERT INTO public.planet VALUES (13, 'planet2OrionNebula', 'planet of Orion Nebula', 100.0, false, 6, NULL);
INSERT INTO public.planet VALUES (1, 'planet1Sirius', 'planet of Sirius', 100.0, true, 1, 2);
INSERT INTO public.planet VALUES (3, 'planet2Sirius', 'planet of Sirius', 100.0, true, 1, 2);
INSERT INTO public.planet VALUES (4, 'planet1Alpheratz', 'planet of Alpheratz', 100.0, false, 2, 2);


--
-- Data for Name: planet_moon_star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet_moon_star OVERRIDING SYSTEM VALUE VALUES (1, 1, 1, 1, 'group1');
INSERT INTO public.planet_moon_star OVERRIDING SYSTEM VALUE VALUES (2, 1, 2, 1, 'group2');
INSERT INTO public.planet_moon_star OVERRIDING SYSTEM VALUE VALUES (3, 3, 3, 1, 'group3');
INSERT INTO public.planet_moon_star OVERRIDING SYSTEM VALUE VALUES (4, 3, 4, 1, 'group4');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (5, 'Vega', 'a bright star in the constellation Lyra', 700.0, 6, NULL);
INSERT INTO public.star VALUES (6, 'Orion Nebula', 'A region of active star formation within the constellation Orion', 3.0, 7, NULL);
INSERT INTO public.star VALUES (1, 'Sirius', 'brightest star in the night sky, located in the constellation Canis Major and known to astronomers as a binary star system', 228.0, 1, 0);
INSERT INTO public.star VALUES (2, 'Alpheratz', ' brightest star in the constellation Andromeda and is also a prominent corner star in the Great Square of Pegasus asterism', 70.0, 3, 0);
INSERT INTO public.star VALUES (3, 'NGC 604', 'bright and large star-forming region located within the galaxy', 3.5, 4, 0);
INSERT INTO public.star VALUES (4, 'Alkaid', 'prominent star in our own Milky Way galaxy that acts as a celestial landmark to find the Whirlpool Galaxy', 10.0, 5, 0);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 7, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_moon_star_planet_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_moon_star_planet_moon_id_seq', 4, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 13, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


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
-- Name: planet_moon_star planet_moon_star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_moon_star
    ADD CONSTRAINT planet_moon_star_pkey PRIMARY KEY (planet_moon_star_id);


--
-- Name: planet_moon_star planet_moon_star_planet_id_moon_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_moon_star
    ADD CONSTRAINT planet_moon_star_planet_id_moon_id_key UNIQUE (planet_id, moon_id);


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
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet_moon_star planet_moon_star_moon_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_moon_star
    ADD CONSTRAINT planet_moon_star_moon_id_fkey FOREIGN KEY (moon_id) REFERENCES public.moon(moon_id) ON DELETE CASCADE;


--
-- Name: planet_moon_star planet_moon_star_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_moon_star
    ADD CONSTRAINT planet_moon_star_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id) ON DELETE CASCADE;


--
-- Name: planet_moon_star planet_moon_star_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_moon_star
    ADD CONSTRAINT planet_moon_star_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id) ON DELETE CASCADE;


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

