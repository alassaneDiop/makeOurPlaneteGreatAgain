-- MySQL dump 10.13  Distrib 5.7.24, for Linux (x86_64)
--
-- Host: localhost    Database: makeOurPlanetGreatAgain
-- ------------------------------------------------------
-- Server version	5.7.24-0ubuntu0.16.04.1

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
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
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
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can add permission',2,'add_permission'),(5,'Can change permission',2,'change_permission'),(6,'Can delete permission',2,'delete_permission'),(7,'Can add user',3,'add_user'),(8,'Can change user',3,'change_user'),(9,'Can delete user',3,'delete_user'),(10,'Can add group',4,'add_group'),(11,'Can change group',4,'change_group'),(12,'Can delete group',4,'delete_group'),(13,'Can add content type',5,'add_contenttype'),(14,'Can change content type',5,'change_contenttype'),(15,'Can delete content type',5,'delete_contenttype'),(16,'Can add session',6,'add_session'),(17,'Can change session',6,'change_session'),(18,'Can delete session',6,'delete_session'),(19,'Can add auteur',7,'add_auteur'),(20,'Can change auteur',7,'change_auteur'),(21,'Can delete auteur',7,'delete_auteur'),(22,'Can add projet',8,'add_projet'),(23,'Can change projet',8,'change_projet'),(24,'Can delete projet',8,'delete_projet'),(25,'Can add profil',9,'add_profil'),(26,'Can change profil',9,'change_profil'),(27,'Can delete profil',9,'delete_profil'),(28,'Can add site',10,'add_site'),(29,'Can change site',10,'change_site'),(30,'Can delete site',10,'delete_site'),(31,'Can add registration profile',11,'add_registrationprofile'),(32,'Can change registration profile',11,'change_registrationprofile'),(33,'Can delete registration profile',11,'delete_registrationprofile'),(34,'Can add supervised registration profile',12,'add_supervisedregistrationprofile'),(35,'Can change supervised registration profile',12,'change_supervisedregistrationprofile'),(36,'Can delete supervised registration profile',12,'delete_supervisedregistrationprofile'),(37,'Can add evaluation',13,'add_evaluation'),(38,'Can change evaluation',13,'change_evaluation'),(39,'Can delete evaluation',13,'delete_evaluation'),(40,'Can add financement',14,'add_financement'),(41,'Can change financement',14,'change_financement'),(42,'Can delete financement',14,'delete_financement'),(43,'Can add like',15,'add_like'),(44,'Can change like',15,'change_like'),(45,'Can delete like',15,'delete_like');
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$36000$FC2f543vUh5k$k4zyVeCkZ2w8kyNGsAYNV3jzuCX5dzEF9FKjW+HWmmw=','2019-01-21 01:21:39.880214',1,'Admin','','','hamidou.traore@etud.univ-angers.fr',1,1,'2018-12-07 14:32:16.238058'),(2,'pbkdf2_sha256$36000$mJRm0Syv1lQf$UF6lwjWwDNlhWVGhMjmc4q/8k1wuw2KXQ/uwNrCks3c=','2019-01-21 16:49:07.513802',0,'Sekou','Boulby','CISSE','sekou.cisse@etud.univ-angers.fr',0,1,'2018-12-07 15:05:27.000000'),(3,'pbkdf2_sha256$36000$6aEZJa1XLtcQ$+pvVxrHKXfzxiQT6cEfPtlqTswSwImS1Fv3F5BLHaj0=',NULL,0,'Toto','','','toto@etud.univ-angers.fr',0,0,'2019-01-12 10:41:46.868713'),(4,'pbkdf2_sha256$36000$CYxUHizj9DXi$P/X7TpAAd18tZFSzz8nEBZmQ9oUkrh1bEkSklRVcbo0=','2019-01-18 03:20:30.017188',0,'alou','','','hamidou.traore@etud.univ-angers.fr',0,1,'2019-01-12 10:50:01.000000'),(5,'pbkdf2_sha256$36000$d0qDM1C42rNG$vRzrLBKPSDsxoNH9HkCg290Dgp+c80kErvnKuE/tbkM=','2019-01-18 05:35:18.193101',0,'Salomon','','','salom.ernesto@etud.univ-angers.fr',0,1,'2019-01-18 05:35:18.115663');
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
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
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
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
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
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2018-12-07 15:05:27.689603','2','Sekou',1,'[{\"added\": {}}]',3,1),(2,'2018-12-07 15:05:51.687041','2','Sekou',2,'[{\"changed\": {\"fields\": [\"first_name\", \"last_name\", \"email\"]}}]',3,1),(3,'2019-01-13 19:35:19.065537','4','',3,'',9,1),(4,'2019-01-13 19:35:19.073679','3','',3,'',9,1),(5,'2019-01-14 12:22:16.446640','1','Projet object',1,'[{\"added\": {}}]',8,1),(6,'2019-01-14 13:49:05.662788','4','alou',2,'[]',3,1),(7,'2019-01-14 13:49:52.822643','5','Auteur',1,'[{\"added\": {}}]',9,1),(8,'2019-01-14 13:50:40.107851','6','Evaluateur',1,'[{\"added\": {}}]',9,1),(9,'2019-01-14 13:52:37.636087','2','Projet object',1,'[{\"added\": {}}]',8,1),(10,'2019-01-14 15:27:29.181305','3','Projet object',1,'[{\"added\": {}}]',8,1),(11,'2019-01-14 15:28:52.423584','4','Projet object',1,'[{\"added\": {}}]',8,1),(12,'2019-01-14 15:29:13.759351','3','Projet object',2,'[{\"changed\": {\"fields\": [\"description_projet\"]}}]',8,1),(13,'2019-01-14 15:29:29.321184','3','Projet object',2,'[]',8,1),(14,'2019-01-15 17:31:56.445105','1','Financement object',1,'[{\"added\": {}}]',14,1),(15,'2019-01-15 17:32:33.815870','6','Evaluation object',3,'',13,1),(16,'2019-01-15 17:32:33.823543','5','Evaluation object',3,'',13,1),(17,'2019-01-15 17:32:33.831139','4','Evaluation object',3,'',13,1),(18,'2019-01-15 17:32:33.835385','3','Evaluation object',3,'',13,1),(19,'2019-01-15 17:32:33.839644','2','Evaluation object',3,'',13,1),(20,'2019-01-15 23:17:45.690704','6','Unwasted ocean',2,'[{\"changed\": {\"fields\": [\"finance_requis_projet\"]}}]',8,1),(21,'2019-01-15 23:18:14.156662','3','Green town garden',2,'[{\"changed\": {\"fields\": [\"finance_requis_projet\"]}}]',8,1),(22,'2019-01-15 23:18:29.446746','4','All street green trees',2,'[{\"changed\": {\"fields\": [\"finance_requis_projet\"]}}]',8,1),(23,'2019-01-15 23:18:40.208166','5','Save our planet from waste',2,'[{\"changed\": {\"fields\": [\"finance_requis_projet\"]}}]',8,1),(24,'2019-01-18 00:58:03.064311','2','Financement object',1,'[{\"added\": {}}]',14,1),(25,'2019-01-18 00:58:34.450815','3','Financement object',1,'[{\"added\": {}}]',14,1),(26,'2019-01-18 03:18:45.051450','7','Our planet is bleding',2,'[{\"changed\": {\"fields\": [\"finance_requis_projet\"]}}]',8,1),(27,'2019-01-18 03:19:07.628764','6','Unwasted ocean',2,'[{\"changed\": {\"fields\": [\"finance_requis_projet\"]}}]',8,1),(28,'2019-01-18 03:19:24.667346','5','Save our planet from waste',2,'[{\"changed\": {\"fields\": [\"finance_requis_projet\"]}}]',8,1),(29,'2019-01-18 03:19:37.127446','4','All street green trees',2,'[{\"changed\": {\"fields\": [\"finance_requis_projet\"]}}]',8,1),(30,'2019-01-18 03:20:01.312948','3','Green town garden',2,'[{\"changed\": {\"fields\": [\"finance_requis_projet\"]}}]',8,1),(31,'2019-01-21 01:22:12.678358','3','Green town garden',2,'[{\"changed\": {\"fields\": [\"date_acquis_finance\"]}}]',8,1),(32,'2019-01-21 01:22:25.455963','3','Green town garden',2,'[{\"changed\": {\"fields\": [\"financement_est_aquis\"]}}]',8,1),(33,'2019-01-21 01:23:19.710799','6','Financement object',1,'[{\"added\": {}}]',14,1);
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
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(4,'auth','group'),(2,'auth','permission'),(3,'auth','user'),(5,'contenttypes','contenttype'),(7,'makeOurPlanetGreatAgain','auteur'),(9,'profils','profil'),(13,'projets','evaluation'),(14,'projets','financement'),(15,'projets','like'),(8,'projets','projet'),(11,'registration','registrationprofile'),(12,'registration','supervisedregistrationprofile'),(6,'sessions','session'),(10,'sites','site');
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
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2018-12-07 12:20:11.605475'),(2,'auth','0001_initial','2018-12-07 12:20:12.506887'),(3,'admin','0001_initial','2018-12-07 12:20:12.723675'),(4,'admin','0002_logentry_remove_auto_add','2018-12-07 12:20:12.768142'),(5,'contenttypes','0002_remove_content_type_name','2018-12-07 12:20:12.951485'),(6,'auth','0002_alter_permission_name_max_length','2018-12-07 12:20:13.082606'),(7,'auth','0003_alter_user_email_max_length','2018-12-07 12:20:13.310297'),(8,'auth','0004_alter_user_username_opts','2018-12-07 12:20:13.345446'),(9,'auth','0005_alter_user_last_login_null','2018-12-07 12:20:13.419724'),(10,'auth','0006_require_contenttypes_0002','2018-12-07 12:20:13.428355'),(11,'auth','0007_alter_validators_add_error_messages','2018-12-07 12:20:13.452231'),(12,'auth','0008_alter_user_username_max_length','2018-12-07 12:20:13.600879'),(13,'makeOurPlanetGreatAgain','0001_initial','2018-12-07 12:20:13.647383'),(14,'makeOurPlanetGreatAgain','0002_projet','2018-12-07 12:20:13.848836'),(15,'makeOurPlanetGreatAgain','0003_delete_projet','2018-12-07 12:20:13.954025'),(16,'projets','0001_initial','2018-12-07 12:20:14.000541'),(17,'projets','0002_auto_20181206_2323','2018-12-07 12:20:14.073742'),(18,'projets','0003_auto_20181206_2325','2018-12-07 12:20:14.102578'),(19,'sessions','0001_initial','2018-12-07 12:20:14.173261'),(20,'makeOurPlanetGreatAgain','0004_delete_auteur','2018-12-07 12:39:22.914060'),(21,'profils','0001_initial','2018-12-07 12:39:23.031322'),(22,'projets','0004_auto_20181207_1402','2018-12-07 14:05:42.442952'),(23,'registration','0001_initial','2018-12-07 16:53:16.610175'),(24,'registration','0002_registrationprofile_activated','2018-12-07 16:53:16.700897'),(25,'registration','0003_migrate_activatedstatus','2018-12-07 16:53:16.754659'),(26,'registration','0004_supervisedregistrationprofile','2018-12-07 16:53:16.854547'),(27,'sites','0001_initial','2018-12-07 16:53:16.907154'),(28,'sites','0002_alter_domain_unique','2018-12-07 16:53:16.945275'),(29,'projets','0005_remove_projet_objectif_collecte_projet','2019-01-11 16:38:24.658763'),(30,'projets','0006_remove_projet_objectif_collecte_projet','2019-01-11 16:52:05.807648'),(31,'projets','0005_auto_20190113_1932','2019-01-13 19:32:57.744420'),(32,'projets','0006_projet','2019-01-13 21:38:07.431266'),(33,'projets','0007_auto_20190113_2140','2019-01-13 21:40:14.655465'),(34,'projets','0008_auto_20190114_0936','2019-01-14 09:37:18.101057'),(35,'projets','0009_auto_20190114_1454','2019-01-14 14:59:58.208212'),(36,'projets','0009_auto_20190114_1506','2019-01-14 15:06:12.581047'),(37,'projets','0010_auto_20190114_1510','2019-01-14 15:10:19.481234'),(38,'projets','0011_auto_20190114_1514','2019-01-14 15:15:22.895545'),(39,'projets','0012_auto_20190114_1515','2019-01-14 15:15:37.584499'),(40,'projets','0013_auto_20190115_1633','2019-01-15 16:33:14.651641'),(41,'projets','0014_auto_20190115_2237','2019-01-15 22:37:33.899577'),(42,'projets','0015_projet_finance_requis_projet','2019-01-15 22:45:24.994773'),(43,'projets','0016_auto_20190118_0316','2019-01-18 03:16:36.985196'),(44,'projets','0017_auto_20190120_1429','2019-01-20 13:29:40.291824'),(45,'projets','0018_like','2019-01-20 13:43:27.493494'),(46,'profils','0002_auto_20190121_0207','2019-01-21 01:07:19.178977');
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
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('han5o28c55w9f7oqboi24p20q2i4vsg3','NjkwMzQxMzc3YzZjMWNmZWVhYjZlZDEwZWRiYjE1NTY5ZTQ3ZTJkMjp7Il9hdXRoX3VzZXJfaGFzaCI6IjJhNWQ4YTcwNWRlYTMxMjAxMjUwNWI4YTE2NTI5NWU2NmE5NGIyNjMiLCJfYXV0aF91c2VyX2lkIjoiMiIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=','2018-12-30 15:06:39.154815');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_site`
--

DROP TABLE IF EXISTS `django_site`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_site` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `domain` varchar(100) NOT NULL,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_site_domain_a2e37b91_uniq` (`domain`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_site`
--

LOCK TABLES `django_site` WRITE;
/*!40000 ALTER TABLE `django_site` DISABLE KEYS */;
INSERT INTO `django_site` VALUES (1,'localhost:8000','makeOurPlanetGreatAgain');
/*!40000 ALTER TABLE `django_site` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profils_profil`
--

DROP TABLE IF EXISTS `profils_profil`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `profils_profil` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `adress_profil` varchar(30) NOT NULL,
  `user_id` int(11) NOT NULL,
  `is_auteur_profil` tinyint(1) NOT NULL,
  `is_evaluateur_profil` tinyint(1) NOT NULL,
  `is_financeur_profil` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `profils_profil_user_id_3964c6b7_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profils_profil`
--

LOCK TABLES `profils_profil` WRITE;
/*!40000 ALTER TABLE `profils_profil` DISABLE KEYS */;
INSERT INTO `profils_profil` VALUES (2,'2 bd beaussier 49000 Angers',2,1,0,0),(5,'25 rue St Jacques - Angers',4,1,0,0),(6,'14 rue du Château',3,1,0,0);
/*!40000 ALTER TABLE `profils_profil` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `projets_evaluation`
--

DROP TABLE IF EXISTS `projets_evaluation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `projets_evaluation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `commentaire` longtext NOT NULL,
  `note_evaluation` int(10) unsigned NOT NULL,
  `evaluateur_id` int(11) NOT NULL,
  `projet_id` int(11) NOT NULL,
  `date_evaluation` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `projets_evaluation_evaluateur_id_806f7b20_fk_auth_user_id` (`evaluateur_id`),
  KEY `projets_evaluation_projet_id_046aadea_fk_projets_projet_id` (`projet_id`),
  CONSTRAINT `projets_evaluation_evaluateur_id_806f7b20_fk_auth_user_id` FOREIGN KEY (`evaluateur_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `projets_evaluation_projet_id_046aadea_fk_projets_projet_id` FOREIGN KEY (`projet_id`) REFERENCES `projets_projet` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `projets_evaluation`
--

LOCK TABLES `projets_evaluation` WRITE;
/*!40000 ALTER TABLE `projets_evaluation` DISABLE KEYS */;
INSERT INTO `projets_evaluation` VALUES (1,'Ceci est un commentaire sur le projet \" All street green trees\"\r\nCommentaire simple et simple commentaire',3,2,4,'2019-01-15 16:33:14.062501'),(7,'Green town garden est un projet révolution\r\nSoutien total pour sa mise en oeuvre !',5,4,3,'2019-01-15 16:40:05.463662'),(8,'\"All street green trees\" evaluation text comment. Simple eval comment',3,2,4,'2019-01-15 18:05:58.787839'),(9,'Commentaire d\'évaluation du Projet \"All street green trees\". \r\nJust a comment !\r\n',3,2,4,'2019-01-15 21:15:29.655591'),(10,'Et instabat ut eum quoque cum tribunis et aliis pluribus ad comitatum imperatoris vinctum perduceret: ',4,4,6,'2019-01-15 22:31:08.787581');
/*!40000 ALTER TABLE `projets_evaluation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `projets_financement`
--

DROP TABLE IF EXISTS `projets_financement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `projets_financement` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `montant_finance` decimal(10,2) NOT NULL,
  `date_finance` datetime(6) NOT NULL,
  `financeur_id` int(11) NOT NULL,
  `projet_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `projets_financement_financeur_id_3b0c88cd_fk_auth_user_id` (`financeur_id`),
  KEY `projets_financement_projet_id_2faa0f2c_fk_projets_projet_id` (`projet_id`),
  CONSTRAINT `projets_financement_financeur_id_3b0c88cd_fk_auth_user_id` FOREIGN KEY (`financeur_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `projets_financement_projet_id_2faa0f2c_fk_projets_projet_id` FOREIGN KEY (`projet_id`) REFERENCES `projets_projet` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `projets_financement`
--

LOCK TABLES `projets_financement` WRITE;
/*!40000 ALTER TABLE `projets_financement` DISABLE KEYS */;
INSERT INTO `projets_financement` VALUES (1,100.50,'2019-01-15 17:31:56.444552',4,3),(2,2000.00,'2019-01-18 00:58:03.063705',2,3),(3,700.00,'2019-01-18 00:58:34.450284',3,3),(5,120.00,'2019-01-18 01:58:45.659618',2,5),(6,63000.00,'2019-01-21 01:23:19.710402',1,3);
/*!40000 ALTER TABLE `projets_financement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `projets_like`
--

DROP TABLE IF EXISTS `projets_like`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `projets_like` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date_like` datetime(6) NOT NULL,
  `evaluation_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `projets_like_evaluation_id_dc62bfcb_fk_projets_evaluation_id` (`evaluation_id`),
  KEY `projets_like_user_id_86917fba_fk_auth_user_id` (`user_id`),
  CONSTRAINT `projets_like_evaluation_id_dc62bfcb_fk_projets_evaluation_id` FOREIGN KEY (`evaluation_id`) REFERENCES `projets_evaluation` (`id`),
  CONSTRAINT `projets_like_user_id_86917fba_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `projets_like`
--

LOCK TABLES `projets_like` WRITE;
/*!40000 ALTER TABLE `projets_like` DISABLE KEYS */;
/*!40000 ALTER TABLE `projets_like` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `projets_projet`
--

DROP TABLE IF EXISTS `projets_projet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `projets_projet` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `titre_projet` varchar(40) NOT NULL,
  `description_projet` longtext NOT NULL,
  `date_ajout_projet` datetime(6) NOT NULL,
  `auteur_projet_id` int(11) NOT NULL,
  `finance_requis_projet` decimal(10,2) NOT NULL,
  `date_acquis_finance` datetime(6) DEFAULT NULL,
  `financement_est_aquis` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `projets_projet_auteur_projet_id_9ca7035c_fk_auth_user_id` (`auteur_projet_id`),
  CONSTRAINT `projets_projet_auteur_projet_id_9ca7035c_fk_auth_user_id` FOREIGN KEY (`auteur_projet_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `projets_projet`
--

LOCK TABLES `projets_projet` WRITE;
/*!40000 ALTER TABLE `projets_projet` DISABLE KEYS */;
INSERT INTO `projets_projet` VALUES (3,'Green town garden','Per hoc minui studium suum existimans Paulus, ut erat in conplicandis negotiis artifex dirus, unde ei Catenae inditum est cognomentum, vicarium ipsum eos quibus praeerat adhuc defensantem ad sortem periculorum communium traxit. et instabat ut eum quoque cum tribunis et aliis pluribus ad comitatum imperatoris vinctum perduceret: quo percitus ille exitio urgente abrupto ferro eundem adoritur Paulum. et quia languente dextera, letaliter ferire non potuit, iam districtum mucronem in proprium latus inpegit. hocque deformi genere mortis excessit e vita iustissimus rector ausus miserabiles casus levare multorum. Denique Antiochensis ordinis vertices sub uno elogio iussit occidi ideo efferatus, quod ei celebrari vilitatem intempestivam urgenti, cum inpenderet inopia, gravius rationabili responderunt; et perissent ad unum ni comes orientis tunc Honoratus fixa constantia restitisset.','2019-01-14 15:27:29.180807',2,65500.00,'2019-01-21 01:22:10.000000',1),(4,'All street green trees','Haec subinde Constantius audiens et quaedam referente Thalassio doctus, quem eum odisse iam conpererat lege communi, scribens ad Caesarem blandius adiumenta paulatim illi subtraxit, sollicitari se simulans ne, uti est militare otium fere tumultuosum, in eius perniciem conspiraret, solisque scholis iussit esse contentum palatinis et protectorum cum Scutariis et Gentilibus, et mandabat Domitiano, ex comite largitionum, praefecto ut cum in Syriam venerit, Gallum, quem crebro acciverat, ad Italiam properare blande hortaretur et verecunde.\r\n\r\nDenique Antiochensis ordinis vertices sub uno elogio iussit occidi ideo efferatus, quod ei celebrari vilitatem intempestivam urgenti, cum inpenderet inopia, gravius rationabili responderunt; et perissent ad unum ni comes orientis tunc Honoratus fixa constantia restitisset.','2019-01-14 15:28:52.422640',4,18500.00,NULL,0),(5,'Save our planet from waste','Martinus agens illas provincias pro praefectis aerumnas innocentium graviter gemens saepeque obsecrans,  ut ab omni culpa inmunibus parceretur, cum non inpetraret, minabatur se discessurum: ut saltem id metuens perquisitor malivolus tandem desineret quieti coalitos homines in aperta pericula proiectare.\r\nDenique Antiochensis ordinis vertices sub uno elogio iussit occidi ideo efferatus, quod ei celebrari vilitatem intempestivam urgenti, cum inpenderet inopia, gravius rationabili responderunt; et perissent ad unum ni comes orientis tunc Honoratus fixa constantia restitisset.','2019-01-15 22:26:42.410295',2,75000.00,NULL,0),(6,'Unwasted ocean','Denique Antiochensis ordinis vertices sub uno elogio iussit occidi ideo efferatus, quod ei celebrari vilitatem intempestivam urgenti, cum inpenderet inopia, gravius rationabili responderunt; et perissent ad unum ni comes orientis tunc Honoratus fixa constantia restitisset.\r\ngravius rationabili responderunt; et perissent ad unum ni comes orientis tunc Honoratus fixa constantia restitisset. Denique Antiochensis ordinis vertices sub uno elogio iussit occidi ideo efferatus, quod ei celebrari vilitatem intempestivam urgenti, cum inpenderet inopia.','2019-01-15 22:28:11.548026',2,50000.00,NULL,0),(7,'Our planet is bleding','Haec subinde Constantius audiens et quaedam referente Thalassio doctus, quem eum odisse iam conpererat lege communi, scribens ad Caesarem blandius adiumenta paulatim illi subtraxit, sollicitari se simulans ne, uti est militare otium fere tumultuosum, in eius perniciem conspiraret, solisque scholis iussit esse contentum palatinis et protectorum cum Scutariis et Gentilibus, et mandabat Domitiano, ex comite largitionum, praefecto ut cum in Syriam venerit, Gallum, quem crebro acciverat, ad Italiam properare blande hortaretur et verecunde','2019-01-15 23:17:00.312893',4,150000.00,NULL,0);
/*!40000 ALTER TABLE `projets_projet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `registration_registrationprofile`
--

DROP TABLE IF EXISTS `registration_registrationprofile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `registration_registrationprofile` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `activation_key` varchar(40) NOT NULL,
  `user_id` int(11) NOT NULL,
  `activated` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `registration_registr_user_id_5fcbf725_fk_auth_user` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `registration_registrationprofile`
--

LOCK TABLES `registration_registrationprofile` WRITE;
/*!40000 ALTER TABLE `registration_registrationprofile` DISABLE KEYS */;
INSERT INTO `registration_registrationprofile` VALUES (1,'c363865d5f86cd536255f2a5f629c9ef443f9240',3,0),(2,'1d2338ac7a6df57cc5575a3234aad7d2680b667a',4,0);
/*!40000 ALTER TABLE `registration_registrationprofile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `registration_supervisedregistrationprofile`
--

DROP TABLE IF EXISTS `registration_supervisedregistrationprofile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `registration_supervisedregistrationprofile` (
  `registrationprofile_ptr_id` int(11) NOT NULL,
  PRIMARY KEY (`registrationprofile_ptr_id`),
  CONSTRAINT `registration_supervi_registrationprofile__0a59f3b2_fk_registrat` FOREIGN KEY (`registrationprofile_ptr_id`) REFERENCES `registration_registrationprofile` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `registration_supervisedregistrationprofile`
--

LOCK TABLES `registration_supervisedregistrationprofile` WRITE;
/*!40000 ALTER TABLE `registration_supervisedregistrationprofile` DISABLE KEYS */;
/*!40000 ALTER TABLE `registration_supervisedregistrationprofile` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-01-21 18:18:33

