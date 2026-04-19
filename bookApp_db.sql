--
-- PostgreSQL database dump
--

\restrict e5Jq0lKsi09Og4WAo7dSZMu9lt8YvUyH6nYBwLPW3ulyWLWNhIGC8QCwyEKYRTK

-- Dumped from database version 18.3
-- Dumped by pg_dump version 18.3

-- Started on 2026-04-19 11:21:19

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

--
-- TOC entry 5149 (class 1262 OID 16388)
-- Name: bookApp_db; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE "bookApp_db" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'German_Germany.1252';


ALTER DATABASE "bookApp_db" OWNER TO postgres;

\unrestrict e5Jq0lKsi09Og4WAo7dSZMu9lt8YvUyH6nYBwLPW3ulyWLWNhIGC8QCwyEKYRTK
\connect "bookApp_db"
\restrict e5Jq0lKsi09Og4WAo7dSZMu9lt8YvUyH6nYBwLPW3ulyWLWNhIGC8QCwyEKYRTK

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

--
-- TOC entry 4 (class 2615 OID 2200)
-- Name: public; Type: SCHEMA; Schema: -; Owner: pg_database_owner
--

CREATE SCHEMA public;


ALTER SCHEMA public OWNER TO pg_database_owner;

--
-- TOC entry 5150 (class 0 OID 0)
-- Dependencies: 4
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: pg_database_owner
--

COMMENT ON SCHEMA public IS 'standard public schema';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 238 (class 1259 OID 16540)
-- Name: ausleihe; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ausleihe (
    ausleiheid integer NOT NULL,
    buchexemplarid integer NOT NULL,
    ausleiherid integer NOT NULL,
    startdatum date NOT NULL,
    enddatum date,
    spotid integer,
    vaultid integer,
    zeitslotid integer NOT NULL,
    status character varying(50) NOT NULL,
    CONSTRAINT ausleihe_check CHECK ((((spotid IS NOT NULL) AND (vaultid IS NULL)) OR ((spotid IS NULL) AND (vaultid IS NOT NULL))))
);


ALTER TABLE public.ausleihe OWNER TO postgres;

--
-- TOC entry 237 (class 1259 OID 16539)
-- Name: ausleihe_ausleiheid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.ausleihe_ausleiheid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.ausleihe_ausleiheid_seq OWNER TO postgres;

--
-- TOC entry 5151 (class 0 OID 0)
-- Dependencies: 237
-- Name: ausleihe_ausleiheid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.ausleihe_ausleiheid_seq OWNED BY public.ausleihe.ausleiheid;


--
-- TOC entry 224 (class 1259 OID 16429)
-- Name: autor; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.autor (
    autorid integer NOT NULL,
    name character varying(150) NOT NULL
);


ALTER TABLE public.autor OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 16428)
-- Name: autor_autorid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.autor_autorid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.autor_autorid_seq OWNER TO postgres;

--
-- TOC entry 5152 (class 0 OID 0)
-- Dependencies: 223
-- Name: autor_autorid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.autor_autorid_seq OWNED BY public.autor.autorid;


--
-- TOC entry 222 (class 1259 OID 16404)
-- Name: benutzer; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.benutzer (
    benutzerid integer NOT NULL,
    vorname character varying(50) NOT NULL,
    nachname character varying(50) NOT NULL,
    email character varying(150) NOT NULL,
    passworthash character varying(200) NOT NULL,
    registrierungsdatum date NOT NULL,
    status character varying(20) NOT NULL,
    rolle character varying(50) NOT NULL,
    standortid integer NOT NULL
);


ALTER TABLE public.benutzer OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 16403)
-- Name: benutzer_benutzerid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.benutzer_benutzerid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.benutzer_benutzerid_seq OWNER TO postgres;

--
-- TOC entry 5153 (class 0 OID 0)
-- Dependencies: 221
-- Name: benutzer_benutzerid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.benutzer_benutzerid_seq OWNED BY public.benutzer.benutzerid;


--
-- TOC entry 240 (class 1259 OID 16579)
-- Name: bewertung; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.bewertung (
    bewertungid integer NOT NULL,
    ausleiheid integer NOT NULL,
    buchexemplarid integer NOT NULL,
    bewerterid integer NOT NULL,
    bewerteterid integer NOT NULL,
    sterne integer NOT NULL,
    kommentar character varying(500),
    bewertungsdatum date NOT NULL,
    CONSTRAINT bewertung_sterne_check CHECK (((sterne >= 1) AND (sterne <= 5)))
);


ALTER TABLE public.bewertung OWNER TO postgres;

--
-- TOC entry 239 (class 1259 OID 16578)
-- Name: bewertung_bewertungid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.bewertung_bewertungid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.bewertung_bewertungid_seq OWNER TO postgres;

--
-- TOC entry 5154 (class 0 OID 0)
-- Dependencies: 239
-- Name: bewertung_bewertungid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.bewertung_bewertungid_seq OWNED BY public.bewertung.bewertungid;


