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
-- Table structure for table `Personas`
--

DROP TABLE IF EXISTS `Personas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Personas` (
  `idPersona` varchar(45) NOT NULL,
  `idTipo` int DEFAULT NULL,
  `idMesa` int DEFAULT NULL,
  `idPartido` int DEFAULT NULL,
  `Contra` varchar(45) NOT NULL,
  `PrimerNombre` varchar(45) DEFAULT NULL,
  `SegundoNombre` varchar(45) DEFAULT NULL,
  `TercerNombre` varchar(45) DEFAULT NULL,
  `PrimerApellido` varchar(45) DEFAULT NULL,
  `SegundoApellido` varchar(45) DEFAULT NULL,
  `Foto` varchar(400) DEFAULT 'SinFoto.png',
  `Estado_Voto` int DEFAULT '1',
  `Estado` tinyint DEFAULT '1',
  PRIMARY KEY (`idPersona`),
  KEY `fk_Personas_Tipos1_idx` (`idTipo`),
  KEY `fk_Personas_Mesas1_idx` (`idMesa`),
  KEY `fk_Personas_Partidos1_idx` (`idPartido`),
  CONSTRAINT `fk_Personas_Mesas1` FOREIGN KEY (`idMesa`) REFERENCES `Mesas` (`idMesa`),
  CONSTRAINT `fk_Personas_Partidos1` FOREIGN KEY (`idPartido`) REFERENCES `Partidos` (`idPartido`),
  CONSTRAINT `fk_Personas_Tipos1` FOREIGN KEY (`idTipo`) REFERENCES `Tipos` (`idTipo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Personas`
--

LOCK TABLES `Personas` WRITE;
/*!40000 ALTER TABLE `Personas` DISABLE KEYS */;
INSERT INTO `Personas` VALUES ('0313195900122',2,4,2,'LEIBY123','LEIBY','NELBA','','RODRIGUEZ','LISAMA','Face-perfil.png',1,1),('0511198400941',7,3,NULL,'VICENTE123','VICENTE','ALEJANDRO','','VASQUEZ','MEJILLA','SinFoto.png',1,1),('0614194200021',5,6,NULL,'MOISES123','MOISES','AUGUSTO','','GIRON','CRUZ','fotos-de-caras.png.jpg',1,1),('0701196800255',2,3,4,'LILIAN123','LILIAN','MENA','','CRUZ','MEJILLA','76655766bd36be8630894ed734f90c52.jpg',1,1),('0704197100451',7,1,NULL,'SANTOS123','SANTOS','DANIEL','','RODAS','TRUJILLO','SinFoto.png',3,1),('0715199500606',4,1,NULL,'CLARISA777','CLARISA','CELESTE','','VALLEJO','GARCÍA','IMG_1288.JPG',1,1),('0718196100041',3,5,5,'LUIS123','LUIS','FRANCISCO','','PALMA','PALMA','depositphotos_26345985-stock-photo-portrait-of-a-normal-young.png.jpg',1,1),('0801193901572',4,2,NULL,'MARCIO123','MARCIO','TULIO','','JUAREZ','LOPEZ','SinFoto.png',1,1),('0801196604930',6,3,NULL,'RUBIO123','RUBIO','ALBERTO','','BUSTILLO','AGUILAR','SinFoto.png',1,1),('0801196804691',4,6,NULL,'MARIA123','MARIA','BERNARDA','','BARRIENTOS','SIERRA','SinFoto.png',1,1),('0801197000669',6,1,NULL,'ADOLFO777','JOSÉ','ADOLFO','','IZAGUIRRE','ACEITUNO','dad.jpg',3,1),('0801197411108',7,5,NULL,'TANIA123','TANIA','GERALDINA','','MENDOZA','','SinFoto.png',3,1),('0801198014290',7,4,NULL,'TANIA123','TANIA','ISEL',NULL,'CRUZ',NULL,'SinFoto.png',1,1),('0801199115862',1,2,3,'JOSEPH123','JOSEPH','GERARDO','','MATUTE','ORDOÑEZ','54-548264_greg-mittman-hd-png-download.png.jpeg',1,1),('0801199603082',1,3,6,'MANUEL123','MANUEL','ARMANDO','','BACA','HERNANDEZ','foto.png',1,1),('0801199603084',5,1,NULL,'JOSE777','JOSÉ','ADOLFO','','IZAGUIRRE','FLORES','Foto_Perfil.png',3,1),('0801199603086',1,5,2,'RAUL123','RAÚL','EDUARDO','','RODRIGUEZ','UMANZOR','porfirio.png.jpg',3,1),('0801199603089',1,2,7,'JOSE123','JOSÉ','IGNACIO','','PEREZ','GONZALES','SinFoto.png',3,1),('0801200508598',7,6,NULL,'WENDY123','WENDY','JAZMINA',NULL,'CARAZO','BANEGAS','SinFoto.png',1,1),('0813198400131',1,1,1,'AARON123','AARON','JOSUE','','TORRES','HENRRIQUEZ','vitor-perfil.png',1,1),('0815195800038',6,6,NULL,'SANTIAGO123','SANTIAGO','','','CARRILLO','MEJIA','Foto_Perfil.png',1,1),('1501195400427',3,2,3,'LORENZO123','LORENZO','','','RUIZ','FUNEZ','tiro-principal-cara-feliz-hombre-asiatico_39688-708.png.jpg',1,1);
/*!40000 ALTER TABLE `Personas` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-04-06 21:32:00
