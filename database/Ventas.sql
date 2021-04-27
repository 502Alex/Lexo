create database proyecto;
use proyecto;
-- MySQL dump 10.13  Distrib 8.0.23, for Win64 (x86_64)
--
-- Host: localhost    Database: ventas
-- ------------------------------------------------------
-- Server version	8.0.23

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
-- Table structure for table `producto`
--

DROP TABLE IF EXISTS `producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `producto` (
  `id` int NOT NULL,
  'ultumaactua' timestamp not null DEFAULT current_timestamp;
  `nombre` varchar(45) DEFAULT NULL,
  `tipo` varchar(45) DEFAULT NULL,
  `Existencia` int DEFAULT NULL,
  `Precio` decimal(10,0) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `producto`
--

LOCK TABLES `producto` WRITE;
/*!40000 ALTER TABLE `producto` DISABLE KEYS */;
/*!40000 ALTER TABLE `producto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `registroclientes`
--

DROP TABLE IF EXISTS `registroclientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `registroclientes` (
  `Id` int NOT NULL,
  `Nombre` varchar(45) NOT NULL,
  `Apellido` varchar(45) NOT NULL,
  `DPI` int DEFAULT NULL,
  `Numero` int DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `registroclientes`
--

LOCK TABLES `registroclientes` WRITE;
/*!40000 ALTER TABLE `registroclientes` DISABLE KEYS */;
/*!40000 ALTER TABLE `registroclientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `registroventas`
--

DROP TABLE IF EXISTS `registroventas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `registroventas` (
  `Id` int NOT NULL,
  `idproducto` int NOT NULL,
  `Cantidad` int NOT NULL,
  `Precio` decimal(10,0) NOT NULL,
  `Total` decimal(10,0) DEFAULT NULL,
  `IdCliente` int DEFAULT NULL,
  `IdVendedor` int DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `Fk_cliente_idx` (`IdCliente`),
  KEY `Fk_Producto_idx` (`idproducto`),
  KEY `Fk_vendedor_idx` (`IdVendedor`),
  CONSTRAINT `Fk_cliente` FOREIGN KEY (`IdCliente`) REFERENCES `registroclientes` (`Id`),
  CONSTRAINT `Fk_Producto` FOREIGN KEY (`idproducto`) REFERENCES `producto` (`id`),
  CONSTRAINT `Fk_vendedor` FOREIGN KEY (`IdVendedor`) REFERENCES `users(vendedores)` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `registroventas`
--

LOCK TABLES `registroventas` WRITE;
/*!40000 ALTER TABLE `registroventas` DISABLE KEYS */;
/*!40000 ALTER TABLE `registroventas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users(vendedores)`
--

DROP TABLE IF EXISTS `users(vendedores)`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users(vendedores)` (
  `ID` int NOT NULL,
  'Nombre_Usuario' varchar(80) not null,
  'Usuario_contraseña' varchar(350) not null,
  `Nombre_y_Apellido` varchar(45) NOT NULL,
  `Residencia` varchar(45) NOT NULL,
  `Telefono` int NOT NULL,
  `Correo_electronico` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users(vendedores)`
--

LOCK TABLES `users(vendedores)` WRITE;
/*!40000 ALTER TABLE `users(vendedores)` DISABLE KEYS */;
/*!40000 ALTER TABLE `users(vendedores)` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'ventas'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-04-11 12:12:46
