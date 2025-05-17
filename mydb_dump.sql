--
-- PostgreSQL database dump
--

-- Dumped from database version 17.2
-- Dumped by pg_dump version 17.2

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
-- Name: arme; Type: TABLE; Schema: public; Owner: nabil
--

CREATE TABLE public.arme (
    id integer NOT NULL,
    nom character varying(255),
    arab_abbreviation character varying(200),
    frch_abbreviation character varying(200)
);


ALTER TABLE public.arme OWNER TO postgres;

--
-- Name: arme_id_seq; Type: SEQUENCE; Schema: public; Owner: nabil
--

CREATE SEQUENCE public.arme_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.arme_id_seq OWNER TO postgres;

--
-- Name: arme_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: nabil
--

ALTER SEQUENCE public.arme_id_seq OWNED BY public.arme.id;


--
-- Name: citoyen; Type: TABLE; Schema: public; Owner: nabil
--

CREATE TABLE public.citoyen (
    id integer NOT NULL,
    nom character varying(255) NOT NULL,
    prenom character varying(255) NOT NULL,
    address text NOT NULL,
    birthdate date NOT NULL,
    arme_id integer,
    grade_id integer,
    fonction_id integer,
    specialite_id integer,
    situation_familiale_id integer,
    is_validated boolean DEFAULT false
);


ALTER TABLE public.citoyen OWNER TO postgres;

--
-- Name: citoyen_id_seq; Type: SEQUENCE; Schema: public; Owner: nabil
--

CREATE SEQUENCE public.citoyen_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.citoyen_id_seq OWNER TO postgres;

--
-- Name: citoyen_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: nabil
--

ALTER SEQUENCE public.citoyen_id_seq OWNED BY public.citoyen.id;


--
-- Name: fonction; Type: TABLE; Schema: public; Owner: nabil
--

CREATE TABLE public.fonction (
    id integer NOT NULL,
    name character varying(255) NOT NULL
);


ALTER TABLE public.fonction OWNER TO postgres;

--
-- Name: fonction_id_seq; Type: SEQUENCE; Schema: public; Owner: nabil
--

CREATE SEQUENCE public.fonction_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.fonction_id_seq OWNER TO postgres;

--
-- Name: fonction_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: nabil
--

ALTER SEQUENCE public.fonction_id_seq OWNED BY public.fonction.id;


--
-- Name: grade; Type: TABLE; Schema: public; Owner: nabil
--

CREATE TABLE public.grade (
    id integer NOT NULL,
    ar_label character varying(255) NOT NULL,
    fr_label character varying(255) NOT NULL,
    name character varying(255) NOT NULL
);


ALTER TABLE public.grade OWNER TO postgres;

--
-- Name: grade_id_seq; Type: SEQUENCE; Schema: public; Owner: nabil
--

CREATE SEQUENCE public.grade_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.grade_id_seq OWNER TO postgres;

--
-- Name: grade_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: nabil
--

ALTER SEQUENCE public.grade_id_seq OWNED BY public.grade.id;


--
-- Name: situation_familiale; Type: TABLE; Schema: public; Owner: nabil
--

CREATE TABLE public.situation_familiale (
    id integer NOT NULL,
    is_married boolean DEFAULT false,
    number_of_kids integer DEFAULT 0,
    spouse_name character varying(255),
    marriage_date date
);


ALTER TABLE public.situation_familiale OWNER TO postgres;

--
-- Name: situation_familiale_id_seq; Type: SEQUENCE; Schema: public; Owner: nabil
--

CREATE SEQUENCE public.situation_familiale_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.situation_familiale_id_seq OWNER TO postgres;

--
-- Name: situation_familiale_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: nabil
--

ALTER SEQUENCE public.situation_familiale_id_seq OWNED BY public.situation_familiale.id;


--
-- Name: specialite; Type: TABLE; Schema: public; Owner: nabil
--

CREATE TABLE public.specialite (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    diploma character varying(255) NOT NULL
);


ALTER TABLE public.specialite OWNER TO postgres;

--
-- Name: specialite_id_seq; Type: SEQUENCE; Schema: public; Owner: nabil
--

CREATE SEQUENCE public.specialite_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.specialite_id_seq OWNER TO postgres;

--
-- Name: specialite_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: nabil
--

ALTER SEQUENCE public.specialite_id_seq OWNED BY public.specialite.id;


--
-- Name: arme id; Type: DEFAULT; Schema: public; Owner: nabil
--