--
-- TOC entry 228 (class 1259 OID 16449)
-- Name: buch; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.buch (
    buchid integer NOT NULL,
    titel character varying(200) NOT NULL,
    erscheinungsjahr integer NOT NULL,
    autorid integer NOT NULL,
    genreid integer NOT NULL
);


ALTER TABLE public.buch OWNER TO postgres;

--
-- TOC entry 227 (class 1259 OID 16448)
-- Name: buch_buchid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.buch_buchid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.buch_buchid_seq OWNER TO postgres;

--
-- TOC entry 5155 (class 0 OID 0)
-- Dependencies: 227
-- Name: buch_buchid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.buch_buchid_seq OWNED BY public.buch.buchid;


--
-- TOC entry 236 (class 1259 OID 16513)
-- Name: buchexemplar; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.buchexemplar (
    buchexemplarid integer NOT NULL,
    buchid integer NOT NULL,
    besitzerid integer NOT NULL,
    zustand character varying(50) NOT NULL,
    verfuegbarkeit character varying(50) NOT NULL,
    vaultid integer
);


ALTER TABLE public.buchexemplar OWNER TO postgres;

--
-- TOC entry 235 (class 1259 OID 16512)
-- Name: buchexemplar_buchexemplarid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.buchexemplar_buchexemplarid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.buchexemplar_buchexemplarid_seq OWNER TO postgres;

--
-- TOC entry 5156 (class 0 OID 0)
-- Dependencies: 235
-- Name: buchexemplar_buchexemplarid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.buchexemplar_buchexemplarid_seq OWNED BY public.buchexemplar.buchexemplarid;


--
-- TOC entry 226 (class 1259 OID 16438)
-- Name: genre; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.genre (
    genreid integer NOT NULL,
    name character varying(100) NOT NULL,
    beschreibung character varying(200)
);


ALTER TABLE public.genre OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 16437)
-- Name: genre_genreid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.genre_genreid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.genre_genreid_seq OWNER TO postgres;

--
-- TOC entry 5157 (class 0 OID 0)
-- Dependencies: 225
-- Name: genre_genreid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.genre_genreid_seq OWNED BY public.genre.genreid;


--
-- TOC entry 242 (class 1259 OID 16616)
-- Name: meldung; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.meldung (
    meldungid integer NOT NULL,
    melderid integer NOT NULL,
    betroffenesexemplarid integer NOT NULL,
    betroffenerbenutzerid integer NOT NULL,
    meldedatum date NOT NULL,
    typ character varying(100) NOT NULL,
    beschreibung character varying(500)
);


ALTER TABLE public.meldung OWNER TO postgres;

--
-- TOC entry 241 (class 1259 OID 16615)
-- Name: meldung_meldungid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.meldung_meldungid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.meldung_meldungid_seq OWNER TO postgres;

--
-- TOC entry 5158 (class 0 OID 0)
-- Dependencies: 241
-- Name: meldung_meldungid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.meldung_meldungid_seq OWNED BY public.meldung.meldungid;


--
-- TOC entry 230 (class 1259 OID 16471)
-- Name: spot; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.spot (
    spotid integer NOT NULL,
    standortid integer NOT NULL,
    spotname character varying(100) NOT NULL,
    beschreibung character varying(200),
    "Öffnungszeiten" character varying(100)
);


ALTER TABLE public.spot OWNER TO postgres;

--
-- TOC entry 229 (class 1259 OID 16470)
-- Name: spot_spotid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.spot_spotid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.spot_spotid_seq OWNER TO postgres;

--
-- TOC entry 5159 (class 0 OID 0)
-- Dependencies: 229
-- Name: spot_spotid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.spot_spotid_seq OWNED BY public.spot.spotid;


--
-- TOC entry 220 (class 1259 OID 16390)
-- Name: standort; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.standort (
    standortid integer NOT NULL,
    name character varying(100) NOT NULL,
    adresse character varying(200) NOT NULL,
    stadt character varying(100) NOT NULL,
    plz character varying(10) NOT NULL,
    beschreibung character varying(200),
    longitude numeric(9,6),
    latitude numeric(9,6)
);


ALTER TABLE public.standort OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 16389)
-- Name: standort_standortid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.standort_standortid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.standort_standortid_seq OWNER TO postgres;

--
-- TOC entry 5160 (class 0 OID 0)
-- Dependencies: 219
-- Name: standort_standortid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.standort_standortid_seq OWNED BY public.standort.standortid;


--
-- TOC entry 232 (class 1259 OID 16486)
-- Name: vault; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.vault (
    vaultid integer NOT NULL,
    standortid integer NOT NULL,
    name character varying(50) NOT NULL,
    sicherheitsstufe character varying(50) NOT NULL,
    status character varying(50) NOT NULL
);


ALTER TABLE public.vault OWNER TO postgres;

--
-- TOC entry 231 (class 1259 OID 16485)
-- Name: vault_vaultid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.vault_vaultid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.vault_vaultid_seq OWNER TO postgres;

