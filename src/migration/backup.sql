-- MySQL dump 10.13  Distrib 5.7.30, for Linux (x86_64)
--
-- Host: localhost    Database: dbinventario
-- ------------------------------------------------------
-- Server version	5.7.30-0ubuntu0.18.04.1

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
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inv_contagem`
--

LOCK TABLES `inv_contagem` WRITE;
/*!40000 ALTER TABLE `inv_contagem` DISABLE KEYS */;
INSERT INTO `inv_contagem` VALUES (20,'1','0',0.00,NULL,'',5,35),(21,'1','0',0.00,NULL,'',5,36),(22,'1','0',0.00,NULL,'',5,37),(23,'1','0',0.00,NULL,'',5,38),(24,'1','0',0.00,NULL,'',5,39),(27,'1','0',0.00,NULL,'',6,42),(28,'1','0',0.00,NULL,'',6,43),(29,'1','0',0.00,NULL,'',6,47),(30,'1','0',0.00,NULL,'',6,48),(31,'1','0',0.00,NULL,'',6,44),(32,'1','0',0.00,NULL,'',6,49),(33,'1','0',0.00,NULL,'',6,45),(34,'1','0',0.00,NULL,'',6,50),(35,'1','0',0.00,NULL,'',6,46),(36,'1','0',0.00,NULL,'',6,51),(42,'1','0',0.00,NULL,'',7,57),(43,'1','0',0.00,NULL,'',7,58),(44,'1','0',0.00,NULL,'',7,59),(45,'1','0',0.00,NULL,'',7,60),(46,'1','0',0.00,NULL,'',7,61),(49,'1','0',0.00,NULL,'',8,64),(50,'1','0',0.00,NULL,'',8,65),(51,'1','0',0.00,NULL,'',8,66),(52,'1','0',0.00,NULL,'',8,67),(53,'1','0',0.00,NULL,'',8,68);
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
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inv_endereco`
--

LOCK TABLES `inv_endereco` WRITE;
/*!40000 ALTER TABLE `inv_endereco` DISABLE KEYS */;
INSERT INTO `inv_endereco` VALUES (35,'01-13-G-04-021',19),(36,'01-13-G-04-022',19),(37,'01-12-R-12-004',20),(38,'01-12-A-10-023',21),(39,'01-12-A-13-041',22),(42,'01-13-G-04-021',26),(43,'01-13-G-04-022',26),(44,'01-12-R-12-004',27),(45,'01-12-A-10-023',28),(46,'01-12-A-13-041',29),(47,'01-13-G-04-021',26),(48,'01-13-G-04-022',26),(49,'01-12-R-12-004',27),(50,'01-12-A-10-023',28),(51,'01-12-A-13-041',29),(57,'01-13-G-04-021',33),(58,'01-13-G-04-022',33),(59,'01-12-R-12-004',34),(60,'01-12-A-10-023',35),(61,'01-12-A-13-041',36),(64,'01-13-G-04-021',40),(65,'01-13-G-04-022',40),(66,'01-12-R-12-004',41),(67,'01-12-A-10-023',42),(68,'01-12-A-13-041',43);
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
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inv_execucao`
--

LOCK TABLES `inv_execucao` WRITE;
/*!40000 ALTER TABLE `inv_execucao` DISABLE KEYS */;
INSERT INTO `inv_execucao` VALUES (13,'2020-05-31 10:55:00',NULL,'1','',5),(14,NULL,NULL,'2','',5),(15,NULL,NULL,'3','',5),(16,'2020-05-31 10:58:26',NULL,'1','',6),(17,NULL,NULL,'2','',6),(18,NULL,NULL,'3','',6),(19,'2020-05-31 13:09:35',NULL,'1','',7),(20,NULL,NULL,'2','',7),(21,NULL,NULL,'3','',7),(22,'2020-05-31 13:11:11',NULL,'1','',8),(23,NULL,NULL,'2','',8),(24,NULL,NULL,'3','',8);
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
  `numeroContagem` varchar(1) NOT NULL,
  `empr_cnpj` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`inve_id`),
  KEY `FK_39735495a327a74a2a723d73292` (`empr_cnpj`),
  CONSTRAINT `FK_39735495a327a74a2a723d73292` FOREIGN KEY (`empr_cnpj`) REFERENCES `saa_empresa` (`empr_cnpj`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inv_inventario`
--

