-- MySQL dump 10.13  Distrib 5.7.38, for Linux (x86_64)
--
-- Host: localhost    Database: apninaukriappv4
-- ------------------------------------------------------
-- Server version	5.7.38-0ubuntu0.18.04.1

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
-- Table structure for table `accounts_user`
--

DROP TABLE IF EXISTS `accounts_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `accounts_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `role` varchar(12) NOT NULL,
  `gender` varchar(10) DEFAULT NULL,
  `email` varchar(254) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts_user`
--

LOCK TABLES `accounts_user` WRITE;
/*!40000 ALTER TABLE `accounts_user` DISABLE KEYS */;
INSERT INTO `accounts_user` VALUES (1,'pbkdf2_sha256$260000$q3C825XFVsNRvNr0yzYMhP$ofYp2K0AjotjVfVmLeBmDDM7VtkMurJ5TyDYQ1pN6Kw=','2022-05-13 11:37:25.435757',0,'Neeraj','Singh',0,1,'2022-05-13 04:48:38.962697','employee','male','neeraj@gmail.com'),(2,'pbkdf2_sha256$260000$OR6rFkWobFUOaEDacmqVFY$lgsEaMoOheRDI4ZllusZ1yho+vY53bvRobt5zfkPUNQ=','2022-05-13 11:37:58.991945',0,'Google LLC','Google LLC Pvt. Ltd',0,1,'2022-05-13 04:50:18.564774','employer','','careers@google.com'),(3,'pbkdf2_sha256$260000$LkrgxSgW3Lw4OiGQboG1WC$BKMFRL+yiT31CU6vYGGQ/D55QiqMtuH4tEoOKzn0jjs=','2022-05-13 09:29:20.330105',0,'Amazon India PVT LTD','Noida',0,1,'2022-05-13 09:28:40.940545','employer','','careers@amazon.com'),(4,'pbkdf2_sha256$260000$CuSKUI0YlD7wb17F1D1PPl$mSeUzrP7DeLJjggLmcg+npfMrCRcBWsqoin5rwnwcbQ=','2022-05-14 05:43:18.254800',1,'','',1,1,'2022-05-14 05:42:03.972186','','','devil@darkweb.net');
/*!40000 ALTER TABLE `accounts_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `accounts_user_groups`
--

DROP TABLE IF EXISTS `accounts_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `accounts_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `accounts_user_groups_user_id_group_id_59c0b32f_uniq` (`user_id`,`group_id`),
  KEY `accounts_user_groups_group_id_bd11a704_fk_auth_group_id` (`group_id`),
  CONSTRAINT `accounts_user_groups_group_id_bd11a704_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `accounts_user_groups_user_id_52b62117_fk_accounts_user_id` FOREIGN KEY (`user_id`) REFERENCES `accounts_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts_user_groups`
--

LOCK TABLES `accounts_user_groups` WRITE;
/*!40000 ALTER TABLE `accounts_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `accounts_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `accounts_user_user_permissions`
--

DROP TABLE IF EXISTS `accounts_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `accounts_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `accounts_user_user_permi_user_id_permission_id_2ab516c2_uniq` (`user_id`,`permission_id`),
  KEY `accounts_user_user_p_permission_id_113bb443_fk_auth_perm` (`permission_id`),
  CONSTRAINT `accounts_user_user_p_permission_id_113bb443_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `accounts_user_user_p_user_id_e4f0a161_fk_accounts_` FOREIGN KEY (`user_id`) REFERENCES `accounts_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts_user_user_permissions`
--

