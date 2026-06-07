-- MySQL dump 10.13  Distrib 8.0.43, for Win64 (x86_64)
--
-- Host: localhost    Database: procurement_logistics_db
-- ------------------------------------------------------
-- Server version	8.0.43

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=81 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',3,'add_permission'),(6,'Can change permission',3,'change_permission'),(7,'Can delete permission',3,'delete_permission'),(8,'Can view permission',3,'view_permission'),(9,'Can add group',2,'add_group'),(10,'Can change group',2,'change_group'),(11,'Can delete group',2,'delete_group'),(12,'Can view group',2,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add Manufacturer',7,'add_manufacturer'),(26,'Can change Manufacturer',7,'change_manufacturer'),(27,'Can delete Manufacturer',7,'delete_manufacturer'),(28,'Can view Manufacturer',7,'view_manufacturer'),(29,'Can add Vendor',8,'add_vendor'),(30,'Can change Vendor',8,'change_vendor'),(31,'Can delete Vendor',8,'delete_vendor'),(32,'Can view Vendor',8,'view_vendor'),(33,'Can add Contract',9,'add_contract'),(34,'Can change Contract',9,'change_contract'),(35,'Can delete Contract',9,'delete_contract'),(36,'Can view Contract',9,'view_contract'),(37,'Can add Item',10,'add_item'),(38,'Can change Item',10,'change_item'),(39,'Can delete Item',10,'delete_item'),(40,'Can view Item',10,'view_item'),(41,'Can add Order',11,'add_order'),(42,'Can change Order',11,'change_order'),(43,'Can delete Order',11,'delete_order'),(44,'Can view Order',11,'view_order'),(45,'Can add Dock Bay',12,'add_dockbay'),(46,'Can change Dock Bay',12,'change_dockbay'),(47,'Can delete Dock Bay',12,'delete_dockbay'),(48,'Can view Dock Bay',12,'view_dockbay'),(49,'Can add Elevator Schedule',13,'add_elevatorschedule'),(50,'Can change Elevator Schedule',13,'change_elevatorschedule'),(51,'Can delete Elevator Schedule',13,'delete_elevatorschedule'),(52,'Can view Elevator Schedule',13,'view_elevatorschedule'),(53,'Can add Freight Elevator',16,'add_freightelevator'),(54,'Can change Freight Elevator',16,'change_freightelevator'),(55,'Can delete Freight Elevator',16,'delete_freightelevator'),(56,'Can view Freight Elevator',16,'view_freightelevator'),(57,'Can add Location',17,'add_location'),(58,'Can change Location',17,'change_location'),(59,'Can delete Location',17,'delete_location'),(60,'Can view Location',17,'view_location'),(61,'Can add FFE Delivery',14,'add_ffedelivery'),(62,'Can change FFE Delivery',14,'change_ffedelivery'),(63,'Can delete FFE Delivery',14,'delete_ffedelivery'),(64,'Can view FFE Delivery',14,'view_ffedelivery'),(65,'Can add FFE Move',15,'add_ffemove'),(66,'Can change FFE Move',15,'change_ffemove'),(67,'Can delete FFE Move',15,'delete_ffemove'),(68,'Can view FFE Move',15,'view_ffemove'),(69,'Can add Reservation',18,'add_reservation'),(70,'Can change Reservation',18,'change_reservation'),(71,'Can delete Reservation',18,'delete_reservation'),(72,'Can view Reservation',18,'view_reservation'),(73,'Can add Alert',19,'add_alert'),(74,'Can change Alert',19,'change_alert'),(75,'Can delete Alert',19,'delete_alert'),(76,'Can view Alert',19,'view_alert'),(77,'Can add Resource',20,'add_resource'),(78,'Can change Resource',20,'change_resource'),(79,'Can delete Resource',20,'delete_resource'),(80,'Can view Resource',20,'view_resource');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `first_name` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(254) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$1200000$JPToa64WhKVSyxFJ5Gem3L$r27QUrojuLrWK2dojDz9e8qpHq8rcdFCC3XQ4dt59uI=','2026-06-02 20:23:11.364343',1,'admin','','','admin@admin.com',1,1,'2026-06-02 03:04:51.409721'),(2,'pbkdf2_sha256$1200000$BgQJ79m1FQNaWxA7W3gWf3$aPkzikgzAa1Oj9NdQW9xUisCjvjv3yy9iD9KnfjDNmI=','2026-06-05 14:54:43.596156',0,'walter','walter','delattore','',0,1,'2026-06-02 03:44:13.000000'),(3,'pbkdf2_sha256$1200000$1vUrEgTLm0Q4NEE2gGAn32$43zvz33yiSSNWaYGPOhJn4Y3qQxAC9iY5/ehqrRjGMk=','2026-06-02 20:38:17.497685',0,'rabet','','','',0,1,'2026-06-02 20:07:13.217934');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext COLLATE utf8mb4_unicode_ci,
  `object_repr` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2026-06-02 03:44:14.331069','2','walter',1,'[{\"added\": {}}]',4,1),(2,'2026-06-02 03:44:39.488364','2','walter',2,'[{\"changed\": {\"fields\": [\"First name\", \"Last name\"]}}]',4,1),(3,'2026-06-02 03:50:42.531253','2','walter',2,'[]',4,1),(4,'2026-06-02 20:06:43.957646','2','walter',2,'[]',4,1),(5,'2026-06-02 20:07:14.108472','3','rabet',1,'[{\"added\": {}}]',4,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(2,'auth','group'),(3,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(12,'logistics','dockbay'),(13,'logistics','elevatorschedule'),(14,'logistics','ffedelivery'),(15,'logistics','ffemove'),(16,'logistics','freightelevator'),(17,'logistics','location'),(18,'logistics','reservation'),(19,'operations','alert'),(20,'operations','resource'),(9,'procurement','contract'),(10,'procurement','item'),(11,'procurement','order'),(6,'sessions','session'),(7,'vendors','manufacturer'),(8,'vendors','vendor');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2026-06-02 02:54:22.391648'),(2,'auth','0001_initial','2026-06-02 02:54:23.416840'),(3,'admin','0001_initial','2026-06-02 02:54:23.615966'),(4,'admin','0002_logentry_remove_auto_add','2026-06-02 02:54:23.624427'),(5,'admin','0003_logentry_add_action_flag_choices','2026-06-02 02:54:23.631986'),(6,'contenttypes','0002_remove_content_type_name','2026-06-02 02:54:23.768882'),(7,'auth','0002_alter_permission_name_max_length','2026-06-02 02:54:23.853267'),(8,'auth','0003_alter_user_email_max_length','2026-06-02 02:54:23.876948'),(9,'auth','0004_alter_user_username_opts','2026-06-02 02:54:23.884473'),(10,'auth','0005_alter_user_last_login_null','2026-06-02 02:54:23.958201'),(11,'auth','0006_require_contenttypes_0002','2026-06-02 02:54:23.962293'),(12,'auth','0007_alter_validators_add_error_messages','2026-06-02 02:54:23.971208'),(13,'auth','0008_alter_user_username_max_length','2026-06-02 02:54:24.056096'),(14,'auth','0009_alter_user_last_name_max_length','2026-06-02 02:54:24.141990'),(15,'auth','0010_alter_group_name_max_length','2026-06-02 02:54:24.161290'),(16,'auth','0011_update_proxy_permissions','2026-06-02 02:54:24.170156'),(17,'auth','0012_alter_user_first_name_max_length','2026-06-02 02:54:24.259175'),(18,'vendors','0001_initial','2026-06-02 02:54:24.355483'),(19,'procurement','0001_initial','2026-06-02 02:54:24.835597'),(20,'logistics','0001_initial','2026-06-02 02:54:25.797116'),(21,'operations','0001_initial','2026-06-02 02:54:26.010313'),(22,'sessions','0001_initial','2026-06-02 02:54:26.056606');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `session_data` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('1y0axn02i3emgwaxte24ncmsvd9y3ffc','.eJxVjEEOwiAQRe_C2hBaLGW6dO8ZyDAMFjXQlDbRGO-uTbrQ7X_vv5dwuC6jWyvPLgUxCC0Ov5tHunHeQLhivhRJJS9z8nJT5E6rPJfA99Pu_gVGrOP33UFUkYHBctQ9t9ajMRQtaQDjWStljl0MEAOR6jwxW9-QbnsFEbGxW7Ryralkx48pzU8xqPcHw69AIA:1wUVsP:9YZRF-u6VXDP7AUHFVSlGzQqL7tsoDMgtD82elyNDqg','2026-06-16 20:38:17.502470'),('tfhr1rknyndodtzfgpm2wdhs5633un2x','.eJxVjMsOwiAURP-FtSFQHr106d5vIDwuFjXQlDbRGP_dNulCd5OZM-dNrFuX0a4NZ5sjGQgnp9_Ou3DHsg_x5sq10lDLMmdPd4Qea6OXGvFxPtg_wejauL0x9jqwjqekld9CB1z0oHzCzgfhjBQATisJHiLIZCQwrjnDYJIwKahd2rC1XIvF55TnFxnY5wt8JT7E:1wUVdn:TI05HYOtqqeo-6Fl_WI6LCkxa1ps2R1RzHPU5elCNHs','2026-06-16 20:23:11.372397'),('y279v23co2lxwa22inzlyrcdbn94zznm','.eJxVjMsOwiAURP-FtSEtr9Yu3fsN5F64WNRAA22iMf67knShy5k5c17MwrbOdqtUbPRsYoIdfjsEd6PUBn-FdMnc5bSWiLwhfF8rP2dP99PO_glmqHN768H1CnUng1EkCXzQgN9sDKpuNApUH4SmAUYXBEktj3IgcqiEJ4GySSvVGnOy9FhiebKpe38AoO4_kw:1wVVwZ:dzCjV5u-gZ25eOP1EReVX4vLBmDeaROnNkfXlrBK8M4','2026-06-19 14:54:43.601243');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_alerts`
--

DROP TABLE IF EXISTS `tbl_alerts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_alerts` (
  `alert_id` int NOT NULL AUTO_INCREMENT,
  `alert_type` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci,
  `created_date` datetime(6) DEFAULT NULL,
  `status` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `RelatedReservationID` int DEFAULT NULL,
  PRIMARY KEY (`alert_id`),
  KEY `tbl_Alerts_RelatedReservationID_e07fb18c_fk_tbl_Reser` (`RelatedReservationID`),
  CONSTRAINT `tbl_Alerts_RelatedReservationID_e07fb18c_fk_tbl_Reser` FOREIGN KEY (`RelatedReservationID`) REFERENCES `tbl_reservations` (`reservation_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6006 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_alerts`
--

LOCK TABLES `tbl_alerts` WRITE;
/*!40000 ALTER TABLE `tbl_alerts` DISABLE KEYS */;
INSERT INTO `tbl_alerts` VALUES (6001,'Elevator Overlap','Elevator 2 Overlap at 11:00 AM','2026-05-28 11:00:00.000000','Open',2003),(6002,'Dock Overbooked','Dock A Overbooked','2026-05-28 09:30:00.000000','Open',NULL),(6003,'High Variance','High Variance in Orders','2026-05-28 12:00:00.000000','Open',2003),(6004,'Resource','Insufficient staff assigned','2026-05-28 09:35:00.000000','Closed',2002),(6005,'Maintenance','Elevator D unavailable','2026-05-28 09:00:00.000000','Open',2002);
/*!40000 ALTER TABLE `tbl_alerts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_contracts`
--

DROP TABLE IF EXISTS `tbl_contracts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_contracts` (
  `contract_id` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `contract_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `warranty` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `comments` longtext COLLATE utf8mb4_unicode_ci,
  `ManufacturerID` int NOT NULL,
  PRIMARY KEY (`contract_id`),
  KEY `tbl_Contracts_ManufacturerID_91370988_fk_tbl_Manuf` (`ManufacturerID`),
  CONSTRAINT `tbl_Contracts_ManufacturerID_91370988_fk_tbl_Manuf` FOREIGN KEY (`ManufacturerID`) REFERENCES `tbl_manufacturers` (`manufacturer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_contracts`
--

LOCK TABLES `tbl_contracts` WRITE;
/*!40000 ALTER TABLE `tbl_contracts` DISABLE KEYS */;
INSERT INTO `tbl_contracts` VALUES ('C001','Office Equipment Contract','2025-01-01','2027-12-31','5 Years','Standard pricing',1),('C002','Furniture Contract','2025-01-01','2026-12-31','3 Years','Bulk discount',2),('C003','Tables Contract','2025-02-01','2028-01-31','4 Years','Premium material',3),('C004','Seating Contract','2025-03-01','2027-02-28','2 Years','Fast delivery',4),('C005','Lab Equipment Contract','2025-01-15','2029-01-15','6 Years','Specialized products',5);
/*!40000 ALTER TABLE `tbl_contracts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_dockbays`
--

DROP TABLE IF EXISTS `tbl_dockbays`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_dockbays` (
  `dock_id` int NOT NULL AUTO_INCREMENT,
  `dock_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `location` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `capacity` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`dock_id`),
  UNIQUE KEY `dock_name` (`dock_name`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_dockbays`
--

LOCK TABLES `tbl_dockbays` WRITE;
/*!40000 ALTER TABLE `tbl_dockbays` DISABLE KEYS */;
INSERT INTO `tbl_dockbays` VALUES (1,'Dock A','Main Building','3 Trucks','Active'),(2,'Dock B','Annex','2 Trucks','Active'),(3,'Dock C','Warehouse','4 Trucks','Active'),(4,'Dock D','Service Area','2 Trucks','Maintenance'),(5,'Dock E','Back Dock','1 Truck','Active');
/*!40000 ALTER TABLE `tbl_dockbays` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_elevatorschedule`
--

DROP TABLE IF EXISTS `tbl_elevatorschedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_elevatorschedule` (
  `elevator_schedule_id` int NOT NULL AUTO_INCREMENT,
  `start_datetime` datetime(6) NOT NULL,
  `end_datetime` datetime(6) NOT NULL,
  `status` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `trip_count` int DEFAULT NULL,
  `ElevatorID` int NOT NULL,
  `ReservationID` int NOT NULL,
  PRIMARY KEY (`elevator_schedule_id`),
  KEY `tbl_ElevatorSchedule_ElevatorID_409fbe9f_fk_tbl_Freig` (`ElevatorID`),
  KEY `tbl_ElevatorSchedule_ReservationID_f54216ab_fk_tbl_Reser` (`ReservationID`),
  CONSTRAINT `tbl_ElevatorSchedule_ElevatorID_409fbe9f_fk_tbl_Freig` FOREIGN KEY (`ElevatorID`) REFERENCES `tbl_freightelevators` (`elevator_id`),
  CONSTRAINT `tbl_ElevatorSchedule_ReservationID_f54216ab_fk_tbl_Reser` FOREIGN KEY (`ReservationID`) REFERENCES `tbl_reservations` (`reservation_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3008 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_elevatorschedule`
--

LOCK TABLES `tbl_elevatorschedule` WRITE;
/*!40000 ALTER TABLE `tbl_elevatorschedule` DISABLE KEYS */;
INSERT INTO `tbl_elevatorschedule` VALUES (3002,'2026-05-28 09:40:00.000000','2026-05-28 10:20:00.000000','Pending',1,2,2002),(3003,'2026-05-28 11:00:00.000000','2026-05-28 11:45:00.000000','Scheduled',2,2,2003),(3004,'2026-05-28 11:15:00.000000','2026-05-28 11:50:00.000000','Scheduled',1,2,2004),(3005,'2026-05-28 13:05:00.000000','2026-05-28 13:35:00.000000','Completed',1,5,2005);
/*!40000 ALTER TABLE `tbl_elevatorschedule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_ffe_delivery`
--

DROP TABLE IF EXISTS `tbl_ffe_delivery`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_ffe_delivery` (
  `delivery_id` int NOT NULL AUTO_INCREMENT,
  `delivery_status` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `required_on_site_date` date DEFAULT NULL,
  `total_installed_cost` decimal(14,2) DEFAULT NULL,
  `variance` decimal(14,2) DEFAULT NULL,
  `ItemID` int NOT NULL,
  `VendorID` int NOT NULL,
  `ReservationID` int NOT NULL,
  PRIMARY KEY (`delivery_id`),
  KEY `tbl_FFE_Delivery_ReservationID_d2bdd1dc_fk_tbl_Reser` (`ReservationID`),
  KEY `tbl_FFE_Delivery_ItemID_143b1ef3_fk_tbl_Items_item_id` (`ItemID`),
  KEY `tbl_FFE_Delivery_VendorID_c2c10da3_fk_tbl_Vendors_nys_vendor_id` (`VendorID`),
  CONSTRAINT `tbl_FFE_Delivery_ItemID_143b1ef3_fk_tbl_Items_item_id` FOREIGN KEY (`ItemID`) REFERENCES `tbl_items` (`item_id`),
  CONSTRAINT `tbl_FFE_Delivery_ReservationID_d2bdd1dc_fk_tbl_Reser` FOREIGN KEY (`ReservationID`) REFERENCES `tbl_reservations` (`reservation_id`),
  CONSTRAINT `tbl_FFE_Delivery_VendorID_c2c10da3_fk_tbl_Vendors_nys_vendor_id` FOREIGN KEY (`VendorID`) REFERENCES `tbl_vendors` (`nys_vendor_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4006 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_ffe_delivery`
--

LOCK TABLES `tbl_ffe_delivery` WRITE;
/*!40000 ALTER TABLE `tbl_ffe_delivery` DISABLE KEYS */;
INSERT INTO `tbl_ffe_delivery` VALUES (4003,'Scheduled','2026-05-28',8200.00,1200.00,105,1005,2003);
/*!40000 ALTER TABLE `tbl_ffe_delivery` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_ffe_moves`
--

DROP TABLE IF EXISTS `tbl_ffe_moves`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_ffe_moves` (
  `move_id` int NOT NULL AUTO_INCREMENT,
  `destination_room` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `destination_floor` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `move_status` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `DeliveryID` int NOT NULL,
  `ElevatorScheduleID` int NOT NULL,
  PRIMARY KEY (`move_id`),
  KEY `tbl_FFE_Moves_DeliveryID_05c7340c_fk_tbl_FFE_D` (`DeliveryID`),
  KEY `tbl_FFE_Moves_ElevatorScheduleID_63efa08c_fk_tbl_Eleva` (`ElevatorScheduleID`),
  CONSTRAINT `tbl_FFE_Moves_DeliveryID_05c7340c_fk_tbl_FFE_D` FOREIGN KEY (`DeliveryID`) REFERENCES `tbl_ffe_delivery` (`delivery_id`),
  CONSTRAINT `tbl_FFE_Moves_ElevatorScheduleID_63efa08c_fk_tbl_Eleva` FOREIGN KEY (`ElevatorScheduleID`) REFERENCES `tbl_elevatorschedule` (`elevator_schedule_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5006 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_ffe_moves`
--

LOCK TABLES `tbl_ffe_moves` WRITE;
/*!40000 ALTER TABLE `tbl_ffe_moves` DISABLE KEYS */;
INSERT INTO `tbl_ffe_moves` VALUES (5003,'D401','4','Scheduled',4003,3003);
/*!40000 ALTER TABLE `tbl_ffe_moves` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_freightelevators`
--

DROP TABLE IF EXISTS `tbl_freightelevators`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_freightelevators` (
  `elevator_id` int NOT NULL AUTO_INCREMENT,
  `elevator_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `building` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `capacity` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`elevator_id`),
  UNIQUE KEY `elevator_name` (`elevator_name`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_freightelevators`
--

LOCK TABLES `tbl_freightelevators` WRITE;
/*!40000 ALTER TABLE `tbl_freightelevators` DISABLE KEYS */;
INSERT INTO `tbl_freightelevators` VALUES (1,'Elevator A','Main','5000 lbs','Active'),(2,'Elevator B','Annex','3000 lbs','Active'),(3,'Elevator C','Lab','4000 lbs','Active'),(4,'Elevator D','Office','3500 lbs','Maintenance'),(5,'Elevator E','Warehouse','6000 lbs','Active');
/*!40000 ALTER TABLE `tbl_freightelevators` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_items`
--

DROP TABLE IF EXISTS `tbl_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_items` (
  `item_id` int NOT NULL AUTO_INCREMENT,
  `item_description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `category` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `model` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `finish_size` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ContractID` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ManufacturerID` int NOT NULL,
  PRIMARY KEY (`item_id`),
  KEY `tbl_Items_ContractID_6f64eab2_fk_tbl_Contracts_contract_id` (`ContractID`),
  KEY `tbl_Items_ManufacturerID_fe24f75f_fk_tbl_Manuf` (`ManufacturerID`),
  CONSTRAINT `tbl_Items_ContractID_6f64eab2_fk_tbl_Contracts_contract_id` FOREIGN KEY (`ContractID`) REFERENCES `tbl_contracts` (`contract_id`),
  CONSTRAINT `tbl_Items_ManufacturerID_fe24f75f_fk_tbl_Manuf` FOREIGN KEY (`ManufacturerID`) REFERENCES `tbl_manufacturers` (`manufacturer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=106 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_items`
--

LOCK TABLES `tbl_items` WRITE;
/*!40000 ALTER TABLE `tbl_items` DISABLE KEYS */;
INSERT INTO `tbl_items` VALUES (101,'Office Chair','Seating','CH-A','Standard','C001',1),(102,'Training Table','Furniture','TB-X','Large','C002',2),(103,'Workstation','Desk','WS-10','Medium','C003',3),(104,'Lounge Chair','Seating','LC-2','Standard','C004',4),(105,'Lab Table','Lab','LT-9','Heavy','C005',5);
/*!40000 ALTER TABLE `tbl_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_locations`
--

DROP TABLE IF EXISTS `tbl_locations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_locations` (
  `location_id` int NOT NULL AUTO_INCREMENT,
  `location_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `room` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `location_type` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`location_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_locations`
--

LOCK TABLES `tbl_locations` WRITE;
/*!40000 ALTER TABLE `tbl_locations` DISABLE KEYS */;
INSERT INTO `tbl_locations` VALUES (1,'Cafe Area','C101','Public'),(2,'Computer Lab','B202','Lab'),(3,'Office Area','A301','Office'),(4,'Science Lab','D401','Lab'),(5,'Conference Room','E105','Meeting');
/*!40000 ALTER TABLE `tbl_locations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_manufacturers`
--

DROP TABLE IF EXISTS `tbl_manufacturers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_manufacturers` (
  `manufacturer_id` int NOT NULL AUTO_INCREMENT,
  `manufacturer_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `business_type` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`manufacturer_id`),
  UNIQUE KEY `manufacturer_name` (`manufacturer_name`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_manufacturers`
--

LOCK TABLES `tbl_manufacturers` WRITE;
/*!40000 ALTER TABLE `tbl_manufacturers` DISABLE KEYS */;
INSERT INTO `tbl_manufacturers` VALUES (1,'Herman Miller','MBE'),(2,'Enwork','WBE'),(3,'Steelcase','Corporate'),(4,'Hightower','WOSB'),(5,'Source International','MBE');
/*!40000 ALTER TABLE `tbl_manufacturers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_orders`
--

DROP TABLE IF EXISTS `tbl_orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_orders` (
  `order_id` int NOT NULL AUTO_INCREMENT,
  `quantity` int DEFAULT NULL,
  `fiscal_year` smallint DEFAULT NULL,
  `quote_amount` decimal(14,2) DEFAULT NULL,
  `list_price` decimal(14,2) DEFAULT NULL,
  `discount` decimal(10,4) DEFAULT NULL,
  `ItemID` int NOT NULL,
  `VendorID` int NOT NULL,
  PRIMARY KEY (`order_id`),
  KEY `tbl_Orders_ItemID_f3f52590_fk_tbl_Items_item_id` (`ItemID`),
  KEY `tbl_Orders_VendorID_5cf70c87_fk_tbl_Vendors_nys_vendor_id` (`VendorID`),
  CONSTRAINT `tbl_Orders_ItemID_f3f52590_fk_tbl_Items_item_id` FOREIGN KEY (`ItemID`) REFERENCES `tbl_items` (`item_id`),
  CONSTRAINT `tbl_Orders_VendorID_5cf70c87_fk_tbl_Vendors_nys_vendor_id` FOREIGN KEY (`VendorID`) REFERENCES `tbl_vendors` (`nys_vendor_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_orders`
--

LOCK TABLES `tbl_orders` WRITE;
/*!40000 ALTER TABLE `tbl_orders` DISABLE KEYS */;
INSERT INTO `tbl_orders` VALUES (1,50,2026,25000.00,30000.00,0.1000,101,1001),(2,20,2026,12000.00,15000.00,0.2000,102,1002),(3,10,2026,8000.00,10000.00,0.1500,103,1003),(4,15,2026,9000.00,12000.00,0.2500,104,1004),(5,8,2026,7000.00,9000.00,0.2200,105,1005);
/*!40000 ALTER TABLE `tbl_orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_reservations`
--

DROP TABLE IF EXISTS `tbl_reservations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_reservations` (
  `reservation_id` int NOT NULL AUTO_INCREMENT,
  `start_datetime` datetime(6) NOT NULL,
  `end_datetime` datetime(6) NOT NULL,
  `status` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `priority` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `requires_elevator` tinyint(1) NOT NULL,
  `DockID` int NOT NULL,
  `VendorID` int NOT NULL,
  PRIMARY KEY (`reservation_id`),
  KEY `tbl_Reservations_DockID_55e0a0e5_fk_tbl_DockBays_dock_id` (`DockID`),
  KEY `tbl_Reservations_VendorID_a1ca0d87_fk_tbl_Vendors_nys_vendor_id` (`VendorID`),
  CONSTRAINT `tbl_Reservations_DockID_55e0a0e5_fk_tbl_DockBays_dock_id` FOREIGN KEY (`DockID`) REFERENCES `tbl_dockbays` (`dock_id`),
  CONSTRAINT `tbl_Reservations_VendorID_a1ca0d87_fk_tbl_Vendors_nys_vendor_id` FOREIGN KEY (`VendorID`) REFERENCES `tbl_vendors` (`nys_vendor_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2010 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_reservations`
--

LOCK TABLES `tbl_reservations` WRITE;
/*!40000 ALTER TABLE `tbl_reservations` DISABLE KEYS */;
INSERT INTO `tbl_reservations` VALUES (2002,'2026-05-28 09:30:00.000000','2026-05-28 10:30:00.000000','Pending','Medium',1,4,1004),(2003,'2026-05-28 11:00:00.000000','2026-05-28 12:00:00.000000','Scheduled','High',1,5,1005),(2004,'2026-05-28 09:30:00.000000','2026-05-28 10:15:00.000000','Scheduled','High',1,1,1001),(2005,'2026-05-28 13:00:00.000000','2026-05-28 14:00:00.000000','Completed','Low',0,3,1002),(2008,'2026-06-04 21:14:00.000000','2026-06-04 20:15:00.000000','Cancelled','High',1,1,1003);
/*!40000 ALTER TABLE `tbl_reservations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_resources`
--

DROP TABLE IF EXISTS `tbl_resources`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_resources` (
  `resource_id` int NOT NULL AUTO_INCREMENT,
  `staff_required` int DEFAULT NULL,
  `forklift_required` tinyint(1) NOT NULL,
  `elevator_operator_required` tinyint(1) NOT NULL,
  `estimated_move_time` int DEFAULT NULL,
  `ReservationID` int NOT NULL,
  PRIMARY KEY (`resource_id`),
  KEY `tbl_Resources_ReservationID_2d2444be_fk_tbl_Reser` (`ReservationID`),
  CONSTRAINT `tbl_Resources_ReservationID_2d2444be_fk_tbl_Reser` FOREIGN KEY (`ReservationID`) REFERENCES `tbl_reservations` (`reservation_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7006 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_resources`
--

LOCK TABLES `tbl_resources` WRITE;
/*!40000 ALTER TABLE `tbl_resources` DISABLE KEYS */;
INSERT INTO `tbl_resources` VALUES (7001,2001,3,1,0,45),(7002,2002,2,0,1,30),(7003,2003,4,1,1,60),(7004,2004,3,1,1,40),(7005,2005,2,0,0,25);
/*!40000 ALTER TABLE `tbl_resources` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_vendors`
--

DROP TABLE IF EXISTS `tbl_vendors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_vendors` (
  `nys_vendor_id` int NOT NULL,
  `vendor_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `business_type` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `approved_status` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contact_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`nys_vendor_id`),
  UNIQUE KEY `vendor_name` (`vendor_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_vendors`
--

LOCK TABLES `tbl_vendors` WRITE;
/*!40000 ALTER TABLE `tbl_vendors` DISABLE KEYS */;
INSERT INTO `tbl_vendors` VALUES (1001,'Empire Office','WBE','2125551111','sales@empire.com','Yes','John Rivera'),(1002,'AFC Industries','MBE','7185552222','info@afc.com','Yes','Linda Chen'),(1003,'Creative Office','WOSB','9175553333','contact@creative.com','Yes','David Lopez'),(1004,'Intivity Inc','SB','6465554444','support@intivity.com','Pending','Maria Gomez'),(1005,'Alianza Services','MBE','9295555555','sales@alianza.com','Yes','Carlos Diaz');
/*!40000 ALTER TABLE `tbl_vendors` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-06-07 13:35:53
