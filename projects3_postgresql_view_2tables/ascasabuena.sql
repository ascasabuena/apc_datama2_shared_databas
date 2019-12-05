--
-- PostgreSQL database dump
--

-- Dumped from database version 10.10 (Ubuntu 10.10-0ubuntu0.18.04.1)
-- Dumped by pg_dump version 12.0

-- Started on 2019-12-05 09:11:56

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'SQL_ASCII';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 25 (class 2615 OID 18265)
-- Name: ascasabuena; Type: SCHEMA; Schema: -; Owner: datama2mi181
--

CREATE SCHEMA ascasabuena;


ALTER SCHEMA ascasabuena OWNER TO datama2mi181;

SET default_tablespace = '';

--
-- TOC entry 334 (class 1259 OID 18421)
-- Name: chef; Type: TABLE; Schema: ascasabuena; Owner: datama2mi181
--

CREATE TABLE ascasabuena.chef (
    chef_id integer NOT NULL,
    chef_position character varying(45) NOT NULL,
    chef_lname character varying(45) NOT NULL,
    chef_fname character varying(45) NOT NULL,
    ons_id integer,
    onl_id integer
);


ALTER TABLE ascasabuena.chef OWNER TO datama2mi181;

--
-- TOC entry 333 (class 1259 OID 18419)
-- Name: chef_chef_id_seq; Type: SEQUENCE; Schema: ascasabuena; Owner: datama2mi181
--

CREATE SEQUENCE ascasabuena.chef_chef_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE ascasabuena.chef_chef_id_seq OWNER TO datama2mi181;

--
-- TOC entry 3521 (class 0 OID 0)
-- Dependencies: 333
-- Name: chef_chef_id_seq; Type: SEQUENCE OWNED BY; Schema: ascasabuena; Owner: datama2mi181
--

ALTER SEQUENCE ascasabuena.chef_chef_id_seq OWNED BY ascasabuena.chef.chef_id;


--
-- TOC entry 324 (class 1259 OID 18374)
-- Name: employee; Type: TABLE; Schema: ascasabuena; Owner: datama2mi181
--

CREATE TABLE ascasabuena.employee (
    emp_id integer NOT NULL,
    emp_fname character varying(45) NOT NULL,
    emp_lname character varying(45) NOT NULL,
    emp_dob date,
    emp_address character varying(45) DEFAULT NULL::character varying,
    emp_date_hired date
);


ALTER TABLE ascasabuena.employee OWNER TO datama2mi181;

--
-- TOC entry 323 (class 1259 OID 18372)
-- Name: employee_emp_id_seq; Type: SEQUENCE; Schema: ascasabuena; Owner: datama2mi181
--

CREATE SEQUENCE ascasabuena.employee_emp_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE ascasabuena.employee_emp_id_seq OWNER TO datama2mi181;

--
-- TOC entry 3522 (class 0 OID 0)
-- Dependencies: 323
-- Name: employee_emp_id_seq; Type: SEQUENCE OWNED BY; Schema: ascasabuena; Owner: datama2mi181
--

ALTER SEQUENCE ascasabuena.employee_emp_id_seq OWNED BY ascasabuena.employee.emp_id;


--
-- TOC entry 326 (class 1259 OID 18383)
-- Name: online_customer; Type: TABLE; Schema: ascasabuena; Owner: datama2mi181
--

CREATE TABLE ascasabuena.online_customer (
    onl_id integer NOT NULL,
    onl_fname character varying(45) DEFAULT NULL::character varying,
    onl_lname character varying(45) DEFAULT NULL::character varying,
    onl_dob date,
    ord_id integer
);


ALTER TABLE ascasabuena.online_customer OWNER TO datama2mi181;

--
-- TOC entry 325 (class 1259 OID 18381)
-- Name: online_customer_onl_id_seq; Type: SEQUENCE; Schema: ascasabuena; Owner: datama2mi181
--

CREATE SEQUENCE ascasabuena.online_customer_onl_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE ascasabuena.online_customer_onl_id_seq OWNER TO datama2mi181;

