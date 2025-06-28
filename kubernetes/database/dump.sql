--
-- PostgreSQL database dump
--

-- Dumped from database version 17.5
-- Dumped by pg_dump version 17.5

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
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
-- Name: active_sandboxes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.active_sandboxes (
    id integer NOT NULL,
    helm_name text NOT NULL,
    address text NOT NULL,
    user_id text NOT NULL,
    challenge_id integer NOT NULL,
    "timestamp" timestamp without time zone DEFAULT now()
);


ALTER TABLE public.active_sandboxes OWNER TO postgres;

--
-- Name: active_sandboxes_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.active_sandboxes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.active_sandboxes_id_seq OWNER TO postgres;

--
-- Name: active_sandboxes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.active_sandboxes_id_seq OWNED BY public.active_sandboxes.id;


--
-- Name: categories; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.categories (
    id integer NOT NULL,
    name text NOT NULL
);


ALTER TABLE public.categories OWNER TO postgres;

--
-- Name: categories_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.categories_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.categories_id_seq OWNER TO postgres;

--
-- Name: categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.categories_id_seq OWNED BY public.categories.id;


--
-- Name: challenges; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.challenges (
    id integer NOT NULL,
    name text NOT NULL,
    description text NOT NULL,
    flag text NOT NULL,
    points integer DEFAULT 500 NOT NULL,
    helm_values text NOT NULL,
    category_id integer NOT NULL
);


ALTER TABLE public.challenges OWNER TO postgres;

--
-- Name: challenges_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.challenges_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.challenges_id_seq OWNER TO postgres;

--
-- Name: challenges_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.challenges_id_seq OWNED BY public.challenges.id;


--
-- Name: sessions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sessions (
    id text NOT NULL,
    user_id text NOT NULL,
    expires_at timestamp with time zone NOT NULL
);


ALTER TABLE public.sessions OWNER TO postgres;

--
-- Name: solves; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.solves (
    id integer NOT NULL,
    user_id text NOT NULL,
    challenge_id integer NOT NULL,
    "timestamp" timestamp without time zone DEFAULT now()
);


ALTER TABLE public.solves OWNER TO postgres;

--
-- Name: solves_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.solves_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.solves_id_seq OWNER TO postgres;

--
-- Name: solves_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.solves_id_seq OWNED BY public.solves.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id text NOT NULL,
    name text NOT NULL,
    password_hash text NOT NULL,
    points integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.users OWNER TO postgres;

--
-- Name: active_sandboxes id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.active_sandboxes ALTER COLUMN id SET DEFAULT nextval('public.active_sandboxes_id_seq'::regclass);


--
-- Name: categories id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categories ALTER COLUMN id SET DEFAULT nextval('public.categories_id_seq'::regclass);


--
-- Name: challenges id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.challenges ALTER COLUMN id SET DEFAULT nextval('public.challenges_id_seq'::regclass);


--
-- Name: solves id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.solves ALTER COLUMN id SET DEFAULT nextval('public.solves_id_seq'::regclass);


--
-- Data for Name: active_sandboxes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.active_sandboxes (id, helm_name, address, user_id, challenge_id, "timestamp") FROM stdin;
\.


--
-- Data for Name: categories; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.categories (id, name) FROM stdin;
1	Web
2	Crypto
3	OSINT
\.


