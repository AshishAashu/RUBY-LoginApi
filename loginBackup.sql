-- MySQL dump 10.13  Distrib 5.7.23, for Linux (x86_64)
--
-- Host: localhost    Database: users
-- ------------------------------------------------------
-- Server version	5.7.23-0ubuntu0.16.04.1

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
-- Table structure for table `apiusers`
--

DROP TABLE IF EXISTS `apiusers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `apiusers` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `apikey` varchar(255) NOT NULL,
  `apiuserkey` varchar(255) DEFAULT NULL,
  `exists` varchar(255) DEFAULT NULL,
  `course_id` bigint(20) DEFAULT NULL,
  `youtube_id` varchar(255) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_apiusers_on_course_id` (`course_id`),
  KEY `index_apiusers_on_user_id` (`user_id`),
  CONSTRAINT `fk_rails_1d29136120` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `fk_rails_2f958f4353` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `apiusers`
--

LOCK TABLES `apiusers` WRITE;
/*!40000 ALTER TABLE `apiusers` DISABLE KEYS */;
INSERT INTO `apiusers` VALUES (1,'Amit Yadav','amit@gmail.com','1234','2018-05-06 10:51:53','2018-05-28 10:04:41','asdfghjklz',NULL,NULL,1,'atVof3pjT-I',1),(2,'Akhil Kumar','akhil@gmail.com','1234','2018-05-06 11:30:49','2018-05-15 07:22:32','asdfghjklz',NULL,NULL,2,NULL,1),(3,'Vikas Yadav','vikas@gmail.com','1234','2018-05-07 11:05:43','2018-05-07 11:07:04','asdfghjklz',NULL,NULL,1,NULL,1),(4,'Amitesh','as@gmail.com','1234','2018-05-07 11:14:28','2018-05-07 12:11:57','asdfghjklz',NULL,NULL,3,NULL,1),(5,'Ankit','ankit@gmail.com','1234','2018-05-08 08:39:53','2018-05-08 10:23:58','asdfghjklz',NULL,NULL,1,NULL,1),(6,'Vineet','vineet@gmail.com','1234','2018-05-08 10:27:15','2018-05-08 10:29:29','asdfghjklz',NULL,NULL,2,NULL,1),(7,'as','asf@gmail.com','12','2018-05-08 10:29:58','2018-05-08 10:41:34','asdfghjklz',NULL,NULL,3,NULL,1),(8,'Nirmal','nirmal@gmail.com','12','2018-05-08 11:21:27','2018-05-08 11:21:27','asdfghjklz',NULL,NULL,1,NULL,1),(9,'Test','test@gmail.com','1234','2018-05-09 07:22:35','2018-05-11 07:30:25','asdfghjklz',NULL,NULL,3,'atVof3pjT-I',1),(10,'Test1','test1@gmail.com','1234','2018-05-09 07:26:04','2018-05-28 10:05:05','asdfghjklz',NULL,NULL,2,'kYCO3v-z1Xo',1),(11,'Ashish Kaushal','ashishkaushalraj110@gmail.com','1234','2018-05-14 06:40:50','2018-05-29 12:22:18','asdfghjklz',NULL,NULL,2,'hjWf8A0YNSE',1),(12,'Ashish HBTU','ashishkumarkaushal@outlook.com','1234','2018-05-14 06:47:11','2018-05-18 09:03:30','asdfghjklz',NULL,NULL,1,'hjWf8A0YNSE',1),(13,'Abhishek','abhi@gmail.com','1234','2018-05-16 12:23:37','2018-05-16 12:54:58','qwertyuiopa',NULL,NULL,1,'dZ0fwJojhrs',2);
/*!40000 ALTER TABLE `apiusers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ar_internal_metadata`
--

DROP TABLE IF EXISTS `ar_internal_metadata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ar_internal_metadata` (
  `key` varchar(255) NOT NULL,
  `value` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ar_internal_metadata`
--

LOCK TABLES `ar_internal_metadata` WRITE;
/*!40000 ALTER TABLE `ar_internal_metadata` DISABLE KEYS */;
INSERT INTO `ar_internal_metadata` VALUES ('environment','development','2018-05-04 08:44:33','2018-05-04 08:44:33');
/*!40000 ALTER TABLE `ar_internal_metadata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `courses`
--

DROP TABLE IF EXISTS `courses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `courses` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `course_name` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `courses`
--

LOCK TABLES `courses` WRITE;
/*!40000 ALTER TABLE `courses` DISABLE KEYS */;
INSERT INTO `courses` VALUES (1,'PHP','2018-05-08 05:48:31','2018-05-08 05:48:31'),(2,'JAVA','2018-05-08 05:55:22','2018-05-08 05:55:22'),(3,'RUBY','2018-05-08 05:57:49','2018-05-08 05:57:49');
/*!40000 ALTER TABLE `courses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schema_migrations`
--

DROP TABLE IF EXISTS `schema_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schema_migrations` (
  `version` varchar(255) NOT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schema_migrations`
--

LOCK TABLES `schema_migrations` WRITE;
/*!40000 ALTER TABLE `schema_migrations` DISABLE KEYS */;
INSERT INTO `schema_migrations` VALUES ('20180504084801'),('20180504085526'),('20180504085605'),('20180504085643'),('20180504085740'),('20180504090828'),('20180504102002'),('20180504103427'),('20180504115047'),('20180504115423'),('20180506104102'),('20180507073313'),('20180507120431'),('20180508061107'),('20180508061256'),('20180508061314'),('20180508070914'),('20180508071424'),('20180508072759'),('20180508073106'),('20180509070132'),('20180518061141');
/*!40000 ALTER TABLE `schema_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `apikey` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'ashish@gmail.com','1234','2018-05-04 09:21:59','2018-05-04 09:21:59','asdfghjklz'),(2,'yash@gmail.com','1234','2018-05-04 09:47:22','2018-05-04 09:47:22','qwertyuiopa'),(3,'jcnjks','ncks','2018-05-04 09:48:06','2018-05-04 09:48:06',NULL);
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

-- Dump completed on 2018-08-09 12:03:54