--
-- TOC entry 3523 (class 0 OID 0)
-- Dependencies: 325
-- Name: online_customer_onl_id_seq; Type: SEQUENCE OWNED BY; Schema: ascasabuena; Owner: datama2mi181
--

ALTER SEQUENCE ascasabuena.online_customer_onl_id_seq OWNED BY ascasabuena.online_customer.onl_id;


--
-- TOC entry 328 (class 1259 OID 18393)
-- Name: onsite_customer; Type: TABLE; Schema: ascasabuena; Owner: datama2mi181
--

CREATE TABLE ascasabuena.onsite_customer (
    ons_id integer NOT NULL,
    ons_fname character varying(45) DEFAULT NULL::character varying,
    ons_lname character varying(45) DEFAULT NULL::character varying,
    ons_dob date,
    ord_id integer
);


ALTER TABLE ascasabuena.onsite_customer OWNER TO datama2mi181;

--
-- TOC entry 327 (class 1259 OID 18391)
-- Name: onsite_customer_ons_id_seq; Type: SEQUENCE; Schema: ascasabuena; Owner: datama2mi181
--

CREATE SEQUENCE ascasabuena.onsite_customer_ons_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE ascasabuena.onsite_customer_ons_id_seq OWNER TO datama2mi181;

--
-- TOC entry 3524 (class 0 OID 0)
-- Dependencies: 327
-- Name: onsite_customer_ons_id_seq; Type: SEQUENCE OWNED BY; Schema: ascasabuena; Owner: datama2mi181
--

ALTER SEQUENCE ascasabuena.onsite_customer_ons_id_seq OWNED BY ascasabuena.onsite_customer.ons_id;


--
-- TOC entry 330 (class 1259 OID 18403)
-- Name: orders; Type: TABLE; Schema: ascasabuena; Owner: datama2mi181
--

CREATE TABLE ascasabuena.orders (
    ord_id integer NOT NULL,
    ord_menu_name character varying(45) DEFAULT NULL::character varying,
    ord_amount integer,
    ord_date timestamp without time zone NOT NULL
);


ALTER TABLE ascasabuena.orders OWNER TO datama2mi181;

--
-- TOC entry 349 (class 1259 OID 23149)
-- Name: onsite_has_orderss; Type: VIEW; Schema: ascasabuena; Owner: datama2mi181
--

CREATE VIEW ascasabuena.onsite_has_orderss AS
 SELECT o.ord_id,
    o.ord_menu_name,
    o.ord_amount,
    o.ord_date,
    a.ons_id,
    a.ons_fname,
    a.ons_lname,
    a.ons_dob
   FROM (ascasabuena.orders o
     JOIN ascasabuena.onsite_customer a ON ((o.ord_id = a.ons_id)));


ALTER TABLE ascasabuena.onsite_has_orderss OWNER TO datama2mi181;

--
-- TOC entry 329 (class 1259 OID 18401)
-- Name: orders_ord_id_seq; Type: SEQUENCE; Schema: ascasabuena; Owner: datama2mi181
--

CREATE SEQUENCE ascasabuena.orders_ord_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE ascasabuena.orders_ord_id_seq OWNER TO datama2mi181;

--
-- TOC entry 3525 (class 0 OID 0)
-- Dependencies: 329
-- Name: orders_ord_id_seq; Type: SEQUENCE OWNED BY; Schema: ascasabuena; Owner: datama2mi181
--

ALTER SEQUENCE ascasabuena.orders_ord_id_seq OWNED BY ascasabuena.orders.ord_id;


--
-- TOC entry 332 (class 1259 OID 18412)
-- Name: product; Type: TABLE; Schema: ascasabuena; Owner: datama2mi181
--

CREATE TABLE ascasabuena.product (
    prod_id integer NOT NULL,
    prod_type character varying(45) DEFAULT NULL::character varying,
    prod_date date,
    prod_date_expire date,
    prod_num_items integer
);


ALTER TABLE ascasabuena.product OWNER TO datama2mi181;

