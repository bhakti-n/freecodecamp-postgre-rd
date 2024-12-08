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
-- Name: connector_table; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.connector_table (
    connector_table_id integer NOT NULL,
    name character varying(60) NOT NULL,
    galaxy_id integer,
    star_id integer NOT NULL,
    planet_id integer NOT NULL,
    moon_id integer
);


ALTER TABLE public.connector_table OWNER TO freecodecamp;

--
-- Name: connector_table_connector_table_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.connector_table_connector_table_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.connector_table_connector_table_id_seq OWNER TO freecodecamp;

--
-- Name: connector_table_connector_table_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.connector_table_connector_table_id_seq OWNED BY public.connector_table.connector_table_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(60) NOT NULL,
    distance_from_earth integer,
    age_in_millions_of_years integer NOT NULL,
    description text
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
    name character varying(60) NOT NULL,
    age_in_millions_of_years integer NOT NULL,
    distance_from_earth integer,
    description text,
    planet_id integer,
    surface_area boolean NOT NULL
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
    name character varying(60) NOT NULL,
    surface_area numeric NOT NULL,
    age_in_millions_of_years integer NOT NULL,
    distance_from_earth integer,
    description text,
    star_id integer
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
    name character varying(60) NOT NULL,
    lumens boolean NOT NULL,
    age_in_millions_of_years integer NOT NULL,
    distance_from_earth integer,
    description text,
    galaxy_id integer
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
-- Name: connector_table connector_table_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.connector_table ALTER COLUMN connector_table_id SET DEFAULT nextval('public.connector_table_connector_table_id_seq'::regclass);


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
-- Data for Name: connector_table; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.connector_table VALUES (1, 'MilkyWay_Sun_Earth', 1, 1, 3, NULL);
INSERT INTO public.connector_table VALUES (2, 'MilkyWay_Sun_Mars', 1, 1, 4, NULL);
INSERT INTO public.connector_table VALUES (3, 'MilkyWay_Sun_Jupiter', 1, 1, 5, NULL);
INSERT INTO public.connector_table VALUES (4, 'MilkyWay_Sirius_AlphaCentauriBb', 1, 2, 9, NULL);
INSERT INTO public.connector_table VALUES (5, 'MilkyWay_Betelgeuse_Kepler22b', 1, 3, 10, NULL);
INSERT INTO public.connector_table VALUES (6, 'MilkyWay_Rigel_Gliese581g', 1, 4, 11, NULL);
INSERT INTO public.connector_table VALUES (7, 'MilkyWay_Vega_HD209458b', 1, 5, 12, NULL);
INSERT INTO public.connector_table VALUES (8, 'Andromeda_ProximaCentauri_AlphaCentauriBb', 2, 6, 9, NULL);
INSERT INTO public.connector_table VALUES (9, 'Andromeda_ProximaCentauri_Kepler22b', 2, 6, 10, NULL);
INSERT INTO public.connector_table VALUES (10, 'Andromeda_ProximaCentauri_Gliese581g', 2, 6, 11, NULL);
INSERT INTO public.connector_table VALUES (11, 'Andromeda_ProximaCentauri_HD209458b', 2, 6, 12, NULL);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 0, 13600, 'Our galaxy');
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 2537000, 10000, 'Nearest large galaxy');
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 3000000, 8000, 'Spiral galaxy');
INSERT INTO public.galaxy VALUES (4, 'Large Magellanic Cloud', 163000, 13000, 'Satellite galaxy');
INSERT INTO public.galaxy VALUES (5, 'Small Magellanic Cloud', 200000, 12000, 'Dwarf galaxy');
INSERT INTO public.galaxy VALUES (6, 'Whirlpool', 31000000, 10000, 'Classic spiral galaxy');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 4500, 0, 'Natural satellite of Earth', 3, true);
INSERT INTO public.moon VALUES (2, 'Phobos', 4500, 0, 'Mars inner moon', 4, true);
INSERT INTO public.moon VALUES (3, 'Deimos', 4500, 0, 'Mars outer moon', 4, true);
INSERT INTO public.moon VALUES (4, 'Europa', 4500, 0, 'Moon of Jupiter', 5, true);
INSERT INTO public.moon VALUES (5, 'Ganymede', 4500, 0, 'Largest moon of Jupiter', 5, true);
INSERT INTO public.moon VALUES (6, 'Callisto', 4500, 0, 'Jupiter moon', 5, true);
INSERT INTO public.moon VALUES (7, 'Titan', 4500, 0, 'Largest moon of Saturn', 6, true);
INSERT INTO public.moon VALUES (8, 'Enceladus', 4500, 0, 'Moon with ice geysers', 6, true);
INSERT INTO public.moon VALUES (9, 'Miranda', 4500, 0, 'Moon of Uranus', 7, true);
INSERT INTO public.moon VALUES (10, 'Triton', 4500, 0, 'Largest moon of Neptune', 8, true);
INSERT INTO public.moon VALUES (11, 'ExoMoon1', 4500, 4, 'Moon of exoplanet Alpha Centauri Bb', 9, true);
INSERT INTO public.moon VALUES (12, 'ExoMoon2', 4500, 4, 'Moon of exoplanet Kepler 22b', 10, true);
INSERT INTO public.moon VALUES (13, 'ExoMoon3', 4500, 4, 'Moon of exoplanet Gliese 581g', 11, true);
INSERT INTO public.moon VALUES (14, 'ExoMoon4', 4500, 4, 'Moon of exoplanet HD 209458b', 12, true);
INSERT INTO public.moon VALUES (15, 'Io', 4500, 0, 'Volcanic moon of Jupiter', 5, true);
INSERT INTO public.moon VALUES (16, 'Rhea', 4500, 0, 'Moon of Saturn', 6, true);
INSERT INTO public.moon VALUES (17, 'Oberon', 4500, 0, 'Moon of Uranus', 7, true);
INSERT INTO public.moon VALUES (18, 'Proteus', 4500, 0, 'Moon of Neptune', 8, true);
INSERT INTO public.moon VALUES (19, 'Dione', 4500, 0, 'Moon of Saturn', 6, true);
INSERT INTO public.moon VALUES (20, 'Ariel', 4500, 0, 'Moon of Uranus', 7, true);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 74800000, 4500, 0, 'Closest planet to Sun', 1);
INSERT INTO public.planet VALUES (2, 'Venus', 460200000, 4500, 0, 'Second planet from Sun', 1);
INSERT INTO public.planet VALUES (3, 'Earth', 510100000, 4500, 0, 'Our home planet', 1);
INSERT INTO public.planet VALUES (4, 'Mars', 144800000, 4500, 0, 'The red planet', 1);
INSERT INTO public.planet VALUES (5, 'Jupiter', 61420000000, 4500, 0, 'Gas giant', 1);
INSERT INTO public.planet VALUES (6, 'Saturn', 42700000000, 4500, 0, 'Ringed planet', 1);
INSERT INTO public.planet VALUES (7, 'Uranus', 8083000000, 4500, 0, 'Ice giant', 1);
INSERT INTO public.planet VALUES (8, 'Neptune', 7618000000, 4500, 0, 'Farthest planet from Sun', 1);
INSERT INTO public.planet VALUES (9, 'Alpha Centauri Bb', 510100000, 4500, 4, 'Exoplanet', 6);
INSERT INTO public.planet VALUES (10, 'Kepler-22b', 108000000, 6000, 600, 'Habitable zone planet', 6);
INSERT INTO public.planet VALUES (11, 'Gliese 581g', 260000000, 6000, 20, 'Potentially habitable exoplanet', 6);
INSERT INTO public.planet VALUES (12, 'HD 209458b', 142000000, 7000, 150, 'Exoplanet', 6);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', true, 4500, 0, 'Main sequence star', 1);
INSERT INTO public.star VALUES (2, 'Sirius', true, 242, 9, 'Brightest star in the sky', 1);
INSERT INTO public.star VALUES (3, 'Betelgeuse', false, 8000, 640, 'Red supergiant', 1);
INSERT INTO public.star VALUES (4, 'Rigel', true, 860, 860, 'Blue supergiant', 1);
INSERT INTO public.star VALUES (5, 'Vega', true, 455, 25, 'Bright star in Lyra', 1);
INSERT INTO public.star VALUES (6, 'Proxima Centauri', true, 4500, 4, 'Closest star to Earth', 2);


--
-- Name: connector_table_connector_table_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.connector_table_connector_table_id_seq', 11, true);


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

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: connector_table connector_table_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.connector_table
    ADD CONSTRAINT connector_table_name_key UNIQUE (name);


--
-- Name: connector_table connector_table_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.connector_table
    ADD CONSTRAINT connector_table_pkey PRIMARY KEY (connector_table_id);


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
-- Name: moon fk_moon_planet; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT fk_moon_planet FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet fk_planet_star; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT fk_planet_star FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star fk_star_galaxy; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT fk_star_galaxy FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

