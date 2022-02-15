-- MySQL dump 10.13  Distrib 8.0.27, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: ecommerce
-- ------------------------------------------------------
-- Server version	8.0.27

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

--
-- Dumping data for table `Categorias`
--

LOCK TABLES `Categorias` WRITE;
/*!40000 ALTER TABLE `Categorias` DISABLE KEYS */;
INSERT INTO `Categorias` VALUES (1,'Arte y entretenimiento','Articulos de arte y entretenimiento','arte.png'),(2,'Articulos deportivos','Articulos deportivos','deportivos.png'),(3,'Articulos para Bebe','Articulos para Bebe','a_bebe.png'),(4,'Articulos para mascotas','Articulos para mascotas','a_mascotas.png'),(5,'Bebidas','Bebidas','bebidas.png'),(6,'Camaras y Optica','Camaras y Optica','optica.png'),(7,'Comida','Comida','food.png'),(8,'Electronica','Electronica','electro.png'),(9,'Equipaje y bolsos','Equipaje y bolsos','bolsos.png'),(10,'Hardware','Hardware','hardware.png'),(11,'Hogar & Jardin','Hogar & JardÃ­n','hogar.png'),(12,'Juguetes y Juegos','Juguetes y Juegos','juegos.png'),(13,'Material de oficina','Articulos de oficina','oficina.png'),(14,'Muebles','Muebles y Articulos de decoracion','muebles.png'),(15,'Negocio e industria','Articulos para negocios e industria','industria.png'),(16,'Ropa y accesorios','Ropa y accesorios','ropa.png'),(17,'Salud y Belleza','Salud y Belleza','salud.png'),(18,'Software','Software','software.png'),(19,'Tabaco','Tabaco','tabaco.png'),(20,'Vehiculos y Partes','Vehiculos y Partes','vehiculos.png');
/*!40000 ALTER TABLE `Categorias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `Clientes`
--

LOCK TABLES `Clientes` WRITE;
/*!40000 ALTER TABLE `Clientes` DISABLE KEYS */;
INSERT INTO `Clientes` VALUES (1,'jperez@example.com','12345','Juan Perez',NULL,NULL,'CABA','ARGENTINA',NULL),(2,'jlopez@example.com','12345','Julio Lopez',NULL,NULL,'BS. AS.','ARGENTINA',NULL),(3,'aledezma@example.com','12345','Adrian Ledezma',NULL,NULL,'BS. AS.','ARGENTINA',NULL),(4,'spacol@example.com','12345','Sandra Pacol',NULL,NULL,'BS. AS.','ARGENTINA',NULL),(5,'jcruz@example.com','12345','Juan Cruz',NULL,NULL,'CABA','ARGENTINA',NULL),(6,'ntemppa@example.com','12345','Nestor temppa',NULL,NULL,'CABA','ARGENTINA',NULL),(7,'acardozo@example.com','12345','Ariel Cardozo',NULL,NULL,'CABA','ARGENTINA',NULL),(8,'sloean@example.com','12345','Sandro Loean',NULL,NULL,'CABA','ARGENTINA',NULL),(9,'cmonti@example.com','12345','Carlos Monti',NULL,NULL,'CABA','ARGENTINA',NULL),(10,'ppascul@example.com','12345','Pedro Pascul',NULL,NULL,'BS. AS.','ARGENTINA',NULL),(11,'aserra@example.com','12345','Andres Serra',NULL,NULL,'BS. AS.','ARGENTINA',NULL),(12,'mlesa@example.com','12345','Macarena Lesa',NULL,NULL,'CORDOBA','ARGENTINA',NULL),(13,'flenco@example.com','12345','Franco Lenco',NULL,NULL,'CABA','ARGENTINA',NULL),(14,'msanchez<@example.com','12345','Marta Sanchez',NULL,NULL,'SALTA','ARGENTINA',NULL),(15,'lantoele@example.com','12345','Luis Antoele',NULL,NULL,'ENTRE RIOS','ARGENTINA',NULL),(16,'mdipalto@example.com','12345','Marcos Dipalto',NULL,NULL,'CABA','ARGENTINA',NULL),(17,'jcrulen@example.com','12345','Jesus Crulen',NULL,NULL,'CABA','ARGENTINA',NULL),(18,'fantares@example.com','12345','Federico Antares',NULL,NULL,'CABA','ARGENTINA',NULL),(19,'mcartuzi@example.com','12345','Melina Cartuzi',NULL,NULL,'CABA','ARGENTINA',NULL),(20,'plento@example.com','12345','Pablo Lento',NULL,NULL,'BS. AS.','ARGENTINA',NULL);
/*!40000 ALTER TABLE `Clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `Orden_detalles`
--

LOCK TABLES `Orden_detalles` WRITE;
/*!40000 ALTER TABLE `Orden_detalles` DISABLE KEYS */;
INSERT INTO `Orden_detalles` VALUES (1,2,3,5),(2,3,4,3),(3,4,12,2),(4,10,12,4),(5,12,1,6),(6,11,6,10),(7,1,3,22),(8,2,2,44),(9,3,4,45),(10,1,3,55),(11,5,4,12),(12,4,12,12),(13,2,6,55),(14,2,15,1),(15,1,14,1),(16,5,2,3),(17,2,3,2),(18,2,6,1),(19,15,4,1),(20,20,5,1);
/*!40000 ALTER TABLE `Orden_detalles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `Ordenes`
--

LOCK TABLES `Ordenes` WRITE;
/*!40000 ALTER TABLE `Ordenes` DISABLE KEYS */;
INSERT INTO `Ordenes` VALUES (1,'1',5314.21,NULL,'2022-02-15 05:07:09',NULL),(2,'3',4756.98,NULL,'2020-02-15 05:07:09',NULL),(3,'5',656.30,NULL,'2006-02-15 05:07:09',NULL),(4,'20',4587.39,NULL,'2006-02-15 05:07:09',NULL),(5,'18',383.58,NULL,'2006-02-15 05:07:09',NULL),(6,'15',4375.85,NULL,'2022-02-15 05:07:09',NULL),(7,'11',4351.62,NULL,'2006-02-15 05:07:09',NULL),(8,'9',281.33,NULL,'2020-02-15 05:07:09',NULL),(9,'5',4270.67,NULL,'2020-02-18 05:07:09',NULL),(10,'6',4455.65,NULL,'2020-02-15 05:07:09',NULL),(11,'3',2217.52,NULL,'2020-02-16 05:07:09',NULL),(12,'12',3722.54,NULL,'2020-02-15 05:07:09',NULL),(13,'15',3655.55,NULL,'2020-04-15 05:07:09',NULL),(14,'2',3639.59,NULL,'2020-02-15 05:07:09',NULL),(15,'7',3549.64,NULL,'2020-02-15 05:07:09',NULL),(16,'19',3417.72,NULL,'2020-05-15 05:07:09',NULL),(17,'14',2210.50,NULL,'2020-02-15 05:07:09',NULL),(18,'1',1633.22,NULL,'2020-02-15 05:07:09',NULL),(19,'5',150.00,NULL,'2020-08-15 05:07:09',NULL),(20,'11',1333.60,NULL,'2006-02-15 05:07:09',NULL);
/*!40000 ALTER TABLE `Ordenes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `Productos`
--

LOCK TABLES `Productos` WRITE;
/*!40000 ALTER TABLE `Productos` DISABLE KEYS */;
INSERT INTO `Productos` VALUES (1,'URB06W-IN','Jugo Naranja ',150.00,NULL,NULL,'5',285),(2,'URC06W-AN','Vodka ',700.00,NULL,NULL,'5',85),(3,'BRB05W-LN','Coca cola 1L',120.00,NULL,NULL,'5',14),(4,'URB07W-IN','Coca cola lata',80.00,NULL,NULL,'5',33),(5,'HJB0R6W-IN','Leche 1L',110.00,NULL,NULL,'7',26),(6,'URR06W-FG','Peras 1kg',300.00,NULL,NULL,'7',1250),(7,'URB06W-LA','Manteca 200gs',230.00,NULL,NULL,'7',22),(8,'URSS6W-TR','Mermelada ',350.00,NULL,NULL,'7',33),(9,'AAB06W-IN','Arroz 1kg',230.00,NULL,NULL,'7',11),(10,'URBSSW-SS','Pollo kg',300.00,NULL,NULL,'7',44),(11,'USS06W-IN','Sal 1kg',80.00,NULL,NULL,'7',66),(12,'HDG06W-LO','Vinagre',60.00,NULL,NULL,'7',88),(13,'URKK6W-IN','Tv 32',33000.00,NULL,NULL,'8',29),(14,'URSSSW-SL','Plancha',6000.00,NULL,NULL,'8',156),(15,'SSB06W-IS','Heladera',80000.00,NULL,NULL,'8',3555),(16,'MMK6W-GG','Cafetera',15000.00,NULL,NULL,'8',888),(17,'URSSTT-FD','Remera',3000.00,NULL,NULL,'16',525),(18,'URRTBG-HG','Pantalon',7000.00,NULL,NULL,'16',444),(19,'JHS06W-IN','Silla',8570.00,NULL,NULL,'14',33),(20,'SSSE6W-WE','Mesa',20520.00,NULL,NULL,'14',562);
/*!40000 ALTER TABLE `Productos` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-02-10 21:50:56
