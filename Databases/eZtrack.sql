-- MySQL dump 10.13  Distrib 5.7.12, for Win64 (x86_64)
--
-- Host: localhost    Database: eztrack
-- ------------------------------------------------------
-- Server version	5.5.15

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
-- Table structure for table `alerts`
--

DROP TABLE IF EXISTS `alerts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `alerts` (
  `a_id` int(10) NOT NULL,
  `dbatch_id` int(10) NOT NULL,
  `ud_id` int(10) NOT NULL,
  PRIMARY KEY (`a_id`),
  KEY `ud_id` (`ud_id`),
  CONSTRAINT `alerts_ibfk_1` FOREIGN KEY (`ud_id`) REFERENCES `user_devices` (`ud_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alerts`
--

LOCK TABLES `alerts` WRITE;
/*!40000 ALTER TABLE `alerts` DISABLE KEYS */;
/*!40000 ALTER TABLE `alerts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `device_data`
--

DROP TABLE IF EXISTS `device_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `device_data` (
  `dd_id` int(10) NOT NULL,
  `ud_id` int(10) NOT NULL,
  `dbatch_id` int(10) NOT NULL,
  `s_id` int(5) NOT NULL,
  `value` int(10) NOT NULL,
  `data_timestamp` datetime NOT NULL DEFAULT '2001-01-01 00:00:01',
  PRIMARY KEY (`dd_id`),
  KEY `ud_id` (`ud_id`),
  KEY `s_id` (`s_id`),
  CONSTRAINT `device_data_ibfk_1` FOREIGN KEY (`ud_id`) REFERENCES `user_devices` (`ud_id`),
  CONSTRAINT `device_data_ibfk_2` FOREIGN KEY (`s_id`) REFERENCES `sensors` (`s_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `device_data`
--

