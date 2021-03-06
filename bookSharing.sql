PGDMP                         z            bookSharing    14.4    14.4                0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false                       1262    16394    bookSharing    DATABASE     q   CREATE DATABASE "bookSharing" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'English_United States.1256';
    DROP DATABASE "bookSharing";
                postgres    false            ?            1259    16476    books    TABLE     ?   CREATE TABLE public.books (
    id integer NOT NULL,
    book_name character varying,
    author_id integer,
    category character varying
);
    DROP TABLE public.books;
       public         heap    postgres    false            ?            1259    16475    books_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.books_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.books_id_seq;
       public          postgres    false    214                       0    0    books_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.books_id_seq OWNED BY public.books.id;
          public          postgres    false    213            ?            1259    16460    shared_book    TABLE     ?   CREATE TABLE public.shared_book (
    id integer NOT NULL,
    author_id integer,
    shared_user integer,
    book_id integer
);
    DROP TABLE public.shared_book;
       public         heap    postgres    false            ?            1259    16459    shared_book_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.shared_book_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.shared_book_id_seq;
       public          postgres    false    212                       0    0    shared_book_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.shared_book_id_seq OWNED BY public.shared_book.id;
          public          postgres    false    211            ?            1259    16430    users    TABLE     ?   CREATE TABLE public.users (
    id integer NOT NULL,
    user_name character varying,
    email character varying,
    full_name character varying,
    password character varying
);
    DROP TABLE public.users;
       public         heap    postgres    false            ?            1259    16429    users_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.users_id_seq;
       public          postgres    false    210                       0    0    users_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;
          public          postgres    false    209            h           2604    16479    books id    DEFAULT     d   ALTER TABLE ONLY public.books ALTER COLUMN id SET DEFAULT nextval('public.books_id_seq'::regclass);
 7   ALTER TABLE public.books ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    213    214    214            g           2604    16463    shared_book id    DEFAULT     p   ALTER TABLE ONLY public.shared_book ALTER COLUMN id SET DEFAULT nextval('public.shared_book_id_seq'::regclass);
 =   ALTER TABLE public.shared_book ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    211    212    212            f           2604    16433    users id    DEFAULT     d   ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);
 7   ALTER TABLE public.users ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    210    209    210            ?          0    16476    books 
   TABLE DATA           C   COPY public.books (id, book_name, author_id, category) FROM stdin;
    public          postgres    false    214   =       ?          0    16460    shared_book 
   TABLE DATA           J   COPY public.shared_book (id, author_id, shared_user, book_id) FROM stdin;
    public          postgres    false    212   x       ?          0    16430    users 
   TABLE DATA           J   COPY public.users (id, user_name, email, full_name, password) FROM stdin;
    public          postgres    false    210   ?       	           0    0    books_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.books_id_seq', 2, true);
          public          postgres    false    213            
           0    0    shared_book_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.shared_book_id_seq', 2, true);
          public          postgres    false    211                       0    0    users_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.users_id_seq', 9, true);
          public          postgres    false    209            n           2606    16483    books books_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.books
    ADD CONSTRAINT books_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.books DROP CONSTRAINT books_pkey;
       public            postgres    false    214            l           2606    16465    shared_book shared_book_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.shared_book
    ADD CONSTRAINT shared_book_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.shared_book DROP CONSTRAINT shared_book_pkey;
       public            postgres    false    212            j           2606    16437    users users_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
       public            postgres    false    210            ?   +   x?3?(?O/J????K?4?tv?2?LLJ?4?S?b???? ??	8      ?      x?3?4?4?4?2?4???b???? C?      ?   `   x?3??NL?,??鹉?9z????? ?BXb&?????	?	gqbVf?DR?#?)r?r%?%?	$eA@.?i???y)?i?y?)?Y\?????? W?     