CREATE DATABASE  IF NOT EXISTS `compubill` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_bin */;
USE `compubill`;
-- MySQL dump 10.13  Distrib 8.0.33, for Win64 (x86_64)
--
-- Host: localhost    Database: compubill
-- ------------------------------------------------------
-- Server version	5.7.42-log

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
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente` (
  `Id_Cliente` int(11) NOT NULL AUTO_INCREMENT,
  `Nombres_Cliente` varchar(80) COLLATE utf8_bin NOT NULL,
  `Apellidos_Cliente` varchar(80) COLLATE utf8_bin NOT NULL,
  `Telefono_Cliente` varchar(20) COLLATE utf8_bin NOT NULL,
  `Email_Cliente` varchar(80) COLLATE utf8_bin NOT NULL,
  `Id_Direcciones_Cliente` int(11) NOT NULL,
  `DUI_Cliente` varchar(11) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`Id_Cliente`),
  KEY `FK_5` (`Id_Direcciones_Cliente`),
  CONSTRAINT `Id_Direcciones_Cliente` FOREIGN KEY (`Id_Direcciones_Cliente`) REFERENCES `direcciones` (`Id_Direcciones`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES (1,'Benito ','Camelo','7070-0101','CameloBenes123@U.com',1,'06353556-1');
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `compras`
--

DROP TABLE IF EXISTS `compras`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `compras` (
  `Id_Compras` int(11) NOT NULL AUTO_INCREMENT,
  `Fecha_Compras` datetime NOT NULL,
  `Monto_Compras` decimal(2,0) NOT NULL,
  `Id_Cliente_Compras` int(11) NOT NULL,
  PRIMARY KEY (`Id_Compras`),
  KEY `FK_11` (`Id_Cliente_Compras`),
  CONSTRAINT `Id_Cliente_Compras` FOREIGN KEY (`Id_Cliente_Compras`) REFERENCES `cliente` (`Id_Cliente`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `compras`
--

LOCK TABLES `compras` WRITE;
/*!40000 ALTER TABLE `compras` DISABLE KEYS */;
INSERT INTO `compras` VALUES (1,'2024-04-21 00:00:00',12,1);
/*!40000 ALTER TABLE `compras` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `departamentos`
--

DROP TABLE IF EXISTS `departamentos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `departamentos` (
  `Id_Departamentos` int(11) NOT NULL AUTO_INCREMENT,
  `Departamento` varchar(12) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`Id_Departamentos`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departamentos`
--

LOCK TABLES `departamentos` WRITE;
/*!40000 ALTER TABLE `departamentos` DISABLE KEYS */;
INSERT INTO `departamentos` VALUES (1,'Ahuachapán'),(2,'Cabañas'),(3,'Chalatenango'),(4,'Cuscatlán'),(5,'La Libertad'),(6,'Morazán'),(7,'La Paz'),(8,'Santa Ana'),(9,'San Miguel'),(10,'San Salvador'),(11,'San Vicente'),(12,'Sonsonate'),(13,'La Union'),(14,'Usulután');
/*!40000 ALTER TABLE `departamentos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detalle_compras`
--

DROP TABLE IF EXISTS `detalle_compras`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detalle_compras` (
  `Id_Detalle_Compras` int(11) NOT NULL AUTO_INCREMENT,
  `Cantidad_Detalle_Compras` int(11) NOT NULL,
  `Id_Productos_Detalle_Compras` int(11) NOT NULL,
  `Id_Compras_Detalle_Compras` int(11) NOT NULL,
  `Precio_Producto` decimal(2,0) NOT NULL,
  PRIMARY KEY (`Id_Detalle_Compras`),
  KEY `FK_15` (`Id_Productos_Detalle_Compras`),
  KEY `FK_16` (`Id_Compras_Detalle_Compras`),
  CONSTRAINT `Id_Compras_Detalle_Compras` FOREIGN KEY (`Id_Compras_Detalle_Compras`) REFERENCES `compras` (`Id_Compras`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `Id_Productos_Detalle_Compras` FOREIGN KEY (`Id_Productos_Detalle_Compras`) REFERENCES `productos` (`Id_Productos`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalle_compras`
--

LOCK TABLES `detalle_compras` WRITE;
/*!40000 ALTER TABLE `detalle_compras` DISABLE KEYS */;
INSERT INTO `detalle_compras` VALUES (1,500,1,1,12);
/*!40000 ALTER TABLE `detalle_compras` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detalle_factura`
--

DROP TABLE IF EXISTS `detalle_factura`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detalle_factura` (
  `Id_Detalle_Factura` int(11) NOT NULL AUTO_INCREMENT,
  `Id_Producto_Detalle_Factura` int(11) NOT NULL,
  `Existencia_Detalle_Factura` int(11) NOT NULL,
  `Precio_Producto_Detalle_Factura` decimal(2,0) NOT NULL,
  `IVA` decimal(2,0) DEFAULT NULL,
  PRIMARY KEY (`Id_Detalle_Factura`),
  KEY `Id_Producto_Detalle_Factura_idx` (`Id_Producto_Detalle_Factura`),
  CONSTRAINT `Id_Producto_Detalle_Factura` FOREIGN KEY (`Id_Producto_Detalle_Factura`) REFERENCES `productos` (`Id_Productos`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalle_factura`
--

LOCK TABLES `detalle_factura` WRITE;
/*!40000 ALTER TABLE `detalle_factura` DISABLE KEYS */;
/*!40000 ALTER TABLE `detalle_factura` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detalle_pedidos`
--

DROP TABLE IF EXISTS `detalle_pedidos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detalle_pedidos` (
  `Id_Detalle_Pedidos` int(11) NOT NULL AUTO_INCREMENT,
  `Cantidad_Detalle_Pedidos` int(11) NOT NULL,
  `Precio_Pedidos_Detalle_Pedidos` decimal(2,0) NOT NULL,
  `Id_Producto_Detalle_Pedidos` int(11) NOT NULL,
  `Id_Factura_Pedidos_Detalle_Pedidos` int(11) NOT NULL,
  `Id_Pedidos_Pedidos_Detalle` int(11) NOT NULL,
  PRIMARY KEY (`Id_Detalle_Pedidos`),
  KEY `FK_20` (`Id_Producto_Detalle_Pedidos`),
  KEY `FK_21` (`Id_Factura_Pedidos_Detalle_Pedidos`),
  KEY `FK_22` (`Id_Pedidos_Pedidos_Detalle`),
  CONSTRAINT `Id_Factura_Pedidos_Detalle_Pedidos` FOREIGN KEY (`Id_Factura_Pedidos_Detalle_Pedidos`) REFERENCES `factura_pedidos` (`Id_Factura_Pedidos`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `Id_Pedidos_Pedidos_Detalle` FOREIGN KEY (`Id_Pedidos_Pedidos_Detalle`) REFERENCES `pedidos` (`Id_Pedidos`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `Id_Producto_Detalle_Pedidos` FOREIGN KEY (`Id_Producto_Detalle_Pedidos`) REFERENCES `productos` (`Id_Productos`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalle_pedidos`
--

LOCK TABLES `detalle_pedidos` WRITE;
/*!40000 ALTER TABLE `detalle_pedidos` DISABLE KEYS */;
/*!40000 ALTER TABLE `detalle_pedidos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `direcciones`
--

DROP TABLE IF EXISTS `direcciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `direcciones` (
  `Id_Direcciones` int(11) NOT NULL AUTO_INCREMENT,
  `Numero_Casa` varchar(5) COLLATE utf8_bin DEFAULT NULL,
  `Pasaje_Poligono` varchar(10) COLLATE utf8_bin DEFAULT NULL,
  `Calle` varchar(80) COLLATE utf8_bin NOT NULL,
  `Colonia` varchar(80) COLLATE utf8_bin DEFAULT NULL,
  `Canton` varchar(80) COLLATE utf8_bin NOT NULL,
  `Caserio` varchar(80) COLLATE utf8_bin DEFAULT NULL,
  `Municipio` varchar(80) COLLATE utf8_bin NOT NULL,
  `Codigo_Postal` varchar(6) COLLATE utf8_bin DEFAULT NULL,
  `Id_Departamentos` int(11) NOT NULL,
  PRIMARY KEY (`Id_Direcciones`),
  KEY `FK_3` (`Id_Departamentos`),
  CONSTRAINT `Id_Departamentos` FOREIGN KEY (`Id_Departamentos`) REFERENCES `departamentos` (`Id_Departamentos`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `direcciones`
--

LOCK TABLES `direcciones` WRITE;
/*!40000 ALTER TABLE `direcciones` DISABLE KEYS */;
INSERT INTO `direcciones` VALUES (1,'33','1','13','Belen','Las Tablas','Del mono','Izalco','03005',12),(2,'32','2','10','Belen','Las Tablas','Del mono','Ss','00101',10),(3,'31','3','18','Belen','Las Tablas','Del mono','SS','00000',13),(4,'30','4','19','Belen','Las Tablas','Del mono','SSS','01010',3);
/*!40000 ALTER TABLE `direcciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empleados`
--

DROP TABLE IF EXISTS `empleados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `empleados` (
  `Id_Empleados` int(11) NOT NULL AUTO_INCREMENT,
  `Nombres_Empleados` varchar(80) COLLATE utf8_bin NOT NULL,
  `Apellidos_Empleados` varchar(80) COLLATE utf8_bin NOT NULL,
  `Telefono_Empleados` varchar(20) COLLATE utf8_bin NOT NULL,
  `Email_Empleados` varchar(80) COLLATE utf8_bin NOT NULL,
  `Id_Direcciones_Empleados` int(11) NOT NULL,
  `DUI_Empleados` varchar(11) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`Id_Empleados`),
  KEY `FK_4` (`Id_Direcciones_Empleados`),
  CONSTRAINT `Id_Direcciones_Empleados` FOREIGN KEY (`Id_Direcciones_Empleados`) REFERENCES `direcciones` (`Id_Direcciones`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empleados`
--

LOCK TABLES `empleados` WRITE;
/*!40000 ALTER TABLE `empleados` DISABLE KEYS */;
INSERT INTO `empleados` VALUES (1,'Nayib','Bukele','0010-0002','bukele@sv.gob',2,'00120282-3');
/*!40000 ALTER TABLE `empleados` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `factura_compras`
--

DROP TABLE IF EXISTS `factura_compras`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `factura_compras` (
  `Id_Factura_Compras` int(11) NOT NULL AUTO_INCREMENT,
  `Fecha_Factura_Compras` datetime NOT NULL,
  `Monto_Factura_Compras` decimal(2,0) NOT NULL,
  `Tipo_Factura_Compras` bit(1) DEFAULT NULL,
  `Fecha_Vencimiento_Factura_Compras` datetime NOT NULL,
  `CCFE` varchar(19) COLLATE utf8_bin DEFAULT NULL,
  `Id_Cliente_Factura_Compras` int(11) NOT NULL,
  `Id_Detalle_Compra_Factura_Compras` int(11) NOT NULL,
  `Id_Usuarios_Factura_Compras` int(10) NOT NULL,
  PRIMARY KEY (`Id_Factura_Compras`),
  KEY `FK_17` (`Id_Cliente_Factura_Compras`),
  KEY `FK_18` (`Id_Detalle_Compra_Factura_Compras`),
  KEY `FK_19` (`Id_Usuarios_Factura_Compras`),
  CONSTRAINT `Id_Cliente_Factura_Compras` FOREIGN KEY (`Id_Cliente_Factura_Compras`) REFERENCES `cliente` (`Id_Cliente`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `Id_Detalle_Compra_Factura_Compras` FOREIGN KEY (`Id_Detalle_Compra_Factura_Compras`) REFERENCES `compras` (`Id_Compras`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `Id_Usuarios_Factura_Compras` FOREIGN KEY (`Id_Usuarios_Factura_Compras`) REFERENCES `usuarios` (`Id_Usuarios`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `factura_compras`
--

LOCK TABLES `factura_compras` WRITE;
/*!40000 ALTER TABLE `factura_compras` DISABLE KEYS */;
INSERT INTO `factura_compras` VALUES (1,'2023-04-22 00:00:00',12,NULL,'2024-04-22 00:00:00',NULL,1,1,1);
/*!40000 ALTER TABLE `factura_compras` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `factura_pedidos`
--

DROP TABLE IF EXISTS `factura_pedidos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `factura_pedidos` (
  `Id_Factura_Pedidos` int(11) NOT NULL AUTO_INCREMENT,
  `Fecha_Factura_Pedidos` datetime NOT NULL,
  `Monto_Factura_Pedidos` decimal(2,0) NOT NULL,
  `Precio_Factura_Pedidos` int(11) NOT NULL,
  `Tipo_Factura_Pedidos` int(11) NOT NULL,
  `Fecha_Vencimiento_Factura_Pedidos` datetime NOT NULL,
  PRIMARY KEY (`Id_Factura_Pedidos`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `factura_pedidos`
--

LOCK TABLES `factura_pedidos` WRITE;
/*!40000 ALTER TABLE `factura_pedidos` DISABLE KEYS */;
INSERT INTO `factura_pedidos` VALUES (1,'2023-04-21 00:00:00',12,500,1,'2024-04-21 00:00:00');
/*!40000 ALTER TABLE `factura_pedidos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `opciones`
--

DROP TABLE IF EXISTS `opciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `opciones` (
  `Id_Opciones` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Opcion` varchar(60) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`Id_Opciones`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `opciones`
--

LOCK TABLES `opciones` WRITE;
/*!40000 ALTER TABLE `opciones` DISABLE KEYS */;
/*!40000 ALTER TABLE `opciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedidos`
--

DROP TABLE IF EXISTS `pedidos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pedidos` (
  `Id_Pedidos` int(11) NOT NULL AUTO_INCREMENT,
  `Fecha_Pedidos` datetime NOT NULL,
  `Monto_Pedidos` decimal(2,0) NOT NULL,
  `Id_Proveedores_Pedidos` int(11) NOT NULL,
  PRIMARY KEY (`Id_Pedidos`),
  KEY `FK_14` (`Id_Proveedores_Pedidos`),
  CONSTRAINT `Id_Proveedores_Pedidos` FOREIGN KEY (`Id_Proveedores_Pedidos`) REFERENCES `proveedores` (`Id_Proveedores`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedidos`
--

LOCK TABLES `pedidos` WRITE;
/*!40000 ALTER TABLE `pedidos` DISABLE KEYS */;
INSERT INTO `pedidos` VALUES (1,'2023-04-21 00:00:00',12,1);
/*!40000 ALTER TABLE `pedidos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permisos`
--

DROP TABLE IF EXISTS `permisos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `permisos` (
  `Id_Permisos` int(10) NOT NULL AUTO_INCREMENT,
  `Id_Opciones` int(10) unsigned NOT NULL,
  `Id_Rol` int(10) NOT NULL,
  PRIMARY KEY (`Id_Permisos`),
  UNIQUE KEY `FK_1` (`Id_Opciones`),
  KEY `FK_2` (`Id_Rol`),
  CONSTRAINT `Id_Opciones` FOREIGN KEY (`Id_Opciones`) REFERENCES `opciones` (`Id_Opciones`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `Id_Rol` FOREIGN KEY (`Id_Rol`) REFERENCES `rol` (`Id_Rol`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permisos`
--

LOCK TABLES `permisos` WRITE;
/*!40000 ALTER TABLE `permisos` DISABLE KEYS */;
/*!40000 ALTER TABLE `permisos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productos`
--

DROP TABLE IF EXISTS `productos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `productos` (
  `Id_Productos` int(11) NOT NULL AUTO_INCREMENT,
  `Descripcion_Producto` longtext COLLATE utf8_bin,
  `Precio_Producto` decimal(2,0) NOT NULL,
  `Existencia_Producto` int(11) DEFAULT NULL,
  PRIMARY KEY (`Id_Productos`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productos`
--

LOCK TABLES `productos` WRITE;
/*!40000 ALTER TABLE `productos` DISABLE KEYS */;
INSERT INTO `productos` VALUES (1,'MouseGamerNP500',12,500);
/*!40000 ALTER TABLE `productos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proveedores`
--

DROP TABLE IF EXISTS `proveedores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `proveedores` (
  `Id_Proveedores` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre_Proveedores` varchar(80) COLLATE utf8_bin NOT NULL,
  `Apellidos_Proveedores` varchar(80) COLLATE utf8_bin NOT NULL,
  `Telefono_Proveedores` varchar(20) COLLATE utf8_bin NOT NULL,
  `Email_Proveedores` varchar(80) COLLATE utf8_bin NOT NULL,
  `Id_Direcciones_Proveedores` int(11) NOT NULL,
  `NIT` int(11) NOT NULL,
  PRIMARY KEY (`Id_Proveedores`),
  KEY `FK_13` (`Id_Direcciones_Proveedores`),
  CONSTRAINT `Id_Direcciones_Proveedores` FOREIGN KEY (`Id_Direcciones_Proveedores`) REFERENCES `direcciones` (`Id_Direcciones`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proveedores`
--

LOCK TABLES `proveedores` WRITE;
/*!40000 ALTER TABLE `proveedores` DISABLE KEYS */;
INSERT INTO `proveedores` VALUES (1,'Asus','Inc','7070-7070','asus@suportt.com',1,54546654);
/*!40000 ALTER TABLE `proveedores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rol`
--

DROP TABLE IF EXISTS `rol`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rol` (
  `Id_Rol` int(10) NOT NULL AUTO_INCREMENT,
  `Rol` varchar(60) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`Id_Rol`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rol`
--

LOCK TABLES `rol` WRITE;
/*!40000 ALTER TABLE `rol` DISABLE KEYS */;
INSERT INTO `rol` VALUES (1,'Administrador');
/*!40000 ALTER TABLE `rol` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios` (
  `Id_Usuarios` int(11) NOT NULL AUTO_INCREMENT,
  `Usuario` varchar(60) COLLATE utf8_bin NOT NULL,
  `Clave` varchar(200) COLLATE utf8_bin NOT NULL,
  `Id_Rol_Usuarios` int(10) NOT NULL,
  `Id_Empleados_Usuarios` int(10) DEFAULT NULL,
  `Id_Cliente_Usuarios` int(10) DEFAULT NULL,
  `Id_Vendedor_Usuarios` int(10) DEFAULT NULL,
  PRIMARY KEY (`Id_Usuarios`),
  KEY `FK_7` (`Id_Rol_Usuarios`),
  KEY `FK_8` (`Id_Empleados_Usuarios`),
  KEY `FK_9` (`Id_Cliente_Usuarios`),
  KEY `FK_10` (`Id_Vendedor_Usuarios`),
  CONSTRAINT `Id_Cliente_Usuarios` FOREIGN KEY (`Id_Cliente_Usuarios`) REFERENCES `cliente` (`Id_Cliente`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `Id_Empleados_Usuarios` FOREIGN KEY (`Id_Empleados_Usuarios`) REFERENCES `empleados` (`Id_Empleados`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `Id_Rol_Usuarios` FOREIGN KEY (`Id_Rol_Usuarios`) REFERENCES `rol` (`Id_Rol`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `Id_Vendedor_Usuarios` FOREIGN KEY (`Id_Vendedor_Usuarios`) REFERENCES `vendedor` (`Id_Vendedor`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (1,'CompuBill','adcd7048512e64b48da55b027577886ee5a36350',1,1,NULL,NULL),(2,'Natan1','6116afedcb0bc31083935c1c262ff4c9',1,1,NULL,NULL);
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vendedor`
--

DROP TABLE IF EXISTS `vendedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vendedor` (
  `Id_Vendedor` int(11) NOT NULL AUTO_INCREMENT,
  `Nombres_Vendedor` varchar(80) COLLATE utf8_bin NOT NULL,
  `Apellidos_Vendedor` varchar(80) COLLATE utf8_bin NOT NULL,
  `Telefono_Vendedor` varchar(20) COLLATE utf8_bin NOT NULL,
  `Email_Vendedor` varchar(80) COLLATE utf8_bin NOT NULL,
  `Id_Direcciones_Vendedor` int(11) NOT NULL,
  `NIT_Vendedor` int(11) NOT NULL,
  PRIMARY KEY (`Id_Vendedor`),
  KEY `FK_6` (`Id_Direcciones_Vendedor`),
  CONSTRAINT `Id_Direcciones_Vendedor` FOREIGN KEY (`Id_Direcciones_Vendedor`) REFERENCES `direcciones` (`Id_Direcciones`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vendedor`
--

LOCK TABLES `vendedor` WRITE;
/*!40000 ALTER TABLE `vendedor` DISABLE KEYS */;
INSERT INTO `vendedor` VALUES (1,'Pepe','Del toro','7050-9876','pepemend@gmail.com',3,501321856);
/*!40000 ALTER TABLE `vendedor` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-05-26 23:15:07
