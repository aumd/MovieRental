--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

SET search_path = public, pg_catalog;

ALTER TABLE ONLY public.role DROP CONSTRAINT role_pkey;
ALTER TABLE ONLY public.role DROP CONSTRAINT role_authority_key;
ALTER TABLE ONLY public.request DROP CONSTRAINT request_pkey;
ALTER TABLE ONLY public.rented_movie DROP CONSTRAINT rented_movie_pkey;
ALTER TABLE ONLY public.movie DROP CONSTRAINT movie_pkey;
ALTER TABLE ONLY public.encrypted_data DROP CONSTRAINT encrypted_data_pkey;
ALTER TABLE ONLY public.customer DROP CONSTRAINT customer_pkey;
ALTER TABLE ONLY public.account DROP CONSTRAINT account_user_name_key;
ALTER TABLE ONLY public.account DROP CONSTRAINT account_pkey;
ALTER TABLE public.rented_movie ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.account ALTER COLUMN id DROP DEFAULT;
DROP SEQUENCE public.transaction_id_seq;
DROP TABLE public.transaction;
DROP TABLE public.role;
DROP SEQUENCE public.request_id_seq;
DROP TABLE public.request;
DROP SEQUENCE public.rented_movie_id_seq;
DROP TABLE public.rented_movie;
DROP SEQUENCE public.movie_id_seq;
DROP TABLE public.movie;
DROP SEQUENCE public.hibernate_sequence;
DROP TABLE public.encrypted_data;
DROP SEQUENCE public.customer_id_seq;
DROP TABLE public.customer;
DROP SEQUENCE public.cart_id_seq;
DROP TABLE public.cart;
DROP SEQUENCE public.account_id_seq;
DROP TABLE public.account;
DROP EXTENSION plpgsql;
DROP SCHEMA public;
--
-- Name: public; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA public;


ALTER SCHEMA public OWNER TO postgres;

--
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON SCHEMA public IS 'standard public schema';


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

SET default_with_oids = true;

--
-- Name: account; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE account (
    full_name character varying NOT NULL,
    user_name character varying NOT NULL,
    password character varying NOT NULL,
    role character varying NOT NULL,
    id integer NOT NULL,
    version integer
);


ALTER TABLE public.account OWNER TO postgres;

--
-- Name: account_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE account_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.account_id_seq OWNER TO postgres;

--
-- Name: account_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE account_id_seq OWNED BY account.id;


--
-- Name: account_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('account_id_seq', 22451, true);


SET default_with_oids = false;

--
-- Name: cart; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE cart (
    customer_id character varying(255) NOT NULL,
    movie_id character varying(255) NOT NULL,
    id integer,
    version integer
);


ALTER TABLE public.cart OWNER TO postgres;

--
-- Name: cart_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE cart_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cart_id_seq OWNER TO postgres;

--
-- Name: cart_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE cart_id_seq OWNED BY cart.id;


--
-- Name: cart_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('cart_id_seq', 76, true);


--
-- Name: customer; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE customer (
    address character varying(255) NOT NULL,
    contact_number character varying(255) NOT NULL,
    first_name character varying(255) NOT NULL,
    last_name character varying(255) NOT NULL,
    id character varying NOT NULL,
    email character varying,
    version integer
);


ALTER TABLE public.customer OWNER TO postgres;

--
-- Name: customer_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE customer_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.customer_id_seq OWNER TO postgres;

--
-- Name: customer_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE customer_id_seq OWNED BY customer.id;


--
-- Name: customer_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('customer_id_seq', 1, true);


--
-- Name: encrypted_data; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE encrypted_data (
    id character varying(32) NOT NULL,
    data_item character varying(512) NOT NULL
);


ALTER TABLE public.encrypted_data OWNER TO postgres;

--
-- Name: hibernate_sequence; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE hibernate_sequence
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.hibernate_sequence OWNER TO postgres;

--
-- Name: hibernate_sequence; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('hibernate_sequence', 2, true);


