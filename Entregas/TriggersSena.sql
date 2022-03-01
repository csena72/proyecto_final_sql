/*

>> Consigna: En la base de datos de tu proyecto final, debes incluir al menos dos tablas del tipo LOG,
Bitácora o Movimientos. Elegir dos de las tablas más importantes donde se operan con registros de forma frecuente,
y crearás dos Triggers en cada una de ellas.
Los Triggers a crear deberán controlar la acción previo a la operación elegida (BEFORE),
y una acción posterior a otra operación elegida (AFTER).


>>Aspectos a incluir en el entregable:
Agrega una explicación por cada trigger a crear, explicando qué controlará el mismo.
Recuerda agregar el script de creación de las tablas LOG.
        Debe registrar el usuario que realizó la operación, la fecha, y la hora (en campos separados).

*/

USE ecommerce;

-- Tabla LogsProductos
DROP TABLE IF EXISTS LogsProductos;

CREATE TABLE LogsProductos (
  id int unsigned NOT NULL AUTO_INCREMENT,
  clienteId int unsigned NOT NULL,
  ordenId int unsigned NOT NULL,
  producto int unsigned NOT NULL,
  cantidad int unsigned NOT NULL,
  fecha varchar(45) DEFAULT NULL,
  hora varchar(45) DEFAULT NULL,
  PRIMARY KEY (id),
  UNIQUE KEY id_UNIQUE (id)
);


-- Trigger que descuenta el stock de la tabla productos y
-- registra los productos vendidos en la tabla LogsProductos
-- cuando se inserta un registro en la tabla Orden_detalle.
DELIMITER $$
CREATE TRIGGER trg_productos
BEFORE INSERT  ON Orden_detalles
FOR EACH ROW
BEGIN
DECLARE cantidadAnt INT;
DECLARE cliente INT;

IF NEW.cantidad  > 0
 THEN
  SET cantidadAnt = (SELECT stock FROM Productos WHERE id = NEW.productoId);
  SET cliente = (SELECT clienteId FROM Ordenes WHERE id = NEW.ordenId);

  -- Actualiza el nuevo stock en la tabla productos.
  UPDATE Productos SET stock = cantidadAnt - NEW.cantidad WHERE id = NEW.productoId;

  -- Registra la nueva venta en la tabla logProductos.
  INSERT INTO LogsProductos (clienteId, ordenId, producto, cantidad, fecha, hora )
  VALUES ( cliente, NEW.ordenId, NEW.productoId, NEW.cantidad, CURDATE(), TIME_FORMAT( now(),'%r'));
 END IF ;

END$$
DELIMITER ;

-- Ejecutar
INSERT INTO Orden_detalles (ordenId, productoId, cantidad ) VALUES ( 20, 5, 3);

-- #################################################################

-- Tabla LogsCambioPrecio
DROP TABLE IF EXISTS LogsCambioPrecio;

CREATE TABLE LogsCambioPrecio (
  id int unsigned NOT NULL AUTO_INCREMENT,
  productoId int unsigned NOT NULL,
  precioAnterior decimal(10,2) DEFAULT NULL,
  precioActual decimal(10,2) DEFAULT NULL,
  fecha varchar(45) DEFAULT NULL,
  hora varchar(45) DEFAULT NULL,
  PRIMARY KEY (id),
  UNIQUE KEY id_UNIQUE (id)
);

-- Trigger que registra cuando hay un cambio de precio en la tabla LogsCambioPrecio.
DELIMITER $$
CREATE TRIGGER trg_cambioPrecio
BEFORE UPDATE ON Productos
FOR EACH ROW
BEGIN
DECLARE precioAnt INT;
SET precioAnt = (SELECT precio FROM Productos WHERE id = NEW.id LIMIT 1);

IF NEW.precio  <> precioAnt
 THEN
  INSERT INTO LogsCambioPrecio (productoId, precioAnterior, precioActual, fecha, hora )
  VALUES ( NEW.id, precioAnt, NEW.precio, CURDATE(), TIME_FORMAT( now(),'%r'));
 END IF ;

END$$
DELIMITER ;

-- ejecutar
UPDATE Productos SET precio = 200.00 WHERE id = 20;

-- #################################################################

-- Tabla LogsProductosBajoStock
DROP TABLE IF EXISTS LogsProductosBajoStock;

CREATE TABLE LogsProductosBajoStock (
  id int unsigned NOT NULL AUTO_INCREMENT,
  productoId int unsigned NOT NULL,
  precio decimal(10,2) DEFAULT NULL,
  stock int DEFAULT NULL,
  fecha varchar(45) DEFAULT NULL,
  hora varchar(45) DEFAULT NULL,
  PRIMARY KEY (id),
  UNIQUE KEY id_UNIQUE (id)
);

-- Trigger que registra un producto cuando el stock es menor a 5 unidades.
DELIMITER $$
CREATE TRIGGER trg_BajoStock
AFTER UPDATE ON Productos
FOR EACH ROW
BEGIN

IF NEW.stock  <  5
 THEN
  INSERT INTO LogsProductosBajoStock (productoId, precio, stock, fecha, hora )
  VALUES ( NEW.id, NEW.precio, NEW.stock, CURDATE(), TIME_FORMAT( now(),'%r'));
 END IF ;

END$$
DELIMITER ;

-- ejecutar
UPDATE Productos SET stock = 4 WHERE id = 20;