--
-- TOC entry 5161 (class 0 OID 0)
-- Dependencies: 231
-- Name: vault_vaultid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.vault_vaultid_seq OWNED BY public.vault.vaultid;


--
-- TOC entry 234 (class 1259 OID 16503)
-- Name: zeitslot; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.zeitslot (
    zeitslotid integer NOT NULL,
    startzeit time without time zone NOT NULL,
    endzeit time without time zone NOT NULL
);


ALTER TABLE public.zeitslot OWNER TO postgres;

--
-- TOC entry 233 (class 1259 OID 16502)
-- Name: zeitslot_zeitslotid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.zeitslot_zeitslotid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.zeitslot_zeitslotid_seq OWNER TO postgres;

--
-- TOC entry 5162 (class 0 OID 0)
-- Dependencies: 233
-- Name: zeitslot_zeitslotid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.zeitslot_zeitslotid_seq OWNED BY public.zeitslot.zeitslotid;


--
-- TOC entry 4920 (class 2604 OID 16543)
-- Name: ausleihe ausleiheid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ausleihe ALTER COLUMN ausleiheid SET DEFAULT nextval('public.ausleihe_ausleiheid_seq'::regclass);


--
-- TOC entry 4913 (class 2604 OID 16432)
-- Name: autor autorid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.autor ALTER COLUMN autorid SET DEFAULT nextval('public.autor_autorid_seq'::regclass);


--
-- TOC entry 4912 (class 2604 OID 16407)
-- Name: benutzer benutzerid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.benutzer ALTER COLUMN benutzerid SET DEFAULT nextval('public.benutzer_benutzerid_seq'::regclass);


--
-- TOC entry 4921 (class 2604 OID 16582)
-- Name: bewertung bewertungid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bewertung ALTER COLUMN bewertungid SET DEFAULT nextval('public.bewertung_bewertungid_seq'::regclass);


--
-- TOC entry 4915 (class 2604 OID 16452)
-- Name: buch buchid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.buch ALTER COLUMN buchid SET DEFAULT nextval('public.buch_buchid_seq'::regclass);


--
-- TOC entry 4919 (class 2604 OID 16516)
-- Name: buchexemplar buchexemplarid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.buchexemplar ALTER COLUMN buchexemplarid SET DEFAULT nextval('public.buchexemplar_buchexemplarid_seq'::regclass);


--
-- TOC entry 4914 (class 2604 OID 16441)
-- Name: genre genreid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.genre ALTER COLUMN genreid SET DEFAULT nextval('public.genre_genreid_seq'::regclass);


--
-- TOC entry 4922 (class 2604 OID 16619)
-- Name: meldung meldungid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.meldung ALTER COLUMN meldungid SET DEFAULT nextval('public.meldung_meldungid_seq'::regclass);


--
-- TOC entry 4916 (class 2604 OID 16474)
-- Name: spot spotid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spot ALTER COLUMN spotid SET DEFAULT nextval('public.spot_spotid_seq'::regclass);


--
-- TOC entry 4911 (class 2604 OID 16393)
-- Name: standort standortid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.standort ALTER COLUMN standortid SET DEFAULT nextval('public.standort_standortid_seq'::regclass);


--
-- TOC entry 4917 (class 2604 OID 16489)
-- Name: vault vaultid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vault ALTER COLUMN vaultid SET DEFAULT nextval('public.vault_vaultid_seq'::regclass);


--
-- TOC entry 4918 (class 2604 OID 16506)
-- Name: zeitslot zeitslotid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.zeitslot ALTER COLUMN zeitslotid SET DEFAULT nextval('public.zeitslot_zeitslotid_seq'::regclass);


--
-- TOC entry 5139 (class 0 OID 16540)
-- Dependencies: 238
-- Data for Name: ausleihe; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.ausleihe (ausleiheid, buchexemplarid, ausleiherid, startdatum, enddatum, spotid, vaultid, zeitslotid, status) VALUES
	(1, 1, 2, '2024-03-01', '2024-03-10', 1, NULL, 1, 'abgeschlossen'),
	(2, 2, 3, '2024-03-05', NULL, NULL, 2, 2, 'aktiv'),
	(3, 3, 4, '2024-03-07', '2024-03-15', 3, NULL, 3, 'abgeschlossen'),
	(4, 4, 5, '2024-03-10', NULL, NULL, 4, 4, 'aktiv'),
	(5, 5, 6, '2024-03-12', '2024-03-20', 5, NULL, 5, 'abgeschlossen'),
	(6, 6, 7, '2024-03-14', NULL, NULL, 6, 6, 'aktiv'),
	(7, 7, 8, '2024-03-15', '2024-03-22', 7, NULL, 7, 'abgeschlossen'),
	(8, 8, 9, '2024-03-16', NULL, NULL, 8, 8, 'aktiv'),
	(9, 9, 10, '2024-03-17', '2024-03-25', 9, NULL, 9, 'abgeschlossen'),
	(10, 10, 1, '2024-03-18', NULL, NULL, 10, 10, 'aktiv'),
	(11, 11, 3, '2024-03-19', '2024-03-26', 1, NULL, 11, 'abgeschlossen'),
	(12, 12, 4, '2024-03-20', NULL, NULL, 2, 12, 'aktiv'),
	(13, 13, 5, '2024-03-21', '2024-03-28', 3, NULL, 13, 'abgeschlossen'),
	(14, 14, 6, '2024-03-22', NULL, NULL, 4, 14, 'aktiv'),
	(15, 15, 7, '2024-03-23', '2024-03-30', 5, NULL, 15, 'abgeschlossen');