ALTER TABLE ONLY public.arme ALTER COLUMN id SET DEFAULT nextval('public.arme_id_seq'::regclass);


--
-- Name: citoyen id; Type: DEFAULT; Schema: public; Owner: nabil
--

ALTER TABLE ONLY public.citoyen ALTER COLUMN id SET DEFAULT nextval('public.citoyen_id_seq'::regclass);


--
-- Name: fonction id; Type: DEFAULT; Schema: public; Owner: nabil
--

ALTER TABLE ONLY public.fonction ALTER COLUMN id SET DEFAULT nextval('public.fonction_id_seq'::regclass);


--
-- Name: grade id; Type: DEFAULT; Schema: public; Owner: nabil
--

ALTER TABLE ONLY public.grade ALTER COLUMN id SET DEFAULT nextval('public.grade_id_seq'::regclass);


--
-- Name: situation_familiale id; Type: DEFAULT; Schema: public; Owner: nabil
--

ALTER TABLE ONLY public.situation_familiale ALTER COLUMN id SET DEFAULT nextval('public.situation_familiale_id_seq'::regclass);


--
-- Name: specialite id; Type: DEFAULT; Schema: public; Owner: nabil
--

ALTER TABLE ONLY public.specialite ALTER COLUMN id SET DEFAULT nextval('public.specialite_id_seq'::regclass);


--
-- Data for Name: arme; Type: TABLE DATA; Schema: public; Owner: nabil
--

COPY public.arme (id, nom, arab_abbreviation, frch_abbreviation) FROM stdin;
1	Forces Terrestres	القوات البرية	CfT
2	Forces Aériennes	القوات الجوية	CFA
3	Forces Navales	القوات البحرية	CFN
4	Forces de Défense Aérienne du Territoire	قوات الدفاع الجوي عن الإقليم	CFDAT
5	Gendarmerie Nationale	الدرك الوطني	CGR
6	Garde Républicaine	الحرس الجمهوري	GR
7	Direction de la Numérisation et des Systèmes DInformation - DCNSI	مديرية الرقمنة وأنظمة المعلومات	DCNSI
\.


--
-- Data for Name: citoyen; Type: TABLE DATA; Schema: public; Owner: nabil
--

COPY public.citoyen (id, nom, prenom, address, birthdate, arme_id, grade_id, fonction_id, specialite_id, situation_familiale_id, is_validated) FROM stdin;
278	Tahar	Sofia	202 Rue Ben Aknoun, Alger	1991-08-23	1	6	9	6	2	f
279	Cherif	Omar	303 Rue El Harrach, Alger	1988-11-30	1	7	10	7	3	f
288	Zitouni	Nadir	567 Rue Kouba, Alger	1988-07-11	1	6	6	16	2	f
289	Medjahed	Amina	678 Rue Bab El Oued, Alger	1994-03-22	1	7	7	17	3	f
294	Salhi	Anis	303 Rue Tizi Ouzou, Alger	1992-10-14	1	6	12	2	3	f
295	Bensalah	Houcine	404 Rue Sidi M’hamed, Alger	1989-08-06	1	7	13	3	4	f
292	Touati	Fayçal	101 Rue Algiers, Alger	1995-01-01	1	\N	10	20	1	f
298	Bouzid	Aymen	707 Rue Algiers, Alger	1994-12-04	1	\N	16	6	2	f
290	Gherbi	Sami	789 Rue El Mouradia, Alger	1990-06-30	1	\N	8	18	4	f
296	Hadji	Chawki	505 Rue Bab El Oued, Alger	1993-07-22	1	\N	14	4	5	f
281	Amari	Khaled	507 Rue Bouzaréah, Alger	1982-10-03	1	\N	12	9	5	f
291	Mokhtari	Meriem	890 Rue El Madania, Alger	1987-09-12	1	\N	9	19	5	f
297	Fahmi	Ismail	606 Rue El Harrach, Alger	1990-05-19	1	\N	15	5	1	f
277	Mekki	Rachid	101 Rue Kouba, Alger	1987-05-11	1	\N	8	5	1	f
283	Bouzar	Abdelkader	710 Rue Les Fusillés, Alger	1986-12-06	1	\N	14	11	2	f
276	Zerrouki	Farida	789 Rue Bab El Oued, Alger	1992-07-10	1	14	7	4	5	f
282	Fellah	Samira	609 Rue El Alia, Alger	1994-01-17	1	14	13	10	1	f
286	Haddad	Karim	345 Rue Dar El Beïda, Alger	1991-05-05	1	15	4	14	5	f
280	Mansouri	Yacine	405 Rue El Madania, Alger	1995-02-15	1	16	11	8	4	f
299	Fergani	Karim	808 Rue El Madania, Alger	1988-04-30	1	14	17	7	3	f
293	Benamara	Rym	202 Rue Belouizdad, Alger	1986-11-25	1	16	11	21	2	f
275	Boudiaf	Amine	456 Rue Belouizdad, Alger	1985-03-21	1	16	6	3	4	f
285	Guellal	Rania	234 Rue El Harrach, Alger	1993-09-18	1	15	3	13	4	f
284	Brahimi	Khaled	123 Rue Bir Mourad Raïs, Alger	1990-04-23	1	15	2	12	3	f
287	Moussaoui	Lina	456 Rue Ben Aknoun, Alger	1992-12-17	1	15	5	15	1	f
274	Ben Ali	Ahmed	123 Rue El Mouradia, Alger	1990-02-15	1	14	5	2	3	f
\.


