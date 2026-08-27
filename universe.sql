--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';
SET default_table_access_method = heap;

--
-- Name: asteroid; Type: TABLE
--

CREATE TABLE public.asteroid (
    asteroid_id integer NOT NULL,
    name character varying(100) NOT NULL,
    planet_id integer,
    diameter integer,
    mass numeric,
    description text
);

--
-- Name: galaxy; Type: TABLE
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(100) NOT NULL,
    age integer,
    is_active boolean,
    description text
);

--
-- Name: moon; Type: TABLE
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(100) NOT NULL,
    planet_id integer,
    diameter integer,
    is_habitable boolean
);

--
-- Name: planet; Type: TABLE
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(100) NOT NULL,
    star_id integer,
    mass numeric,
    description text
);

--
-- Name: spacecraft; Type: TABLE
--

CREATE TABLE public.spacecraft (
    spacecraft_id integer NOT NULL,
    name character varying(100) NOT NULL,
    planet_id integer,
    launch_year integer,
    is_active boolean,
    description text
);

--
-- Name: star; Type: TABLE
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(100) NOT NULL,
    galaxy_id integer,
    temperature integer,
    is_visible boolean
);

--
-- Sequences
--

CREATE SEQUENCE public.asteroid_asteroid_id_seq
    AS integer START WITH 1 INCREMENT BY 1 NO MINVALUE NO MAXVALUE CACHE 1;

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer START WITH 1 INCREMENT BY 1 NO MINVALUE NO MAXVALUE CACHE 1;

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer START WITH 1 INCREMENT BY 1 NO MINVALUE NO MAXVALUE CACHE 1;

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer START WITH 1 INCREMENT BY 1 NO MINVALUE NO MAXVALUE CACHE 1;

CREATE SEQUENCE public.spacecraft_spacecraft_id_seq
    AS integer START WITH 1 INCREMENT BY 1 NO MINVALUE NO MAXVALUE CACHE 1;

CREATE SEQUENCE public.star_star_id_seq
    AS integer START WITH 1 INCREMENT BY 1 NO MINVALUE NO MAXVALUE CACHE 1;

ALTER SEQUENCE public.asteroid_asteroid_id_seq OWNED BY public.asteroid.asteroid_id;
ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;
ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;
ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;
ALTER SEQUENCE public.spacecraft_spacecraft_id_seq OWNED BY public.spacecraft.spacecraft_id;
ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;

--
-- Default values
--

ALTER TABLE ONLY public.asteroid
    ALTER COLUMN asteroid_id SET DEFAULT nextval('public.asteroid_asteroid_id_seq'::regclass);

ALTER TABLE ONLY public.galaxy
    ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);

ALTER TABLE ONLY public.moon
    ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);

ALTER TABLE ONLY public.planet
    ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);

ALTER TABLE ONLY public.spacecraft
    ALTER COLUMN spacecraft_id SET DEFAULT nextval('public.spacecraft_spacecraft_id_seq'::regclass);

ALTER TABLE ONLY public.star
    ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);

--
-- Data: galaxy
--

INSERT INTO public.galaxy (galaxy_id, name, age, is_active, description) VALUES
(1, 'Milky Way', 13600, true, NULL),
(2, 'Andromeda', 10000, true, NULL),
(3, 'Triangulum', 8000, true, NULL),
(4, 'Whirlpool', 9000, true, NULL),
(5, 'Sombrero', 13000, true, NULL),
(6, 'Cartwheel', 12000, true, NULL);

--
-- Data: star
--

INSERT INTO public.star (star_id, name, galaxy_id, temperature, is_visible) VALUES
(1, 'Sun', 1, 5778, true),
(2, 'Sirius', 1, 9940, true),
(3, 'Betelgeuse', 1, 3500, true),
(4, 'Proxima Centauri', 1, 3042, true),
(5, 'Vega', 2, 9602, true),
(6, 'Polaris', 3, 6015, true);

--
-- Data: planet
--