--
-- TOC entry 331 (class 1259 OID 18410)
-- Name: product_prod_id_seq; Type: SEQUENCE; Schema: ascasabuena; Owner: datama2mi181
--

CREATE SEQUENCE ascasabuena.product_prod_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE ascasabuena.product_prod_id_seq OWNER TO datama2mi181;

--
-- TOC entry 3526 (class 0 OID 0)
-- Dependencies: 331
-- Name: product_prod_id_seq; Type: SEQUENCE OWNED BY; Schema: ascasabuena; Owner: datama2mi181
--

ALTER SEQUENCE ascasabuena.product_prod_id_seq OWNED BY ascasabuena.product.prod_id;


--
-- TOC entry 320 (class 1259 OID 18356)
-- Name: restaurant; Type: TABLE; Schema: ascasabuena; Owner: datama2mi181
--

CREATE TABLE ascasabuena.restaurant (
    res_id integer NOT NULL,
    res_loc character varying(45) DEFAULT NULL::character varying,
    res_employed_num integer,
    chef_id integer,
    emp_id integer
);


ALTER TABLE ascasabuena.restaurant OWNER TO datama2mi181;

--
-- TOC entry 319 (class 1259 OID 18354)
-- Name: restaurant_res_id_seq; Type: SEQUENCE; Schema: ascasabuena; Owner: datama2mi181
--

CREATE SEQUENCE ascasabuena.restaurant_res_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE ascasabuena.restaurant_res_id_seq OWNER TO datama2mi181;

--
-- TOC entry 3527 (class 0 OID 0)
-- Dependencies: 319
-- Name: restaurant_res_id_seq; Type: SEQUENCE OWNED BY; Schema: ascasabuena; Owner: datama2mi181
--

ALTER SEQUENCE ascasabuena.restaurant_res_id_seq OWNED BY ascasabuena.restaurant.res_id;


--
-- TOC entry 335 (class 1259 OID 18443)
-- Name: restaurant_supplier; Type: TABLE; Schema: ascasabuena; Owner: datama2mi181
--

CREATE TABLE ascasabuena.restaurant_supplier (
    res_id integer NOT NULL,
    supp_id integer NOT NULL,
    integ_date timestamp without time zone
);


ALTER TABLE ascasabuena.restaurant_supplier OWNER TO datama2mi181;

--
-- TOC entry 322 (class 1259 OID 18365)
-- Name: supplier; Type: TABLE; Schema: ascasabuena; Owner: datama2mi181
--

CREATE TABLE ascasabuena.supplier (
    supp_id integer NOT NULL,
    supp_name character varying(45) NOT NULL,
    supp_contact integer,
    supp_address character varying(45) DEFAULT NULL::character varying,
    prod_id integer
);


ALTER TABLE ascasabuena.supplier OWNER TO datama2mi181;

--
-- TOC entry 321 (class 1259 OID 18363)
-- Name: supplier_supp_id_seq; Type: SEQUENCE; Schema: ascasabuena; Owner: datama2mi181
--

CREATE SEQUENCE ascasabuena.supplier_supp_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE ascasabuena.supplier_supp_id_seq OWNER TO datama2mi181;

--
-- TOC entry 3528 (class 0 OID 0)
-- Dependencies: 321
-- Name: supplier_supp_id_seq; Type: SEQUENCE OWNED BY; Schema: ascasabuena; Owner: datama2mi181
--

ALTER SEQUENCE ascasabuena.supplier_supp_id_seq OWNED BY ascasabuena.supplier.supp_id;


--
-- TOC entry 3327 (class 2604 OID 18424)
-- Name: chef chef_id; Type: DEFAULT; Schema: ascasabuena; Owner: datama2mi181
--

ALTER TABLE ONLY ascasabuena.chef ALTER COLUMN chef_id SET DEFAULT nextval('ascasabuena.chef_chef_id_seq'::regclass);


--
-- TOC entry 3315 (class 2604 OID 18377)
-- Name: employee emp_id; Type: DEFAULT; Schema: ascasabuena; Owner: datama2mi181
--

