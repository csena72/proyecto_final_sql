/*

>> Consigna: Sobre las tablas creadas anteriormente para tu proyecto final,
agregar 2 Stored Procedures que te permitan trabajar sobre las mismas.


>>Aspectos a incluir en el entregable:
El primer S.P. debe permitir indicar a través de un parámetro el campo de ordenamiento de una tabla
y mediante un segundo parámetro, si el orden es descendente o ascendente.

El otro S.P. que crearás, puede (
    1: insertar registros en una tabla de tu proyecto.
    2: eliminar algún registro específico de una tabla de tu proyecto.)

Agrega comentarios en ambos Scripts de los S.P. para saber qué hacen y cómo usarlos
Procura guiarte con los ejemplos abordados en esta clase

*/

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

CALL sp_ProductosOrdenados('nombre', 'desc');


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
CALL sp_insertCategoria(@param1,'Herramietas', 'Herramientas', 'herramientas.png');