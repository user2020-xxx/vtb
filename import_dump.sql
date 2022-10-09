--
-- PostgreSQL database dump
--

-- Dumped from database version 14.5
-- Dumped by pg_dump version 14.5

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
-- Name: auth_group; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO postgres;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO postgres;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_group_permissions (
    id bigint NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO postgres;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO postgres;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO postgres;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO postgres;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE public.django_admin_log OWNER TO postgres;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO postgres;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO postgres;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO postgres;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_migrations (
    id bigint NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO postgres;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO postgres;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO postgres;

--
-- Name: events_event; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.events_event (
    id integer NOT NULL,
    title character varying(50),
    description character varying(500),
    datetime timestamp with time zone,
    prize integer,
    comment character varying(1000),
    image text,
    creator character varying(1000),
    slug character varying(100),
    likes character varying(1000),
    participants integer[]
);


ALTER TABLE public.events_event OWNER TO postgres;

--
-- Name: events_event_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.events_event_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.events_event_id_seq OWNER TO postgres;

--
-- Name: events_event_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.events_event_id_seq OWNED BY public.events_event.id;


--
-- Name: knox_authtoken; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.knox_authtoken (
    digest character varying(128) NOT NULL,
    created timestamp with time zone NOT NULL,
    user_id integer NOT NULL,
    expiry timestamp with time zone,
    token_key character varying(8) NOT NULL
);


ALTER TABLE public.knox_authtoken OWNER TO postgres;

--
-- Name: users_user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users_user (
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    id integer NOT NULL,
    username character varying(50) NOT NULL,
    email character varying(100) NOT NULL,
    is_active boolean NOT NULL,
    is_staff boolean NOT NULL,
    coins integer,
    first_name character varying(50),
    last_name character varying(50),
    patronymic character varying(50),
    role character varying(50),
    images character varying(100)
);


ALTER TABLE public.users_user OWNER TO postgres;

--
-- Name: users_user_groups; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users_user_groups (
    id bigint NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.users_user_groups OWNER TO postgres;

--
-- Name: users_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_groups_id_seq OWNER TO postgres;

--
-- Name: users_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_user_groups_id_seq OWNED BY public.users_user_groups.id;


--
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_id_seq OWNER TO postgres;

--
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users_user.id;


--
-- Name: users_user_user_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users_user_user_permissions (
    id bigint NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.users_user_user_permissions OWNER TO postgres;

--
-- Name: users_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_user_permissions_id_seq OWNER TO postgres;

--
-- Name: users_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_user_user_permissions_id_seq OWNED BY public.users_user_user_permissions.id;


--
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- Name: events_event id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.events_event ALTER COLUMN id SET DEFAULT nextval('public.events_event_id_seq'::regclass);


--
-- Name: users_user id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users_user ALTER COLUMN id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Name: users_user_groups id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users_user_groups ALTER COLUMN id SET DEFAULT nextval('public.users_user_groups_id_seq'::regclass);


--
-- Name: users_user_user_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.users_user_user_permissions_id_seq'::regclass);


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_group (id, name) FROM stdin;
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add log entry	1	add_logentry
2	Can change log entry	1	change_logentry
3	Can delete log entry	1	delete_logentry
4	Can view log entry	1	view_logentry
5	Can add permission	2	add_permission
6	Can change permission	2	change_permission
7	Can delete permission	2	delete_permission
8	Can view permission	2	view_permission
9	Can add group	3	add_group
10	Can change group	3	change_group
11	Can delete group	3	delete_group
12	Can view group	3	view_group
13	Can add content type	4	add_contenttype
14	Can change content type	4	change_contenttype
15	Can delete content type	4	delete_contenttype
16	Can view content type	4	view_contenttype
17	Can add session	5	add_session
18	Can change session	5	change_session
19	Can delete session	5	delete_session
20	Can view session	5	view_session
21	Can add user	6	add_user
22	Can change user	6	change_user
23	Can delete user	6	delete_user
24	Can view user	6	view_user
25	Can add auth token	7	add_authtoken
26	Can change auth token	7	change_authtoken
27	Can delete auth token	7	delete_authtoken
28	Can view auth token	7	view_authtoken
29	Can add event	8	add_event
30	Can change event	8	change_event
31	Can delete event	8	delete_event
32	Can view event	8	view_event
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
2	auth	permission
3	auth	group
4	contenttypes	contenttype
5	sessions	session
6	users	user
7	knox	authtoken
8	events	event
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2022-10-07 21:40:48.315619+05
2	contenttypes	0002_remove_content_type_name	2022-10-07 21:40:48.326621+05
3	auth	0001_initial	2022-10-07 21:40:48.380646+05
4	auth	0002_alter_permission_name_max_length	2022-10-07 21:40:48.384647+05
5	auth	0003_alter_user_email_max_length	2022-10-07 21:40:48.389648+05
6	auth	0004_alter_user_username_opts	2022-10-07 21:40:48.394648+05
7	auth	0005_alter_user_last_login_null	2022-10-07 21:40:48.398649+05
8	auth	0006_require_contenttypes_0002	2022-10-07 21:40:48.40065+05
9	auth	0007_alter_validators_add_error_messages	2022-10-07 21:40:48.405651+05
10	auth	0008_alter_user_username_max_length	2022-10-07 21:40:48.409654+05
11	auth	0009_alter_user_last_name_max_length	2022-10-07 21:40:48.414656+05
12	auth	0010_alter_group_name_max_length	2022-10-07 21:40:48.421657+05
13	auth	0011_update_proxy_permissions	2022-10-07 21:40:48.426659+05
14	auth	0012_alter_user_first_name_max_length	2022-10-07 21:40:48.430659+05
15	users	0001_initial	2022-10-07 21:40:48.485201+05
16	admin	0001_initial	2022-10-07 21:40:48.511814+05
17	admin	0002_logentry_remove_auto_add	2022-10-07 21:40:48.518816+05
18	admin	0003_logentry_add_action_flag_choices	2022-10-07 21:40:48.524817+05
19	sessions	0001_initial	2022-10-07 21:40:48.540821+05
20	knox	0001_initial	2022-10-07 23:11:04.533418+05
21	knox	0002_auto_20150916_1425	2022-10-07 23:11:04.563006+05
22	knox	0003_auto_20150916_1526	2022-10-07 23:11:04.577009+05
23	knox	0004_authtoken_expires	2022-10-07 23:11:04.584011+05
24	knox	0005_authtoken_token_key	2022-10-07 23:11:04.597013+05
25	knox	0006_auto_20160818_0932	2022-10-07 23:11:04.619876+05
26	knox	0007_auto_20190111_0542	2022-10-07 23:11:04.627879+05
27	knox	0008_remove_authtoken_salt	2022-10-07 23:11:04.635882+05
28	users	0002_auto_20221008_0113	2022-10-08 01:13:41.443291+05
29	events	0001_initial	2022-10-08 01:50:02.261505+05
30	events	0002_event_participants	2022-10-08 02:06:18.275435+05
31	events	0003_alter_event_description	2022-10-08 02:09:55.787537+05
32	events	0004_auto_20221008_0233	2022-10-08 02:33:23.551653+05
33	events	0005_auto_20221008_1519	2022-10-08 15:19:54.91478+05
34	events	0006_event_slug	2022-10-08 16:02:20.269437+05
35	events	0007_alter_event_prize	2022-10-08 19:14:44.008245+05
36	events	0008_auto_20221008_2108	2022-10-08 21:08:59.940116+05
37	users	0003_user_images	2022-10-08 21:08:59.954089+05
38	events	0009_alter_event_image	2022-10-08 21:54:47.636071+05
39	events	0010_auto_20221008_2202	2022-10-08 22:02:34.168614+05
40	events	0011_auto_20221008_2205	2022-10-08 22:05:36.229595+05
41	events	0012_auto_20221008_2218	2022-10-08 22:18:10.111963+05
42	events	0013_alter_event_participants	2022-10-08 22:23:25.487748+05
43	events	0014_alter_event_participants	2022-10-08 23:35:49.106389+05
44	events	0015_alter_event_participants	2022-10-09 09:54:27.610145+05
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
pdrfskniuhz7s43hzm6knzpm1y970zup	.eJxVjDEOwjAMRe-SGUUxTonKyM4ZIjt2SAElUtNOiLtDpQ6w_vfef5lI61Li2nWOk5izGc3hd2NKD60bkDvVW7Op1WWe2G6K3Wm31yb6vOzu30GhXr41sBIMhC6zBvYEDpCUWSgw4qjgPafBYQqi5NkpiMsZ0Yd0PGVS8_4AEpk5Ig:1ogsCD:_Z8xdTyk84L6PFsfb0iFIdIuKYMHV4HpvqWWXq8m6tM	2022-10-21 23:35:41.308518+05
8pv142hca8kxfnzstcitcxaqa7bbecfd	.eJxVjDEOwjAMRe-SGUUxTonKyM4ZIjt2SAElUtNOiLtDpQ6w_vfef5lI61Li2nWOk5izGc3hd2NKD60bkDvVW7Op1WWe2G6K3Wm31yb6vOzu30GhXr41sBIMhC6zBvYEDpCUWSgw4qjgPafBYQqi5NkpiMsZ0Yd0PGVS8_4AEpk5Ig:1ohEkv:3-xd6uZq53jEuAGgOntGCpwTq9tVhBKnNuupR5WDznI	2022-10-22 23:41:01.907041+05
\.


--
-- Data for Name: events_event; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.events_event (id, title, description, datetime, prize, comment, image, creator, slug, likes, participants) FROM stdin;
13	fortnite	Командный турнир по игре fortnite. Вход платный, 1000 гривен.	\N	22000	\N	https://fs-prod-cdn.nintendo-europe.com/media/images/10_share_images/games_15/nintendo_switch_download_software_1/2x1_NSwitchDS_Fortnite_image1600w.jpg	\N	fort_slug	\N	{1,2,5,10,10}
4	Убить босса	Легендарное убийство своего начальника. Всего за 5 минут вы сможете...	2022-10-28 18:24:11.679+05	1231	string	https://i.ytimg.com/vi/rli3-Q9gpjQ/maxresdefault.jpg	1	kill	\N	{1,5,4,3,6,10,10}
14	ВЫЕЗД НА ПРИРОДУ НА ШАШЛЫЧОК	Будем шашлычок под конъячок	\N	2000	\N	https://img.povar.ru/main/4a/07/fe/9d/shashlichok_na_skovorode-134821.jpg	\N	bbq	\N	{10}
10	Заполнение матрицы по спирали	На вход программе подаются два натуральных числа n и m. Напишите программу, которая создает матрицу размером n х m, заполнив ее по спирали числами от 1 до n x m. Спираль начинается в левом верхнем углу и закручивается по часовой стрелке.	\N	22222	\N	https://timeweb.com/media/articles/0001/08/thumb_7309_articles_standart.jpeg	\N	222223	\N	{1,10,10,10}
2	Продам гараж	Продается гараж не бит не крашен, пробег 4 мужика, состояние огонь, вложений не требует	2022-10-11 02:18:27.596+05	1000	Гараж что надо		2	second_event	\N	{1,10,10,10}
15	Молоко 10л.	Будем шашлычок под конъячок	\N	2000	\N	https://img.povar.ru/main/4a/07/fe/9d/shashlichok_na_skovorode-134821.jpg	\N	milk	\N	{10,10}
12	Продам гараж	Охрана, видео наблюдения. Яма овощная и смотровая. Электричество	\N	222000	\N	https://doorhan.ru/upload/medialibrary/c99/c99eebfdf3eb4c8a4f1f2d50e71e2397.jpg	\N	garage_sale	\N	{1,2,10,10,10}
\.


--
-- Data for Name: knox_authtoken; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.knox_authtoken (digest, created, user_id, expiry, token_key) FROM stdin;
1c89d49e20ff890e41681a0e1c5de28ad1b54993e723b0486584cadfd70f29ff344d853ecbe58f0e8e78f61e67e6305fbfa5411d3fc184c851d3057b83590245	2022-10-07 23:11:32.494132+05	5	2022-10-08 09:11:32.494132+05	ffd1dfb1
ae4d6559d2de3105ecadb7daa74200193a9cc3c27a8dc074b2744e6dfcbd7a698f4c71b1cec69a6cbb3d44123a748bc2f2fed5dc760c2412cb8876beb813edb6	2022-10-07 23:17:06.956877+05	6	2022-10-08 09:17:06.956877+05	801baf90
59c14ffa4f25cbf764f084670e9b9670bedaec36e284629d2db9a7a44bca0cadb01601542b254dd2d8ca40789509acf1bd5ec0a59915bd96c198876493b75afe	2022-10-07 23:17:36.223929+05	6	2022-10-08 09:17:36.223929+05	3632829a
8fdae1542406a4cff183073c8de207e64268fefe1fdd1a0c4ed421cf6c890c36ebff335e376931997369e90f7fff0f3ef94db1bb713144e7f8af0b36b6477673	2022-10-07 23:26:12.023145+05	7	2022-10-08 09:26:12.023145+05	c521bfaa
546078dacb82116e3560b78fd6f9abc67b4156ab4cc4802c9c5dc5e02a2652ac488247c8738b3c917771bc58bc3eb1ccb5ad2d63b920d3d3574836850391729d	2022-10-07 23:29:41.794968+05	8	2022-10-08 09:29:41.793968+05	321ce0fe
379cba7fff5796d7b39abfca444d9c2fa5cdcd53763f65540bad3bedc1caeac1a6d0b861f3352eff8e84ee00ae4efe55d016d3329b9c4279d470f31051a565c4	2022-10-07 23:30:32.159863+05	8	2022-10-08 09:30:32.158863+05	9a58bb2a
3d538a2a0b30519583d6748d4dafb0bf0177db7fc281906e9d70ecf99c1ad19efbc3ede3345bf197fe4a8c4f1aac17eae2e103e537949db849bb23d98e8d2079	2022-10-08 19:38:20.638139+05	1	2022-10-09 05:38:20.638139+05	a796d1fa
a33ab5200a4a4fe97ef75052e3b3b226d01a8382507fae835b4901a8b74a15297c7418ee1befed742fcce67998820910f2237e2094d8bb0f2af2635adf19b328	2022-10-08 19:38:57.452173+05	1	2022-10-09 05:38:57.451172+05	72844f0d
e2d5fc19e956a9038e91572badad981840f06016ba18218afbae4f57a812fd7f6295845bf6ff1b2698fa3805b5065a9d4383e99b3233642e27d09930c4a96e18	2022-10-08 19:43:14.459207+05	1	2022-10-09 05:43:14.459207+05	f50cd25f
c59e3a70fa4bebd5b978bc541810f15eabc11759f22f138d6b0d6363cef94d54e2eb2de3d05db57deb6fc34fe90d0a92662311106e1e14bcf9adf50600943365	2022-10-08 19:44:20.985095+05	1	2022-10-09 05:44:20.984095+05	e90294e9
cb8aab5dbdb05ee7adf600edaa244846503000b00c00a59fe660b906b05b3a102041c437535789280e5fb75e47a5843c4155e0896701cf79fcadbb43ebd8b958	2022-10-08 19:46:25.998092+05	1	2022-10-09 05:46:25.998092+05	2ce5d937
3e2b7e1aeb1ddc5850d75bbe34e3c6b13a5a1b600bfc374c87a746d8bf53ad44c755cfe530a3039366e2853644360463ad39a65d02cc8da4b115d61ea459306e	2022-10-08 19:52:26.353926+05	1	2022-10-09 05:52:26.352925+05	da664c63
9df74c31112af03ab2e07a63692c5d752853d2ebda34270cd839567ff718f90e2c99cab33befaafa7159062698940f2507bf050d180e8d791b78251c8df51c0d	2022-10-08 19:54:53.667652+05	1	2022-10-09 05:54:53.667652+05	c5e9e9c9
597cba57a438734597bcccd4ff875d5947076d965c74e3c7fc4fc2060c615dfb742936d30824f843f697b8f243348d99238a29f90f74bb35f54adb7751969676	2022-10-08 20:07:47.845503+05	1	2022-10-09 06:07:47.844503+05	96c80ac3
3d277a38af0ec1bfa155c8ecb8febfddb58f7228960d8548483f10002a20929c88f6a543d65c0b04ff2c49418ca0e3f4d73a60f768ad1897350d272b959383c9	2022-10-08 20:10:00.672116+05	10	2022-10-09 06:10:00.672116+05	69b981fe
7acbde3a113378dd0d30b8f98b27353a7c5cc0e4ecad974cb2627ec1a6493f1cc651f8f95172303e2139f10d90f5252fd76ed892869018b1ec18d47f4d1f0461	2022-10-08 20:10:32.849085+05	1	2022-10-09 06:10:32.849085+05	1e189f71
233fe143bcac53a385b565cacc33a6aebcace03417d03cf195ffc7436252738c121ee2491a917c8e7e2da54c3ae974b5764ca07458a74d7953912cecebaf5841	2022-10-08 20:14:05.015808+05	12	2022-10-09 06:14:05.015808+05	1f7ceb57
013edf9feb38eeef2a8f54725c79132a8c059c8114d0f5e13c397ace5ca112fe04f255f6a41693efabffd6862f39c55ad50e51621969205dd53f5975cbf392a2	2022-10-08 20:15:00.364316+05	12	2022-10-09 06:15:00.363315+05	7ccf3a5f
a373686a7671ed777fc07d49bd0171a488b9e3462f38f16136568d889ba9e1d74861db607c88ec66f9200612ce81eb1bf9e44ecdbb739179bb41fab34ae88755	2022-10-08 20:16:34.294629+05	12	2022-10-09 06:16:34.293629+05	88b629b4
16e8e68fcc28eaf20868eab12a0d8a17e7ea510adabe7b52730e84ba9a809fbba81c0e6ea5dce3aa9bcc3dc472971ad8e90e303483258dcee09b881e3a5df90a	2022-10-08 20:16:40.329646+05	12	2022-10-09 06:16:40.329646+05	1716adf3
e463dcf1ff6b2027f42d5d636b1212b4eebed50dc1613d28bbbd1e1921c58eadfd5491e27b240ea1c20ce73b4b48ad249374840ed8ce002343c5f838888e09d1	2022-10-08 20:19:41.327155+05	13	2022-10-09 06:19:41.327155+05	792f04df
b91f6cee8c908239c5ecbebb0fe27c3c1c526e001d20da6cfb2be9d72815bdc14253fd0dccee2ac280691c57e75f5f99d431a515c564e3838a8d4eea0f04c6b5	2022-10-08 20:20:34.006613+05	13	2022-10-09 06:20:34.006613+05	912c9f13
28c281989f6974375904104a4b3929dbd48b2e34b410d9ecb97bfbd69206caa5c66e67d97f70a64e3df9e6313acb75cc63c5ec39c633e147fe39571597003cb1	2022-10-08 20:23:23.569334+05	14	2022-10-09 06:23:23.569334+05	9a06a5c6
3ab6b31dcd67988f2c55b8e6c04fbb8dee8c33f5df6a5da769ab202fa577e82c6607ad108a089b23eb944b5161f5a650da65dc35f3a78d264ca09da9424060e8	2022-10-08 20:23:43.331325+05	14	2022-10-09 06:23:43.331325+05	9fd2a630
1ace31b8da502abeef09289fdb034ef7762cfe5f2eb863b5227518c516cd09d1fa2e2adcf83ed5d23e399c686655de459a9b139d14a09e7d303f754cb2b0ce6b	2022-10-08 20:48:57.877275+05	12	2022-10-09 06:48:57.876275+05	fb9cd667
789a95a1c04d053165098b4763d339648894307d0a6eb8a211e75b2ca6f359f6c1e716b658c4cbe3c9295f9c7c463f47ef14e9c441b2f1b0dc03e35a7c511e0e	2022-10-08 20:49:29.269722+05	12	2022-10-09 06:49:29.269722+05	3a352085
fbb4165a435ecd05e0dae168a5a4df069cf83e844416816decc9020f3a33a46aee326804f58094d5e3146378e5947bfa12adb241bd1a7040443035e48607d739	2022-10-08 20:53:48.902967+05	1	2022-10-09 06:53:48.902967+05	5072b66d
b1f89be24283f6f6155b229c9767de004d8f22f98c3a50bc2d23eba449cb93f32dfe70c8e7e1639fb2078956ecd2645804b9a1841fb9bb9369247264a419f970	2022-10-08 22:20:14.737046+05	12	2022-10-09 08:20:14.737046+05	5170c187
95474ab4620359cb526da12a7d1406a304eb0f7dce462c7b8b46ec8d33fcd115052bf51c8d40a6017ee8b6aabf5e3000ef46e757af51e2a43ba9b91b15397245	2022-10-08 22:38:56.599685+05	15	2022-10-09 08:38:56.598686+05	cc5e6cfb
720207cf82d2ee5cc6304b4794f5ecbb8508258be620d70956ce2f3b80f00a99c3aa14e506836c99b3207a6c4da90b021bd8ae3a16dee27b31e29149dd44c2e0	2022-10-08 22:43:24.61033+05	15	2022-10-09 08:43:24.61033+05	8d73be8a
a686e956aa5d4fb3c6bdd8dfbeb8ec7a938ceeced286583b181e537289650fd98e11c7b14407842b2fbf403164a1104788e585481869eae10010131096899401	2022-10-08 22:43:54.858153+05	15	2022-10-09 08:43:54.858153+05	78368eb7
c90e66f8ba5bd86df1600c64fd3a1cfea77392c137535dae32937b8316bc68d4b8461fdea3da68757a03a2b671d293f8fe0cf719922a1355af479594ce8d1f69	2022-10-09 00:10:01.45248+05	12	2022-10-09 10:10:01.451481+05	8ecdc915
15f45a65264264a0ef6ea4d578afbd70272bf3d7a23ee9a2735c80107af453f855d0d83972da945b7f0377810b0b5017e32bb66e3b7c8aeac52a18603066e75d	2022-10-09 00:12:29.414763+05	12	2022-10-09 10:12:29.414763+05	36055642
a268cf5a31bf09fa547b6642cd575b1b7f967743261384d36f2d9dc3e431a728c436bbd25242e38b24272894a39179a4013f1419b2c6b16e4403d2a642ab359e	2022-10-09 00:17:25.266393+05	12	2022-10-09 10:17:25.265393+05	3e2e1883
0db966d191967e778cad7d83871802a4c3deb1909aaa4b3c9a105e49c1411590576de3765c156237c4026ff93cfe70e16b2e99c9681188d445c7676d43968ffe	2022-10-09 00:32:21.361441+05	12	2022-10-09 10:32:21.361441+05	37942a1a
48225c9da5b54fbb3f2fec59e558badcc65f4a70612110892d1e3f03d52df6ebbf3e431adfbd4e19152b19c8db992048e17501322e8b3169f5c3fd22f42e2f60	2022-10-09 01:16:27.839109+05	12	2022-10-09 11:16:27.838109+05	e929fda6
ea0bf2faced52f95e795555d5e639c7df12cb2403dbbf87bb42aa09c81c4696c919080f814ef5427bf21c8a3b4c88b9c91ce13d5313da1af3c9c45924f81808d	2022-10-09 01:28:53.846277+05	12	2022-10-09 11:28:53.846277+05	fc45292b
8dad41f24e0d53ca647e0801d0a3e8e335084c76479ceea49209130db6f2f4206dea5ac1d084ba2e97b305446e17cf64c14ee2cd5e81c6e24f79d8d2a3fb2b4b	2022-10-09 01:43:09.727164+05	10	2022-10-09 11:43:09.727164+05	00c0afc5
237b5d0d5bbe2afefa35b2e564563ec671582f55807cf1dd06783e7650e31b56381390987ae178c1d9368822a0e174d8441249185b723c54ea873e900924763c	2022-10-09 10:00:25.006761+05	10	2022-10-09 20:00:25.006761+05	8940623a
718e434a69de2f13f70ef9001370c1f3f59b2211383bf9c9021e0807fde760f5e8692d424ae9974594b8040637ea9025b386529d0158abfd9f4093b796e0109f	2022-10-09 10:11:28.633782+05	10	2022-10-09 20:11:28.633782+05	3a53a1d7
5d4f804d19eb7ac4066eee4927759a041e53b8dc73081aff1fd4895da8c523761d961445da0855480f6e0b13d2a16406fa9ddb6b7fd127ffe5e4a434b97a8e75	2022-10-09 10:14:17.054554+05	10	2022-10-09 20:14:17.054554+05	6ede947a
797eb693149d58b16fdcf0728a73b3681d5fd8e83a48c6d8992273b00aa0c0f4c8d333505fd710db60b057aa123d2f34271885c0da395c1e08d85cb562fdcb59	2022-10-09 10:15:23.547589+05	10	2022-10-09 20:15:23.54659+05	2d999489
87a05baa37077d7d7dfe018a1530f1a632af86c9976cd5c25a70023006171a2ee3a819d184a8b033bb1730bfb47d6e82307ec00d6d7e6609b97042f701484bb3	2022-10-09 10:16:09.50828+05	10	2022-10-09 20:16:09.50828+05	a10057ce
2598dd703f75125409387035c301eec462c9c4919a3081a3ede44f916485fb331cbf11da585ec9e001eae27a028060d12e297e53f90a6e6008096fa41832fad6	2022-10-09 10:17:00.147371+05	10	2022-10-09 20:17:00.147371+05	1d302643
d2d7e80a48289a6f5fbadb92d9ef1400017ef7ce0b7e323e205e08d260371c9928aab37497386cadc5861cbec9b0f993bbddd214244edd9ffd3049ac43e7e506	2022-10-09 10:21:54.056097+05	10	2022-10-09 20:21:54.056097+05	8e39f0b3
9bf3d1974b9c491129e1ec1d42ef8d9a0729f0b3f85bab1f8e0336d87c7dc07a36f92fd97ae62570b1a600d47950f0ee557efc868f617836053c9b9cb5657e24	2022-10-09 10:25:36.940901+05	10	2022-10-09 20:25:36.939901+05	28b16aa5
08c7bc0a867b87c4c7e47f7be0ce557c6e1961380f4949891b34d20c868aa9a8ec76b03bc4c7a36a8b5c4570c72a8c5e83e424ba8a77d0c023cb3b0392aa83f8	2022-10-09 10:33:31.252241+05	10	2022-10-09 20:33:31.252241+05	e319a67f
4562540c67e97f5c9a50ca98d4b983ede039f3a6e27b439176d6af2c404eb9687cbeeede90265dbbc8a4227a75775942986c16f01d5bc2d99d529e91d39a72f6	2022-10-09 10:34:09.146022+05	10	2022-10-09 20:34:09.146022+05	f294b051
6102aa2a46eb5da9943a3637a9dcb55e14c8bc962f40f481cc0075508653cd59b48d5875a8cd354872b0fc57f8f6b8f9bd080c1796cb10871bded730fe97ba4a	2022-10-09 10:47:18.816006+05	10	2022-10-09 20:47:18.815005+05	d17eb0e3
a57d234b78ec843312133654421b718ceb96198349c6a5f34a93c159cdb51c56d351982c3066e460dbec314b8e4cc5c3b87852329f1f1766c435d0e0560d8a7f	2022-10-09 10:51:34.726837+05	10	2022-10-09 20:51:34.726837+05	171fabd0
188e8ace9016c893b83c838d5bba9c86843ff0c2ead8c2df7bc0466ee55b3c7ff336cc78684c551232741287fa8e9d9e6eb4aef67e48944f98a9e8cd1d0e280b	2022-10-09 11:06:12.688635+05	10	2022-10-09 21:06:12.688635+05	d55aad69
29d796240f4aff89f660718efae39a74b5a4364fb4d15d58cd26da367e2c6bcee171124f87d8561b123d913645537b73931fa9e10b3fc4345b5329f79f3e589f	2022-10-09 11:06:37.72472+05	10	2022-10-09 21:06:37.72472+05	8e300595
30d0e91bc1391d95aad42c90b9e55e9faf03fc020773f116853bb7390d02b5912c9d3e30a368556a3aacea630d8d79a4eaba205834fba97d3e38961cefcd3d9b	2022-10-09 11:06:44.48518+05	10	2022-10-09 21:06:44.48518+05	ebd9f071
2333be6bad8ab8d709e06433cce5ca1262f66c27a98d51d9fe0fc0d9b97ac225a7179c9af84336488205c7cecc6ff94a5c8d30155b88f06e3524ddd8a867f777	2022-10-09 11:11:23.235024+05	10	2022-10-09 21:11:23.235024+05	45230300
a6a8b04c0ec9db50d051c76afb3123e0fad3cfa64a21de897556365217976e20093703e8008dce4d5779c7b16aaf6fd3cdef895082b8ccf4b70d939aa2c58b7d	2022-10-09 11:12:56.633165+05	10	2022-10-09 21:12:56.633165+05	3130d0b6
6d27009b4e0e05e1dbe5096c6164a8d8f1e144c1faed7e402ffc5264c5b17031a704a148668c6b4a3a6a42146535707b471d22aea04836c294c41035ef90bde3	2022-10-09 11:25:55.248065+05	10	2022-10-09 21:25:55.248065+05	c0e12fde
b80d9bfaeb278f178ebdbc7ade3ee8e79ecbe53f58b70bca73a62fa73c0e1fe1dc2156f00957b1c15372c2908d90d0a29398343cd5af2ecc217e0090801dfc39	2022-10-09 11:26:30.460286+05	10	2022-10-09 21:26:30.460286+05	ca674eff
a9d9ed56641fe6953e7c5616f99bf4856512c6751d3f9cc409f5db40fb3961efe74a18812086c6e68d903ae56cb5181063f12575123bacdd0979664c0bf89e5a	2022-10-09 11:28:29.532184+05	10	2022-10-09 21:28:29.532184+05	07ccf119
614ba3d2568da4edc2a9f96f3a91834819dcc71e28443032232c11fba7ffcaf6519e8b25ca9794d56ad65f1738339e722b8690d1145322123fcdf85cd74815a3	2022-10-09 11:55:33.587144+05	10	2022-10-09 21:55:33.586143+05	6c26c735
ca98d93eb79d1b3b3a09dbae70c01595bc381d3c77cbea89ab0bffcca3cb1b1191de8b2a12f731faecc95ba61225db0873492ae139ba5b65e90998bb7cc783bd	2022-10-09 12:01:04.32899+05	10	2022-10-09 22:01:04.32799+05	1e3d87c3
7e457082e17cbed999e90e1765ea3e212b7e4541e600c8fd9b0367d95f9bf3f068c07f9cc500cf9dcee47d09fc0b4bf30e8006fb8f512892f416b0e57ef8bb50	2022-10-09 12:04:06.124522+05	10	2022-10-09 22:04:06.124522+05	c3cf8823
73936ddd195db8f83b0a27ed1e12ec8536334801ef29740087c3ff4265a7b15d13e782e267a5db94b271c2e21d2a161692964dc01b54acdceb7d649f7d1201fe	2022-10-09 12:05:03.547219+05	10	2022-10-09 22:05:03.547219+05	e75201aa
\.


--
-- Data for Name: users_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users_user (password, last_login, is_superuser, id, username, email, is_active, is_staff, coins, first_name, last_name, patronymic, role, images) FROM stdin;
pbkdf2_sha256$260000$nBz3wgJFK03zYk42tXYURa$rBDzgVeSTou/NPRBpyvWJR4uUsmMXwHC7ql6vyPN3Xk=	\N	f	1	dich	user@example.com	t	f	\N	\N	\N	\N	\N	\N
pbkdf2_sha256$260000$SklTzLPlYEbgRBJnby5am1$WhR2SfOR+RpFNdSFzaot/gFcr/tMKh6/dUTqqZIL3DM=	\N	f	2	dich1	dich@exampe.com	t	f	\N	\N	\N	\N	\N	\N
pbkdf2_sha256$260000$fSHTcwJSM6iADV9uL6VQMA$4h6/8BYo7kfvG9Y6CrvU5aGOuSFXa6w3SrZr/+a2ShM=	\N	f	3	string	test@example.com	t	f	\N	\N	\N	\N	\N	\N
pbkdf2_sha256$260000$6RTbdgJyY1p058YFWL9jKX$6J7BxyQc8ZvRvRQ67ms2SuNCPtK3R9QNLu8naWQqKy4=	\N	f	4	ddd@example.com	ddd	t	f	\N	\N	\N	\N	\N	\N
pbkdf2_sha256$260000$4rvsyA42N7bkKroHG787td$kmeUXfIgjKE2+fAO5BNkNpvAGM2sXWPuqiHHVIBCS8I=	\N	f	5	tes@example.com	tes	t	f	\N	\N	\N	\N	\N	\N
pbkdf2_sha256$260000$6vORB8aB5Sx4MWI2abC8IT$w93MiUxczAP2rwIqQrv8ajD0//CpGa2sOr94L5uoXkc=	2022-10-07 23:17:36.22493+05	f	6	vadya@example.com	vadya	t	f	\N	\N	\N	\N	\N	\N
pbkdf2_sha256$260000$C5knNSlnqj0pxq4GouCPOx$0sORFuUn63x9th2UtR5resOOUMKQGyEf0vul6GTnC0w=	\N	f	7	ssg@example.com	ssg	t	f	\N	\N	\N	\N	\N	\N
pbkdf2_sha256$260000$yh0WIdpvj5hN8nNWFn2JtJ$yAWsW72IFzRe2/mFW8LlxebPBKCvhyLvLAQAotTMWwA=	\N	f	8	use1r@example.com	string12	t	f	\N	\N	\N	\N	\N	\N
pbkdf2_sha256$260000$kGRFN9zGZinZUpibIA3Vcr$HS7w0pzE4l73P3d0dtAMT7zZA+0IotFOFZEUIexn6dc=	\N	f	13	vadim@example.com	vadim	t	f	\N	\N	\N	\N	\N	\N
pbkdf2_sha256$260000$JRxLjQ4DK5K7odBXhNNEZX$NP7tzKel43vvjxsMMietMR5lQRXLtarAhNSBR0nlxFY=	\N	f	14	vadim1	vadi1m@example.com	t	f	\N	\N	\N	\N	\N	\N
pbkdf2_sha256$260000$9YNeTLPi6pWy4f57ek4X62$i+I3qzfDZOLef17SPJj0wa4AaPbvIcp6QNG8AJVOpqI=	\N	f	12	Max1	RazeTheShadow1@yandex.ru	t	f	\N	\N	\N	\N	\N	\N
pbkdf2_sha256$260000$uCqPbkqy32yVSQELVICnu2$WFA85WGTD+kN4umoMgmGAF302a1YnSz1NlRv1T3V+2I=	\N	f	15	test	vadya_i@mail.ru	t	f	\N	\N	\N	\N	\N	
pbkdf2_sha256$260000$lFxZY7WzRcsOuqViLonqpt$ezfVnmN9darXrqZHy2M1hyUwB/0gNNVWgol5rYNxWow=	\N	t	10	Max	RazeTheShadow@yandex.ru	t	f	\N	\N	\N	\N	\N	\N
pbkdf2_sha256$260000$S4CqlaYx3vowH4W9TFog0f$yliuTzTNsNMV2mOPJ0kSECT8+YmbRyy7JD1rZUQ08Zc=	2022-10-08 23:41:01.90504+05	t	9	vadya	vadya_i@mail.ruc	t	t	15090	\N	\N	\N	\N	\N
\.


--
-- Data for Name: users_user_groups; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Data for Name: users_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 32, true);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 1, false);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 8, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 44, true);


--
-- Name: events_event_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.events_event_id_seq', 15, true);


--
-- Name: users_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_user_groups_id_seq', 1, false);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_user_id_seq', 15, true);


