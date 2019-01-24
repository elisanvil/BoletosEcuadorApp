-- MySQL dump 10.13  Distrib 5.7.24, for Linux (x86_64)
--
-- Host: localhost    Database: boletosecuador
-- ------------------------------------------------------
-- Server version	5.7.24-0ubuntu0.18.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `asiento`
--

DROP TABLE IF EXISTS `asiento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `asiento` (
  `id_asiento` int(10) NOT NULL AUTO_INCREMENT,
  `categoria` varchar(20) COLLATE latin1_spanish_ci NOT NULL,
  `disponibilidad` char(15) COLLATE latin1_spanish_ci DEFAULT NULL,
  `id_venue` int(10) NOT NULL,
  PRIMARY KEY (`id_asiento`),
  KEY `id_venue` (`id_venue`),
  CONSTRAINT `asiento_ibfk_1` FOREIGN KEY (`id_venue`) REFERENCES `venue` (`id_venue`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `asiento`
--

LOCK TABLES `asiento` WRITE;
/*!40000 ALTER TABLE `asiento` DISABLE KEYS */;
INSERT INTO `asiento` VALUES (1,'Golden Box','si',1),(2,'VIP','si',1),(3,'VIP','no',1),(4,'general','si',1),(5,'palco','si',1),(6,'general','si',1),(7,'Golden Box','no',1),(8,'Golden Box','si',1),(9,'Golden Box','si',1);
/*!40000 ALTER TABLE `asiento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `boleto`
--

DROP TABLE IF EXISTS `boleto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `boleto` (
  `id_boleto` int(10) NOT NULL AUTO_INCREMENT,
  `precio` char(10) COLLATE latin1_spanish_ci DEFAULT NULL,
  `id_asiento` int(10) NOT NULL,
  `id_usuario` int(10) DEFAULT NULL,
  PRIMARY KEY (`id_boleto`),
  KEY `id_asiento` (`id_asiento`),
  KEY `id_usuario` (`id_usuario`),
  CONSTRAINT `boleto_ibfk_1` FOREIGN KEY (`id_asiento`) REFERENCES `asiento` (`id_asiento`),
  CONSTRAINT `boleto_ibfk_2` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `boleto`
--

LOCK TABLES `boleto` WRITE;
/*!40000 ALTER TABLE `boleto` DISABLE KEYS */;
INSERT INTO `boleto` VALUES (1,'$100',1,NULL),(2,'$200',2,NULL);
/*!40000 ALTER TABLE `boleto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `evento`
--

DROP TABLE IF EXISTS `evento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `evento` (
  `id_evento` int(10) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(40) COLLATE latin1_spanish_ci NOT NULL,
  `tipo` char(20) COLLATE latin1_spanish_ci DEFAULT NULL,
  `id_venue` int(10) NOT NULL,
  `fecha` date NOT NULL,
  `hora` time NOT NULL,
  PRIMARY KEY (`id_evento`),
  KEY `id_venue` (`id_venue`),
  CONSTRAINT `evento_ibfk_1` FOREIGN KEY (`id_venue`) REFERENCES `venue` (`id_venue`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `evento`
--

LOCK TABLES `evento` WRITE;
/*!40000 ALTER TABLE `evento` DISABLE KEYS */;
INSERT INTO `evento` VALUES (1,'Convencion Internacional Yambal','Conferencia',1,'2003-05-21','19:30:00'),(2,'Convencion Internacional Yambal','Conferencia',1,'2019-05-21','19:30:00');
/*!40000 ALTER TABLE `evento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuario` (
  `id_usuario` int(10) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(40) COLLATE latin1_spanish_ci NOT NULL,
  `nombre_usuario` varchar(20) COLLATE latin1_spanish_ci DEFAULT NULL,
  `clave` char(15) COLLATE latin1_spanish_ci DEFAULT NULL,
  `rol` char(20) COLLATE latin1_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`id_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (1,'Leo Wyatt','lwyatt','wyatt123','administrador'),(2,'Ryan Wolfe','rwolfe','wolfe123','cliente'),(3,'Stella Bonasera','sbonasera','bonasera123','administrador'),(4,'Aiden Vaugier','avaugier','vaugier123','cliente'),(5,'Roberth Loor','rjloor','rxlz','administrador');
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `venue`
--

DROP TABLE IF EXISTS `venue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `venue` (
  `id_venue` int(10) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(40) COLLATE latin1_spanish_ci NOT NULL,
  `ubicacion` varchar(100) COLLATE latin1_spanish_ci DEFAULT NULL,
  `tipo` char(20) COLLATE latin1_spanish_ci DEFAULT NULL,
  `capacidad` char(10) COLLATE latin1_spanish_ci DEFAULT NULL,
  `disponibilidad` char(15) COLLATE latin1_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`id_venue`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `venue`
--

LOCK TABLES `venue` WRITE;
/*!40000 ALTER TABLE `venue` DISABLE KEYS */;
INSERT INTO `venue` VALUES (1,'Centro de Convenciones','Av Guayaquil y calle 12','Teatro','100','si'),(2,'Centro de Artes','Av Guayaquil y calle 13','Coliseo','200','si'),(3,'Teatro Espol','Av Guayaquil y calle 14','Teatro','100','si'),(4,'Estadio Monumental','Estero Saldo','Estadio','10000','si');
/*!40000 ALTER TABLE `venue` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-01-24  2:21:12
