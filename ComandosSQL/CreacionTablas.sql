-- Llenado de 20 filas por tabla

--Tablas:

--1) Clientes: 
CREATE TABLE clientes(
Id_cliente int PRIMARY KEY,
Nombre varchar(255) NOT NULL,
Apellido varchar(255) NOT NULL,
Direccion varchar(255),
Telefono varchar(255)
);


--2) Meseros:
CREATE TABLE meseros(
Id_mesero int PRIMARY KEY,
Nombre varchar(255) NOT NULL,
Apellido varchar(255) NOT NULL,
Edad int NOT NULL,
Antiguedad DATE NOT NULL
);


--3) Mesas:
CREATE TABLE mesas(
id_mesa SERIAL PRIMARY KEY,
Nombre varchar(255) NOT NULL,
Reservada BOOLEAN NOT NULL,
Puestos int NOT NULL
);


--4) Supervisores:
CREATE TABLE supervisores(
id_supervisor int PRIMARY KEY,
nombre varchar(255) NOT NULL,
apellido varchar(255) NOT NULL,
edad int NOT NULL,
antiguedad DATE NOT NULL
);


--5) Facturas: 
CREATE TABLE facturas(
id_factura SERIAL PRIMARY KEY,
id_cliente int,
id_mesa SERIAL,
id_mesero int,
FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente),
FOREIGN KEY (id_mesa) REFERENCES mesas(id_mesa),
FOREIGN KEY (id_mesero) REFERENCES meseros(id_mesero),
fecha DATE NOT NULL
);


--6) Detalle_facturas: 
CREATE TABLE Detalle_facturas(
id_detalle_factura SERIAL PRIMARY KEY,
id_factura SERIAL,
id_supervisor int,
FOREIGN KEY (id_factura) REFERENCES facturas(id_factura),
FOREIGN KEY (id_supervisor) REFERENCES supervisores(id_supervisor),
plato varchar(255) NOT NULL,
valor varchar(255) NOT NULL
);