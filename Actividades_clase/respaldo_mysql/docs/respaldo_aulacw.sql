-- MariaDB dump 10.19  Distrib 10.4.24-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: aula_cw
-- ------------------------------------------------------
-- Server version	10.4.24-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `arch_adj_asign`
--

DROP TABLE IF EXISTS `arch_adj_asign`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `arch_adj_asign` (
  `ID_ARCH_ADJ_ASIGN` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` char(100) DEFAULT NULL,
  `ruta_arch` char(250) DEFAULT NULL,
  `tipo_arch` char(50) DEFAULT NULL,
  `ID_ASIGN` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID_ARCH_ADJ_ASIGN`),
  KEY `ID_ASIGN` (`ID_ASIGN`),
  CONSTRAINT `arch_adj_asign_ibfk_1` FOREIGN KEY (`ID_ASIGN`) REFERENCES `asignacion` (`ID_ASIGN`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `arch_adj_asign`
--

LOCK TABLES `arch_adj_asign` WRITE;
/*!40000 ALTER TABLE `arch_adj_asign` DISABLE KEYS */;
INSERT INTO `arch_adj_asign` VALUES (1,'Independencia','../../../../statics/media/files/materialesAulas/DFLjxz182Independencia.JPG','JPG',2),(2,'Independencia','../../../../statics/media/files/materialesAulas/DFLjxz183Independencia.JPG','JPG',3),(3,'Independencia','../../../../statics/media/files/materialesAulas/DFLjxz184Independencia.JPG','JPG',4),(4,'Cool','../../../../statics/media/files/materialesAulas/GLmnqz245Cool.JPG','JPG',5),(5,'Cool','../../../../statics/media/files/materialesAulas/Hjtyz5256Cool.JPG','JPG',6);
/*!40000 ALTER TABLE `arch_adj_asign` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `arch_adj_cammat`
--

DROP TABLE IF EXISTS `arch_adj_cammat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `arch_adj_cammat` (
  `ID_ARCH_ADJ_CAMMAT` int(11) NOT NULL AUTO_INCREMENT,
  `ID_PUB_CMMT` int(11) DEFAULT NULL,
  `nombre` char(50) DEFAULT NULL,
  `tipo_arch` char(50) DEFAULT NULL,
  `ruta_arch` char(250) DEFAULT NULL,
  PRIMARY KEY (`ID_ARCH_ADJ_CAMMAT`),
  KEY `ID_PUB_CMMT` (`ID_PUB_CMMT`),
  CONSTRAINT `arch_adj_cammat_ibfk_1` FOREIGN KEY (`ID_PUB_CMMT`) REFERENCES `pub_cam_mat` (`ID_PUB_CMMT`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `arch_adj_cammat`
--

LOCK TABLES `arch_adj_cammat` WRITE;
/*!40000 ALTER TABLE `arch_adj_cammat` DISABLE KEYS */;
/*!40000 ALTER TABLE `arch_adj_cammat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `arch_entrega`
--

DROP TABLE IF EXISTS `arch_entrega`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `arch_entrega` (
  `ID_ARCH_ENTREGA` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` char(250) DEFAULT NULL,
  `ruta_archivo` char(250) DEFAULT NULL,
  `tipo_extension` char(100) DEFAULT NULL,
  `ID_UHA` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID_ARCH_ENTREGA`),
  KEY `ID_UHA` (`ID_UHA`),
  CONSTRAINT `arch_entrega_ibfk_1` FOREIGN KEY (`ID_UHA`) REFERENCES `user_has_asignacion` (`ID_UHA`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `arch_entrega`
--

LOCK TABLES `arch_entrega` WRITE;
/*!40000 ALTER TABLE `arch_entrega` DISABLE KEYS */;
/*!40000 ALTER TABLE `arch_entrega` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `arch_pforo`
--

DROP TABLE IF EXISTS `arch_pforo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `arch_pforo` (
  `ID_ARCH_PFORO` int(11) NOT NULL AUTO_INCREMENT,
  `ID_PUB_FORO` int(11) DEFAULT NULL,
  `nombre` char(100) DEFAULT NULL,
  `tipo_arch` char(50) DEFAULT NULL,
  `ruta_arch` char(250) DEFAULT NULL,
  PRIMARY KEY (`ID_ARCH_PFORO`),
  KEY `ID_PUB_FORO` (`ID_PUB_FORO`),
  CONSTRAINT `arch_pforo_ibfk_1` FOREIGN KEY (`ID_PUB_FORO`) REFERENCES `pub_foro` (`ID_PUB_FORO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `arch_pforo`
--

LOCK TABLES `arch_pforo` WRITE;
/*!40000 ALTER TABLE `arch_pforo` DISABLE KEYS */;
/*!40000 ALTER TABLE `arch_pforo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `arch_resp_foro`
--

DROP TABLE IF EXISTS `arch_resp_foro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `arch_resp_foro` (
  `ID_ARCH_R_PFORO` int(11) NOT NULL AUTO_INCREMENT,
  `ID_RESP_PFORO` int(11) DEFAULT NULL,
  `nombre` char(50) DEFAULT NULL,
  `tipo_arch` char(250) DEFAULT NULL,
  `ruta_arch` char(250) DEFAULT NULL,
  PRIMARY KEY (`ID_ARCH_R_PFORO`),
  KEY `ID_RESP_PFORO` (`ID_RESP_PFORO`),
  CONSTRAINT `arch_resp_foro_ibfk_1` FOREIGN KEY (`ID_RESP_PFORO`) REFERENCES `resp_pforo` (`ID_RESP_PFORO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `arch_resp_foro`
--

LOCK TABLES `arch_resp_foro` WRITE;
/*!40000 ALTER TABLE `arch_resp_foro` DISABLE KEYS */;
/*!40000 ALTER TABLE `arch_resp_foro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `asignacion`
--

DROP TABLE IF EXISTS `asignacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `asignacion` (
  `ID_ASIGN` int(11) NOT NULL AUTO_INCREMENT,
  `titulo` char(60) DEFAULT NULL,
  `indicaciones` char(200) DEFAULT NULL,
  `ID_USUARIO` int(11) DEFAULT NULL,
  `puntos` int(11) DEFAULT NULL,
  `fecha_asignacion` datetime NOT NULL,
  `fecha_limite` datetime NOT NULL,
  `ID_BLOQUE` tinyint(4) DEFAULT NULL,
  `ID_TEMA` tinyint(4) DEFAULT NULL,
  `ID_AULA` char(50) DEFAULT NULL,
  `ID_TIPO_ASIGN` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`ID_ASIGN`),
  KEY `ID_USUARIO` (`ID_USUARIO`),
  KEY `ID_BLOQUE` (`ID_BLOQUE`),
  KEY `ID_TEMA` (`ID_TEMA`),
  KEY `ID_AULA` (`ID_AULA`),
  KEY `ID_TIPO_ASIGN` (`ID_TIPO_ASIGN`),
  CONSTRAINT `asignacion_ibfk_1` FOREIGN KEY (`ID_USUARIO`) REFERENCES `usuario` (`ID_USUARIO`),
  CONSTRAINT `asignacion_ibfk_2` FOREIGN KEY (`ID_BLOQUE`) REFERENCES `bloque` (`ID_BLOQUE`),
  CONSTRAINT `asignacion_ibfk_3` FOREIGN KEY (`ID_TEMA`) REFERENCES `tema` (`ID_TEMA`),
  CONSTRAINT `asignacion_ibfk_4` FOREIGN KEY (`ID_AULA`) REFERENCES `aula` (`ID_AULA`),
  CONSTRAINT `asignacion_ibfk_5` FOREIGN KEY (`ID_TIPO_ASIGN`) REFERENCES `tipo_asign` (`ID_TIPO_ASIGN`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `asignacion`
--

LOCK TABLES `asignacion` WRITE;
/*!40000 ALTER TABLE `asignacion` DISABLE KEYS */;
INSERT INTO `asignacion` VALUES (1,'Primera','Primera tarea',14,10,'2022-02-16 22:03:16','2022-06-08 20:24:00',NULL,NULL,'Fez157',1),(2,'Cuestionario','Nuevo Question',18,10,'2022-02-16 22:03:16','2022-06-10 12:09:00',NULL,NULL,'DFLjxz',1),(3,'Historia','Nada',18,10,'2022-02-16 22:03:16','2022-06-11 12:12:00',NULL,NULL,'DFLjxz',3),(4,'H','Nueva',18,10,'2022-02-16 22:03:16','2022-06-10 12:21:00',NULL,NULL,'DFLjxz',1),(5,'Questionary','Funciones lineales',24,20,'2022-02-16 22:03:16','2022-06-10 12:51:00',NULL,NULL,'GLmnqz',1),(6,'Questionary','Funciones cuadráticas',25,10,'2022-02-16 22:03:16','2022-06-11 00:40:00',NULL,NULL,'Hjtyz5',1);
/*!40000 ALTER TABLE `asignacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aula`
--

DROP TABLE IF EXISTS `aula`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aula` (
  `ID_AULA` char(50) NOT NULL,
  `ID_MATERIAS` tinyint(4) DEFAULT NULL,
  `ID_GRUPO` smallint(6) DEFAULT NULL,
  `ID_CICLOS` smallint(6) DEFAULT NULL,
  `ID_GRADO` tinyint(4) DEFAULT NULL,
  `ID_TIPO_AULA` tinyint(4) DEFAULT NULL,
  `nombre` char(50) DEFAULT NULL,
  `reuniones_id` char(250) DEFAULT NULL,
  `descripcion` char(250) DEFAULT NULL,
  `ruta_foto` char(50) DEFAULT NULL,
  `seccion` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`ID_AULA`),
  KEY `ID_MATERIAS` (`ID_MATERIAS`),
  KEY `ID_GRUPO` (`ID_GRUPO`),
  KEY `ID_CICLOS` (`ID_CICLOS`),
  KEY `ID_GRADO` (`ID_GRADO`),
  KEY `ID_TIPO_AULA` (`ID_TIPO_AULA`),
  CONSTRAINT `aula_ibfk_1` FOREIGN KEY (`ID_MATERIAS`) REFERENCES `materias` (`ID_MATERIAS`),
  CONSTRAINT `aula_ibfk_2` FOREIGN KEY (`ID_GRUPO`) REFERENCES `grupo` (`ID_GRUPO`),
  CONSTRAINT `aula_ibfk_3` FOREIGN KEY (`ID_CICLOS`) REFERENCES `ciclos` (`ID_CICLOS`),
  CONSTRAINT `aula_ibfk_4` FOREIGN KEY (`ID_GRADO`) REFERENCES `grado` (`ID_GRADO`),
  CONSTRAINT `aula_ibfk_5` FOREIGN KEY (`ID_TIPO_AULA`) REFERENCES `tipo_aula` (`ID_TIPO_AULA`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aula`
--

LOCK TABLES `aula` WRITE;
/*!40000 ALTER TABLE `aula` DISABLE KEYS */;
INSERT INTO `aula` VALUES ('AFZdz1',1,101,NULL,NULL,1,'Derivadas',NULL,'hoa',NULL,NULL),('BScgiv',1,101,NULL,NULL,2,'Lógica',NULL,'Lógica aplicada',NULL,NULL),('DFLjxz',1,101,NULL,NULL,1,'Historia V',NULL,'Aprenderás historia de México y Universal',NULL,NULL),('DOWhk7',1,101,NULL,NULL,1,'Derivadas',NULL,'hola',NULL,NULL),('EOUnou',1,101,NULL,NULL,1,'Química',NULL,'Química',NULL,NULL),('Fez157',1,101,NULL,NULL,1,'Derivadas',NULL,'En este curso aprendes mucho.',NULL,NULL),('FRWhmt',1,201,NULL,NULL,4,'Debate',NULL,'Sesiones de debate',NULL,NULL),('GLmnqz',1,101,NULL,NULL,4,'Mate',NULL,'Álgebra',NULL,NULL),('Hjtyz5',23,201,NULL,NULL,1,'Matemátcas',NULL,'Bienvenidos',NULL,NULL),('IMPVXm',4,101,NULL,NULL,1,'Egipto',NULL,'Hola',NULL,NULL),('RSeilm',25,212,NULL,NULL,1,'Biología',NULL,'Curso de Biología IV',NULL,NULL);
/*!40000 ALTER TABLE `aula` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aula_has_usuario`
--

DROP TABLE IF EXISTS `aula_has_usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aula_has_usuario` (
  `ID_AHU` int(11) NOT NULL AUTO_INCREMENT,
  `ID_USUARIO` int(11) DEFAULT NULL,
  `ID_AULA` char(50) DEFAULT NULL,
  `ID_ROL` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`ID_AHU`),
  KEY `ID_USUARIO` (`ID_USUARIO`),
  KEY `ID_AULA` (`ID_AULA`),
  KEY `ID_ROL` (`ID_ROL`),
  CONSTRAINT `aula_has_usuario_ibfk_1` FOREIGN KEY (`ID_USUARIO`) REFERENCES `usuario` (`ID_USUARIO`),
  CONSTRAINT `aula_has_usuario_ibfk_2` FOREIGN KEY (`ID_AULA`) REFERENCES `aula` (`ID_AULA`),
  CONSTRAINT `aula_has_usuario_ibfk_3` FOREIGN KEY (`ID_ROL`) REFERENCES `rol_user` (`ID_ROL`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aula_has_usuario`
--

LOCK TABLES `aula_has_usuario` WRITE;
/*!40000 ALTER TABLE `aula_has_usuario` DISABLE KEYS */;
INSERT INTO `aula_has_usuario` VALUES (1,14,'Fez157',1),(2,14,'DOWhk7',1),(3,14,'FRWhmt',1),(4,14,'IMPVXm',1),(5,14,'AFZdz1',1),(6,18,'DFLjxz',1),(7,19,'DFLjxz',2),(8,24,'GLmnqz',1),(9,24,'EOUnou',1),(10,24,'BScgiv',1),(11,23,'GLmnqz',2),(12,23,'EOUnou',2),(13,23,'BScgiv',2),(14,25,'Hjtyz5',1),(15,26,'RSeilm',1),(16,23,'RSeilm',2);
/*!40000 ALTER TABLE `aula_has_usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bloque`
--

DROP TABLE IF EXISTS `bloque`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bloque` (
  `ID_BLOQUE` tinyint(4) NOT NULL,
  `ruta_foto` char(100) DEFAULT NULL,
  `titulo` char(60) NOT NULL,
  `descripcion` char(200) DEFAULT NULL,
  `ID_AULA` char(50) DEFAULT NULL,
  PRIMARY KEY (`ID_BLOQUE`),
  UNIQUE KEY `titulo` (`titulo`),
  UNIQUE KEY `descripcion` (`descripcion`),
  KEY `ID_AULA` (`ID_AULA`),
  CONSTRAINT `bloque_ibfk_1` FOREIGN KEY (`ID_AULA`) REFERENCES `aula` (`ID_AULA`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bloque`
--

LOCK TABLES `bloque` WRITE;
/*!40000 ALTER TABLE `bloque` DISABLE KEYS */;
/*!40000 ALTER TABLE `bloque` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ciclos`
--

DROP TABLE IF EXISTS `ciclos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ciclos` (
  `ID_CICLOS` smallint(6) NOT NULL AUTO_INCREMENT,
  `ciclos` char(20) DEFAULT NULL,
  PRIMARY KEY (`ID_CICLOS`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ciclos`
--

LOCK TABLES `ciclos` WRITE;
/*!40000 ALTER TABLE `ciclos` DISABLE KEYS */;
INSERT INTO `ciclos` VALUES (1,'2021 - 2022'),(2,'2022 - 2023'),(3,'2023 - 2024'),(4,'2024 - 2025');
/*!40000 ALTER TABLE `ciclos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `coment_asign`
--

DROP TABLE IF EXISTS `coment_asign`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `coment_asign` (
  `ID_COMENT_ASIGN` int(11) NOT NULL AUTO_INCREMENT,
  `ID_USUARIO` int(11) DEFAULT NULL,
  `ID_ASIGN` int(11) DEFAULT NULL,
  `comentario` text DEFAULT NULL,
  `fecha_coment` datetime NOT NULL,
  PRIMARY KEY (`ID_COMENT_ASIGN`),
  KEY `ID_USUARIO` (`ID_USUARIO`),
  KEY `ID_ASIGN` (`ID_ASIGN`),
  CONSTRAINT `coment_asign_ibfk_1` FOREIGN KEY (`ID_USUARIO`) REFERENCES `usuario` (`ID_USUARIO`),
  CONSTRAINT `coment_asign_ibfk_2` FOREIGN KEY (`ID_ASIGN`) REFERENCES `asignacion` (`ID_ASIGN`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coment_asign`
--

LOCK TABLES `coment_asign` WRITE;
/*!40000 ALTER TABLE `coment_asign` DISABLE KEYS */;
/*!40000 ALTER TABLE `coment_asign` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `coment_priv_asign`
--

DROP TABLE IF EXISTS `coment_priv_asign`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `coment_priv_asign` (
  `ID_COMENT_PRIV_ASIGN` int(11) NOT NULL AUTO_INCREMENT,
  `ID_USUARIO` int(11) DEFAULT NULL,
  `ID_UHA` int(11) DEFAULT NULL,
  `comentario` text DEFAULT NULL,
  `fecha_coment` datetime NOT NULL,
  PRIMARY KEY (`ID_COMENT_PRIV_ASIGN`),
  KEY `ID_USUARIO` (`ID_USUARIO`),
  KEY `ID_UHA` (`ID_UHA`),
  CONSTRAINT `coment_priv_asign_ibfk_1` FOREIGN KEY (`ID_USUARIO`) REFERENCES `usuario` (`ID_USUARIO`),
  CONSTRAINT `coment_priv_asign_ibfk_2` FOREIGN KEY (`ID_UHA`) REFERENCES `user_has_asignacion` (`ID_UHA`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coment_priv_asign`
--

LOCK TABLES `coment_priv_asign` WRITE;
/*!40000 ALTER TABLE `coment_priv_asign` DISABLE KEYS */;
/*!40000 ALTER TABLE `coment_priv_asign` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cuestionario`
--

DROP TABLE IF EXISTS `cuestionario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cuestionario` (
  `ID_CUESTIONARIO` smallint(6) NOT NULL AUTO_INCREMENT,
  `nombre_cuestionario` char(250) DEFAULT NULL,
  `num_preguntas` tinyint(4) DEFAULT NULL,
  `terminado` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`ID_CUESTIONARIO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cuestionario`
--

LOCK TABLES `cuestionario` WRITE;
/*!40000 ALTER TABLE `cuestionario` DISABLE KEYS */;
/*!40000 ALTER TABLE `cuestionario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cuestionario_has_pregunta`
--

DROP TABLE IF EXISTS `cuestionario_has_pregunta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cuestionario_has_pregunta` (
  `ID_CHP` smallint(6) NOT NULL AUTO_INCREMENT,
  `ID_CUESTIONARIO` smallint(6) DEFAULT NULL,
  `ID_PREGUNTA` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`ID_CHP`),
  KEY `ID_CUESTIONARIO` (`ID_CUESTIONARIO`),
  KEY `ID_PREGUNTA` (`ID_PREGUNTA`),
  CONSTRAINT `cuestionario_has_pregunta_ibfk_1` FOREIGN KEY (`ID_CUESTIONARIO`) REFERENCES `cuestionario` (`ID_CUESTIONARIO`),
  CONSTRAINT `cuestionario_has_pregunta_ibfk_2` FOREIGN KEY (`ID_PREGUNTA`) REFERENCES `pregunta` (`ID_PREGUNTA`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cuestionario_has_pregunta`
--

LOCK TABLES `cuestionario_has_pregunta` WRITE;
/*!40000 ALTER TABLE `cuestionario_has_pregunta` DISABLE KEYS */;
/*!40000 ALTER TABLE `cuestionario_has_pregunta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cuestionario_has_progreso`
--

DROP TABLE IF EXISTS `cuestionario_has_progreso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cuestionario_has_progreso` (
  `ID_CHPRG` smallint(6) NOT NULL AUTO_INCREMENT,
  `ID_CUESTIONARIO` smallint(6) DEFAULT NULL,
  `ID_PROGRESO` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`ID_CHPRG`),
  KEY `ID_CUESTIONARIO` (`ID_CUESTIONARIO`),
  KEY `ID_PROGRESO` (`ID_PROGRESO`),
  CONSTRAINT `cuestionario_has_progreso_ibfk_1` FOREIGN KEY (`ID_CUESTIONARIO`) REFERENCES `cuestionario` (`ID_CUESTIONARIO`),
  CONSTRAINT `cuestionario_has_progreso_ibfk_2` FOREIGN KEY (`ID_PROGRESO`) REFERENCES `progreso` (`ID_PROGRESO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cuestionario_has_progreso`
--

LOCK TABLES `cuestionario_has_progreso` WRITE;
/*!40000 ALTER TABLE `cuestionario_has_progreso` DISABLE KEYS */;
/*!40000 ALTER TABLE `cuestionario_has_progreso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dia_semana`
--

DROP TABLE IF EXISTS `dia_semana`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dia_semana` (
  `ID_DIA_SEMANA` tinyint(4) NOT NULL AUTO_INCREMENT,
  `dia` char(25) DEFAULT NULL,
  PRIMARY KEY (`ID_DIA_SEMANA`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dia_semana`
--

LOCK TABLES `dia_semana` WRITE;
/*!40000 ALTER TABLE `dia_semana` DISABLE KEYS */;
/*!40000 ALTER TABLE `dia_semana` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estado`
--

DROP TABLE IF EXISTS `estado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `estado` (
  `ID_ESTADO` int(11) NOT NULL AUTO_INCREMENT,
  `estado` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`ID_ESTADO`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estado`
--

LOCK TABLES `estado` WRITE;
/*!40000 ALTER TABLE `estado` DISABLE KEYS */;
INSERT INTO `estado` VALUES (0,'Inexistente'),(1,'Conectado'),(2,'Ocupado'),(3,'Desconectado'),(4,'Suspendido');
/*!40000 ALTER TABLE `estado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estado_entrega`
--

DROP TABLE IF EXISTS `estado_entrega`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `estado_entrega` (
  `ID_ESTADO_ENTREGA` tinyint(4) NOT NULL AUTO_INCREMENT,
  `estado` char(50) DEFAULT NULL,
  PRIMARY KEY (`ID_ESTADO_ENTREGA`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estado_entrega`
--

LOCK TABLES `estado_entrega` WRITE;
/*!40000 ALTER TABLE `estado_entrega` DISABLE KEYS */;
INSERT INTO `estado_entrega` VALUES (1,'Entregado a tiempo'),(2,'Entregado fuera de tiempo'),(3,'No entregado'),(4,'Calificado'),(5,'Calificado y vuelto a entregar'),(10,'En el tiempo establecido');
/*!40000 ALTER TABLE `estado_entrega` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estado_pforo`
--

DROP TABLE IF EXISTS `estado_pforo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `estado_pforo` (
  `ID_ESTADO_PFORO` tinyint(4) NOT NULL AUTO_INCREMENT,
  `estado_foro` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`ID_ESTADO_PFORO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estado_pforo`
--

LOCK TABLES `estado_pforo` WRITE;
/*!40000 ALTER TABLE `estado_pforo` DISABLE KEYS */;
/*!40000 ALTER TABLE `estado_pforo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `evento_r_has_diadesemana`
--

DROP TABLE IF EXISTS `evento_r_has_diadesemana`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `evento_r_has_diadesemana` (
  `ID_E_RDHS` smallint(6) NOT NULL AUTO_INCREMENT,
  `ID_EVENTO_R` smallint(6) DEFAULT NULL,
  `ID_DIA_SEMANA` tinyint(4) DEFAULT NULL,
  `hora_inicio` time NOT NULL,
  `hora_final` time NOT NULL,
  PRIMARY KEY (`ID_E_RDHS`),
  KEY `ID_EVENTO_R` (`ID_EVENTO_R`),
  KEY `ID_DIA_SEMANA` (`ID_DIA_SEMANA`),
  CONSTRAINT `evento_r_has_diadesemana_ibfk_1` FOREIGN KEY (`ID_EVENTO_R`) REFERENCES `eventos_repeat` (`ID_EVENTO_R`),
  CONSTRAINT `evento_r_has_diadesemana_ibfk_2` FOREIGN KEY (`ID_DIA_SEMANA`) REFERENCES `dia_semana` (`ID_DIA_SEMANA`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `evento_r_has_diadesemana`
--

LOCK TABLES `evento_r_has_diadesemana` WRITE;
/*!40000 ALTER TABLE `evento_r_has_diadesemana` DISABLE KEYS */;
/*!40000 ALTER TABLE `evento_r_has_diadesemana` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eventos`
--

DROP TABLE IF EXISTS `eventos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `eventos` (
  `ID_EVENTO` smallint(6) NOT NULL AUTO_INCREMENT,
  `ID_TIPO_EVENT` tinyint(4) DEFAULT NULL,
  `ID_AULA` char(50) DEFAULT NULL,
  `ID_USUARIO` int(11) DEFAULT NULL,
  `ID_ASIGN` int(11) DEFAULT NULL,
  `ID_MES` tinyint(4) DEFAULT NULL,
  `ID_CICLOS` smallint(6) DEFAULT NULL,
  `hora_inicio` time NOT NULL,
  `hora_final` time NOT NULL,
  `dia` char(25) DEFAULT NULL,
  `año` int(11) DEFAULT NULL,
  `fecha_comp` datetime NOT NULL,
  `key_word` char(100) DEFAULT NULL,
  `titulo` char(250) DEFAULT NULL,
  `descripcion` text DEFAULT NULL,
  PRIMARY KEY (`ID_EVENTO`),
  KEY `ID_TIPO_EVENT` (`ID_TIPO_EVENT`),
  KEY `ID_AULA` (`ID_AULA`),
  KEY `ID_USUARIO` (`ID_USUARIO`),
  KEY `ID_ASIGN` (`ID_ASIGN`),
  KEY `ID_MES` (`ID_MES`),
  KEY `ID_CICLOS` (`ID_CICLOS`),
  CONSTRAINT `eventos_ibfk_1` FOREIGN KEY (`ID_TIPO_EVENT`) REFERENCES `tipo_event` (`ID_TIPO_EVENT`),
  CONSTRAINT `eventos_ibfk_2` FOREIGN KEY (`ID_AULA`) REFERENCES `aula` (`ID_AULA`),
  CONSTRAINT `eventos_ibfk_3` FOREIGN KEY (`ID_USUARIO`) REFERENCES `usuario` (`ID_USUARIO`),
  CONSTRAINT `eventos_ibfk_4` FOREIGN KEY (`ID_ASIGN`) REFERENCES `asignacion` (`ID_ASIGN`),
  CONSTRAINT `eventos_ibfk_5` FOREIGN KEY (`ID_MES`) REFERENCES `mes` (`ID_MES`),
  CONSTRAINT `eventos_ibfk_6` FOREIGN KEY (`ID_CICLOS`) REFERENCES `ciclos` (`ID_CICLOS`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eventos`
--

LOCK TABLES `eventos` WRITE;
/*!40000 ALTER TABLE `eventos` DISABLE KEYS */;
INSERT INTO `eventos` VALUES (1,1,NULL,6,NULL,9,NULL,'00:00:00','23:59:59','22',NULL,'1910-09-22 12:00:00','aniversario-UNAM','Aniversario de la UNAM',NULL),(2,1,NULL,6,NULL,2,NULL,'00:00:00','23:59:59','11',NULL,'1964-02-11 12:00:00','aniversario-p6','Aniversario del plantel No.6 Antonio Caso',NULL),(3,4,NULL,7,NULL,1,NULL,'00:00:00','23:59:59','6',NULL,'2022-01-06 12:00:00','pijama','Día de la pijama',NULL),(4,4,NULL,7,NULL,10,NULL,'00:00:00','23:59:59','31',NULL,'2022-10-31 12:00:00','disfraz','Día del disfraz',NULL),(5,5,NULL,8,NULL,5,NULL,'00:00:00','23:59:59','15',NULL,'1917-05-15 12:00:00','teacher','Día del maestro',NULL),(6,5,NULL,8,NULL,5,NULL,'00:00:00','23:59:59','1',NULL,'1886-05-01 12:00:00','trabajo','Día del trabajo',NULL),(7,5,NULL,8,NULL,2,NULL,'00:00:00','23:59:59','5',NULL,'1917-02-05 12:00:00','aniversario-constitucion','Aniversario de la Constitución Política de los Estados Unidos Mexicanos',NULL),(8,5,NULL,8,NULL,9,NULL,'00:00:00','23:59:59','16',NULL,'1810-09-16 12:00:00','aniversario-independencia','Aniversario de la Independencia de México',NULL),(9,5,NULL,8,NULL,11,NULL,'00:00:00','23:59:59','20',NULL,'1910-11-20 12:00:00','aniversario-rev-mexicana','Aniversario de la Revolución Mexicana',NULL),(10,5,NULL,8,NULL,1,NULL,'00:00:00','23:59:59','1',NULL,'2022-01-01 12:00:00','new-year','Año nuevo',NULL),(11,5,NULL,8,NULL,3,NULL,'00:00:00','23:59:59','21',NULL,'1806-03-21 12:00:00','natalicio-Juarez','Aniversario del Natalicio de Benito Juárez',NULL),(12,5,NULL,8,NULL,5,NULL,'00:00:00','23:59:59','23',NULL,'1929-05-23 12:00:00','estudiante','Día del estudiante',NULL),(13,5,NULL,8,NULL,10,NULL,'00:00:00','23:59:59','2',NULL,'1968-10-02 12:00:00','masacre','Conmemoración de La Matanza de Tlatelolco',NULL),(14,3,NULL,6,NULL,6,NULL,'00:00:00','23:59:59','10',NULL,'2021-06-10 12:00:00','cw','Fin de curso WEB',NULL);
/*!40000 ALTER TABLE `eventos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eventos_rang`
--

DROP TABLE IF EXISTS `eventos_rang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `eventos_rang` (
  `ID_EVENTO_RANG` int(11) NOT NULL AUTO_INCREMENT,
  `ID_TIPO_EVENT` tinyint(4) DEFAULT NULL,
  `ID_AULA` char(50) DEFAULT NULL,
  `ID_USUARIO` int(11) DEFAULT NULL,
  `ID_ASIGN` int(11) DEFAULT NULL,
  `ID_MES` tinyint(4) DEFAULT NULL,
  `ID_MES_FIN` tinyint(4) DEFAULT NULL,
  `ID_CICLOS` smallint(6) DEFAULT NULL,
  `hora_inicio` time NOT NULL,
  `hora_final` time NOT NULL,
  `dia` char(25) DEFAULT NULL,
  `año` int(11) DEFAULT NULL,
  `fecha_comp` datetime NOT NULL,
  `dia_fin` char(50) DEFAULT NULL,
  `fecha_comp_fin` datetime NOT NULL,
  `key_word` char(100) DEFAULT NULL,
  `titulo` char(250) DEFAULT NULL,
  `descripcion` text DEFAULT NULL,
  PRIMARY KEY (`ID_EVENTO_RANG`),
  KEY `ID_TIPO_EVENT` (`ID_TIPO_EVENT`),
  KEY `ID_AULA` (`ID_AULA`),
  KEY `ID_USUARIO` (`ID_USUARIO`),
  KEY `ID_ASIGN` (`ID_ASIGN`),
  KEY `ID_MES` (`ID_MES`),
  KEY `ID_MES_FIN` (`ID_MES_FIN`),
  KEY `ID_CICLOS` (`ID_CICLOS`),
  CONSTRAINT `eventos_rang_ibfk_1` FOREIGN KEY (`ID_TIPO_EVENT`) REFERENCES `tipo_event` (`ID_TIPO_EVENT`),
  CONSTRAINT `eventos_rang_ibfk_2` FOREIGN KEY (`ID_AULA`) REFERENCES `aula` (`ID_AULA`),
  CONSTRAINT `eventos_rang_ibfk_3` FOREIGN KEY (`ID_USUARIO`) REFERENCES `usuario` (`ID_USUARIO`),
  CONSTRAINT `eventos_rang_ibfk_4` FOREIGN KEY (`ID_ASIGN`) REFERENCES `asignacion` (`ID_ASIGN`),
  CONSTRAINT `eventos_rang_ibfk_5` FOREIGN KEY (`ID_MES`) REFERENCES `mes` (`ID_MES`),
  CONSTRAINT `eventos_rang_ibfk_6` FOREIGN KEY (`ID_MES_FIN`) REFERENCES `mes_fin` (`ID_MES_FIN`),
  CONSTRAINT `eventos_rang_ibfk_7` FOREIGN KEY (`ID_CICLOS`) REFERENCES `ciclos` (`ID_CICLOS`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eventos_rang`
--

LOCK TABLES `eventos_rang` WRITE;
/*!40000 ALTER TABLE `eventos_rang` DISABLE KEYS */;
INSERT INTO `eventos_rang` VALUES (1,2,NULL,6,NULL,8,4,1,'00:00:00','23:59:59','9',NULL,'2021-08-09 07:00:00','8','2022-04-08 00:00:00',NULL,'Ciclo escolar 2021-2022',NULL),(2,3,NULL,6,NULL,4,4,NULL,'00:00:00','23:59:59','5',NULL,'2022-04-05 00:00:00','7','2022-04-07 23:59:59',NULL,'MICAH',NULL),(3,5,NULL,8,NULL,11,11,NULL,'00:00:00','23:59:59','1',NULL,'2022-11-01 00:00:00','2','2022-11-02 00:00:00',NULL,' Día de muertos',NULL),(4,1,NULL,6,NULL,1,1,1,'00:00:00','23:59:59','10',NULL,'2021-01-10 00:00:00','29','2022-01-29 00:00:00',NULL,'Inscripción a Concursos Interpreparatorianos',NULL),(5,1,NULL,6,NULL,2,2,1,'00:00:00','23:59:59','14',NULL,'2022-02-14 00:00:00','18','2022-02-18 00:00:00',NULL,'Etapa local Concursos Interpreparatorianos',NULL),(6,1,NULL,6,NULL,3,3,1,'00:00:00','23:59:59','7',NULL,'2022-03-07 00:00:00','11','2022-03-11 00:00:00',NULL,'Etapa final Concursos Interpreparatorianos',NULL),(7,2,NULL,6,NULL,4,5,1,'00:00:00','23:59:59','18',NULL,'2022-04-18 00:00:00','3','2022-05-03 00:00:00',NULL,'Exámenes ordinarios',NULL),(8,2,NULL,6,NULL,5,5,1,'00:00:00','23:59:59','18',NULL,'2022-05-18 00:00:00','25','2022-05-25 00:00:00',NULL,'Exámenes extraordinarios',NULL);
/*!40000 ALTER TABLE `eventos_rang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eventos_repeat`
--

DROP TABLE IF EXISTS `eventos_repeat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `eventos_repeat` (
  `ID_EVENTO_R` smallint(6) NOT NULL AUTO_INCREMENT,
  `ID_TIPO_EVENT` tinyint(4) DEFAULT 7,
  `ID_AULA` char(50) DEFAULT NULL,
  `titulo` char(250) DEFAULT NULL,
  `descripcion` text DEFAULT NULL,
  PRIMARY KEY (`ID_EVENTO_R`),
  KEY `ID_TIPO_EVENT` (`ID_TIPO_EVENT`),
  KEY `ID_AULA` (`ID_AULA`),
  CONSTRAINT `eventos_repeat_ibfk_1` FOREIGN KEY (`ID_TIPO_EVENT`) REFERENCES `tipo_event` (`ID_TIPO_EVENT`),
  CONSTRAINT `eventos_repeat_ibfk_2` FOREIGN KEY (`ID_AULA`) REFERENCES `aula` (`ID_AULA`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eventos_repeat`
--

LOCK TABLES `eventos_repeat` WRITE;
/*!40000 ALTER TABLE `eventos_repeat` DISABLE KEYS */;
/*!40000 ALTER TABLE `eventos_repeat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grado`
--

DROP TABLE IF EXISTS `grado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grado` (
  `ID_GRADO` tinyint(4) NOT NULL AUTO_INCREMENT,
  `grado` varchar(8) DEFAULT NULL,
  PRIMARY KEY (`ID_GRADO`),
  UNIQUE KEY `grado` (`grado`),
  UNIQUE KEY `grado_2` (`grado`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grado`
--

LOCK TABLES `grado` WRITE;
/*!40000 ALTER TABLE `grado` DISABLE KEYS */;
INSERT INTO `grado` VALUES (4,'Cuarto'),(0,'Graduado'),(5,'Quinto'),(6,'Sexto');
/*!40000 ALTER TABLE `grado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grupo`
--

DROP TABLE IF EXISTS `grupo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grupo` (
  `ID_GRUPO` smallint(6) NOT NULL,
  `grupo` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`ID_GRUPO`),
  UNIQUE KEY `grupo` (`grupo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grupo`
--

LOCK TABLES `grupo` WRITE;
/*!40000 ALTER TABLE `grupo` DISABLE KEYS */;
INSERT INTO `grupo` VALUES (101,401),(102,402),(152,452),(201,501),(212,512),(306,606);
/*!40000 ALTER TABLE `grupo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `juego`
--

DROP TABLE IF EXISTS `juego`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `juego` (
  `ID_JUEGO` smallint(6) NOT NULL AUTO_INCREMENT,
  `ID_TIPO_JUEGO` smallint(6) DEFAULT NULL,
  `ID_TEMA` tinyint(4) DEFAULT NULL,
  `ID_AULA` char(50) DEFAULT NULL,
  `ID_BLOQUE` tinyint(4) DEFAULT NULL,
  `nombre` char(50) DEFAULT NULL,
  `descripcion` text DEFAULT NULL,
  `fecha_asignacion` datetime NOT NULL,
  `fecha_entrega` datetime NOT NULL,
  `puntos` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID_JUEGO`),
  KEY `ID_TIPO_JUEGO` (`ID_TIPO_JUEGO`),
  KEY `ID_TEMA` (`ID_TEMA`),
  KEY `ID_AULA` (`ID_AULA`),
  KEY `ID_BLOQUE` (`ID_BLOQUE`),
  CONSTRAINT `juego_ibfk_1` FOREIGN KEY (`ID_TIPO_JUEGO`) REFERENCES `tipo_juego` (`ID_TIPO_JUEGO`),
  CONSTRAINT `juego_ibfk_2` FOREIGN KEY (`ID_TEMA`) REFERENCES `tema` (`ID_TEMA`),
  CONSTRAINT `juego_ibfk_3` FOREIGN KEY (`ID_AULA`) REFERENCES `aula` (`ID_AULA`),
  CONSTRAINT `juego_ibfk_4` FOREIGN KEY (`ID_BLOQUE`) REFERENCES `bloque` (`ID_BLOQUE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `juego`
--

LOCK TABLES `juego` WRITE;
/*!40000 ALTER TABLE `juego` DISABLE KEYS */;
/*!40000 ALTER TABLE `juego` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `links_asignacion`
--

DROP TABLE IF EXISTS `links_asignacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `links_asignacion` (
  `ID_LINKASIGN` int(11) NOT NULL AUTO_INCREMENT,
  `link` char(100) DEFAULT NULL,
  `ID_AULA` char(50) DEFAULT NULL,
  PRIMARY KEY (`ID_LINKASIGN`),
  KEY `ID_AULA` (`ID_AULA`),
  CONSTRAINT `links_asignacion_ibfk_1` FOREIGN KEY (`ID_AULA`) REFERENCES `aula` (`ID_AULA`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `links_asignacion`
--

LOCK TABLES `links_asignacion` WRITE;
/*!40000 ALTER TABLE `links_asignacion` DISABLE KEYS */;
/*!40000 ALTER TABLE `links_asignacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `materias`
--

DROP TABLE IF EXISTS `materias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `materias` (
  `ID_MATERIAS` tinyint(4) NOT NULL AUTO_INCREMENT,
  `materias` char(50) DEFAULT NULL,
  `ID_GRADO` tinyint(4) DEFAULT NULL,
  `ID_TIPO_MAT` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`ID_MATERIAS`),
  KEY `ID_GRADO` (`ID_GRADO`),
  KEY `ID_TIPO_MAT` (`ID_TIPO_MAT`),
  CONSTRAINT `materias_ibfk_1` FOREIGN KEY (`ID_GRADO`) REFERENCES `grado` (`ID_GRADO`),
  CONSTRAINT `materias_ibfk_2` FOREIGN KEY (`ID_TIPO_MAT`) REFERENCES `tipo_mat` (`ID_TIPO_MAT`)
) ENGINE=InnoDB AUTO_INCREMENT=93 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `materias`
--

LOCK TABLES `materias` WRITE;
/*!40000 ALTER TABLE `materias` DISABLE KEYS */;
INSERT INTO `materias` VALUES (1,'Matemáticas IV',4,5),(2,'Física III',4,5),(3,'Lengua Española',4,5),(4,'Historia Universal',4,5),(5,'Lógica',4,5),(6,'Geografía',4,5),(7,'Dibujo II',4,5),(8,'Lengua extranjera Inglés IV',4,5),(9,'Lengua extranjera Francés IV',4,5),(10,'Danza clásica',4,6),(11,'Danza contemporánea',4,6),(12,'Danza española',4,6),(13,'Danza regional mexicana',4,6),(14,'Escultura IV',4,6),(15,'Fotografía IV',4,6),(16,'Grabado IV',4,6),(17,'Música IV',4,6),(18,'Pintura IV',4,6),(19,'Teatro IV',4,6),(20,'Educación Física IV',4,5),(21,'Orientación Educativa IV',4,5),(22,'Informática',4,5),(23,'Matemáticas V',5,5),(24,'Química III',5,5),(25,'Biología IV',5,5),(26,'Educación para la Salud',5,5),(27,'Historia de México II',5,5),(28,'Etimologías Grecolatinas',5,5),(29,'Lengua extranjera Inglés V',5,5),(30,'Lengua extranjera Francés V',5,5),(31,'Lengua extranjera Italiano V',5,5),(32,'Lengua extranjera Alemán V',5,5),(33,'Lengua extranjera Inglés I',5,5),(34,'Lengua extranjera Francés I',5,5),(35,'Lengua extranjera Italiano I',5,5),(36,'Lengua extranjera Alemán I',5,5),(37,'Ética',5,5),(38,'Educación Física V',5,5),(39,'Danza clásica',5,6),(40,'Danza contemporánea',5,6),(41,'Danza española',5,6),(42,'Danza regional mexicana',5,6),(43,'Escultura V',5,6),(44,'Fotografía V',5,6),(45,'Grabado V',5,6),(46,'Música V',5,6),(47,'Pintura V',5,6),(48,'Teatro V',5,6),(49,'Orientación Educativa V',5,5),(50,'Literatura Universal',5,5),(51,'Derecho',6,5),(52,'Literatura Mex. e Iberoam',6,5),(53,'Inglés VI',6,5),(54,'Francés VI',6,5),(55,'Alemán II',6,5),(56,'Italiano II',6,5),(57,'Inglés II',6,5),(58,'Francés II',6,5),(59,'Psicología',6,5),(60,'Higiene Mental',6,5),(61,'Estadística y probabilidad',6,5),(62,'Matemáticas VI',6,5),(63,'Dibujo constructivo II',6,1),(64,'Física IV-A1',6,1),(65,'Química IV-A1',6,1),(66,'Geología y Mineralogía',6,1),(67,'Biología V',6,2),(68,'Física IV-A2',6,2),(69,'Química IV-A2',6,2),(70,'Geografía Económica',6,3),(71,'Introducc. Al estudio de las Ciencias Sociales y E',6,3),(72,'Problemas Soc.Polit y Económicos de México',6,3),(73,'Contabilidad y Gestión Administrativa',6,3),(74,'Historia de la Cultura',6,4),(75,'Historia de las Doctrinas Filosóficas',6,4),(76,'Modelado II',6,4),(77,'Estética',6,4),(78,'Historia del Arte',6,4),(79,'Temas selec. Biología',6,7),(80,'Temas selec. de Morfología y Fisiología',6,7),(81,'Físico-Química',6,7),(82,'Temas selec. Matemáticas',6,7),(83,'Informática aplicada a la Ciencia y la Industria',6,7),(84,'Astronomía',6,7),(85,'Literatura mexicana',6,7),(86,'Revolución Mexicana',6,7),(87,'Geografía Política',6,7),(88,'Sociología',6,7),(89,'Comunicación Visual',6,7),(90,'Pensamiento Filosófico de México',6,4),(91,'Latín',6,4),(92,'Griego',6,4);
/*!40000 ALTER TABLE `materias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mes`
--

DROP TABLE IF EXISTS `mes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mes` (
  `ID_MES` tinyint(4) NOT NULL AUTO_INCREMENT,
  `mes` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`ID_MES`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mes`
--

LOCK TABLES `mes` WRITE;
/*!40000 ALTER TABLE `mes` DISABLE KEYS */;
INSERT INTO `mes` VALUES (1,'Enero'),(2,'Febrero'),(3,'Marzo'),(4,'Abril'),(5,'Mayo'),(6,'Junio'),(7,'Julio'),(8,'Agosto'),(9,'Septiembre'),(10,'Octubre'),(11,'Noviembre'),(12,'Diciembre');
/*!40000 ALTER TABLE `mes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mes_fin`
--

DROP TABLE IF EXISTS `mes_fin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mes_fin` (
  `ID_MES_FIN` tinyint(4) NOT NULL AUTO_INCREMENT,
  `mes_fin` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`ID_MES_FIN`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mes_fin`
--

LOCK TABLES `mes_fin` WRITE;
/*!40000 ALTER TABLE `mes_fin` DISABLE KEYS */;
INSERT INTO `mes_fin` VALUES (1,'Enero'),(2,'Febrero'),(3,'Marzo'),(4,'Abril'),(5,'Mayo'),(6,'Junio'),(7,'Julio'),(8,'Agosto'),(9,'Septiembre'),(10,'Octubre'),(11,'Noviembre'),(12,'Diciembre');
/*!40000 ALTER TABLE `mes_fin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `opcion`
--

DROP TABLE IF EXISTS `opcion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `opcion` (
  `ID_OPCION` int(11) NOT NULL AUTO_INCREMENT,
  `opcion` char(250) DEFAULT NULL,
  PRIMARY KEY (`ID_OPCION`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `opcion`
--

LOCK TABLES `opcion` WRITE;
/*!40000 ALTER TABLE `opcion` DISABLE KEYS */;
/*!40000 ALTER TABLE `opcion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pcmmt_has_report`
--

DROP TABLE IF EXISTS `pcmmt_has_report`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pcmmt_has_report` (
  `ID_PCMMTHR` int(11) NOT NULL AUTO_INCREMENT,
  `ID_USUARIO` int(11) DEFAULT NULL,
  `ID_PUB_CMMT` int(11) DEFAULT NULL,
  `motivo` text DEFAULT NULL,
  PRIMARY KEY (`ID_PCMMTHR`),
  KEY `ID_USUARIO` (`ID_USUARIO`),
  KEY `ID_PUB_CMMT` (`ID_PUB_CMMT`),
  CONSTRAINT `pcmmt_has_report_ibfk_1` FOREIGN KEY (`ID_USUARIO`) REFERENCES `usuario` (`ID_USUARIO`),
  CONSTRAINT `pcmmt_has_report_ibfk_2` FOREIGN KEY (`ID_PUB_CMMT`) REFERENCES `pub_cam_mat` (`ID_PUB_CMMT`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pcmmt_has_report`
--

LOCK TABLES `pcmmt_has_report` WRITE;
/*!40000 ALTER TABLE `pcmmt_has_report` DISABLE KEYS */;
/*!40000 ALTER TABLE `pcmmt_has_report` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pforo_has_report`
--

DROP TABLE IF EXISTS `pforo_has_report`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pforo_has_report` (
  `ID_UHR_PFORO` int(11) NOT NULL AUTO_INCREMENT,
  `ID_USUARIO` int(11) DEFAULT NULL,
  `ID_PUB_FORO` int(11) DEFAULT NULL,
  `motivo` text DEFAULT NULL,
  PRIMARY KEY (`ID_UHR_PFORO`),
  KEY `ID_USUARIO` (`ID_USUARIO`),
  KEY `ID_PUB_FORO` (`ID_PUB_FORO`),
  CONSTRAINT `pforo_has_report_ibfk_1` FOREIGN KEY (`ID_USUARIO`) REFERENCES `usuario` (`ID_USUARIO`),
  CONSTRAINT `pforo_has_report_ibfk_2` FOREIGN KEY (`ID_PUB_FORO`) REFERENCES `pub_foro` (`ID_PUB_FORO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pforo_has_report`
--

LOCK TABLES `pforo_has_report` WRITE;
/*!40000 ALTER TABLE `pforo_has_report` DISABLE KEYS */;
/*!40000 ALTER TABLE `pforo_has_report` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pregunta`
--

DROP TABLE IF EXISTS `pregunta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pregunta` (
  `ID_PREGUNTA` smallint(6) NOT NULL AUTO_INCREMENT,
  `pregunta` char(250) DEFAULT NULL,
  `duracion_pregunta` time DEFAULT NULL,
  `ID_RESP_CORRECTA` smallint(6) DEFAULT NULL,
  `puntuacion` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`ID_PREGUNTA`),
  KEY `ID_RESP_CORRECTA` (`ID_RESP_CORRECTA`),
  CONSTRAINT `pregunta_ibfk_1` FOREIGN KEY (`ID_RESP_CORRECTA`) REFERENCES `resp_correcta` (`ID_RESP_CORRECTA`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pregunta`
--

LOCK TABLES `pregunta` WRITE;
/*!40000 ALTER TABLE `pregunta` DISABLE KEYS */;
/*!40000 ALTER TABLE `pregunta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pregunta_has_opcion`
--

DROP TABLE IF EXISTS `pregunta_has_opcion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pregunta_has_opcion` (
  `ID_PHO` int(11) NOT NULL AUTO_INCREMENT,
  `ID_PREGUNTA` smallint(6) DEFAULT NULL,
  `ID_OPCION` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID_PHO`),
  KEY `ID_PREGUNTA` (`ID_PREGUNTA`),
  KEY `ID_OPCION` (`ID_OPCION`),
  CONSTRAINT `pregunta_has_opcion_ibfk_1` FOREIGN KEY (`ID_PREGUNTA`) REFERENCES `pregunta` (`ID_PREGUNTA`),
  CONSTRAINT `pregunta_has_opcion_ibfk_2` FOREIGN KEY (`ID_OPCION`) REFERENCES `opcion` (`ID_OPCION`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pregunta_has_opcion`
--

LOCK TABLES `pregunta_has_opcion` WRITE;
/*!40000 ALTER TABLE `pregunta_has_opcion` DISABLE KEYS */;
/*!40000 ALTER TABLE `pregunta_has_opcion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `privacidad`
--

DROP TABLE IF EXISTS `privacidad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `privacidad` (
  `ID_PRIV` tinyint(4) NOT NULL AUTO_INCREMENT,
  `privacidad` char(25) DEFAULT NULL,
  PRIMARY KEY (`ID_PRIV`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `privacidad`
--

LOCK TABLES `privacidad` WRITE;
/*!40000 ALTER TABLE `privacidad` DISABLE KEYS */;
INSERT INTO `privacidad` VALUES (1,'Pública'),(2,'Privada'),(3,'Pública, con requisitos');
/*!40000 ALTER TABLE `privacidad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `progreso`
--

DROP TABLE IF EXISTS `progreso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `progreso` (
  `ID_PROGRESO` smallint(6) NOT NULL AUTO_INCREMENT,
  `progreso` smallint(6) DEFAULT NULL,
  `calificacion` float DEFAULT NULL,
  PRIMARY KEY (`ID_PROGRESO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `progreso`
--

LOCK TABLES `progreso` WRITE;
/*!40000 ALTER TABLE `progreso` DISABLE KEYS */;
/*!40000 ALTER TABLE `progreso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pub_cam_mat`
--

DROP TABLE IF EXISTS `pub_cam_mat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pub_cam_mat` (
  `ID_PUB_CMMT` int(11) NOT NULL AUTO_INCREMENT,
  `ID_USUARIO` int(11) DEFAULT NULL,
  `ID_MATERIAS` tinyint(4) DEFAULT NULL,
  `ID_AULA` char(50) DEFAULT NULL,
  `ID_TIPO_CPUB` int(11) DEFAULT NULL,
  `ID_TIPO_MAT_CAMMAT` int(11) DEFAULT NULL,
  `link` char(250) DEFAULT NULL,
  `tema` char(250) DEFAULT NULL,
  `unidad` smallint(6) DEFAULT NULL,
  `descripcion` text DEFAULT NULL,
  `fecha_creacion` datetime NOT NULL,
  `fecha_especial` datetime NOT NULL,
  `cam_cora` int(11) DEFAULT NULL,
  `cam_report` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID_PUB_CMMT`),
  KEY `ID_USUARIO` (`ID_USUARIO`),
  KEY `ID_MATERIAS` (`ID_MATERIAS`),
  KEY `ID_AULA` (`ID_AULA`),
  KEY `ID_TIPO_CPUB` (`ID_TIPO_CPUB`),
  KEY `ID_TIPO_MAT_CAMMAT` (`ID_TIPO_MAT_CAMMAT`),
  CONSTRAINT `pub_cam_mat_ibfk_1` FOREIGN KEY (`ID_USUARIO`) REFERENCES `usuario` (`ID_USUARIO`),
  CONSTRAINT `pub_cam_mat_ibfk_2` FOREIGN KEY (`ID_MATERIAS`) REFERENCES `materias` (`ID_MATERIAS`),
  CONSTRAINT `pub_cam_mat_ibfk_3` FOREIGN KEY (`ID_AULA`) REFERENCES `aula` (`ID_AULA`),
  CONSTRAINT `pub_cam_mat_ibfk_4` FOREIGN KEY (`ID_TIPO_CPUB`) REFERENCES `tipo_cpub` (`ID_TIPO_CPUB`),
  CONSTRAINT `pub_cam_mat_ibfk_5` FOREIGN KEY (`ID_TIPO_MAT_CAMMAT`) REFERENCES `tipo_mat_cammat` (`ID_TIPO_MAT_CAMMAT`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pub_cam_mat`
--

LOCK TABLES `pub_cam_mat` WRITE;
/*!40000 ALTER TABLE `pub_cam_mat` DISABLE KEYS */;
/*!40000 ALTER TABLE `pub_cam_mat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pub_foro`
--

DROP TABLE IF EXISTS `pub_foro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pub_foro` (
  `ID_PUB_FORO` int(11) NOT NULL AUTO_INCREMENT,
  `ID_USUARIO` int(11) DEFAULT NULL,
  `ID_MATERIAS` tinyint(4) DEFAULT NULL,
  `ID_TIPO_PFORO` tinyint(4) DEFAULT NULL,
  `ID_ESTADO_PFORO` tinyint(4) DEFAULT NULL,
  `pregunta` text DEFAULT NULL,
  `desarrollo` text DEFAULT NULL,
  `fecha_creacion` datetime NOT NULL,
  `link` char(250) DEFAULT NULL,
  PRIMARY KEY (`ID_PUB_FORO`),
  KEY `ID_USUARIO` (`ID_USUARIO`),
  KEY `ID_MATERIAS` (`ID_MATERIAS`),
  KEY `ID_TIPO_PFORO` (`ID_TIPO_PFORO`),
  KEY `ID_ESTADO_PFORO` (`ID_ESTADO_PFORO`),
  CONSTRAINT `pub_foro_ibfk_1` FOREIGN KEY (`ID_USUARIO`) REFERENCES `usuario` (`ID_USUARIO`),
  CONSTRAINT `pub_foro_ibfk_2` FOREIGN KEY (`ID_MATERIAS`) REFERENCES `materias` (`ID_MATERIAS`),
  CONSTRAINT `pub_foro_ibfk_3` FOREIGN KEY (`ID_TIPO_PFORO`) REFERENCES `tipo_pub_foro` (`ID_TIPO_PFORO`),
  CONSTRAINT `pub_foro_ibfk_4` FOREIGN KEY (`ID_ESTADO_PFORO`) REFERENCES `estado_pforo` (`ID_ESTADO_PFORO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pub_foro`
--

LOCK TABLES `pub_foro` WRITE;
/*!40000 ALTER TABLE `pub_foro` DISABLE KEYS */;
/*!40000 ALTER TABLE `pub_foro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `question_class`
--

DROP TABLE IF EXISTS `question_class`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `question_class` (
  `ID_QUESTION_CLASS` smallint(6) NOT NULL AUTO_INCREMENT,
  `ID_USUARIO` int(11) DEFAULT NULL,
  `ID_TIPO_USER` int(11) DEFAULT NULL,
  `ID_AULA` char(50) DEFAULT NULL,
  `ID_MATERIAS` tinyint(4) DEFAULT NULL,
  `ID_ASIGN` int(11) DEFAULT NULL,
  `ID_CUESTIONARIO` smallint(6) DEFAULT NULL,
  `ID_PROGRESO` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`ID_QUESTION_CLASS`),
  KEY `ID_USUARIO` (`ID_USUARIO`),
  KEY `ID_TIPO_USER` (`ID_TIPO_USER`),
  KEY `ID_AULA` (`ID_AULA`),
  KEY `ID_MATERIAS` (`ID_MATERIAS`),
  KEY `ID_ASIGN` (`ID_ASIGN`),
  KEY `ID_CUESTIONARIO` (`ID_CUESTIONARIO`),
  KEY `ID_PROGRESO` (`ID_PROGRESO`),
  CONSTRAINT `question_class_ibfk_1` FOREIGN KEY (`ID_USUARIO`) REFERENCES `usuario` (`ID_USUARIO`),
  CONSTRAINT `question_class_ibfk_2` FOREIGN KEY (`ID_TIPO_USER`) REFERENCES `tipo_user` (`ID_TIPO_USER`),
  CONSTRAINT `question_class_ibfk_3` FOREIGN KEY (`ID_AULA`) REFERENCES `aula` (`ID_AULA`),
  CONSTRAINT `question_class_ibfk_4` FOREIGN KEY (`ID_MATERIAS`) REFERENCES `materias` (`ID_MATERIAS`),
  CONSTRAINT `question_class_ibfk_5` FOREIGN KEY (`ID_ASIGN`) REFERENCES `asignacion` (`ID_ASIGN`),
  CONSTRAINT `question_class_ibfk_6` FOREIGN KEY (`ID_CUESTIONARIO`) REFERENCES `cuestionario` (`ID_CUESTIONARIO`),
  CONSTRAINT `question_class_ibfk_7` FOREIGN KEY (`ID_PROGRESO`) REFERENCES `progreso` (`ID_PROGRESO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `question_class`
--

LOCK TABLES `question_class` WRITE;
/*!40000 ALTER TABLE `question_class` DISABLE KEYS */;
/*!40000 ALTER TABLE `question_class` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `resp_correcta`
--

DROP TABLE IF EXISTS `resp_correcta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `resp_correcta` (
  `ID_RESP_CORRECTA` smallint(6) NOT NULL AUTO_INCREMENT,
  `respuesta` char(250) DEFAULT NULL,
  PRIMARY KEY (`ID_RESP_CORRECTA`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resp_correcta`
--

LOCK TABLES `resp_correcta` WRITE;
/*!40000 ALTER TABLE `resp_correcta` DISABLE KEYS */;
/*!40000 ALTER TABLE `resp_correcta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `resp_pforo`
--

DROP TABLE IF EXISTS `resp_pforo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `resp_pforo` (
  `ID_RESP_PFORO` int(11) NOT NULL AUTO_INCREMENT,
  `ID_USUARIO` int(11) DEFAULT NULL,
  `ID_PUB_FORO` int(11) DEFAULT NULL,
  `fecha_resp` datetime NOT NULL,
  `respuesta` text DEFAULT NULL,
  PRIMARY KEY (`ID_RESP_PFORO`),
  KEY `ID_USUARIO` (`ID_USUARIO`),
  KEY `ID_PUB_FORO` (`ID_PUB_FORO`),
  CONSTRAINT `resp_pforo_ibfk_1` FOREIGN KEY (`ID_USUARIO`) REFERENCES `usuario` (`ID_USUARIO`),
  CONSTRAINT `resp_pforo_ibfk_2` FOREIGN KEY (`ID_PUB_FORO`) REFERENCES `pub_foro` (`ID_PUB_FORO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resp_pforo`
--

LOCK TABLES `resp_pforo` WRITE;
/*!40000 ALTER TABLE `resp_pforo` DISABLE KEYS */;
/*!40000 ALTER TABLE `resp_pforo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `resp_rpforo`
--

DROP TABLE IF EXISTS `resp_rpforo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `resp_rpforo` (
  `ID_RESP_RPFORO` int(11) NOT NULL AUTO_INCREMENT,
  `ID_USUARIO` int(11) DEFAULT NULL,
  `ID_RESP_PFORO` int(11) DEFAULT NULL,
  `fecha_resp` datetime NOT NULL,
  `respuesta` text DEFAULT NULL,
  PRIMARY KEY (`ID_RESP_RPFORO`),
  KEY `ID_USUARIO` (`ID_USUARIO`),
  KEY `ID_RESP_PFORO` (`ID_RESP_PFORO`),
  CONSTRAINT `resp_rpforo_ibfk_1` FOREIGN KEY (`ID_USUARIO`) REFERENCES `usuario` (`ID_USUARIO`),
  CONSTRAINT `resp_rpforo_ibfk_2` FOREIGN KEY (`ID_RESP_PFORO`) REFERENCES `resp_pforo` (`ID_RESP_PFORO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resp_rpforo`
--

LOCK TABLES `resp_rpforo` WRITE;
/*!40000 ALTER TABLE `resp_rpforo` DISABLE KEYS */;
/*!40000 ALTER TABLE `resp_rpforo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rol_user`
--

DROP TABLE IF EXISTS `rol_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rol_user` (
  `ID_ROL` tinyint(4) NOT NULL AUTO_INCREMENT,
  `rol` char(50) DEFAULT NULL,
  PRIMARY KEY (`ID_ROL`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rol_user`
--

LOCK TABLES `rol_user` WRITE;
/*!40000 ALTER TABLE `rol_user` DISABLE KEYS */;
INSERT INTO `rol_user` VALUES (1,'Docente'),(2,'Estudiante'),(3,'Profesor sin permisos especiales'),(4,'Estudiante con permisos especiales'),(5,'Estudiante representante de grupo'),(6,'Ayudante de Profesor');
/*!40000 ALTER TABLE `rol_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tema`
--

DROP TABLE IF EXISTS `tema`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tema` (
  `ID_TEMA` tinyint(4) NOT NULL AUTO_INCREMENT,
  `titulo` char(60) DEFAULT NULL,
  `descripcion` char(200) DEFAULT NULL,
  `ID_BLOQUE` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`ID_TEMA`),
  UNIQUE KEY `titulo` (`titulo`),
  KEY `ID_BLOQUE` (`ID_BLOQUE`),
  CONSTRAINT `tema_ibfk_1` FOREIGN KEY (`ID_BLOQUE`) REFERENCES `bloque` (`ID_BLOQUE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tema`
--

LOCK TABLES `tema` WRITE;
/*!40000 ALTER TABLE `tema` DISABLE KEYS */;
/*!40000 ALTER TABLE `tema` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_asign`
--

DROP TABLE IF EXISTS `tipo_asign`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipo_asign` (
  `ID_TIPO_ASIGN` tinyint(4) NOT NULL AUTO_INCREMENT,
  `tipo_asign` char(25) DEFAULT NULL,
  PRIMARY KEY (`ID_TIPO_ASIGN`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_asign`
--

LOCK TABLES `tipo_asign` WRITE;
/*!40000 ALTER TABLE `tipo_asign` DISABLE KEYS */;
INSERT INTO `tipo_asign` VALUES (1,'Tarea'),(2,'Examen'),(3,'Pregunta'),(4,'Material'),(5,'Aviso'),(6,'Question');
/*!40000 ALTER TABLE `tipo_asign` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_aula`
--

DROP TABLE IF EXISTS `tipo_aula`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipo_aula` (
  `ID_TIPO_AULA` tinyint(4) NOT NULL,
  `ID_PRIV` tinyint(4) DEFAULT NULL,
  `tipo` char(15) DEFAULT NULL,
  PRIMARY KEY (`ID_TIPO_AULA`),
  KEY `ID_PRIV` (`ID_PRIV`),
  CONSTRAINT `tipo_aula_ibfk_1` FOREIGN KEY (`ID_PRIV`) REFERENCES `privacidad` (`ID_PRIV`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_aula`
--

LOCK TABLES `tipo_aula` WRITE;
/*!40000 ALTER TABLE `tipo_aula` DISABLE KEYS */;
INSERT INTO `tipo_aula` VALUES (1,2,'Curso'),(2,1,'Taller'),(3,2,'ETE'),(4,3,'Club');
/*!40000 ALTER TABLE `tipo_aula` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_cpub`
--

DROP TABLE IF EXISTS `tipo_cpub`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipo_cpub` (
  `ID_TIPO_CPUB` int(11) NOT NULL AUTO_INCREMENT,
  `tipo` char(50) DEFAULT NULL,
  `key_word` char(50) DEFAULT NULL,
  PRIMARY KEY (`ID_TIPO_CPUB`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_cpub`
--

LOCK TABLES `tipo_cpub` WRITE;
/*!40000 ALTER TABLE `tipo_cpub` DISABLE KEYS */;
/*!40000 ALTER TABLE `tipo_cpub` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_event`
--

DROP TABLE IF EXISTS `tipo_event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipo_event` (
  `ID_TIPO_EVENT` tinyint(4) NOT NULL AUTO_INCREMENT,
  `ID_PRIV` tinyint(4) DEFAULT NULL,
  `tipo` char(100) DEFAULT NULL,
  `descripcion` text DEFAULT NULL,
  PRIMARY KEY (`ID_TIPO_EVENT`),
  KEY `ID_PRIV` (`ID_PRIV`),
  CONSTRAINT `tipo_event_ibfk_1` FOREIGN KEY (`ID_PRIV`) REFERENCES `privacidad` (`ID_PRIV`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_event`
--

LOCK TABLES `tipo_event` WRITE;
/*!40000 ALTER TABLE `tipo_event` DISABLE KEYS */;
INSERT INTO `tipo_event` VALUES (1,1,'UNAM General','Eventos generales de la UNAM'),(2,1,'ENP CicloE','Eventos de la ENP6 y sus fechas administrativas relacionadas con el ciclo indicado'),(3,1,'Eventos_ENP','Eventos especiales de la ENP6, como concursos, premios, ferias, etcétera'),(4,1,'Eventos cultYsoc','Eventos culturales y sociales de la comunidad estudiantil'),(5,1,'Días festivos','Días nacional y mundialmente festivos'),(6,2,'Evento_Asign','Eventos relacionados a una asignación'),(7,2,'Clase_Aula','Horario de clase de un aula'),(8,2,'Recordatorio','Recordatorios personalizados por el usuario en su sección: Calendario Privado Único');
/*!40000 ALTER TABLE `tipo_event` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_juego`
--

DROP TABLE IF EXISTS `tipo_juego`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipo_juego` (
  `ID_TIPO_JUEGO` smallint(6) NOT NULL AUTO_INCREMENT,
  `juego` char(75) DEFAULT NULL,
  `descripcion` text DEFAULT NULL,
  PRIMARY KEY (`ID_TIPO_JUEGO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_juego`
--

LOCK TABLES `tipo_juego` WRITE;
/*!40000 ALTER TABLE `tipo_juego` DISABLE KEYS */;
/*!40000 ALTER TABLE `tipo_juego` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_mat`
--

DROP TABLE IF EXISTS `tipo_mat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipo_mat` (
  `ID_TIPO_MAT` tinyint(4) NOT NULL,
  `tipomat` char(70) DEFAULT NULL,
  PRIMARY KEY (`ID_TIPO_MAT`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_mat`
--

LOCK TABLES `tipo_mat` WRITE;
/*!40000 ALTER TABLE `tipo_mat` DISABLE KEYS */;
INSERT INTO `tipo_mat` VALUES (1,'Área 1. Ciencias Físico-Matemáticas y de las Ingenierías'),(2,'Área 2. Ciencias Biológicas, Químicas y de la Salud'),(3,'Área 3. Ciencias Sociales'),(4,'Área 4. Humanidades y de las Artes'),(5,'Tronco Común'),(6,'Estéticas'),(7,'Optativas');
/*!40000 ALTER TABLE `tipo_mat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_mat_cammat`
--

DROP TABLE IF EXISTS `tipo_mat_cammat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipo_mat_cammat` (
  `ID_TIPO_MAT_CAMMAT` int(11) NOT NULL AUTO_INCREMENT,
  `tipo_matcmmt` char(50) DEFAULT NULL,
  PRIMARY KEY (`ID_TIPO_MAT_CAMMAT`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_mat_cammat`
--

LOCK TABLES `tipo_mat_cammat` WRITE;
/*!40000 ALTER TABLE `tipo_mat_cammat` DISABLE KEYS */;
/*!40000 ALTER TABLE `tipo_mat_cammat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_pub_foro`
--

DROP TABLE IF EXISTS `tipo_pub_foro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipo_pub_foro` (
  `ID_TIPO_PFORO` tinyint(4) NOT NULL AUTO_INCREMENT,
  `tipo` char(50) DEFAULT NULL,
  PRIMARY KEY (`ID_TIPO_PFORO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_pub_foro`
--

LOCK TABLES `tipo_pub_foro` WRITE;
/*!40000 ALTER TABLE `tipo_pub_foro` DISABLE KEYS */;
/*!40000 ALTER TABLE `tipo_pub_foro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_user`
--

DROP TABLE IF EXISTS `tipo_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipo_user` (
  `ID_TIPO_USER` int(11) NOT NULL,
  `tipo_usuario` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`ID_TIPO_USER`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_user`
--

LOCK TABLES `tipo_user` WRITE;
/*!40000 ALTER TABLE `tipo_user` DISABLE KEYS */;
INSERT INTO `tipo_user` VALUES (1,'Alumno'),(2,'Docente'),(3,'Moderador'),(4,'Admin');
/*!40000 ALTER TABLE `tipo_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_has_asignacion`
--

DROP TABLE IF EXISTS `user_has_asignacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_has_asignacion` (
  `ID_UHA` int(11) NOT NULL AUTO_INCREMENT,
  `ID_USUARIO` int(11) DEFAULT NULL,
  `ID_ASIGN` int(11) DEFAULT NULL,
  `ID_ESTADO_ENTREGA` tinyint(4) DEFAULT NULL,
  `fecha_entrega` datetime NOT NULL,
  `calificacion` tinyint(4) DEFAULT NULL,
  `texto_tarea` char(200) DEFAULT NULL,
  PRIMARY KEY (`ID_UHA`),
  KEY `ID_USUARIO` (`ID_USUARIO`),
  KEY `ID_ASIGN` (`ID_ASIGN`),
  KEY `ID_ESTADO_ENTREGA` (`ID_ESTADO_ENTREGA`),
  CONSTRAINT `user_has_asignacion_ibfk_1` FOREIGN KEY (`ID_USUARIO`) REFERENCES `usuario` (`ID_USUARIO`),
  CONSTRAINT `user_has_asignacion_ibfk_2` FOREIGN KEY (`ID_ASIGN`) REFERENCES `asignacion` (`ID_ASIGN`),
  CONSTRAINT `user_has_asignacion_ibfk_3` FOREIGN KEY (`ID_ESTADO_ENTREGA`) REFERENCES `estado_entrega` (`ID_ESTADO_ENTREGA`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_has_asignacion`
--

LOCK TABLES `user_has_asignacion` WRITE;
/*!40000 ALTER TABLE `user_has_asignacion` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_has_asignacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_has_interes_pforo`
--

DROP TABLE IF EXISTS `user_has_interes_pforo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_has_interes_pforo` (
  `ID_UHI_PFORO` int(11) NOT NULL AUTO_INCREMENT,
  `ID_USUARIO` int(11) DEFAULT NULL,
  `ID_PUB_FORO` int(11) DEFAULT NULL,
  `ver_bool` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`ID_UHI_PFORO`),
  KEY `ID_USUARIO` (`ID_USUARIO`),
  KEY `ID_PUB_FORO` (`ID_PUB_FORO`),
  CONSTRAINT `user_has_interes_pforo_ibfk_1` FOREIGN KEY (`ID_USUARIO`) REFERENCES `usuario` (`ID_USUARIO`),
  CONSTRAINT `user_has_interes_pforo_ibfk_2` FOREIGN KEY (`ID_PUB_FORO`) REFERENCES `pub_foro` (`ID_PUB_FORO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_has_interes_pforo`
--

LOCK TABLES `user_has_interes_pforo` WRITE;
/*!40000 ALTER TABLE `user_has_interes_pforo` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_has_interes_pforo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_has_intereses_pubcammat`
--

DROP TABLE IF EXISTS `user_has_intereses_pubcammat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_has_intereses_pubcammat` (
  `ID_UHI_PCMMT` int(11) NOT NULL AUTO_INCREMENT,
  `ID_USUARIO` int(11) DEFAULT NULL,
  `ID_PUB_CMMT` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID_UHI_PCMMT`),
  KEY `ID_USUARIO` (`ID_USUARIO`),
  KEY `ID_PUB_CMMT` (`ID_PUB_CMMT`),
  CONSTRAINT `user_has_intereses_pubcammat_ibfk_1` FOREIGN KEY (`ID_USUARIO`) REFERENCES `usuario` (`ID_USUARIO`),
  CONSTRAINT `user_has_intereses_pubcammat_ibfk_2` FOREIGN KEY (`ID_PUB_CMMT`) REFERENCES `pub_cam_mat` (`ID_PUB_CMMT`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_has_intereses_pubcammat`
--

LOCK TABLES `user_has_intereses_pubcammat` WRITE;
/*!40000 ALTER TABLE `user_has_intereses_pubcammat` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_has_intereses_pubcammat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_has_juego`
--

DROP TABLE IF EXISTS `user_has_juego`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_has_juego` (
  `ID_UHJ` int(11) NOT NULL AUTO_INCREMENT,
  `ID_JUEGO` smallint(6) DEFAULT NULL,
  `ID_USUARIO` int(11) DEFAULT NULL,
  `puntos_obt` int(11) DEFAULT NULL,
  `posicion` smallint(6) DEFAULT NULL,
  `fecha_juego` datetime NOT NULL,
  PRIMARY KEY (`ID_UHJ`),
  KEY `ID_JUEGO` (`ID_JUEGO`),
  KEY `ID_USUARIO` (`ID_USUARIO`),
  CONSTRAINT `user_has_juego_ibfk_1` FOREIGN KEY (`ID_JUEGO`) REFERENCES `juego` (`ID_JUEGO`),
  CONSTRAINT `user_has_juego_ibfk_2` FOREIGN KEY (`ID_USUARIO`) REFERENCES `usuario` (`ID_USUARIO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_has_juego`
--

LOCK TABLES `user_has_juego` WRITE;
/*!40000 ALTER TABLE `user_has_juego` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_has_juego` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuario` (
  `ID_USUARIO` int(11) NOT NULL AUTO_INCREMENT,
  `ID_ESTADO` int(11) DEFAULT NULL,
  `ID_TIPO_USER` int(11) DEFAULT NULL,
  `ID_GRADO` tinyint(4) DEFAULT NULL,
  `nombre` char(50) DEFAULT NULL,
  `apodo` char(50) DEFAULT NULL,
  `apellido_paterno` char(50) DEFAULT NULL,
  `apellido_materno` char(50) DEFAULT NULL,
  `num_identificador` char(13) DEFAULT NULL,
  `correo` char(80) DEFAULT NULL,
  `ruta_foto` char(50) DEFAULT NULL,
  `estado_unico` char(50) DEFAULT NULL,
  `telefono` int(11) DEFAULT NULL,
  `password` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`ID_USUARIO`),
  UNIQUE KEY `apodo` (`apodo`),
  UNIQUE KEY `num_identificador` (`num_identificador`),
  UNIQUE KEY `correo` (`correo`),
  UNIQUE KEY `num_identificador_2` (`num_identificador`),
  KEY `ID_ESTADO` (`ID_ESTADO`),
  KEY `ID_TIPO_USER` (`ID_TIPO_USER`),
  KEY `ID_GRADO` (`ID_GRADO`),
  CONSTRAINT `usuario_ibfk_1` FOREIGN KEY (`ID_ESTADO`) REFERENCES `estado` (`ID_ESTADO`),
  CONSTRAINT `usuario_ibfk_2` FOREIGN KEY (`ID_TIPO_USER`) REFERENCES `tipo_user` (`ID_TIPO_USER`),
  CONSTRAINT `usuario_ibfk_3` FOREIGN KEY (`ID_GRADO`) REFERENCES `grado` (`ID_GRADO`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (1,2,1,5,'Fernando Samuel','Fershota','López','Morales','315489721','hola@gmail','./xd/non','Me pica todo',2147483647,NULL),(6,1,4,NULL,'Coordinación','Coordinación',NULL,NULL,'543216789012','c@c.c',NULL,NULL,NULL,'$2y$10$YEcD1SyqPD4x87zVvZll6OnMJPaAwi6h2xBHQ4m9yDSFGJLWe1BDy'),(7,1,4,NULL,'Sociedad P6','Sociedad P6',NULL,NULL,'098789098789','a@algo',NULL,NULL,NULL,'$2y$10$PasJHFXXR5K3WmtGDjqZquq5XfLBtahcdFbiWy.UTaSDl9IDSWHDC'),(8,1,3,NULL,'Moderador','Mod',NULL,NULL,'1234123412341','mod@mincra',NULL,NULL,NULL,'$2y$10$vAaOovTS7tWnrPHuIkF7bu4vWpSFTBo1GNOPCZQvY.xVKWTjtHOd6'),(14,1,1,NULL,'Yadid Sebastián','Yadid','López','Montes','321073077','321073077@alumno.enp.unam.mx',NULL,NULL,NULL,'245386'),(17,1,2,NULL,'Profe_Sebas',NULL,'Doc','DocDoc','123456789012','q@q.com',NULL,NULL,NULL,'$2y$10$GaBZr5ckCXHLqugee4GAheGa6GO5At7Sgxr4tKgrmGoIKYVPnBIcW'),(18,1,2,NULL,'Profesor',NULL,'De','Escuela','098765432112','a@a.mx',NULL,NULL,NULL,'$2y$10$XEMoaOI2pbQ3SFbo1asBpuhQDXcSQvDfpITar052qa0w6YwtJTvNq'),(19,1,1,NULL,'Sebastian','Seb','López','Montes','123456789','a@esc.com',NULL,NULL,NULL,'$2y$10$8JNHaoUUYWMdKkfNUthCIeUgNnzJymZpjumBuU11Y7sYCcKjaE4Fy'),(23,1,1,NULL,'Changomon','Mon','Chang','On','324567890','chan@On.com',NULL,NULL,NULL,'$2y$10$JJGzT38G0/1XvY4NF1FHMeDUuYmJud1bH9en4lCScU2l5fPzqrFRq'),(24,1,2,NULL,'Maestro',NULL,'Hernandez','Jose','prof00000001','porf@cos.com',NULL,NULL,NULL,'$2y$10$VIMh3gcRDq6IHUeAhgq8zeWCJtYOUUUm.RRQc4dEUieqNYIn/Se9W'),(25,1,2,NULL,'DudeProf',NULL,'Falo','Gómez','falo00000012','f@g.mx',NULL,NULL,NULL,'$2y$10$GXap2fyP08B777HlSf./oumo.nISjh/6Y2TwPyjjblY2Lgzy3h7sq'),(26,1,2,NULL,'Mireya',NULL,'Romero','Gutierrez','mireya000001','e@esc.com',NULL,NULL,NULL,'$2y$10$v3gqRmQST9XpTurS3cnm0ORmqZs23fJO1jLvHSEJL03zxkTJe4vU6'),(27,1,2,NULL,'ProfeA',NULL,'Lopez','Montes','profecool1234','a@a.com',NULL,NULL,NULL,'$2y$10$/i0BXK4o9bI5ae6UMcIpfOBORC.AW00VuBGNIpP2UpCIjLOmrlzam');
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario_has_insignias`
--

DROP TABLE IF EXISTS `usuario_has_insignias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuario_has_insignias` (
  `ID_USUARIO_HAS_INSIGNIAS` int(11) NOT NULL AUTO_INCREMENT,
  `ID_MATERIAS` tinyint(4) DEFAULT NULL,
  `ID_USUARIO` int(11) DEFAULT NULL,
  `ID_AULA` char(50) DEFAULT NULL,
  `nombre_insignia` char(50) DEFAULT NULL,
  PRIMARY KEY (`ID_USUARIO_HAS_INSIGNIAS`),
  KEY `ID_MATERIAS` (`ID_MATERIAS`),
  KEY `ID_USUARIO` (`ID_USUARIO`),
  KEY `ID_AULA` (`ID_AULA`),
  CONSTRAINT `usuario_has_insignias_ibfk_1` FOREIGN KEY (`ID_MATERIAS`) REFERENCES `materias` (`ID_MATERIAS`),
  CONSTRAINT `usuario_has_insignias_ibfk_2` FOREIGN KEY (`ID_USUARIO`) REFERENCES `usuario` (`ID_USUARIO`),
  CONSTRAINT `usuario_has_insignias_ibfk_3` FOREIGN KEY (`ID_AULA`) REFERENCES `aula` (`ID_AULA`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario_has_insignias`
--

LOCK TABLES `usuario_has_insignias` WRITE;
/*!40000 ALTER TABLE `usuario_has_insignias` DISABLE KEYS */;
/*!40000 ALTER TABLE `usuario_has_insignias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario_has_intereses`
--

DROP TABLE IF EXISTS `usuario_has_intereses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuario_has_intereses` (
  `ID_UHI` int(11) NOT NULL AUTO_INCREMENT,
  `ID_MATERIAS` tinyint(4) DEFAULT NULL,
  `ID_USUARIO` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID_UHI`),
  KEY `ID_MATERIAS` (`ID_MATERIAS`),
  KEY `ID_USUARIO` (`ID_USUARIO`),
  CONSTRAINT `usuario_has_intereses_ibfk_1` FOREIGN KEY (`ID_MATERIAS`) REFERENCES `materias` (`ID_MATERIAS`),
  CONSTRAINT `usuario_has_intereses_ibfk_2` FOREIGN KEY (`ID_USUARIO`) REFERENCES `usuario` (`ID_USUARIO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario_has_intereses`
--

LOCK TABLES `usuario_has_intereses` WRITE;
/*!40000 ALTER TABLE `usuario_has_intereses` DISABLE KEYS */;
/*!40000 ALTER TABLE `usuario_has_intereses` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-07-05 14:39:52
