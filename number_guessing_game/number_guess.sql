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
-- Name: games; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.games (
    game_id integer NOT NULL,
    user_id integer,
    guesses_count integer NOT NULL
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
    user_id integer NOT NULL,
    username character varying(22) NOT NULL
);


ALTER TABLE public.users OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_id_seq OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;


--
-- Name: games game_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games ALTER COLUMN game_id SET DEFAULT nextval('public.games_game_id_seq'::regclass);


--
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.games VALUES (1, 2, 916);
INSERT INTO public.games VALUES (2, 2, 425);
INSERT INTO public.games VALUES (3, 3, 243);
INSERT INTO public.games VALUES (4, 3, 133);
INSERT INTO public.games VALUES (5, 2, 806);
INSERT INTO public.games VALUES (6, 2, 558);
INSERT INTO public.games VALUES (7, 2, 940);
INSERT INTO public.games VALUES (8, 1, 26);
INSERT INTO public.games VALUES (9, 4, 1001);
INSERT INTO public.games VALUES (10, 4, 997);
INSERT INTO public.games VALUES (11, 5, 647);
INSERT INTO public.games VALUES (12, 5, 778);
INSERT INTO public.games VALUES (13, 4, 49);
INSERT INTO public.games VALUES (14, 4, 795);
INSERT INTO public.games VALUES (15, 4, 153);
INSERT INTO public.games VALUES (16, 6, 223);
INSERT INTO public.games VALUES (17, 6, 815);
INSERT INTO public.games VALUES (18, 7, 849);
INSERT INTO public.games VALUES (19, 7, 351);
INSERT INTO public.games VALUES (20, 6, 281);
INSERT INTO public.games VALUES (21, 6, 330);
INSERT INTO public.games VALUES (22, 6, 91);
INSERT INTO public.games VALUES (23, 8, 511);
INSERT INTO public.games VALUES (24, 8, 286);
INSERT INTO public.games VALUES (25, 9, 878);
INSERT INTO public.games VALUES (26, 9, 422);
INSERT INTO public.games VALUES (27, 8, 175);
INSERT INTO public.games VALUES (28, 8, 727);
INSERT INTO public.games VALUES (29, 8, 682);
INSERT INTO public.games VALUES (30, 10, 645);
INSERT INTO public.games VALUES (31, 10, 513);
INSERT INTO public.games VALUES (32, 11, 519);
INSERT INTO public.games VALUES (33, 11, 701);
INSERT INTO public.games VALUES (34, 10, 657);
INSERT INTO public.games VALUES (35, 10, 269);
INSERT INTO public.games VALUES (36, 10, 450);
INSERT INTO public.games VALUES (37, 12, 764);
INSERT INTO public.games VALUES (38, 12, 597);
INSERT INTO public.games VALUES (39, 13, 327);
INSERT INTO public.games VALUES (40, 13, 768);
INSERT INTO public.games VALUES (41, 12, 456);
INSERT INTO public.games VALUES (42, 12, 364);
INSERT INTO public.games VALUES (43, 12, 592);
INSERT INTO public.games VALUES (44, 14, 1);
INSERT INTO public.games VALUES (45, 14, 1);
INSERT INTO public.games VALUES (46, 15, 1);
INSERT INTO public.games VALUES (47, 15, 1);
INSERT INTO public.games VALUES (48, 14, 3);
INSERT INTO public.games VALUES (49, 14, 2);
INSERT INTO public.games VALUES (50, 14, 1);
INSERT INTO public.games VALUES (51, 16, 914);
INSERT INTO public.games VALUES (52, 16, 136);
INSERT INTO public.games VALUES (53, 17, 24);
INSERT INTO public.games VALUES (54, 17, 669);
INSERT INTO public.games VALUES (55, 16, 225);
INSERT INTO public.games VALUES (56, 16, 660);
INSERT INTO public.games VALUES (57, 16, 914);
INSERT INTO public.games VALUES (58, 18, 902);
INSERT INTO public.games VALUES (59, 18, 313);
INSERT INTO public.games VALUES (60, 19, 803);
INSERT INTO public.games VALUES (61, 19, 22);
INSERT INTO public.games VALUES (62, 18, 986);
INSERT INTO public.games VALUES (63, 18, 253);
INSERT INTO public.games VALUES (64, 18, 476);
INSERT INTO public.games VALUES (65, 20, 815);
INSERT INTO public.games VALUES (66, 20, 736);
INSERT INTO public.games VALUES (67, 21, 7);
INSERT INTO public.games VALUES (68, 21, 999);
INSERT INTO public.games VALUES (69, 20, 517);
INSERT INTO public.games VALUES (70, 20, 42);
INSERT INTO public.games VALUES (71, 20, 153);
INSERT INTO public.games VALUES (72, 22, 584);
INSERT INTO public.games VALUES (73, 22, 236);
INSERT INTO public.games VALUES (74, 23, 887);
INSERT INTO public.games VALUES (75, 23, 142);
INSERT INTO public.games VALUES (76, 22, 608);
INSERT INTO public.games VALUES (77, 22, 134);
INSERT INTO public.games VALUES (78, 22, 175);
INSERT INTO public.games VALUES (79, 24, 929);
INSERT INTO public.games VALUES (80, 24, 983);
INSERT INTO public.games VALUES (81, 25, 305);
INSERT INTO public.games VALUES (82, 25, 493);
INSERT INTO public.games VALUES (83, 24, 968);
INSERT INTO public.games VALUES (84, 24, 145);
INSERT INTO public.games VALUES (85, 24, 828);
INSERT INTO public.games VALUES (86, 26, 864);
INSERT INTO public.games VALUES (87, 26, 528);
INSERT INTO public.games VALUES (88, 27, 980);
INSERT INTO public.games VALUES (89, 27, 657);
INSERT INTO public.games VALUES (90, 26, 136);
INSERT INTO public.games VALUES (91, 26, 449);
INSERT INTO public.games VALUES (92, 26, 560);
INSERT INTO public.games VALUES (93, 28, 258);
INSERT INTO public.games VALUES (94, 28, 149);
INSERT INTO public.games VALUES (95, 29, 490);
INSERT INTO public.games VALUES (96, 29, 916);
INSERT INTO public.games VALUES (97, 28, 380);
INSERT INTO public.games VALUES (98, 28, 551);
INSERT INTO public.games VALUES (99, 28, 303);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES (1, 'john');
INSERT INTO public.users VALUES (2, 'user_1790941316990');
INSERT INTO public.users VALUES (3, 'user_1790941316989');
INSERT INTO public.users VALUES (4, 'user_1790941391063');
INSERT INTO public.users VALUES (5, 'user_1790941391062');
INSERT INTO public.users VALUES (6, 'user_1790941448446');
INSERT INTO public.users VALUES (7, 'user_1790941448445');
INSERT INTO public.users VALUES (8, 'user_1790941496928');
INSERT INTO public.users VALUES (9, 'user_1790941496927');
INSERT INTO public.users VALUES (10, 'user_1790941600125');
INSERT INTO public.users VALUES (11, 'user_1790941600124');
INSERT INTO public.users VALUES (12, 'user_1790941714749');
INSERT INTO public.users VALUES (13, 'user_1790941714748');
INSERT INTO public.users VALUES (14, 'user_1790942031458');
INSERT INTO public.users VALUES (15, 'user_1790942031457');
INSERT INTO public.users VALUES (16, 'user_1790942063601');
INSERT INTO public.users VALUES (17, 'user_1790942063600');
INSERT INTO public.users VALUES (18, 'user_1790942100597');
INSERT INTO public.users VALUES (19, 'user_1790942100596');
INSERT INTO public.users VALUES (20, 'user_1790942258965');
INSERT INTO public.users VALUES (21, 'user_1790942258964');
INSERT INTO public.users VALUES (22, 'user_1790942336185');
INSERT INTO public.users VALUES (23, 'user_1790942336184');
INSERT INTO public.users VALUES (24, 'user_1790942449970');
INSERT INTO public.users VALUES (25, 'user_1790942449969');
INSERT INTO public.users VALUES (26, 'user_1790942461478');
INSERT INTO public.users VALUES (27, 'user_1790942461477');
INSERT INTO public.users VALUES (28, 'user_1790942690853');
INSERT INTO public.users VALUES (29, 'user_1790942690852');


--
-- Name: games_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_game_id_seq', 99, true);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.users_user_id_seq', 29, true);


--
-- Name: games games_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_pkey PRIMARY KEY (game_id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- Name: users users_username_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key UNIQUE (username);


--
-- Name: games games_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id) ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

