/*

>> Consigna: Elige dos tablas de las presentadas en tu proyecto. Realizarás una serie de modificaciones en los registros, controladas por transacciones.


>>Aspectos a incluir en el entregable:
1) En la primera tabla, si tiene registros, deberás eliminar algunos de ellos iniciando previamente una transacción. Si no tiene registros la tabla, reemplaza eliminación por inserción.
Deja en una línea siguiente, comentado la sentencia Rollback, y en una línea posterior, la sentencia Commit.
Si eliminas registros importantes, deja comenzado las sentencias para re-insertarlos.

2) En la segunda tabla, inserta ocho nuevos registros iniciando también una transacción.
Agrega un savepoint a posteriori de la inserción del registro #4 y otro savepoint a posteriori del registro #8
Agrega en una línea comentada la sentencia de eliminación del savepoint de los primeros 4 registros insertados

*/


-- 1)
START TRANSACTION ;
DELETE FROM `ecommerce`.`Orden_detalles`
WHERE (`id` = 2) ;

DELETE FROM `ecommerce`.`Orden_detalles`
WHERE (`id` = 7) ;

--ROLLBACK ;
-- COMMIT ;

-- ------------------------------------------

-- 2)

START TRANSACTION ;

SAVEPOINT SAVEINICIAL ;

INSERT INTO `ecommerce`.`Productos`
VALUES ( 21, 'pjam205jp', 'Jamón Paladini', 250.00 ,'Jamón feteado x 100', 'jamonp.png', 7, 225 ) ;

INSERT INTO `ecommerce`.`Productos`
VALUES ( 22, 'psal205sp', 'Salame Paladini', 230.00 ,'Salame feteado x 100', 'salamep.png', 7, 125 ) ;

INSERT INTO `ecommerce`.`Productos`
VALUES ( 23, 'ppan205pp', 'Panceta Paladini', 350.00 ,'Panceta feteada x 100', 'pancetap.png', 7, 25 ) ;

INSERT INTO `ecommerce`.`Productos`
VALUES ( 24, 'pbon205pb', 'Bondiola Paladini', 380.00 ,'Bondiola feteada x 100', 'bondiolap.png', 7, 75 ) ;

SAVEPOINT LOTE_1;

INSERT INTO `ecommerce`.`Productos`
VALUES ( 25, 'tjam409jt', 'Jamón Torgelon', 350.00 ,'Jamón feteado x 100', 'jamont.png', 7, 225 ) ;

INSERT INTO `ecommerce`.`Productos`
VALUES ( 26, 'tsal409jt', 'Salame Torgelon', 330.00 ,'Salame feteado x 100', 'salamet.png', 7, 125 ) ;

INSERT INTO `ecommerce`.`Productos`
VALUES ( 27, 'tpan409jt', 'Panceta Torgelon', 450.00 ,'Panceta feteada x 100', 'pancetat.png', 7, 25 ) ;

INSERT INTO `ecommerce`.`Productos`
VALUES ( 28, 'tbon409jt', 'Bondiola Torgelon', 480.00 ,'Bondiola feteada x 100', 'bondiolat.png', 7, 75 ) ;

SAVEPOINT LOTE_2;

-- ROLLBACK TO SAVEINICIAL  ;

COMMIT  ;