--
-- Data for Name: fonction; Type: TABLE DATA; Schema: public; Owner: nabil
--

COPY public.fonction (id, name) FROM stdin;
1	Technicien informatique
2	Technicien en télécommunications
3	Ingénieur aéronautique
4	Ingénieur mécanique
5	Technicien électrotechnique
6	Spécialiste en pyrotechnie
7	Ingénieur génie civil
8	Responsable financier
9	Avocat militaire
10	Responsable des ressources humaines
11	Responsable des marchés publics
12	Secrétaire administratif
13	Aide-soignant
14	Agent hospitalier
15	Ergothérapeute
16	Orthoptiste
17	Masseur-kinésithérapeute
18	Infirmier
19	Assistant de service social
20	Conseiller technique de service social
\.


--
-- Data for Name: grade; Type: TABLE DATA; Schema: public; Owner: nabil
--

COPY public.grade (id, ar_label, fr_label, name) FROM stdin;
6	n	Colonel	COL
7	n	Lieutenant-colonel	LCL
8	n	Commandant	Cdt
9	n	Capitaine	CNE
10	n	Lieutenant	LTN
11	n	Sous-lieutenant	SLT
12	n	Aspirant	ASP
14	n	Adjudant-chef	ADC
15	n	Adjudant	ADJ
16	n	Sergent-chef	SGC
17	n	Sergent	SGT
19	n	Caporal-chef	CCH
20	n	Caporal	CPL
21	n	Soldat	SDT
\.


--
-- Data for Name: situation_familiale; Type: TABLE DATA; Schema: public; Owner: nabil
--

COPY public.situation_familiale (id, is_married, number_of_kids, spouse_name, marriage_date) FROM stdin;
1	t	3	Sophie Benali	2015-06-20
2	t	2	Amira Boudiaf	2017-04-15
3	f	0	\N	\N
4	t	1	Nadia Zaki	2019-11-25
5	t	4	Lila Djelloul	2012-02-10
6	f	0	\N	\N
7	t	2	Karima Mahfoud	2021-08-18
8	t	0	Samira Ait Ali	2018-12-05
9	t	5	Meriem Lahlou	2010-03-30
10	f	0	\N	\N
11	t	3	Fatiha Mehenni	2016-01-09
12	t	0	Rania Tounsi	2020-06-15
13	f	0	\N	\N
14	t	1	Zina Mansouri	2014-07-22
15	t	2	Khadija Ouali	2013-05-03
\.


--
-- Data for Name: specialite; Type: TABLE DATA; Schema: public; Owner: nabil
--

COPY public.specialite (id, name, diploma) FROM stdin;
2	Informatique	Diplôme en Informatique
3	Télécommunications	Diplôme en Télécommunications
4	Aéronautique	Diplôme en Aéronautique
5	Mécanique et construction mécanique	Diplôme en Mécanique et Construction Mécanique
6	Electrotechnique	Diplôme en Electrotechnique
7	Pyrotechnie	Diplôme en Pyrotechnie
8	Génie civil	Diplôme en Génie Civil
9	Finances	Diplôme en Finances
10	Droit	Diplôme en Droit
11	Ressources humaines	Diplôme en Ressources Humaines
12	Marchés publics	Diplôme en Marchés Publics
13	Secrétariat	Diplôme en Secrétariat
14	Aide-soignant	Diplôme dAide-Soignant
15	Agent hospitalier	Diplôme dAgent Hospitalier
16	Ergothérapie	Diplôme en Ergothérapie
17	Orthopédie	Diplôme en Orthopédie
18	Kinésithérapie	Diplôme en Kinésithérapie
19	Infirmier	Diplôme Infirmier
20	Service social	Diplôme en Service Social
21	Conseil technique de service social	Diplôme en Conseil Technique de Service Social
\.