ALTER TABLE ONLY ascasabuena.employee ALTER COLUMN emp_id SET DEFAULT nextval('ascasabuena.employee_emp_id_seq'::regclass);


--
-- TOC entry 3317 (class 2604 OID 18386)
-- Name: online_customer onl_id; Type: DEFAULT; Schema: ascasabuena; Owner: datama2mi181
--

ALTER TABLE ONLY ascasabuena.online_customer ALTER COLUMN onl_id SET DEFAULT nextval('ascasabuena.online_customer_onl_id_seq'::regclass);


--
-- TOC entry 3320 (class 2604 OID 18396)
-- Name: onsite_customer ons_id; Type: DEFAULT; Schema: ascasabuena; Owner: datama2mi181
--

ALTER TABLE ONLY ascasabuena.onsite_customer ALTER COLUMN ons_id SET DEFAULT nextval('ascasabuena.onsite_customer_ons_id_seq'::regclass);


--
-- TOC entry 3323 (class 2604 OID 18406)
-- Name: orders ord_id; Type: DEFAULT; Schema: ascasabuena; Owner: datama2mi181
--

ALTER TABLE ONLY ascasabuena.orders ALTER COLUMN ord_id SET DEFAULT nextval('ascasabuena.orders_ord_id_seq'::regclass);


--
-- TOC entry 3325 (class 2604 OID 18415)
-- Name: product prod_id; Type: DEFAULT; Schema: ascasabuena; Owner: datama2mi181
--

ALTER TABLE ONLY ascasabuena.product ALTER COLUMN prod_id SET DEFAULT nextval('ascasabuena.product_prod_id_seq'::regclass);


--
-- TOC entry 3311 (class 2604 OID 18359)
-- Name: restaurant res_id; Type: DEFAULT; Schema: ascasabuena; Owner: datama2mi181
--

ALTER TABLE ONLY ascasabuena.restaurant ALTER COLUMN res_id SET DEFAULT nextval('ascasabuena.restaurant_res_id_seq'::regclass);


--
-- TOC entry 3313 (class 2604 OID 18368)
-- Name: supplier supp_id; Type: DEFAULT; Schema: ascasabuena; Owner: datama2mi181
--

ALTER TABLE ONLY ascasabuena.supplier ALTER COLUMN supp_id SET DEFAULT nextval('ascasabuena.supplier_supp_id_seq'::regclass);


--
-- TOC entry 3514 (class 0 OID 18421)
-- Dependencies: 334
-- Data for Name: chef; Type: TABLE DATA; Schema: ascasabuena; Owner: datama2mi181
--

INSERT INTO ascasabuena.chef VALUES (1, 'head chef', 'Bernardo', 'Herrick', NULL, NULL);
INSERT INTO ascasabuena.chef VALUES (2, 'sous chef', 'Jeremy', 'Carmack', NULL, NULL);


--
-- TOC entry 3504 (class 0 OID 18374)
-- Dependencies: 324
-- Data for Name: employee; Type: TABLE DATA; Schema: ascasabuena; Owner: datama2mi181
--



--
-- TOC entry 3506 (class 0 OID 18383)
-- Dependencies: 326
-- Data for Name: online_customer; Type: TABLE DATA; Schema: ascasabuena; Owner: datama2mi181
--

INSERT INTO ascasabuena.online_customer VALUES (1, 'Ramsay', 'Karena', '1998-07-09', NULL);
INSERT INTO ascasabuena.online_customer VALUES (2, 'Carney', 'Daniele', '1990-10-04', NULL);
INSERT INTO ascasabuena.online_customer VALUES (3, 'Bryce', 'Harper', '1985-10-02', NULL);
INSERT INTO ascasabuena.online_customer VALUES (4, 'Jose', 'Altuve', '1988-04-08', NULL);
INSERT INTO ascasabuena.online_customer VALUES (5, 'Trae', 'Young', '1999-09-03', NULL);
INSERT INTO ascasabuena.online_customer VALUES (6, 'Jaren', 'Jackson', '1997-12-06', NULL);


