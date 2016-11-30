-- MySQL dump 10.13  Distrib 5.6.30, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: excp
-- ------------------------------------------------------
-- Server version	5.6.30-1

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
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissi_permission_id_84c5c92e_fk_auth_permission_id` (`permission_id`),
  CONSTRAINT `auth_group_permissi_permission_id_84c5c92e_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permissi_content_type_id_2f476e4b_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can add permission',2,'add_permission'),(5,'Can change permission',2,'change_permission'),(6,'Can delete permission',2,'delete_permission'),(7,'Can add user',3,'add_user'),(8,'Can change user',3,'change_user'),(9,'Can delete user',3,'delete_user'),(10,'Can add group',4,'add_group'),(11,'Can change group',4,'change_group'),(12,'Can delete group',4,'delete_group'),(13,'Can add content type',5,'add_contenttype'),(14,'Can change content type',5,'change_contenttype'),(15,'Can delete content type',5,'delete_contenttype'),(16,'Can add session',6,'add_session'),(17,'Can change session',6,'change_session'),(18,'Can delete session',6,'delete_session'),(19,'Can add user info',7,'add_userinfo'),(20,'Can change user info',7,'change_userinfo'),(21,'Can delete user info',7,'delete_userinfo'),(22,'Can add collect dream',8,'add_collectdream'),(23,'Can change collect dream',8,'change_collectdream'),(24,'Can delete collect dream',8,'delete_collectdream'),(25,'Can add dream',9,'add_dream'),(26,'Can change dream',9,'change_dream'),(27,'Can delete dream',9,'delete_dream'),(28,'Can add user action',10,'add_useraction'),(29,'Can change user action',10,'change_useraction'),(30,'Can delete user action',10,'delete_useraction'),(31,'Can add dream comment',11,'add_dreamcomment'),(32,'Can change dream comment',11,'change_dreamcomment'),(33,'Can delete dream comment',11,'delete_dreamcomment'),(34,'Can add chat',12,'add_chat'),(35,'Can change chat',12,'change_chat'),(36,'Can delete chat',12,'delete_chat'),(37,'Can add periodic task',13,'add_periodictask'),(38,'Can change periodic task',13,'change_periodictask'),(39,'Can delete periodic task',13,'delete_periodictask'),(40,'Can add crontab',14,'add_crontabschedule'),(41,'Can change crontab',14,'change_crontabschedule'),(42,'Can delete crontab',14,'delete_crontabschedule'),(43,'Can add interval',15,'add_intervalschedule'),(44,'Can change interval',15,'change_intervalschedule'),(45,'Can delete interval',15,'delete_intervalschedule'),(46,'Can add periodic tasks',16,'add_periodictasks'),(47,'Can change periodic tasks',16,'change_periodictasks'),(48,'Can delete periodic tasks',16,'delete_periodictasks'),(49,'Can add task state',17,'add_taskmeta'),(50,'Can change task state',17,'change_taskmeta'),(51,'Can delete task state',17,'delete_taskmeta'),(52,'Can add saved group result',18,'add_tasksetmeta'),(53,'Can change saved group result',18,'change_tasksetmeta'),(54,'Can delete saved group result',18,'delete_tasksetmeta'),(55,'Can add worker',19,'add_workerstate'),(56,'Can change worker',19,'change_workerstate'),(57,'Can delete worker',19,'delete_workerstate'),(58,'Can add task',20,'add_taskstate'),(59,'Can change task',20,'change_taskstate'),(60,'Can delete task',20,'delete_taskstate');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$30000$Hm4TsDkFjTwk$+QFqIyVZnUKs3D5juhvXf+uGsHQqjeMyZESHNkEh3Wg=','2016-11-30 07:42:28.135199',1,'admin','','','',1,1,'2016-11-30 06:52:05.917018'),(2,'pbkdf2_sha256$30000$8FPMlSOMcxSc$CRbiztcRhnZ/37IsyTseuuwKg7VqQ6Ro8jbO7kLv02c=','2016-11-30 08:10:06.937686',0,'123','','','123@123.com',0,1,'2016-11-30 07:35:02.156084'),(3,'pbkdf2_sha256$30000$TKuKHDkoBPfC$CkgdgQY142JcCfKiDFumG1CFrFy+YdNlWBTN1W8nvf4=','2016-11-30 08:06:16.497724',0,'sqrt_9','','','zqwmhyf@163.com',0,1,'2016-11-30 07:38:39.195640'),(4,'pbkdf2_sha256$30000$HyUIhQ1gS0nf$gqn0Hezvz3K2oMZk1jX06VeS71yFhNTwZFxRjAs31mc=','2016-11-30 07:51:41.130424',0,'321','','','321@321.com',0,1,'2016-11-30 07:48:54.066816'),(5,'pbkdf2_sha256$30000$jQwCvoG7XtsE$IW8u09C0b760fZ1wmehCdoaICQLh+F4bDGyZnG4uZOc=','2016-11-30 07:56:06.429676',0,'111','','','111@111.com',0,1,'2016-11-30 07:56:06.200596'),(6,'pbkdf2_sha256$30000$PdRRhXjQCPPx$zp2sDcrNIphmr4yZbTpRTahk+6SsVnISFQqMs0436qs=','2016-11-30 08:02:37.575349',0,'333','','','333@333.com',0,1,'2016-11-30 08:00:51.167551'),(7,'pbkdf2_sha256$30000$3xWkEhzj0meW$J2t7cVUbMmc+CzLsY4QH5cKvcBE4YsxAJR3iuxSZ3iI=','2016-11-30 08:08:54.022366',0,'999','','','999@999.com',0,1,'2016-11-30 08:08:53.758641');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_perm_permission_id_1fbb5f2c_fk_auth_permission_id` (`permission_id`),
  CONSTRAINT `auth_user_user_perm_permission_id_1fbb5f2c_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `celery_taskmeta`
