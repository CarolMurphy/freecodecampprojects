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

DROP DATABASE worldcup;
--
-- Name: worldcup; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE worldcup WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE worldcup OWNER TO freecodecamp;

\connect worldcup

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
    year integer NOT NULL,
    round character varying(15) NOT NULL,
    opponent_id integer NOT NULL,
    winner_id integer NOT NULL,
    winner_goals integer NOT NULL,
    opponent_goals integer NOT NULL
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
-- Name: teams; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.teams (
    team_id integer NOT NULL,
    name character varying(20) NOT NULL
);


ALTER TABLE public.teams OWNER TO freecodecamp;

--
-- Name: teams_team_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.teams_team_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.teams_team_id_seq OWNER TO freecodecamp;

--
-- Name: teams_team_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.teams_team_id_seq OWNED BY public.teams.team_id;


--
-- Name: games game_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games ALTER COLUMN game_id SET DEFAULT nextval('public.games_game_id_seq'::regclass);


--
-- Name: teams team_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.teams ALTER COLUMN team_id SET DEFAULT nextval('public.teams_team_id_seq'::regclass);


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.games VALUES (109, 2018, 'Final', 570, 569, 4, 2);
INSERT INTO public.games VALUES (110, 2018, 'Third Place', 572, 571, 2, 0);
INSERT INTO public.games VALUES (111, 2018, 'Semi-Final', 572, 570, 2, 1);
INSERT INTO public.games VALUES (112, 2018, 'Semi-Final', 571, 569, 1, 0);
INSERT INTO public.games VALUES (113, 2018, 'Quarter-Final', 573, 570, 3, 2);
INSERT INTO public.games VALUES (114, 2018, 'Quarter-Final', 574, 572, 2, 0);
INSERT INTO public.games VALUES (115, 2018, 'Quarter-Final', 575, 571, 2, 1);
INSERT INTO public.games VALUES (116, 2018, 'Quarter-Final', 576, 569, 2, 0);
INSERT INTO public.games VALUES (117, 2018, 'Eighth-Final', 577, 572, 2, 1);
INSERT INTO public.games VALUES (118, 2018, 'Eighth-Final', 578, 574, 1, 0);
INSERT INTO public.games VALUES (119, 2018, 'Eighth-Final', 579, 571, 3, 2);
INSERT INTO public.games VALUES (120, 2018, 'Eighth-Final', 580, 575, 2, 0);
INSERT INTO public.games VALUES (121, 2018, 'Eighth-Final', 581, 570, 2, 1);
INSERT INTO public.games VALUES (122, 2018, 'Eighth-Final', 582, 573, 2, 1);
INSERT INTO public.games VALUES (123, 2018, 'Eighth-Final', 583, 576, 2, 1);
INSERT INTO public.games VALUES (124, 2018, 'Eighth-Final', 584, 569, 4, 3);
INSERT INTO public.games VALUES (125, 2014, 'Final', 584, 585, 1, 0);
INSERT INTO public.games VALUES (126, 2014, 'Third Place', 575, 586, 3, 0);
INSERT INTO public.games VALUES (127, 2014, 'Semi-Final', 586, 584, 1, 0);
INSERT INTO public.games VALUES (128, 2014, 'Semi-Final', 575, 585, 7, 1);
INSERT INTO public.games VALUES (129, 2014, 'Quarter-Final', 587, 586, 1, 0);
INSERT INTO public.games VALUES (130, 2014, 'Quarter-Final', 571, 584, 1, 0);
INSERT INTO public.games VALUES (131, 2014, 'Quarter-Final', 577, 575, 2, 1);
INSERT INTO public.games VALUES (132, 2014, 'Quarter-Final', 569, 585, 1, 0);
INSERT INTO public.games VALUES (133, 2014, 'Eighth-Final', 588, 575, 2, 1);
INSERT INTO public.games VALUES (134, 2014, 'Eighth-Final', 576, 577, 2, 0);
INSERT INTO public.games VALUES (135, 2014, 'Eighth-Final', 589, 569, 2, 0);
INSERT INTO public.games VALUES (136, 2014, 'Eighth-Final', 590, 585, 2, 1);
INSERT INTO public.games VALUES (137, 2014, 'Eighth-Final', 580, 586, 2, 1);
INSERT INTO public.games VALUES (138, 2014, 'Eighth-Final', 591, 587, 2, 1);
INSERT INTO public.games VALUES (139, 2014, 'Eighth-Final', 578, 584, 1, 0);
INSERT INTO public.games VALUES (140, 2014, 'Eighth-Final', 592, 571, 2, 1);


--
-- Data for Name: teams; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.teams VALUES (569, 'France');
INSERT INTO public.teams VALUES (570, 'Croatia');
INSERT INTO public.teams VALUES (571, 'Belgium');
INSERT INTO public.teams VALUES (572, 'England');
INSERT INTO public.teams VALUES (573, 'Russia');
INSERT INTO public.teams VALUES (574, 'Sweden');
INSERT INTO public.teams VALUES (575, 'Brazil');
INSERT INTO public.teams VALUES (576, 'Uruguay');
INSERT INTO public.teams VALUES (577, 'Colombia');
INSERT INTO public.teams VALUES (578, 'Switzerland');
INSERT INTO public.teams VALUES (579, 'Japan');
INSERT INTO public.teams VALUES (580, 'Mexico');
INSERT INTO public.teams VALUES (581, 'Denmark');
INSERT INTO public.teams VALUES (582, 'Spain');
INSERT INTO public.teams VALUES (583, 'Portugal');
INSERT INTO public.teams VALUES (584, 'Argentina');
INSERT INTO public.teams VALUES (585, 'Germany');
INSERT INTO public.teams VALUES (586, 'Netherlands');
INSERT INTO public.teams VALUES (587, 'Costa Rica');
INSERT INTO public.teams VALUES (588, 'Chile');
INSERT INTO public.teams VALUES (589, 'Nigeria');
INSERT INTO public.teams VALUES (590, 'Algeria');
INSERT INTO public.teams VALUES (591, 'Greece');
INSERT INTO public.teams VALUES (592, 'United States');


--
-- Name: games_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_game_id_seq', 140, true);


--
-- Name: teams_team_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.teams_team_id_seq', 592, true);


--
-- Name: games games_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_pkey PRIMARY KEY (game_id);


--
-- Name: teams teams_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.teams
    ADD CONSTRAINT teams_name_key UNIQUE (name);


--
-- Name: teams teams_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.teams
    ADD CONSTRAINT teams_pkey PRIMARY KEY (team_id);


--
-- Name: games games_opponent_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_opponent_id_fkey FOREIGN KEY (opponent_id) REFERENCES public.teams(team_id);


--
-- Name: games games_winner_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_winner_id_fkey FOREIGN KEY (winner_id) REFERENCES public.teams(team_id);


--
-- PostgreSQL database dump complete
--