--
-- TOC entry 5125 (class 0 OID 16429)
-- Dependencies: 224
-- Data for Name: autor; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.autor (autorid, name) VALUES
	(1, 'J. K. Rowling'),
	(2, 'George Orwell'),
	(3, 'J. R. R. Tolkien'),
	(4, 'Stephen King'),
	(5, 'Agatha Christie'),
	(6, 'Dan Brown'),
	(7, 'Suzanne Collins'),
	(8, 'Brandon Sanderson'),
	(9, 'Haruki Murakami'),
	(10, 'Isaac Asimov');


--
-- TOC entry 5123 (class 0 OID 16404)
-- Dependencies: 222
-- Data for Name: benutzer; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.benutzer (benutzerid, vorname, nachname, email, passworthash, registrierungsdatum, status, rolle, standortid) VALUES
	(1, 'Anton', 'Muster', 'anton@beispielmail.de', 'BeispielKennwort', '2024-01-10', 'aktiv', 'Benutzer', 1),
	(2, 'Berta', 'Muster', 'berta@beispielmail.de', 'BeispielKennwort', '2024-01-12', 'aktiv', 'Benutzer', 2),
	(3, 'Charlie', 'Muster', 'charlie@beispielmail.de', 'BeispielKennwort', '2024-01-15', 'aktiv', 'Benutzer', 3),
	(4, 'Dora', 'Muster', 'dora@beispielmail.de', 'BeispielKennwort', '2024-01-20', 'aktiv', 'Benutzer', 4),
	(5, 'Emil', 'Muster', 'emil@beispielmail.de', 'BeispielKennwort', '2024-01-25', 'aktiv', 'Benutzer', 5),
	(6, 'Frieda', 'Muster', 'frieda@beispielmail.de', 'BeispielKennwort', '2024-02-01', 'aktiv', 'Benutzer', 6),
	(7, 'Gustav', 'Muster', 'gustav@beispielmail.de', 'BeispielKennwort', '2024-02-05', 'aktiv', 'Benutzer', 7),
	(8, 'Hanna', 'Muster', 'hanna@beispielmail.de', 'BeispielKennwort', '2024-02-10', 'aktiv', 'Benutzer', 8),
	(9, 'Ida', 'Muster', 'ida@beispielmail.de', 'BeispielKennwort', '2024-02-15', 'aktiv', 'Benutzer', 9),
	(10, 'Julius', 'Muster', 'julius@beispielmail.de', 'BeispielKennwort', '2024-02-20', 'aktiv', 'Administrator', 10);


--
-- TOC entry 5141 (class 0 OID 16579)
-- Dependencies: 240
-- Data for Name: bewertung; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.bewertung (bewertungid, ausleiheid, buchexemplarid, bewerterid, bewerteterid, sterne, kommentar, bewertungsdatum) VALUES
	(1, 1, 1, 2, 1, 5, 'Sehr gute Übergabe', '2024-03-11'),
	(2, 3, 3, 4, 3, 4, 'Alles ok', '2024-03-16'),
	(3, 5, 5, 6, 5, 5, 'Top Zustand', '2024-03-21'),
	(4, 7, 7, 8, 7, 3, 'Etwas verspätet', '2024-03-23'),
	(5, 9, 9, 10, 9, 5, 'Super Kommunikation', '2024-03-26'),
	(6, 11, 11, 3, 2, 4, 'Guter Ablauf', '2024-03-27'),
	(7, 13, 13, 5, 4, 5, 'Sehr freundlich', '2024-03-29'),
	(8, 15, 15, 7, 6, 4, 'Alles bestens', '2024-03-31'),
	(9, 1, 1, 2, 1, 5, 'Wieder alles super', '2024-04-01'),
	(10, 3, 3, 4, 3, 4, 'Gerne wieder', '2024-04-02');


--
-- TOC entry 5129 (class 0 OID 16449)
-- Dependencies: 228
-- Data for Name: buch; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.buch (buchid, titel, erscheinungsjahr, autorid, genreid) VALUES
	(1, 'Harry Potter 1', 1997, 1, 1),
	(2, '1984', 1949, 2, 2),
	(3, 'Der Hobbit', 1937, 3, 7),
	(4, 'Es', 1986, 4, 8),
	(5, 'Mord im Orientexpress', 1934, 5, 4),
	(6, 'Sakrileg', 2003, 6, 5),
	(7, 'Die Tribute von Panem', 2008, 7, 2),
	(8, 'Mistborn', 2006, 8, 1),
	(9, 'Kafka am Strand', 2002, 9, 9),
	(10, 'Foundation', 1951, 10, 3);