--
-- TOC entry 3508 (class 0 OID 18393)
-- Dependencies: 328
-- Data for Name: onsite_customer; Type: TABLE DATA; Schema: ascasabuena; Owner: datama2mi181
--

INSERT INTO ascasabuena.onsite_customer VALUES (1, 'Tom', 'Tomson', '2019-10-17', NULL);
INSERT INTO ascasabuena.onsite_customer VALUES (2, 'Jean', 'Garisson', '2018-10-25', NULL);


--
-- TOC entry 3510 (class 0 OID 18403)
-- Dependencies: 330
-- Data for Name: orders; Type: TABLE DATA; Schema: ascasabuena; Owner: datama2mi181
--

INSERT INTO ascasabuena.orders VALUES (1, 'pancake', 280, '1957-06-13 00:00:00');
INSERT INTO ascasabuena.orders VALUES (2, 'shake', 190, '1957-06-13 00:00:00');


--
-- TOC entry 3512 (class 0 OID 18412)
-- Dependencies: 332
-- Data for Name: product; Type: TABLE DATA; Schema: ascasabuena; Owner: datama2mi181
--

INSERT INTO ascasabuena.product VALUES (1, 'perishable', '2019-10-17', '2019-10-11', 23);
INSERT INTO ascasabuena.product VALUES (2, 'perishable', '2019-10-31', '2020-02-13', 522);


--
-- TOC entry 3500 (class 0 OID 18356)
-- Dependencies: 320
-- Data for Name: restaurant; Type: TABLE DATA; Schema: ascasabuena; Owner: datama2mi181
--

INSERT INTO ascasabuena.restaurant VALUES (1, 'Chambersburg City', 32, NULL, NULL);
INSERT INTO ascasabuena.restaurant VALUES (2, 'Jefferson City', 32, NULL, NULL);


--
-- TOC entry 3515 (class 0 OID 18443)
-- Dependencies: 335
-- Data for Name: restaurant_supplier; Type: TABLE DATA; Schema: ascasabuena; Owner: datama2mi181
--



--
-- TOC entry 3502 (class 0 OID 18365)
-- Dependencies: 322
-- Data for Name: supplier; Type: TABLE DATA; Schema: ascasabuena; Owner: datama2mi181
--

INSERT INTO ascasabuena.supplier VALUES (1, 'meat.ly', 922222, '1019  Cambridge Court', NULL);
INSERT INTO ascasabuena.supplier VALUES (2, 'Foodure', 71763487, '1335  Lincoln Drive', NULL);


--
-- TOC entry 3529 (class 0 OID 0)
-- Dependencies: 333
-- Name: chef_chef_id_seq; Type: SEQUENCE SET; Schema: ascasabuena; Owner: datama2mi181
--

SELECT pg_catalog.setval('ascasabuena.chef_chef_id_seq', 1, false);


--
-- TOC entry 3530 (class 0 OID 0)
-- Dependencies: 323
-- Name: employee_emp_id_seq; Type: SEQUENCE SET; Schema: ascasabuena; Owner: datama2mi181
--

SELECT pg_catalog.setval('ascasabuena.employee_emp_id_seq', 1, false);


--
-- TOC entry 3531 (class 0 OID 0)
-- Dependencies: 325
-- Name: online_customer_onl_id_seq; Type: SEQUENCE SET; Schema: ascasabuena; Owner: datama2mi181
--

SELECT pg_catalog.setval('ascasabuena.online_customer_onl_id_seq', 1, false);


--
-- TOC entry 3532 (class 0 OID 0)
-- Dependencies: 327
-- Name: onsite_customer_ons_id_seq; Type: SEQUENCE SET; Schema: ascasabuena; Owner: datama2mi181
--

SELECT pg_catalog.setval('ascasabuena.onsite_customer_ons_id_seq', 1, false);


