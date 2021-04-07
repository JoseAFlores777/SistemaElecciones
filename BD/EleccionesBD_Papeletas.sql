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
-- Table structure for table `Papeletas`
--

DROP TABLE IF EXISTS `Papeletas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Papeletas` (
  `idPapeleta` int NOT NULL AUTO_INCREMENT,
  `idPartido` int NOT NULL,
  `idTipo` int NOT NULL,
  `idPersona` varchar(45) NOT NULL,
  `Posicion` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idPapeleta`,`idPartido`,`idTipo`,`idPersona`),
  KEY `fk_Papeletas_Partidos1_idx` (`idPartido`),
  KEY `fk_Papeletas_Tipos1_idx` (`idTipo`),
  KEY `fk_Papeletas_Personas1_idx` (`idPersona`),
  CONSTRAINT `fk_Papeletas_Partidos1` FOREIGN KEY (`idPartido`) REFERENCES `Partidos` (`idPartido`),
  CONSTRAINT `fk_Papeletas_Personas1` FOREIGN KEY (`idPersona`) REFERENCES `Personas` (`idPersona`),
  CONSTRAINT `fk_Papeletas_Tipos1` FOREIGN KEY (`idTipo`) REFERENCES `Tipos` (`idTipo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Papeletas`
--

LOCK TABLES `Papeletas` WRITE;
/*!40000 ALTER TABLE `Papeletas` DISABLE KEYS */;
/*!40000 ALTER TABLE `Papeletas` ENABLE KEYS */;
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