--
-- TOC entry 5137 (class 0 OID 16513)
-- Dependencies: 236
-- Data for Name: buchexemplar; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.buchexemplar (buchexemplarid, buchid, besitzerid, zustand, verfuegbarkeit, vaultid) VALUES
	(1, 1, 1, 'gut', 'verfügbar', 1),
	(2, 2, 2, 'sehr gut', 'verfügbar', 2),
	(3, 3, 3, 'gebraucht', 'verfügbar', 3),
	(4, 4, 4, 'gut', 'verfügbar', 4),
	(5, 5, 5, 'sehr gut', 'verfügbar', 5),
	(6, 6, 6, 'gut', 'verfügbar', 6),
	(7, 7, 7, 'gebraucht', 'verfügbar', 7),
	(8, 8, 8, 'gut', 'verfügbar', 8),
	(9, 9, 9, 'sehr gut', 'verfügbar', 9),
	(10, 10, 10, 'gut', 'verfügbar', 10),
	(11, 1, 2, 'gut', 'verfügbar', NULL),
	(12, 2, 3, 'gebraucht', 'verfügbar', NULL),
	(13, 3, 4, 'gut', 'verfügbar', 1),
	(14, 4, 5, 'sehr gut', 'verfügbar', 2),
	(15, 5, 6, 'gut', 'verfügbar', 3),
	(16, 6, 7, 'gebraucht', 'verfügbar', 4),
	(17, 7, 8, 'gut', 'verfügbar', 5),
	(18, 8, 9, 'sehr gut', 'verfügbar', 6),
	(19, 9, 10, 'gut', 'verfügbar', 7),
	(20, 10, 1, 'gebraucht', 'verfügbar', 8);


--
-- TOC entry 5127 (class 0 OID 16438)
-- Dependencies: 226
-- Data for Name: genre; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.genre (genreid, name, beschreibung) VALUES
	(1, 'Fantasy', 'Magische Welten'),
	(2, 'Dystopie', 'Zukunftsvisionen'),
	(3, 'Science Fiction', 'Technologische Zukunft'),
	(4, 'Krimi', 'Detektivgeschichten'),
	(5, 'Thriller', 'Spannung und Action'),
	(6, 'Romantik', 'Liebesgeschichten'),
	(7, 'Abenteuer', 'Reise und Abenteuer'),
	(8, 'Horror', 'Übernatürliches Grauen'),
	(9, 'Drama', 'Emotionale Geschichten'),
	(10, 'Historisch', 'Geschichten aus der Vergangenheit');


--
-- TOC entry 5143 (class 0 OID 16616)
-- Dependencies: 242
-- Data for Name: meldung; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.meldung (meldungid, melderid, betroffenesexemplarid, betroffenerbenutzerid, meldedatum, typ, beschreibung) VALUES
	(1, 1, 2, 2, '2024-03-10', 'Beschädigung', 'Kratzer entdeckt'),
	(2, 2, 3, 3, '2024-03-12', 'Verspätung', 'Buch kam zu spät zurück'),
	(3, 3, 4, 4, '2024-03-14', 'Verlust', 'Exemplar wurde verloren'),
	(4, 4, 5, 5, '2024-03-16', 'Beschädigung', 'Seiten eingerissen'),
	(5, 5, 6, 6, '2024-03-18', 'Verschmutzung', 'Kaffeeflecken im Buch'),
	(6, 6, 7, 7, '2024-03-20', 'Sonstiges', 'Unvollständige Rückgabe'),
	(7, 7, 8, 8, '2024-03-22', 'Beschädigung', 'Einband beschädigt'),
	(8, 8, 9, 9, '2024-03-24', 'Verspätung', 'Rückgabe stark verspätet'),
	(9, 9, 10, 10, '2024-03-26', 'Verlust', 'Exemplar nicht auffindbar'),
	(10, 10, 1, 1, '2024-03-28', 'Sonstiges', 'Unklare Übergabesituation');


--
-- TOC entry 5131 (class 0 OID 16471)
-- Dependencies: 230
-- Data for Name: spot; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.spot (spotid, standortid, spotname, beschreibung, "Öffnungszeiten") VALUES
	(1, 1, 'Schlossplatz', 'Zentraler Übergabeort', '08:00-20:00'),
	(2, 2, 'Campus Süd', 'Vor dem Haupteingang', '07:00-22:00'),
	(3, 3, 'Marktplatz', 'Öffentlicher Platz', '09:00-18:00'),
	(4, 4, 'Rathausplatz', 'Altstadtbereich', '09:00-19:00'),
	(5, 5, 'Hafenbad', 'Innenstadt', '08:00-18:00'),
	(6, 6, 'Neckargasse', 'Zentraler Treffpunkt', '10:00-20:00'),
	(7, 7, 'Kaiserstraße', 'Fußgängerzone', '09:00-21:00'),
	(8, 8, 'Westliche', 'Stadtmitte', '08:00-22:00'),
	(9, 9, 'Wilhelmstraße', 'Altstadt', '09:00-17:00'),
	(10, 10, 'Bahnhofstraße', 'Bahnhofsnah', '06:00-23:00');