LOCK TABLES `inv_inventario` WRITE;
/*!40000 ALTER TABLE `inv_inventario` DISABLE KEYS */;
INSERT INTO `inv_inventario` VALUES (5,'2020-05-31 00:00:00','teste 1','1',NULL),(6,'2020-05-31 00:00:00','teste 2222','1',NULL),(7,'2020-05-31 00:00:00','homologacao teste','1',NULL),(8,'2020-05-31 00:00:00','homologação 444444','1',NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inv_item`
--

LOCK TABLES `inv_item` WRITE;
/*!40000 ALTER TABLE `inv_item` DISABLE KEYS */;
INSERT INTO `inv_item` VALUES (19,'306181','ETIQUETA AUTO ADESIVA 39X11MM',288000.00,0.00,0.00,0.00,0.00,NULL,5),(20,'106049','RES META 103 J 1/10W 1608TSMD',160127.00,0.00,0.00,0.00,0.00,NULL,5),(21,'443250','CAP CERA 104 Z 50V Y5V 1608',160000.00,0.00,0.00,0.00,0.00,NULL,5),(22,'408878','CAP CERA 104 K 50V X7R 1608',160000.00,0.00,0.00,0.00,0.00,NULL,5),(26,'306181','ETIQUETA AUTO ADESIVA 39X11MM',288000.00,0.00,0.00,0.00,0.00,NULL,6),(27,'106049','RES META 103 J 1/10W 1608TSMD',160127.00,0.00,0.00,0.00,0.00,NULL,6),(28,'443250','CAP CERA 104 Z 50V Y5V 1608',160000.00,0.00,0.00,0.00,0.00,NULL,6),(29,'408878','CAP CERA 104 K 50V X7R 1608',160000.00,0.00,0.00,0.00,0.00,NULL,6),(33,'306181','ETIQUETA AUTO ADESIVA 39X11MM',288000.00,0.00,0.00,0.00,0.00,NULL,7),(34,'106049','RES META 103 J 1/10W 1608TSMD',160127.00,0.00,0.00,0.00,0.00,NULL,7),(35,'443250','CAP CERA 104 Z 50V Y5V 1608',160000.00,0.00,0.00,0.00,0.00,NULL,7),(36,'408878','CAP CERA 104 K 50V X7R 1608',160000.00,0.00,0.00,0.00,0.00,NULL,7),(40,'306181','ETIQUETA AUTO ADESIVA 39X11MM',288000.00,0.00,0.00,0.00,0.00,NULL,8),(41,'106049','RES META 103 J 1/10W 1608TSMD',160127.00,0.00,0.00,0.00,0.00,NULL,8),(42,'443250','CAP CERA 104 Z 50V Y5V 1608',160000.00,0.00,0.00,0.00,0.00,NULL,8),(43,'408878','CAP CERA 104 K 50V X7R 1608',160000.00,0.00,0.00,0.00,0.00,NULL,8);
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
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inv_item_xls`
--

LOCK TABLES `inv_item_xls` WRITE;
/*!40000 ALTER TABLE `inv_item_xls` DISABLE KEYS */;
INSERT INTO `inv_item_xls` VALUES (28,'ETIQUETA AUTO ADESIVA 39X11MM','306181','PC','01-13-G-04-021','0100018671',288000.00,5),(29,'ETIQUETA AUTO ADESIVA 39X11MM','306181','PC','01-13-G-04-022','0100018676',288000.00,5),(30,'RES META 103 J 1/10W 1608TSMD','106049','PC','01-12-R-12-004','0100014773',160127.00,5),(31,'CAP CERA 104 Z 50V Y5V 1608','443250','PC','01-12-A-10-023','0100009922',160000.00,5),(32,'CAP CERA 104 K 50V X7R 1608','408878','PC','01-12-A-13-041','0100010135',160000.00,5),(33,'ETIQUETA AUTO ADESIVA 39X11MM','306181','PC','01-13-G-04-021','0100018671',288000.00,6),(34,'ETIQUETA AUTO ADESIVA 39X11MM','306181','PC','01-13-G-04-022','0100018676',288000.00,6),(35,'RES META 103 J 1/10W 1608TSMD','106049','PC','01-12-R-12-004','0100014773',160127.00,6),(36,'CAP CERA 104 Z 50V Y5V 1608','443250','PC','01-12-A-10-023','0100009922',160000.00,6),(37,'CAP CERA 104 K 50V X7R 1608','408878','PC','01-12-A-13-041','0100010135',160000.00,6),(38,'ETIQUETA AUTO ADESIVA 39X11MM','306181','PC','01-13-G-04-021','0100018671',288000.00,7),(39,'ETIQUETA AUTO ADESIVA 39X11MM','306181','PC','01-13-G-04-022','0100018676',288000.00,7),(40,'RES META 103 J 1/10W 1608TSMD','106049','PC','01-12-R-12-004','0100014773',160127.00,7),(41,'CAP CERA 104 Z 50V Y5V 1608','443250','PC','01-12-A-10-023','0100009922',160000.00,7),(42,'CAP CERA 104 K 50V X7R 1608','408878','PC','01-12-A-13-041','0100010135',160000.00,7),(43,'ETIQUETA AUTO ADESIVA 39X11MM','306181','PC','01-13-G-04-021','0100018671',288000.00,8),(44,'ETIQUETA AUTO ADESIVA 39X11MM','306181','PC','01-13-G-04-022','0100018676',288000.00,8),(45,'RES META 103 J 1/10W 1608TSMD','106049','PC','01-12-R-12-004','0100014773',160127.00,8),(46,'CAP CERA 104 Z 50V Y5V 1608','443250','PC','01-12-A-10-023','0100009922',160000.00,8),(47,'CAP CERA 104 K 50V X7R 1608','408878','PC','01-12-A-13-041','0100010135',160000.00,8);
/*!40000 ALTER TABLE `inv_item_xls` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inv_user`
--

DROP TABLE IF EXISTS `inv_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inv_user` (
  `codigo` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(200) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `active` tinyint(4) NOT NULL DEFAULT '1',
  `empr_cnpj` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`codigo`),
  KEY `FK_560fbebcca672ce7717048f264f` (`empr_cnpj`),
  CONSTRAINT `FK_560fbebcca672ce7717048f264f` FOREIGN KEY (`empr_cnpj`) REFERENCES `saa_empresa` (`empr_cnpj`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inv_user`
--

LOCK TABLES `inv_user` WRITE;
/*!40000 ALTER TABLE `inv_user` DISABLE KEYS */;
INSERT INTO `inv_user` VALUES (1,'nelsonsozinho','nelsonsozinho','$2a$10$1k9jkqMR5lzZSdryESD/WOObq/Aq7QYy9PK9rVOWdtiRjZ/B76yvi',1,'12345678901234'),(2,'Sosthenes Torres','torres','$2a$10$rAoVvfveK307SjKl7LSwBu0.0xNiO14gk5gUklhP/Pq5V.q7raK7C',1,'12345678901234');
/*!40000 ALTER TABLE `inv_user` ENABLE KEYS */;
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
INSERT INTO `saa_empresa` VALUES ('12345678901234','7Bit Sistema','claudemirramosferreira@gmail.com','rua 1','999999999');
/*!40000 ALTER TABLE `saa_empresa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `saa_perfil`
--

DROP TABLE IF EXISTS `saa_perfil`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `saa_perfil` (
  `perf_id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(40) NOT NULL,
  PRIMARY KEY (`perf_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `saa_perfil`
--

LOCK TABLES `saa_perfil` WRITE;
/*!40000 ALTER TABLE `saa_perfil` DISABLE KEYS */;
INSERT INTO `saa_perfil` VALUES (1,'Administrador'),(2,'Gerente'),(3,'Operacional');
/*!40000 ALTER TABLE `saa_perfil` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `saa_perfil_rotina`
--

DROP TABLE IF EXISTS `saa_perfil_rotina`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `saa_perfil_rotina` (
  `perf_roti_id` int(11) NOT NULL AUTO_INCREMENT,
  `data` datetime DEFAULT NULL,
  `perf_id` int(11) NOT NULL,
  `roti_id` int(11) NOT NULL,
  PRIMARY KEY (`perf_roti_id`,`perf_id`,`roti_id`),
  KEY `FK_d15a4008e1a3599f5b0883729ba` (`perf_id`),
  KEY `FK_f4453ef58ff0e4116203d780304` (`roti_id`),
  CONSTRAINT `FK_d15a4008e1a3599f5b0883729ba` FOREIGN KEY (`perf_id`) REFERENCES `saa_perfil` (`perf_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_f4453ef58ff0e4116203d780304` FOREIGN KEY (`roti_id`) REFERENCES `saa_rotina` (`roti_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `saa_perfil_rotina`
--

LOCK TABLES `saa_perfil_rotina` WRITE;
/*!40000 ALTER TABLE `saa_perfil_rotina` DISABLE KEYS */;
INSERT INTO `saa_perfil_rotina` VALUES (1,NULL,1,1),(2,NULL,2,4),(3,NULL,2,5),(4,NULL,3,3),(5,NULL,3,2),(6,NULL,2,6);
/*!40000 ALTER TABLE `saa_perfil_rotina` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `saa_rotina`
--

DROP TABLE IF EXISTS `saa_rotina`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `saa_rotina` (
  `roti_id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(40) NOT NULL,
  `path` varchar(40) NOT NULL,
  `icon` varchar(40) NOT NULL,
  PRIMARY KEY (`roti_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `saa_rotina`
--

LOCK TABLES `saa_rotina` WRITE;
/*!40000 ALTER TABLE `saa_rotina` DISABLE KEYS */;
INSERT INTO `saa_rotina` VALUES (1,'Empresa','/list-empresa','store'),(2,'Inventario','/list-inventario','edit'),(3,'Execucao','/execucao','play_circle_outline'),(4,'Item','/item','playlist_add_check'),(5,'Contagem','/contagem','format_list_numbered'),(6,'Usuario','/usuario','person_outline');
/*!40000 ALTER TABLE `saa_rotina` ENABLE KEYS */;
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
    and b.inve_id = a.inve_id
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

-- Dump completed on 2020-06-11 10:35:31