LOCK TABLES `accounts_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `accounts_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `accounts_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add content type',4,'add_contenttype'),(14,'Can change content type',4,'change_contenttype'),(15,'Can delete content type',4,'delete_contenttype'),(16,'Can view content type',4,'view_contenttype'),(17,'Can add session',5,'add_session'),(18,'Can change session',5,'change_session'),(19,'Can delete session',5,'delete_session'),(20,'Can view session',5,'view_session'),(21,'Can add job',6,'add_job'),(22,'Can change job',6,'change_job'),(23,'Can delete job',6,'delete_job'),(24,'Can view job',6,'view_job'),(25,'Can add applicant',7,'add_applicant'),(26,'Can change applicant',7,'change_applicant'),(27,'Can delete applicant',7,'delete_applicant'),(28,'Can view applicant',7,'view_applicant'),(29,'Can add user',8,'add_user'),(30,'Can change user',8,'change_user'),(31,'Can delete user',8,'delete_user'),(32,'Can view user',8,'view_user');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
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
  KEY `django_admin_log_user_id_c564eba6_fk_accounts_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_accounts_user_id` FOREIGN KEY (`user_id`) REFERENCES `accounts_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (8,'accounts','user'),(1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'contenttypes','contenttype'),(7,'jobsapp','applicant'),(6,'jobsapp','job'),(5,'sessions','session');
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
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2022-05-13 04:45:36.090424'),(2,'contenttypes','0002_remove_content_type_name','2022-05-13 04:45:36.276863'),(3,'auth','0001_initial','2022-05-13 04:45:36.723660'),(4,'auth','0002_alter_permission_name_max_length','2022-05-13 04:45:36.751413'),(5,'auth','0003_alter_user_email_max_length','2022-05-13 04:45:36.773780'),(6,'auth','0004_alter_user_username_opts','2022-05-13 04:45:36.793807'),(7,'auth','0005_alter_user_last_login_null','2022-05-13 04:45:36.812917'),(8,'auth','0006_require_contenttypes_0002','2022-05-13 04:45:36.818232'),(9,'auth','0007_alter_validators_add_error_messages','2022-05-13 04:45:36.838196'),(10,'auth','0008_alter_user_username_max_length','2022-05-13 04:45:36.858530'),(11,'auth','0009_alter_user_last_name_max_length','2022-05-13 04:45:36.876359'),(12,'accounts','0001_initial','2022-05-13 04:45:37.266488'),(13,'accounts','0002_auto_20190326_1754','2022-05-13 04:45:37.346641'),(14,'admin','0001_initial','2022-05-13 04:45:37.535960'),(15,'admin','0002_logentry_remove_auto_add','2022-05-13 04:45:37.565333'),(16,'admin','0003_logentry_add_action_flag_choices','2022-05-13 04:45:37.594724'),(17,'auth','0010_alter_group_name_max_length','2022-05-13 04:45:37.627748'),(18,'auth','0011_update_proxy_permissions','2022-05-13 04:45:37.656591'),(19,'auth','0012_alter_user_first_name_max_length','2022-05-13 04:45:37.687433'),(20,'jobsapp','0001_initial','2022-05-13 04:45:37.808153'),(21,'jobsapp','0002_auto_20190405_1920','2022-05-13 04:45:37.838675'),(22,'jobsapp','0003_job_created_at','2022-05-13 04:45:37.936703'),(23,'jobsapp','0004_job_filled','2022-05-13 04:45:38.005842'),(24,'jobsapp','0005_applicant','2022-05-13 04:45:38.173526'),(25,'jobsapp','0006_auto_20190408_2005','2022-05-13 04:45:38.207617'),(26,'sessions','0001_initial','2022-05-13 04:45:38.265879');
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('5k3fetmed0k5q5h6r0za2v957msfohjs','.eJxVjDsOwjAQBe_iGlmx179Q0nMGa9dr4wBypDipEHeHSCmgfTPzXiLitta49bzEicVZaHH63QjTI7cd8B3bbZZpbusykdwVedAurzPn5-Vw_w4q9vqtB-cMaUMObQkDcuaAziflCaGAUwA2KK2TRQDlR1KmBO-ZfSojBaPF-wPWkDdz:1npTcN:Avw2_DpYGPru_BAZqxPWjhO0bdGtdkc1MtH6HHF1Ks4','2022-05-27 11:37:59.008444'),('nnpuujv0lhh9n5av08p30wt579fknunv','.eJxVjDsOwjAQBe_iGlnrzzoWJT1nsHazNg4gR4qTCnF3iJQC2jcz76USbWtNW89LmkSdlVen341pfOS2A7lTu816nNu6TKx3RR-06-ss-Xk53L-DSr1-ayqMBXMZQASyh-hdsBABiVBE2A7ROYgSWdBEZGeD8VQCC0EI2aj3B_HeN_E:1npkYg:1qVP3B9UVQ3SOK6RP05KdOFRff2gEqShSw9Yq40_hiY','2022-05-28 05:43:18.268385'),('r1e3sduo4mb03hep4moe917vtru4cc1q','.eJxVjDsOwjAQBe_iGlmx179Q0nMGa9dr4wBypDipEHeHSCmgfTPzXiLitta49bzEicVZaHH63QjTI7cd8B3bbZZpbusykdwVedAurzPn5-Vw_w4q9vqtB-cMaUMObQkDcuaAziflCaGAUwA2KK2TRQDlR1KmBO-ZfSojBaPF-wPWkDdz:1npNIr:pCqHvBnQ8256KCliqAT8yoL2nkKkG5-jjGbrvE_tFGo','2022-05-27 04:53:25.516995');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jobsapp_applicant`
--

DROP TABLE IF EXISTS `jobsapp_applicant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jobsapp_applicant` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) NOT NULL,
  `job_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobsapp_applicant_job_id_81cba015_fk_jobsapp_job_id` (`job_id`),
  KEY `jobsapp_applicant_user_id_98e0334b_fk_accounts_user_id` (`user_id`),
  CONSTRAINT `jobsapp_applicant_job_id_81cba015_fk_jobsapp_job_id` FOREIGN KEY (`job_id`) REFERENCES `jobsapp_job` (`id`),
  CONSTRAINT `jobsapp_applicant_user_id_98e0334b_fk_accounts_user_id` FOREIGN KEY (`user_id`) REFERENCES `accounts_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobsapp_applicant`
--

LOCK TABLES `jobsapp_applicant` WRITE;
/*!40000 ALTER TABLE `jobsapp_applicant` DISABLE KEYS */;
INSERT INTO `jobsapp_applicant` VALUES (1,'2022-05-13 07:48:24.360821',1,1);
/*!40000 ALTER TABLE `jobsapp_applicant` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jobsapp_job`
--

