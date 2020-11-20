-- MySQL dump 10.13  Distrib 8.0.20, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: nhatro-final
-- ------------------------------------------------------
-- Server version	8.0.20

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
-- Table structure for table `category_rooms`
--

DROP TABLE IF EXISTS `category_rooms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category_rooms` (
  `id_category_room` int NOT NULL AUTO_INCREMENT,
  `category` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_category_room`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category_rooms`
--

LOCK TABLES `category_rooms` WRITE;
/*!40000 ALTER TABLE `category_rooms` DISABLE KEYS */;
INSERT INTO `category_rooms` VALUES (1,'Thuê Nguyên Phòng'),(2,'Ở Ghép'),(3,'Thuê Nhà Nguyên Căn'),(4,'Ở Chung Với Chủ');
/*!40000 ALTER TABLE `category_rooms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `districts`
--

DROP TABLE IF EXISTS `districts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `districts` (
  `id_district` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `prefix` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `province_id` int unsigned NOT NULL,
  PRIMARY KEY (`id_district`,`province_id`),
  KEY `fk_district_province_idx` (`province_id`),
  CONSTRAINT `fk_district_province` FOREIGN KEY (`province_id`) REFERENCES `provinces` (`id_province`)
) ENGINE=InnoDB AUTO_INCREMENT=710 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `districts`
--

LOCK TABLES `districts` WRITE;
/*!40000 ALTER TABLE `districts` DISABLE KEYS */;
INSERT INTO `districts` VALUES (1,'Bình Chánh','Huyện',1),(2,'Bình Tân','Quận',1),(3,'Bình Thạnh','Quận',1),(4,'Cần Giờ','Huyện',1),(5,'Củ Chi','Huyện',1),(6,'Gò Vấp','Quận',1),(7,'Hóc Môn','Huyện',1),(8,'Nhà Bè','Huyện',1),(9,'Phú Nhuận','Quận',1),(10,'Quận 1','',1),(11,'Quận 10','',1),(12,'Quận 11','',1),(13,'Quận 12','',1),(14,'Quận 2','',1),(15,'Quận 3','',1),(16,'Quận 4','',1),(17,'Quận 5','',1),(18,'Quận 6','',1),(19,'Quận 7','',1),(20,'Quận 8','',1),(21,'Quận 9','',1),(22,'Tân Bình','Quận',1),(23,'Tân Phú','Quận',1),(24,'Thủ Đức','Quận',1);
/*!40000 ALTER TABLE `districts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `images`
--

DROP TABLE IF EXISTS `images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `images` (
  `id_image` int NOT NULL AUTO_INCREMENT,
  `image_uuid` varchar(40) DEFAULT NULL,
  `data` longblob,
  `file_name` varchar(100) DEFAULT NULL,
  `file_type` varchar(100) DEFAULT NULL,
  `room_id` int NOT NULL,
  PRIMARY KEY (`id_image`,`room_id`),
  UNIQUE KEY `image_uuid_UNIQUE` (`image_uuid`),
  KEY `fk_image_room1_idx` (`room_id`),
  CONSTRAINT `fk_image_room1` FOREIGN KEY (`room_id`) REFERENCES `rooms` (`id_room`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `images`
--

LOCK TABLES `images` WRITE;
/*!40000 ALTER TABLE `images` DISABLE KEYS */;
/*!40000 ALTER TABLE `images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `interface_streets`
--

DROP TABLE IF EXISTS `interface_streets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `interface_streets` (
  `id_interface_street` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `prefix` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_interface_street`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `interface_streets`
--

LOCK TABLES `interface_streets` WRITE;
/*!40000 ALTER TABLE `interface_streets` DISABLE KEYS */;
/*!40000 ALTER TABLE `interface_streets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post_saved`
--

DROP TABLE IF EXISTS `post_saved`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `post_saved` (
  `rooms_id_room` int NOT NULL,
  `users_id_user` int NOT NULL,
  PRIMARY KEY (`rooms_id_room`,`users_id_user`),
  KEY `fk_rooms_has_users_users1_idx` (`users_id_user`),
  KEY `fk_rooms_has_users_rooms1_idx` (`rooms_id_room`),
  CONSTRAINT `fk_rooms_has_users_rooms1` FOREIGN KEY (`rooms_id_room`) REFERENCES `rooms` (`id_room`),
  CONSTRAINT `fk_rooms_has_users_users1` FOREIGN KEY (`users_id_user`) REFERENCES `users` (`id_user`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post_saved`
--

LOCK TABLES `post_saved` WRITE;
/*!40000 ALTER TABLE `post_saved` DISABLE KEYS */;
/*!40000 ALTER TABLE `post_saved` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `provinces`
--

DROP TABLE IF EXISTS `provinces`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `provinces` (
  `id_province` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id_province`)
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `provinces`
--

LOCK TABLES `provinces` WRITE;
/*!40000 ALTER TABLE `provinces` DISABLE KEYS */;
INSERT INTO `provinces` VALUES (1,'Hồ Chí Minh');
/*!40000 ALTER TABLE `provinces` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `id_role` int NOT NULL,
  `role` varchar(45) NOT NULL,
  PRIMARY KEY (`id_role`),
  UNIQUE KEY `role_UNIQUE` (`role`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'ROLE_ADMIN'),(2,'ROLE_USER');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles_has_users`
--

DROP TABLE IF EXISTS `roles_has_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles_has_users` (
  `roles_id_role` int NOT NULL,
  `users_id_user` int NOT NULL,
  PRIMARY KEY (`roles_id_role`,`users_id_user`),
  KEY `fk_roles_has_users_users1_idx` (`users_id_user`),
  KEY `fk_roles_has_users_roles1_idx` (`roles_id_role`),
  CONSTRAINT `fk_roles_has_users_roles1` FOREIGN KEY (`roles_id_role`) REFERENCES `roles` (`id_role`),
  CONSTRAINT `fk_roles_has_users_users1` FOREIGN KEY (`users_id_user`) REFERENCES `users` (`id_user`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles_has_users`
--

LOCK TABLES `roles_has_users` WRITE;
/*!40000 ALTER TABLE `roles_has_users` DISABLE KEYS */;
INSERT INTO `roles_has_users` VALUES (2,14),(2,15),(2,16),(2,17);
/*!40000 ALTER TABLE `roles_has_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rooms`
--

DROP TABLE IF EXISTS `rooms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rooms` (
  `id_room` int NOT NULL,
  `acreage` float DEFAULT NULL,
  `price_room` float DEFAULT NULL,
  `price_electric` float DEFAULT NULL,
  `price_water` float DEFAULT NULL,
  `title` varchar(100) DEFAULT NULL,
  `description` varchar(500) DEFAULT NULL,
  `wc` tinyint DEFAULT NULL,
  `wifi` tinyint DEFAULT NULL,
  `parking` tinyint DEFAULT NULL,
  `status_id` int NOT NULL,
  `category_room_id` int NOT NULL,
  `streets_id` int unsigned NOT NULL,
  `users_id` int NOT NULL,
  `street_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id_room`,`status_id`,`category_room_id`,`streets_id`,`users_id`),
  KEY `fk_room_status1_idx` (`status_id`),
  KEY `fk_room_category_room1_idx` (`category_room_id`),
  KEY `fk_rooms_streets1_idx` (`streets_id`),
  KEY `fk_rooms_users1_idx` (`users_id`),
  CONSTRAINT `fk_room_category_room1` FOREIGN KEY (`category_room_id`) REFERENCES `category_rooms` (`id_category_room`),
  CONSTRAINT `fk_room_status1` FOREIGN KEY (`status_id`) REFERENCES `status` (`id_status`),
  CONSTRAINT `fk_rooms_streets1` FOREIGN KEY (`streets_id`) REFERENCES `streets` (`id_street`),
  CONSTRAINT `fk_rooms_users1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id_user`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rooms`
--

LOCK TABLES `rooms` WRITE;
/*!40000 ALTER TABLE `rooms` DISABLE KEYS */;
/*!40000 ALTER TABLE `rooms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `status`
--

DROP TABLE IF EXISTS `status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `status` (
  `id_status` int NOT NULL,
  `status` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `status`
--

LOCK TABLES `status` WRITE;
/*!40000 ALTER TABLE `status` DISABLE KEYS */;
INSERT INTO `status` VALUES (1,'Chờ Phê Duyệt'),(2,'Còn Phòng'),(3,'Tin hết hạn');
/*!40000 ALTER TABLE `status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `streets`
--

DROP TABLE IF EXISTS `streets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `streets` (
  `id_street` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `prefix` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id_street`)
) ENGINE=InnoDB AUTO_INCREMENT=31645 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `streets`
--

LOCK TABLES `streets` WRITE;
/*!40000 ALTER TABLE `streets` DISABLE KEYS */;
INSERT INTO `streets` VALUES (1,'1','Đường'),(2,'10','Đường'),(3,'10A','Đường'),(4,'10B','Đường'),(5,'11','Đường'),(6,'11D','Đường'),(7,'11E','Đường'),(8,'12','Đường'),(9,'1-2','Đường'),(10,'13','Đường'),(11,'13B','Đường'),(12,'14','Đường'),(13,'15','Đường'),(14,'16','Đường'),(15,'17','Đường'),(16,'18','Đường'),(17,'18A','Đường'),(18,'18B','Đường'),(19,'18D','Đường'),(20,'19','Đường'),(21,'1A','Đường'),(22,'1B','Đường'),(23,'1C','Đường'),(24,'1D','Đường'),(25,'1E','Đường'),(26,'1F','Đường'),(27,'2','Đường'),(28,'20','Đường'),(29,'206','Đường'),(30,'21','Đường'),(31,'22','Đường'),(32,'234','Đường'),(33,'24','Phố'),(34,'24A','Đường'),(35,'26','Đường'),(36,'27','Đường'),(37,'284','Đường'),(38,'29','Đường'),(39,'2A','Đường'),(40,'2B','Đường'),(41,'2C','Đường'),(42,'2F','Đường'),(43,'2G','Đường'),(44,'3','Đường'),(45,'33','Đường'),(46,'378','Đường'),(47,'3A','Đường'),(48,'3B','Đường'),(49,'4','Đường'),(50,'47','Đường'),(51,'4A','Đường'),(52,'4B','Đường'),(53,'4C','Đường'),(54,'4E','Đường'),(55,'5','Đường'),(56,'50','Đường'),(57,'51','Đường'),(58,'52','Phố'),(59,'53','Đường'),(60,'5A','Đường'),(61,'5B','Đường'),(62,'5C','Đường'),(63,'5D','Đường'),(64,'6','Đường'),(65,'6 Thước','Đường'),(66,'6A','Đường'),(67,'6B','Đường'),(68,'6C','Đường'),(69,'6D','Đường'),(70,'6F','Đường'),(71,'6T','Đường'),(72,'7','Đường'),(73,'7 Cá 8 Luông','Đường'),(74,'7 Tấn','Đường'),(75,'7A','Đường'),(76,'7D','Đường'),(77,'8','Đường'),(78,'826','Đường'),(79,'835','Đường'),(80,'835A','Đường'),(81,'835B','Đường'),(82,'835C','Đường'),(83,'8A','Đường'),(84,'8B','Đường'),(85,'8C','Đường'),(86,'9','Đường'),(87,'9A','Đường'),(88,'A1','Đường'),(89,'A10','Đường'),(90,'A2','Đường'),(91,'A3','Đường'),(92,'A6','Đường'),(93,'An Hạ','Đường'),(94,'An Phú Đông 27','Đường'),(95,'An Phú Tây','Đường'),(96,'Ấp 1','Đường'),(97,'Ấp 1A','Đường'),(98,'Ấp 1B','Đường'),(99,'Ấp 2','Đường'),(100,'Ấp 4','Đường'),(101,'Ấp 4B','Đường'),(102,'Ấp 6','Đường'),(103,'Ấp 7A','Đường'),(104,'B10','Đường'),(105,'B2','Đường'),(106,'B5','Đường'),(107,'B6','Đường'),(108,'Ba Be','Đường'),(109,'Ba Bê','Đường'),(110,'Bà Cả','Đường'),(111,'Ba Chả','Đường'),(112,'Bà Điểm','Đường'),(113,'Bà Hào','Đường'),(114,'Bà Hom','Đường'),(115,'Ba Làng','Đường'),(116,'Ba Si Đông','Đường'),(117,'Bà Thau','Đường'),(118,'Bà Tỵ','Đường'),(119,'Bầu Gốc','Đường'),(120,'Bàu Hà','Đường'),(121,'Bến Lội','Đường'),(122,'Bình Chánh','Đường'),(123,'Bình Hưng','Đường'),(124,'Bình Thành','Đường'),(125,'Bình Tiên','Đường'),(126,'Bình Trường','Đường'),(127,'Bờ Bao Xóm Hố','Đường'),(128,'Bờ Chùa','Đường'),(129,'Bờ Đá','Đường'),(130,'Bờ Đất Mới','Đường'),(131,'Bờ Dế','Đường'),(132,'Bộ Đội An Điền','Đường'),(133,'Bờ Huệ','Đường'),(134,'Bờ Kênh','Đường'),(135,'Bờ Kênh T14','Đường'),(136,'Bờ Kinh','Đường'),(137,'Bờ Kinh 14','Đường'),(138,'Bờ Nhà Thờ','Đường'),(139,'Bờ Tây','Đường'),(140,'Bờ Xe Lam','Đường'),(141,'Bông Văn Dĩa','Đường'),(142,'Bùi Thanh Khiết','Đường'),(143,'Bùi Văn Ngọ','Đường'),(144,'Bùi Văn Sự','Đường'),(145,'C1','Đường'),(146,'C11','Đường'),(147,'C12','Đường'),(148,'C2','Đường'),(149,'C3','Đường'),(150,'C4','Đường'),(151,'C5','Đường'),(152,'C6','Đường'),(153,'C7','Đường'),(154,'C7C','Đường'),(155,'C8','Đường'),(156,'C9','Đường'),(157,'Cả Cường','Đường'),(158,'Cái Trung','Đường'),(159,'Cao Lỗ','Đường'),(160,'Cầu Đôi','Đường'),(161,'Cầu Suối','Đường'),(162,'Cầu Xây','Đường'),(163,'Cây Bàn','Đường'),(164,'Cây Bàng','Đường'),(165,'Cây Cám','Đường'),(166,'Cây Cọ','Đường'),(167,'Cây Dương','Đường'),(168,'Chánh Hưng','Đường'),(169,'Chiến Lược','Đường'),(170,'Chú Lường','Đường'),(171,'Chùa','Đường'),(172,'Công Nghệ Mới','Đường'),(173,'D1','Đường'),(174,'D15','Đường'),(175,'D17','Đường'),(176,'D2','Đường'),(177,'D22','Đường'),(178,'D3','Đường'),(179,'D4','Đường'),(180,'D5','Đường'),(181,'D6','Đường'),(182,'D9','Đường'),(183,'Đa Phước','Đường'),(184,'Dân Công Hỏa Tuyến','Đường'),(185,'Đất Mới','Đường'),(186,'Đê Bao','Đường'),(187,'Đê số 2','Đường'),(188,'Đinh Đức Thiện','Đường'),(189,'Đình Phú Lạc','Đường'),(190,'Đình Thần','Đường'),(191,'Đoàn Nguyễn Tuân','Đường'),(192,'Đoàn Nguyễn Tuấn','Đường'),(193,'Đông Dương','Đường'),(194,'Đông Hưng Thuận 6','Đường'),(195,'ĐT 10','Đường'),(196,'ĐT 14','Đường'),(197,'ĐT 824','Đường'),(198,'ĐT 826','Đường'),(199,'ĐT 833','Đường'),(200,'ĐT 835','Đường'),(201,'ĐT 835B','Đường'),(202,'ĐT 835C','Đường'),(203,'Dương Công','Đường'),(204,'Dương Công Khi','Đường'),(205,'Đường Đất','Đường'),(206,'Dương Đình Cúc','Đường'),(207,'E12','Đường'),(208,'E14','Đường'),(209,'E5','Đường'),(210,'F11','Đường'),(211,'G6','Đường'),(212,'G7','Đường'),(213,'Giao thông hào','Đường'),(214,'Hà Duy Phiên','Đường'),(215,'Hà Thanh','Đường'),(216,'Hàng Cọ','Đường'),(217,'Hàng Cọ 9A','Đường'),(218,'Hậu Lân','Đường'),(219,'Hiệp Thành 13','Đường'),(220,'Hiệp Thành 7','Đường'),(221,'Hồ Văn Long','Đường'),(222,'Hoàng Đạo Thúy','Phố'),(223,'Hoàng Phan Thái','Đường'),(224,'Hóc Hưu','Đường'),(225,'Hóc Hữu','Đường'),(226,'Hưng Long','Đường'),(227,'Hưng Nhơn','Đường'),(228,'Hưng Phát','Đường'),(229,'Hùng Vương','Đường'),(230,'Hương lộ  80','Đường'),(231,'Hương lộ 10','Đường'),(232,'Hương Lộ 11','Đường'),(233,'Hương Lộ 12','Đường'),(234,'Hương lộ 14','Đường'),(235,'Hương lộ 2','Đường'),(236,'Hương lộ 20','Đường'),(237,'Hương Lộ 6','Đường'),(238,'Hương Lộ 80B','Đường'),(239,'Huỳnh Bá Chánh','Đường'),(240,'Huỳnh Hữu Trí','Đường'),(241,'Huỳnh Thanh Tuấn','Đường'),(242,'Huỳnh Văn Trí','Đường'),(243,'Kênh','Đường'),(244,'Kênh 10','Đường'),(245,'Kênh 11','Đường'),(246,'Kênh 12','Đường'),(247,'Kênh 2','Đường'),(248,'Kênh 5','Đường'),(249,'Kênh 6','Đường'),(250,'Kênh 7','Đường'),(251,'Kênh 8','Đường'),(252,'Kênh 9','Đường'),(253,'Kênh A','Đường'),(254,'Kênh An Hạ','Đường'),(255,'Kênh B','Đường'),(256,'Kênh C','Đường'),(257,'Kênh C6','Đường'),(258,'Kênh Độc Lập','Đường'),(259,'Kênh Liên Vùng','Đường'),(260,'Kênh Ranh','Đường'),(261,'Kênh Sáu Oánh','Đường'),(262,'Kênh T12','Đường'),(263,'Kênh T3','Đường'),(264,'Kênh T5','Đường'),(265,'Kênh Trung Ương','Đường'),(266,'Khuất Văn Bức','Đường'),(267,'Kinh 11','Đường'),(268,'Kinh 4','Đường'),(269,'Kinh 6','Đường'),(270,'Kinh A','Đường'),(271,'Kinh B12','Đường'),(272,'Kinh C','Đường'),(273,'Kinh Rau Răm','Đường'),(274,'Kinh T11','Đường'),(275,'Kinh Trung Ương','Đường'),(276,'Lại Hùng Cường','Đường'),(277,'Láng Le Bàu Cò','Đường'),(278,'Lê Chân','Đường'),(279,'Lê Chính Đang','Đường'),(280,'Lê Đình Chi','Đường'),(281,'Lê Minh Xuân','Đường'),(282,'Lê Quý Hoàn','Đường'),(283,'Lê Thị Dung','Đường'),(284,'Liên Ấp','Đường'),(285,'Liên ấp 1','Đường'),(286,'Liên ấp 1-2','Đường'),(287,'Liên Ấp 12','Đường'),(288,'Liên ấp 123','Đường'),(289,'Liên Ấp 1234','Đường'),(290,'Liên ấp 123A','Đường'),(291,'Liên ấp 1-3','Đường'),(292,'Liên Ấp 1A','Đường'),(293,'Liên ấp 2','Đường'),(294,'Liên ấp 2-3','Đường'),(295,'Liên ấp 234','Đường'),(296,'Liên Ấp 2-3-4','Đường'),(297,'Liên ấp 2-6','Đường'),(298,'Liên Ấp 3-4','Đường'),(299,'Liên ấp 3-4-5','Đường'),(300,'Liên Ấp 4 - 6','Đường'),(301,'Liên ấp 4-5','Đường'),(302,'Liên ấp 5','Đường'),(303,'Liên ấp 5-6','Đường'),(304,'Liên Ấp 6','Đường'),(305,'Liên ấp 6-2','Đường'),(306,'Liên Khu 123','Đường'),(307,'Liên Khu 2-6','Đường'),(308,'Liên khu 4-5','Đường'),(309,'Liên Khu 5 - 6','Đường'),(310,'Liên thôn 1-2-3','Đường'),(311,'Liên Xã','Đường'),(312,'Linh Hòa','Đường'),(313,'Linh Hòa Tự','Đường'),(314,'Lô 2','Đường'),(315,'Lộc Hòa','Đường'),(344,'Nguyễn Tri Phương','Đường'),(347,'Nguyễn Văn Cừ','Đường'),(446,'Song Hành','Đường'),(553,'111','Đường'),(554,'11A','Đường'),(556,'12A','Đường'),(558,'13A','Đường'),(560,'13C','Đường'),(562,'144','Đường'),(563,'14A','Đường'),(564,'14B','Đường'),(565,'14E','Đường'),(567,'15A','Đường'),(569,'16A','Đường'),(570,'16B','Đường'),(572,'173','Đường'),(573,'17A','Đường'),(574,'17B','Đường'),(575,'17C','Đường'),(579,'18C','Đường'),(581,'18E','Đường'),(583,'19/5','Đường'),(584,'19A','Đường'),(585,'19B','Đường'),(586,'19C','Đường'),(587,'19D','Đường'),(588,'19E','Đường'),(596,'21A','Đường'),(597,'21B','Đường'),(598,'21C','Đường'),(599,'21D','Đường'),(600,'21E','Đường'),(602,'221','Đường'),(603,'22A','Đường'),(604,'23','Đường'),(605,'23A','Đường'),(606,'23B','Đường'),(609,'24B','Đường'),(610,'25','Đường'),(611,'25A','Đường'),(613,'26/3','Đường'),(614,'26/5','Đường'),(616,'27/3','Đường'),(617,'27C','Đường'),(618,'28','Đường'),(619,'28A','Đường'),(624,'2D','Đường'),(625,'2E','Đường'),(629,'30','Đường'),(630,'31','Đường'),(631,'31A','Đường'),(632,'32','Đường'),(633,'32A','Đường'),(634,'32B','Đường'),(636,'33A','Đường'),(637,'33B','Đường'),(638,'34','Đường'),(639,'34A','Đường'),(640,'34B','Đường'),(641,'36','Phố'),(642,'38','Đường'),(643,'38A','Đường'),(644,'39','Đường'),(647,'3C','Đường'),(648,'3D','Đường'),(798,'Hòa Bình','Đường'),(1099,'12AB','Đường'),(1101,'135','Đường'),(1105,'179','Đường'),(1109,'233','Đường'),(1113,'30/4','Đường'),(1114,'304','Đường'),(1115,'37','Phố'),(1122,'82','Đường'),(1123,'An Thượng 6','Đường'),(1124,'Bạch Đằng','Đường'),(1125,'Bình Hòa','Đường'),(1126,'Bình Lãnh','Đường'),(1127,'Bình Lợi','Đường'),(1128,'Bình Quới','Đường'),(1129,'Bùi Đình Túy','Đường'),(1130,'Bùi Hữu Nghĩa','Đường'),(1131,'Cách Mạng Tháng Tám','Đường'),(1132,'Cầu Ván','Đường'),(1133,'Chu Mạnh Trinh','Đường'),(1134,'Chu Văn An','Đường'),(1135,'Công Trường Hoà Bình','Đường'),(1136,'Công Trường Tự Do','Đường'),(1137,'Cửu Long','Đường'),(1142,'D8','Đường'),(1143,'Điện Biên Phủ','Đường'),(1144,'Diên Hồng','Đường'),(1145,'Đinh Bộ Lĩnh','Đường'),(1146,'Đình Đông','Đường'),(1147,'Đinh Tiên Hoàng','Đường'),(1148,'Đống Đa','Đường'),(1149,'Đống Đa 1','Đường'),(1150,'Dương Vũ Tùng','Đường'),(1151,'Hàng Xanh','Đường'),(1152,'Hẻm Dầu','Đường'),(1153,'Hồ Xuân Hương','Đường'),(1154,'Hoàng Hoa Thám','Đường'),(1155,'Hoàng Văn Thụ','Đường'),(1156,'Hồng Bàng','Đường'),(1157,'Huỳnh Đình Hai','Đường'),(1158,'Huỳnh Mẫn Đạt','Đường'),(1159,'Huỳnh Tịnh Của','Đường'),(1160,'Lam Sơn','Đường'),(1161,'Lê Quang Định','Đường'),(1162,'Lê Trực','Đường'),(1163,'Lê Văn Sỹ','Đường'),(1164,'Long Vân Tự','Đường'),(1165,'Lương Ngọc Quyến','Đường'),(1166,'Lương Sử C','Phố'),(1167,'Mai Xuân Thưởng','Đường'),(1168,'Mê Linh','Đường'),(1169,'Miếu Nổi','Đường'),(1170,'N4','Đường'),(1171,'Ngô Đức Kế','Đường'),(1172,'Ngô Nhân Tịnh','Đường'),(1173,'Ngô Tất Tố','Đường'),(1174,'Nguyễn An Ninh','Đường'),(1175,'Nguyễn Bỉnh Khiêm','Đường'),(1176,'Nguyễn Công Hoan','Đường'),(1177,'Nguyễn Công Trứ','Đường'),(1178,'Nguyễn Cư Trinh','Đường'),(1179,'Nguyễn Cửu Vân','Đường'),(1180,'Nguyễn Duy','Đường'),(1181,'Nguyễn Hành','Đường'),(1182,'Nguyên Hồng','Đường'),(1183,'Nguyễn Hữu Cảnh','Đường'),(1184,'Nguyễn Hữu Cầu','Đường'),(1185,'Nguyễn Hữu Thoại','Đường'),(1186,'Nguyễn Huy Lượng','Đường'),(1187,'Nguyễn Huy Tưởng','Đường'),(1188,'Nguyễn Khuyến','Đường'),(1189,'Nguyễn Lâm','Đường'),(1190,'Nguyễn Ngọc Phương','Đường'),(1191,'Nguyễn Thái Học','Đường'),(1192,'Nguyễn Thị Minh Khai','Đường'),(1193,'Nguyễn Thiện Thuật','Phố'),(1194,'Nguyễn Thượng Hiền','Đường'),(1195,'Nguyễn Trung Trực','Đường'),(1196,'Nguyễn Văn Đậu','Đường'),(1266,'23/10','Đường'),(1269,'An Hòa','Đường'),(1271,'An Thới Đông','Đường'),(1272,'Bà Xán','Đường'),(1273,'Bình Khánh','Đường'),(1274,'Bình Trung','Đường'),(1275,'Bùi Lâm','Đường'),(1276,'Cần Thạnh','Đường'),(1277,'Cửu Việt 2','Đường'),(1278,'Đặng Văn Kiều','Đường'),(1279,'Đào Cử','Đường'),(1280,'Đê Gốc Tre','Đường'),(1282,'Dương Vạn Hạnh','Đường'),(1283,'Duyên Hải','Đường'),(1284,'EC','Đường'),(1285,'Giống Ao','Đường'),(1286,'Gốc Tre','Đường'),(1287,'Hà Quang Vóc','Đường'),(1290,'Khiêu Năng Tĩnh','Đường'),(1291,'Khiếu Năng Tĩnh','Đường'),(1292,'Lê Công Miễn','Đường'),(1293,'Lê Hùng Yên','Đường'),(1294,'Lê Thương','Đường'),(1295,'Lê Trọng Mân','Đường'),(1334,'101','Đường'),(1335,'103','Đường'),(1336,'107','Đường'),(1337,'108','Đường'),(1339,'110','Đường'),(1341,'112','Đường'),(1342,'114','Đường'),(1343,'115','Đường'),(1344,'116','Đường'),(1345,'117','Đường'),(1346,'118','Đường'),(1347,'119','Đường'),(1349,'122','Đường'),(1350,'123','Đường'),(1351,'129','Đường'),(1873,'Lý Thường Kiệt','Phố'),(2011,'14F','Đường'),(2014,'19/1','Đường'),(2017,'2/9','Đường'),(2020,'23/9','Đường'),(2815,'126','Đường'),(2818,'15B','Đường'),(2825,'217','Đường'),(2827,'247','Đường'),(2829,'274','Đường'),(2830,'275','Đường'),(2831,'300','Đường'),(2887,'Nguyễn Hữu Thọ','Đường'),(2933,'Bùi Văn Thêm','Đường'),(2934,'Cầm Bá Thước','Đường'),(2935,'Cao Thắng','Đường'),(2936,'Chiến Thắng','Đường'),(2937,'Cô Bắc','Đường'),(2938,'Cô Giang','Đường'),(2939,'Cù Lao','Đường'),(2940,'Cư xá Nguyễn Văn Trỗi','Đường'),(2941,'Đặng Thai Mai','Đường'),(2942,'Đặng Văn Ngữ','Đường'),(2943,'Đặng Văn Sâm','Đường'),(2944,'Đào Duy Anh','Đường'),(2945,'Đào Duy Từ','Đường'),(2985,'Nguyễn Đình Chiểu','Đường'),(2995,'Nguyễn Trọng Tuyển','Đường'),(3008,'Phổ Quang','Đường'),(3036,'Alexandre','Đường'),(3037,'Bà Huyện Thanh Quan','Phố'),(3038,'Bà Lê Chân','Đường'),(3039,'Bến Chương Dương','Đường'),(3040,'Bùi Thị Xuân','Đường'),(3041,'Bùi Viện','Đường'),(3043,'Calmette','Đường'),(3044,'Camex','Đường'),(3045,'Cao Bá Nhạ','Đường'),(3046,'Cao Bá Quát','Đường'),(3047,'Cây Điệp','Đường'),(3062,'10','1143'),(3201,'3/2','Đường'),(3203,'506','Đường'),(3204,'68','Đường'),(3207,'Âu Dương Lân','Đường'),(3208,'Ba Đình','Đường'),(3209,'Bà Hạt','Đường'),(3210,'Ba Vì','Đường'),(3211,'Bắc Hải','Đường'),(3212,'Bạch Mã','Đường'),(3213,'Bàn Cờ','Đường'),(3214,'Bến Bình Đông','Đường'),(3215,'Bến Nguyễn Duy','Đường'),(3216,'Bình Thới','Đường'),(3217,'Bùi Huy Bích','Đường'),(3218,'Bửu Long','Đường'),(3233,'11','1143'),(3328,'100','Đường'),(3332,'281','Đường'),(3333,'299','Đường'),(3338,'3A Cư Xá Bình Thới','Đường'),(3471,'25B','Đường'),(4018,'104','Đường'),(4019,'104A','Đường'),(4021,'10E','Đường'),(4022,'10F','Đường'),(4023,'10G','Đường'),(4463,'Bờ Bắc Kênh Nhiêu Lộc','Đường'),(4464,'Bờ Nam Kênh Nhiêu Lộc','Đường'),(4467,'Cống Hộp','Đường'),(4468,'CT. Chiến sỹ','Đường'),(4473,'15','1143'),(4550,'10C','Đường'),(4554,'12B','Đường'),(4555,'12C','Đường'),(4598,'16','1143'),(4676,'An Bình','Đường'),(4677,'An Điềm','Đường'),(4678,'An Dương Vương','Đường'),(4679,'Bà Triệu','Phố'),(4680,'Bạch Vân','Đường'),(4681,'Bãi Sậy','Đường'),(4683,'Cao Đạt','Đường'),(4684,'Châu Văn Liêm','Đường'),(4685,'Chiêu Anh Các','Đường'),(4686,'Công Trường An Đông','Đường'),(4687,'Đặng Thái Thân','Phố'),(4688,'Đào Tấn','Đường'),(4689,'Đỗ Ngọc Thạnh','Đường'),(5001,'11N','Đường'),(5009,'15N','Đường'),(5324,'1011','Đường'),(5325,'102','Đường'),(5327,'1107','Đường'),(5331,'130','Đường'),(5333,'141','Đường'),(5608,'100A','Đường'),(5610,'1021','Đường'),(5611,'1022','Đường'),(5612,'1025','Đường'),(5615,'106','Đường'),(5617,'1088','Đường'),(5997,'Man Thiện','Đường'),(6210,'11B','Đường'),(6211,'124','Đường'),(6212,'149/33','Đường'),(6219,'45','Phố'),(6220,'49','Phố'),(6528,'19/5B','Đường'),(6530,'26-3','Đường'),(6627,'23','1143'),(6913,'163','Đường'),(6916,'182','Đường'),(7213,'Võ Văn Ngân','Đường');
/*!40000 ALTER TABLE `streets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `streets_has_districts`
--

DROP TABLE IF EXISTS `streets_has_districts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `streets_has_districts` (
  `districts_id_district` int unsigned NOT NULL,
  `streets_id_street` int unsigned NOT NULL,
  PRIMARY KEY (`districts_id_district`,`streets_id_street`),
  KEY `fk_streets_has_districts_districts1_idx` (`districts_id_district`),
  KEY `fk_streets_has_districts_streets1_idx` (`streets_id_street`),
  CONSTRAINT `fk_streets_has_districts_districts1` FOREIGN KEY (`districts_id_district`) REFERENCES `districts` (`id_district`),
  CONSTRAINT `fk_streets_has_districts_streets1` FOREIGN KEY (`streets_id_street`) REFERENCES `streets` (`id_street`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `streets_has_districts`
--

LOCK TABLES `streets_has_districts` WRITE;
/*!40000 ALTER TABLE `streets_has_districts` DISABLE KEYS */;
INSERT INTO `streets_has_districts` VALUES (1,1),(1,2),(1,3),(1,4),(1,5),(1,6),(1,7),(1,8),(1,10),(1,11),(1,12),(1,13),(1,14),(1,15),(1,16),(1,17),(1,18),(1,19),(1,20),(1,21),(1,22),(1,23),(1,24),(1,25),(1,26),(1,27),(1,28),(1,29),(1,30),(1,31),(1,32),(1,33),(1,34),(1,35),(1,36),(1,37),(1,38),(1,39),(1,40),(1,41),(1,42),(1,43),(1,44),(1,45),(1,46),(1,47),(1,48),(1,49),(1,50),(1,51),(1,52),(1,53),(1,54),(1,55),(1,56),(1,57),(1,58),(1,59),(1,60),(1,61),(1,62),(1,63),(1,64),(1,65),(1,66),(1,67),(1,68),(1,69),(1,70),(1,71),(1,72),(1,73),(1,74),(1,75),(1,76),(1,77),(1,78),(1,79),(1,80),(1,81),(1,82),(1,83),(1,84),(1,85),(1,86),(1,87),(1,88),(1,89),(1,90),(1,91),(1,92),(1,93),(1,94),(1,95),(1,96),(1,97),(1,98),(1,99),(1,100),(1,101),(1,102),(1,103),(1,104),(1,105),(1,106),(1,107),(1,108),(1,109),(1,110),(1,111),(1,112),(1,113),(1,114),(1,115),(1,116),(1,117),(1,118),(1,119),(1,120),(1,121),(1,122),(1,123),(1,124),(1,125),(1,126),(1,127),(1,128),(1,129),(1,130),(1,131),(1,132),(1,133),(1,134),(1,135),(1,136),(1,137),(1,138),(1,139),(1,140),(1,141),(1,142),(1,143),(1,144),(1,145),(1,146),(1,147),(1,148),(1,149),(1,150),(1,151),(1,152),(1,153),(1,154),(1,155),(1,156),(1,157),(1,158),(1,159),(1,160),(1,161),(1,162),(1,163),(1,164),(1,165),(1,166),(1,167),(1,168),(1,169),(1,170),(1,171),(1,172),(1,173),(1,174),(1,175),(1,176),(1,177),(1,178),(1,179),(1,180),(1,181),(1,182),(1,183),(1,184),(1,185),(1,186),(1,187),(1,188),(1,189),(1,190),(1,191),(1,192),(1,193),(1,194),(1,195),(1,196),(1,197),(1,198),(1,199),(1,200),(1,201),(1,202),(1,203),(1,204),(1,205),(1,206),(1,207),(1,208),(1,209),(1,210),(1,211),(1,212),(1,213),(1,214),(1,215),(1,216),(1,217),(1,218),(1,219),(1,220),(1,221),(1,222),(1,223),(1,224),(1,225),(1,226),(1,227),(1,228),(1,229),(1,230),(1,231),(1,232),(1,233),(1,234),(1,235),(1,236),(1,237),(1,238),(1,239),(1,240),(1,241),(1,242),(1,243),(1,244),(1,245),(1,246),(1,247),(1,248),(1,249),(1,250),(1,251),(1,252),(1,253),(1,254),(1,255),(1,256),(1,257),(1,258),(1,259),(1,260),(1,261),(1,262),(1,263),(1,264),(1,265),(1,266),(1,267),(1,268),(1,269),(1,270),(1,271),(1,272),(1,273),(1,274),(1,275),(1,276),(1,277),(1,278),(1,279),(1,280),(1,281),(1,282),(1,283),(1,284),(1,285),(1,286),(1,287),(1,288),(1,289),(1,290),(1,291),(1,292),(1,293),(1,294),(1,295),(1,296),(1,297),(1,298),(1,299),(1,300),(1,301),(1,302),(1,303),(1,304),(1,305),(1,306),(1,307),(1,308),(1,309),(1,310),(1,311),(1,312),(1,313),(1,314),(1,315),(1,344),(1,347),(1,446),(2,1),(2,2),(2,3),(2,5),(2,8),(2,10),(2,11),(2,12),(2,13),(2,14),(2,15),(2,16),(2,17),(2,18),(2,19),(2,20),(2,21),(2,22),(2,23),(2,24),(2,27),(2,28),(2,30),(2,31),(2,33),(2,34),(2,35),(2,36),(2,38),(2,39),(2,40),(2,41),(2,42),(2,43),(2,44),(2,45),(2,47),(2,48),(2,49),(2,347),(2,553),(2,554),(2,556),(2,558),(2,560),(2,562),(2,563),(2,564),(2,565),(2,567),(2,569),(2,570),(2,572),(2,573),(2,574),(2,575),(2,579),(2,581),(2,583),(2,584),(2,585),(2,586),(2,587),(2,588),(2,596),(2,597),(2,598),(2,599),(2,600),(2,602),(2,603),(2,604),(2,605),(2,606),(2,609),(2,610),(2,611),(2,613),(2,614),(2,616),(2,617),(2,618),(2,619),(2,624),(2,625),(2,629),(2,630),(2,631),(2,632),(2,633),(2,634),(2,636),(2,637),(2,638),(2,639),(2,640),(2,641),(2,642),(2,643),(2,644),(2,647),(2,648),(2,798),(3,1),(3,5),(3,8),(3,10),(3,12),(3,14),(3,15),(3,16),(3,27),(3,28),(3,44),(3,49),(3,55),(3,64),(3,72),(3,77),(3,173),(3,176),(3,178),(3,180),(3,610),(3,629),(3,648),(3,1099),(3,1101),(3,1105),(3,1109),(3,1113),(3,1114),(3,1115),(3,1122),(3,1123),(3,1124),(3,1125),(3,1126),(3,1127),(3,1128),(3,1129),(3,1130),(3,1131),(3,1132),(3,1133),(3,1134),(3,1135),(3,1136),(3,1137),(3,1142),(3,1143),(3,1144),(3,1145),(3,1146),(3,1147),(3,1148),(4,50),(4,94),(4,194),(4,218),(4,219),(4,315),(4,1113),(4,1266),(4,1269),(4,1271),(4,1272),(4,1273),(4,1274),(4,1275),(4,1276),(4,1277),(4,1278),(4,1279),(4,1280),(4,1282),(4,1283),(4,1284),(4,1285),(4,1286),(4,1287),(4,1290),(4,1291),(4,1292),(4,1293),(4,1294),(4,1295),(5,1),(5,5),(5,8),(5,446),(5,553),(5,1334),(5,1335),(5,1336),(5,1337),(5,1339),(5,1341),(5,1342),(5,1343),(5,1344),(5,1345),(5,1346),(5,1347),(5,1349),(5,1350),(5,1351),(6,1),(6,2),(6,5),(6,8),(6,10),(6,12),(6,13),(6,14),(6,15),(6,16),(6,20),(6,27),(6,28),(6,30),(6,31),(6,553),(6,604),(6,1873),(7,1),(7,2),(7,3),(7,5),(7,8),(7,12),(7,14),(7,17),(7,21),(7,27),(7,30),(7,31),(7,33),(7,36),(7,38),(7,44),(7,446),(7,610),(7,618),(7,798),(7,1873),(7,2011),(7,2014),(7,2017),(7,2020),(8,8),(8,10),(8,12),(8,14),(8,16),(8,23),(8,27),(8,28),(8,30),(8,35),(8,344),(8,610),(8,2815),(8,2818),(8,2825),(8,2827),(8,2829),(8,2830),(8,2831),(8,2887),(9,1),(9,5),(9,14),(9,86),(9,1147),(9,2933),(9,2934),(9,2935),(9,2936),(9,2937),(9,2938),(9,2939),(9,2940),(9,2941),(9,2942),(9,2943),(9,2944),(9,2945),(9,2985),(9,2995),(9,3008),(10,47),(10,347),(10,1131),(10,1133),(10,2818),(10,2985),(10,3036),(10,3037),(10,3038),(10,3039),(10,3040),(10,3041),(10,3043),(10,3044),(10,3045),(10,3046),(10,3047),(11,37),(11,50),(11,75),(11,94),(11,344),(11,1873),(11,3201),(11,3203),(11,3204),(11,3207),(11,3208),(11,3209),(11,3210),(11,3211),(11,3212),(11,3213),(11,3214),(11,3215),(11,3216),(11,3217),(11,3218),(12,1),(12,8),(12,14),(12,27),(12,44),(12,47),(12,49),(12,55),(12,58),(12,60),(12,64),(12,72),(12,638),(12,798),(12,1873),(12,3201),(12,3328),(12,3332),(12,3333),(12,3338),(13,1),(13,2),(13,8),(13,10),(13,12),(13,13),(13,14),(13,15),(13,16),(13,27),(13,30),(13,31),(13,446),(13,618),(13,1349),(13,3471),(14,1),(14,3),(14,5),(14,8),(14,10),(14,446),(14,554),(14,556),(14,1335),(14,1341),(14,4018),(14,4019),(14,4021),(14,4022),(14,4023),(15,27),(15,44),(15,64),(15,1131),(15,1873),(15,2935),(15,2985),(15,3037),(15,3038),(15,3211),(15,3213),(15,4463),(15,4464),(15,4467),(15,4468),(16,1),(16,3),(16,5),(16,8),(16,10),(16,13),(16,14),(16,15),(16,16),(16,20),(16,27),(16,30),(16,31),(16,556),(16,3201),(16,4550),(16,4554),(16,4555),(17,55),(17,344),(17,347),(17,798),(17,1130),(17,1156),(17,1873),(17,4676),(17,4677),(17,4678),(17,4679),(17,4680),(17,4681),(17,4683),(17,4684),(17,4685),(17,4686),(17,4687),(17,4688),(17,4689),(18,1),(18,2),(18,5),(18,8),(18,10),(18,12),(18,13),(18,14),(18,15),(18,16),(18,20),(18,21),(18,22),(18,27),(18,28),(18,30),(18,446),(19,1),(19,2),(19,5),(19,8),(19,10),(19,12),(19,13),(19,14),(19,554),(19,563),(19,2818),(19,2887),(19,4554),(19,5001),(19,5009),(20,1),(20,2),(20,5),(20,8),(20,10),(20,12),(20,13),(20,347),(20,553),(20,5324),(20,5325),(20,5327),(20,5331),(20,5333),(21,1),(21,2),(21,344),(21,446),(21,1335),(21,1337),(21,3328),(21,4018),(21,5325),(21,5608),(21,5610),(21,5611),(21,5612),(21,5615),(21,5617),(21,5997),(22,1),(22,5),(22,27),(22,44),(22,49),(22,55),(22,574),(22,611),(22,616),(22,798),(22,1873),(22,2995),(22,3008),(22,6210),(22,6211),(22,6212),(22,6219),(22,6220),(23,1),(23,10),(23,12),(23,14),(23,16),(23,20),(23,27),(23,36),(23,564),(23,567),(23,569),(23,583),(23,798),(23,3008),(23,5001),(23,6528),(23,6530),(24,1),(24,2),(24,5),(24,8),(24,10),(24,12),(24,13),(24,14),(24,15),(24,16),(24,20),(24,22),(24,27),(24,344),(24,446),(24,798),(24,3201),(24,6913),(24,6916),(24,7213);
/*!40000 ALTER TABLE `streets_has_districts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id_user` int NOT NULL AUTO_INCREMENT,
  `fullname` varchar(100) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `username` varchar(45) DEFAULT NULL,
  `pass` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id_user`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (14,'Nguyễn Trần Hải Yến','nguyentranhaiyen223@gmail.com','nguyentranhaiyen223','$2a$10$NBm4NB5SirpgZ1HkcGlf3ehC45WO8LjO5TNUxGSqdXtIcSJhQWgO.'),(15,'Nguyễn Trần Hải Âu','nguyentranhaiau@gmail.com','nguyentranhaiau','$2a$10$xodelYfBJNxwLonh2ed3A.RtGeGR0bBIEi5/hWIIQgdNP2FtUzHpu'),(16,'Nguyễn Trần Bá Hoàn','nguyentranbahoan@gmail.com','nguyentranbahoan','$2a$10$wq7GufsOLwEVrslO3B4mc.lxbENzX7r9eosFEyTJu8/r4wCLYJclu'),(17,'Trần Thị Liên','tranthilien@gmail.com','tranthilien','$2a$10$RLfVQDqiFHaHhuovCt832.Nj9LYMc0lMQBOO5ToZ.VIw1A9CiqKw6');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-11-20 23:31:24