--
-- TOC entry 5121 (class 0 OID 16390)
-- Dependencies: 220
-- Data for Name: standort; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.standort (standortid, name, adresse, stadt, plz, beschreibung, longitude, latitude) VALUES
	(1, 'Hauptbibliothek Stuttgart', 'Schlossplatz 1', 'Stuttgart', '70173', 'Zentraler Standort', 9.177000, 48.776100),
	(2, 'Campus Bibliothek Karlsruhe', 'Universitätsstraße 32', 'Karlsruhe', '76131', 'Bibliothek am Campus', 8.404400, 49.013400),
	(3, 'Bücherhalle Mannheim', 'Marktplatz 5', 'Mannheim', '68159', 'Stadtbibliothek', 8.466000, 49.487500),
	(4, 'Lesecenter Freiburg', 'Rathausgasse 12', 'Freiburg', '79098', 'Altstadt Standort', 7.852200, 47.996100),
	(5, 'Mediathek Ulm', 'Hafenbad 10', 'Ulm', '89073', 'Zentralbibliothek', 9.993700, 48.398400),
	(6, 'Bücherpunkt Tübingen', 'Neckargasse 7', 'Tübingen', '72070', 'Innenstadt', 9.053600, 48.522700),
	(7, 'Lesehaus Heilbronn', 'Kaiserstraße 20', 'Heilbronn', '74072', 'Stadtmitte', 9.218000, 49.142700),
	(8, 'Bibliothek Pforzheim', 'Westliche 45', 'Pforzheim', '75172', 'Zentraler Standort', 8.698900, 48.892200),
	(9, 'Leseraum Ludwigsburg', 'Wilhelmstraße 3', 'Ludwigsburg', '71638', 'Altstadt', 9.188500, 48.895000),
	(10, 'Bücherinsel Esslingen', 'Bahnhofstraße 8', 'Esslingen', '73728', 'Bahnhofsnah', 9.307400, 48.739600);


--
-- TOC entry 5133 (class 0 OID 16486)
-- Dependencies: 232
-- Data for Name: vault; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.vault (vaultid, standortid, name, sicherheitsstufe, status) VALUES
	(1, 1, 'RED-1', 'Hoch', 'aktiv'),
	(2, 2, 'BLUE-2', 'Mittel', 'aktiv'),
	(3, 3, 'GREEN-3', 'Niedrig', 'aktiv'),
	(4, 4, 'BLACK-4', 'Hoch', 'aktiv'),
	(5, 5, 'WHITE-5', 'Mittel', 'aktiv'),
	(6, 6, 'GOLD-6', 'Hoch', 'aktiv'),
	(7, 7, 'SILVER-7', 'Mittel', 'aktiv'),
	(8, 8, 'BRONZE-8', 'Niedrig', 'aktiv'),
	(9, 9, 'ONYX-9', 'Hoch', 'aktiv'),
	(10, 10, 'PEARL-10', 'Mittel', 'aktiv');


--
-- TOC entry 5135 (class 0 OID 16503)
-- Dependencies: 234
-- Data for Name: zeitslot; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.zeitslot (zeitslotid, startzeit, endzeit) VALUES
	(1, '09:00:00', '09:30:00'),
	(2, '09:30:00', '10:00:00'),
	(3, '10:00:00', '10:30:00'),
	(4, '10:30:00', '11:00:00'),
	(5, '11:00:00', '11:30:00'),
	(6, '11:30:00', '12:00:00'),
	(7, '12:00:00', '12:30:00'),
	(8, '12:30:00', '13:00:00'),
	(9, '13:00:00', '13:30:00'),
	(10, '13:30:00', '14:00:00'),
	(11, '14:00:00', '14:30:00'),
	(12, '14:30:00', '15:00:00'),
	(13, '15:00:00', '15:30:00'),
	(14, '15:30:00', '16:00:00'),
	(15, '16:00:00', '16:30:00'),
	(16, '16:30:00', '17:00:00'),
	(17, '17:00:00', '17:30:00'),
	(18, '17:30:00', '18:00:00');


--
-- TOC entry 5163 (class 0 OID 0)
-- Dependencies: 237
-- Name: ausleihe_ausleiheid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.ausleihe_ausleiheid_seq', 15, true);


--
-- TOC entry 5164 (class 0 OID 0)
-- Dependencies: 223
-- Name: autor_autorid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.autor_autorid_seq', 10, true);


--
-- TOC entry 5165 (class 0 OID 0)
-- Dependencies: 221
-- Name: benutzer_benutzerid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.benutzer_benutzerid_seq', 10, true);


--
-- TOC entry 5166 (class 0 OID 0)
-- Dependencies: 239
-- Name: bewertung_bewertungid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.bewertung_bewertungid_seq', 10, true);