--
-- Data for Name: challenges; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.challenges (id, name, description, flag, points, helm_values, category_id) FROM stdin;
3	imageflux	Snap a picture, upload it, and send it to the world. This image-sharing platform\nmakes it easy for users to share their favorite moments. Take a closer look and\nsee if you can discover the flag.	fraunhofer2025{a_l1ttle_php_in_your_jpeg}	500	image: fraunhofer2025/imageflux\nport: 80\ndomain_suffix: challenge.zeroday.pw\nresources:\n  requests:\n    cpu: "50m"\n    memory: "32Mi"\n  limits:\n    cpu: "100m"\n    memory: "128Mi"\nsecurityContext:\n  runAsNonRoot: false\n  runAsUser: 33\n  allowPrivilegeEscalation: false\n  readOnlyRootFilesystem: false\n  capabilities:\n    drop: ["ALL"]\n  seccompProfile:\n    type: RuntimeDefault\n	1
1	payvault	Behind a paywall lies an article with a hidden flag. Can you bypass the lock and\nunlock the content? Find a way around the restrictions and see if you can\nuncover it.	fraunhofer2025{feeling_like_a_h4ckerman}	500	image: fraunhofer2025/payvault\nport: 80\ndomain_suffix: challenge.zeroday.pw\nresources:\n  requests:\n    cpu: "50m"\n    memory: "32Mi"\n  limits:\n    cpu: "100m"\n    memory: "128Mi"\nsecurityContext:\n  runAsNonRoot: false\n  runAsUser: 1000\n  allowPrivilegeEscalation: false\n  readOnlyRootFilesystem: true\n  capabilities:\n    drop: ["ALL"]\n  seccompProfile:\n    type: RuntimeDefault	1
2	Ticket to Hackville	After a deep dive into the network, you've discovered a hidden internal URL that\nleads to the ticket booking system. It’s a treasure trove of train schedules and\npassenger data, but lurking within is a prize: a flag, hidden within one of the\nbookings. The challenge now is to explore the system, find the ticket of Jonas Schmidt.\n\nUse the following flag format: fraunhofer2025{order_number-payment_reference}	fraunhofer2025{274839402384-8473729623}	500	image: fraunhofer2025/ticket_to_hackville\nport: 80\ndomain_suffix: challenge.zeroday.pw\nresources:\n  requests:\n    cpu: "50m"\n    memory: "32Mi"\n  limits:\n    cpu: "100m"\n    memory: "128Mi"\nsecurityContext:\n  runAsNonRoot: false\n  runAsUser: 1000\n  allowPrivilegeEscalation: false\n  readOnlyRootFilesystem: true\n  capabilities:\n    drop: ["ALL"]\n  seccompProfile:\n    type: RuntimeDefault\n	1
4	Key to My Heart	A mysterious love letter has found its way to your inbox, encrypted with a\nVigenère cipher. The sender? Unknown. The message? Personal, urgent, and hidden\nfrom the world. Only you, the master of decryption, can unlock the key to their\nheart and reveal what's been kept secret for far too long. Can you find the key\nand reveal the hidden message inside?	LIEBE	500	image: fraunhofer2025/key_to_my_heart\nport: 80\ndomain_suffix: challenge.zeroday.pw\nresources:\n  requests:\n    cpu: "50m"\n    memory: "32Mi"\n  limits:\n    cpu: "100m"\n    memory: "128Mi"\nsecurityContext:\n  runAsNonRoot: false\n  runAsUser: 1000\n  allowPrivilegeEscalation: false\n  readOnlyRootFilesystem: true\n  capabilities:\n    drop: ["ALL"]\n  seccompProfile:\n    type: RuntimeDefault\n	2
\.


--
-- Data for Name: sessions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.sessions (id, user_id, expires_at) FROM stdin;
\.


--
-- Data for Name: solves; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.solves (id, user_id, challenge_id, "timestamp") FROM stdin;
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, name, password_hash, points) FROM stdin;
\.


--
-- Name: active_sandboxes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.active_sandboxes_id_seq', 1, false);


--
-- Name: categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.categories_id_seq', 3, true);


--
-- Name: challenges_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.challenges_id_seq', 4, true);


--
-- Name: solves_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.solves_id_seq', 1, false);


--
-- Name: active_sandboxes active_sandboxes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.active_sandboxes
    ADD CONSTRAINT active_sandboxes_pkey PRIMARY KEY (id);


--
-- Name: categories categories_name_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_name_unique UNIQUE (name);


--
-- Name: categories categories_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (id);


--
-- Name: challenges challenges_name_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.challenges
    ADD CONSTRAINT challenges_name_unique UNIQUE (name);


--
-- Name: challenges challenges_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.challenges
    ADD CONSTRAINT challenges_pkey PRIMARY KEY (id);


--
-- Name: sessions sessions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT sessions_pkey PRIMARY KEY (id);


--
-- Name: solves solves_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.solves
    ADD CONSTRAINT solves_pkey PRIMARY KEY (id);


--
-- Name: users users_name_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_name_unique UNIQUE (name);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: sessions sessions_user_id_users_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT sessions_user_id_users_id_fk FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- PostgreSQL database dump complete
--

