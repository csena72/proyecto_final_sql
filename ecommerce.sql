CREATE SCHEMA `ecommerce`;

USE `ecommerce`;

-- Tabla Categorias
DROP TABLE IF EXISTS Categorias;
CREATE TABLE Categorias (
  id int unsigned NOT NULL AUTO_INCREMENT,
  nombre varchar(45) DEFAULT NULL,
  descripcion varchar(45) DEFAULT NULL,
  imagen varchar(45) DEFAULT NULL,
  PRIMARY KEY (id)
);

-- Tabla Clientes
DROP TABLE IF EXISTS Clientes;
CREATE TABLE Clientes (
  id int unsigned NOT NULL AUTO_INCREMENT,
  email varchar(45) NOT NULL,
  password varchar(45) NOT NULL,
  nombre varchar(45) NOT NULL,
  fecha_nacimiento date DEFAULT NULL,
  direccion varchar(45) DEFAULT NULL,
  ciudad varchar(45) DEFAULT NULL,
  pais varchar(45) DEFAULT NULL,
  telefono varchar(45) DEFAULT NULL,
  PRIMARY KEY (id),
  UNIQUE KEY id_UNIQUE (id)
);

-- Tabla Ordenes
DROP TABLE IF EXISTS Ordenes;
CREATE TABLE Ordenes (
  id int unsigned NOT NULL AUTO_INCREMENT,
  clienteId int unsigned NOT NULL,
  total decimal(10,2) DEFAULT NULL,
  direccion_envio varchar(45) DEFAULT NULL,
  fecha timestamp DEFAULT NULL,
  estado varchar(45) DEFAULT NULL,
  PRIMARY KEY (id),
  CONSTRAINT clienteId FOREIGN KEY (clienteId) REFERENCES Clientes (id)
);

-- Tabla Productos
DROP TABLE IF EXISTS Productos;
CREATE TABLE Productos (
  id int unsigned NOT NULL AUTO_INCREMENT,
  sku varchar(45) DEFAULT NULL,
  nombre varchar(45) DEFAULT NULL,
  precio decimal(10,2) DEFAULT NULL,
  descripcion varchar(45) DEFAULT NULL,
  imagen varchar(45) DEFAULT NULL,
  categoriaId varchar(45) DEFAULT NULL,
  stock int DEFAULT NULL,
  PRIMARY KEY (id),
  CONSTRAINT categoriaId FOREIGN KEY (id) REFERENCES Categorias (id)
);

-- Tabla Orden_detalles
DROP TABLE IF EXISTS Orden_detalles;
CREATE TABLE Orden_detalles (
  id int unsigned NOT NULL AUTO_INCREMENT,
  ordenId int unsigned NOT NULL,
  productoId int unsigned NOT NULL,
  cantidad int NOT NULL,
  PRIMARY KEY (id),
  CONSTRAINT ordenId FOREIGN KEY (ordenId) REFERENCES Ordenes (id),
  CONSTRAINT productoId FOREIGN KEY (productoId) REFERENCES Productos (id)
);