--
-- TOC entry 3533 (class 0 OID 0)
-- Dependencies: 329
-- Name: orders_ord_id_seq; Type: SEQUENCE SET; Schema: ascasabuena; Owner: datama2mi181
--

SELECT pg_catalog.setval('ascasabuena.orders_ord_id_seq', 1, false);


--
-- TOC entry 3534 (class 0 OID 0)
-- Dependencies: 331
-- Name: product_prod_id_seq; Type: SEQUENCE SET; Schema: ascasabuena; Owner: datama2mi181
--

SELECT pg_catalog.setval('ascasabuena.product_prod_id_seq', 1, false);


--
-- TOC entry 3535 (class 0 OID 0)
-- Dependencies: 319
-- Name: restaurant_res_id_seq; Type: SEQUENCE SET; Schema: ascasabuena; Owner: datama2mi181
--

SELECT pg_catalog.setval('ascasabuena.restaurant_res_id_seq', 1, false);


--
-- TOC entry 3536 (class 0 OID 0)
-- Dependencies: 321
-- Name: supplier_supp_id_seq; Type: SEQUENCE SET; Schema: ascasabuena; Owner: datama2mi181
--

SELECT pg_catalog.setval('ascasabuena.supplier_supp_id_seq', 1, false);


--
-- TOC entry 3343 (class 2606 OID 18426)
-- Name: chef chef_pkey; Type: CONSTRAINT; Schema: ascasabuena; Owner: datama2mi181
--

ALTER TABLE ONLY ascasabuena.chef
    ADD CONSTRAINT chef_pkey PRIMARY KEY (chef_id);


--
-- TOC entry 3333 (class 2606 OID 18380)
-- Name: employee employee_pkey; Type: CONSTRAINT; Schema: ascasabuena; Owner: datama2mi181
--

ALTER TABLE ONLY ascasabuena.employee
    ADD CONSTRAINT employee_pkey PRIMARY KEY (emp_id);


--
-- TOC entry 3335 (class 2606 OID 18390)
-- Name: online_customer online_customer_pkey; Type: CONSTRAINT; Schema: ascasabuena; Owner: datama2mi181
--

ALTER TABLE ONLY ascasabuena.online_customer
    ADD CONSTRAINT online_customer_pkey PRIMARY KEY (onl_id);


--
-- TOC entry 3337 (class 2606 OID 18400)
-- Name: onsite_customer onsite_customer_pkey; Type: CONSTRAINT; Schema: ascasabuena; Owner: datama2mi181
--

ALTER TABLE ONLY ascasabuena.onsite_customer
    ADD CONSTRAINT onsite_customer_pkey PRIMARY KEY (ons_id);


--
-- TOC entry 3339 (class 2606 OID 18409)
-- Name: orders orders_pkey; Type: CONSTRAINT; Schema: ascasabuena; Owner: datama2mi181
--

ALTER TABLE ONLY ascasabuena.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (ord_id);


--
-- TOC entry 3341 (class 2606 OID 18418)
-- Name: product product_pkey; Type: CONSTRAINT; Schema: ascasabuena; Owner: datama2mi181
--

ALTER TABLE ONLY ascasabuena.product
    ADD CONSTRAINT product_pkey PRIMARY KEY (prod_id);


--
-- TOC entry 3329 (class 2606 OID 18362)
-- Name: restaurant restaurant_pkey; Type: CONSTRAINT; Schema: ascasabuena; Owner: datama2mi181
--

ALTER TABLE ONLY ascasabuena.restaurant
    ADD CONSTRAINT restaurant_pkey PRIMARY KEY (res_id);


--
-- TOC entry 3345 (class 2606 OID 18447)
-- Name: restaurant_supplier restaurant_supplier_id; Type: CONSTRAINT; Schema: ascasabuena; Owner: datama2mi181
--

ALTER TABLE ONLY ascasabuena.restaurant_supplier
    ADD CONSTRAINT restaurant_supplier_id PRIMARY KEY (res_id, supp_id);


