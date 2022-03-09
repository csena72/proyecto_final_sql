CREATE DATABASE  IF NOT EXISTS `ecommerce` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `ecommerce`;
-- MySQL dump 10.13  Distrib 8.0.27, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: ecommerce
-- ------------------------------------------------------
-- Server version	8.0.28

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

-- TABLAS:
-- Categorias
-- Clientes
-- LogsCambioPrecio
-- LogsProductos
-- LogsProductosBajoStock
-- Orden_detalles
-- Ordenes
-- Productos

-- VISTAS:
-- vw_categorias_con_mas_productos
-- vw_poductos_por_orden
-- vw_precios_con_iva
-- vw_productos_mas_vendidos
-- vw_productos_sin_stock

-- FUNCIONES
-- f_cuentaProductosConPrecioMenorA
-- f_getClienteId

-- STORED PROCEDURES
-- sp_insertCategoria
-- sp_ProductosOrdenados

--
-- Table structure for table `Categorias`
--

DROP TABLE IF EXISTS `Categorias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Categorias` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) DEFAULT NULL,
  `descripcion` varchar(45) DEFAULT NULL,
  `imagen` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Categorias`
--

LOCK TABLES `Categorias` WRITE;
/*!40000 ALTER TABLE `Categorias` DISABLE KEYS */;
INSERT INTO `Categorias` VALUES (1,'Arte y entretenimiento','Articulos de arte y entretenimiento','arte.png'),(2,'Articulos deportivos','Articulos deportivos','deportivos.png'),(3,'Articulos para Bebe','Articulos para Bebe','a_bebe.png'),(4,'Articulos para mascotas','Articulos para mascotas','a_mascotas.png'),(5,'Bebidas','Bebidas','bebidas.png'),(6,'Camaras y Optica','Camaras y Optica','optica.png'),(7,'Comida','Comida','food.png'),(8,'Electronica','Electronica','electro.png'),(9,'Equipaje y bolsos','Equipaje y bolsos','bolsos.png'),(10,'Hardware','Hardware','hardware.png'),(11,'Hogar & Jardin','Hogar & JardÃ­n','hogar.png'),(12,'Juguetes y Juegos','Juguetes y Juegos','juegos.png'),(13,'Material de oficina','Articulos de oficina','oficina.png'),(14,'Muebles','Muebles y Articulos de decoracion','muebles.png'),(15,'Negocio e industria','Articulos para negocios e industria','industria.png'),(16,'Ropa y accesorios','Ropa y accesorios','ropa.png'),(17,'Salud y Belleza','Salud y Belleza','salud.png'),(18,'Software','Software','software.png'),(19,'Tabaco','Tabaco','tabaco.png'),(20,'Vehiculos y Partes','Vehiculos y Partes','vehiculos.png'),(21,'Herramietas','Herramientas','herramientas.png');
/*!40000 ALTER TABLE `Categorias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Clientes`
--

DROP TABLE IF EXISTS `Clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Clientes` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `fecha_nacimiento` date DEFAULT NULL,
  `direccion` varchar(45) DEFAULT NULL,
  `ciudad` varchar(45) DEFAULT NULL,
  `pais` varchar(45) DEFAULT NULL,
  `telefono` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Clientes`
--

