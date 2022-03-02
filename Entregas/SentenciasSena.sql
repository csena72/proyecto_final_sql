/*

>> Consigna: Se deberán crear dos usuarios nuevos a los cuales se le asignará una serie de permisos, a saber:

>>Aspectos a incluir en el entregable:
Uno de los usuarios creados deberá tener permisos de sólo lectura sobre todas las tablas.
El otro usuario deberá tener permisos de Lectura, Inserción y Modificación de datos.
Ninguno de ellos podrá eliminar registros de ninguna tabla.
Cada sentencia GRANT y CREATE USER deberá estar comentada con lo que realiza la misma.

*/

-- Crea el usuario con nombre 'usuario1' y password  'pass1' para el dominio 'localhost'.
CREATE USER 'usuario1'@'localhost' IDENTIFIED BY 'pass1';

-- Otorga permisos de sólo lectura a todas las tablas.
GRANT SELECT ON *.* TO 'usuario1'@'localhost';

-- Crea el usuario con nombre 'usuario2' y password  'pass2' para el dominio 'localhost'.
CREATE USER 'usuario2'@'localhost' IDENTIFIED BY 'pass2';

-- Otorga permisos de Lectura, Inserción y Modificación de datos.
GRANT SELECT, INSERT, UPDATE ON *.* TO 'usuario2'@'localhost';

-- para ver todos los permisos de todos los usarios:
SELECT * from mysql.user;