--
-- Name: users_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_user_user_permissions_id_seq', 1, false);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: events_event events_event_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.events_event
    ADD CONSTRAINT events_event_pkey PRIMARY KEY (id);


--
-- Name: events_event events_event_slug_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.events_event
    ADD CONSTRAINT events_event_slug_key UNIQUE (slug);


--
-- Name: knox_authtoken knox_authtoken_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.knox_authtoken
    ADD CONSTRAINT knox_authtoken_pkey PRIMARY KEY (digest);


--
-- Name: users_user users_user_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users_user
    ADD CONSTRAINT users_user_email_key UNIQUE (email);


--
-- Name: users_user_groups users_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users_user_groups
    ADD CONSTRAINT users_user_groups_pkey PRIMARY KEY (id);


--
-- Name: users_user_groups users_user_groups_user_id_group_id_b88eab82_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users_user_groups
    ADD CONSTRAINT users_user_groups_user_id_group_id_b88eab82_uniq UNIQUE (user_id, group_id);


--
-- Name: users_user users_user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users_user
    ADD CONSTRAINT users_user_pkey PRIMARY KEY (id);


--
-- Name: users_user_user_permissions users_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users_user_user_permissions
    ADD CONSTRAINT users_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: users_user_user_permissions users_user_user_permissions_user_id_permission_id_43338c45_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users_user_user_permissions
    ADD CONSTRAINT users_user_user_permissions_user_id_permission_id_43338c45_uniq UNIQUE (user_id, permission_id);


