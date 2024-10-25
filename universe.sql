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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    description text NOT NULL,
    has_life integer,
    age_in_millions_of_years integer,
    galaxy_types character varying(20),
    distance_from_earth numeric,
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL
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
    description character varying(100) NOT NULL,
    has_life integer,
    is_spherical boolean,
    age_in_millions_of_years integer,
    parent_planet character varying(20),
    distance_from_earth integer,
    moon_id integer NOT NULL,
    name character varying(30) NOT NULL,
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
    description character varying(100) NOT NULL,
    has_life integer,
    is_spherical boolean,
    age_in_millions_of_years integer,
    planet_types character varying(20),
    distance_from_earth integer,
    planet_id integer NOT NULL,
    name character varying(30) NOT NULL,
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
    description character varying(100) NOT NULL,
    has_life integer,
    is_spherical boolean,
    age_in_millions_of_years integer,
    distance_from_earth integer,
    star_id integer NOT NULL,
    name character varying(30) NOT NULL,
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
-- Name: universe; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.universe (
    name character varying(20) NOT NULL,
    universe_id integer NOT NULL,
    is_real boolean
);


ALTER TABLE public.universe OWNER TO freecodecamp;

--
-- Name: universe_universe_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.universe_universe_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.universe_universe_id_seq OWNER TO freecodecamp;

