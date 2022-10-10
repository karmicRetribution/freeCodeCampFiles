--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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
-- Name: celestial_object; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.celestial_object (
    celestial_object_id integer NOT NULL,
    name character varying(50) NOT NULL,
    star_id integer
);


ALTER TABLE public.celestial_object OWNER TO freecodecamp;

--
-- Name: celestial_object_celstial_object_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.celestial_object_celstial_object_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.celestial_object_celstial_object_id_seq OWNER TO freecodecamp;

--
-- Name: celestial_object_celstial_object_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.celestial_object_celstial_object_id_seq OWNED BY public.celestial_object.celestial_object_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(50) NOT NULL,
    shape text,
    constellation text,
    distance_in_mly integer
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
    visited boolean,
    water_ice boolean,
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
    system_placement integer,
    inhabited boolean,
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
    name character varying(50) NOT NULL,
    solar_radii numeric,
    color text,
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
-- Name: celestial_object celestial_object_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.celestial_object ALTER COLUMN celestial_object_id SET DEFAULT nextval('public.celestial_object_celstial_object_id_seq'::regclass);


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
-- Data for Name: celestial_object; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.celestial_object VALUES (1, 'Pluto', 1);
INSERT INTO public.celestial_object VALUES (2, 'Charon', 1);
INSERT INTO public.celestial_object VALUES (3, 'Vesta', 1);
INSERT INTO public.celestial_object VALUES (4, 'Ceres', 1);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'spiral', 'Sagittarius', 0);
INSERT INTO public.galaxy VALUES (2, 'Large Magellanic Cloud', 'magellanic spiral', 'Dorado', 0);
INSERT INTO public.galaxy VALUES (3, 'Small Magellanic Cloud', 'irregular', 'Tucana', 0);
INSERT INTO public.galaxy VALUES (4, 'Andromeda', 'spiral', 'Andromeda', 3);
INSERT INTO public.galaxy VALUES (5, 'Triangulum', 'spiral', 'Triangulum', 3);
INSERT INTO public.galaxy VALUES (6, 'Centaurus A', 'lenticular', 'Centaurus', 14);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', true, true, 3);
INSERT INTO public.moon VALUES (2, 'Deimos', false, false, 4);
INSERT INTO public.moon VALUES (3, 'Phobos', false, false, 4);
INSERT INTO public.moon VALUES (4, 'Io', true, false, 5);
INSERT INTO public.moon VALUES (5, 'Europa', true, true, 5);
INSERT INTO public.moon VALUES (6, 'Ganymede', true, true, 5);
INSERT INTO public.moon VALUES (7, 'Callisto', true, true, 5);
INSERT INTO public.moon VALUES (8, 'Enceladus', true, true, 6);
INSERT INTO public.moon VALUES (9, 'Titan', true, true, 6);
INSERT INTO public.moon VALUES (10, 'Mimas', true, true, 6);
INSERT INTO public.moon VALUES (11, 'Tethys', true, true, 6);
INSERT INTO public.moon VALUES (12, 'Dione', true, true, 6);
INSERT INTO public.moon VALUES (13, 'Rhea', true, true, 6);
INSERT INTO public.moon VALUES (14, 'Iapetus', true, true, 6);
INSERT INTO public.moon VALUES (15, 'Ariel', true, true, 7);
INSERT INTO public.moon VALUES (16, 'Miranda', true, true, 7);
INSERT INTO public.moon VALUES (17, 'Oberon', true, true, 7);
INSERT INTO public.moon VALUES (18, 'Titania', true, true, 7);
INSERT INTO public.moon VALUES (19, 'Umbriel', true, true, 7);
INSERT INTO public.moon VALUES (20, 'Triton', true, false, 8);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 1, false, 1);
INSERT INTO public.planet VALUES (2, 'Venus', 2, false, 1);
INSERT INTO public.planet VALUES (3, 'Earth', 3, true, 1);
INSERT INTO public.planet VALUES (4, 'Mars', 4, false, 1);
INSERT INTO public.planet VALUES (5, 'Jupiter', 5, false, 1);
INSERT INTO public.planet VALUES (6, 'Saturn', 6, false, 1);
INSERT INTO public.planet VALUES (7, 'Uranus', 7, false, 1);
INSERT INTO public.planet VALUES (8, 'Neptune', 8, false, 1);
INSERT INTO public.planet VALUES (9, 'Proxima Centauri b', 2, false, 7);
INSERT INTO public.planet VALUES (10, 'Proxima Centauri d', 1, false, 7);
INSERT INTO public.planet VALUES (11, 'Tau Ceti g', 2, false, 8);
INSERT INTO public.planet VALUES (12, 'Tau Ceti h', 4, false, 8);
INSERT INTO public.planet VALUES (13, 'Tau Ceti e', 6, false, 8);
INSERT INTO public.planet VALUES (14, 'Tau Ceti f', 7, false, 8);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, 'yellow', 1);
INSERT INTO public.star VALUES (2, 'VY Canis Majoris', 1420, 'red', 1);
INSERT INTO public.star VALUES (3, 'Betelgeuse', 764, 'red', 1);
INSERT INTO public.star VALUES (4, 'Antares', 680, 'red', 1);
INSERT INTO public.star VALUES (5, 'Pistol Star', 306, 'blue', 1);
INSERT INTO public.star VALUES (6, 'WOH G64', 1540, 'red', 2);
INSERT INTO public.star VALUES (7, 'Proxima Centauri', 0.122, 'red', 1);
INSERT INTO public.star VALUES (8, 'Tau Ceti', 0.783, 'yellow', 1);


--
-- Name: celestial_object_celstial_object_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.celestial_object_celstial_object_id_seq', 4, true);


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

SELECT pg_catalog.setval('public.planet_planet_id_seq', 14, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 8, true);


--
-- Name: celestial_object celestial_object_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.celestial_object
    ADD CONSTRAINT celestial_object_name_key UNIQUE (name);


--
-- Name: celestial_object celestial_object_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.celestial_object
    ADD CONSTRAINT celestial_object_pkey PRIMARY KEY (celestial_object_id);


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
-- Name: celestial_object celestial_object_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.celestial_object
    ADD CONSTRAINT celestial_object_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


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

