/*

>> Consigna: Presentar el script de creación de 2 funciones almacenadas
con base en los datos de la base de datos del proyecto final.


>>Aspectos a incluir en el entregable:
Puedes incluir una función que haga uso interno de funciones propias de SQL,
y una segunda función que permita obtener valores de otras tablas, reemplazando a JOIN o de una subconsulta.
Procura que cada función reciba, al menos, un parámetro de entrada.
Los datos que retorne pueden ser cualquier tipo de dato.

*/

-- 1) Funcion que cuenta todos productos con precio menor a un valor dado
delimiter $$

CREATE FUNCTION `f_cuentaProductosConPrecioMenorA` (valor float) RETURNS int(11)
READS SQL DATA

BEGIN
    RETURN (SELECT count(*) FROM Productos WHERE precio < valor);
END $$

delimiter ;

-- Ejecutar
select f_cuentaProductosConPrecioMenorA(1000.00) AS total;



-- 2) Funcion que devuelve el id de cliente que realizó la compra
delimiter $$

CREATE FUNCTION `f_getClienteId` (ordenId INT) RETURNS INT(11)
READS SQL DATA

BEGIN
	RETURN (SELECT clienteId FROM Ordenes WHERE id = ordenId);
END $$

delimiter ;

-- Ejecutar
select f_getClienteId(5) AS clienteId;