--
-- TOC entry 3331 (class 2606 OID 18371)
-- Name: supplier supplier_pkey; Type: CONSTRAINT; Schema: ascasabuena; Owner: datama2mi181
--

ALTER TABLE ONLY ascasabuena.supplier
    ADD CONSTRAINT supplier_pkey PRIMARY KEY (supp_id);


--
-- TOC entry 3346 (class 2606 OID 25580)
-- Name: restaurant chef_id_fkey; Type: FK CONSTRAINT; Schema: ascasabuena; Owner: datama2mi181
--

ALTER TABLE ONLY ascasabuena.restaurant
    ADD CONSTRAINT chef_id_fkey FOREIGN KEY (chef_id) REFERENCES ascasabuena.chef(chef_id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 3347 (class 2606 OID 25597)
-- Name: restaurant emp_id_fkey; Type: FK CONSTRAINT; Schema: ascasabuena; Owner: datama2mi181
--

ALTER TABLE ONLY ascasabuena.restaurant
    ADD CONSTRAINT emp_id_fkey FOREIGN KEY (emp_id) REFERENCES ascasabuena.employee(emp_id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 3352 (class 2606 OID 25568)
-- Name: chef onl_id_fkey; Type: FK CONSTRAINT; Schema: ascasabuena; Owner: datama2mi181
--

ALTER TABLE ONLY ascasabuena.chef
    ADD CONSTRAINT onl_id_fkey FOREIGN KEY (onl_id) REFERENCES ascasabuena.online_customer(onl_id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 3351 (class 2606 OID 25555)
-- Name: chef ons_id_fkey; Type: FK CONSTRAINT; Schema: ascasabuena; Owner: datama2mi181
--

ALTER TABLE ONLY ascasabuena.chef
    ADD CONSTRAINT ons_id_fkey FOREIGN KEY (ons_id) REFERENCES ascasabuena.onsite_customer(ons_id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 3350 (class 2606 OID 25365)
-- Name: onsite_customer ord_id_fkey; Type: FK CONSTRAINT; Schema: ascasabuena; Owner: datama2mi181
--

ALTER TABLE ONLY ascasabuena.onsite_customer
    ADD CONSTRAINT ord_id_fkey FOREIGN KEY (ord_id) REFERENCES ascasabuena.orders(ord_id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 3349 (class 2606 OID 25488)
-- Name: online_customer ord_id_fkey; Type: FK CONSTRAINT; Schema: ascasabuena; Owner: datama2mi181
--

ALTER TABLE ONLY ascasabuena.online_customer
    ADD CONSTRAINT ord_id_fkey FOREIGN KEY (ord_id) REFERENCES ascasabuena.orders(ord_id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 3348 (class 2606 OID 25629)
-- Name: supplier prod_id_fkey; Type: FK CONSTRAINT; Schema: ascasabuena; Owner: datama2mi181
--

ALTER TABLE ONLY ascasabuena.supplier
    ADD CONSTRAINT prod_id_fkey FOREIGN KEY (prod_id) REFERENCES ascasabuena.product(prod_id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 3353 (class 2606 OID 18448)
-- Name: restaurant_supplier restaurant_supplier_res_id_fkey; Type: FK CONSTRAINT; Schema: ascasabuena; Owner: datama2mi181
--

ALTER TABLE ONLY ascasabuena.restaurant_supplier
    ADD CONSTRAINT restaurant_supplier_res_id_fkey FOREIGN KEY (res_id) REFERENCES ascasabuena.restaurant(res_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3354 (class 2606 OID 18453)
-- Name: restaurant_supplier restaurant_supplier_supp_id_fkey; Type: FK CONSTRAINT; Schema: ascasabuena; Owner: datama2mi181
--

ALTER TABLE ONLY ascasabuena.restaurant_supplier
    ADD CONSTRAINT restaurant_supplier_supp_id_fkey FOREIGN KEY (supp_id) REFERENCES ascasabuena.supplier(supp_id) ON UPDATE CASCADE;


-- Completed on 2019-12-05 09:11:57

--
-- PostgreSQL database dump complete
--