--

DROP TABLE IF EXISTS `celery_taskmeta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `celery_taskmeta` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `task_id` varchar(255) NOT NULL,
  `status` varchar(50) NOT NULL,
  `result` longtext,
  `date_done` datetime(6) NOT NULL,
  `traceback` longtext,
  `hidden` tinyint(1) NOT NULL,
  `meta` longtext,
  PRIMARY KEY (`id`),
  UNIQUE KEY `task_id` (`task_id`),
  KEY `celery_taskmeta_662f707d` (`hidden`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `celery_taskmeta`
--

LOCK TABLES `celery_taskmeta` WRITE;
/*!40000 ALTER TABLE `celery_taskmeta` DISABLE KEYS */;
/*!40000 ALTER TABLE `celery_taskmeta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `celery_tasksetmeta`
--

DROP TABLE IF EXISTS `celery_tasksetmeta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `celery_tasksetmeta` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `taskset_id` varchar(255) NOT NULL,
  `result` longtext NOT NULL,
  `date_done` datetime(6) NOT NULL,
  `hidden` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `taskset_id` (`taskset_id`),
  KEY `celery_tasksetmeta_662f707d` (`hidden`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `celery_tasksetmeta`
--

LOCK TABLES `celery_tasksetmeta` WRITE;
/*!40000 ALTER TABLE `celery_tasksetmeta` DISABLE KEYS */;
/*!40000 ALTER TABLE `celery_tasksetmeta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin__content_type_id_c4bce8eb_fk_django_content_type_id` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin__content_type_id_c4bce8eb_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2016-11-30 07:27:15.061415','1','我是管理员',1,'[{\"added\": {}}]',9,1),(2,'2016-11-30 07:42:39.128413','1','我是管理员',3,'',9,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(4,'auth','group'),(2,'auth','permission'),(3,'auth','user'),(5,'contenttypes','contenttype'),(14,'djcelery','crontabschedule'),(15,'djcelery','intervalschedule'),(13,'djcelery','periodictask'),(16,'djcelery','periodictasks'),(17,'djcelery','taskmeta'),(18,'djcelery','tasksetmeta'),(20,'djcelery','taskstate'),(19,'djcelery','workerstate'),(8,'dream','collectdream'),(9,'dream','dream'),(11,'dream','dreamcomment'),(10,'dream','useraction'),(6,'sessions','session'),(12,'webchat','chat'),(7,'webuser','userinfo');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2016-11-30 06:51:08.037830'),(2,'auth','0001_initial','2016-11-30 06:51:16.042729'),(3,'admin','0001_initial','2016-11-30 06:51:17.771683'),(4,'admin','0002_logentry_remove_auto_add','2016-11-30 06:51:17.883637'),(5,'contenttypes','0002_remove_content_type_name','2016-11-30 06:51:18.821306'),(6,'auth','0002_alter_permission_name_max_length','2016-11-30 06:51:19.646175'),(7,'auth','0003_alter_user_email_max_length','2016-11-30 06:51:20.315507'),(8,'auth','0004_alter_user_username_opts','2016-11-30 06:51:20.356427'),(9,'auth','0005_alter_user_last_login_null','2016-11-30 06:51:20.828505'),(10,'auth','0006_require_contenttypes_0002','2016-11-30 06:51:20.861427'),(11,'auth','0007_alter_validators_add_error_messages','2016-11-30 06:51:20.907447'),(12,'auth','0008_alter_user_username_max_length','2016-11-30 06:51:21.663201'),(13,'djcelery','0001_initial','2016-11-30 06:51:28.832755'),(14,'dream','0001_initial','2016-11-30 06:51:37.597669'),(15,'sessions','0001_initial','2016-11-30 06:51:38.113481'),(16,'webchat','0001_initial','2016-11-30 06:51:39.906485'),(17,'webuser','0001_initial','2016-11-30 06:51:40.922168'),(18,'webuser','0002_auto_20161130_1451','2016-11-30 06:51:41.113941');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_de54fa62` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('50fevj9kvdb9rol2lm6penunc1cp64uv','NzY5MzE1OTE2NzQ2NDg0MzdhYzc1ZDkyOTQ4MTU4ZjM1MWEyZDAzMzp7Il9hdXRoX3VzZXJfaGFzaCI6ImU2NDBlNjMzMTkzOTFjOGY2Mjk1MDg5MjU3ZGE5ZTQ2NzAyYTJiN2QiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIyIn0=','2016-12-14 08:10:07.004569');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `djcelery_crontabschedule`
--