--
-- TOC entry 5167 (class 0 OID 0)
-- Dependencies: 227
-- Name: buch_buchid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.buch_buchid_seq', 10, true);


--
-- TOC entry 5168 (class 0 OID 0)
-- Dependencies: 235
-- Name: buchexemplar_buchexemplarid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.buchexemplar_buchexemplarid_seq', 20, true);


--
-- TOC entry 5169 (class 0 OID 0)
-- Dependencies: 225
-- Name: genre_genreid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.genre_genreid_seq', 10, true);


--
-- TOC entry 5170 (class 0 OID 0)
-- Dependencies: 241
-- Name: meldung_meldungid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.meldung_meldungid_seq', 10, true);


--
-- TOC entry 5171 (class 0 OID 0)
-- Dependencies: 229
-- Name: spot_spotid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.spot_spotid_seq', 10, true);


--
-- TOC entry 5172 (class 0 OID 0)
-- Dependencies: 219
-- Name: standort_standortid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.standort_standortid_seq', 10, true);


--
-- TOC entry 5173 (class 0 OID 0)
-- Dependencies: 231
-- Name: vault_vaultid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.vault_vaultid_seq', 10, true);


--
-- TOC entry 5174 (class 0 OID 0)
-- Dependencies: 233
-- Name: zeitslot_zeitslotid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.zeitslot_zeitslotid_seq', 18, true);


--
-- TOC entry 4948 (class 2606 OID 16552)
-- Name: ausleihe ausleihe_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ausleihe
    ADD CONSTRAINT ausleihe_pkey PRIMARY KEY (ausleiheid);


--
-- TOC entry 4932 (class 2606 OID 16436)
-- Name: autor autor_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.autor
    ADD CONSTRAINT autor_pkey PRIMARY KEY (autorid);


--
-- TOC entry 4928 (class 2606 OID 16422)
-- Name: benutzer benutzer_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.benutzer
    ADD CONSTRAINT benutzer_email_key UNIQUE (email);


--
-- TOC entry 4930 (class 2606 OID 16420)
-- Name: benutzer benutzer_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.benutzer
    ADD CONSTRAINT benutzer_pkey PRIMARY KEY (benutzerid);


--
-- TOC entry 4950 (class 2606 OID 16594)
-- Name: bewertung bewertung_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bewertung
    ADD CONSTRAINT bewertung_pkey PRIMARY KEY (bewertungid);


--
-- TOC entry 4938 (class 2606 OID 16459)
-- Name: buch buch_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.buch
    ADD CONSTRAINT buch_pkey PRIMARY KEY (buchid);


--
-- TOC entry 4946 (class 2606 OID 16523)
-- Name: buchexemplar buchexemplar_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.buchexemplar
    ADD CONSTRAINT buchexemplar_pkey PRIMARY KEY (buchexemplarid);


--
-- TOC entry 4934 (class 2606 OID 16447)
-- Name: genre genre_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.genre
    ADD CONSTRAINT genre_name_key UNIQUE (name);


--
-- TOC entry 4936 (class 2606 OID 16445)
-- Name: genre genre_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.genre
    ADD CONSTRAINT genre_pkey PRIMARY KEY (genreid);


--
-- TOC entry 4952 (class 2606 OID 16629)
-- Name: meldung meldung_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.meldung
    ADD CONSTRAINT meldung_pkey PRIMARY KEY (meldungid);


--
-- TOC entry 4940 (class 2606 OID 16479)
-- Name: spot spot_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spot
    ADD CONSTRAINT spot_pkey PRIMARY KEY (spotid);


--
-- TOC entry 4926 (class 2606 OID 16402)
-- Name: standort standort_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.standort
    ADD CONSTRAINT standort_pkey PRIMARY KEY (standortid);


--
-- TOC entry 4942 (class 2606 OID 16496)
-- Name: vault vault_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vault
    ADD CONSTRAINT vault_pkey PRIMARY KEY (vaultid);


--
-- TOC entry 4944 (class 2606 OID 16511)
-- Name: zeitslot zeitslot_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.zeitslot
    ADD CONSTRAINT zeitslot_pkey PRIMARY KEY (zeitslotid);


--
-- TOC entry 4961 (class 2606 OID 16558)
-- Name: ausleihe ausleihe_ausleiherid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ausleihe
    ADD CONSTRAINT ausleihe_ausleiherid_fkey FOREIGN KEY (ausleiherid) REFERENCES public.benutzer(benutzerid);


--
-- TOC entry 4962 (class 2606 OID 16553)
-- Name: ausleihe ausleihe_buchexemplarid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ausleihe
    ADD CONSTRAINT ausleihe_buchexemplarid_fkey FOREIGN KEY (buchexemplarid) REFERENCES public.buchexemplar(buchexemplarid);


--
-- TOC entry 4963 (class 2606 OID 16563)
-- Name: ausleihe ausleihe_spotid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ausleihe
    ADD CONSTRAINT ausleihe_spotid_fkey FOREIGN KEY (spotid) REFERENCES public.spot(spotid);


