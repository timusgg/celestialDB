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
-- Name: comet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.comet (
    comet_id integer NOT NULL,
    name character varying(20) NOT NULL,
    "orbital_period(in_years)" numeric(5,2) NOT NULL,
    last_observed_perihelion date,
    next_perihelion date,
    discovered_by character varying(40) NOT NULL
);


ALTER TABLE public.comet OWNER TO freecodecamp;

--
-- Name: comet_comet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.comet_comet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.comet_comet_id_seq OWNER TO freecodecamp;

--
-- Name: comet_comet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.comet_comet_id_seq OWNED BY public.comet.comet_id;


--
-- Name: constellation; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.constellation (
    constellation_id integer NOT NULL,
    name character varying(50) NOT NULL,
    description text,
    "area(in_square_degrees)" integer
);


ALTER TABLE public.constellation OWNER TO freecodecamp;

--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.constellation_constellation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.constellation_constellation_id_seq OWNER TO freecodecamp;

--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.constellation_constellation_id_seq OWNED BY public.constellation.constellation_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    constellation_id integer,
    name character varying(50),
    description text NOT NULL,
    "distance_from_earth(in Mpc)" numeric(5,4) NOT NULL,
    "diameter(in_light_years)" integer NOT NULL,
    type character varying(40) NOT NULL
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
    planet_id integer,
    name character varying(30) NOT NULL,
    "mean_radius(in_km)" numeric(8,3) NOT NULL,
    "sidereal_period(in_days)" numeric(5,2) NOT NULL,
    discovered_by character varying(30) NOT NULL
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
    star_id integer,
    name character varying(30) NOT NULL,
    type character varying(20) NOT NULL,
    "distance_from_host_star(in_AU)" numeric(10,4),
    "orbital_period(in_days)" numeric(9,3),
    number_of_moons smallint,
    has_rings boolean,
    is_exoplanet boolean
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
    galaxy_id integer,
    name character varying(30) NOT NULL,
    "distance(in_light_years)" integer NOT NULL,
    spectral_type character varying(10) NOT NULL,
    apparent_magnitude numeric(4,2) NOT NULL
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
-- Name: comet comet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet ALTER COLUMN comet_id SET DEFAULT nextval('public.comet_comet_id_seq'::regclass);


--
-- Name: constellation constellation_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation ALTER COLUMN constellation_id SET DEFAULT nextval('public.constellation_constellation_id_seq'::regclass);


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
-- Data for Name: comet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.comet VALUES (1, 'Halley', 74.70, '1986-02-09', '2061-07-28', 'Edmond Halley');
INSERT INTO public.comet VALUES (2, 'Tempel 1', 5.68, '2022-03-04', '2028-02-12', 'Wilhelm Tempel');
INSERT INTO public.comet VALUES (3, 'Encke', 3.30, '2023-10-22', '2027-02-09', 'Pierre Méchain');
INSERT INTO public.comet VALUES (4, 'Borrelly', 6.85, '2022-02-01', '2026-12-11', 'Alphonse Borrelly');
INSERT INTO public.comet VALUES (5, 'Swift-Tuttle', 133.28, '1992-12-12', '2126-07-12', 'Lewis Swift and Horace Tuttle');
INSERT INTO public.comet VALUES (6, 'Pons-Brooks', 71.20, '2024-06-02', '2095-08-31', 'Jean-Louis Pons & William Robert Brooks');