--
-- Name: users_user users_user_username_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users_user
    ADD CONSTRAINT users_user_username_key UNIQUE (username);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: events_event_slug_b44b2c04_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX events_event_slug_b44b2c04_like ON public.events_event USING btree (slug varchar_pattern_ops);


--
-- Name: knox_authtoken_digest_188c7e77_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX knox_authtoken_digest_188c7e77_like ON public.knox_authtoken USING btree (digest varchar_pattern_ops);


--
-- Name: knox_authtoken_token_key_8f4f7d47; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX knox_authtoken_token_key_8f4f7d47 ON public.knox_authtoken USING btree (token_key);


--
-- Name: knox_authtoken_token_key_8f4f7d47_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX knox_authtoken_token_key_8f4f7d47_like ON public.knox_authtoken USING btree (token_key varchar_pattern_ops);


--
-- Name: knox_authtoken_user_id_e5a5d899; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX knox_authtoken_user_id_e5a5d899 ON public.knox_authtoken USING btree (user_id);


--
-- Name: users_user_email_243f6e77_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX users_user_email_243f6e77_like ON public.users_user USING btree (email varchar_pattern_ops);


--
-- Name: users_user_groups_group_id_9afc8d0e; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX users_user_groups_group_id_9afc8d0e ON public.users_user_groups USING btree (group_id);


