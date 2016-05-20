CREATE DATABASE  IF NOT EXISTS `arquitectura` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `arquitectura`;
-- MySQL dump 10.13  Distrib 5.6.23, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: arquitectura
-- ------------------------------------------------------
-- Server version	5.6.25-log

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
-- Table structure for table `categoria`
--

DROP TABLE IF EXISTS `categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categoria` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `CATEGORIA` varchar(255) NOT NULL,
  `CALIFICACION` int(11) NOT NULL,
  `USUARIO_ID` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `fk_CATEGORIA_USUARIO1_idx` (`USUARIO_ID`),
  CONSTRAINT `fk_CATEGORIA_USUARIO1` FOREIGN KEY (`USUARIO_ID`) REFERENCES `usuario` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoria`
--

LOCK TABLES `categoria` WRITE;
/*!40000 ALTER TABLE `categoria` DISABLE KEYS */;
INSERT INTO `categoria` VALUES (1,'1 estrella',1,1),(2,'5 estrellas',5,1);
/*!40000 ALTER TABLE `categoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ciudad`
--

DROP TABLE IF EXISTS `ciudad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ciudad` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `NOMBRE` varchar(250) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `PAIS` varchar(250) NOT NULL,
  `CONTINENTE` varchar(250) NOT NULL,
  `USUARIO_ID` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `fk_CIUDAD_USUARIO1_idx` (`USUARIO_ID`),
  CONSTRAINT `fk_CIUDAD_USUARIO1` FOREIGN KEY (`USUARIO_ID`) REFERENCES `usuario` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ciudad`
--