--
-- Name: movie; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE movie (
    actor_or_actress character varying(255) NOT NULL,
    director character varying(255) NOT NULL,
    genre character varying(255) NOT NULL,
    medium character varying(255) NOT NULL,
    title character varying(255) NOT NULL,
    id character varying NOT NULL,
    status character varying(255) NOT NULL,
    overdue_rate double precision NOT NULL,
    rate double precision NOT NULL,
    version integer
);


ALTER TABLE public.movie OWNER TO postgres;

--
-- Name: movie_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE movie_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.movie_id_seq OWNER TO postgres;

--
-- Name: movie_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE movie_id_seq OWNED BY movie.id;


--
-- Name: movie_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('movie_id_seq', 1, false);


--
-- Name: rented_movie; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE rented_movie (
    customer_id character varying(255) NOT NULL,
    due_date timestamp without time zone NOT NULL,
    movie_id character varying(255) NOT NULL,
    id character varying NOT NULL,
    version bigint
);


ALTER TABLE public.rented_movie OWNER TO postgres;

--
-- Name: rented_movie_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE rented_movie_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.rented_movie_id_seq OWNER TO postgres;

--
-- Name: rented_movie_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE rented_movie_id_seq OWNED BY rented_movie.id;


--
-- Name: rented_movie_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('rented_movie_id_seq', 360, true);


--
-- Name: request; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE request (
    address character varying(255) NOT NULL,
    contact_number character varying(255) NOT NULL,
    first_name character varying(255) NOT NULL,
    last_name character varying(255) NOT NULL,
    id character varying NOT NULL,
    email character varying,
    version bigint
);


ALTER TABLE public.request OWNER TO postgres;

--
-- Name: request_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE request_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.request_id_seq OWNER TO postgres;

--
-- Name: request_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE request_id_seq OWNED BY request.id;


--
-- Name: request_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('request_id_seq', 1, false);


--
-- Name: role; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE role (
    id bigint NOT NULL,
    version bigint NOT NULL,
    authority character varying(255) NOT NULL
);


ALTER TABLE public.role OWNER TO postgres;

--
-- Name: transaction; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE transaction (
    customer_id character varying(255) NOT NULL,
    date date NOT NULL,
    fee double precision NOT NULL,
    movie_id character varying(255) NOT NULL,
    type character varying(255) NOT NULL,
    id bigint,
    version integer
);


ALTER TABLE public.transaction OWNER TO postgres;

--
-- Name: transaction_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE transaction_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.transaction_id_seq OWNER TO postgres;

--
-- Name: transaction_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE transaction_id_seq OWNED BY transaction.id;


