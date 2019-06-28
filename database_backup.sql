CREATE DATABASE  IF NOT EXISTS `mddb` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `mddb`;
-- MySQL dump 10.13  Distrib 8.0.13, for Win64 (x86_64)
--
-- Host: localhost    Database: mddb
-- ------------------------------------------------------
-- Server version	8.0.13

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `alanlar`
--

DROP TABLE IF EXISTS `alanlar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `alanlar` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `alan` varchar(45) DEFAULT NULL,
  `durum` int(11) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alanlar`
--

LOCK TABLES `alanlar` WRITE;
/*!40000 ALTER TABLE `alanlar` DISABLE KEYS */;
INSERT INTO `alanlar` VALUES (1,'Görüntü İşleme',1),(2,'Makine Öğrenmesi',1),(3,'Gömülü Sistemler',1),(4,'Algoritma',1),(5,'Matematik',1);
/*!40000 ALTER TABLE `alanlar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `editorler`
--

DROP TABLE IF EXISTS `editorler`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `editorler` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ad_soyad` varchar(45) DEFAULT NULL,
  `username` varchar(45) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `durum` int(11) DEFAULT NULL,
  `tarih` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `editorler`
--

LOCK TABLES `editorler` WRITE;
/*!40000 ALTER TABLE `editorler` DISABLE KEYS */;
INSERT INTO `editorler` VALUES (1,'Ediitor1','editor1','123',1,NULL,NULL),(2,'admin','admin','admin',1,NULL,NULL);
/*!40000 ALTER TABLE `editorler` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hakemler`
--

DROP TABLE IF EXISTS `hakemler`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `hakemler` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ad_soyad` varchar(45) DEFAULT NULL,
  `username` varchar(45) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL,
  `alan` int(11) DEFAULT '1',
  `durum` int(11) DEFAULT '1',
  `tarih` datetime DEFAULT CURRENT_TIMESTAMP,
  `puan` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hakemler`
--

LOCK TABLES `hakemler` WRITE;
/*!40000 ALTER TABLE `hakemler` DISABLE KEYS */;
INSERT INTO `hakemler` VALUES (1,'Kemal Akyol','Kemal','123',2,NULL,NULL,2),(2,'Abdulkadir Karacı','Abdulkadir','123',1,1,'2019-04-29 13:57:37',0);
/*!40000 ALTER TABLE `hakemler` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `incelemeler`
--

DROP TABLE IF EXISTS `incelemeler`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `incelemeler` (
  `id` int(10) unsigned NOT NULL,
  `makale_ID` int(11) DEFAULT NULL,
  `aciklama` varchar(500) DEFAULT NULL,
  `rapor` varchar(105) DEFAULT NULL,
  `tarih` datetime DEFAULT CURRENT_TIMESTAMP,
  `durum` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `incelemeler`
--

LOCK TABLES `incelemeler` WRITE;
/*!40000 ALTER TABLE `incelemeler` DISABLE KEYS */;
/*!40000 ALTER TABLE `incelemeler` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `makaleler`
--

DROP TABLE IF EXISTS `makaleler`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `makaleler` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `yazar_ID` int(11) DEFAULT NULL,
  `editor_ID` int(11) DEFAULT NULL,
  `hakem_ID` int(11) DEFAULT NULL,
  `alan` int(11) DEFAULT NULL,
  `baslik` varchar(500) DEFAULT NULL,
  `aciklama` varchar(500) DEFAULT NULL,
  `makale` varchar(105) DEFAULT NULL,
  `sonuc_rapor` varchar(45) DEFAULT NULL,
  `yukleme_tarih` datetime DEFAULT CURRENT_TIMESTAMP,
  `editor_atama_tarih` datetime DEFAULT NULL,
  `hakem_atama_tarih` datetime DEFAULT NULL,
  `hakem_onay_tarih` datetime DEFAULT NULL,
  `sonuc_tarih` datetime DEFAULT NULL,
  `durum_hakem` int(11) DEFAULT '0',
  `durum_sonuc` int(11) DEFAULT '0',
  `durum` int(11) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `makaleler`
--

LOCK TABLES `makaleler` WRITE;
/*!40000 ALTER TABLE `makaleler` DISABLE KEYS */;
INSERT INTO `makaleler` VALUES (1,1,1,1,1,'PatlayÄ±cÄ± etki analizi','PatlayÄ±cÄ±lar.','file:',NULL,'2019-04-20 03:36:30','2019-04-20 00:00:00','2019-04-08 00:00:00','2019-04-25 00:00:00','2019-04-25 03:36:30',1,0,3);
/*!40000 ALTER TABLE `makaleler` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `view_makaleler`
--

DROP TABLE IF EXISTS `view_makaleler`;
/*!50001 DROP VIEW IF EXISTS `view_makaleler`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `view_makaleler` AS SELECT 
 1 AS `id`,
 1 AS `baslik`,
 1 AS `aciklama`,
 1 AS `yazar_ID`,
 1 AS `yazar_ad_soyad`,
 1 AS `editor_ID`,
 1 AS `editor_ad_soyad`,
 1 AS `hakem_ID`,
 1 AS `hakem_ad_soyad`,
 1 AS `makale_aciklama`,
 1 AS `makale`,
 1 AS `sonuc_rapor`,
 1 AS `yukleme_tarih`,
 1 AS `editor_atama_tarih`,
 1 AS `hakem_atama_tarih`,
 1 AS `hakem_onay_tarih`,
 1 AS `sonuc_tarih`,
 1 AS `alan_id`,
 1 AS `alan`,
 1 AS `durum`,
 1 AS `durum_hakem`,
 1 AS `durum_sonuc`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `yazarlar`
--

DROP TABLE IF EXISTS `yazarlar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `yazarlar` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ad_soyad` varchar(45) DEFAULT NULL,
  `username` varchar(45) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL,
  `durum` int(11) DEFAULT '1',
  `tarih` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `yazarlar`
--

LOCK TABLES `yazarlar` WRITE;
/*!40000 ALTER TABLE `yazarlar` DISABLE KEYS */;
INSERT INTO `yazarlar` VALUES (1,'Resul Silay','Resul','123',1,'2019-04-25 03:39:52'),(2,'Mert kara','Mert','123',1,'2019-04-29 13:58:04'),(3,'Emre','Emre','123',1,'2019-04-29 13:58:04');
/*!40000 ALTER TABLE `yazarlar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'mddb'
--

--
-- Dumping routines for database 'mddb'
--
/*!50003 DROP PROCEDURE IF EXISTS `sp_asama_1` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_asama_1`()
BEGIN

	DECLARE counter INT(11);
	DECLARE _ID INT(11);

	SET counter = 0;
	SET _ID = 0;

	WHILE _ID <> null DO
	  SET counter = counter +1;
	  SELECT id INTO _ID FROM makaleler limit counter,1;
	  IF ((SELECT DATEDIFF(CURDATE(),hakem_atama_tarih) FROM makaleler WHERE durum_hakem<>1 and hakem_ID<>0 and id=_ID) >=5) THEN
			UPDATE makaleler SET durum_hakem=0,hakem_ID=0 where id=_ID;
	  END IF;
	 END WHILE;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_asama_2` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_asama_2`()
BEGIN
	SELECT * FROM makaleler WHERE 21 = (SELECT DATEDIFF(CURDATE(),hakem_atama_tarih) as _gun_21 FROM makaleler WHERE durum_hakem=1 and hakem_ID<>0 and durum_sonuc=0);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_asama_3` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_asama_3`()
BEGIN

	DECLARE counter INT(11);
	DECLARE _ID INT(11);
	DECLARE _hakem_ID INT(11);

	SET counter = 0;
	SET _ID = 0;

	WHILE _ID <> null DO
	  SET counter = counter +1;
	  SELECT id,hakem_ID INTO _ID,_hakem_ID FROM makaleler limit counter,1;
	  IF ((SELECT DATEDIFF(CURDATE(),hakem_atama_tarih) FROM makaleler WHERE durum_hakem=1 and hakem_ID<>0 and durum_sonuc=0 and id=_ID) >=21) THEN
			UPDATE makaleler SET durum_hakem=0,hakem_ID=0 where id=_ID;
            #hakem puanı azaltiliyor.
            call mddb.sp_hakem_puan_azalt(_hakem_ID);
            
	  END IF;
	 END WHILE;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_hakem_puan_artir` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_hakem_puan_artir`(IN _id INT(11))
BEGIN
	DECLARE _puan INT(11);
	SET _puan = 0;
    SELECT puan INTO _puan FROM hakemler WHERE id=_id;
    SET _puan= _puan + 1;
	UPDATE hakemler SET puan=_puan WHERE id=_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_hakem_puan_azalt` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_hakem_puan_azalt`(IN _id INT(11))
BEGIN
	DECLARE _puan INT(11);
	SET _puan = 0;
    SELECT puan INTO _puan FROM hakemler WHERE id=_id;
    SET _puan= _puan - 1;
	UPDATE hakemler SET puan=_puan WHERE id=_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `view_makaleler`
--

/*!50001 DROP VIEW IF EXISTS `view_makaleler`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_makaleler` AS select `m`.`id` AS `id`,`m`.`baslik` AS `baslik`,`m`.`aciklama` AS `aciklama`,`m`.`yazar_ID` AS `yazar_ID`,`y`.`ad_soyad` AS `yazar_ad_soyad`,`m`.`editor_ID` AS `editor_ID`,`e`.`ad_soyad` AS `editor_ad_soyad`,`m`.`hakem_ID` AS `hakem_ID`,`h`.`ad_soyad` AS `hakem_ad_soyad`,`m`.`aciklama` AS `makale_aciklama`,`m`.`makale` AS `makale`,`m`.`sonuc_rapor` AS `sonuc_rapor`,`m`.`yukleme_tarih` AS `yukleme_tarih`,`m`.`editor_atama_tarih` AS `editor_atama_tarih`,`m`.`hakem_atama_tarih` AS `hakem_atama_tarih`,`m`.`hakem_onay_tarih` AS `hakem_onay_tarih`,`m`.`sonuc_tarih` AS `sonuc_tarih`,`a`.`id` AS `alan_id`,`a`.`alan` AS `alan`,`m`.`durum` AS `durum`,`m`.`durum_hakem` AS `durum_hakem`,`m`.`durum_sonuc` AS `durum_sonuc` from ((((`makaleler` `m` left join `editorler` `e` on((`m`.`editor_ID` = `e`.`id`))) left join `hakemler` `h` on((`m`.`hakem_ID` = `h`.`id`))) left join `yazarlar` `y` on((`m`.`yazar_ID` = `y`.`id`))) left join `alanlar` `a` on((`m`.`alan` = `a`.`id`))) */;
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

-- Dump completed on 2019-04-29 14:12:28