--
-- Name: users_user_groups_user_id_5f6f5a90; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX users_user_groups_user_id_5f6f5a90 ON public.users_user_groups USING btree (user_id);


--
-- Name: users_user_user_permissions_permission_id_0b93982e; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX users_user_user_permissions_permission_id_0b93982e ON public.users_user_user_permissions USING btree (permission_id);


--
-- Name: users_user_user_permissions_user_id_20aca447; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX users_user_user_permissions_user_id_20aca447 ON public.users_user_user_permissions USING btree (user_id);


--
-- Name: users_user_username_06e46fe6_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX users_user_username_06e46fe6_like ON public.users_user USING btree (username varchar_pattern_ops);


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_users_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_users_user_id FOREIGN KEY (user_id) REFERENCES public.users_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: knox_authtoken knox_authtoken_user_id_e5a5d899_fk_users_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.knox_authtoken
    ADD CONSTRAINT knox_authtoken_user_id_e5a5d899_fk_users_user_id FOREIGN KEY (user_id) REFERENCES public.users_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: users_user_groups users_user_groups_group_id_9afc8d0e_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users_user_groups
    ADD CONSTRAINT users_user_groups_group_id_9afc8d0e_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: users_user_groups users_user_groups_user_id_5f6f5a90_fk_users_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users_user_groups
    ADD CONSTRAINT users_user_groups_user_id_5f6f5a90_fk_users_user_id FOREIGN KEY (user_id) REFERENCES public.users_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: users_user_user_permissions users_user_user_perm_permission_id_0b93982e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users_user_user_permissions
    ADD CONSTRAINT users_user_user_perm_permission_id_0b93982e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: users_user_user_permissions users_user_user_permissions_user_id_20aca447_fk_users_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users_user_user_permissions
    ADD CONSTRAINT users_user_user_permissions_user_id_20aca447_fk_users_user_id FOREIGN KEY (user_id) REFERENCES public.users_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