--
-- TOC entry 4964 (class 2606 OID 16568)
-- Name: ausleihe ausleihe_vaultid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ausleihe
    ADD CONSTRAINT ausleihe_vaultid_fkey FOREIGN KEY (vaultid) REFERENCES public.vault(vaultid);


--
-- TOC entry 4965 (class 2606 OID 16573)
-- Name: ausleihe ausleihe_zeitslotid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ausleihe
    ADD CONSTRAINT ausleihe_zeitslotid_fkey FOREIGN KEY (zeitslotid) REFERENCES public.zeitslot(zeitslotid);


--
-- TOC entry 4953 (class 2606 OID 16423)
-- Name: benutzer benutzer_standortid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.benutzer
    ADD CONSTRAINT benutzer_standortid_fkey FOREIGN KEY (standortid) REFERENCES public.standort(standortid);


--
-- TOC entry 4966 (class 2606 OID 16595)
-- Name: bewertung bewertung_ausleiheid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bewertung
    ADD CONSTRAINT bewertung_ausleiheid_fkey FOREIGN KEY (ausleiheid) REFERENCES public.ausleihe(ausleiheid);


--
-- TOC entry 4967 (class 2606 OID 16605)
-- Name: bewertung bewertung_bewerterid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bewertung
    ADD CONSTRAINT bewertung_bewerterid_fkey FOREIGN KEY (bewerterid) REFERENCES public.benutzer(benutzerid);


--
-- TOC entry 4968 (class 2606 OID 16610)
-- Name: bewertung bewertung_bewerteterid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bewertung
    ADD CONSTRAINT bewertung_bewerteterid_fkey FOREIGN KEY (bewerteterid) REFERENCES public.benutzer(benutzerid);


--
-- TOC entry 4969 (class 2606 OID 16600)
-- Name: bewertung bewertung_buchexemplarid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bewertung
    ADD CONSTRAINT bewertung_buchexemplarid_fkey FOREIGN KEY (buchexemplarid) REFERENCES public.buchexemplar(buchexemplarid);


--
-- TOC entry 4954 (class 2606 OID 16460)
-- Name: buch buch_autorid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.buch
    ADD CONSTRAINT buch_autorid_fkey FOREIGN KEY (autorid) REFERENCES public.autor(autorid);


--
-- TOC entry 4955 (class 2606 OID 16465)
-- Name: buch buch_genreid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.buch
    ADD CONSTRAINT buch_genreid_fkey FOREIGN KEY (genreid) REFERENCES public.genre(genreid);


--
-- TOC entry 4958 (class 2606 OID 16529)
-- Name: buchexemplar buchexemplar_besitzerid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.buchexemplar
    ADD CONSTRAINT buchexemplar_besitzerid_fkey FOREIGN KEY (besitzerid) REFERENCES public.benutzer(benutzerid);


--
-- TOC entry 4959 (class 2606 OID 16524)
-- Name: buchexemplar buchexemplar_buchid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.buchexemplar
    ADD CONSTRAINT buchexemplar_buchid_fkey FOREIGN KEY (buchid) REFERENCES public.buch(buchid);


--
-- TOC entry 4960 (class 2606 OID 16534)
-- Name: buchexemplar buchexemplar_vaultid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.buchexemplar
    ADD CONSTRAINT buchexemplar_vaultid_fkey FOREIGN KEY (vaultid) REFERENCES public.vault(vaultid);


--
-- TOC entry 4970 (class 2606 OID 16640)
-- Name: meldung meldung_betroffenerbenutzerid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.meldung
    ADD CONSTRAINT meldung_betroffenerbenutzerid_fkey FOREIGN KEY (betroffenerbenutzerid) REFERENCES public.benutzer(benutzerid);


--
-- TOC entry 4971 (class 2606 OID 16635)
-- Name: meldung meldung_betroffenesexemplarid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.meldung
    ADD CONSTRAINT meldung_betroffenesexemplarid_fkey FOREIGN KEY (betroffenesexemplarid) REFERENCES public.buchexemplar(buchexemplarid);


--
-- TOC entry 4972 (class 2606 OID 16630)
-- Name: meldung meldung_melderid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.meldung
    ADD CONSTRAINT meldung_melderid_fkey FOREIGN KEY (melderid) REFERENCES public.benutzer(benutzerid);


--
-- TOC entry 4956 (class 2606 OID 16480)
-- Name: spot spot_standortid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spot
    ADD CONSTRAINT spot_standortid_fkey FOREIGN KEY (standortid) REFERENCES public.standort(standortid);


--
-- TOC entry 4957 (class 2606 OID 16497)
-- Name: vault vault_standortid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vault
    ADD CONSTRAINT vault_standortid_fkey FOREIGN KEY (standortid) REFERENCES public.standort(standortid);


-- Completed on 2026-04-19 11:21:19

--
-- PostgreSQL database dump complete
--

\unrestrict e5Jq0lKsi09Og4WAo7dSZMu9lt8YvUyH6nYBwLPW3ulyWLWNhIGC8QCwyEKYRTK