--
-- Name: transaction_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('transaction_id_seq', 44, true);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY account ALTER COLUMN id SET DEFAULT nextval('account_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY rented_movie ALTER COLUMN id SET DEFAULT nextval('rented_movie_id_seq'::regclass);


--
-- Data for Name: account; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO account VALUES ('Ken Vilar', 'vilar', 'vilar', 'clerk', 22406, NULL);
INSERT INTO account VALUES ('asd', 'asd', 'asd', 'clerk', 22451, NULL);


--
-- Data for Name: cart; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: customer; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO customer VALUES ('San Fancisco', '09226789078', 'Steve', 'Jobs', '2013-4833', 'stevejobs@yahoo.com', NULL);
INSERT INTO customer VALUES ('White Plains', '09125673456', 'Mark', 'Zuckerberg', '2013-2143', 'markzuckerberg@facebook.com', NULL);
INSERT INTO customer VALUES ('Google', '09126474645', 'Sergey', 'Brin', '2013-9928', 'brin@gmail.com', NULL);
INSERT INTO customer VALUES ('pala-o iligan city', '0987654321', 'gary', 'oak', '2013-3171', 'oak@gmail.com', NULL);
INSERT INTO customer VALUES ('San miguel', '09469343193', 'darlwisa', 'bulala', '2013-6747', 'ivymay.bulala@yahoo.com', NULL);


--
-- Data for Name: encrypted_data; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: movie; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO movie VALUES ('Kenvilar, jervy benitez, & carloapas', 'Eli ', 'Adventure', 'Blu-Ray', 'Eli the great', '9503', 'good', 15, 50, NULL);
INSERT INTO movie VALUES ('Hugh Jackman', 'Peter Ramsey', 'Animation', 'Blu-Ray', 'Rise of the Guardians', '4080', 'good', 15, 50, NULL);
INSERT INTO movie VALUES ('Mila Kunis', 'Sam Raimi', 'Fantasy', 'DVD', 'Oz the Great and Powerful', '4377', 'good', 15, 50, NULL);
INSERT INTO movie VALUES ('Irrfan Khan', 'Ang Lee', 'Adventure', 'DVD', 'Life of Pi', '5359', 'good', 15, 50, NULL);
INSERT INTO movie VALUES ('Jamie Foxx', 'Tarantino', 'War', 'Blu-Ray', 'Django Unchained', '5483', 'good', 15, 30, NULL);
INSERT INTO movie VALUES ('Ralph', 'Rich Moore', 'Animation', 'DVD', 'Wreck-It-Ralph', '3292', 'good', 15, 50, NULL);
INSERT INTO movie VALUES ('Jennifer Lawrence', 'David O. Russell', 'Drama', 'HD DVD', 'Silver Linings Playbook', '7411', 'good', 15, 50, NULL);
INSERT INTO movie VALUES ('Brad Pitt', 'David Fincher', 'Drama', 'DVD', 'Fight Club', '6112', 'good', 15, 50, NULL);


--
-- Data for Name: rented_movie; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: request; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO role VALUES (1, 0, 'ROLE_ADMIN');
INSERT INTO role VALUES (2, 0, 'ROLE_USER');


--
-- Data for Name: transaction; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO transaction VALUES ('2013-3171', '2013-03-25', 30, '5483', 'check out', NULL, NULL);
INSERT INTO transaction VALUES ('2013-3171', '2013-03-25', 50, '6112', 'check out', NULL, NULL);
INSERT INTO transaction VALUES ('2013-3171', '2013-03-25', 50, '5359', 'check out', NULL, NULL);
INSERT INTO transaction VALUES ('2013-3171', '2013-03-25', 0, '5359', 'check in', NULL, NULL);
INSERT INTO transaction VALUES ('2013-3171', '2013-03-25', 0, '5483', 'check in', NULL, NULL);
INSERT INTO transaction VALUES ('2013-3171', '2013-03-25', 0, '6112', 'check in', NULL, NULL);
INSERT INTO transaction VALUES ('2013-3171', '2013-03-25', 50, '5359', 'check out', NULL, NULL);
INSERT INTO transaction VALUES ('2013-3171', '2013-03-25', 30, '5483', 'check out', NULL, NULL);
INSERT INTO transaction VALUES ('2013-3171', '2013-03-25', 50, '6112', 'check out', NULL, NULL);
INSERT INTO transaction VALUES ('2013-3171', '2013-03-25', 0, '5359', 'check in', NULL, NULL);
INSERT INTO transaction VALUES ('2013-3171', '2013-03-25', 0, '5483', 'check in', NULL, NULL);
INSERT INTO transaction VALUES ('2013-3171', '2013-03-25', 0, '6112', 'check in', NULL, NULL);
INSERT INTO transaction VALUES ('2013-3171', '2013-03-25', 50, '5359', 'check out', NULL, NULL);
INSERT INTO transaction VALUES ('2013-3171', '2013-03-25', 30, '5483', 'check out', NULL, NULL);
INSERT INTO transaction VALUES ('2013-3171', '2013-03-25', 50, '6112', 'check out', NULL, NULL);
INSERT INTO transaction VALUES ('2013-3171', '2013-03-25', 0, '5359', 'check in', NULL, NULL);
INSERT INTO transaction VALUES ('2013-3171', '2013-03-25', 0, '5483', 'check in', NULL, NULL);
INSERT INTO transaction VALUES ('2013-3171', '2013-03-25', 0, '6112', 'check in', NULL, NULL);
INSERT INTO transaction VALUES ('2013-6747', '2013-03-26', 30, '5483', 'check out', NULL, NULL);
INSERT INTO transaction VALUES ('2013-6747', '2013-03-26', 500, '9503', 'check out', NULL, NULL);
INSERT INTO transaction VALUES ('2013-3171', '2013-03-26', 50, '4377', 'check out', NULL, NULL);
INSERT INTO transaction VALUES ('2013-3171', '2013-03-26', 50, '5359', 'check out', NULL, NULL);
INSERT INTO transaction VALUES ('2013-3171', '2013-03-26', 50, '6112', 'check out', NULL, NULL);
INSERT INTO transaction VALUES ('2013-6747', '2013-03-26', 0, '5483', 'check in', NULL, NULL);
INSERT INTO transaction VALUES ('2013-6747', '2013-03-26', 0, '9503', 'check in', NULL, NULL);
INSERT INTO transaction VALUES ('2013-6747', '2013-03-31', 30, '5483', 'check out', NULL, NULL);
INSERT INTO transaction VALUES ('2013-6747', '2013-03-31', 50, '9503', 'check out', NULL, NULL);
INSERT INTO transaction VALUES ('2013-6747', '2013-03-31', 50, '4080', 'check out', NULL, NULL);
INSERT INTO transaction VALUES ('2013-6747', '2013-03-31', 0, '5483', 'check in', NULL, NULL);
INSERT INTO transaction VALUES ('2013-6747', '2013-03-31', 0, '9503', 'check in', NULL, NULL);
INSERT INTO transaction VALUES ('2013-6747', '2013-03-31', 0, '4080', 'check in', NULL, NULL);
INSERT INTO transaction VALUES ('2013-6747', '2013-03-31', 30, '5483', 'check out', NULL, NULL);
INSERT INTO transaction VALUES ('2013-6747', '2013-03-31', 50, '9503', 'check out', NULL, NULL);
INSERT INTO transaction VALUES ('2013-6747', '2013-03-31', 50, '4080', 'check out', NULL, NULL);
INSERT INTO transaction VALUES ('null', '2013-03-31', 0, '9503', 'check in', NULL, NULL);
INSERT INTO transaction VALUES ('null', '2013-03-31', 0, '4080', 'check in', NULL, NULL);
INSERT INTO transaction VALUES ('null', '2013-03-31', 0, '5483', 'check in', NULL, NULL);
INSERT INTO transaction VALUES ('2013-6747', '2013-03-31', 50, '9503', 'check out', NULL, NULL);
INSERT INTO transaction VALUES ('2013-6747', '2013-03-31', 50, '4080', 'check out', NULL, NULL);
INSERT INTO transaction VALUES ('2013-6747', '2013-03-31', 30, '5483', 'check out', NULL, NULL);
INSERT INTO transaction VALUES ('2013-6747', '2013-04-01', 0, '9503', 'check in', NULL, NULL);
INSERT INTO transaction VALUES ('2013-6747', '2013-04-01', 0, '4080', 'check in', NULL, NULL);
INSERT INTO transaction VALUES ('2013-6747', '2013-04-01', 0, '5483', 'check in', NULL, NULL);
INSERT INTO transaction VALUES ('2013-3171', '2013-04-01', 0, '4377', 'check in', NULL, NULL);
INSERT INTO transaction VALUES ('2013-3171', '2013-04-01', 0, '5359', 'check in', NULL, NULL);
INSERT INTO transaction VALUES ('2013-3171', '2013-04-01', 0, '6112', 'check in', NULL, NULL);
INSERT INTO transaction VALUES ('2013-6747', '2013-04-01', 50, '9503', 'check out', NULL, NULL);
INSERT INTO transaction VALUES ('2013-6747', '2013-04-01', 50, '4377', 'check out', NULL, NULL);
INSERT INTO transaction VALUES ('2013-6747', '2013-04-01', 30, '5483', 'check out', NULL, NULL);
INSERT INTO transaction VALUES ('2013-6747', '2013-04-01', 0, '9503', 'check in', NULL, NULL);
INSERT INTO transaction VALUES ('2013-6747', '2013-04-01', 0, '4377', 'check in', NULL, NULL);
INSERT INTO transaction VALUES ('2013-6747', '2013-04-01', 0, '5483', 'check in', NULL, NULL);
INSERT INTO transaction VALUES ('2013-6747', '2013-04-01', 50, '9503', 'check out', NULL, NULL);
INSERT INTO transaction VALUES ('2013-6747', '2013-04-01', 30, '5483', 'check out', NULL, NULL);
INSERT INTO transaction VALUES ('2013-6747', '2013-04-01', 50, '6112', 'check out', NULL, NULL);
INSERT INTO transaction VALUES ('2013-6747', '2013-04-01', 0, '9503', 'check in', NULL, NULL);
INSERT INTO transaction VALUES ('2013-6747', '2013-04-01', 0, '5483', 'check in', NULL, NULL);
INSERT INTO transaction VALUES ('2013-6747', '2013-04-01', 0, '6112', 'check in', NULL, NULL);
INSERT INTO transaction VALUES ('2013-6747', '2013-04-01', 50, '9503', 'check out', NULL, NULL);
INSERT INTO transaction VALUES ('2013-6747', '2013-04-01', 30, '5483', 'check out', NULL, NULL);
INSERT INTO transaction VALUES ('2013-6747', '2013-04-01', 50, '6112', 'check out', NULL, NULL);
INSERT INTO transaction VALUES ('2013-6747', '2013-04-01', 0, '9503', 'check in', NULL, NULL);
INSERT INTO transaction VALUES ('2013-6747', '2013-04-01', 0, '5483', 'check in', NULL, NULL);
INSERT INTO transaction VALUES ('2013-6747', '2013-04-01', 0, '6112', 'check in', NULL, NULL);
INSERT INTO transaction VALUES ('2013-2143', '2013-04-02', 30, '5483', 'check out', NULL, NULL);
INSERT INTO transaction VALUES ('2013-2143', '2013-04-02', 50, '9503', 'check out', NULL, NULL);
INSERT INTO transaction VALUES ('2013-2143', '2013-04-02', 50, '6112', 'check out', NULL, NULL);
INSERT INTO transaction VALUES ('2013-2143', '2013-04-02', 0, '9503', 'check in', NULL, NULL);
INSERT INTO transaction VALUES ('2013-2143', '2013-04-02', 0, '5483', 'check in', NULL, NULL);
INSERT INTO transaction VALUES ('2013-2143', '2013-04-02', 0, '6112', 'check in', NULL, NULL);


--
-- Name: account_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY account
    ADD CONSTRAINT account_pkey PRIMARY KEY (id);


--
-- Name: account_user_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY account
    ADD CONSTRAINT account_user_name_key UNIQUE (user_name);


--
-- Name: customer_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY customer
    ADD CONSTRAINT customer_pkey PRIMARY KEY (id);


--
-- Name: encrypted_data_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY encrypted_data
    ADD CONSTRAINT encrypted_data_pkey PRIMARY KEY (id);


--
-- Name: movie_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY movie
    ADD CONSTRAINT movie_pkey PRIMARY KEY (id);


--
-- Name: rented_movie_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY rented_movie
    ADD CONSTRAINT rented_movie_pkey PRIMARY KEY (id);


--
-- Name: request_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY request
    ADD CONSTRAINT request_pkey PRIMARY KEY (id);


--
-- Name: role_authority_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_authority_key UNIQUE (authority);


--
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

