CREATE DATABASE  IF NOT EXISTS `compubill2` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_bin */;
USE `compubill2`;
-- MySQL dump 10.13  Distrib 8.0.33, for Win64 (x86_64)
--
-- Host: localhost    Database: compubill2
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
-- Table structure for table `clasificaciones`
--

DROP TABLE IF EXISTS `clasificaciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clasificaciones` (
  `IDClasificacion` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Clasificacion` varchar(45) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`IDClasificacion`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clasificaciones`
--

LOCK TABLES `clasificaciones` WRITE;
/*!40000 ALTER TABLE `clasificaciones` DISABLE KEYS */;
INSERT INTO `clasificaciones` VALUES (1,'SISTEMA'),(2,'CLIENTE');
/*!40000 ALTER TABLE `clasificaciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clientes`
--

DROP TABLE IF EXISTS `clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clientes` (
  `IDCliente` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `NombreCliente` varchar(80) COLLATE utf8_bin NOT NULL,
  `ApellidoCliente` varchar(80) COLLATE utf8_bin NOT NULL,
  `TelefonoCliente` varchar(20) COLLATE utf8_bin NOT NULL,
  `EmailCliente` varchar(80) COLLATE utf8_bin NOT NULL,
  `DUICliente` varchar(11) COLLATE utf8_bin NOT NULL,
  `GeneroCliente` enum('MASCULINO','FEMENINO') COLLATE utf8_bin NOT NULL,
  `NacimientoCliente` date NOT NULL,
  `IDDirecciones` int(10) unsigned NOT NULL,
  PRIMARY KEY (`IDCliente`),
  KEY `FK6_idx` (`IDDirecciones`),
  CONSTRAINT `FK6` FOREIGN KEY (`IDDirecciones`) REFERENCES `direcciones` (`IDDirecciones`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes`
--

LOCK TABLES `clientes` WRITE;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `compras`
--

DROP TABLE IF EXISTS `compras`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `compras` (
  `IDCompra` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `FechaCompras` date NOT NULL,
  `MontoCompras` decimal(2,0) NOT NULL,
  `IDCliente` int(10) unsigned NOT NULL,
  PRIMARY KEY (`IDCompra`),
  KEY `FK12_idx` (`IDCliente`),
  CONSTRAINT `FK12` FOREIGN KEY (`IDCliente`) REFERENCES `clientes` (`IDCliente`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `compras`
--

LOCK TABLES `compras` WRITE;
/*!40000 ALTER TABLE `compras` DISABLE KEYS */;
/*!40000 ALTER TABLE `compras` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `departamentos`
--

DROP TABLE IF EXISTS `departamentos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `departamentos` (
  `IDDepartamentos` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Departamento` varchar(12) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`IDDepartamentos`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departamentos`
--

LOCK TABLES `departamentos` WRITE;
/*!40000 ALTER TABLE `departamentos` DISABLE KEYS */;
INSERT INTO `departamentos` VALUES (1,'Ahuachapán'),(2,'Santa Ana'),(3,'Sonsonate'),(4,'La Libertad'),(5,'Chalatenango'),(6,'Cuscatlán'),(7,'San Salvador'),(8,'La Paz'),(9,'Cabañas'),(10,'San Vicente'),(11,'Usulután'),(12,'San Miguel'),(13,'Morazán'),(14,'La Unión');
/*!40000 ALTER TABLE `departamentos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detallecompras`
--

DROP TABLE IF EXISTS `detallecompras`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detallecompras` (
  `IDDetalleCompra` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `CantidadDCompra` int(11) NOT NULL,
  `IDProducto` int(10) unsigned NOT NULL,
  `IDCompra` int(10) unsigned NOT NULL,
  `PrecioProducto` decimal(2,0) NOT NULL,
  PRIMARY KEY (`IDDetalleCompra`),
  KEY `FK13_idx` (`IDCompra`),
  KEY `FK14_idx` (`IDProducto`),
  CONSTRAINT `FK13` FOREIGN KEY (`IDCompra`) REFERENCES `compras` (`IDCompra`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK14` FOREIGN KEY (`IDProducto`) REFERENCES `productos` (`IDProducto`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detallecompras`
--

LOCK TABLES `detallecompras` WRITE;
/*!40000 ALTER TABLE `detallecompras` DISABLE KEYS */;
/*!40000 ALTER TABLE `detallecompras` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detallefacturas`
--

DROP TABLE IF EXISTS `detallefacturas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detallefacturas` (
  `IDDetalleFactura` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ExistenciaDetalleFactura` int(11) NOT NULL,
  `IDPrecio` int(10) unsigned NOT NULL,
  `IVA` varchar(45) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`IDDetalleFactura`),
  KEY `FK15_idx` (`IDPrecio`),
  CONSTRAINT `FK15` FOREIGN KEY (`IDPrecio`) REFERENCES `productos` (`IDProducto`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detallefacturas`
--

LOCK TABLES `detallefacturas` WRITE;
/*!40000 ALTER TABLE `detallefacturas` DISABLE KEYS */;
/*!40000 ALTER TABLE `detallefacturas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detallepedidos`
--

DROP TABLE IF EXISTS `detallepedidos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detallepedidos` (
  `IDDetallePedido` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `CantidadDetallePedido` int(11) NOT NULL,
  `IDPedido` int(10) unsigned NOT NULL,
  `IDProducto` int(10) unsigned NOT NULL,
  `IDFacturaPedido` int(10) unsigned NOT NULL,
  PRIMARY KEY (`IDDetallePedido`),
  KEY `FK_15_idx` (`IDPedido`),
  KEY `FK16_idx` (`IDProducto`),
  KEY `FK_17_idx` (`IDFacturaPedido`),
  CONSTRAINT `FK_15` FOREIGN KEY (`IDPedido`) REFERENCES `pedidos` (`IDPedido`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_16` FOREIGN KEY (`IDProducto`) REFERENCES `productos` (`IDProducto`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_17` FOREIGN KEY (`IDFacturaPedido`) REFERENCES `facturapedidos` (`IDFacturaPedido`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detallepedidos`
--

LOCK TABLES `detallepedidos` WRITE;
/*!40000 ALTER TABLE `detallepedidos` DISABLE KEYS */;
/*!40000 ALTER TABLE `detallepedidos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `direcciones`
--

DROP TABLE IF EXISTS `direcciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `direcciones` (
  `IDDirecciones` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `NumeroCasa` varchar(5) COLLATE utf8_bin NOT NULL,
  `PasajePoligono` varchar(10) COLLATE utf8_bin DEFAULT NULL,
  `Calle` varchar(80) COLLATE utf8_bin DEFAULT NULL,
  `Colonia` varchar(80) COLLATE utf8_bin NOT NULL,
  `Canton` varchar(80) COLLATE utf8_bin NOT NULL,
  `Caserio` varchar(80) COLLATE utf8_bin DEFAULT NULL,
  `Municipio` varchar(80) COLLATE utf8_bin NOT NULL,
  `CodigoPostal` varchar(8) COLLATE utf8_bin DEFAULT NULL,
  `IDDepartamentos` int(10) unsigned NOT NULL,
  PRIMARY KEY (`IDDirecciones`),
  KEY `FK3_idx` (`IDDepartamentos`),
  CONSTRAINT `FK3` FOREIGN KEY (`IDDepartamentos`) REFERENCES `departamentos` (`IDDepartamentos`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `direcciones`
--

LOCK TABLES `direcciones` WRITE;
/*!40000 ALTER TABLE `direcciones` DISABLE KEYS */;
INSERT INTO `direcciones` VALUES (1,'N/A','N/A','N/A','N/A','Cara Sucia','N/A','San Francisco Menendez','CP2101',1),(2,'N/A','N/A','N/A','N/A','N/A','N/A','N/A','N/A',3);
/*!40000 ALTER TABLE `direcciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empleados`
--

DROP TABLE IF EXISTS `empleados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `empleados` (
  `IDEmpleado` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `NombresEmpleados` varchar(80) COLLATE utf8_bin NOT NULL,
  `ApellidosEmpleados` varchar(80) COLLATE utf8_bin NOT NULL,
  `TelefonoEmpleados` varchar(25) COLLATE utf8_bin NOT NULL,
  `EmailEmpleados` varchar(100) COLLATE utf8_bin NOT NULL,
  `DUIEmpleados` varchar(11) COLLATE utf8_bin NOT NULL,
  `NacimientoEmpleados` date NOT NULL,
  `GeneroEmpleados` enum('MASCULINO','FEMENINO') COLLATE utf8_bin NOT NULL,
  `IDDirecciones` int(10) unsigned NOT NULL,
  PRIMARY KEY (`IDEmpleado`),
  KEY `FK4_idx_idx` (`IDDirecciones`),
  CONSTRAINT `FK4` FOREIGN KEY (`IDDirecciones`) REFERENCES `direcciones` (`IDDirecciones`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empleados`
--

LOCK TABLES `empleados` WRITE;
/*!40000 ALTER TABLE `empleados` DISABLE KEYS */;
INSERT INTO `empleados` VALUES (1,'Natan Abel','Rivera Madrid','7011-5578','rm20i04003@usonsonate.edu.sv','0635****-9','2002-06-29','MASCULINO',1),(2,'Compu','Bill','0000-0000','compubill@compubill.com','000000','2023-05-28','MASCULINO',2);
/*!40000 ALTER TABLE `empleados` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `facturacompras`
--

DROP TABLE IF EXISTS `facturacompras`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `facturacompras` (
  `IDFacturaCompra` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `FechaFacturaCompra` date NOT NULL,
  `MontoFacturaCompra` decimal(2,0) NOT NULL,
  `TipoFacturaCompra` bit(1) NOT NULL,
  `FechaVencimientoFacturaCompra` date NOT NULL,
  `CCFE` varchar(20) COLLATE utf8_bin NOT NULL,
  `IDCliente` int(10) unsigned NOT NULL,
  `IDDetalleCompra` int(10) unsigned NOT NULL,
  `IDUsuario` int(10) unsigned NOT NULL,
  PRIMARY KEY (`IDFacturaCompra`),
  KEY `FK_18_idx` (`IDCliente`),
  KEY `FK_19_idx` (`IDDetalleCompra`),
  KEY `FK_20_idx` (`IDUsuario`),
  CONSTRAINT `FK_18` FOREIGN KEY (`IDCliente`) REFERENCES `clientes` (`IDCliente`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_19` FOREIGN KEY (`IDDetalleCompra`) REFERENCES `detallecompras` (`IDDetalleCompra`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_20` FOREIGN KEY (`IDUsuario`) REFERENCES `usuarios` (`IDUsuario`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `facturacompras`
--

LOCK TABLES `facturacompras` WRITE;
/*!40000 ALTER TABLE `facturacompras` DISABLE KEYS */;
/*!40000 ALTER TABLE `facturacompras` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `facturapedidos`
--

DROP TABLE IF EXISTS `facturapedidos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `facturapedidos` (
  `IDFacturaPedido` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `FechaFacturaPedido` date NOT NULL,
  `MontoFacturaPedido` decimal(2,0) NOT NULL,
  `PrecioFacturaPedido` int(11) NOT NULL,
  `TipoFacturaPedido` int(11) NOT NULL,
  `FechaVencimientoFacturaPedido` date NOT NULL,
  PRIMARY KEY (`IDFacturaPedido`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `facturapedidos`
--

LOCK TABLES `facturapedidos` WRITE;
/*!40000 ALTER TABLE `facturapedidos` DISABLE KEYS */;
/*!40000 ALTER TABLE `facturapedidos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `opciones`
--

DROP TABLE IF EXISTS `opciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `opciones` (
  `IDOpcion` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Opcion` varchar(80) COLLATE utf8_bin NOT NULL,
  `IDClasificaciones` int(10) unsigned NOT NULL,
  PRIMARY KEY (`IDOpcion`),
  KEY `FK111_idx` (`IDClasificaciones`),
  CONSTRAINT `FK111` FOREIGN KEY (`IDClasificaciones`) REFERENCES `clasificaciones` (`IDClasificacion`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `opciones`
--

LOCK TABLES `opciones` WRITE;
/*!40000 ALTER TABLE `opciones` DISABLE KEYS */;
INSERT INTO `opciones` VALUES (1,'INICIAR SESION',1),(2,'VER USUARIOS',1),(3,'AGREGAR USUARIO',1),(4,'EDITAR USUARIO',1),(5,'ELIMINAR USUARIO',1),(6,'VER CLIENTES',2),(7,'AGREGAR CLIENTES',2),(8,'EDITAR CLIENTES',2),(9,'ELIMINAR CLIENTES',2);
/*!40000 ALTER TABLE `opciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedidos`
--

DROP TABLE IF EXISTS `pedidos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pedidos` (
  `IDPedido` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `FechaPedidos` date NOT NULL,
  `MontoPedidos` decimal(2,0) NOT NULL,
  `IDProveedor` int(10) unsigned NOT NULL,
  PRIMARY KEY (`IDPedido`),
  KEY `FK11_idx` (`IDProveedor`),
  CONSTRAINT `FK11` FOREIGN KEY (`IDProveedor`) REFERENCES `proveedores` (`IDProveedor`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedidos`
--

LOCK TABLES `pedidos` WRITE;
/*!40000 ALTER TABLE `pedidos` DISABLE KEYS */;
/*!40000 ALTER TABLE `pedidos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permisos`
--

DROP TABLE IF EXISTS `permisos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `permisos` (
  `IDPermiso` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `IDOpcion` int(10) unsigned NOT NULL,
  `IDRol` int(10) unsigned NOT NULL,
  PRIMARY KEY (`IDPermiso`),
  KEY `FK9_idx` (`IDOpcion`),
  KEY `FK10_idx` (`IDRol`),
  CONSTRAINT `FK10` FOREIGN KEY (`IDRol`) REFERENCES `roles` (`IDRol`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK9` FOREIGN KEY (`IDOpcion`) REFERENCES `opciones` (`IDOpcion`) ON DELETE NO ACTION ON UPDATE NO ACTION
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
  `IDProducto` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `DescripcionProductos` longtext COLLATE utf8_bin NOT NULL,
  `PrecioProductos` decimal(2,0) NOT NULL,
  `ExistenciaProductos` int(11) NOT NULL,
  PRIMARY KEY (`IDProducto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productos`
--

LOCK TABLES `productos` WRITE;
/*!40000 ALTER TABLE `productos` DISABLE KEYS */;
/*!40000 ALTER TABLE `productos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proveedores`
--

DROP TABLE IF EXISTS `proveedores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `proveedores` (
  `IDProveedor` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `NombresProveedor` varchar(80) COLLATE utf8_bin NOT NULL,
  `ApellidosProveedor` varchar(80) COLLATE utf8_bin NOT NULL,
  `TelefonoProveedor` varchar(20) COLLATE utf8_bin NOT NULL,
  `EmailProveedor` varchar(80) COLLATE utf8_bin NOT NULL,
  `NITProveedor` varchar(11) COLLATE utf8_bin NOT NULL,
  `IDDirecciones` int(10) unsigned NOT NULL,
  PRIMARY KEY (`IDProveedor`),
  KEY `FK8_idx` (`IDDirecciones`),
  CONSTRAINT `FK8` FOREIGN KEY (`IDDirecciones`) REFERENCES `direcciones` (`IDDirecciones`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proveedores`
--

LOCK TABLES `proveedores` WRITE;
/*!40000 ALTER TABLE `proveedores` DISABLE KEYS */;
/*!40000 ALTER TABLE `proveedores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `IDRol` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Rol` varchar(60) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`IDRol`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'Administrador'),(2,'Programador'),(3,'System');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios` (
  `IDUsuario` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Usuario` varchar(60) COLLATE utf8_bin NOT NULL,
  `Clave` varchar(200) COLLATE utf8_bin NOT NULL,
  `IDRol` int(10) unsigned NOT NULL,
  `IDEmpleado` int(10) unsigned NOT NULL,
  PRIMARY KEY (`IDUsuario`),
  UNIQUE KEY `IDRol_UNIQUE` (`IDRol`),
  KEY `FK1_idx` (`IDRol`),
  KEY `FK2_idx` (`IDEmpleado`),
  CONSTRAINT `FK1` FOREIGN KEY (`IDRol`) REFERENCES `roles` (`IDRol`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK2` FOREIGN KEY (`IDEmpleado`) REFERENCES `empleados` (`IDEmpleado`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (1,'Natan','adcd7048512e64b48da55b027577886ee5a36350',2,1),(2,'CompuBill','adcd7048512e64b48da55b027577886ee5a36350',3,2);
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vendedor`
--

DROP TABLE IF EXISTS `vendedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vendedor` (
  `IDVendedor` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `NombresVendedor` varchar(80) COLLATE utf8_bin NOT NULL,
  `ApellidosVendedor` varchar(80) COLLATE utf8_bin NOT NULL,
  `TelefonoVendedor` varchar(20) COLLATE utf8_bin NOT NULL,
  `EmailVendedor` varchar(80) COLLATE utf8_bin NOT NULL,
  `NITVendedor` varchar(11) COLLATE utf8_bin NOT NULL,
  `IDDirecciones` int(10) unsigned NOT NULL,
  PRIMARY KEY (`IDVendedor`),
  KEY `FK7_idx` (`IDDirecciones`),
  CONSTRAINT `FK7` FOREIGN KEY (`IDDirecciones`) REFERENCES `direcciones` (`IDDirecciones`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vendedor`
--

LOCK TABLES `vendedor` WRITE;
/*!40000 ALTER TABLE `vendedor` DISABLE KEYS */;
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

-- Dump completed on 2023-06-03 13:04:23
