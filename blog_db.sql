PGDMP                         w            blog    10.9    10.9 �    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                       false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                       false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                       false            �           1262    16858    blog    DATABASE     �   CREATE DATABASE blog WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'Russian_Russia.1251' LC_CTYPE = 'Russian_Russia.1251';
    DROP DATABASE blog;
             blog    false                        2615    2200    public    SCHEMA        CREATE SCHEMA public;
    DROP SCHEMA public;
             postgres    false            �           0    0    SCHEMA public    COMMENT     6   COMMENT ON SCHEMA public IS 'standard public schema';
                  postgres    false    3                        3079    12924    plpgsql 	   EXTENSION     ?   CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;
    DROP EXTENSION plpgsql;
                  false            �           0    0    EXTENSION plpgsql    COMMENT     @   COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';
                       false    1            �            1259    16890 
   auth_group    TABLE     f   CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);
    DROP TABLE public.auth_group;
       public         blog    false    3            �            1259    16888    auth_group_id_seq    SEQUENCE     �   CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.auth_group_id_seq;
       public       blog    false    203    3            �           0    0    auth_group_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;
            public       blog    false    202            �            1259    16900    auth_group_permissions    TABLE     �   CREATE TABLE public.auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);
 *   DROP TABLE public.auth_group_permissions;
       public         blog    false    3            �            1259    16898    auth_group_permissions_id_seq    SEQUENCE     �   CREATE SEQUENCE public.auth_group_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE public.auth_group_permissions_id_seq;
       public       blog    false    3    205            �           0    0    auth_group_permissions_id_seq    SEQUENCE OWNED BY     _   ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;
            public       blog    false    204            �            1259    16882    auth_permission    TABLE     �   CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);
 #   DROP TABLE public.auth_permission;
       public         blog    false    3            �            1259    16880    auth_permission_id_seq    SEQUENCE     �   CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.auth_permission_id_seq;
       public       blog    false    201    3            �           0    0    auth_permission_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;
            public       blog    false    200            �            1259    16908 	   auth_user    TABLE     �  CREATE TABLE public.auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(30) NOT NULL,
    last_name character varying(150) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);
    DROP TABLE public.auth_user;
       public         blog    false    3            �            1259    16918    auth_user_groups    TABLE        CREATE TABLE public.auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);
 $   DROP TABLE public.auth_user_groups;
       public         blog    false    3            �            1259    16916    auth_user_groups_id_seq    SEQUENCE     �   CREATE SEQUENCE public.auth_user_groups_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.auth_user_groups_id_seq;
       public       blog    false    209    3            �           0    0    auth_user_groups_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.auth_user_groups_id_seq OWNED BY public.auth_user_groups.id;
            public       blog    false    208            �            1259    16906    auth_user_id_seq    SEQUENCE     �   CREATE SEQUENCE public.auth_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.auth_user_id_seq;
       public       blog    false    207    3            �           0    0    auth_user_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.auth_user_id_seq OWNED BY public.auth_user.id;
            public       blog    false    206            �            1259    16926    auth_user_user_permissions    TABLE     �   CREATE TABLE public.auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);
 .   DROP TABLE public.auth_user_user_permissions;
       public         blog    false    3            �            1259    16924 !   auth_user_user_permissions_id_seq    SEQUENCE     �   CREATE SEQUENCE public.auth_user_user_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 8   DROP SEQUENCE public.auth_user_user_permissions_id_seq;
       public       blog    false    3    211            �           0    0 !   auth_user_user_permissions_id_seq    SEQUENCE OWNED BY     g   ALTER SEQUENCE public.auth_user_user_permissions_id_seq OWNED BY public.auth_user_user_permissions.id;
            public       blog    false    210            �            1259    17076    blog_comment    TABLE     C  CREATE TABLE public.blog_comment (
    id integer NOT NULL,
    name character varying(80) NOT NULL,
    email character varying(254) NOT NULL,
    body text NOT NULL,
    created timestamp with time zone NOT NULL,
    updated timestamp with time zone NOT NULL,
    active boolean NOT NULL,
    post_id integer NOT NULL
);
     DROP TABLE public.blog_comment;
       public         blog    false    3            �            1259    17074    blog_comment_id_seq    SEQUENCE     �   CREATE SEQUENCE public.blog_comment_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.blog_comment_id_seq;
       public       blog    false    3    221            �           0    0    blog_comment_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.blog_comment_id_seq OWNED BY public.blog_comment.id;
            public       blog    false    220            �            1259    17057 	   blog_post    TABLE     �  CREATE TABLE public.blog_post (
    id integer NOT NULL,
    title character varying(250) NOT NULL,
    slug character varying(250) NOT NULL,
    body text NOT NULL,
    publish timestamp with time zone NOT NULL,
    created timestamp with time zone NOT NULL,
    updated timestamp with time zone NOT NULL,
    status character varying(10) NOT NULL,
    author_id integer NOT NULL
);
    DROP TABLE public.blog_post;
       public         blog    false    3            �            1259    17055    blog_post_id_seq    SEQUENCE     �   CREATE SEQUENCE public.blog_post_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.blog_post_id_seq;
       public       blog    false    3    219            �           0    0    blog_post_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.blog_post_id_seq OWNED BY public.blog_post.id;
            public       blog    false    218            �            1259    16986    django_admin_log    TABLE     �  CREATE TABLE public.django_admin_log (
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
 $   DROP TABLE public.django_admin_log;
       public         blog    false    3            �            1259    16984    django_admin_log_id_seq    SEQUENCE     �   CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.django_admin_log_id_seq;
       public       blog    false    3    213            �           0    0    django_admin_log_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;
            public       blog    false    212            �            1259    16872    django_content_type    TABLE     �   CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);
 '   DROP TABLE public.django_content_type;
       public         blog    false    3            �            1259    16870    django_content_type_id_seq    SEQUENCE     �   CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.django_content_type_id_seq;
       public       blog    false    199    3            �           0    0    django_content_type_id_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;
            public       blog    false    198            �            1259    16861    django_migrations    TABLE     �   CREATE TABLE public.django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);
 %   DROP TABLE public.django_migrations;
       public         blog    false    3            �            1259    16859    django_migrations_id_seq    SEQUENCE     �   CREATE SEQUENCE public.django_migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.django_migrations_id_seq;
       public       blog    false    197    3            �           0    0    django_migrations_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;
            public       blog    false    196            �            1259    17091    django_session    TABLE     �   CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);
 "   DROP TABLE public.django_session;
       public         blog    false    3            �            1259    17103    django_site    TABLE     �   CREATE TABLE public.django_site (
    id integer NOT NULL,
    domain character varying(100) NOT NULL,
    name character varying(50) NOT NULL
);
    DROP TABLE public.django_site;
       public         blog    false    3            �            1259    17101    django_site_id_seq    SEQUENCE     �   CREATE SEQUENCE public.django_site_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.django_site_id_seq;
       public       blog    false    3    224            �           0    0    django_site_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.django_site_id_seq OWNED BY public.django_site.id;
            public       blog    false    223            �            1259    17019 
   taggit_tag    TABLE     �   CREATE TABLE public.taggit_tag (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    slug character varying(100) NOT NULL
);
    DROP TABLE public.taggit_tag;
       public         blog    false    3            �            1259    17017    taggit_tag_id_seq    SEQUENCE     �   CREATE SEQUENCE public.taggit_tag_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.taggit_tag_id_seq;
       public       blog    false    3    215            �           0    0    taggit_tag_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.taggit_tag_id_seq OWNED BY public.taggit_tag.id;
            public       blog    false    214            �            1259    17031    taggit_taggeditem    TABLE     �   CREATE TABLE public.taggit_taggeditem (
    id integer NOT NULL,
    object_id integer NOT NULL,
    content_type_id integer NOT NULL,
    tag_id integer NOT NULL
);
 %   DROP TABLE public.taggit_taggeditem;
       public         blog    false    3            �            1259    17029    taggit_taggeditem_id_seq    SEQUENCE     �   CREATE SEQUENCE public.taggit_taggeditem_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.taggit_taggeditem_id_seq;
       public       blog    false    217    3            �           0    0    taggit_taggeditem_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.taggit_taggeditem_id_seq OWNED BY public.taggit_taggeditem.id;
            public       blog    false    216            �
           2604    16893    auth_group id    DEFAULT     n   ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);
 <   ALTER TABLE public.auth_group ALTER COLUMN id DROP DEFAULT;
       public       blog    false    202    203    203            �
           2604    16903    auth_group_permissions id    DEFAULT     �   ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);
 H   ALTER TABLE public.auth_group_permissions ALTER COLUMN id DROP DEFAULT;
       public       blog    false    204    205    205            �
           2604    16885    auth_permission id    DEFAULT     x   ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);
 A   ALTER TABLE public.auth_permission ALTER COLUMN id DROP DEFAULT;
       public       blog    false    201    200    201            �
           2604    16911    auth_user id    DEFAULT     l   ALTER TABLE ONLY public.auth_user ALTER COLUMN id SET DEFAULT nextval('public.auth_user_id_seq'::regclass);
 ;   ALTER TABLE public.auth_user ALTER COLUMN id DROP DEFAULT;
       public       blog    false    206    207    207            �
           2604    16921    auth_user_groups id    DEFAULT     z   ALTER TABLE ONLY public.auth_user_groups ALTER COLUMN id SET DEFAULT nextval('public.auth_user_groups_id_seq'::regclass);
 B   ALTER TABLE public.auth_user_groups ALTER COLUMN id DROP DEFAULT;
       public       blog    false    208    209    209            �
           2604    16929    auth_user_user_permissions id    DEFAULT     �   ALTER TABLE ONLY public.auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_user_user_permissions_id_seq'::regclass);
 L   ALTER TABLE public.auth_user_user_permissions ALTER COLUMN id DROP DEFAULT;
       public       blog    false    211    210    211            �
           2604    17079    blog_comment id    DEFAULT     r   ALTER TABLE ONLY public.blog_comment ALTER COLUMN id SET DEFAULT nextval('public.blog_comment_id_seq'::regclass);
 >   ALTER TABLE public.blog_comment ALTER COLUMN id DROP DEFAULT;
       public       blog    false    220    221    221            �
           2604    17060    blog_post id    DEFAULT     l   ALTER TABLE ONLY public.blog_post ALTER COLUMN id SET DEFAULT nextval('public.blog_post_id_seq'::regclass);
 ;   ALTER TABLE public.blog_post ALTER COLUMN id DROP DEFAULT;
       public       blog    false    218    219    219            �
           2604    16989    django_admin_log id    DEFAULT     z   ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);
 B   ALTER TABLE public.django_admin_log ALTER COLUMN id DROP DEFAULT;
       public       blog    false    213    212    213            �
           2604    16875    django_content_type id    DEFAULT     �   ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);
 E   ALTER TABLE public.django_content_type ALTER COLUMN id DROP DEFAULT;
       public       blog    false    199    198    199            �
           2604    16864    django_migrations id    DEFAULT     |   ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);
 C   ALTER TABLE public.django_migrations ALTER COLUMN id DROP DEFAULT;
       public       blog    false    197    196    197            �
           2604    17106    django_site id    DEFAULT     p   ALTER TABLE ONLY public.django_site ALTER COLUMN id SET DEFAULT nextval('public.django_site_id_seq'::regclass);
 =   ALTER TABLE public.django_site ALTER COLUMN id DROP DEFAULT;
       public       blog    false    223    224    224            �
           2604    17022    taggit_tag id    DEFAULT     n   ALTER TABLE ONLY public.taggit_tag ALTER COLUMN id SET DEFAULT nextval('public.taggit_tag_id_seq'::regclass);
 <   ALTER TABLE public.taggit_tag ALTER COLUMN id DROP DEFAULT;
       public       blog    false    215    214    215            �
           2604    17034    taggit_taggeditem id    DEFAULT     |   ALTER TABLE ONLY public.taggit_taggeditem ALTER COLUMN id SET DEFAULT nextval('public.taggit_taggeditem_id_seq'::regclass);
 C   ALTER TABLE public.taggit_taggeditem ALTER COLUMN id DROP DEFAULT;
       public       blog    false    217    216    217            �          0    16890 
   auth_group 
   TABLE DATA               .   COPY public.auth_group (id, name) FROM stdin;
    public       blog    false    203   m�       �          0    16900    auth_group_permissions 
   TABLE DATA               M   COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
    public       blog    false    205   ��       �          0    16882    auth_permission 
   TABLE DATA               N   COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
    public       blog    false    201   ��       �          0    16908 	   auth_user 
   TABLE DATA               �   COPY public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
    public       blog    false    207   m�       �          0    16918    auth_user_groups 
   TABLE DATA               A   COPY public.auth_user_groups (id, user_id, group_id) FROM stdin;
    public       blog    false    209   ��       �          0    16926    auth_user_user_permissions 
   TABLE DATA               P   COPY public.auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
    public       blog    false    211   ��       �          0    17076    blog_comment 
   TABLE DATA               `   COPY public.blog_comment (id, name, email, body, created, updated, active, post_id) FROM stdin;
    public       blog    false    221   ��       �          0    17057 	   blog_post 
   TABLE DATA               h   COPY public.blog_post (id, title, slug, body, publish, created, updated, status, author_id) FROM stdin;
    public       blog    false    219   ��       �          0    16986    django_admin_log 
   TABLE DATA               �   COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
    public       blog    false    213   ��       �          0    16872    django_content_type 
   TABLE DATA               C   COPY public.django_content_type (id, app_label, model) FROM stdin;
    public       blog    false    199   ��       �          0    16861    django_migrations 
   TABLE DATA               C   COPY public.django_migrations (id, app, name, applied) FROM stdin;
    public       blog    false    197   ��       �          0    17091    django_session 
   TABLE DATA               P   COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
    public       blog    false    222   ��       �          0    17103    django_site 
   TABLE DATA               7   COPY public.django_site (id, domain, name) FROM stdin;
    public       blog    false    224   ��       �          0    17019 
   taggit_tag 
   TABLE DATA               4   COPY public.taggit_tag (id, name, slug) FROM stdin;
    public       blog    false    215   �       �          0    17031    taggit_taggeditem 
   TABLE DATA               S   COPY public.taggit_taggeditem (id, object_id, content_type_id, tag_id) FROM stdin;
    public       blog    false    217   i�       �           0    0    auth_group_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);
            public       blog    false    202            �           0    0    auth_group_permissions_id_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);
            public       blog    false    204            �           0    0    auth_permission_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.auth_permission_id_seq', 44, true);
            public       blog    false    200            �           0    0    auth_user_groups_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.auth_user_groups_id_seq', 1, false);
            public       blog    false    208            �           0    0    auth_user_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.auth_user_id_seq', 2, true);
            public       blog    false    206            �           0    0 !   auth_user_user_permissions_id_seq    SEQUENCE SET     P   SELECT pg_catalog.setval('public.auth_user_user_permissions_id_seq', 1, false);
            public       blog    false    210            �           0    0    blog_comment_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.blog_comment_id_seq', 8, true);
            public       blog    false    220            �           0    0    blog_post_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.blog_post_id_seq', 6, true);
            public       blog    false    218            �           0    0    django_admin_log_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.django_admin_log_id_seq', 19, true);
            public       blog    false    212            �           0    0    django_content_type_id_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.django_content_type_id_seq', 11, true);
            public       blog    false    198            �           0    0    django_migrations_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.django_migrations_id_seq', 25, true);
            public       blog    false    196            �           0    0    django_site_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.django_site_id_seq', 1, true);
            public       blog    false    223            �           0    0    taggit_tag_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.taggit_tag_id_seq', 11, true);
            public       blog    false    214            �           0    0    taggit_taggeditem_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.taggit_taggeditem_id_seq', 1, false);
            public       blog    false    216            �
           2606    17015    auth_group auth_group_name_key 
   CONSTRAINT     Y   ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);
 H   ALTER TABLE ONLY public.auth_group DROP CONSTRAINT auth_group_name_key;
       public         blog    false    203            �
           2606    16952 R   auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);
 |   ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq;
       public         blog    false    205    205            �
           2606    16905 2   auth_group_permissions auth_group_permissions_pkey 
   CONSTRAINT     p   ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);
 \   ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissions_pkey;
       public         blog    false    205            �
           2606    16895    auth_group auth_group_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.auth_group DROP CONSTRAINT auth_group_pkey;
       public         blog    false    203            �
           2606    16938 F   auth_permission auth_permission_content_type_id_codename_01ab375a_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);
 p   ALTER TABLE ONLY public.auth_permission DROP CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq;
       public         blog    false    201    201            �
           2606    16887 $   auth_permission auth_permission_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.auth_permission DROP CONSTRAINT auth_permission_pkey;
       public         blog    false    201            �
           2606    16923 &   auth_user_groups auth_user_groups_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.auth_user_groups DROP CONSTRAINT auth_user_groups_pkey;
       public         blog    false    209            �
           2606    16967 @   auth_user_groups auth_user_groups_user_id_group_id_94350c0c_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq UNIQUE (user_id, group_id);
 j   ALTER TABLE ONLY public.auth_user_groups DROP CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq;
       public         blog    false    209    209            �
           2606    16913    auth_user auth_user_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.auth_user DROP CONSTRAINT auth_user_pkey;
       public         blog    false    207            �
           2606    16931 :   auth_user_user_permissions auth_user_user_permissions_pkey 
   CONSTRAINT     x   ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);
 d   ALTER TABLE ONLY public.auth_user_user_permissions DROP CONSTRAINT auth_user_user_permissions_pkey;
       public         blog    false    211            �
           2606    16981 Y   auth_user_user_permissions auth_user_user_permissions_user_id_permission_id_14a6b632_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);
 �   ALTER TABLE ONLY public.auth_user_user_permissions DROP CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq;
       public         blog    false    211    211            �
           2606    17009     auth_user auth_user_username_key 
   CONSTRAINT     _   ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);
 J   ALTER TABLE ONLY public.auth_user DROP CONSTRAINT auth_user_username_key;
       public         blog    false    207                       2606    17084    blog_comment blog_comment_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.blog_comment
    ADD CONSTRAINT blog_comment_pkey PRIMARY KEY (id);
 H   ALTER TABLE ONLY public.blog_comment DROP CONSTRAINT blog_comment_pkey;
       public         blog    false    221                       2606    17065    blog_post blog_post_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.blog_post
    ADD CONSTRAINT blog_post_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.blog_post DROP CONSTRAINT blog_post_pkey;
       public         blog    false    219            �
           2606    16995 &   django_admin_log django_admin_log_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.django_admin_log DROP CONSTRAINT django_admin_log_pkey;
       public         blog    false    213            �
           2606    16879 E   django_content_type django_content_type_app_label_model_76bd3d3b_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);
 o   ALTER TABLE ONLY public.django_content_type DROP CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq;
       public         blog    false    199    199            �
           2606    16877 ,   django_content_type django_content_type_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);
 V   ALTER TABLE ONLY public.django_content_type DROP CONSTRAINT django_content_type_pkey;
       public         blog    false    199            �
           2606    16869 (   django_migrations django_migrations_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.django_migrations DROP CONSTRAINT django_migrations_pkey;
       public         blog    false    197                       2606    17098 "   django_session django_session_pkey 
   CONSTRAINT     i   ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);
 L   ALTER TABLE ONLY public.django_session DROP CONSTRAINT django_session_pkey;
       public         blog    false    222                       2606    17110 ,   django_site django_site_domain_a2e37b91_uniq 
   CONSTRAINT     i   ALTER TABLE ONLY public.django_site
    ADD CONSTRAINT django_site_domain_a2e37b91_uniq UNIQUE (domain);
 V   ALTER TABLE ONLY public.django_site DROP CONSTRAINT django_site_domain_a2e37b91_uniq;
       public         blog    false    224                        2606    17108    django_site django_site_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.django_site
    ADD CONSTRAINT django_site_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.django_site DROP CONSTRAINT django_site_pkey;
       public         blog    false    224                       2606    17026    taggit_tag taggit_tag_name_key 
   CONSTRAINT     Y   ALTER TABLE ONLY public.taggit_tag
    ADD CONSTRAINT taggit_tag_name_key UNIQUE (name);
 H   ALTER TABLE ONLY public.taggit_tag DROP CONSTRAINT taggit_tag_name_key;
       public         blog    false    215                       2606    17024    taggit_tag taggit_tag_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.taggit_tag
    ADD CONSTRAINT taggit_tag_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.taggit_tag DROP CONSTRAINT taggit_tag_pkey;
       public         blog    false    215                       2606    17028    taggit_tag taggit_tag_slug_key 
   CONSTRAINT     Y   ALTER TABLE ONLY public.taggit_tag
    ADD CONSTRAINT taggit_tag_slug_key UNIQUE (slug);
 H   ALTER TABLE ONLY public.taggit_tag DROP CONSTRAINT taggit_tag_slug_key;
       public         blog    false    215            
           2606    17054 J   taggit_taggeditem taggit_taggeditem_content_type_id_object_i_4bb97a8e_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.taggit_taggeditem
    ADD CONSTRAINT taggit_taggeditem_content_type_id_object_i_4bb97a8e_uniq UNIQUE (content_type_id, object_id, tag_id);
 t   ALTER TABLE ONLY public.taggit_taggeditem DROP CONSTRAINT taggit_taggeditem_content_type_id_object_i_4bb97a8e_uniq;
       public         blog    false    217    217    217                       2606    17036 (   taggit_taggeditem taggit_taggeditem_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.taggit_taggeditem
    ADD CONSTRAINT taggit_taggeditem_pkey PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.taggit_taggeditem DROP CONSTRAINT taggit_taggeditem_pkey;
       public         blog    false    217            �
           1259    17016    auth_group_name_a6ea08ec_like    INDEX     h   CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);
 1   DROP INDEX public.auth_group_name_a6ea08ec_like;
       public         blog    false    203            �
           1259    16953 (   auth_group_permissions_group_id_b120cbf9    INDEX     o   CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);
 <   DROP INDEX public.auth_group_permissions_group_id_b120cbf9;
       public         blog    false    205            �
           1259    16954 -   auth_group_permissions_permission_id_84c5c92e    INDEX     y   CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);
 A   DROP INDEX public.auth_group_permissions_permission_id_84c5c92e;
       public         blog    false    205            �
           1259    16939 (   auth_permission_content_type_id_2f476e4b    INDEX     o   CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);
 <   DROP INDEX public.auth_permission_content_type_id_2f476e4b;
       public         blog    false    201            �
           1259    16969 "   auth_user_groups_group_id_97559544    INDEX     c   CREATE INDEX auth_user_groups_group_id_97559544 ON public.auth_user_groups USING btree (group_id);
 6   DROP INDEX public.auth_user_groups_group_id_97559544;
       public         blog    false    209            �
           1259    16968 !   auth_user_groups_user_id_6a12ed8b    INDEX     a   CREATE INDEX auth_user_groups_user_id_6a12ed8b ON public.auth_user_groups USING btree (user_id);
 5   DROP INDEX public.auth_user_groups_user_id_6a12ed8b;
       public         blog    false    209            �
           1259    16983 1   auth_user_user_permissions_permission_id_1fbb5f2c    INDEX     �   CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON public.auth_user_user_permissions USING btree (permission_id);
 E   DROP INDEX public.auth_user_user_permissions_permission_id_1fbb5f2c;
       public         blog    false    211            �
           1259    16982 +   auth_user_user_permissions_user_id_a95ead1b    INDEX     u   CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON public.auth_user_user_permissions USING btree (user_id);
 ?   DROP INDEX public.auth_user_user_permissions_user_id_a95ead1b;
       public         blog    false    211            �
           1259    17010     auth_user_username_6821ab7c_like    INDEX     n   CREATE INDEX auth_user_username_6821ab7c_like ON public.auth_user USING btree (username varchar_pattern_ops);
 4   DROP INDEX public.auth_user_username_6821ab7c_like;
       public         blog    false    207                       1259    17090    blog_comment_post_id_580e96ef    INDEX     Y   CREATE INDEX blog_comment_post_id_580e96ef ON public.blog_comment USING btree (post_id);
 1   DROP INDEX public.blog_comment_post_id_580e96ef;
       public         blog    false    221                       1259    17073    blog_post_author_id_dd7a8485    INDEX     W   CREATE INDEX blog_post_author_id_dd7a8485 ON public.blog_post USING btree (author_id);
 0   DROP INDEX public.blog_post_author_id_dd7a8485;
       public         blog    false    219                       1259    17071    blog_post_slug_b95473f2    INDEX     M   CREATE INDEX blog_post_slug_b95473f2 ON public.blog_post USING btree (slug);
 +   DROP INDEX public.blog_post_slug_b95473f2;
       public         blog    false    219                       1259    17072    blog_post_slug_b95473f2_like    INDEX     f   CREATE INDEX blog_post_slug_b95473f2_like ON public.blog_post USING btree (slug varchar_pattern_ops);
 0   DROP INDEX public.blog_post_slug_b95473f2_like;
       public         blog    false    219            �
           1259    17006 )   django_admin_log_content_type_id_c4bce8eb    INDEX     q   CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);
 =   DROP INDEX public.django_admin_log_content_type_id_c4bce8eb;
       public         blog    false    213            �
           1259    17007 !   django_admin_log_user_id_c564eba6    INDEX     a   CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);
 5   DROP INDEX public.django_admin_log_user_id_c564eba6;
       public         blog    false    213                       1259    17100 #   django_session_expire_date_a5c62663    INDEX     e   CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);
 7   DROP INDEX public.django_session_expire_date_a5c62663;
       public         blog    false    222                       1259    17099 (   django_session_session_key_c0390e0f_like    INDEX     ~   CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);
 <   DROP INDEX public.django_session_session_key_c0390e0f_like;
       public         blog    false    222                       1259    17111     django_site_domain_a2e37b91_like    INDEX     n   CREATE INDEX django_site_domain_a2e37b91_like ON public.django_site USING btree (domain varchar_pattern_ops);
 4   DROP INDEX public.django_site_domain_a2e37b91_like;
       public         blog    false    224                        1259    17037    taggit_tag_name_58eb2ed9_like    INDEX     h   CREATE INDEX taggit_tag_name_58eb2ed9_like ON public.taggit_tag USING btree (name varchar_pattern_ops);
 1   DROP INDEX public.taggit_tag_name_58eb2ed9_like;
       public         blog    false    215                       1259    17038    taggit_tag_slug_6be58b2c_like    INDEX     h   CREATE INDEX taggit_tag_slug_6be58b2c_like ON public.taggit_tag USING btree (slug varchar_pattern_ops);
 1   DROP INDEX public.taggit_tag_slug_6be58b2c_like;
       public         blog    false    215                       1259    17050 *   taggit_taggeditem_content_type_id_9957a03c    INDEX     s   CREATE INDEX taggit_taggeditem_content_type_id_9957a03c ON public.taggit_taggeditem USING btree (content_type_id);
 >   DROP INDEX public.taggit_taggeditem_content_type_id_9957a03c;
       public         blog    false    217                       1259    17052 8   taggit_taggeditem_content_type_id_object_id_196cc965_idx    INDEX     �   CREATE INDEX taggit_taggeditem_content_type_id_object_id_196cc965_idx ON public.taggit_taggeditem USING btree (content_type_id, object_id);
 L   DROP INDEX public.taggit_taggeditem_content_type_id_object_id_196cc965_idx;
       public         blog    false    217    217                       1259    17049 $   taggit_taggeditem_object_id_e2d7d1df    INDEX     g   CREATE INDEX taggit_taggeditem_object_id_e2d7d1df ON public.taggit_taggeditem USING btree (object_id);
 8   DROP INDEX public.taggit_taggeditem_object_id_e2d7d1df;
       public         blog    false    217                       1259    17051 !   taggit_taggeditem_tag_id_f4f5b767    INDEX     a   CREATE INDEX taggit_taggeditem_tag_id_f4f5b767 ON public.taggit_taggeditem USING btree (tag_id);
 5   DROP INDEX public.taggit_taggeditem_tag_id_f4f5b767;
       public         blog    false    217            #           2606    16946 O   auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;
 y   ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm;
       public       blog    false    205    2783    201            "           2606    16941 P   auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;
 z   ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id;
       public       blog    false    205    203    2788            !           2606    16932 E   auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;
 o   ALTER TABLE ONLY public.auth_permission DROP CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co;
       public       blog    false    2778    201    199            %           2606    16961 D   auth_user_groups auth_user_groups_group_id_97559544_fk_auth_group_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;
 n   ALTER TABLE ONLY public.auth_user_groups DROP CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id;
       public       blog    false    209    2788    203            $           2606    16956 B   auth_user_groups auth_user_groups_user_id_6a12ed8b_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 l   ALTER TABLE ONLY public.auth_user_groups DROP CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id;
       public       blog    false    2796    209    207            '           2606    16975 S   auth_user_user_permissions auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;
 }   ALTER TABLE ONLY public.auth_user_user_permissions DROP CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm;
       public       blog    false    201    2783    211            &           2606    16970 V   auth_user_user_permissions auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY public.auth_user_user_permissions DROP CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id;
       public       blog    false    2796    211    207            -           2606    17085 :   blog_comment blog_comment_post_id_580e96ef_fk_blog_post_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.blog_comment
    ADD CONSTRAINT blog_comment_post_id_580e96ef_fk_blog_post_id FOREIGN KEY (post_id) REFERENCES public.blog_post(id) DEFERRABLE INITIALLY DEFERRED;
 d   ALTER TABLE ONLY public.blog_comment DROP CONSTRAINT blog_comment_post_id_580e96ef_fk_blog_post_id;
       public       blog    false    2834    219    221            ,           2606    17066 6   blog_post blog_post_author_id_dd7a8485_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.blog_post
    ADD CONSTRAINT blog_post_author_id_dd7a8485_fk_auth_user_id FOREIGN KEY (author_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 `   ALTER TABLE ONLY public.blog_post DROP CONSTRAINT blog_post_author_id_dd7a8485_fk_auth_user_id;
       public       blog    false    219    2796    207            (           2606    16996 G   django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co    FK CONSTRAINT     �   ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;
 q   ALTER TABLE ONLY public.django_admin_log DROP CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co;
       public       blog    false    199    2778    213            )           2606    17001 B   django_admin_log django_admin_log_user_id_c564eba6_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 l   ALTER TABLE ONLY public.django_admin_log DROP CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id;
       public       blog    false    2796    207    213            *           2606    17039 I   taggit_taggeditem taggit_taggeditem_content_type_id_9957a03c_fk_django_co    FK CONSTRAINT     �   ALTER TABLE ONLY public.taggit_taggeditem
    ADD CONSTRAINT taggit_taggeditem_content_type_id_9957a03c_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;
 s   ALTER TABLE ONLY public.taggit_taggeditem DROP CONSTRAINT taggit_taggeditem_content_type_id_9957a03c_fk_django_co;
       public       blog    false    217    199    2778            +           2606    17044 D   taggit_taggeditem taggit_taggeditem_tag_id_f4f5b767_fk_taggit_tag_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.taggit_taggeditem
    ADD CONSTRAINT taggit_taggeditem_tag_id_f4f5b767_fk_taggit_tag_id FOREIGN KEY (tag_id) REFERENCES public.taggit_tag(id) DEFERRABLE INITIALLY DEFERRED;
 n   ALTER TABLE ONLY public.taggit_taggeditem DROP CONSTRAINT taggit_taggeditem_tag_id_f4f5b767_fk_taggit_tag_id;
       public       blog    false    217    215    2820            �      x������ � �      �      x������ � �      �   �  x�]��n� E����*��d�U�]V����b;�I��}�p��`��H\�z���������RF�����U���~�y��
�V��n��(�5�����>�P��v��m�Y�����r�c��O�d�%+
�wM�ú<�"A:ks�r1�Ý" eV� Y ���s���I`?jS��H�> � ���݈iu�i�m���½V5d��>���E0��^~�/OY�@��`M��lxՖ�qӥ�{f��0���A/a��"���o���t�Q���H��� ��Ȉ�r
s{���%�.ԕ�.���������硰bݙ&�8���MW��LdR[�5�)K%��D� �������]�u��D{r�V���)m����g'eL��G��&]�	�f��W'�g���B��Q5�_oZ����      �     x�m�Kk�P���_��]��3W�W��
�`j,	1��V����t�.:��9s���$ð;F�O��8�F?�w��vi�Px�<���\��� .S���0l�5﵋���.��A
|B�	r�b`iL54�D�I�T�wX�uKȯ�߷Z����6�`X�,f�`lK�?� �+Tv�]�\)u?�Oڊ:^P�ˊ%"�|�����'�;�go�͌�]��$��p�Җ,GEޢ�o�G0�)5�����&XT���W%I���^9      �      x������ � �      �      x������ � �      �      x����J�0�s���B��iNz�=)^��sh7���'=y�U�1d"Lq>ïodS�s]�����A~a�����b�#���,�i��`^<�x����>`�h8O������닛�A�^��q�&�@���Cu��)#�Q�(�6��/��uw������v�p�{��w^��K#ÅQ�HΚ^#r���IC�a��Ԝ��1A��Z�e�<��S��$���9/��qJ���2r^乇mj��Us�e���.nD9X{.+�6��f-���<�V�j�r��	��NL      �   �  x��SMo�0=�_1ǖ�^�o�r�%j�u��'�,�P��k�e�K�R�yüǌ�Э�z6���?�D����8e%�[�9�Bq�$�F�:̔�$�/��O�R���};6�F,�^G����|UXP��{=��$ɶ۫z�\
tsp��0�ѡ�7��G��?�ߒ��d,ƕ�|��Bg�2Fdý��ځD�{��z�`z��M��˶�b[E%�4���'�s#�<�è-�����Agp�xƧ��w�+�IV���5�-�_��I��+�V���`uG�#zh��]Ş���]圮aj]K���z��+d�KQ�M5�u�B�א����I��)	�i�f�{�B(� ?�e�0�Ӳ�Z/i7^�����g��?�}��c���/�sè6�i�H���W��ȓ�6_���7����gG��G##�(?���)�X�I����z      �   6  x����j�0ǯ���]b�e[���n�hKQj51���)�����vl�1:
�X��M��8M���%��w��[� CM �`P�1�zA�_A� �L�}�\�"�e�rp}ss朾w�H	�j�gQ-�V:)T5{IM:5q�7�0hձ|^2IO��}ߋB|�ǵ�b.�YKp/���nO�6/��L��W���LE�ܳ]<���9%B�`Ϩc��R�U�z���b��LDk&q^W�\�`��r��sI����A�5(�R�a�C3�|N���Ӎ�ot�ʬ�0��O�w�i}�Wsg��q}k�;���7�h~�?����y0����."���rJ�ϼ0
����J�K)��j����NU%���%0�ju.��y��q�����Z%K�=db��@����
��;�,�q�[*r��B�!��b�^�M&�\ʬ-���~mng�Vl[T�B�2���@۾�����)a����N�b}���ȤA�s�� �>Ƞ��C4�>�	���:^��!�ry!�-|8z�։�c���Ps��A��cm�\VO�f�u1N��h��ѱd      �   ~   x�M�K� Dמ�T��ޥ�X�`��"�)���=���8�s���8[]p"��C�k��Q2�����ˀ�\q�I�u͖º�H�g�?�N��mz�F*���ȓ��u�#�!ڶ�܎�]Nx �(�=�      �     x����n�0F��S����g��ϲ��/������_�!$R%B�ߌ�1�э1�'�4�0~��۾A��������K��Q�	=`c���� �A�~|Q�P�vC���K��g3�!|;��ƶmՁ$=-����3�}Ϳ�v���1%Pw)-!�ď��Z����7f����Ph�Y%����>��Ln���2o{2��������UjW�M�.�������X�na��|+�)>��	%tV �����%��}����79S�$�[DJ�k��o����H����p�O���m{���t��s�����v�/���x��NU�y��R�bb�I���%�R��������9��k-�,��k��S�și���D��i�^Fdm���|wSJ��hu�e?'��  �yA�e��NM��Z�Pڻ��ku��֝�	��r���#M��+��� �#�fs�lV����;B�R�S��\'/��fq[���$bd͒�x�Ʌ�7�z"�!!�e��  
���p8�����      �   -  x���K��0 �s�+�^,�^�=l�Vc�8�8�ڲl%ه_��U�Rh�
	1H�73��
��+���J����]Y��ɧjAU��H���"B� imtQXT�y���$hA�#$W'�\^���yP츭�l��M4E��q�ʐW���s����6���W~���,a8��s�E==����W�6��;�[N�Gw����i[}�.*�a>b�\����u�Ϸ��G��T�6U�6NJAT�Yv� |#���h��Ə6����˹C�ڲ�&Z���f�K�Ӎ�su}2�{5��4T�ë��!��A!�b�C�N�6�|���Hj��44)[*r/� #x_
n��0�l߲0ҹӑ	h�[�K�����*�p �ƿ��C��z���t�+l9��y3�M9�u]v�%�|�S������-KҙfDW&2��Yīg��@�*E�*M��L��D�V�a�|��'�V�6��Dݦ��t&���@��ҹ�,����?p�c���̕c;7��x�G��\��-���F|�����E'���������V��	�s�\.:М      �       x�3���ON���/.��000@�r��qqq �
�      �   H   x�3��--�L��\F�Y�UU`�˘3%+1/=JqYr&�$&gCH.C΂Ң��T(�ehșXX�&�b���� 6K      �      x������ � �     