LOCK TABLES `Clientes` WRITE;
/*!40000 ALTER TABLE `Clientes` DISABLE KEYS */;
INSERT INTO `Clientes` VALUES (1,'jperez@example.com','12345','Juan Perez',NULL,NULL,'CABA','ARGENTINA',NULL),(2,'jlopez@example.com','12345','Julio Lopez',NULL,NULL,'BS. AS.','ARGENTINA',NULL),(3,'aledezma@example.com','12345','Adrian Ledezma',NULL,NULL,'BS. AS.','ARGENTINA',NULL),(4,'spacol@example.com','12345','Sandra Pacol',NULL,NULL,'BS. AS.','ARGENTINA',NULL),(5,'jcruz@example.com','12345','Juan Cruz',NULL,NULL,'CABA','ARGENTINA',NULL),(6,'ntemppa@example.com','12345','Nestor temppa',NULL,NULL,'CABA','ARGENTINA',NULL),(7,'acardozo@example.com','12345','Ariel Cardozo',NULL,NULL,'CABA','ARGENTINA',NULL),(8,'sloean@example.com','12345','Sandro Loean',NULL,NULL,'CABA','ARGENTINA',NULL),(9,'cmonti@example.com','12345','Carlos Monti',NULL,NULL,'CABA','ARGENTINA',NULL),(10,'ppascul@example.com','12345','Pedro Pascul',NULL,NULL,'BS. AS.','ARGENTINA',NULL),(11,'aserra@example.com','12345','Andres Serra',NULL,NULL,'BS. AS.','ARGENTINA',NULL),(12,'mlesa@example.com','12345','Macarena Lesa',NULL,NULL,'CORDOBA','ARGENTINA',NULL),(13,'flenco@example.com','12345','Franco Lenco',NULL,NULL,'CABA','ARGENTINA',NULL),(14,'msanchez<@example.com','12345','Marta Sanchez',NULL,NULL,'SALTA','ARGENTINA',NULL),(15,'lantoele@example.com','12345','Luis Antoele',NULL,NULL,'ENTRE RIOS','ARGENTINA',NULL),(16,'mdipalto@example.com','12345','Marcos Dipalto',NULL,NULL,'CABA','ARGENTINA',NULL),(17,'jcrulen@example.com','12345','Jesus Crulen',NULL,NULL,'CABA','ARGENTINA',NULL),(18,'fantares@example.com','12345','Federico Antares',NULL,NULL,'CABA','ARGENTINA',NULL),(19,'mcartuzi@example.com','12345','Melina Cartuzi',NULL,NULL,'CABA','ARGENTINA',NULL),(20,'plento@example.com','12345','Pablo Lento',NULL,NULL,'BS. AS.','ARGENTINA',NULL);
/*!40000 ALTER TABLE `Clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `LogsCambioPrecio`
--

DROP TABLE IF EXISTS `LogsCambioPrecio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `LogsCambioPrecio` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `productoId` int unsigned NOT NULL,
  `precioAnterior` decimal(10,2) DEFAULT NULL,
  `precioActual` decimal(10,2) DEFAULT NULL,
  `fecha` varchar(45) DEFAULT NULL,
  `hora` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `LogsCambioPrecio`
--

LOCK TABLES `LogsCambioPrecio` WRITE;
/*!40000 ALTER TABLE `LogsCambioPrecio` DISABLE KEYS */;
INSERT INTO `LogsCambioPrecio` VALUES (1,20,20520.00,200.00,'2022-02-24','07:38:50 PM');
/*!40000 ALTER TABLE `LogsCambioPrecio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `LogsProductos`
--

DROP TABLE IF EXISTS `LogsProductos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `LogsProductos` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `clienteId` int unsigned NOT NULL,
  `ordenId` int unsigned NOT NULL,
  `producto` int unsigned NOT NULL,
  `cantidad` int unsigned NOT NULL,
  `fecha` varchar(45) DEFAULT NULL,
  `hora` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `LogsProductos`
--

LOCK TABLES `LogsProductos` WRITE;
/*!40000 ALTER TABLE `LogsProductos` DISABLE KEYS */;
INSERT INTO `LogsProductos` VALUES (1,11,20,5,3,'2022-02-24','07:01:18 PM');
/*!40000 ALTER TABLE `LogsProductos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `LogsProductosBajoStock`
--

DROP TABLE IF EXISTS `LogsProductosBajoStock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `LogsProductosBajoStock` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `productoId` int unsigned NOT NULL,
  `precio` decimal(10,2) DEFAULT NULL,
  `stock` int DEFAULT NULL,
  `fecha` varchar(45) DEFAULT NULL,
  `hora` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `LogsProductosBajoStock`
--

LOCK TABLES `LogsProductosBajoStock` WRITE;
/*!40000 ALTER TABLE `LogsProductosBajoStock` DISABLE KEYS */;
INSERT INTO `LogsProductosBajoStock` VALUES (1,20,200.00,4,'2022-02-24','07:56:27 PM');
/*!40000 ALTER TABLE `LogsProductosBajoStock` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Orden_detalles`
--

DROP TABLE IF EXISTS `Orden_detalles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Orden_detalles` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `ordenId` int unsigned NOT NULL,
  `productoId` int unsigned NOT NULL,
  `cantidad` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ordenId` (`ordenId`),
  KEY `productoId` (`productoId`),
  CONSTRAINT `ordenId` FOREIGN KEY (`ordenId`) REFERENCES `Ordenes` (`id`),
  CONSTRAINT `productoId` FOREIGN KEY (`productoId`) REFERENCES `Productos` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Orden_detalles`
--

LOCK TABLES `Orden_detalles` WRITE;
/*!40000 ALTER TABLE `Orden_detalles` DISABLE KEYS */;
INSERT INTO `Orden_detalles` VALUES (1,2,3,5),(3,4,12,2),(4,10,12,4),(5,12,1,6),(6,11,6,10),(8,2,2,44),(9,3,4,45),(10,1,3,55),(11,5,4,12),(12,4,12,12),(13,2,6,55),(14,2,15,1),(15,1,14,1),(16,5,2,3),(17,2,3,2),(18,2,6,1),(19,15,4,1),(20,20,5,1),(21,20,5,3),(22,20,5,3),(23,20,5,3),(24,20,5,3),(25,20,5,3),(26,20,5,3),(27,20,5,3),(28,20,5,3),(29,20,5,3),(30,20,5,3);
/*!40000 ALTER TABLE `Orden_detalles` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `trg_productos` BEFORE INSERT ON `orden_detalles` FOR EACH ROW BEGIN
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

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `Ordenes`
--

DROP TABLE IF EXISTS `Ordenes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Ordenes` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `clienteId` int unsigned NOT NULL,
  `total` decimal(10,2) DEFAULT NULL,
  `direccion_envio` varchar(45) DEFAULT NULL,
  `fecha` timestamp NULL DEFAULT NULL,
  `estado` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `clienteId` (`clienteId`),
  CONSTRAINT `clienteId` FOREIGN KEY (`clienteId`) REFERENCES `Clientes` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Ordenes`
--

LOCK TABLES `Ordenes` WRITE;
/*!40000 ALTER TABLE `Ordenes` DISABLE KEYS */;
INSERT INTO `Ordenes` VALUES (1,1,5314.21,NULL,'2022-02-15 05:07:09',NULL),(2,3,4756.98,NULL,'2020-02-15 05:07:09',NULL),(3,5,656.30,NULL,'2006-02-15 05:07:09',NULL),(4,20,4587.39,NULL,'2006-02-15 05:07:09',NULL),(5,18,383.58,NULL,'2006-02-15 05:07:09',NULL),(6,15,4375.85,NULL,'2022-02-15 05:07:09',NULL),(7,11,4351.62,NULL,'2006-02-15 05:07:09',NULL),(8,9,281.33,NULL,'2020-02-15 05:07:09',NULL),(9,5,4270.67,NULL,'2020-02-18 05:07:09',NULL),(10,6,4455.65,NULL,'2020-02-15 05:07:09',NULL),(11,3,2217.52,NULL,'2020-02-16 05:07:09',NULL),(12,12,3722.54,NULL,'2020-02-15 05:07:09',NULL),(13,15,3655.55,NULL,'2020-04-15 05:07:09',NULL),(14,2,3639.59,NULL,'2020-02-15 05:07:09',NULL),(15,7,3549.64,NULL,'2020-02-15 05:07:09',NULL),(16,19,3417.72,NULL,'2020-05-15 05:07:09',NULL),(17,14,2210.50,NULL,'2020-02-15 05:07:09',NULL),(18,1,1633.22,NULL,'2020-02-15 05:07:09',NULL),(19,5,150.00,NULL,'2020-08-15 05:07:09',NULL),(20,11,1333.60,NULL,'2006-02-15 05:07:09',NULL);
/*!40000 ALTER TABLE `Ordenes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Productos`
--

DROP TABLE IF EXISTS `Productos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Productos` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `sku` varchar(45) DEFAULT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `precio` decimal(10,2) DEFAULT NULL,
  `descripcion` varchar(45) DEFAULT NULL,
  `imagen` varchar(45) DEFAULT NULL,
  `categoriaId` int unsigned NOT NULL,
  `stock` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Productos`
--

LOCK TABLES `Productos` WRITE;
/*!40000 ALTER TABLE `Productos` DISABLE KEYS */;
INSERT INTO `Productos` VALUES (1,'URB06W-IN','Jugo Naranja ',150.00,NULL,NULL,5,285),(2,'URC06W-AN','Vodka ',700.00,NULL,NULL,5,85),(3,'BRB05W-LN','Coca cola 1L',120.00,NULL,NULL,5,14),(4,'URB07W-IN','Coca cola lata',80.00,NULL,NULL,5,33),(5,'HJB0R6W-IN','Leche 1L',110.00,NULL,NULL,7,31),(6,'URR06W-FG','Peras 1kg',300.00,NULL,NULL,7,1250),(7,'URB06W-LA','Manteca 200gs',230.00,NULL,NULL,7,22),(8,'URSS6W-TR','Mermelada ',350.00,NULL,NULL,7,33),(9,'AAB06W-IN','Arroz 1kg',230.00,NULL,NULL,7,11),(10,'URBSSW-SS','Pollo kg',300.00,NULL,NULL,7,44),(11,'USS06W-IN','Sal 1kg',80.00,NULL,NULL,7,66),(12,'HDG06W-LO','Vinagre',60.00,NULL,NULL,7,88),(13,'URKK6W-IN','Tv 32',33000.00,NULL,NULL,8,29),(14,'URSSSW-SL','Plancha',6000.00,NULL,NULL,8,156),(15,'SSB06W-IS','Heladera',80000.00,NULL,NULL,8,3555),(16,'MMK6W-GG','Cafetera',15000.00,NULL,NULL,8,888),(17,'URSSTT-FD','Remera',3000.00,NULL,NULL,16,525),(18,'URRTBG-HG','Pantalon',7000.00,NULL,NULL,16,444),(19,'JHS06W-IN','Silla',8570.00,NULL,NULL,14,33),(20,'SSSE6W-WE','Mesa',200.00,NULL,NULL,14,4);
/*!40000 ALTER TABLE `Productos` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `trg_cambioPrecio` BEFORE UPDATE ON `productos` FOR EACH ROW BEGIN
DECLARE precioAnt INT;
SET precioAnt = (SELECT precio FROM Productos WHERE id = NEW.id LIMIT 1);

IF NEW.precio  <> precioAnt
 THEN
  INSERT INTO LogsCambioPrecio (productoId, precioAnterior, precioActual, fecha, hora )
  VALUES ( NEW.id, precioAnt, NEW.precio, CURDATE(), TIME_FORMAT( now(),'%r'));
 END IF ;

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `trg_BajoStock` AFTER UPDATE ON `productos` FOR EACH ROW BEGIN

IF NEW.stock  <  5
 THEN
  INSERT INTO LogsProductosBajoStock (productoId, precio, stock, fecha, hora )
  VALUES ( NEW.id, NEW.precio, NEW.stock, CURDATE(), TIME_FORMAT( now(),'%r'));
 END IF ;

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Temporary view structure for view `vw_categorias_con_mas_productos`
--

DROP TABLE IF EXISTS `vw_categorias_con_mas_productos`;
/*!50001 DROP VIEW IF EXISTS `vw_categorias_con_mas_productos`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_categorias_con_mas_productos` AS SELECT
 1 AS `Cantidad de productos`,
 1 AS `categoria`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_poductos_por_orden`
--

DROP TABLE IF EXISTS `vw_poductos_por_orden`;
/*!50001 DROP VIEW IF EXISTS `vw_poductos_por_orden`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_poductos_por_orden` AS SELECT
 1 AS `Orden #`,
 1 AS `Cliente #`,
 1 AS `Nombre`,
 1 AS `Cantidad de productos`,
 1 AS `Total`,
 1 AS `Fecha y hora de compra`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_precios_con_iva`
--

DROP TABLE IF EXISTS `vw_precios_con_iva`;
/*!50001 DROP VIEW IF EXISTS `vw_precios_con_iva`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_precios_con_iva` AS SELECT
 1 AS `id`,
 1 AS `producto`,
 1 AS `categoria`,
 1 AS `precio`,
 1 AS `iva`,
 1 AS `precio con iva`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_productos_mas_vendidos`
--

DROP TABLE IF EXISTS `vw_productos_mas_vendidos`;
/*!50001 DROP VIEW IF EXISTS `vw_productos_mas_vendidos`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_productos_mas_vendidos` AS SELECT
 1 AS `productoId`,
 1 AS `sku`,
 1 AS `nombre`,
 1 AS `precio`,
 1 AS `stock`,
 1 AS `Cantidad vendidos`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_productos_sin_stock`
--

DROP TABLE IF EXISTS `vw_productos_sin_stock`;
/*!50001 DROP VIEW IF EXISTS `vw_productos_sin_stock`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_productos_sin_stock` AS SELECT
 1 AS `id`,
 1 AS `producto`,
 1 AS `categoria`,
 1 AS `precio`,
 1 AS `stock`*/;
