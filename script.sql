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
  categoriaId int unsigned NOT NULL,
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

-- ### Importación de datos en la DB: ###

USE eccomerce

load data local infile
'/archivos_csv/Categorias.csv' into table Categorias fields terminated by ','
terminated by '\r\n';

load data local infile
'/archivos_csv/Clientes.csv' into table Clientes fields terminated by ','
terminated by '\r\n';

load data local infile
'/archivos_csv/Ordenes.csv' into table Ordenes fields terminated by ','
terminated by '\r\n';

load data local infile
'/archivos_csv/Productos.csv' into table Productos fields terminated by ','
terminated by '\r\n';

load data local infile
'/archivos_csv/Orden_detalles.csv' into table Orden_detalles fields terminated by ','
terminated by '\r\n';

-- #### VISTAS ####

-- 1) Precios con iva
CREATE VIEW vw_precios_con_iva AS
    SELECT
        p.id,
        p.nombre as producto,
        c.nombre as categoria,
        p.precio,
        FORMAT((p.precio *.21), 2) as iva,
        FORMAT((p.precio + (p.precio *.21)), 2) as 'precio con iva'

    FROM
        Productos p
    JOIN Categorias c on p.categoriaId = c.id
    ORDER BY p.nombre;

-- Ejecutar con:
-- SELECT * FROM vw_precios_con_iva;

-- 2) Productos sin stock
CREATE VIEW vw_productos_sin_stock AS
    SELECT
        p.id,
        p.nombre as producto,
        c.nombre as categoria,
        p.precio,
        p.stock

    FROM
        Productos p
    JOIN Categorias c on p.categoriaId = c.id
    WHERE p.stock = 0
    ORDER BY p.nombre;

-- Ejecutar con:
-- SELECT * FROM vw_productos_sin_stock;

-- 3) Categorias con mas productos
CREATE VIEW vw_categorias_con_mas_productos AS
    SELECT
        COUNT(p.id) AS 'Cantidad de productos',
        c.nombre AS categoria
    FROM
        Productos p
            INNER JOIN
        Categorias c ON p.categoriaId = c.id
    GROUP BY p.categoriaId
    ORDER BY COUNT(p.id) DESC;

-- Ejecutar con:
-- SELECT * FROM vw_categorias_con_mas_productos;

-- 4) Total de productos por orden
CREATE VIEW vw_poductos_por_orden AS
    SELECT
        o.id AS 'Orden #',
        o.clienteId AS 'Cliente #',
        c.nombre AS 'Nombre',
        sum(od.cantidad) as 'Cantidad de productos',
        o.total AS 'Total',
        o.fecha AS 'Fecha y hora de compra'
    FROM
        Ordenes o
            JOIN
        Orden_detalles od ON o.id = od.ordenId
        JOIN Clientes c ON c.id = o.clienteId
    GROUP BY o.id
    ORDER BY o.id;

-- Ejecutar con:
-- SELECT * FROM vw_poductos_por_orden;

-- 5) Productos mas vendidos
CREATE VIEW vw_productos_mas_vendidos AS
    SELECT
		od.productoId,
        p.sku,
        p.nombre,
        p.precio,
        p.stock,
		sum(od.cantidad) AS 'Cantidad vendidos'
    FROM
         Orden_detalles od
    JOIN Productos p ON od.productoId = p.id
    GROUP BY od.productoId
    ORDER BY sum(od.cantidad) DESC;

-- Ejecutar con:
-- SELECT * FROM vw_productos_mas_vendidos;


-- #### FUNCIONES ####

-- 1) Funcion que cuenta todos productos con precio menor a un valor dado
delimiter $$

CREATE FUNCTION `f_cuentaProductosConPrecioMenorA` (valor float) RETURNS int(11)
READS SQL DATA

BEGIN
    RETURN (SELECT count(*) FROM Productos WHERE precio < valor);
END $$

delimiter ;

-- Ejecutar
-- SELECT f_cuentaProductosConPrecioMenorA(1000.00) AS total;


-- 2) Funcion que devuelve el id de cliente que realizó la compra
delimiter $$

CREATE FUNCTION `f_getClienteId` (ordenId INT) RETURNS INT(11)
READS SQL DATA

BEGIN
	RETURN (SELECT clienteId FROM Ordenes WHERE id = ordenId);
END $$

delimiter ;

-- Ejecutar
-- SELECT f_getClienteId(5) AS clienteId;


-- #### STORED PROCEDURES ####

USE ecommerce;

-- 1) S.P. que retorna todos los productos ordenados por el campo pasado
-- como primer parametro y descendente o ascendente segun el segundo parametro pasado
-- Ej. CALL sp_ProductosOrdenados('id', 'desc'); -> (retorna todos los productos ordenados por id descendente).

DELIMITER //
CREATE PROCEDURE `sp_ProductosOrdenados`( IN campo CHAR(20), IN orden CHAR(4))

BEGIN
    SET @ordenar = concat('ORDER BY ', campo);
    SET @orden = orden;
    SET @clausula = concat('SELECT * FROM ecommerce.Productos ', @ordenar, ' ', @orden );
    PREPARE ejecutarSQL FROM @clausula;
    EXECUTE ejecutarSQL;
END//

-- Ejecutar:
-- CALL sp_ProductosOrdenados('nombre', 'desc');


-- 2) S.P. que inserta registros en la tabla categoría.
-- eJ.: CALL sp_insertCategoria(@param1,NOMBRE, DESCRIPCION, IMAGEN);
--      CALL sp_insertCategoria(@param1,'Herramietas', 'Herramientas', 'herramientas.png');
DELIMITER //
CREATE PROCEDURE `sp_insertCategoria`(INOUT param1 INT , IN param2 CHAR(45), IN param3 CHAR(45), IN param4 CHAR(45) )

BEGIN
    SELECT MAX(id) INTO param1 FROM Categorias;
    SET param1 = param1 + 1 ;
    INSERT INTO Categorias (id , nombre, descripcion, imagen) VALUES ( param1, param2, param3, param4 );
END//

DELIMITER ;

-- Ejecutar
-- CALL sp_insertCategoria(@param1,'Herramietas', 'Herramientas', 'herramientas.png');