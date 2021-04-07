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
-- Table structure for table `Votos`
--

DROP TABLE IF EXISTS `Votos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Votos` (
  `idVoto` int NOT NULL AUTO_INCREMENT,
  `idMesa` int NOT NULL,
  `idPartido` int NOT NULL,
  `idTipo` int NOT NULL,
  `idPersona` varchar(45) NOT NULL,
  `Votos` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`idVoto`),
  UNIQUE KEY `IX_VotoU` (`idMesa`,`idPartido`,`idTipo`,`idPersona`),
  KEY `fk_Votos_Tipos1_idx` (`idTipo`),
  KEY `fk_Votos_Partidos1_idx` (`idPartido`),
  KEY `fk_Votos_Personas10_idx` (`idPersona`),
  CONSTRAINT `fk_Votos_Mesas10` FOREIGN KEY (`idMesa`) REFERENCES `Mesas` (`idMesa`),
  CONSTRAINT `fk_Votos_Partidos10` FOREIGN KEY (`idPartido`) REFERENCES `Partidos` (`idPartido`),
  CONSTRAINT `fk_Votos_Personas10` FOREIGN KEY (`idPersona`) REFERENCES `Personas` (`idPersona`),
  CONSTRAINT `fk_Votos_Tipos10` FOREIGN KEY (`idTipo`) REFERENCES `Tipos` (`idTipo`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Votos`
--

LOCK TABLES `Votos` WRITE;
/*!40000 ALTER TABLE `Votos` DISABLE KEYS */;
INSERT INTO `Votos` VALUES (21,1,1,1,'0813198400131',9),(22,1,3,3,'1501195400427',5),(23,1,2,2,'0313195900122',2),(24,1,5,3,'0718196100041',3),(25,1,4,2,'0701196800255',3),(26,1,2,1,'0801199603086',2),(27,5,2,1,'0801199603086',2),(28,5,5,3,'0718196100041',2),(29,5,4,2,'0701196800255',2),(30,5,3,3,'1501195400427',1),(31,2,2,1,'0801199603086',1),(32,2,2,2,'0313195900122',1),(33,2,7,1,'0801199603089',1),(34,2,3,3,'1501195400427',1),(35,2,5,3,'0718196100041',1),(36,1,3,1,'0801199115862',1);
/*!40000 ALTER TABLE `Votos` ENABLE KEYS */;
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
