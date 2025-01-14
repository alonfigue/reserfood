PGDMP         0                {         	   ReserFood    14.7    14.7 /    "           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            #           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            $           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            %           1262    16642 	   ReserFood    DATABASE     k   CREATE DATABASE "ReserFood" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'Spanish_Venezuela.1252';
    DROP DATABASE "ReserFood";
                postgres    false            �            1259    16643    clientes    TABLE     �   CREATE TABLE public.clientes (
    id_cliente integer NOT NULL,
    nombre character varying(255) NOT NULL,
    apellido character varying(255) NOT NULL,
    direccion character varying(255),
    telefono character varying(255)
);
    DROP TABLE public.clientes;
       public         heap    postgres    false            �            1259    16711    detalle_facturas    TABLE     �   CREATE TABLE public.detalle_facturas (
    id_detalle_factura integer NOT NULL,
    id_factura integer NOT NULL,
    id_supervisor integer,
    plato character varying(255) NOT NULL,
    valor character varying(255) NOT NULL
);
 $   DROP TABLE public.detalle_facturas;
       public         heap    postgres    false            �            1259    16709 '   detalle_facturas_id_detalle_factura_seq    SEQUENCE     �   CREATE SEQUENCE public.detalle_facturas_id_detalle_factura_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 >   DROP SEQUENCE public.detalle_facturas_id_detalle_factura_seq;
       public          postgres    false    219            &           0    0 '   detalle_facturas_id_detalle_factura_seq    SEQUENCE OWNED BY     s   ALTER SEQUENCE public.detalle_facturas_id_detalle_factura_seq OWNED BY public.detalle_facturas.id_detalle_factura;
          public          postgres    false    217            �            1259    16710    detalle_facturas_id_factura_seq    SEQUENCE     �   CREATE SEQUENCE public.detalle_facturas_id_factura_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 6   DROP SEQUENCE public.detalle_facturas_id_factura_seq;
       public          postgres    false    219            '           0    0    detalle_facturas_id_factura_seq    SEQUENCE OWNED BY     c   ALTER SEQUENCE public.detalle_facturas_id_factura_seq OWNED BY public.detalle_facturas.id_factura;
          public          postgres    false    218            �            1259    16687    facturas    TABLE     �   CREATE TABLE public.facturas (
    id_factura integer NOT NULL,
    id_cliente integer,
    id_mesa integer NOT NULL,
    id_mesero integer,
    fecha date NOT NULL
);
    DROP TABLE public.facturas;
       public         heap    postgres    false            �            1259    16685    facturas_id_factura_seq    SEQUENCE     �   CREATE SEQUENCE public.facturas_id_factura_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.facturas_id_factura_seq;
       public          postgres    false    216            (           0    0    facturas_id_factura_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.facturas_id_factura_seq OWNED BY public.facturas.id_factura;
          public          postgres    false    214            �            1259    16686    facturas_id_mesa_seq    SEQUENCE     �   CREATE SEQUENCE public.facturas_id_mesa_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.facturas_id_mesa_seq;
       public          postgres    false    216            )           0    0    facturas_id_mesa_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.facturas_id_mesa_seq OWNED BY public.facturas.id_mesa;
          public          postgres    false    215            �            1259    16672    mesas    TABLE     �   CREATE TABLE public.mesas (
    id_mesa integer NOT NULL,
    nombre character varying(255) NOT NULL,
    reservada boolean NOT NULL,
    puestos integer NOT NULL
);
    DROP TABLE public.mesas;
       public         heap    postgres    false            �            1259    16671    mesas_id_mesa_seq    SEQUENCE     �   CREATE SEQUENCE public.mesas_id_mesa_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.mesas_id_mesa_seq;
       public          postgres    false    212            *           0    0    mesas_id_mesa_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.mesas_id_mesa_seq OWNED BY public.mesas.id_mesa;
          public          postgres    false    211            �            1259    16650    meseros    TABLE     �   CREATE TABLE public.meseros (
    id_mesero integer NOT NULL,
    nombre character varying(255) NOT NULL,
    apellido character varying(255) NOT NULL,
    edad integer NOT NULL,
    antiguedad date NOT NULL
);
    DROP TABLE public.meseros;
       public         heap    postgres    false            �            1259    16678    supervisores    TABLE     �   CREATE TABLE public.supervisores (
    id_supervisor integer NOT NULL,
    nombre character varying(255) NOT NULL,
    apellido character varying(255) NOT NULL,
    edad integer NOT NULL,
    antiguedad date NOT NULL
);
     DROP TABLE public.supervisores;
       public         heap    postgres    false            w           2604    16714 #   detalle_facturas id_detalle_factura    DEFAULT     �   ALTER TABLE ONLY public.detalle_facturas ALTER COLUMN id_detalle_factura SET DEFAULT nextval('public.detalle_facturas_id_detalle_factura_seq'::regclass);
 R   ALTER TABLE public.detalle_facturas ALTER COLUMN id_detalle_factura DROP DEFAULT;
       public          postgres    false    219    217    219            x           2604    16715    detalle_facturas id_factura    DEFAULT     �   ALTER TABLE ONLY public.detalle_facturas ALTER COLUMN id_factura SET DEFAULT nextval('public.detalle_facturas_id_factura_seq'::regclass);
 J   ALTER TABLE public.detalle_facturas ALTER COLUMN id_factura DROP DEFAULT;
       public          postgres    false    219    218    219            u           2604    16690    facturas id_factura    DEFAULT     z   ALTER TABLE ONLY public.facturas ALTER COLUMN id_factura SET DEFAULT nextval('public.facturas_id_factura_seq'::regclass);
 B   ALTER TABLE public.facturas ALTER COLUMN id_factura DROP DEFAULT;
       public          postgres    false    214    216    216            v           2604    16691    facturas id_mesa    DEFAULT     t   ALTER TABLE ONLY public.facturas ALTER COLUMN id_mesa SET DEFAULT nextval('public.facturas_id_mesa_seq'::regclass);
 ?   ALTER TABLE public.facturas ALTER COLUMN id_mesa DROP DEFAULT;
       public          postgres    false    215    216    216            t           2604    16675    mesas id_mesa    DEFAULT     n   ALTER TABLE ONLY public.mesas ALTER COLUMN id_mesa SET DEFAULT nextval('public.mesas_id_mesa_seq'::regclass);
 <   ALTER TABLE public.mesas ALTER COLUMN id_mesa DROP DEFAULT;
       public          postgres    false    212    211    212                      0    16643    clientes 
   TABLE DATA           U   COPY public.clientes (id_cliente, nombre, apellido, direccion, telefono) FROM stdin;
    public          postgres    false    209   g8                 0    16711    detalle_facturas 
   TABLE DATA           g   COPY public.detalle_facturas (id_detalle_factura, id_factura, id_supervisor, plato, valor) FROM stdin;
    public          postgres    false    219   .;                 0    16687    facturas 
   TABLE DATA           U   COPY public.facturas (id_factura, id_cliente, id_mesa, id_mesero, fecha) FROM stdin;
    public          postgres    false    216   �<                 0    16672    mesas 
   TABLE DATA           D   COPY public.mesas (id_mesa, nombre, reservada, puestos) FROM stdin;
    public          postgres    false    212   p=                 0    16650    meseros 
   TABLE DATA           P   COPY public.meseros (id_mesero, nombre, apellido, edad, antiguedad) FROM stdin;
    public          postgres    false    210   C>                 0    16678    supervisores 
   TABLE DATA           Y   COPY public.supervisores (id_supervisor, nombre, apellido, edad, antiguedad) FROM stdin;
    public          postgres    false    213   �?       +           0    0 '   detalle_facturas_id_detalle_factura_seq    SEQUENCE SET     V   SELECT pg_catalog.setval('public.detalle_facturas_id_detalle_factura_seq', 1, false);
          public          postgres    false    217            ,           0    0    detalle_facturas_id_factura_seq    SEQUENCE SET     N   SELECT pg_catalog.setval('public.detalle_facturas_id_factura_seq', 1, false);
          public          postgres    false    218            -           0    0    facturas_id_factura_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.facturas_id_factura_seq', 1, false);
          public          postgres    false    214            .           0    0    facturas_id_mesa_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.facturas_id_mesa_seq', 1, false);
          public          postgres    false    215            /           0    0    mesas_id_mesa_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.mesas_id_mesa_seq', 1, false);
          public          postgres    false    211            z           2606    16649    clientes clientes_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.clientes
    ADD CONSTRAINT clientes_pkey PRIMARY KEY (id_cliente);
 @   ALTER TABLE ONLY public.clientes DROP CONSTRAINT clientes_pkey;
       public            postgres    false    209            �           2606    16719 &   detalle_facturas detalle_facturas_pkey 
   CONSTRAINT     t   ALTER TABLE ONLY public.detalle_facturas
    ADD CONSTRAINT detalle_facturas_pkey PRIMARY KEY (id_detalle_factura);
 P   ALTER TABLE ONLY public.detalle_facturas DROP CONSTRAINT detalle_facturas_pkey;
       public            postgres    false    219            �           2606    16693    facturas facturas_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.facturas
    ADD CONSTRAINT facturas_pkey PRIMARY KEY (id_factura);
 @   ALTER TABLE ONLY public.facturas DROP CONSTRAINT facturas_pkey;
       public            postgres    false    216            ~           2606    16677    mesas mesas_pkey 
   CONSTRAINT     S   ALTER TABLE ONLY public.mesas
    ADD CONSTRAINT mesas_pkey PRIMARY KEY (id_mesa);
 :   ALTER TABLE ONLY public.mesas DROP CONSTRAINT mesas_pkey;
       public            postgres    false    212            |           2606    16656    meseros meseros_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY public.meseros
    ADD CONSTRAINT meseros_pkey PRIMARY KEY (id_mesero);
 >   ALTER TABLE ONLY public.meseros DROP CONSTRAINT meseros_pkey;
       public            postgres    false    210            �           2606    16684    supervisores supervisores_pkey 
   CONSTRAINT     g   ALTER TABLE ONLY public.supervisores
    ADD CONSTRAINT supervisores_pkey PRIMARY KEY (id_supervisor);
 H   ALTER TABLE ONLY public.supervisores DROP CONSTRAINT supervisores_pkey;
       public            postgres    false    213            �           2606    16720 1   detalle_facturas detalle_facturas_id_factura_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.detalle_facturas
    ADD CONSTRAINT detalle_facturas_id_factura_fkey FOREIGN KEY (id_factura) REFERENCES public.facturas(id_factura);
 [   ALTER TABLE ONLY public.detalle_facturas DROP CONSTRAINT detalle_facturas_id_factura_fkey;
       public          postgres    false    219    3202    216            �           2606    16725 4   detalle_facturas detalle_facturas_id_supervisor_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.detalle_facturas
    ADD CONSTRAINT detalle_facturas_id_supervisor_fkey FOREIGN KEY (id_supervisor) REFERENCES public.supervisores(id_supervisor);
 ^   ALTER TABLE ONLY public.detalle_facturas DROP CONSTRAINT detalle_facturas_id_supervisor_fkey;
       public          postgres    false    213    3200    219            �           2606    16694 !   facturas facturas_id_cliente_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.facturas
    ADD CONSTRAINT facturas_id_cliente_fkey FOREIGN KEY (id_cliente) REFERENCES public.clientes(id_cliente);
 K   ALTER TABLE ONLY public.facturas DROP CONSTRAINT facturas_id_cliente_fkey;
       public          postgres    false    209    216    3194            �           2606    16699    facturas facturas_id_mesa_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.facturas
    ADD CONSTRAINT facturas_id_mesa_fkey FOREIGN KEY (id_mesa) REFERENCES public.mesas(id_mesa);
 H   ALTER TABLE ONLY public.facturas DROP CONSTRAINT facturas_id_mesa_fkey;
       public          postgres    false    3198    216    212            �           2606    16704     facturas facturas_id_mesero_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.facturas
    ADD CONSTRAINT facturas_id_mesero_fkey FOREIGN KEY (id_mesero) REFERENCES public.meseros(id_mesero);
 J   ALTER TABLE ONLY public.facturas DROP CONSTRAINT facturas_id_mesero_fkey;
       public          postgres    false    216    3196    210               �  x�M��r1�ϣ��ѾP��;!�
�ʅ�b��FrI���B��i[=�ʹ��)�Ე���W��y�J�#��3�%�AI?H&�������}�TP����8�m�@�%w�J�S�%��+�
��h��-X����A����4��Z��3�]�!/�El?G<�Bd�TZ	f�C��B>��~���V��c�g~[���jɭ2^��YX�z��CB��?�q*���\'� ��׆9�N�(E���R�D�`���ӏ�hr�e��$s�x9Hg�pV�H�7un䡕�|Ur���2k��� �`Y��~,8M7sn�R�=8MV?[��T�侠hŚ �db��J*Zh�q���՜����}��"8JEJ�bB��thh�8�1����sy����T!x!�cM8�yj}	���r_J���l�h���Jc�P�)��p�ܰ���v�o�q�YÄ�8�b�3S�	�?�}�{z�CD��e<�1��{���ZMg����	���?�L��i;g�%lV�����c�$�������ﶤL{ՎdV',1pp1O�R{��=��?�����d�ā	�ʋʆT�>�i*/ ��/S�o*��F�S�p6��T��:ĄoRn��ki��ha,a��-��t��XwT��ZfZ'5����;��ث�/�(��Z���c�o#4         a  x�M�;n�0��_�А9�?��Md	�!c�?� ;�%׏�mz��G��J�o�,��iR9�<�	�N�R�z'2R;�6t��}|�I�d�nfZ�u!���W�4[��Ϯڈ�Ԗ
:�o��gO�"�U��c��D�%!����_��7mHzE*�-���9��Lhʩ���,QY�����E*����$��(����M{�/�1����#'S! ck������,�<ZZ��(Ľ�0r���X����0�X��4� ��@Ŏ��8���.
yE\�>��{����K�RtE8�8c����O���*zsd� Y�U�5��"��䶘=w��=�,
G�x�M���~����S\)��B�_�_�         �   x�E�ۍ!C��^X��9�l�u\�A���r�ÖqZxD�>-^�D��V�74m���n,t�۴~t�Tǰ�،�B��g�u��D�J��z������eё�Q�ߘ���=�6e _��V�7�dU�m� �����Y*��/��Ig}�&^˙E�"�Ti}�U������>
��e�q�N���}�C\         �   x�=N�n�0<��U�I�[A�� �V�l�l��T��8jo���at)�|<� C+�	��X�x�?�,5���˃4�b�µ�,�y���S�K����}���9v�[T犸Bw��:b��g��.k-�X�Ε15q����m�69���-��.�%�aR�O��ݭlҢ�S]�q-���������'"��CG         �  x�ER�n�0<�EI=}l�8mܠA] �^hi�������t��ʙ�����Ѻ�w���KZ<� -��d]�Fh<��YO���[�B_�F��d��S0x
�"9�3CUJVR�"w���hr�e��U�[ܯ�9���D��E �D��[X��$
��hԛE�D���6�oơ��n]�^�lă����2ɄF�8\��3}�'�&��v��TrJr�,�8�5KP�[<��{Z�g��R��˸��zν�m)Ae<��ƓIi���/���"��U/T�/��M�`S�$����@�B��J�-�?n����W^�YnW�K��t��Jp�c2><�|��}�sł�p/��񰜘U� �����	�ߟ77����8���T�%�ʟG�n�|��7B��w��         �  x�M��n�0���wQ�Q���S�@4���z٤�0M��dC}��T�Ή��~�c�m�a��3%�%8��-�-�Wwg¶�3��ݬ�)�F9l)���K��1w��բS�/]�G�AfЩ�	��gо0^y�ƞ�<�Q�Uj
kT���@��y����j<�H$�fN�~��L����6Oi6Б#���+�U<tyh��)$T���QF�o��n^f�����2���,������nke,�-�_�x�4pz����q�6��	X?�|<I�+`#)�)���ę�H1D�UVׄZ��`L9�[���N�Jz�<1����ĸ���q���i�)�~W�|v��4s�(�w�/�t,��l�L��0tK�AY��m����7iO&1||��[�~~QJ�*��"     