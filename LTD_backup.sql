--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.3
-- Dumped by pg_dump version 9.6.3

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: companies; Type: TABLE; Schema: public; Owner: szaske
--

CREATE TABLE companies (
    id integer NOT NULL,
    name character varying
);


ALTER TABLE companies OWNER TO szaske;

--
-- Name: companies_id_seq; Type: SEQUENCE; Schema: public; Owner: szaske
--

CREATE SEQUENCE companies_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE companies_id_seq OWNER TO szaske;

--
-- Name: companies_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: szaske
--

ALTER SEQUENCE companies_id_seq OWNED BY companies.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: szaske
--

CREATE TABLE users (
    id uuid NOT NULL
);


ALTER TABLE users OWNER TO szaske;

--
-- Name: votes; Type: TABLE; Schema: public; Owner: szaske
--

CREATE TABLE votes (
    id integer NOT NULL,
    user_id uuid,
    winner_id integer,
    loser_id integer,
    date timestamp without time zone
);


ALTER TABLE votes OWNER TO szaske;

--
-- Name: votes_id_seq; Type: SEQUENCE; Schema: public; Owner: szaske
--

CREATE SEQUENCE votes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE votes_id_seq OWNER TO szaske;

--
-- Name: votes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: szaske
--

ALTER SEQUENCE votes_id_seq OWNED BY votes.id;


--
-- Name: companies id; Type: DEFAULT; Schema: public; Owner: szaske
--

ALTER TABLE ONLY companies ALTER COLUMN id SET DEFAULT nextval('companies_id_seq'::regclass);


--
-- Name: votes id; Type: DEFAULT; Schema: public; Owner: szaske
--

ALTER TABLE ONLY votes ALTER COLUMN id SET DEFAULT nextval('votes_id_seq'::regclass);


--
-- Data for Name: companies; Type: TABLE DATA; Schema: public; Owner: szaske
--

COPY companies (id, name) FROM stdin;
1	﻿Alaska Airlines
2	Amazoncom
3	American Seafoods 
4	AttachmateWRQ 
5	Avanade 
6	Avvo 
7	Babeland
8	Bartell Drugs
9	Bassetti Architects 
10	Beechers Handmade Cheese
11	Big Fish Games 
12	Brooks Sports 
13	Bungie Studios 
14	Caffe Vita Coffee Roasting Company 
15	Capital One Investing
16	Car Toys 
17	Classmatescom 
18	Clearwire 
19	Concur Technologies 
20	Corbis 
21	Costco 
22	Cray Inc 
23	Darigold 
24	Davis Wright Tremaine
25	DomainToolscom 
26	drugstorecom 
27	Eddie Bauer 
28	EMC Isilon 
29	Expedia Inc 
30	Expeditors International 
31	ExtraHop Networks 
32	F5 Networks 
33	Fantagraphics Books 
34	Filson 
35	Fred Hutchinson Cancer Research Center
36	Getty Images 
37	Group Health Cooperative 
38	Holland America Line 
39	INRIX 
40	Intellectual Ventures 
41	John L Scott 
42	Jones Soda 
43	K2 Sports 
44	Lane Powell
45	Leafly 
46	Microsoft 
47	MulvannyG2 Architecture 
48	Nintendo of America 
49	Nordstrom 
50	Oberto Sausage Company 
51	Onvia 
52	Outdoor Research 
53	Outerwall
54	PACCAR 
55	Pagliacci Pizza 
56	PCC Natural Markets 
57	PEMCO 
58	Penny Arcade 
59	Perkins Coie
60	PopCap 
61	Porch 
62	Premera Blue Cross 
63	Puget Sound Energy 
64	Puzzle Break
65	QFC 
66	REI 
67	RealNetworks 
68	Redfin 
69	Rhapsody 
70	Russell Investments
71	Safeco 
72	Savers
73	Seattles Best Coffee
74	Sellen Construction
75	Slalom Consulting 
76	Smartsheet 
77	Starbucks 
78	T-Mobile USA 
79	Tableau Software 
80	The Omni Group 
81	The Polyclinic
82	Theo Chocolate 
83	Tommy Bahama 
84	Trident Seafoods 
85	Trupanion 
86	Tullys Coffee 
87	Uwajimaya 
88	Valve Corporation 
89	Vulcan Inc 
90	Waggener Edstrom 
91	Washington Federal Savings
92	Weyerhaeuser 
93	Windermere Real Estate 
94	Windstar Cruises 
95	Wizards of the Coast 
96	Zillowcom 
97	Zumiez 
98	ZymoGenetics 
\.