INSERT INTO public.planet (planet_id, name, star_id, mass, description) VALUES
(1, 'Mercury', 1, 0.330, 'Small rocky planet closest to the Sun'),
(2, 'Venus', 1, 4.870, 'Hot rocky planet with a thick atmosphere'),
(3, 'Earth', 1, 5.970, 'The only known planet with life'),
(4, 'Mars', 1, 0.642, 'A cold rocky planet'),
(5, 'Jupiter', 1, 1898.000, 'The largest planet in the Solar System'),
(6, 'Saturn', 1, 568.000, 'A gas giant famous for its rings'),
(7, 'Uranus', 1, 86.800, 'An ice giant with a tilted rotation'),
(8, 'Neptune', 1, 102.000, 'A distant blue ice giant'),
(9, 'Proxima b', 4, 1.270, 'An exoplanet orbiting Proxima Centauri'),
(10, 'Vega b', 5, 2.100, 'A planet orbiting the star Vega'),
(11, 'Polaris b', 6, 3.500, 'A distant planet orbiting Polaris'),
(12, 'Andromeda X', 5, 7.200, 'A distant planetary body');

--
-- Data: moon
--

INSERT INTO public.moon (moon_id, name, planet_id, diameter, is_habitable) VALUES
(1, 'Moon', 3, 3475, false),
(2, 'Phobos', 4, 23, false),
(3, 'Deimos', 4, 13, false),
(4, 'Io', 5, 3643, false),
(5, 'Europa', 5, 3122, false),
(6, 'Ganymede', 5, 5268, false),
(7, 'Callisto', 5, 4821, false),
(8, 'Titan', 6, 5150, false),
(9, 'Rhea', 6, 1528, false),
(10, 'Iapetus', 6, 1470, false),
(11, 'Dione', 6, 1123, false),
(12, 'Tethys', 6, 1062, false),
(13, 'Enceladus', 6, 504, false),
(14, 'Mimas', 6, 396, false),
(15, 'Titania', 7, 1578, false),
(16, 'Oberon', 7, 1523, false),
(17, 'Ariel', 7, 1158, false),
(18, 'Umbriel', 7, 1169, false),
(19, 'Miranda', 7, 472, false),
(20, 'Triton', 8, 2707, false);

--
-- Data: asteroid
--

INSERT INTO public.asteroid (asteroid_id, name, planet_id, diameter, mass, description) VALUES
(4, 'Ceres', 5, 939, 9.39, 'Largest object in the asteroid belt'),
(5, 'Vesta', 5, 525, 2.59, 'One of the largest asteroids'),
(6, 'Pallas', 5, 512, 2.14, 'Large asteroid in the asteroid belt'),
(7, 'Hygiea', 5, 434, 0.87, 'Large asteroid in the asteroid belt'),
(8, 'Eros', 4, 17, 0.0067, 'Near-Earth asteroid');

--
-- Data: spacecraft
--

INSERT INTO public.spacecraft (spacecraft_id, name, planet_id, launch_year, is_active, description) VALUES
(1, 'Mariner 10', 1, 1973, false, 'First spacecraft to visit Mercury'),
(2, 'Venus Express', 2, 2005, false, 'European spacecraft that studied Venus'),
(3, 'Apollo 11', 3, 1969, false, 'First crewed mission to land humans on the Moon'),
(4, 'Mars Curiosity', 4, 2011, true, 'Mars rover studying the Martian surface'),
(5, 'Juno', 5, 2011, true, 'Spacecraft studying Jupiter and its atmosphere'),
(6, 'Cassini', 6, 1997, false, 'Spacecraft that studied Saturn and its moons');

--
-- Sequence values
--

SELECT pg_catalog.setval('public.asteroid_asteroid_id_seq', 8, true);
SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);
SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);
SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);
SELECT pg_catalog.setval('public.spacecraft_spacecraft_id_seq', 6, true);
SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);

--
-- Constraints
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_name_unique UNIQUE (name);

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_pkey PRIMARY KEY (asteroid_id);

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_unique UNIQUE (name);

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_unique UNIQUE (name);

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_unique UNIQUE (name);

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);

ALTER TABLE ONLY public.spacecraft
    ADD CONSTRAINT spacecraft_name_unique UNIQUE (name);

ALTER TABLE ONLY public.spacecraft
    ADD CONSTRAINT spacecraft_pkey PRIMARY KEY (spacecraft_id);

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_unique UNIQUE (name);

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);

--
-- Foreign keys
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_planet_id_fkey
    FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey
    FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey
    FOREIGN KEY (star_id) REFERENCES public.star(star_id);

ALTER TABLE ONLY public.spacecraft
    ADD CONSTRAINT spacecraft_destination_planet_id_fkey
    FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey
    FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);

--
-- PostgreSQL database dump complete
--