DROP TABLE IF EXISTS `jobsapp_job`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jobsapp_job` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(300) NOT NULL,
  `description` longtext NOT NULL,
  `location` varchar(150) NOT NULL,
  `type` varchar(10) NOT NULL,
  `category` varchar(100) NOT NULL,
  `last_date` datetime(6) NOT NULL,
  `company_name` varchar(100) NOT NULL,
  `company_description` varchar(300) NOT NULL,
  `website` varchar(100) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `filled` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobsapp_job_user_id_1dd0ffa8_fk_accounts_user_id` (`user_id`),
  CONSTRAINT `jobsapp_job_user_id_1dd0ffa8_fk_accounts_user_id` FOREIGN KEY (`user_id`) REFERENCES `accounts_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobsapp_job`
--

LOCK TABLES `jobsapp_job` WRITE;
/*!40000 ALTER TABLE `jobsapp_job` DISABLE KEYS */;
INSERT INTO `jobsapp_job` VALUES (1,'Software Engineer','Opening for Software Engineer in Google. \r\n\r\n-    Bachelor’s Degree in Software Engineering or Information Technology\r\n-   7+ years’ software development or programming experience\r\n-   Extensive experience with Java, Python, C++ and other programming languages\r\n-   In-depth understanding of HTML5, CSS3 and CMS.\r\n-   Team player attitude with a willingness to lead when necessary\r\n-   Devotion to continuing education on an annual basis\r\n-   Working knowledge of SQL','Bangalore','1','web-development','2022-06-30 00:00:00.000000','Google LLC PVT LTD','Google LLC is an American multinational technology company that focuses on artificial intelligence, search engine, online advertising, cloud computing, computer software, quantum computing, e-commerce, and consumer electronics','https://about.google/',2,'2022-05-13 05:09:51.847654',0),(2,'Software Design | Adobe','Urgently required a Software Design.\r\nDesign, develop and execute unit test plans, test designs, test cases and test strategies. Design, develop and execute subsystem test plans, procedures and processes. Document all test plans, test cases and strategies procedures and issues.','Noida','1','web-design','2022-05-31 00:00:00.000000','Adobe International Pvt Ltd','Adobe Inc., originally called Adobe Systems Incorporated, is an American multinational computer software company incorporated in Delaware and headquartered in San Jose, California.','https://www.adobe.com',2,'2022-05-13 08:54:50.177265',0);
/*!40000 ALTER TABLE `jobsapp_job` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-05-14 13:22:39
