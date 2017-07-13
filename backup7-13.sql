--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.3
-- Dumped by pg_dump version 9.5.3

SET statement_timeout = 0;
SET lock_timeout = 0;
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
-- Name: companies; Type: TABLE; Schema: public; Owner: Guest
--

CREATE TABLE companies (
    id integer NOT NULL,
    name character varying
);


ALTER TABLE companies OWNER TO "Guest";

--
-- Name: companies_id_seq; Type: SEQUENCE; Schema: public; Owner: Guest
--

CREATE SEQUENCE companies_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE companies_id_seq OWNER TO "Guest";

--
-- Name: companies_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Guest
--

ALTER SEQUENCE companies_id_seq OWNED BY companies.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: Guest
--

CREATE TABLE users (
    id uuid NOT NULL
);


ALTER TABLE users OWNER TO "Guest";

--
-- Name: votes; Type: TABLE; Schema: public; Owner: Guest
--

CREATE TABLE votes (
    id integer NOT NULL,
    user_id uuid,
    winner_id integer,
    loser_id integer,
    date timestamp without time zone
);


ALTER TABLE votes OWNER TO "Guest";

--
-- Name: votes_id_seq; Type: SEQUENCE; Schema: public; Owner: Guest
--

CREATE SEQUENCE votes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE votes_id_seq OWNER TO "Guest";

--
-- Name: votes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Guest
--

ALTER SEQUENCE votes_id_seq OWNED BY votes.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: Guest
--