--
-- Name: arme_id_seq; Type: SEQUENCE SET; Schema: public; Owner: nabil
--

SELECT pg_catalog.setval('public.arme_id_seq', 7, true);


--
-- Name: citoyen_id_seq; Type: SEQUENCE SET; Schema: public; Owner: nabil
--

SELECT pg_catalog.setval('public.citoyen_id_seq', 299, true);


--
-- Name: fonction_id_seq; Type: SEQUENCE SET; Schema: public; Owner: nabil
--

SELECT pg_catalog.setval('public.fonction_id_seq', 20, true);


--
-- Name: grade_id_seq; Type: SEQUENCE SET; Schema: public; Owner: nabil
--

SELECT pg_catalog.setval('public.grade_id_seq', 21, true);


--
-- Name: situation_familiale_id_seq; Type: SEQUENCE SET; Schema: public; Owner: nabil
--

SELECT pg_catalog.setval('public.situation_familiale_id_seq', 15, true);


--
-- Name: specialite_id_seq; Type: SEQUENCE SET; Schema: public; Owner: nabil
--

SELECT pg_catalog.setval('public.specialite_id_seq', 21, true);


--
-- Name: arme arme_pkey; Type: CONSTRAINT; Schema: public; Owner: nabil
--

ALTER TABLE ONLY public.arme
    ADD CONSTRAINT arme_pkey PRIMARY KEY (id);


--
-- Name: citoyen citoyen_pkey; Type: CONSTRAINT; Schema: public; Owner: nabil
--

ALTER TABLE ONLY public.citoyen
    ADD CONSTRAINT citoyen_pkey PRIMARY KEY (id);


--
-- Name: fonction fonction_pkey; Type: CONSTRAINT; Schema: public; Owner: nabil
--

ALTER TABLE ONLY public.fonction
    ADD CONSTRAINT fonction_pkey PRIMARY KEY (id);


--
-- Name: grade grade_pkey; Type: CONSTRAINT; Schema: public; Owner: nabil
--

ALTER TABLE ONLY public.grade
    ADD CONSTRAINT grade_pkey PRIMARY KEY (id);


--
-- Name: situation_familiale situation_familiale_pkey; Type: CONSTRAINT; Schema: public; Owner: nabil
--

ALTER TABLE ONLY public.situation_familiale
    ADD CONSTRAINT situation_familiale_pkey PRIMARY KEY (id);


--
-- Name: specialite specialite_pkey; Type: CONSTRAINT; Schema: public; Owner: nabil
--

ALTER TABLE ONLY public.specialite
    ADD CONSTRAINT specialite_pkey PRIMARY KEY (id);


--
-- Name: citoyen citoyen_arme_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: nabil
--

ALTER TABLE ONLY public.citoyen
    ADD CONSTRAINT citoyen_arme_id_fkey FOREIGN KEY (arme_id) REFERENCES public.arme(id) ON DELETE SET NULL;


--
-- Name: citoyen citoyen_fonction_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: nabil
--

ALTER TABLE ONLY public.citoyen
    ADD CONSTRAINT citoyen_fonction_id_fkey FOREIGN KEY (fonction_id) REFERENCES public.fonction(id) ON DELETE SET NULL;


--
-- Name: citoyen citoyen_grade_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: nabil
--

ALTER TABLE ONLY public.citoyen
    ADD CONSTRAINT citoyen_grade_id_fkey FOREIGN KEY (grade_id) REFERENCES public.grade(id) ON DELETE SET NULL;


--
-- Name: citoyen citoyen_situation_familiale_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: nabil
--

ALTER TABLE ONLY public.citoyen
    ADD CONSTRAINT citoyen_situation_familiale_id_fkey FOREIGN KEY (situation_familiale_id) REFERENCES public.situation_familiale(id) ON DELETE SET NULL;


--
-- Name: citoyen citoyen_specialite_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: nabil
--

ALTER TABLE ONLY public.citoyen
    ADD CONSTRAINT citoyen_specialite_id_fkey FOREIGN KEY (specialite_id) REFERENCES public.specialite(id) ON DELETE SET NULL;


--
-- PostgreSQL database dump complete
--