--
-- Data for Name: constellation; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.constellation VALUES (1, 'Sagittarius', 'Sagittarius is one of the constellations of the zodiac and is located in the Southern celestial hemisphere. The center of the Milky Way lies in the westernmost part of Sagittarius.', 867);
INSERT INTO public.constellation VALUES (2, 'Andromeda', ' Located in the northern celestial hemisphere, it is named for Andromeda, daughter of Cassiopeia, in the Greek myth, who was chained to a rock to be eaten by the sea monster Cetus.', 722);
INSERT INTO public.constellation VALUES (3, 'Ursa Major', 'Ursa Major also known as the Great Bear is a constellation in the northern sky, it is the third largest of the 88 modern constellations.', 1280);
INSERT INTO public.constellation VALUES (4, 'Sculptor', 'Sculptor is a faint constellation in the southern sky. It represents a sculptor.', 475);
INSERT INTO public.constellation VALUES (5, 'Centaurus', 'Centaurus is a bright constellation in the southern sky. Notable stars include Alpha Centauri, the nearest star system to the Solar System.', 1060);
INSERT INTO public.constellation VALUES (6, 'Triangulum', 'Triangulum is a small constellation in the northern sky. Its name is Latin for "triangle", derived from its three brightest stars, which form a long and narrow triangle.', 132);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 1, 'Milky Way', 'The galaxy containing the Sun and its Solar System, and therefore Earth.', 0.0000, 87400, 'Barred Spiral');
INSERT INTO public.galaxy VALUES (2, 2, 'Andromeda Galaxy', 'Andromeda is the closest big galaxy to the Milky Way and is expected to collide with the Milky Way around 4.5 billion years from now. The two will eventually merge into a single new galaxy called Milkdromeda.', 0.7780, 152000, 'Barred Spiral');
INSERT INTO public.galaxy VALUES (3, 3, 'Messier 81', 'Also known as the Bode_s Galaxy. Named for Johann Elert Bode who discovered this galaxy in 1774. The largest galaxy in the M81 Group. It harbors a supermassive black hole 70 million times the mass of the Sun.', 3.6000, 90000, 'Grand Design Spiral');
INSERT INTO public.galaxy VALUES (4, 4, 'Sculptor Galaxy', 'Named after its location in the Sculptor Constellation. Also called the Silver Dollar or Silver Coin Galaxy, because of its light and circular appearance.', 3.4900, 90000, 'Intermediate Spiral');
INSERT INTO public.galaxy VALUES (5, 5, 'Centaurus A', 'One of the closest radio galaxies to Earth, so its active galactic nucleus has been extensively studied by professional astronomers. The galaxy is also the fifth-brightest in the sky, making it an ideal amateur astronomy target. It is only visible from the southern hemisphere and low northern latitudes.', 4.2000, 60000, 'Elliptical');
INSERT INTO public.galaxy VALUES (6, 3, 'Pinwheel Galaxy', 'Similar in appearance to a pinwheel toy. Similar in appearance to a pinwheel (toy).', 6.4000, 169300, 'Spiral');
INSERT INTO public.galaxy VALUES (7, 6, 'Triangulum Galaxy', 'Named after its location within the Triangulum constellation.', 3.2000, 61120, 'Spiral');
INSERT INTO public.galaxy VALUES (8, 4, 'NGC300', 'It is one of the closest galaxies to the Local Group, and probably lies between the latter and the Sculptor Group.', 1.8600, 94000, 'Spiral');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 3, 'Moon', 1738.000, 27.32, '-');
INSERT INTO public.moon VALUES (2, 4, 'Phobos', 11.267, 0.31, 'Hall');
INSERT INTO public.moon VALUES (3, 4, 'Deimos', 6.200, 1.26, 'Hall');
INSERT INTO public.moon VALUES (4, 5, 'Io', 1821.600, 1.77, 'Galileo');
INSERT INTO public.moon VALUES (5, 6, 'Mimas', 198.200, 0.94, 'Herschel');
INSERT INTO public.moon VALUES (6, 7, 'Ariel', 578.900, 2.25, 'Lassell');
INSERT INTO public.moon VALUES (7, 8, 'Triton', 1353.400, 5.88, 'Lassell');
INSERT INTO public.moon VALUES (8, 10, 'Charon', 606.000, 6.39, 'Christy');
INSERT INTO public.moon VALUES (9, 11, 'Hi''iaka', 160.000, 49.12, 'Brown and others');
INSERT INTO public.moon VALUES (10, 10, 'Nix', 22.500, 24.85, 'Weaver and others');
INSERT INTO public.moon VALUES (11, 13, 'Dysnomia', 350.000, 15.79, 'Brown and others');
INSERT INTO public.moon VALUES (12, 5, 'Europa', 1506.800, 3.55, 'Galileo');
INSERT INTO public.moon VALUES (13, 6, 'Enceladus', 252.100, 1.37, 'Herschel');
INSERT INTO public.moon VALUES (14, 7, 'Umbriel', 548.700, 4.14, 'Lassell');
INSERT INTO public.moon VALUES (15, 8, 'Nereid', 170.000, 360.14, 'Kuiper');
INSERT INTO public.moon VALUES (16, 11, 'Namaka', 85.000, 18.28, 'Brown and others');
INSERT INTO public.moon VALUES (17, 5, 'Ganymede', 2634.100, 7.16, 'Galileo');
INSERT INTO public.moon VALUES (18, 6, 'Tethys', 533.100, 1.89, 'Cassini');
INSERT INTO public.moon VALUES (19, 7, 'Titania', 788.900, 8.71, 'Herschel');
INSERT INTO public.moon VALUES (20, 8, 'Naiad', 33.000, 0.29, 'Terrile via Voyager2');
INSERT INTO public.moon VALUES (21, 10, 'Hydra', 27.500, 38.20, 'Weaver and others');
INSERT INTO public.moon VALUES (22, 5, 'Callisto', 2410.300, 16.69, 'Galileo');
INSERT INTO public.moon VALUES (23, 6, 'Dione', 561.400, 2.74, 'Cassini');
INSERT INTO public.moon VALUES (24, 7, 'Oberon', 761.400, 13.46, 'Herschel');
INSERT INTO public.moon VALUES (25, 8, 'Thalassa', 41.000, 0.31, 'Terrile via Voyager2');
INSERT INTO public.moon VALUES (26, 10, 'Kerberos', 7.000, 32.17, 'Showlater via Hubble');
INSERT INTO public.moon VALUES (27, 5, 'Amalthea', 83.500, 0.50, 'Barnard');
INSERT INTO public.moon VALUES (28, 6, 'Rhea', 763.800, 4.52, 'Cassini');
INSERT INTO public.moon VALUES (29, 7, 'Miranda', 235.800, 1.41, 'Kuiper');
INSERT INTO public.moon VALUES (30, 8, 'Despina', 78.000, 0.34, 'Synnott via Voyager2');
INSERT INTO public.moon VALUES (31, 10, 'Styx', 2634.100, 7.16, 'Galileo');
INSERT INTO public.moon VALUES (32, 5, 'Himalia', 69.800, 250.56, 'Perrine');
INSERT INTO public.moon VALUES (33, 6, 'Titan', 2574.730, 15.95, 'Huygens');
INSERT INTO public.moon VALUES (34, 7, 'Cordelia', 20.100, 0.34, 'Terrile via Voyager2');
INSERT INTO public.moon VALUES (35, 8, 'Galatea', 88.000, 0.43, 'Synnott via Voyager2');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 1, 'Mercury', 'terrestrial', 0.3871, 87.969, 0, false, false);
INSERT INTO public.planet VALUES (2, 1, 'Venus', 'terrestrial', 0.7233, 224.701, 0, false, false);
INSERT INTO public.planet VALUES (3, 1, 'Earth', 'terrestrial', 1.0000, 365.256, 1, false, false);
INSERT INTO public.planet VALUES (4, 1, 'Mars', 'terrestrial', 1.5236, 686.971, 2, false, false);
INSERT INTO public.planet VALUES (5, 1, 'Jupiter', 'gas giant', 5.2033, 4332.590, 95, true, false);
INSERT INTO public.planet VALUES (6, 1, 'Saturn', 'gas giant', 9.5370, 10759.220, 146, true, false);
INSERT INTO public.planet VALUES (7, 1, 'Uranus', 'ice giant', 19.1912, 30668.500, 28, true, false);
INSERT INTO public.planet VALUES (8, 1, 'Neptune', 'ice giant', 30.0689, 60182.000, 16, true, false);
INSERT INTO public.planet VALUES (9, 1, 'Ceres', 'dwarf', 2.7660, 1678.635, 0, false, false);
INSERT INTO public.planet VALUES (10, 1, 'Pluto', 'dwarf', 39.4820, 90483.500, 5, false, false);
INSERT INTO public.planet VALUES (11, 1, 'Haumea', 'dwarf', 43.3350, 103587.000, 2, true, false);
INSERT INTO public.planet VALUES (12, 1, 'Makemake', 'dwarf', 45.7920, 111763.000, 1, false, false);
INSERT INTO public.planet VALUES (13, 1, 'Eris', 'dwarf', 67.6680, 204035.000, 1, false, false);
INSERT INTO public.planet VALUES (14, 7, 'Proxima Centurai b', 'terrestrial', 0.0490, 11.186, 0, false, true);
INSERT INTO public.planet VALUES (15, 7, 'Proxima Centurai c', 'disputed', 1.4900, 1928.000, 0, false, true);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 1, 'Sun', 0, 'G2V', -26.74);
INSERT INTO public.star VALUES (2, 2, 'AF Andromedae', 2500000, 'LBV', 17.32);
INSERT INTO public.star VALUES (3, 7, 'B324', 3200000, 'A8-F0la', 14.85);
INSERT INTO public.star VALUES (4, 7, 'Var83', 3000000, 'LBV', 15.40);
INSERT INTO public.star VALUES (5, 1, 'VY Canis Majoris', 3820, 'M3', 9.50);
INSERT INTO public.star VALUES (6, 3, 'SN 2023ixf', 21000000, 'Type II-L', 10.80);
INSERT INTO public.star VALUES (8, 5, 'Rigil Kentaurus', 4, 'G2V', 0.01);
INSERT INTO public.star VALUES (7, 5, 'Proxima Centauri', 4, 'M5.5Ve', 11.09);


--
-- Name: comet_comet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.comet_comet_id_seq', 6, true);


--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.constellation_constellation_id_seq', 6, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 8, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 35, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 15, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 8, true);


--
-- Name: comet comet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT comet_name_key UNIQUE (name);


--
-- Name: comet comet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT comet_pkey PRIMARY KEY (comet_id);


--
-- Name: constellation constellation_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_name_key UNIQUE (name);


--
-- Name: constellation constellation_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_pkey PRIMARY KEY (constellation_id);


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
-- Name: galaxy galaxy_constellation_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_constellation_id_fkey FOREIGN KEY (constellation_id) REFERENCES public.constellation(constellation_id);


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

