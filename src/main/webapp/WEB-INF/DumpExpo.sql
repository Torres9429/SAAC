-- MySQL dump 10.13  Distrib 8.0.33, for Win64 (x86_64)
--
-- Host: localhost    Database: integradoradb
-- ------------------------------------------------------
-- Server version	8.0.33

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
-- Table structure for table `asesoria`
--

DROP TABLE IF EXISTS `asesoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `asesoria` (
  `id_asesoria` int NOT NULL AUTO_INCREMENT,
  `docente` int NOT NULL,
  `estudiante` int NOT NULL,
  `id_materia` int NOT NULL,
  `horario` int DEFAULT NULL,
  `id_aula` int NOT NULL,
  `id_status_asesoria` int NOT NULL,
  `dudas` varchar(200) DEFAULT NULL,
  `hora_inicio` time DEFAULT NULL,
  `hora_fin` time DEFAULT NULL,
  `dia` date DEFAULT NULL,
  PRIMARY KEY (`id_asesoria`),
  KEY `materia_asesoria_idx` (`id_materia`),
  KEY `horario_asesoria_idx` (`horario`),
  KEY `lugar_asesoria_idx` (`id_aula`),
  KEY `docente_asesoria_idx` (`docente`),
  KEY `estudiante_asesoria_idx` (`estudiante`),
  KEY `asesoria_estatus_idx` (`id_status_asesoria`),
  CONSTRAINT `asesoria_estatus` FOREIGN KEY (`id_status_asesoria`) REFERENCES `status_asesoria` (`id_status_asesoria`),
  CONSTRAINT `docente_asesoria` FOREIGN KEY (`docente`) REFERENCES `usuario` (`id_usuario`),
  CONSTRAINT `estudiante_asesoria` FOREIGN KEY (`estudiante`) REFERENCES `usuario` (`id_usuario`),
  CONSTRAINT `horario_asesoria` FOREIGN KEY (`horario`) REFERENCES `horario` (`id_horario`),
  CONSTRAINT `lugar_asesoria` FOREIGN KEY (`id_aula`) REFERENCES `aula` (`id_aula`),
  CONSTRAINT `materia_asesoria` FOREIGN KEY (`id_materia`) REFERENCES `materia` (`id_materia`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `asesoria`
--

LOCK TABLES `asesoria` WRITE;
/*!40000 ALTER TABLE `asesoria` DISABLE KEYS */;
INSERT INTO `asesoria` VALUES (1,6,2,2,2,4,4,'Cómo utilizar los inner join','08:00:00','09:15:00','2024-07-31'),(2,6,2,3,7,18,4,'Comandos','13:00:00','14:00:00','2024-08-02'),(3,7,12,6,8,4,2,'Cómo hacer la presentación del proyecto','15:00:00','16:00:00','2024-08-07'),(4,6,2,5,10,17,4,'Cómo relacionar tablas','11:00:00','12:00:00','2024-08-09'),(5,20,2,1,11,1,2,'','10:00:00','11:00:00','2024-08-07');
/*!40000 ALTER TABLE `asesoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aula`
--

DROP TABLE IF EXISTS `aula`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aula` (
  `id_aula` int NOT NULL AUTO_INCREMENT,
  `aula` varchar(20) NOT NULL,
  `id_edificio` int NOT NULL,
  PRIMARY KEY (`id_aula`),
  KEY `fk_aula_edificio1_idx` (`id_edificio`),
  CONSTRAINT `fk_aula_edificio1` FOREIGN KEY (`id_edificio`) REFERENCES `edificio` (`id_edificio`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb3 COMMENT='				';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aula`
--

LOCK TABLES `aula` WRITE;
/*!40000 ALTER TABLE `aula` DISABLE KEYS */;
INSERT INTO `aula` VALUES (1,'Aula 1',1),(2,'Aula 2',1),(3,'Aula 3',1),(4,'Aula 1',2),(5,'Aula 2',2),(6,'Aula 3',2),(7,'Aula 1',3),(8,'Aula 2',3),(9,'Aula 3',3),(10,'Aula 1',4),(11,'Aula 2',4),(12,'Aula 3',4),(13,'Aula 1',5),(14,'Aula 2',5),(15,'Aula 3',5),(16,'Aula 1',1),(17,'Aula 2',1),(18,'Aula 3',1),(19,'Aula 1',2),(20,'Aula 2',2),(21,'Aula 3',2),(22,'Aula 1',3),(23,'Aula 2',3),(24,'Aula 3',3),(25,'Aula 1',4),(26,'Aula 2',4),(27,'Aula 3',4),(28,'Aula 1',5),(29,'Aula 2',5),(30,'Aula 3',5);
/*!40000 ALTER TABLE `aula` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `calificacion_asesoria`
--

DROP TABLE IF EXISTS `calificacion_asesoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `calificacion_asesoria` (
  `id_calificacion` int NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(20) NOT NULL,
  PRIMARY KEY (`id_calificacion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `calificacion_asesoria`
--

LOCK TABLES `calificacion_asesoria` WRITE;
/*!40000 ALTER TABLE `calificacion_asesoria` DISABLE KEYS */;
/*!40000 ALTER TABLE `calificacion_asesoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `carrera`
--

DROP TABLE IF EXISTS `carrera`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `carrera` (
  `id_carrera` int NOT NULL AUTO_INCREMENT,
  `carrera` varchar(45) NOT NULL,
  `id_division` int NOT NULL,
  PRIMARY KEY (`id_carrera`),
  KEY `area_div_idx` (`id_division`),
  CONSTRAINT `area_div` FOREIGN KEY (`id_division`) REFERENCES `division_academica` (`id_division`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carrera`
--

LOCK TABLES `carrera` WRITE;
/*!40000 ALTER TABLE `carrera` DISABLE KEYS */;
INSERT INTO `carrera` VALUES (1,'Desarrollo de Software Multiplataforma',1),(2,'Infraestructura de Redes Digitales',1),(3,'Diseño y Animación Digital',1),(4,'Diseño y Moda Industrial en Producción',1),(5,'Mantenimiento Industrial',2),(6,'Nanotecnología',2),(7,'Procesos Industriales',2),(8,'Mecatrónica',2),(9,'Mercadotecnia',3),(10,'Contaduría',3),(11,'Capital Humano',3),(12,'Rehabilitación',4),(13,'Turismo y Bienestar',4);
/*!40000 ALTER TABLE `carrera` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `division_academica`
--

DROP TABLE IF EXISTS `division_academica`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `division_academica` (
  `id_division` int NOT NULL AUTO_INCREMENT,
  `division_academica` varchar(45) NOT NULL,
  PRIMARY KEY (`id_division`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `division_academica`
--

LOCK TABLES `division_academica` WRITE;
/*!40000 ALTER TABLE `division_academica` DISABLE KEYS */;
INSERT INTO `division_academica` VALUES (1,'DATID'),(2,'DAMI'),(3,'DACEA'),(4,'DATEFI');
/*!40000 ALTER TABLE `division_academica` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `edificio`
--

DROP TABLE IF EXISTS `edificio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `edificio` (
  `id_edificio` int NOT NULL AUTO_INCREMENT,
  `edificio` varchar(30) NOT NULL,
  PRIMARY KEY (`id_edificio`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `edificio`
--

LOCK TABLES `edificio` WRITE;
/*!40000 ALTER TABLE `edificio` DISABLE KEYS */;
INSERT INTO `edificio` VALUES (1,'Docencia 1'),(2,'Docencia 2'),(3,'Docencia 3'),(4,'Docencia 4'),(5,'Docencia 5');
/*!40000 ALTER TABLE `edificio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `evaluacion`
--

DROP TABLE IF EXISTS `evaluacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `evaluacion` (
  `id_evaluacion` int NOT NULL AUTO_INCREMENT,
  `comentarios` varchar(60) DEFAULT NULL,
  `id_calificacion` int NOT NULL,
  `id_estudiante` int NOT NULL,
  `id_docente` int NOT NULL,
  `id_asesoria` int NOT NULL,
  PRIMARY KEY (`id_evaluacion`),
  KEY `asesoria_evaluacion_idx` (`id_asesoria`),
  KEY `estudiante_usuario_idx` (`id_estudiante`),
  KEY `docente_usuario_idx` (`id_docente`),
  KEY `evaluacion_calif_idx` (`id_calificacion`),
  CONSTRAINT `asesoria_evaluacion` FOREIGN KEY (`id_asesoria`) REFERENCES `asesoria` (`id_asesoria`),
  CONSTRAINT `docente_usuario` FOREIGN KEY (`id_docente`) REFERENCES `usuario` (`id_usuario`),
  CONSTRAINT `estudiante_usuario` FOREIGN KEY (`id_estudiante`) REFERENCES `usuario` (`id_usuario`),
  CONSTRAINT `evaluacion_calif` FOREIGN KEY (`id_calificacion`) REFERENCES `calificacion_asesoria` (`id_calificacion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `evaluacion`
--

LOCK TABLES `evaluacion` WRITE;
/*!40000 ALTER TABLE `evaluacion` DISABLE KEYS */;
/*!40000 ALTER TABLE `evaluacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `horario`
--

DROP TABLE IF EXISTS `horario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `horario` (
  `id_horario` int NOT NULL AUTO_INCREMENT,
  `hora_inicio` time NOT NULL,
  `hora_fin` time NOT NULL,
  `dia` varchar(20) NOT NULL,
  `id_materia` int NOT NULL,
  `id_usuario` int NOT NULL,
  `id_aula` int DEFAULT NULL,
  PRIMARY KEY (`id_horario`),
  KEY `materia_idx` (`id_materia`),
  KEY `usuario_idx` (`id_usuario`),
  KEY `aula_horario_idx` (`id_aula`),
  CONSTRAINT `aula_horario` FOREIGN KEY (`id_aula`) REFERENCES `aula` (`id_aula`),
  CONSTRAINT `materia` FOREIGN KEY (`id_materia`) REFERENCES `materia` (`id_materia`),
  CONSTRAINT `usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `horario`
--

LOCK TABLES `horario` WRITE;
/*!40000 ALTER TABLE `horario` DISABLE KEYS */;
INSERT INTO `horario` VALUES (1,'12:00:00','13:16:00','2024-07-30',7,6,6),(2,'08:00:00','09:15:00','2024-07-31',2,6,4),(3,'11:00:00','12:00:00','2024-07-26',6,7,NULL),(4,'09:00:00','10:00:00','2024-07-29',2,7,NULL),(5,'13:00:00','14:00:00','2024-08-09',4,6,25),(6,'12:00:00','13:00:00','2024-08-10',3,6,17),(7,'13:00:00','14:00:00','2024-08-02',3,6,18),(8,'15:00:00','16:00:00','2024-08-09',1,7,8),(9,'15:00:00','16:00:00','2024-08-07',6,7,6),(10,'11:00:00','12:00:00','2024-08-09',5,6,17),(11,'10:00:00','11:00:00','2024-08-07',1,20,1);
/*!40000 ALTER TABLE `horario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `materia`
--

DROP TABLE IF EXISTS `materia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `materia` (
  `id_materia` int NOT NULL AUTO_INCREMENT,
  `materia` varchar(40) NOT NULL,
  `id_carrera` int NOT NULL,
  PRIMARY KEY (`id_materia`),
  UNIQUE KEY `materia_UNIQUE` (`materia`),
  KEY `materia_carrera_idx` (`id_carrera`),
  CONSTRAINT `materia_carrera` FOREIGN KEY (`id_carrera`) REFERENCES `carrera` (`id_carrera`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `materia`
--

LOCK TABLES `materia` WRITE;
/*!40000 ALTER TABLE `materia` DISABLE KEYS */;
INSERT INTO `materia` VALUES (1,'Aplicaciones Web',1),(2,'Base de datos',1),(3,'Sistemas operativos',1),(4,'Programación orientada a objetos',1),(5,'Bases de Datos para Aplicaciones',1),(6,'Integradora I',1),(7,'Probabilidad y Estadística',3);
/*!40000 ALTER TABLE `materia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `status_asesoria`
--

DROP TABLE IF EXISTS `status_asesoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `status_asesoria` (
  `id_status_asesoria` int NOT NULL AUTO_INCREMENT,
  `status` varchar(15) NOT NULL,
  PRIMARY KEY (`id_status_asesoria`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `status_asesoria`
--

LOCK TABLES `status_asesoria` WRITE;
/*!40000 ALTER TABLE `status_asesoria` DISABLE KEYS */;
INSERT INTO `status_asesoria` VALUES (1,'En curso'),(2,'Pendiente'),(3,'Cancelada'),(4,'Finalizada'),(5,'Aceptada'),(6,'Rechazada'),(7,'Reagendada'),(8,'Solicitada');
/*!40000 ALTER TABLE `status_asesoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipos_de_usuario`
--

DROP TABLE IF EXISTS `tipos_de_usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipos_de_usuario` (
  `id_tipo_usuario` int NOT NULL AUTO_INCREMENT,
  `tipo_usuario` varchar(20) NOT NULL,
  PRIMARY KEY (`id_tipo_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipos_de_usuario`
--

LOCK TABLES `tipos_de_usuario` WRITE;
/*!40000 ALTER TABLE `tipos_de_usuario` DISABLE KEYS */;
INSERT INTO `tipos_de_usuario` VALUES (1,'Administrador'),(2,'Docente'),(3,'Estudiante');
/*!40000 ALTER TABLE `tipos_de_usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario` (
  `id_usuario` int NOT NULL AUTO_INCREMENT,
  `id_tipo_usuario` int NOT NULL,
  `status` tinyint NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `apellido_paterno` varchar(30) NOT NULL,
  `apellido_materno` varchar(30) NOT NULL,
  `edad` int NOT NULL,
  `matricula` varchar(12) NOT NULL,
  `carrera` int DEFAULT NULL,
  `correo` varchar(45) NOT NULL,
  `contrasena` varchar(256) NOT NULL,
  `codigo` varchar(20) DEFAULT NULL,
  `fecha_creacion` datetime NOT NULL,
  PRIMARY KEY (`id_usuario`),
  UNIQUE KEY `correo_UNIQUE` (`correo`),
  KEY `tipoUsuario_idx` (`id_tipo_usuario`),
  KEY `usuario_carrera` (`carrera`),
  CONSTRAINT `tipoUsuario` FOREIGN KEY (`id_tipo_usuario`) REFERENCES `tipos_de_usuario` (`id_tipo_usuario`),
  CONSTRAINT `usuario_carrera` FOREIGN KEY (`carrera`) REFERENCES `carrera` (`id_carrera`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (1,3,1,'Abril Aidee','Medina','Villa',20,'20233tn079',1,'20233tn079@utez.edu.mx','d6c025ab876840151b08da4486c16274933e12de0d1ca1e7966f8a17b8545aef',NULL,'2024-07-12 20:03:10'),(2,3,1,'Estefany Alexa','Delgado','Heredia',18,'20233tn083',1,'20233tn083@utez.edu.mx','7764735c5d4d88ae3ef1c0d6c0a5769e4187c341895db19a82ba7d4e17b8c914','UHr6N0pjhGUQdcf3o6tQ','2024-07-12 20:03:10'),(3,1,1,'Angel Daniel','Ocampo','Martinez',20,'20233tn058',2,'20233tn058@utez.edu.mx','519ba91a5a5b4afb9dc66f8805ce8c442b6576316c19c6896af2fa9bda6aff71',NULL,'2024-07-12 20:03:10'),(4,3,1,'Cristopher','Bernal','Villabolos',18,'20233tn111',4,'20233tn111@utez.edu.mx','e4cea56cc6a55fe82f5acd81c28a74e43a77fe1392cd5f16c0e7cff0e7f11368',NULL,'2024-07-12 20:03:10'),(5,3,0,'Juan Jose','Diaz','Barroso',20,'20233tn112',5,'20233tn112@utez.edu.mx','ed08c290d7e22f7bb324b15cbadce35b0b348564fd2d5f95752388d86d71bcca',NULL,'2024-07-12 20:03:10'),(6,2,1,'Evelin','Villalva','Solorzano',26,'20233tn113',7,'20233tn113@utez.edu.mx','5e56e3537355f988e26a2c4a29107d440b8e755610042963b5aabac56dbb99d7',NULL,'2024-07-12 20:03:10'),(7,2,1,'Mauro','Bahena','Castro',47,'20233tn114',7,'20233tn114@utez.edu.mx','19e37c4dfe9a2e1570be1f4cbafca76f3ed757231c0865e02465c909d916b1d1',NULL,'2024-07-12 20:03:10'),(8,2,1,'Arturo','Villareal','Santaolalla',39,'20233tn115',2,'20233tn115@utez.edu.mx','11cdf86d5723eecce5af1f33e5fde9f066e608d0a1068f445d99820eef5c19ae',NULL,'2024-07-12 20:03:10'),(9,2,0,'Pablo','Sabiendo','Rodriguez',40,'20233tn116',5,'20233tn116@utez.edu.mx','26079e41910bcde04be636fbeecc9045379882b5ad3fe7f70b762436c6d98055',NULL,'2024-07-12 20:03:10'),(10,2,0,'Pedro Juan','Benitez','Martinez',47,'20233tn117',6,'20233tn117@utez.edu.mx','ee5cd7d5d96c8874117891b2c92a036f96918e66c102bc698ae77542c186f981',NULL,'2024-07-12 20:03:10'),(11,2,0,'Cristiano Ronaldo','Dos Santos','Aveiro',39,'20233tn118',7,'20233tn118@utez.edu.mx','e24dd2210803b4737a9bd9e3163a4ca807b63201c3bc32b68fb122ca52efff36',NULL,'2024-07-12 20:03:10'),(12,3,1,'Jesus Zohet','Neri','Guirant',18,'20233tn080',1,'20233tn080@utez.edu.mx','79e30b5ab67aff6d2f14ec5eddfcf538389cccf96241c844a56a79bfee1c06ba',NULL,'2024-07-12 20:56:55'),(13,1,1,'Rocio','Rodríguez','Torres',18,'20233tn105',1,'20233tn105@utez.edu.mx','a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3',NULL,'2024-07-15 16:50:22'),(15,3,0,'Lizeth','González','Estrada',23,'20233TN002',6,'20233tn002@utez.edu.mx','39328287ed8bce0de92e561a4fb6fb1897c1e6ad4ef64a6c1ff5d9d70e5f2823',NULL,'2024-07-27 21:53:02'),(16,3,1,'Adrián Uxue','Chávez','Martínez',18,'20233tn093',5,'20233tn093@gmail.com','c4038c4da2acc65a849079566cce2b4878bb38e8917608a96ed9969ad8916fc4',NULL,'2024-08-01 09:51:28'),(18,2,0,'Celin','De los Santos','Hernández',56,'00112233',7,'celin@gmail.com','1519d480202df35daeaa36b8150131ba08fde30ffce4cc1196ee96062b8fb530',NULL,'2024-08-01 10:17:13'),(19,3,0,'Martín','Castro','Torres',34,'001122334',5,'20233tn003@utez.edu.mx','ba7816bf8f01cfea414140de5dae2223b00361a396177a9cb410ff61f20015ad',NULL,'2024-08-06 12:15:35'),(20,2,1,'Maximiliano','Carsi','Castrejon',26,'CACM980210',1,'maximilianocarsi@utez.edu.mx','882342397996d71bcaa612c3ef8f24139df67817002a05713c6105364df24774',NULL,'2024-08-06 12:22:07');
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'integradoradb'
--
/*!50003 DROP PROCEDURE IF EXISTS `getAsesoriasByUsuario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getAsesoriasByUsuario`(IN p_user INT)
BEGIN
	select a.id_asesoria, a.docente, concat(u.nombre, ' ' , u.apellido_paterno) as nombre_docente, a.estudiante, a.id_materia, m.materia, c.id_carrera, dv.id_division, a.horario, a.id_aula, au.aula, e.id_edificio, e.edificio, a.id_status_asesoria, st.status, a.hora_inicio, a.hora_fin, a.dia
	from asesoria a 
	inner join aula au on a.id_aula = au.id_aula
	inner join edificio e on au.id_edificio = e.id_edificio
	inner join status_asesoria st on a.id_status_asesoria = st.id_status_asesoria
    inner join materia m on a.id_materia = m.id_materia
    inner join carrera c on m.id_carrera = c.id_carrera
	inner join division_academica dv on c.id_division = dv.id_division
    inner join usuario u on a.docente = u.id_usuario where a.docente = p_user or a.estudiante = p_user;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetHorarios` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetHorarios`()
BEGIN
	SELECT h.id_horario, 
       h.hora_inicio, 
       h.hora_fin, 
       h.dia, 
       h.id_materia, 
       h.id_usuario, 
       CONCAT(u.nombre, ' ', u.apellido_paterno) AS nombre_completo,
       m.materia, c.id_carrera, dv.id_division,
		a.id_aula, a.aula, a.id_edificio, e.edificio 
	FROM usuario u
	INNER JOIN horario h ON u.id_usuario = h.id_usuario
	INNER JOIN materia m ON h.id_materia = m.id_materia
	inner join carrera c on m.id_carrera = c.id_carrera
	inner join division_academica dv on c.id_division = dv.id_division
	inner join aula a on h.id_aula = a.id_aula
	inner join edificio e on a.id_edificio = e.id_edificio;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetHorariosPorUsuario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetHorariosPorUsuario`(IN p_id_usuario INT)
BEGIN
    SELECT h.id_horario, 
		h.hora_inicio, 
        h.hora_fin, 
        h.dia, 
        h.id_materia,
		CONCAT(u.nombre, ' ', u.apellido_paterno) AS nombre_completo,
        m.materia,
        a.id_aula, a.aula, a.id_edificio, e.edificio
    FROM usuario u
	INNER JOIN horario h ON u.id_usuario = h.id_usuario
	INNER JOIN materia m ON h.id_materia = m.id_materia
    inner join aula a on h.id_aula = a.id_aula
    inner join edificio e on a.id_edificio = e.id_edificio
    WHERE h.id_usuario = p_id_usuario;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getLugar` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getLugar`()
BEGIN 
	select a.id_aula, a.aula, a.id_edificio, e.edificio from aula a
	inner join edificio e on a.id_edificio = e.id_edificio;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getMaterias` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getMaterias`()
BEGIN 
	select m.id_materia, m.materia, m.id_carrera, c.carrera from materia m
	inner join carrera c on m.id_carrera = c.id_carrera;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getUsuariosConsultar` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getUsuariosConsultar`()
BEGIN
	select u.id_usuario, u.id_tipo_usuario, u.status, u.nombre, u.apellido_paterno, u.apellido_materno,
			u.edad,u.matricula, u.fecha_creacion, tu.tipo_usuario from usuario u
	INNER JOIN tipos_de_usuario tu ON u.id_tipo_usuario = tu.id_tipo_usuario;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-08-09 10:21:07