--
-- Name: companies_id_seq; Type: SEQUENCE SET; Schema: public; Owner: szaske
--

SELECT pg_catalog.setval('companies_id_seq', 98, true);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: szaske
--

COPY users (id) FROM stdin;
16447141-6425-4102-95c2-06f9fe152977
76a324c4-e51d-4b22-aba0-67708e6b4fb9
b202f4a4-c846-4bd5-8b82-1d9e05ed3e93
255d0b94-1d34-432c-adb5-d51011d46a0d
fe1b11c8-470e-4273-8b1b-0214bce6f6e7
\.


--
-- Data for Name: votes; Type: TABLE DATA; Schema: public; Owner: szaske
--

COPY votes (id, user_id, winner_id, loser_id, date) FROM stdin;
1	\N	2	1	2017-07-12 20:07:32.186
2	067e6162-3b6f-4ae2-a171-2470b63dffaa	1	2	2016-11-16 06:43:19.77
3	16447141-6425-4102-95c2-06f9fe152977	2	1	2017-07-12 20:12:48.639
4	16447141-6425-4102-95c2-06f9fe152977	3	2	2017-07-12 20:13:30.974
5	76a324c4-e51d-4b22-aba0-67708e6b4fb9	6	4	2017-07-12 22:23:09.894
6	76a324c4-e51d-4b22-aba0-67708e6b4fb9	5	4	2017-07-12 22:23:58.211
7	76a324c4-e51d-4b22-aba0-67708e6b4fb9	3	10	2017-07-12 22:26:30.252
8	76a324c4-e51d-4b22-aba0-67708e6b4fb9	15	7	2017-07-12 22:29:34.421
9	76a324c4-e51d-4b22-aba0-67708e6b4fb9	15	8	2017-07-12 22:31:32.354
10	76a324c4-e51d-4b22-aba0-67708e6b4fb9	17	7	2017-07-12 22:31:44.983
11	76a324c4-e51d-4b22-aba0-67708e6b4fb9	21	10	2017-07-12 22:35:00.211
12	b202f4a4-c846-4bd5-8b82-1d9e05ed3e93	6	1	2017-07-12 22:35:47.789
13	b202f4a4-c846-4bd5-8b82-1d9e05ed3e93	15	8	2017-07-12 22:36:25.596
14	255d0b94-1d34-432c-adb5-d51011d46a0d	6	14	2017-07-12 22:37:52.306
15	255d0b94-1d34-432c-adb5-d51011d46a0d	14	16	2017-07-12 22:43:02.259
16	255d0b94-1d34-432c-adb5-d51011d46a0d	21	22	2017-07-12 22:47:07.993
17	255d0b94-1d34-432c-adb5-d51011d46a0d	12	5	2017-07-12 22:47:18.418
18	255d0b94-1d34-432c-adb5-d51011d46a0d	6	22	2017-07-12 22:47:27.771
19	fe1b11c8-470e-4273-8b1b-0214bce6f6e7	144	190	2017-07-13 00:25:21.655
20	fe1b11c8-470e-4273-8b1b-0214bce6f6e7	166	75	2017-07-13 00:25:25.27
21	fe1b11c8-470e-4273-8b1b-0214bce6f6e7	107	28	2017-07-13 00:25:29.189
\.


--
-- Name: votes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: szaske
--

SELECT pg_catalog.setval('votes_id_seq', 21, true);


--
-- Name: companies companies_pkey; Type: CONSTRAINT; Schema: public; Owner: szaske
--

ALTER TABLE ONLY companies
    ADD CONSTRAINT companies_pkey PRIMARY KEY (id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: szaske
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: votes votes_pkey; Type: CONSTRAINT; Schema: public; Owner: szaske
--

ALTER TABLE ONLY votes
    ADD CONSTRAINT votes_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