LOCK TABLES `ciudad` WRITE;
/*!40000 ALTER TABLE `ciudad` DISABLE KEYS */;
INSERT INTO `ciudad` VALUES (1,'BOGOTA','colombia','america latina',1),(2,'MANIZALES','Colombia','America',1);
/*!40000 ALTER TABLE `ciudad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ciudad_hotel`
--

DROP TABLE IF EXISTS `ciudad_hotel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ciudad_hotel` (
  `CIUDAD_ID` int(11) NOT NULL,
  `HOTEL_ID` int(11) NOT NULL,
  PRIMARY KEY (`CIUDAD_ID`,`HOTEL_ID`),
  KEY `fk_CIUDAD_has_HOTEL_HOTEL1_idx` (`HOTEL_ID`),
  KEY `fk_CIUDAD_has_HOTEL_CIUDAD1_idx` (`CIUDAD_ID`),
  CONSTRAINT `fk_CIUDAD_has_HOTEL_CIUDAD1` FOREIGN KEY (`CIUDAD_ID`) REFERENCES `ciudad` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_CIUDAD_has_HOTEL_HOTEL1` FOREIGN KEY (`HOTEL_ID`) REFERENCES `hotel` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ciudad_hotel`
--

LOCK TABLES `ciudad_hotel` WRITE;
/*!40000 ALTER TABLE `ciudad_hotel` DISABLE KEYS */;
INSERT INTO `ciudad_hotel` VALUES (1,1);
/*!40000 ALTER TABLE `ciudad_hotel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `evento`
--

DROP TABLE IF EXISTS `evento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `evento` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `NOMBRE` varchar(250) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `TIPO` varchar(250) NOT NULL,
  `FECHA_INICIO` datetime NOT NULL,
  `FECHA_FIN` datetime NOT NULL,
  `USUARIO_ID` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `fk_EVENTO_USUARIO1_idx` (`USUARIO_ID`),
  CONSTRAINT `fk_EVENTO_USUARIO1` FOREIGN KEY (`USUARIO_ID`) REFERENCES `usuario` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `evento`
--

LOCK TABLES `evento` WRITE;
/*!40000 ALTER TABLE `evento` DISABLE KEYS */;
INSERT INTO `evento` VALUES (1,'Rolling Stones','Musical','2016-03-28 00:00:00','2016-03-31 00:00:00',1);
/*!40000 ALTER TABLE `evento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `evento_ciudad`
--

DROP TABLE IF EXISTS `evento_ciudad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `evento_ciudad` (
  `EVENTO_ID` int(11) NOT NULL,
  `CIUDAD_ID` int(11) NOT NULL,
  PRIMARY KEY (`EVENTO_ID`,`CIUDAD_ID`),
  KEY `fk_EVENTO_has_CIUDAD_CIUDAD1_idx` (`CIUDAD_ID`),
  KEY `fk_EVENTO_has_CIUDAD_EVENTO1_idx` (`EVENTO_ID`),
  CONSTRAINT `fk_EVENTO_has_CIUDAD_CIUDAD1` FOREIGN KEY (`CIUDAD_ID`) REFERENCES `ciudad` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_EVENTO_has_CIUDAD_EVENTO1` FOREIGN KEY (`EVENTO_ID`) REFERENCES `evento` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `evento_ciudad`
--

LOCK TABLES `evento_ciudad` WRITE;
/*!40000 ALTER TABLE `evento_ciudad` DISABLE KEYS */;
INSERT INTO `evento_ciudad` VALUES (1,2);
/*!40000 ALTER TABLE `evento_ciudad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `foro`
--

DROP TABLE IF EXISTS `foro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `foro` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TEMA` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `FECHA_PUBLICACION` datetime NOT NULL,
  `USUARIO_ID` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `fk_FORO_USUARIO1_idx` (`USUARIO_ID`),
  CONSTRAINT `fk_FORO_USUARIO1` FOREIGN KEY (`USUARIO_ID`) REFERENCES `usuario` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `foro`
--

LOCK TABLES `foro` WRITE;
/*!40000 ALTER TABLE `foro` DISABLE KEYS */;
/*!40000 ALTER TABLE `foro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `foro_ciudad`
--

DROP TABLE IF EXISTS `foro_ciudad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `foro_ciudad` (
  `FORO_ID` int(11) NOT NULL,
  `CIUDAD_ID` int(11) NOT NULL,
  PRIMARY KEY (`FORO_ID`,`CIUDAD_ID`),
  KEY `fk_FORO_has_CIUDAD_CIUDAD1_idx` (`CIUDAD_ID`),
  KEY `fk_FORO_has_CIUDAD_FORO1_idx` (`FORO_ID`),
  CONSTRAINT `fk_FORO_has_CIUDAD_CIUDAD1` FOREIGN KEY (`CIUDAD_ID`) REFERENCES `ciudad` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_FORO_has_CIUDAD_FORO1` FOREIGN KEY (`FORO_ID`) REFERENCES `foro` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `foro_ciudad`
--

LOCK TABLES `foro_ciudad` WRITE;
/*!40000 ALTER TABLE `foro_ciudad` DISABLE KEYS */;
/*!40000 ALTER TABLE `foro_ciudad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `foro_evento`
--

DROP TABLE IF EXISTS `foro_evento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `foro_evento` (
  `FORO_ID` int(11) NOT NULL,
  `EVENTO_ID` int(11) NOT NULL,
  PRIMARY KEY (`FORO_ID`,`EVENTO_ID`),
  KEY `fk_FORO_has_EVENTO_EVENTO1_idx` (`EVENTO_ID`),
  KEY `fk_FORO_has_EVENTO_FORO1_idx` (`FORO_ID`),
  CONSTRAINT `fk_FORO_has_EVENTO_EVENTO1` FOREIGN KEY (`EVENTO_ID`) REFERENCES `evento` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_FORO_has_EVENTO_FORO1` FOREIGN KEY (`FORO_ID`) REFERENCES `foro` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `foro_evento`
--

LOCK TABLES `foro_evento` WRITE;
/*!40000 ALTER TABLE `foro_evento` DISABLE KEYS */;
/*!40000 ALTER TABLE `foro_evento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hotel`
--

DROP TABLE IF EXISTS `hotel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hotel` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `NOMBRE` varchar(250) NOT NULL,
  `CATEGORIA_ID` int(11) NOT NULL,
  `USUARIO_ID` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `fk_HOTEL_CATEGORIA1_idx` (`CATEGORIA_ID`),
  KEY `fk_HOTEL_USUARIO1_idx` (`USUARIO_ID`),
  CONSTRAINT `fk_HOTEL_CATEGORIA1` FOREIGN KEY (`CATEGORIA_ID`) REFERENCES `categoria` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_HOTEL_USUARIO1` FOREIGN KEY (`USUARIO_ID`) REFERENCES `usuario` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hotel`
--

LOCK TABLES `hotel` WRITE;
/*!40000 ALTER TABLE `hotel` DISABLE KEYS */;
INSERT INTO `hotel` VALUES (1,'TRYP',2,1);
/*!40000 ALTER TABLE `hotel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `informacion_evento`
--

DROP TABLE IF EXISTS `informacion_evento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `informacion_evento` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TIPO_RECURSO` varchar(250) NOT NULL,
  `EVENTO_ID` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `fk_INFORMACION_EVENTO_EVENTO1_idx` (`EVENTO_ID`),
  CONSTRAINT `fk_INFORMACION_EVENTO_EVENTO1` FOREIGN KEY (`EVENTO_ID`) REFERENCES `evento` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `informacion_evento`
--

LOCK TABLES `informacion_evento` WRITE;
/*!40000 ALTER TABLE `informacion_evento` DISABLE KEYS */;
/*!40000 ALTER TABLE `informacion_evento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `itinerario`
--

DROP TABLE IF EXISTS `itinerario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `itinerario` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `FECHA_INICIO` datetime NOT NULL,
  `FECHA_FIN` datetime NOT NULL,
  `USUARIO_ID` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `fk_ITINERARIO_USUARIO1_idx` (`USUARIO_ID`),
  CONSTRAINT `fk_ITINERARIO_USUARIO1` FOREIGN KEY (`USUARIO_ID`) REFERENCES `usuario` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `itinerario`
--

LOCK TABLES `itinerario` WRITE;
/*!40000 ALTER TABLE `itinerario` DISABLE KEYS */;
/*!40000 ALTER TABLE `itinerario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `itinerario_ciudad`
--

DROP TABLE IF EXISTS `itinerario_ciudad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `itinerario_ciudad` (
  `ITINERARIO_ID` int(11) NOT NULL,
  `CIUDAD_ID` int(11) NOT NULL,
  PRIMARY KEY (`ITINERARIO_ID`,`CIUDAD_ID`),
  KEY `fk_ITINERARIO_has_CIUDAD_CIUDAD1_idx` (`CIUDAD_ID`),
  KEY `fk_ITINERARIO_has_CIUDAD_ITINERARIO1_idx` (`ITINERARIO_ID`),
  CONSTRAINT `fk_ITINERARIO_has_CIUDAD_CIUDAD1` FOREIGN KEY (`CIUDAD_ID`) REFERENCES `ciudad` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_ITINERARIO_has_CIUDAD_ITINERARIO1` FOREIGN KEY (`ITINERARIO_ID`) REFERENCES `itinerario` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `itinerario_ciudad`
--

LOCK TABLES `itinerario_ciudad` WRITE;
/*!40000 ALTER TABLE `itinerario_ciudad` DISABLE KEYS */;
/*!40000 ALTER TABLE `itinerario_ciudad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `participacion_foro`
--

DROP TABLE IF EXISTS `participacion_foro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `participacion_foro` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `PARTICIPACION` text NOT NULL,
  `FECHA` datetime NOT NULL,
  `FORO_ID` int(11) NOT NULL,
  `USUARIO_ID` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `fk_PARTICIPACION_FORO_FORO1_idx` (`FORO_ID`),
  KEY `fk_PARTICIPACION_FORO_USUARIO1_idx` (`USUARIO_ID`),
  CONSTRAINT `fk_PARTICIPACION_FORO_FORO1` FOREIGN KEY (`FORO_ID`) REFERENCES `foro` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_PARTICIPACION_FORO_USUARIO1` FOREIGN KEY (`USUARIO_ID`) REFERENCES `usuario` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `participacion_foro`
--

LOCK TABLES `participacion_foro` WRITE;
/*!40000 ALTER TABLE `participacion_foro` DISABLE KEYS */;
/*!40000 ALTER TABLE `participacion_foro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recurso`
--

DROP TABLE IF EXISTS `recurso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `recurso` (
  `ID` int(11) NOT NULL,
  `NOMBRE` varchar(250) NOT NULL,
  `DESCRIPCION` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recurso`
--

LOCK TABLES `recurso` WRITE;
/*!40000 ALTER TABLE `recurso` DISABLE KEYS */;
/*!40000 ALTER TABLE `recurso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recurso_informacion_evento`
--

DROP TABLE IF EXISTS `recurso_informacion_evento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `recurso_informacion_evento` (
  `RECURSO_ID` int(11) NOT NULL,
  `INFORMACION_EVENTO_ID` int(11) NOT NULL,
  PRIMARY KEY (`RECURSO_ID`,`INFORMACION_EVENTO_ID`),
  KEY `fk_RECURSO_has_INFORMACION_EVENTO_INFORMACION_EVENTO1_idx` (`INFORMACION_EVENTO_ID`),
  KEY `fk_RECURSO_has_INFORMACION_EVENTO_RECURSO1_idx` (`RECURSO_ID`),
  CONSTRAINT `fk_RECURSO_has_INFORMACION_EVENTO_INFORMACION_EVENTO1` FOREIGN KEY (`INFORMACION_EVENTO_ID`) REFERENCES `informacion_evento` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_RECURSO_has_INFORMACION_EVENTO_RECURSO1` FOREIGN KEY (`RECURSO_ID`) REFERENCES `recurso` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recurso_informacion_evento`
--

LOCK TABLES `recurso_informacion_evento` WRITE;
/*!40000 ALTER TABLE `recurso_informacion_evento` DISABLE KEYS */;
/*!40000 ALTER TABLE `recurso_informacion_evento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuario` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `CEDULA` varchar(100) NOT NULL,
  `NOMBRE` varchar(250) NOT NULL,
  `CORREO` varchar(250) NOT NULL,
  `ROL` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `CEDULA_UNIQUE` (`CEDULA`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (1,'1015654987','GIOVANNY','GIOVANNY@GMAIL.COM','ADMIN'),(2,'1020','LEIDY','LEIDY@GMAIL.COM','USER');
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-05-20  7:51:10
