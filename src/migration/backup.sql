CREATE DATABASE  IF NOT EXISTS `dbinventario` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `dbinventario`;
-- MySQL dump 10.13  Distrib 5.7.29, for Linux (x86_64)
--
-- Host: localhost    Database: dbinventario
-- ------------------------------------------------------
-- Server version	5.7.29-0ubuntu0.18.04.1

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
-- Table structure for table `inv_contagem`
--

DROP TABLE IF EXISTS `inv_contagem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inv_contagem` (
  `cont_id` int(11) NOT NULL AUTO_INCREMENT,
  `numeroContagem` varchar(1) NOT NULL,
  `status` varchar(1) NOT NULL,
  `quantidade` decimal(20,2) DEFAULT NULL,
  `data` datetime DEFAULT NULL,
  `observacao` varchar(100) NOT NULL,
  `inve_id` int(11) DEFAULT NULL,
  `ende_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`cont_id`),
  KEY `FK_c5e73032b0cdebccf584a7a1de8` (`inve_id`),
  KEY `FK_c0d92d5995562a50c117d07b6ab` (`ende_id`),
  CONSTRAINT `FK_c0d92d5995562a50c117d07b6ab` FOREIGN KEY (`ende_id`) REFERENCES `inv_endereco` (`ende_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_c5e73032b0cdebccf584a7a1de8` FOREIGN KEY (`inve_id`) REFERENCES `inv_inventario` (`inve_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=424 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inv_contagem`
--

LOCK TABLES `inv_contagem` WRITE;
/*!40000 ALTER TABLE `inv_contagem` DISABLE KEYS */;
INSERT INTO `inv_contagem` VALUES (349,'1','0',0.00,NULL,'',18,345),(350,'1','0',0.00,NULL,'',18,346),(351,'1','0',0.00,NULL,'',18,347),(352,'1','0',0.00,NULL,'',18,348),(353,'1','0',0.00,NULL,'',18,349),(354,'1','0',0.00,NULL,'',18,350),(355,'1','0',0.00,NULL,'',18,351),(356,'1','0',0.00,NULL,'',18,352),(357,'1','0',0.00,NULL,'',18,353),(358,'1','0',0.00,NULL,'',18,354),(359,'1','0',0.00,NULL,'',18,355),(360,'1','0',0.00,NULL,'',18,356),(364,'1','0',0.00,NULL,'',19,360),(365,'1','0',0.00,NULL,'',19,361),(366,'1','0',0.00,NULL,'',19,362),(367,'1','0',0.00,NULL,'',19,363),(368,'1','0',0.00,NULL,'',19,364),(369,'1','0',0.00,NULL,'',19,372),(370,'1','0',0.00,NULL,'',19,373),(371,'1','0',0.00,NULL,'',19,374),(372,'1','0',0.00,NULL,'',19,375),(373,'1','0',0.00,NULL,'',19,376),(374,'1','0',0.00,NULL,'',19,365),(375,'1','0',0.00,NULL,'',19,377),(376,'1','0',0.00,NULL,'',19,366),(377,'1','0',0.00,NULL,'',19,367),(378,'1','0',0.00,NULL,'',19,368),(379,'1','0',0.00,NULL,'',19,369),(380,'1','0',0.00,NULL,'',19,370),(381,'1','0',0.00,NULL,'',19,378),(382,'1','0',0.00,NULL,'',19,379),(383,'1','0',0.00,NULL,'',19,380),(384,'1','0',0.00,NULL,'',19,381),(385,'1','0',0.00,NULL,'',19,382),(386,'1','0',0.00,NULL,'',19,371),(387,'1','0',0.00,NULL,'',19,383),(388,'1','0',0.00,NULL,'',21,384),(389,'1','0',0.00,NULL,'',21,385),(390,'1','0',0.00,NULL,'',21,386),(391,'1','0',0.00,NULL,'',21,387),(392,'1','0',0.00,NULL,'',21,388),(393,'1','0',0.00,NULL,'',21,396),(394,'1','0',0.00,NULL,'',21,397),(395,'1','0',0.00,NULL,'',21,398),(396,'1','0',0.00,NULL,'',21,399),(397,'1','0',0.00,NULL,'',21,400),(398,'1','0',0.00,NULL,'',21,408),(399,'1','0',0.00,NULL,'',21,409),(400,'1','0',0.00,NULL,'',21,410),(401,'1','0',0.00,NULL,'',21,411),(402,'1','0',0.00,NULL,'',21,412),(403,'1','0',0.00,NULL,'',21,389),(404,'1','0',0.00,NULL,'',21,401),(405,'1','0',0.00,NULL,'',21,413),(406,'1','0',0.00,NULL,'',21,390),(407,'1','0',0.00,NULL,'',21,391),(408,'1','0',0.00,NULL,'',21,392),(409,'1','0',0.00,NULL,'',21,393),(410,'1','0',0.00,NULL,'',21,394),(411,'1','0',0.00,NULL,'',21,402),(412,'1','0',0.00,NULL,'',21,403),(413,'1','0',0.00,NULL,'',21,404),(414,'1','0',0.00,NULL,'',21,405),(415,'1','0',0.00,NULL,'',21,406),(416,'1','0',0.00,NULL,'',21,414),(417,'1','0',0.00,NULL,'',21,415),(418,'1','0',0.00,NULL,'',21,416),(419,'1','0',0.00,NULL,'',21,417),(420,'1','0',0.00,NULL,'',21,418),(421,'1','0',0.00,NULL,'',21,395),(422,'1','0',0.00,NULL,'',21,407),(423,'1','0',0.00,NULL,'',21,419);
/*!40000 ALTER TABLE `inv_contagem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inv_endereco`
--

DROP TABLE IF EXISTS `inv_endereco`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inv_endereco` (
  `ende_id` int(11) NOT NULL AUTO_INCREMENT,
  `descricao` varchar(60) NOT NULL,
  `item_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`ende_id`),
  KEY `FK_ea3b109be8fa4bbcdf29ff3d398` (`item_id`),
  CONSTRAINT `FK_ea3b109be8fa4bbcdf29ff3d398` FOREIGN KEY (`item_id`) REFERENCES `inv_item` (`item_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=420 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inv_endereco`
--

LOCK TABLES `inv_endereco` WRITE;
/*!40000 ALTER TABLE `inv_endereco` DISABLE KEYS */;
INSERT INTO `inv_endereco` VALUES (345,'01-13-G-04-021',65),(346,'01-13-G-04-022',65),(347,'01-13-G-05-019',65),(348,'01-13-H-05-004',65),(349,'01-13-F-04-006',65),(350,'01-12-R-12-004',66),(351,'01-12-A-10-023',67),(352,'01-12-A-10-029',67),(353,'01-12-A-11-001',67),(354,'01-12-A-11-003',67),(355,'01-12-A-11-004',67),(356,'01-12-A-13-041',68),(360,'01-13-G-04-021',72),(361,'01-13-G-04-022',72),(362,'01-13-G-05-019',72),(363,'01-13-H-05-004',72),(364,'01-13-F-04-006',72),(365,'01-12-R-12-004',73),(366,'01-12-A-10-023',74),(367,'01-12-A-10-029',74),(368,'01-12-A-11-001',74),(369,'01-12-A-11-003',74),(370,'01-12-A-11-004',74),(371,'01-12-A-13-041',75),(372,'01-13-G-04-021',72),(373,'01-13-G-04-022',72),(374,'01-13-G-05-019',72),(375,'01-13-H-05-004',72),(376,'01-13-F-04-006',72),(377,'01-12-R-12-004',73),(378,'01-12-A-10-023',74),(379,'01-12-A-10-029',74),(380,'01-12-A-11-001',74),(381,'01-12-A-11-003',74),(382,'01-12-A-11-004',74),(383,'01-12-A-13-041',75),(384,'01-13-G-04-021',76),(385,'01-13-G-04-022',76),(386,'01-13-G-05-019',76),(387,'01-13-H-05-004',76),(388,'01-13-F-04-006',76),(389,'01-12-R-12-004',77),(390,'01-12-A-10-023',78),(391,'01-12-A-10-029',78),(392,'01-12-A-11-001',78),(393,'01-12-A-11-003',78),(394,'01-12-A-11-004',78),(395,'01-12-A-13-041',79),(396,'01-13-G-04-021',76),(397,'01-13-G-04-022',76),(398,'01-13-G-05-019',76),(399,'01-13-H-05-004',76),(400,'01-13-F-04-006',76),(401,'01-12-R-12-004',77),(402,'01-12-A-10-023',78),(403,'01-12-A-10-029',78),(404,'01-12-A-11-001',78),(405,'01-12-A-11-003',78),(406,'01-12-A-11-004',78),(407,'01-12-A-13-041',79),(408,'01-13-G-04-021',76),(409,'01-13-G-04-022',76),(410,'01-13-G-05-019',76),(411,'01-13-H-05-004',76),(412,'01-13-F-04-006',76),(413,'01-12-R-12-004',77),(414,'01-12-A-10-023',78),(415,'01-12-A-10-029',78),(416,'01-12-A-11-001',78),(417,'01-12-A-11-003',78),(418,'01-12-A-11-004',78),(419,'01-12-A-13-041',79);
/*!40000 ALTER TABLE `inv_endereco` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inv_execucao`
--

DROP TABLE IF EXISTS `inv_execucao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inv_execucao` (
  `exec_id` int(11) NOT NULL AUTO_INCREMENT,
  `inicio` datetime DEFAULT NULL,
  `fim` datetime DEFAULT NULL,
  `numeroContagem` varchar(1) NOT NULL,
  `descricao` varchar(60) NOT NULL,
  `inve_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`exec_id`),
  KEY `FK_87ee257a86f34226cc90b855bf6` (`inve_id`),
  CONSTRAINT `FK_87ee257a86f34226cc90b855bf6` FOREIGN KEY (`inve_id`) REFERENCES `inv_inventario` (`inve_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inv_execucao`
--

LOCK TABLES `inv_execucao` WRITE;
/*!40000 ALTER TABLE `inv_execucao` DISABLE KEYS */;
INSERT INTO `inv_execucao` VALUES (53,'2020-05-24 08:17:08',NULL,'1','',18),(54,NULL,NULL,'2','',18),(55,NULL,NULL,'3','',18),(56,'2020-05-24 08:28:33',NULL,'1','',19),(57,NULL,NULL,'2','',19),(58,NULL,NULL,'3','',19),(59,NULL,NULL,'1','',20),(60,NULL,NULL,'2','',20),(61,NULL,NULL,'3','',20),(62,'2020-05-24 09:52:23',NULL,'1','',21),(63,NULL,NULL,'2','',21),(64,NULL,NULL,'3','',21);
/*!40000 ALTER TABLE `inv_execucao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inv_inventario`
--

DROP TABLE IF EXISTS `inv_inventario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inv_inventario` (
  `inve_id` int(11) NOT NULL AUTO_INCREMENT,
  `data` datetime NOT NULL,
  `nome` varchar(30) NOT NULL,
  `empr_cnpj` varchar(14) DEFAULT NULL,
  `numeroContagem` varchar(1) NOT NULL,
  PRIMARY KEY (`inve_id`),
  KEY `FK_39735495a327a74a2a723d73292` (`empr_cnpj`),
  CONSTRAINT `FK_39735495a327a74a2a723d73292` FOREIGN KEY (`empr_cnpj`) REFERENCES `saa_empresa` (`empr_cnpj`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inv_inventario`
--

LOCK TABLES `inv_inventario` WRITE;
/*!40000 ALTER TABLE `inv_inventario` DISABLE KEYS */;
INSERT INTO `inv_inventario` VALUES (18,'2020-05-24 00:00:00','SEMP',NULL,'1'),(19,'2020-05-24 00:00:00','Semp novo',NULL,'1'),(20,'2020-05-24 00:00:00','75445',NULL,'1'),(21,'2020-05-24 00:00:00','BIG AMIGÃO',NULL,'1');
/*!40000 ALTER TABLE `inv_inventario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inv_item`
--

DROP TABLE IF EXISTS `inv_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inv_item` (
  `item_id` int(11) NOT NULL AUTO_INCREMENT,
  `codigo` varchar(60) NOT NULL,
  `nome` varchar(200) NOT NULL,
  `quantidadeSistema` decimal(20,2) NOT NULL,
  `quantidadeFisica` decimal(20,2) NOT NULL,
  `primeiraContagem` decimal(20,2) NOT NULL,
  `segundaContagem` decimal(20,2) NOT NULL,
  `terceiraContagem` decimal(20,2) NOT NULL,
  `empr_cnpj` varchar(14) DEFAULT NULL,
  `inve_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  KEY `FK_f55c8efb731579fe9ac6f6b097b` (`empr_cnpj`),
  KEY `FK_b362b15e54eeaa27bcf6ee6964d` (`inve_id`),
  CONSTRAINT `FK_b362b15e54eeaa27bcf6ee6964d` FOREIGN KEY (`inve_id`) REFERENCES `inv_inventario` (`inve_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_f55c8efb731579fe9ac6f6b097b` FOREIGN KEY (`empr_cnpj`) REFERENCES `saa_empresa` (`empr_cnpj`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=80 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inv_item`
--

LOCK TABLES `inv_item` WRITE;
/*!40000 ALTER TABLE `inv_item` DISABLE KEYS */;
INSERT INTO `inv_item` VALUES (65,'306181','ETIQUETA AUTO ADESIVA 39X11MM',288000.00,0.00,0.00,0.00,0.00,NULL,18),(66,'106049','RES META 103 J 1/10W 1608TSMD',160127.00,0.00,0.00,0.00,0.00,NULL,18),(67,'443250','CAP CERA 104 Z 50V Y5V 1608',160000.00,0.00,0.00,0.00,0.00,NULL,18),(68,'408878','CAP CERA 104 K 50V X7R 1608',160000.00,0.00,0.00,0.00,0.00,NULL,18),(72,'306181','ETIQUETA AUTO ADESIVA 39X11MM',288000.00,0.00,0.00,0.00,0.00,NULL,19),(73,'106049','RES META 103 J 1/10W 1608TSMD',160127.00,0.00,0.00,0.00,0.00,NULL,19),(74,'443250','CAP CERA 104 Z 50V Y5V 1608',160000.00,0.00,0.00,0.00,0.00,NULL,19),(75,'408878','CAP CERA 104 K 50V X7R 1608',160000.00,0.00,0.00,0.00,0.00,NULL,19),(76,'306181','ETIQUETA AUTO ADESIVA 39X11MM',288000.00,0.00,0.00,0.00,0.00,NULL,21),(77,'106049','RES META 103 J 1/10W 1608TSMD',160127.00,0.00,0.00,0.00,0.00,NULL,21),(78,'443250','CAP CERA 104 Z 50V Y5V 1608',160000.00,0.00,0.00,0.00,0.00,NULL,21),(79,'408878','CAP CERA 104 K 50V X7R 1608',160000.00,0.00,0.00,0.00,0.00,NULL,21);
/*!40000 ALTER TABLE `inv_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inv_item_xls`
--

DROP TABLE IF EXISTS `inv_item_xls`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inv_item_xls` (
  `item_xls_id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(200) NOT NULL,
  `codigo` varchar(20) NOT NULL,
  `unidade` varchar(6) NOT NULL,
  `endereco` varchar(50) NOT NULL,
  `boleto` varchar(60) NOT NULL,
  `quantidade` decimal(20,2) NOT NULL,
  `inve_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`item_xls_id`),
  KEY `FK_bb19cc582cb3514e3ad307219c9` (`inve_id`),
  CONSTRAINT `FK_bb19cc582cb3514e3ad307219c9` FOREIGN KEY (`inve_id`) REFERENCES `inv_inventario` (`inve_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=241 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inv_item_xls`
--

LOCK TABLES `inv_item_xls` WRITE;
/*!40000 ALTER TABLE `inv_item_xls` DISABLE KEYS */;
INSERT INTO `inv_item_xls` VALUES (205,'ETIQUETA AUTO ADESIVA 39X11MM','306181','PC','01-13-G-04-021','0100018671',288000.00,18),(206,'ETIQUETA AUTO ADESIVA 39X11MM','306181','PC','01-13-G-04-022','0100018676',288000.00,18),(207,'ETIQUETA AUTO ADESIVA 39X11MM','306181','PC','01-13-G-05-019','0100018663',288000.00,18),(208,'ETIQUETA AUTO ADESIVA 39X11MM','306181','PC','01-13-H-05-004','0100018688',288000.00,18),(209,'ETIQUETA AUTO ADESIVA 39X11MM','306181','PC','01-13-F-04-006','0100018499',288000.00,18),(210,'RES META 103 J 1/10W 1608TSMD','106049','PC','01-12-R-12-004','0100014773',160127.00,18),(211,'CAP CERA 104 Z 50V Y5V 1608','443250','PC','01-12-A-10-023','0100009922',160000.00,18),(212,'CAP CERA 104 Z 50V Y5V 1608','443250','PC','01-12-A-10-029','0100009985',160000.00,18),(213,'CAP CERA 104 Z 50V Y5V 1608','443250','PC','01-12-A-11-001','0100009673',160000.00,18),(214,'CAP CERA 104 Z 50V Y5V 1608','443250','PC','01-12-A-11-003','0100009695',160000.00,18),(215,'CAP CERA 104 Z 50V Y5V 1608','443250','PC','01-12-A-11-004','0100009706',160000.00,18),(216,'CAP CERA 104 K 50V X7R 1608','408878','PC','01-12-A-13-041','0100010135',160000.00,18),(217,'ETIQUETA AUTO ADESIVA 39X11MM','306181','PC','01-13-G-04-021','0100018671',288000.00,19),(218,'ETIQUETA AUTO ADESIVA 39X11MM','306181','PC','01-13-G-04-022','0100018676',288000.00,19),(219,'ETIQUETA AUTO ADESIVA 39X11MM','306181','PC','01-13-G-05-019','0100018663',288000.00,19),(220,'ETIQUETA AUTO ADESIVA 39X11MM','306181','PC','01-13-H-05-004','0100018688',288000.00,19),(221,'ETIQUETA AUTO ADESIVA 39X11MM','306181','PC','01-13-F-04-006','0100018499',288000.00,19),(222,'RES META 103 J 1/10W 1608TSMD','106049','PC','01-12-R-12-004','0100014773',160127.00,19),(223,'CAP CERA 104 Z 50V Y5V 1608','443250','PC','01-12-A-10-023','0100009922',160000.00,19),(224,'CAP CERA 104 Z 50V Y5V 1608','443250','PC','01-12-A-10-029','0100009985',160000.00,19),(225,'CAP CERA 104 Z 50V Y5V 1608','443250','PC','01-12-A-11-001','0100009673',160000.00,19),(226,'CAP CERA 104 Z 50V Y5V 1608','443250','PC','01-12-A-11-003','0100009695',160000.00,19),(227,'CAP CERA 104 Z 50V Y5V 1608','443250','PC','01-12-A-11-004','0100009706',160000.00,19),(228,'CAP CERA 104 K 50V X7R 1608','408878','PC','01-12-A-13-041','0100010135',160000.00,19),(229,'ETIQUETA AUTO ADESIVA 39X11MM','306181','PC','01-13-G-04-021','0100018671',288000.00,21),(230,'ETIQUETA AUTO ADESIVA 39X11MM','306181','PC','01-13-G-04-022','0100018676',288000.00,21),(231,'ETIQUETA AUTO ADESIVA 39X11MM','306181','PC','01-13-G-05-019','0100018663',288000.00,21),(232,'ETIQUETA AUTO ADESIVA 39X11MM','306181','PC','01-13-H-05-004','0100018688',288000.00,21),(233,'ETIQUETA AUTO ADESIVA 39X11MM','306181','PC','01-13-F-04-006','0100018499',288000.00,21),(234,'RES META 103 J 1/10W 1608TSMD','106049','PC','01-12-R-12-004','0100014773',160127.00,21),(235,'CAP CERA 104 Z 50V Y5V 1608','443250','PC','01-12-A-10-023','0100009922',160000.00,21),(236,'CAP CERA 104 Z 50V Y5V 1608','443250','PC','01-12-A-10-029','0100009985',160000.00,21),(237,'CAP CERA 104 Z 50V Y5V 1608','443250','PC','01-12-A-11-001','0100009673',160000.00,21),(238,'CAP CERA 104 Z 50V Y5V 1608','443250','PC','01-12-A-11-003','0100009695',160000.00,21),(239,'CAP CERA 104 Z 50V Y5V 1608','443250','PC','01-12-A-11-004','0100009706',160000.00,21),(240,'CAP CERA 104 K 50V X7R 1608','408878','PC','01-12-A-13-041','0100010135',160000.00,21);
/*!40000 ALTER TABLE `inv_item_xls` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `saa_empresa`
--

DROP TABLE IF EXISTS `saa_empresa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `saa_empresa` (
  `empr_cnpj` varchar(14) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `endereco` varchar(100) NOT NULL,
  `telefone` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`empr_cnpj`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `saa_empresa`
--

LOCK TABLES `saa_empresa` WRITE;
/*!40000 ALTER TABLE `saa_empresa` DISABLE KEYS */;
/*!40000 ALTER TABLE `saa_empresa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'dbinventario'
--

--
-- Dumping routines for database 'dbinventario'
--
/*!50003 DROP PROCEDURE IF EXISTS `finalizarContagem` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `finalizarContagem`(IN p_inve_id INT
																, IN p_exec_id INT
                                                                , IN p_numero_contagem VARCHAR(1))
BEGIN	
    -- Declare local variables
   DECLARE done BOOLEAN DEFAULT 0;
   DECLARE v_item_id INT;
   DECLARE v_quantidade DECIMAL(20,2);
   DECLARE v_numero_contagem varchar(1);
   -- Declare the cursor
   DECLARE cursorContagem CURSOR FOR
		SELECT c.item_id item_id, sum( a.quantidade) quantidade
		FROM inv_contagem a , inv_endereco b, inv_item c
		WHERE a.ende_id = b.ende_id	
        AND c.item_id = b.item_id
		AND a.inve_id = p_inve_id 
        AND a.numeroContagem = p_numero_contagem
		GROUP BY c.item_id;                            
   -- Declare continue handler
   DECLARE CONTINUE HANDLER FOR SQLSTATE '02000' SET done=1;   
   -- Open the cursor
   OPEN cursorContagem;
   -- Loop through all rows
   REPEAT
      -- Get order number
      FETCH cursorContagem INTO v_item_id, v_quantidade;
        -- atualizar os totais das contagens realizadas
        if p_numero_contagem = '1' then
			UPDATE inv_item SET primeiraContagem = v_quantidade 
			WHERE item_id = v_item_id;        
		elseif p_numero_contagem = '2' then
			UPDATE inv_item SET segundaContagem = v_quantidade 
			WHERE item_id = v_item_id;           
		elseif p_numero_contagem = '3' then
			UPDATE inv_item SET terceiraContagem = v_quantidade 
			WHERE item_id = v_item_id;        
        end if;        
        
   -- End of loop
   UNTIL done END REPEAT;
   -- Close the cursor
   CLOSE cursorContagem;   
	-- atualiza a data fim da contagem
	UPDATE inv_execucao SET fim = now() WHERE exec_id = p_exec_id;
    if p_numero_contagem = '1' then
		set v_numero_contagem = '2';
    elseif p_numero_contagem = '2' then
		set v_numero_contagem = '3';
    elseif p_numero_contagem = '3' then
		set v_numero_contagem = '4';
    end if;
    -- incrementa o status para a proxima contagem
    UPDATE inv_inventario SET numeroContagem = v_numero_contagem WHERE inve_id = p_inve_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `importarItens` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `importarItens`(IN p_inve_id INT)
BEGIN

	-- DELETE FROM inv_endereco;
    DELETE FROM inv_item WHERE inve_id = p_inve_id;
    
	-- importar os itens para tabela itens
	insert into inv_item (codigo, nome, quantidadeSistema, 
	quantidadeFisica, primeiraContagem, segundaContagem,
	terceiraContagem, empr_cnpj, inve_id )
	select distinct codigo, nome, quantidade as quantidadeSistema, 
	0.00 as quantidadeFisica, 0.00 primeiraContagem, 0.00 segundaContagem,
	0.00 terceiraContagem, null empr_cnpj, inve_id 
	from inv_item_xls where inve_id =p_inve_id;
    
    -- importar os enderecos
    insert into inv_endereco (descricao, item_id)
    SELECT a.endereco, b.item_id 
    FROM dbinventario.inv_item_xls a, dbinventario.inv_item b
	where a.codigo = b.codigo 
	and b.inve_id = p_inve_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `iniciarPrimeiraContagem` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `iniciarPrimeiraContagem`(
												IN p_inve_id INT,
                                                IN p_exec_id INT)
BEGIN
	DELETE FROM inv_contagem WHERE inve_id = p_inve_id;
    
	-- inseri os itens na contagens
	INSERT INTO inv_contagem  (numeroContagem, status, quantidade, observacao, data, inve_id, ende_id)
	SELECT '1' numeroContagem, '0' status, 0 quantidade, '' observacao, null data, b.inve_id, a.ende_id
	FROM inv_endereco a 
	INNER JOIN inv_item b on a.item_id = b.item_id
	WHERE b.inve_id = p_inve_id;
    
    update inv_execucao set inicio = now() where exec_id = p_exec_id;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `iniciarSegundaContagem` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `iniciarSegundaContagem`(
												IN p_inve_id INT,
                                                IN p_exec_id INT)
BEGIN
	INSERT INTO inv_contagem  (numeroContagem, status, quantidade, observacao, data, inve_id, ende_id)
	select '2' , '0' , 0 , '' , null, inve_id, ende_id
	from (
		SELECT b.item_id, quantidadeSistema, sum(a.quantidade) quantidadeContagem
				, c.inve_id
		FROM inv_contagem a 
		inner join inv_endereco b on a.ende_id = b.ende_id
		inner join inv_item c on c.item_id = b.item_id
		where a.inve_id = p_inve_id
        and a.numeroContagem = '1'
		group by b.item_id, c.codigo, quantidadeSistema
	) as itenDivergentes 
	inner join inv_endereco f on itenDivergentes.item_id = f.item_id 
	where quantidadeSistema <> quantidadeContagem;
    -- seta a data fim da contagem
    update inv_execucao set inicio = now() where exec_id = p_exec_id;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `iniciarTerceiraContagem` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `iniciarTerceiraContagem`(
												IN p_inve_id INT,
                                                IN p_exec_id INT)
BEGIN
	INSERT INTO inv_contagem  (numeroContagem, status, quantidade, observacao, data, inve_id, ende_id)
	select '3' numeroContagem, '0' status, 0 quantidade, '' observacao, null data, inve_id, ende_id
 	from (
    SELECT b.item_id, quantidadeSistema, c.primeiraContagem, c.segundaContagem,
		sum(a.quantidade) quantidadeContagem
				, c.inve_id
		FROM inv_contagem a 
		inner join inv_endereco b on a.ende_id = b.ende_id
		inner join inv_item c on c.item_id = b.item_id
		where a.inve_id = 15 -- p_inve_id
        and a.numeroContagem = '2'
        and c.quantidadeSistema <> c.segundaContagem
        and c.segundaContagem <> c.primeiraContagem
		group by b.item_id, quantidadeSistema, c.primeiraContagem, c.segundaContagem
        ) as itenDivergentes 
 	inner join inv_endereco f on itenDivergentes.item_id = f.item_id 
 	where quantidadeSistema <> quantidadeContagem;
    -- seta a data fim da contagem
    update inv_execucao set inicio = now() where exec_id = p_exec_id;

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

-- Dump completed on 2020-05-27  6:47:36