DROP TABLE IF EXISTS `djcelery_crontabschedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `djcelery_crontabschedule` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `minute` varchar(64) NOT NULL,
  `hour` varchar(64) NOT NULL,
  `day_of_week` varchar(64) NOT NULL,
  `day_of_month` varchar(64) NOT NULL,
  `month_of_year` varchar(64) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `djcelery_crontabschedule`
--

LOCK TABLES `djcelery_crontabschedule` WRITE;
/*!40000 ALTER TABLE `djcelery_crontabschedule` DISABLE KEYS */;
/*!40000 ALTER TABLE `djcelery_crontabschedule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `djcelery_intervalschedule`
--

DROP TABLE IF EXISTS `djcelery_intervalschedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `djcelery_intervalschedule` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `every` int(11) NOT NULL,
  `period` varchar(24) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `djcelery_intervalschedule`
--

LOCK TABLES `djcelery_intervalschedule` WRITE;
/*!40000 ALTER TABLE `djcelery_intervalschedule` DISABLE KEYS */;
/*!40000 ALTER TABLE `djcelery_intervalschedule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `djcelery_periodictask`
--

DROP TABLE IF EXISTS `djcelery_periodictask`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `djcelery_periodictask` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `task` varchar(200) NOT NULL,
  `args` longtext NOT NULL,
  `kwargs` longtext NOT NULL,
  `queue` varchar(200) DEFAULT NULL,
  `exchange` varchar(200) DEFAULT NULL,
  `routing_key` varchar(200) DEFAULT NULL,
  `expires` datetime(6) DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL,
  `last_run_at` datetime(6) DEFAULT NULL,
  `total_run_count` int(10) unsigned NOT NULL,
  `date_changed` datetime(6) NOT NULL,
  `description` longtext NOT NULL,
  `crontab_id` int(11) DEFAULT NULL,
  `interval_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `djcelery_peri_crontab_id_75609bab_fk_djcelery_crontabschedule_id` (`crontab_id`),
  KEY `djcelery_pe_interval_id_b426ab02_fk_djcelery_intervalschedule_id` (`interval_id`),
  CONSTRAINT `djcelery_pe_interval_id_b426ab02_fk_djcelery_intervalschedule_id` FOREIGN KEY (`interval_id`) REFERENCES `djcelery_intervalschedule` (`id`),
  CONSTRAINT `djcelery_peri_crontab_id_75609bab_fk_djcelery_crontabschedule_id` FOREIGN KEY (`crontab_id`) REFERENCES `djcelery_crontabschedule` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `djcelery_periodictask`
--

LOCK TABLES `djcelery_periodictask` WRITE;
/*!40000 ALTER TABLE `djcelery_periodictask` DISABLE KEYS */;
/*!40000 ALTER TABLE `djcelery_periodictask` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `djcelery_periodictasks`
--

DROP TABLE IF EXISTS `djcelery_periodictasks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `djcelery_periodictasks` (
  `ident` smallint(6) NOT NULL,
  `last_update` datetime(6) NOT NULL,
  PRIMARY KEY (`ident`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `djcelery_periodictasks`
--

LOCK TABLES `djcelery_periodictasks` WRITE;
/*!40000 ALTER TABLE `djcelery_periodictasks` DISABLE KEYS */;
/*!40000 ALTER TABLE `djcelery_periodictasks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `djcelery_taskstate`
--

DROP TABLE IF EXISTS `djcelery_taskstate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `djcelery_taskstate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `state` varchar(64) NOT NULL,
  `task_id` varchar(36) NOT NULL,
  `name` varchar(200) DEFAULT NULL,
  `tstamp` datetime(6) NOT NULL,
  `args` longtext,
  `kwargs` longtext,
  `eta` datetime(6) DEFAULT NULL,
  `expires` datetime(6) DEFAULT NULL,
  `result` longtext,
  `traceback` longtext,
  `runtime` double DEFAULT NULL,
  `retries` int(11) NOT NULL,
  `hidden` tinyint(1) NOT NULL,
  `worker_id` int(11),
  PRIMARY KEY (`id`),
  UNIQUE KEY `task_id` (`task_id`),
  KEY `djcelery_taskstate_9ed39e2e` (`state`),
  KEY `djcelery_taskstate_b068931c` (`name`),
  KEY `djcelery_taskstate_863bb2ee` (`tstamp`),
  KEY `djcelery_taskstate_662f707d` (`hidden`),
  KEY `djcelery_taskstate_ce77e6ef` (`worker_id`),
  CONSTRAINT `djcelery_taskstate_worker_id_f7f57a05_fk_djcelery_workerstate_id` FOREIGN KEY (`worker_id`) REFERENCES `djcelery_workerstate` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `djcelery_taskstate`
--

LOCK TABLES `djcelery_taskstate` WRITE;
/*!40000 ALTER TABLE `djcelery_taskstate` DISABLE KEYS */;
/*!40000 ALTER TABLE `djcelery_taskstate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `djcelery_workerstate`
--

DROP TABLE IF EXISTS `djcelery_workerstate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `djcelery_workerstate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `hostname` varchar(255) NOT NULL,
  `last_heartbeat` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `hostname` (`hostname`),
  KEY `djcelery_workerstate_f129901a` (`last_heartbeat`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `djcelery_workerstate`
--

LOCK TABLES `djcelery_workerstate` WRITE;
/*!40000 ALTER TABLE `djcelery_workerstate` DISABLE KEYS */;
/*!40000 ALTER TABLE `djcelery_workerstate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dream_collectdream`
--

DROP TABLE IF EXISTS `dream_collectdream`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dream_collectdream` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dream_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `dream_collectdream_52c3b610` (`dream_id`),
  KEY `dream_collectdream_e8701ad4` (`user_id`),
  CONSTRAINT `dream_collectdream_dream_id_80d8f82f_fk_dream_dream_id` FOREIGN KEY (`dream_id`) REFERENCES `dream_dream` (`id`),
  CONSTRAINT `dream_collectdream_user_id_49701dc0_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dream_collectdream`
--

LOCK TABLES `dream_collectdream` WRITE;
/*!40000 ALTER TABLE `dream_collectdream` DISABLE KEYS */;
INSERT INTO `dream_collectdream` VALUES (1,3,2),(2,2,2),(3,5,5),(4,9,3);
/*!40000 ALTER TABLE `dream_collectdream` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dream_dream`
--

DROP TABLE IF EXISTS `dream_dream`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dream_dream` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `publish_time` datetime(6) DEFAULT NULL,
  `modify_time` datetime(6) DEFAULT NULL,
  `short_description` varchar(100) DEFAULT NULL,
  `content` longtext NOT NULL,
  `comment_num` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `dream_dream_user_id_c5d02c7c_fk_auth_user_id` (`user_id`),
  CONSTRAINT `dream_dream_user_id_c5d02c7c_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dream_dream`
--

LOCK TABLES `dream_dream` WRITE;
/*!40000 ALTER TABLE `dream_dream` DISABLE KEYS */;
INSERT INTO `dream_dream` VALUES (2,'2016-11-30 07:41:31.537017','2016-11-30 07:51:24.833448','《解优杂货店》交换','我手上有一本《解优杂货店》，想和人交换东野圭吾的书，联系方式888888。',5,3),(3,'2016-11-30 07:44:39.474336','2016-11-30 07:44:39.474803','坐标南京，求推荐美食','准备招待来南京玩的小伙伴，但是我自己也不怎么了解，求表哥们推荐',0,2),(4,'2016-11-30 07:52:52.226588','2016-11-30 07:52:52.227064','iphone7 出售','9成新，价格私聊，有意者联系，qq：666666',0,4),(5,'2016-11-30 07:54:40.755354','2016-11-30 07:56:40.138775','港行ps4出售','想换pro，出售ps4，￥2000，电话：3333333',1,4),(6,'2016-11-30 07:57:49.728075','2016-11-30 07:57:49.728374','知乎到底是个什么地方啊？','没用过知乎，不过好像用的人很多，周围人都在用。',0,5),(7,'2016-11-30 07:59:44.706746','2016-11-30 08:03:05.852452','有关粒子加速问题','电流为2ma，此时加电压粒子不会过载吗',1,5),(8,'2016-11-30 08:02:07.791421','2016-11-30 08:02:07.791761','不知道你们对我不是潘金莲这部电影怎么看的','我没看过，不过听说评分低啊，王思聪还撕逼来着，你们怎么看啊。',0,6),(9,'2016-11-30 08:04:53.752938','2016-11-30 08:06:29.173908','新开了一家店，坐标上海。','新开的一家店，叫，位于闵行区，主要经营特色小吃，希望各位来品尝。地址是。。。。。',1,6),(10,'2016-11-30 08:07:44.374722','2016-11-30 08:08:36.939551','最近和女朋友感情出问题了，求解惑。','异地，最近老是吵架，说我不关心她，我说什么都没用，很突然，该怎么办啊',1,3),(11,'2016-11-30 08:09:50.802019','2016-11-30 08:09:50.802297','瞧一瞧，看一看。','最近新养了一直巴西龟，把鱼都吃光了，真是倒霉',0,7),(12,'2016-11-30 08:10:57.249765','2016-11-30 08:10:57.250048','明天上海漫展，找基友一起','有人一起去吗。',0,2);
/*!40000 ALTER TABLE `dream_dream` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dream_dreamcomment`
--

DROP TABLE IF EXISTS `dream_dreamcomment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dream_dreamcomment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` varchar(1000) DEFAULT NULL,
  `publish_time` datetime(6) DEFAULT NULL,
  `dream_id` int(11) NOT NULL,
  `parent_comment_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `dream_dreamcomment_dream_id_cfc6748d_fk_dream_dream_id` (`dream_id`),
  KEY `dream_dreamc_parent_comment_id_0527449c_fk_dream_dreamcomment_id` (`parent_comment_id`),
  KEY `dream_dreamcomment_user_id_46a6db31_fk_auth_user_id` (`user_id`),
  CONSTRAINT `dream_dreamc_parent_comment_id_0527449c_fk_dream_dreamcomment_id` FOREIGN KEY (`parent_comment_id`) REFERENCES `dream_dreamcomment` (`id`),
  CONSTRAINT `dream_dreamcomment_dream_id_cfc6748d_fk_dream_dream_id` FOREIGN KEY (`dream_id`) REFERENCES `dream_dream` (`id`),
  CONSTRAINT `dream_dreamcomment_user_id_46a6db31_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dream_dreamcomment`
--

LOCK TABLES `dream_dreamcomment` WRITE;
/*!40000 ALTER TABLE `dream_dreamcomment` DISABLE KEYS */;
INSERT INTO `dream_dreamcomment` VALUES (1,'快来人看看啊','2016-11-30 07:41:52.623442',2,NULL,3),(2,'我有《嫌疑人x的献身》，你看可以吗。行的私聊','2016-11-30 07:43:29.019169',2,NULL,2),(3,'东野圭吾不行了啊','2016-11-30 07:49:51.013800',2,NULL,4),(4,'好，私聊','2016-11-30 07:51:05.313614',2,2,3),(5,'没有啊，还是很好看啊','2016-11-30 07:51:24.799505',2,3,3),(6,'路过看看，暂时没想法','2016-11-30 07:56:39.861127',5,NULL,5),(7,'不明觉历','2016-11-30 08:03:05.768699',7,NULL,6),(8,'有机会去','2016-11-30 08:06:28.987818',9,NULL,3),(9,'问题解决了，她最近压力大，我去安慰安慰就好了','2016-11-30 08:08:36.853358',10,NULL,3);
/*!40000 ALTER TABLE `dream_dreamcomment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dream_useraction`
--

DROP TABLE IF EXISTS `dream_useraction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dream_useraction` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) DEFAULT NULL,
  `action` int(11) DEFAULT NULL,
  `comment_id` int(11) DEFAULT NULL,
  `dream_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `dream_useraction_comment_id_a784f34c_fk_dream_dreamcomment_id` (`comment_id`),
  KEY `dream_useraction_dream_id_075deaa8_fk_dream_dream_id` (`dream_id`),
  KEY `dream_useraction_user_id_0b88293d_fk_auth_user_id` (`user_id`),
  CONSTRAINT `dream_useraction_comment_id_a784f34c_fk_dream_dreamcomment_id` FOREIGN KEY (`comment_id`) REFERENCES `dream_dreamcomment` (`id`),
  CONSTRAINT `dream_useraction_dream_id_075deaa8_fk_dream_dream_id` FOREIGN KEY (`dream_id`) REFERENCES `dream_dream` (`id`),
  CONSTRAINT `dream_useraction_user_id_0b88293d_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dream_useraction`
--

LOCK TABLES `dream_useraction` WRITE;
/*!40000 ALTER TABLE `dream_useraction` DISABLE KEYS */;
INSERT INTO `dream_useraction` VALUES (1,'2016-11-30 07:41:31.695728',1,NULL,2,3),(2,'2016-11-30 07:41:52.802913',2,1,2,3),(3,'2016-11-30 07:43:29.281964',2,2,2,2),(4,'2016-11-30 07:44:39.603095',1,NULL,3,2),(5,'2016-11-30 07:49:51.181370',2,3,2,4),(6,'2016-11-30 07:51:05.483132',2,4,2,3),(7,'2016-11-30 07:51:24.867007',2,5,2,3),(8,'2016-11-30 07:52:52.352818',1,NULL,4,4),(9,'2016-11-30 07:54:41.034837',1,NULL,5,4),(10,'2016-11-30 07:56:40.217364',2,6,5,5),(11,'2016-11-30 07:57:49.816999',1,NULL,6,5),(12,'2016-11-30 07:59:44.896827',1,NULL,7,5),(13,'2016-11-30 08:02:07.888277',1,NULL,8,6),(14,'2016-11-30 08:03:05.931013',2,7,7,6),(15,'2016-11-30 08:04:53.886016',1,NULL,9,6),(16,'2016-11-30 08:06:29.263719',2,8,9,3),(17,'2016-11-30 08:07:44.467324',1,NULL,10,3),(18,'2016-11-30 08:08:36.995659',2,9,10,3),(19,'2016-11-30 08:09:50.897824',1,NULL,11,7),(20,'2016-11-30 08:10:57.455560',1,NULL,12,2);
/*!40000 ALTER TABLE `dream_useraction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `webchat_chat`
--

DROP TABLE IF EXISTS `webchat_chat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `webchat_chat` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `publish_time` datetime(6) DEFAULT NULL,
  `content` varchar(300) DEFAULT NULL,
  `already_read` int(11) NOT NULL,
  `receiver_id` int(11) NOT NULL,
  `sender_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `webchat_chat_receiver_id_04b6f8e9_fk_auth_user_id` (`receiver_id`),
  KEY `webchat_chat_sender_id_0edbc274_fk_auth_user_id` (`sender_id`),
  CONSTRAINT `webchat_chat_receiver_id_04b6f8e9_fk_auth_user_id` FOREIGN KEY (`receiver_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `webchat_chat_sender_id_0edbc274_fk_auth_user_id` FOREIGN KEY (`sender_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `webchat_chat`
--

LOCK TABLES `webchat_chat` WRITE;
/*!40000 ALTER TABLE `webchat_chat` DISABLE KEYS */;
/*!40000 ALTER TABLE `webchat_chat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `webuser_userinfo`
--

DROP TABLE IF EXISTS `webuser_userinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `webuser_userinfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `register_day` datetime(6) NOT NULL,
  `headimg` varchar(100) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `webuser_webuser_user_id_c05e8745_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `webuser_userinfo`
--

LOCK TABLES `webuser_userinfo` WRITE;
/*!40000 ALTER TABLE `webuser_userinfo` DISABLE KEYS */;
INSERT INTO `webuser_userinfo` VALUES (1,'2016-11-30 08:11:22.912262','headimg/1231480493482.jpeg',2),(2,'2016-11-30 07:38:39.294688','default.jpg',3),(3,'2016-11-30 07:48:54.198889','default.jpg',4),(4,'2016-11-30 08:00:06.985388','headimg/1111480492806.jpeg',5),(5,'2016-11-30 08:00:51.274675','default.jpg',6),(6,'2016-11-30 08:08:53.866542','default.jpg',7);
/*!40000 ALTER TABLE `webuser_userinfo` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-11-30 16:14:50