--
-- Name: universe_universe_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.universe_universe_id_seq OWNED BY public.universe.universe_id;


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
-- Name: universe universe_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.universe ALTER COLUMN universe_id SET DEFAULT nextval('public.universe_universe_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES ('Our galaxy', 1, 13000, 'Spiral', 0, 1, 'Milky Way');
INSERT INTO public.galaxy VALUES ('Nearest spiral galaxy', 0, 10000, 'Spiral', 2537000, 2, 'Andromeda');
INSERT INTO public.galaxy VALUES ('Third largest member of Local Group', 0, 3000, 'Spiral', 3000000, 3, 'Triangulum');
INSERT INTO public.galaxy VALUES ('Interacting spiral galaxy', 0, 1000, 'Spiral', 23000000, 4, 'Whirlpool');
INSERT INTO public.galaxy VALUES ('Bright galaxy with a bright nucleus', 0, 1000, 'Spiral', 28000000, 5, 'Sombrero');
INSERT INTO public.galaxy VALUES ('Ring galaxy with a central bright region', 0, 100, 'Ring', 50000000, 6, 'Cartwheel');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES ('Earth''s only natural satellite', 1, true, 4600, NULL, 384400, 1, 'Moon', 1);
INSERT INTO public.moon VALUES ('Mars'' larger moon', 0, true, 4600, NULL, 6000, 2, 'Phobos', 4);
INSERT INTO public.moon VALUES ('Mars'' smaller moon', 0, true, 4600, NULL, 23000, 3, 'Deimos', 4);
INSERT INTO public.moon VALUES ('Volcanically active moon of Jupiter', 0, true, 4600, NULL, 421700, 4, 'Io', 5);
INSERT INTO public.moon VALUES ('Moon of Jupiter with icy surface', 0, true, 4600, NULL, 628300, 5, 'Europa', 5);
INSERT INTO public.moon VALUES ('Largest moon in the solar system', 0, true, 4600, NULL, 1070400, 6, 'Ganymede', 5);
INSERT INTO public.moon VALUES ('Second largest moon of Jupiter', 0, true, 4600, NULL, 1882700, 7, 'Callisto', 5);
INSERT INTO public.moon VALUES ('Largest moon of Saturn', 0, true, 4600, NULL, 1221700, 8, 'Titan', 6);
INSERT INTO public.moon VALUES ('Second largest moon of Saturn', 0, true, 4600, NULL, 527560, 9, 'Rhea', 6);
INSERT INTO public.moon VALUES ('Largest moon of Neptune', 0, true, 4600, NULL, 3548000, 10, 'Triton', 7);
INSERT INTO public.moon VALUES ('Largest moon of Pluto', 0, true, 4600, NULL, 19500, 11, 'Charon', 8);
INSERT INTO public.moon VALUES ('Moon of Saturn with geysers', 0, true, 4600, NULL, 2380000, 12, 'Enceladus', 6);
INSERT INTO public.moon VALUES ('Moon of Uranus', 0, true, 4600, NULL, 1298000, 13, 'Miranda', 7);
INSERT INTO public.moon VALUES ('Moon of Uranus', 0, true, 4600, NULL, 5822000, 14, 'Oberon', 7);
INSERT INTO public.moon VALUES ('Largest moon of Uranus', 0, true, 4600, NULL, 4363000, 15, 'Titania', 7);
INSERT INTO public.moon VALUES ('Dark moon of Uranus', 0, true, 4600, NULL, 2650000, 16, 'Umbriel', 7);
INSERT INTO public.moon VALUES ('Distinctly two-toned moon of Saturn', 0, true, 4600, NULL, 3569000, 17, 'Iapetus', 6);
INSERT INTO public.moon VALUES ('Moon of Saturn resembling the Death Star', 0, true, 4600, NULL, 1860000, 18, 'Mimas', 6);
INSERT INTO public.moon VALUES ('Moon of Mars', 0, true, 4600, NULL, 1200, 19, 'Psyche', 4);
INSERT INTO public.moon VALUES ('Moon of Neptune', 0, true, 4600, NULL, 5500000, 20, 'Nereid', 7);
INSERT INTO public.moon VALUES ('First moon discovered around an asteroid', 0, true, 4600, NULL, 30000, 21, 'Dactyl', 9);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES ('Closest planet to the Sun', 0, true, 4600, NULL, 58, 1, 'Mercury', 1);
INSERT INTO public.planet VALUES ('Second planet from the Sun', 0, true, 4600, NULL, 108, 2, 'Venus', 1);
INSERT INTO public.planet VALUES ('Our home planet', 1, true, 4600, NULL, 0, 3, 'Earth', 1);
INSERT INTO public.planet VALUES ('The Red Planet', 0, true, 4600, NULL, 228, 4, 'Mars', 1);
INSERT INTO public.planet VALUES ('Largest planet in our solar system', 0, true, 4600, NULL, 779, 5, 'Jupiter', 1);
INSERT INTO public.planet VALUES ('Known for its rings', 0, true, 4600, NULL, 1427, 6, 'Saturn', 1);
INSERT INTO public.planet VALUES ('Tilted planet with rings', 0, true, 4600, NULL, 2871, 7, 'Uranus', 1);
INSERT INTO public.planet VALUES ('Farthest planet from the Sun', 0, true, 4600, NULL, 4497, 8, 'Neptune', 1);
INSERT INTO public.planet VALUES ('Dwarf planet', 0, true, 4600, NULL, 5906, 9, 'Pluto', 1);
INSERT INTO public.planet VALUES ('Earth-sized exoplanet', 1, true, 1000, NULL, 500, 10, 'Kepler-186f', 1);
INSERT INTO public.planet VALUES ('First exoplanet discovered transiting a star', 0, true, 2000, NULL, 150, 11, 'HD 209458 b', 1);
INSERT INTO public.planet VALUES ('Water world exoplanet', 0, true, 3000, NULL, 100, 12, 'GJ 1214 b', 1);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES ('The star at the center of our solar system', 1, true, 4600, 0, 1, 'Sun', 1);
INSERT INTO public.star VALUES ('Brightest star in the night sky', 0, true, 200, 9, 2, 'Sirius', 1);
INSERT INTO public.star VALUES ('Closest star to the Sun', 0, true, 4000, 4, 3, 'Proxima Centauri', 1);
INSERT INTO public.star VALUES ('Red supergiant star', 0, true, 100, 643, 4, 'Betelgeuse', 1);
INSERT INTO public.star VALUES ('Eye of the Taurus constellation', 0, true, 600, 65, 5, 'Aldebaran', 1);
INSERT INTO public.star VALUES ('Bright blue supergiant star', 0, true, 800, 860, 6, 'Rigel', 1);


--
-- Data for Name: universe; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.universe VALUES ('Fantasia', 1, false);
INSERT INTO public.universe VALUES ('Cyberia', 2, false);
INSERT INTO public.universe VALUES ('Chronoverse', 3, false);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 21, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: universe_universe_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.universe_universe_id_seq', 3, true);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: galaxy unique_galaxy_id; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT unique_galaxy_id UNIQUE (galaxy_id);


--
-- Name: moon unique_moon_id; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT unique_moon_id UNIQUE (moon_id);


--
-- Name: planet unique_planet_id; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT unique_planet_id UNIQUE (planet_id);


--
-- Name: star unique_star_id; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT unique_star_id UNIQUE (star_id);


--
-- Name: universe universe_universe_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.universe
    ADD CONSTRAINT universe_universe_id_key UNIQUE (universe_id);


--
-- Name: universe universre_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.universe
    ADD CONSTRAINT universre_pkey PRIMARY KEY (universe_id);


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

