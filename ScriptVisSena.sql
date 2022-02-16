/*

>> Consigna: Presentar en formato .sql el script de creación de 5 vistas con base en los datos
de la base de datos del proyecto final.

>>Aspectos a incluir en el entregable:
En base a las tablas elegidas para tu proyecto, deberás idear 5 o más vistas de una o más tablas
y generar el SCRIPT de creación de las mismas.

>>Ejemplo: si tu proyecto tiene una tabla productos, puedes crear una vista relacionándola con la tabla categorías,
mostrar el costo de cada producto, representando distintos valores de IVA (TAX), etcétera.

*/

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
SELECT * FROM vw_precios_con_iva;

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
SELECT * FROM vw_productos_sin_stock;

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
SELECT * FROM vw_categorias_con_mas_productos;

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
SELECT * FROM vw_poductos_por_orden;

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
SELECT * FROM vw_productos_mas_vendidos;