SET character_set_client = @saved_cs_client;

--
-- Dumping routines for database 'ecommerce'
--
/*!50003 DROP FUNCTION IF EXISTS `f_cuentaProductosConPrecioMenorA` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` FUNCTION `f_cuentaProductosConPrecioMenorA`(valor float) RETURNS int
    READS SQL DATA
BEGIN
    RETURN (SELECT count(*) FROM Productos WHERE precio < valor);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `f_getClienteId` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` FUNCTION `f_getClienteId`(ordenId INT) RETURNS int
    READS SQL DATA
BEGIN
	RETURN (SELECT clienteId FROM Ordenes WHERE id = ordenId);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_insertCategoria` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `sp_insertCategoria`(INOUT param1 INT , IN param2 CHAR(45), IN param3 CHAR(45), IN param4 CHAR(45) )
BEGIN
    SELECT MAX(id) INTO param1 FROM Categorias;
    SET param1 = param1 + 1 ;
    INSERT INTO Categorias (id , nombre, descripcion, imagen) VALUES ( param1, param2, param3, param4 );
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_ProductosOrdenados` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `sp_ProductosOrdenados`( IN campo CHAR(20), IN orden CHAR(4))
BEGIN
    SET @ordenar = concat('ORDER BY ', campo);
    SET @orden = orden;
    SET @clausula = concat('SELECT * FROM ecommerce.Productos ', @ordenar, ' ', @orden );
    PREPARE ejecutarSQL FROM @clausula;
    EXECUTE ejecutarSQL;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `vw_categorias_con_mas_productos`
--

/*!50001 DROP VIEW IF EXISTS `vw_categorias_con_mas_productos`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_categorias_con_mas_productos` AS select count(`p`.`id`) AS `Cantidad de productos`,`c`.`nombre` AS `categoria` from (`productos` `p` join `categorias` `c` on((`p`.`categoriaId` = `c`.`id`))) group by `p`.`categoriaId` order by count(`p`.`id`) desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_poductos_por_orden`
--

/*!50001 DROP VIEW IF EXISTS `vw_poductos_por_orden`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_poductos_por_orden` AS select `o`.`id` AS `Orden #`,`o`.`clienteId` AS `Cliente #`,`c`.`nombre` AS `Nombre`,sum(`od`.`cantidad`) AS `Cantidad de productos`,`o`.`total` AS `Total`,`o`.`fecha` AS `Fecha y hora de compra` from ((`ordenes` `o` join `orden_detalles` `od` on((`o`.`id` = `od`.`ordenId`))) join `clientes` `c` on((`c`.`id` = `o`.`clienteId`))) group by `o`.`id` order by `o`.`id` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_precios_con_iva`
--

/*!50001 DROP VIEW IF EXISTS `vw_precios_con_iva`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_precios_con_iva` AS select `p`.`id` AS `id`,`p`.`nombre` AS `producto`,`c`.`nombre` AS `categoria`,`p`.`precio` AS `precio`,format((`p`.`precio` * 0.21),2) AS `iva`,format((`p`.`precio` + (`p`.`precio` * 0.21)),2) AS `precio con iva` from (`productos` `p` join `categorias` `c` on((`p`.`categoriaId` = `c`.`id`))) order by `p`.`nombre` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_productos_mas_vendidos`
--

/*!50001 DROP VIEW IF EXISTS `vw_productos_mas_vendidos`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_productos_mas_vendidos` AS select `od`.`productoId` AS `productoId`,`p`.`sku` AS `sku`,`p`.`nombre` AS `nombre`,`p`.`precio` AS `precio`,`p`.`stock` AS `stock`,sum(`od`.`cantidad`) AS `Cantidad vendidos` from (`orden_detalles` `od` join `productos` `p` on((`od`.`productoId` = `p`.`id`))) group by `od`.`productoId` order by sum(`od`.`cantidad`) desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_productos_sin_stock`
--

/*!50001 DROP VIEW IF EXISTS `vw_productos_sin_stock`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_productos_sin_stock` AS select `p`.`id` AS `id`,`p`.`nombre` AS `producto`,`c`.`nombre` AS `categoria`,`p`.`precio` AS `precio`,`p`.`stock` AS `stock` from (`productos` `p` join `categorias` `c` on((`p`.`categoriaId` = `c`.`id`))) where (`p`.`stock` = 0) order by `p`.`nombre` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-03-09 18:56:59
