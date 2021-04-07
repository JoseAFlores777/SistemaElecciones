-- MySQL dump 10.13  Distrib 8.0.20, for macos10.15 (x86_64)
--
-- Host: localhost    Database: EleccionesBD
-- ------------------------------------------------------
-- Server version	8.0.22

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
-- Table structure for table `Mesas`
--

DROP TABLE IF EXISTS `Mesas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Mesas` (
  `idMesa` int NOT NULL AUTO_INCREMENT,
  `idMunicipio` int NOT NULL,
  `Nombre` varchar(45) NOT NULL,
  `Latitud` varchar(45) DEFAULT NULL,
  `Longitud` varchar(45) DEFAULT NULL,
  `Apertura` datetime DEFAULT NULL,
  `Cierre` datetime DEFAULT NULL,
  `Estado` varchar(45) NOT NULL DEFAULT '1',
  PRIMARY KEY (`idMesa`),
  KEY `fk_Mesas_Municipios1_idx` (`idMunicipio`),
  CONSTRAINT `fk_Mesas_Municipios1` FOREIGN KEY (`idMunicipio`) REFERENCES `Municipios` (`idMunicipio`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Mesas`
--

LOCK TABLES `Mesas` WRITE;
/*!40000 ALTER TABLE `Mesas` DISABLE KEYS */;
INSERT INTO `Mesas` VALUES (1,110,'Instituto Evangélico Virginia Sapp','14.109805448711603','-87.17988609608223','2021-03-24 21:59:37',NULL,'2'),(2,110,'Liceo Español','14.104511127823212','-87.19141335382197','2021-03-24 16:30:51',NULL,'2'),(3,110,'Escuela Santa MargaritaSanta Margarita','14.11148682218552','-87.18436278689208',NULL,NULL,'1'),(4,72,'Santa María del Valle (Escuela Bilingüe)','15.56843591952377','-88.03278359548872',NULL,NULL,'1'),(5,72,'Escuela EuropaSchule','15.533931984244475','-88.03653790221937','2021-03-24 12:33:03',NULL,'2'),(6,72,'Holy Family Bilingual School','15.519970592562869','-88.00944951571387',NULL,NULL,'1'),(8,1,'2','3','3',NULL,NULL,'1'),(9,110,'Escuela Evangélica Peniel','14.045507032931106','-87.53413671875',NULL,NULL,'1');
/*!40000 ALTER TABLE `Mesas` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-04-06 21:31:59
