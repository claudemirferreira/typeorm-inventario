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
-- Temporary table structure for view `VIEW_CONTAGEM`
--

DROP TABLE IF EXISTS `VIEW_CONTAGEM`;
/*!50001 DROP VIEW IF EXISTS `VIEW_CONTAGEM`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `VIEW_CONTAGEM` AS SELECT 
 1 AS `codigo`,
 1 AS `nome`,
 1 AS `quantidadeSistema`,
 1 AS `numeroContagem`,
 1 AS `inve_id`,
 1 AS `quantidadeFisica`*/;
SET character_set_client = @saved_cs_client;

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
  `quantidade` decimal(20,2) NOT NULL,
  `data` datetime DEFAULT NULL,
  `observacao` varchar(100) NOT NULL,
  `inve_id` int(11) DEFAULT NULL,
  `ende_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`cont_id`),
  KEY `FK_c5e73032b0cdebccf584a7a1de8` (`inve_id`),
  KEY `FK_c0d92d5995562a50c117d07b6ab` (`ende_id`),
  CONSTRAINT `FK_c0d92d5995562a50c117d07b6ab` FOREIGN KEY (`ende_id`) REFERENCES `inv_endereco` (`ende_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_c5e73032b0cdebccf584a7a1de8` FOREIGN KEY (`inve_id`) REFERENCES `inv_inventario` (`inve_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inv_contagem`
--

LOCK TABLES `inv_contagem` WRITE;
/*!40000 ALTER TABLE `inv_contagem` DISABLE KEYS */;
INSERT INTO `inv_contagem` VALUES (1,'1','0',200000.00,NULL,'',1,10),(2,'1','0',0.00,NULL,'',1,2),(3,'1','0',0.00,NULL,'',1,7),(4,'1','0',0.00,NULL,'',1,12),(5,'1','0',80000.00,NULL,'',1,5),(6,'1','0',4000.00,NULL,'',1,3),(7,'1','0',4000.00,NULL,'',1,8),(8,'1','0',0.00,NULL,'',1,11),(9,'1','0',0.00,NULL,'',1,4),(10,'1','0',0.00,NULL,'',1,9),(11,'1','0',0.00,NULL,'',1,6);
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
  `status` varchar(1) NOT NULL,
  `codigo` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`ende_id`),
  KEY `FK_ddb0be5a870677d1b5cca78a806` (`codigo`),
  CONSTRAINT `FK_ddb0be5a870677d1b5cca78a806` FOREIGN KEY (`codigo`) REFERENCES `inv_item` (`codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inv_endereco`
--

LOCK TABLES `inv_endereco` WRITE;
/*!40000 ALTER TABLE `inv_endereco` DISABLE KEYS */;
INSERT INTO `inv_endereco` VALUES (2,'01-12-A-10-023','0','443250'),(3,'01-13-H-05-004','0','306181'),(4,'01-12-A-11-003','0','443250'),(5,'01-13-G-05-019','0','306181'),(6,'01-12-A-10-029','0','443250'),(7,'01-12-A-11-001','0','443250'),(8,'01-13-G-04-022','0','306181'),(9,'01-12-A-11-004','0','443250'),(10,'01-13-F-04-006','0','306181'),(11,'01-12-R-12-004','0','106049'),(12,'01-12-A-13-041','0','408878');
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
  `status` varchar(255) NOT NULL,
  `descricao` varchar(60) NOT NULL,
  `inve_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`exec_id`),
  KEY `FK_87ee257a86f34226cc90b855bf6` (`inve_id`),
  CONSTRAINT `FK_87ee257a86f34226cc90b855bf6` FOREIGN KEY (`inve_id`) REFERENCES `inv_inventario` (`inve_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inv_execucao`
--

LOCK TABLES `inv_execucao` WRITE;
/*!40000 ALTER TABLE `inv_execucao` DISABLE KEYS */;
INSERT INTO `inv_execucao` VALUES (1,'2020-04-26 19:54:22','2020-04-26 19:54:25','1','',1),(2,NULL,NULL,'2','',1),(3,NULL,NULL,'3','',1);
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
  `status` int(11) NOT NULL,
  PRIMARY KEY (`inve_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inv_inventario`
--

LOCK TABLES `inv_inventario` WRITE;
/*!40000 ALTER TABLE `inv_inventario` DISABLE KEYS */;
INSERT INTO `inv_inventario` VALUES (1,'2020-04-26 00:00:00','33333',2);
/*!40000 ALTER TABLE `inv_inventario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inv_item`
--

DROP TABLE IF EXISTS `inv_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inv_item` (
  `codigo` varchar(20) NOT NULL,
  `nome` varchar(200) NOT NULL,
  `quantidadeSistema` decimal(20,2) NOT NULL,
  `quantidadeFisica` decimal(20,2) NOT NULL,
  PRIMARY KEY (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inv_item`
--

LOCK TABLES `inv_item` WRITE;
/*!40000 ALTER TABLE `inv_item` DISABLE KEYS */;
INSERT INTO `inv_item` VALUES ('106049','RES META 103 J 1/10W 1608TSMD',160127.00,0.00),('306181','ETIQUETA AUTO ADESIVA 39X11MM',288000.00,0.00),('408878','CAP CERA 104 K 50V X7R 1608',160000.00,0.00),('443250','CAP CERA 104 Z 50V Y5V 1608',160000.00,0.00);
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
  PRIMARY KEY (`item_xls_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inv_item_xls`
--

LOCK TABLES `inv_item_xls` WRITE;
/*!40000 ALTER TABLE `inv_item_xls` DISABLE KEYS */;
INSERT INTO `inv_item_xls` VALUES (1,'ETIQUETA AUTO ADESIVA 39X11MM','306181','PC','01-13-G-04-021','0100018671',288000.00),(2,'ETIQUETA AUTO ADESIVA 39X11MM','306181','PC','01-13-G-04-022','0100018676',288000.00),(3,'ETIQUETA AUTO ADESIVA 39X11MM','306181','PC','01-13-G-05-019','0100018663',288000.00),(4,'ETIQUETA AUTO ADESIVA 39X11MM','306181','PC','01-13-H-05-004','0100018688',288000.00),(5,'ETIQUETA AUTO ADESIVA 39X11MM','306181','PC','01-13-F-04-006','0100018499',288000.00),(6,'RES META 103 J 1/10W 1608TSMD','106049','PC','01-12-R-12-004','0100014773',160127.00),(7,'CAP CERA 104 Z 50V Y5V 1608','443250','PC','01-12-A-10-023','0100009922',160000.00),(8,'CAP CERA 104 Z 50V Y5V 1608','443250','PC','01-12-A-10-029','0100009985',160000.00),(9,'CAP CERA 104 Z 50V Y5V 1608','443250','PC','01-12-A-11-001','0100009673',160000.00),(10,'CAP CERA 104 Z 50V Y5V 1608','443250','PC','01-12-A-11-003','0100009695',160000.00),(11,'CAP CERA 104 Z 50V Y5V 1608','443250','PC','01-12-A-11-004','0100009706',160000.00),(12,'CAP CERA 104 K 50V X7R 1608','408878','PC','01-12-A-13-041','0100010135',160000.00);
/*!40000 ALTER TABLE `inv_item_xls` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `typeorm_metadata`
--

DROP TABLE IF EXISTS `typeorm_metadata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `typeorm_metadata` (
  `type` varchar(255) NOT NULL,
  `database` varchar(255) DEFAULT NULL,
  `schema` varchar(255) DEFAULT NULL,
  `table` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `value` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `typeorm_metadata`
--

LOCK TABLES `typeorm_metadata` WRITE;
/*!40000 ALTER TABLE `typeorm_metadata` DISABLE KEYS */;
/*!40000 ALTER TABLE `typeorm_metadata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `VIEW_CONTAGEM`
--

/*!50001 DROP VIEW IF EXISTS `VIEW_CONTAGEM`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `VIEW_CONTAGEM` AS select distinct `a`.`codigo` AS `codigo`,`a`.`nome` AS `nome`,`a`.`quantidadeSistema` AS `quantidadeSistema`,`c`.`numeroContagem` AS `numeroContagem`,`c`.`inve_id` AS `inve_id`,(select sum(`d`.`quantidade`) from (`inv_contagem` `d` join `inv_endereco` `f`) where ((`d`.`ende_id` = `f`.`ende_id`) and (`f`.`codigo` = `a`.`codigo`))) AS `quantidadeFisica` from ((`inv_item` `a` join `inv_endereco` `b`) join `inv_contagem` `c`) where ((`a`.`codigo` = `b`.`codigo`) and (`b`.`ende_id` = `c`.`ende_id`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-05-06 19:44:50
