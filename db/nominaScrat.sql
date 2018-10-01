CREATE DATABASE  IF NOT EXISTS `heroku_3f64391141d6ca8` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `heroku_3f64391141d6ca8`;
-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: us-cdbr-iron-east-01.cleardb.net    Database: heroku_3f64391141d6ca8
-- ------------------------------------------------------
-- Server version	5.5.56-log

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
-- Table structure for table `empleado`
--

DROP TABLE IF EXISTS `empleado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `empleado` (
  `idEmpleado` int(11) NOT NULL,
  `calle` varchar(45) DEFAULT NULL,
  `numero` int(11) DEFAULT NULL,
  `colonia` varchar(45) DEFAULT NULL,
  `municipio` varchar(45) DEFAULT NULL,
  `telefono` varchar(45) DEFAULT NULL,
  `curp` varchar(45) DEFAULT NULL,
  `fechadenacimiento` date DEFAULT NULL,
  `cartamenordeedad` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`idEmpleado`),
  KEY `f_empleado_idx` (`idEmpleado`),
  CONSTRAINT `f_empleado` FOREIGN KEY (`idEmpleado`) REFERENCES `persona` (`idpersona`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empleado`
--

LOCK TABLES `empleado` WRITE;
/*!40000 ALTER TABLE `empleado` DISABLE KEYS */;
/*!40000 ALTER TABLE `empleado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `encargado`
--

DROP TABLE IF EXISTS `encargado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `encargado` (
  `id_encargado` int(11) NOT NULL,
  `correo` varchar(45) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_encargado`),
  CONSTRAINT `f_encargado` FOREIGN KEY (`id_encargado`) REFERENCES `persona` (`idpersona`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `encargado`
--

LOCK TABLES `encargado` WRITE;
/*!40000 ALTER TABLE `encargado` DISABLE KEYS */;
/*!40000 ALTER TABLE `encargado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `faltas`
--

DROP TABLE IF EXISTS `faltas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `faltas` (
  `idFaltas` int(11) NOT NULL,
  `idEmpleado` int(11) DEFAULT NULL,
  `retardos` int(11) DEFAULT NULL,
  `faltas` int(11) DEFAULT NULL,
  PRIMARY KEY (`idFaltas`),
  KEY `fk_empeado_faltas_idx` (`idEmpleado`),
  CONSTRAINT `fk_empeado_faltas` FOREIGN KEY (`idEmpleado`) REFERENCES `empleado` (`idEmpleado`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `faltas`
--

LOCK TABLES `faltas` WRITE;
/*!40000 ALTER TABLE `faltas` DISABLE KEYS */;
/*!40000 ALTER TABLE `faltas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `historialbono`
--

DROP TABLE IF EXISTS `historialbono`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `historialbono` (
  `id` int(11) NOT NULL,
  `idEmpleado` int(11) DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `idBono` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_empleado_histBono_idx` (`idEmpleado`),
  KEY `fk_empleado_his_idx` (`idBono`),
  CONSTRAINT `fk_empleado_his` FOREIGN KEY (`idBono`) REFERENCES `tipobono` (`idBono`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_empleado_histBono` FOREIGN KEY (`idEmpleado`) REFERENCES `empleado` (`idEmpleado`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `historialbono`
--

LOCK TABLES `historialbono` WRITE;
/*!40000 ALTER TABLE `historialbono` DISABLE KEYS */;
/*!40000 ALTER TABLE `historialbono` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `historialdescuento`
--

DROP TABLE IF EXISTS `historialdescuento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `historialdescuento` (
  `idHistorialDescuento` int(11) NOT NULL,
  `idEmpleado` int(11) NOT NULL,
  `idTipoDescuento` int(11) NOT NULL,
  `fecha` date NOT NULL,
  PRIMARY KEY (`idHistorialDescuento`),
  KEY `fk_empleado_histDesc_idx` (`idEmpleado`),
  KEY `fk_tipoDescuento_idx` (`idTipoDescuento`),
  CONSTRAINT `fk_empleado_histDesc` FOREIGN KEY (`idEmpleado`) REFERENCES `empleado` (`idEmpleado`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_tipoDescuento` FOREIGN KEY (`idTipoDescuento`) REFERENCES `tipodescuento` (`idDescuento`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `historialdescuento`
--

LOCK TABLES `historialdescuento` WRITE;
/*!40000 ALTER TABLE `historialdescuento` DISABLE KEYS */;
/*!40000 ALTER TABLE `historialdescuento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `horario`
--

DROP TABLE IF EXISTS `horario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `horario` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idEmpleado` int(11) DEFAULT NULL,
  `idTurno` int(11) DEFAULT NULL,
  `dia` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `kf_empleado_horario_idx` (`idEmpleado`),
  KEY `fk_empleado_turno_idx` (`idTurno`),
  CONSTRAINT `fk_empleado_horario` FOREIGN KEY (`idEmpleado`) REFERENCES `empleado` (`idEmpleado`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_empleado_turno` FOREIGN KEY (`idTurno`) REFERENCES `turno` (`idTurno`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `horario`
--

LOCK TABLES `horario` WRITE;
/*!40000 ALTER TABLE `horario` DISABLE KEYS */;
/*!40000 ALTER TABLE `horario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permisos`
--

DROP TABLE IF EXISTS `permisos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `permisos` (
  `idpermisos` int(11) NOT NULL,
  `idEmpleado` int(11) DEFAULT NULL,
  `idPermiso` int(11) DEFAULT NULL,
  PRIMARY KEY (`idpermisos`),
  KEY `fk_empleado_permiso_idx` (`idEmpleado`),
  KEY `fk_permiso_tipo_idx` (`idPermiso`),
  CONSTRAINT `fk_empleado_permiso` FOREIGN KEY (`idEmpleado`) REFERENCES `empleado` (`idEmpleado`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_permiso_tipo` FOREIGN KEY (`idPermiso`) REFERENCES `tipopermiso` (`idTipoPermiso`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permisos`
--

LOCK TABLES `permisos` WRITE;
/*!40000 ALTER TABLE `permisos` DISABLE KEYS */;
/*!40000 ALTER TABLE `permisos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `persona`
--

DROP TABLE IF EXISTS `persona`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `persona` (
  `idpersona` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) DEFAULT NULL,
  `apaterno` varchar(45) DEFAULT NULL,
  `amaterno` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idpersona`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `persona`
--

LOCK TABLES `persona` WRITE;
/*!40000 ALTER TABLE `persona` DISABLE KEYS */;
/*!40000 ALTER TABLE `persona` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `registros`
--

DROP TABLE IF EXISTS `registros`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `registros` (
  `idRegistros` int(11) NOT NULL AUTO_INCREMENT,
  `tiporegistro` int(11) NOT NULL,
  `id_empleado` int(11) NOT NULL,
  `hora` datetime DEFAULT NULL,
  PRIMARY KEY (`idRegistros`),
  KEY `tipo_reg_idx` (`tiporegistro`),
  KEY `fk_empleado_registros_idx` (`id_empleado`),
  CONSTRAINT `fk_empleado_registros` FOREIGN KEY (`id_empleado`) REFERENCES `empleado` (`idEmpleado`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `tipo_reg` FOREIGN KEY (`tiporegistro`) REFERENCES `tiposderegistro` (`idTiposdeRegistro`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `registros`
--

LOCK TABLES `registros` WRITE;
/*!40000 ALTER TABLE `registros` DISABLE KEYS */;
/*!40000 ALTER TABLE `registros` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `salariofijo`
--

DROP TABLE IF EXISTS `salariofijo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `salariofijo` (
  `idSalarioFijo` int(11) NOT NULL,
  `idEmpleado` int(11) NOT NULL,
  `salario` double DEFAULT NULL,
  `fecha` datetime DEFAULT NULL,
  PRIMARY KEY (`idSalarioFijo`,`idEmpleado`),
  KEY `fk_empleado_salario_idx` (`idEmpleado`),
  CONSTRAINT `fk_empleado_salario` FOREIGN KEY (`idEmpleado`) REFERENCES `empleado` (`idEmpleado`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `salariofijo`
--

LOCK TABLES `salariofijo` WRITE;
/*!40000 ALTER TABLE `salariofijo` DISABLE KEYS */;
/*!40000 ALTER TABLE `salariofijo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipobono`
--

DROP TABLE IF EXISTS `tipobono`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipobono` (
  `idBono` int(11) NOT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `valor` double DEFAULT NULL,
  PRIMARY KEY (`idBono`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipobono`
--

LOCK TABLES `tipobono` WRITE;
/*!40000 ALTER TABLE `tipobono` DISABLE KEYS */;
/*!40000 ALTER TABLE `tipobono` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipodescuento`
--

DROP TABLE IF EXISTS `tipodescuento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipodescuento` (
  `idDescuento` int(11) NOT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `valor` double DEFAULT NULL,
  PRIMARY KEY (`idDescuento`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipodescuento`
--

LOCK TABLES `tipodescuento` WRITE;
/*!40000 ALTER TABLE `tipodescuento` DISABLE KEYS */;
/*!40000 ALTER TABLE `tipodescuento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipopermiso`
--

DROP TABLE IF EXISTS `tipopermiso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipopermiso` (
  `idTipoPermiso` int(11) NOT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `descuentoCubierto` int(11) DEFAULT NULL,
  PRIMARY KEY (`idTipoPermiso`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipopermiso`
--

LOCK TABLES `tipopermiso` WRITE;
/*!40000 ALTER TABLE `tipopermiso` DISABLE KEYS */;
/*!40000 ALTER TABLE `tipopermiso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tiposderegistro`
--

DROP TABLE IF EXISTS `tiposderegistro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tiposderegistro` (
  `idTiposdeRegistro` int(11) NOT NULL AUTO_INCREMENT,
  `TiposdeRegistro` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idTiposdeRegistro`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tiposderegistro`
--

LOCK TABLES `tiposderegistro` WRITE;
/*!40000 ALTER TABLE `tiposderegistro` DISABLE KEYS */;
/*!40000 ALTER TABLE `tiposderegistro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `turno`
--

DROP TABLE IF EXISTS `turno`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `turno` (
  `idTurno` int(11) NOT NULL AUTO_INCREMENT,
  `horaEntrada` time DEFAULT NULL,
  `horaSalida` time DEFAULT NULL,
  PRIMARY KEY (`idTurno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `turno`
--

LOCK TABLES `turno` WRITE;
/*!40000 ALTER TABLE `turno` DISABLE KEYS */;
/*!40000 ALTER TABLE `turno` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'heroku_3f64391141d6ca8'
--

--
-- Dumping routines for database 'heroku_3f64391141d6ca8'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-10-01  2:30:50