ALTER TABLE ONLY companies ALTER COLUMN id SET DEFAULT nextval('companies_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: Guest
--

ALTER TABLE ONLY votes ALTER COLUMN id SET DEFAULT nextval('votes_id_seq'::regclass);


--
-- Data for Name: companies; Type: TABLE DATA; Schema: public; Owner: Guest
--

COPY companies (id, name) FROM stdin;
1	Alaska Airlines
2	Amazon
3	AttachmateWRQ 
4	Avanade 
5	Avvo 
6	Babeland
7	Bartell Drugs
8	Beechers Handmade Cheese
9	Brooks Sports 
10	Bungie Studios 
11	Car Toys 
12	Costco 
13	Cray Inc 
14	Darigold 
15	Eddie Bauer 
16	EMC
17	Expedia Inc 
18	ExtraHop Networks 
19	F5 Networks 
20	Fantagraphics Books 
21	Fred Hutchinson Cancer Research Center
22	Getty Images 
23	Group Health 
24	Holland America Line 
25	Intellectual Ventures 
26	Jones Soda 
27	Microsoft 
28	Nintendo of America 
29	Nordstrom 
30	Oberto Sausage Company 
31	Pagliacci Pizza 
32	PopCap 
33	Premera Blue Cross 
34	Puget Sound Energy 
35	QFC 
36	REI 
37	RealNetworks 
38	Redfin 
39	Rhapsody 
40	Safeco 
41	Seattles Best Coffee
42	Smartsheet 
43	Starbucks 
44	T-Mobile USA 
45	Tableau Software 
46	The Polyclinic
47	Theo Chocolate 
48	Tommy Bahama 
49	Tullys Coffee 
50	Uwajimaya 
51	Valve 
52	Vulcan Inc 
53	Waggener Edstrom 
54	Weyerhaeuser 
55	Wizards of the Coast 
56	Zillow
\.


--
-- Name: companies_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Guest
--

SELECT pg_catalog.setval('companies_id_seq', 56, true);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: Guest
--

COPY users (id) FROM stdin;
16447141-6425-4102-95c2-06f9fe152977
76a324c4-e51d-4b22-aba0-67708e6b4fb9
b202f4a4-c846-4bd5-8b82-1d9e05ed3e93
255d0b94-1d34-432c-adb5-d51011d46a0d
fe1b11c8-470e-4273-8b1b-0214bce6f6e7
b3816e7d-bdf7-4ae2-936d-ec15b91e8fee
b020db77-97c7-488b-b66d-e20c671e4c64
68d6f3ee-3ac9-49f8-add4-f7c986a76c4c
aa900840-67c3-47d4-aa3f-7ecbdf8b8c4e
7c86aa2f-ab5f-48c8-bf15-74badd1dbeef
3a6a3f8e-53a2-4e35-8f5c-546333df6741
46d29bf3-2510-4d83-9482-e91cd35fb320
04f13e00-7047-4b89-b6ed-20910967ce1e
1686fdde-c8ac-442e-b788-7e7a99e616d4
8f97bed3-e66e-489a-ab38-004e2340c584
\.


--
-- Data for Name: votes; Type: TABLE DATA; Schema: public; Owner: Guest
--

COPY votes (id, user_id, winner_id, loser_id, date) FROM stdin;
183	8f97bed3-e66e-489a-ab38-004e2340c584	5	44	2017-07-13 16:22:55.589
184	8f97bed3-e66e-489a-ab38-004e2340c584	43	46	2017-07-13 16:22:59.606
185	8f97bed3-e66e-489a-ab38-004e2340c584	2	52	2017-07-13 16:23:48.926
186	8f97bed3-e66e-489a-ab38-004e2340c584	32	49	2017-07-13 16:23:50.597
187	8f97bed3-e66e-489a-ab38-004e2340c584	35	37	2017-07-13 16:23:52.039
188	8f97bed3-e66e-489a-ab38-004e2340c584	6	9	2017-07-13 16:23:53.685
189	8f97bed3-e66e-489a-ab38-004e2340c584	43	34	2017-07-13 16:23:55.222
190	8f97bed3-e66e-489a-ab38-004e2340c584	46	16	2017-07-13 16:23:57.325
191	8f97bed3-e66e-489a-ab38-004e2340c584	45	5	2017-07-13 16:23:59.876
192	8f97bed3-e66e-489a-ab38-004e2340c584	16	39	2017-07-13 16:24:01.645
193	8f97bed3-e66e-489a-ab38-004e2340c584	2	50	2017-07-13 16:24:03.133
194	8f97bed3-e66e-489a-ab38-004e2340c584	2	40	2017-07-13 16:24:04.381
195	8f97bed3-e66e-489a-ab38-004e2340c584	28	29	2017-07-13 16:24:06.084
196	8f97bed3-e66e-489a-ab38-004e2340c584	47	43	2017-07-13 16:24:09.053
197	8f97bed3-e66e-489a-ab38-004e2340c584	30	2	2017-07-13 16:24:10.541
198	8f97bed3-e66e-489a-ab38-004e2340c584	30	38	2017-07-13 16:24:11.789
199	8f97bed3-e66e-489a-ab38-004e2340c584	1	52	2017-07-13 16:24:14.78
200	8f97bed3-e66e-489a-ab38-004e2340c584	12	7	2017-07-13 16:24:16.646
201	8f97bed3-e66e-489a-ab38-004e2340c584	36	13	2017-07-13 16:24:18.749
202	8f97bed3-e66e-489a-ab38-004e2340c584	30	33	2017-07-13 16:25:13.836
203	8f97bed3-e66e-489a-ab38-004e2340c584	5	2	2017-07-13 16:25:14.749
204	8f97bed3-e66e-489a-ab38-004e2340c584	12	18	2017-07-13 16:25:15.916
205	8f97bed3-e66e-489a-ab38-004e2340c584	50	33	2017-07-13 16:25:18.804
206	8f97bed3-e66e-489a-ab38-004e2340c584	47	39	2017-07-13 16:25:20.501
207	8f97bed3-e66e-489a-ab38-004e2340c584	10	39	2017-07-13 16:25:22.611
208	8f97bed3-e66e-489a-ab38-004e2340c584	43	52	2017-07-13 16:25:23.476
209	8f97bed3-e66e-489a-ab38-004e2340c584	43	53	2017-07-13 16:25:24.404
210	8f97bed3-e66e-489a-ab38-004e2340c584	35	53	2017-07-13 16:25:25.564
211	8f97bed3-e66e-489a-ab38-004e2340c584	36	38	2017-07-13 16:25:27.028
212	8f97bed3-e66e-489a-ab38-004e2340c584	43	4	2017-07-13 16:25:28.244
213	8f97bed3-e66e-489a-ab38-004e2340c584	1	34	2017-07-13 16:25:29.98
214	8f97bed3-e66e-489a-ab38-004e2340c584	23	48	2017-07-13 16:25:31.572
215	8f97bed3-e66e-489a-ab38-004e2340c584	37	51	2017-07-13 16:25:35.972
216	8f97bed3-e66e-489a-ab38-004e2340c584	7	46	2017-07-13 16:29:58.977
217	8f97bed3-e66e-489a-ab38-004e2340c584	47	35	2017-07-13 16:30:01.545
218	8f97bed3-e66e-489a-ab38-004e2340c584	14	56	2017-07-13 16:30:05.025
219	8f97bed3-e66e-489a-ab38-004e2340c584	55	48	2017-07-13 16:30:12.665
220	8f97bed3-e66e-489a-ab38-004e2340c584	22	19	2017-07-13 16:30:15.384
221	8f97bed3-e66e-489a-ab38-004e2340c584	27	46	2017-07-13 16:30:16.569
222	8f97bed3-e66e-489a-ab38-004e2340c584	46	50	2017-07-13 16:30:19.762
223	8f97bed3-e66e-489a-ab38-004e2340c584	26	3	2017-07-13 16:30:23.392
224	8f97bed3-e66e-489a-ab38-004e2340c584	29	3	2017-07-13 16:30:24.53
225	8f97bed3-e66e-489a-ab38-004e2340c584	21	54	2017-07-13 16:30:29.144
226	8f97bed3-e66e-489a-ab38-004e2340c584	23	42	2017-07-13 16:30:30.808
227	8f97bed3-e66e-489a-ab38-004e2340c584	28	30	2017-07-13 16:30:35.464
228	8f97bed3-e66e-489a-ab38-004e2340c584	46	22	2017-07-13 16:30:38.208
229	8f97bed3-e66e-489a-ab38-004e2340c584	15	22	2017-07-13 16:30:40.456
230	8f97bed3-e66e-489a-ab38-004e2340c584	43	55	2017-07-13 16:30:41.632
231	8f97bed3-e66e-489a-ab38-004e2340c584	14	50	2017-07-13 16:30:42.608
232	8f97bed3-e66e-489a-ab38-004e2340c584	37	20	2017-07-13 16:30:48.672
233	8f97bed3-e66e-489a-ab38-004e2340c584	7	55	2017-07-13 16:30:50.64
234	8f97bed3-e66e-489a-ab38-004e2340c584	22	50	2017-07-13 16:30:59.881
235	8f97bed3-e66e-489a-ab38-004e2340c584	22	15	2017-07-13 16:31:01.272
236	8f97bed3-e66e-489a-ab38-004e2340c584	17	18	2017-07-13 16:31:02.96
237	8f97bed3-e66e-489a-ab38-004e2340c584	31	22	2017-07-13 16:31:05.216
238	8f97bed3-e66e-489a-ab38-004e2340c584	41	38	2017-07-13 16:31:11.664
239	8f97bed3-e66e-489a-ab38-004e2340c584	23	48	2017-07-13 16:31:12.816
\.


--
-- Name: votes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Guest
--

SELECT pg_catalog.setval('votes_id_seq', 239, true);


--
-- Name: companies_pkey; Type: CONSTRAINT; Schema: public; Owner: Guest
--

ALTER TABLE ONLY companies
    ADD CONSTRAINT companies_pkey PRIMARY KEY (id);


--
-- Name: users_pkey; Type: CONSTRAINT; Schema: public; Owner: Guest
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: votes_pkey; Type: CONSTRAINT; Schema: public; Owner: Guest
--

ALTER TABLE ONLY votes
    ADD CONSTRAINT votes_pkey PRIMARY KEY (id);


--
-- Name: public; Type: ACL; Schema: -; Owner: epicodus
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM epicodus;
GRANT ALL ON SCHEMA public TO epicodus;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