LOCK TABLES `device_data` WRITE;
/*!40000 ALTER TABLE `device_data` DISABLE KEYS */;
INSERT INTO `device_data` VALUES (1,1,1,1,27,'2001-01-01 00:00:01'),(2,1,2,1,25,'2001-01-01 00:00:01'),(3,2,3,1,32,'2001-01-01 00:00:01');
/*!40000 ALTER TABLE `device_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `devices`
--

DROP TABLE IF EXISTS `devices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `devices` (
  `d_id` int(10) NOT NULL,
  `imei` varchar(20) NOT NULL,
  PRIMARY KEY (`d_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `devices`
--

LOCK TABLES `devices` WRITE;
/*!40000 ALTER TABLE `devices` DISABLE KEYS */;
INSERT INTO `devices` VALUES (1,'1'),(2,'2'),(3,'3');
/*!40000 ALTER TABLE `devices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notifications`
--

DROP TABLE IF EXISTS `notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notifications` (
  `n_id` int(5) NOT NULL,
  `n_type` varchar(20) NOT NULL,
  `description` varchar(50) NOT NULL,
  PRIMARY KEY (`n_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notifications`
--

LOCK TABLES `notifications` WRITE;
/*!40000 ALTER TABLE `notifications` DISABLE KEYS */;
INSERT INTO `notifications` VALUES (1,'alert','reffers to generations of alert'),(2,'request','tracking request is recieved');
/*!40000 ALTER TABLE `notifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sensors`
--

DROP TABLE IF EXISTS `sensors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sensors` (
  `s_id` int(5) NOT NULL,
  `s_type` varchar(20) NOT NULL,
  `description` varchar(50) NOT NULL,
  PRIMARY KEY (`s_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sensors`
--

LOCK TABLES `sensors` WRITE;
/*!40000 ALTER TABLE `sensors` DISABLE KEYS */;
INSERT INTO `sensors` VALUES (1,'thermistor','measures temperature');
/*!40000 ALTER TABLE `sensors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tracking_requests`
--

DROP TABLE IF EXISTS `tracking_requests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tracking_requests` (
  `tr_id` int(10) NOT NULL,
  `u_id` int(10) NOT NULL,
  `ud_id` int(10) NOT NULL,
  `status` varchar(20) NOT NULL DEFAULT 'pending',
  PRIMARY KEY (`tr_id`),
  KEY `u_id` (`u_id`),
  KEY `ud_id` (`ud_id`),
  CONSTRAINT `tracking_requests_ibfk_1` FOREIGN KEY (`u_id`) REFERENCES `users` (`u_id`),
  CONSTRAINT `tracking_requests_ibfk_2` FOREIGN KEY (`ud_id`) REFERENCES `user_devices` (`ud_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tracking_requests`
--

LOCK TABLES `tracking_requests` WRITE;
/*!40000 ALTER TABLE `tracking_requests` DISABLE KEYS */;
INSERT INTO `tracking_requests` VALUES (1,2,1,'accept'),(2,3,1,'pending'),(3,1,2,'accept'),(4,2,3,'accept');
/*!40000 ALTER TABLE `tracking_requests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_device_settings`
--

DROP TABLE IF EXISTS `user_device_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_device_settings` (
  `uds_id` int(10) NOT NULL,
  `ud_id` int(10) NOT NULL,
  `s_id` int(5) NOT NULL,
  `min_val` int(11) NOT NULL DEFAULT '0',
  `max_val` int(11) NOT NULL DEFAULT '1',
  `is_active` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`uds_id`),
  KEY `ud_id` (`ud_id`),
  KEY `s_id` (`s_id`),
  CONSTRAINT `user_device_settings_ibfk_1` FOREIGN KEY (`ud_id`) REFERENCES `user_devices` (`ud_id`),
  CONSTRAINT `user_device_settings_ibfk_2` FOREIGN KEY (`s_id`) REFERENCES `sensors` (`s_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_device_settings`
--

LOCK TABLES `user_device_settings` WRITE;
/*!40000 ALTER TABLE `user_device_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_device_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_devices`
--

DROP TABLE IF EXISTS `user_devices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_devices` (
  `ud_id` int(10) NOT NULL,
  `u_id` int(10) NOT NULL,
  `d_id` int(10) NOT NULL,
  `is_active` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ud_id`),
  KEY `u_id` (`u_id`),
  KEY `d_id` (`d_id`),
  CONSTRAINT `user_devices_ibfk_1` FOREIGN KEY (`u_id`) REFERENCES `users` (`u_id`),
  CONSTRAINT `user_devices_ibfk_2` FOREIGN KEY (`d_id`) REFERENCES `devices` (`d_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_devices`
--

LOCK TABLES `user_devices` WRITE;
/*!40000 ALTER TABLE `user_devices` DISABLE KEYS */;
INSERT INTO `user_devices` VALUES (1,1,1,1),(2,2,2,1),(3,3,3,1);
/*!40000 ALTER TABLE `user_devices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_notifications`
--

DROP TABLE IF EXISTS `user_notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_notifications` (
  `un_id` int(10) NOT NULL,
  `n_id` int(11) NOT NULL,
  `to_u_id` int(10) NOT NULL,
  `from_u_id` int(10) NOT NULL,
  `status` varchar(20) NOT NULL,
  PRIMARY KEY (`un_id`),
  KEY `to_u_id` (`to_u_id`),
  KEY `from_u_id` (`from_u_id`),
  CONSTRAINT `user_notifications_ibfk_1` FOREIGN KEY (`to_u_id`) REFERENCES `users` (`u_id`),
  CONSTRAINT `user_notifications_ibfk_2` FOREIGN KEY (`from_u_id`) REFERENCES `users` (`u_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_notifications`
--

LOCK TABLES `user_notifications` WRITE;
/*!40000 ALTER TABLE `user_notifications` DISABLE KEYS */;
INSERT INTO `user_notifications` VALUES (1,1,2,1,'delivered'),(2,1,2,1,'delivered');
/*!40000 ALTER TABLE `user_notifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_tracking_list`
--

DROP TABLE IF EXISTS `user_tracking_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_tracking_list` (
  `ut_id` int(10) NOT NULL,
  `u_id` int(10) NOT NULL,
  `ud_id` int(10) NOT NULL,
  `is_active` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ut_id`),
  KEY `u_id` (`u_id`),
  KEY `ud_id` (`ud_id`),
  CONSTRAINT `user_tracking_list_ibfk_1` FOREIGN KEY (`u_id`) REFERENCES `users` (`u_id`),
  CONSTRAINT `user_tracking_list_ibfk_2` FOREIGN KEY (`ud_id`) REFERENCES `user_devices` (`ud_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_tracking_list`
--

LOCK TABLES `user_tracking_list` WRITE;
/*!40000 ALTER TABLE `user_tracking_list` DISABLE KEYS */;
INSERT INTO `user_tracking_list` VALUES (1,2,1,1),(2,1,2,1),(3,2,3,1);
/*!40000 ALTER TABLE `user_tracking_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `u_id` int(10) NOT NULL,
  `username` varchar(20) NOT NULL,
  `fname` varchar(40) NOT NULL,
  `lname` varchar(40) NOT NULL,
  `password` varchar(20) NOT NULL,
  `email` varchar(50) DEFAULT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `is_active` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`u_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'ankitsinha','ankit','sinha','helloworld','helloworld',' ',1),(2,'Kitkat','Ankit','Sinha','password','ankit.sinha2000@gmail.com',' ',1),(3,'Xyz','Sinha','Ankit','xyz','Xyz@gmail.con',' ',1);
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

-- Dump completed on 2016-09-26 20:11:07
