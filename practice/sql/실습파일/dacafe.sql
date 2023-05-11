-- MariaDB dump 10.19  Distrib 10.4.26-MariaDB, for Linux (x86_64)
--
-- Host: localhost    Database: dacafe2
-- ------------------------------------------------------
-- Server version	10.4.26-MariaDB-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

DROP DATABASE IF EXISTS dacafe;
CREATE DATABASE dacafe;
USE dacafe;

--
-- Table structure for table `departments`
--

DROP TABLE IF EXISTS `departments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `departments` (
  `dept_id` int(11) NOT NULL,
  `dept_name` varchar(30) NOT NULL,
  `loc_id` int(11) NOT NULL,
  PRIMARY KEY (`dept_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departments`
--

LOCK TABLES `departments` WRITE;
/*!40000 ALTER TABLE `departments` DISABLE KEYS */;
INSERT INTO `departments` VALUES (10,'SALES_PARTNER',100),(20,'MANAGEMENT',100),(30,'ACCOUNTING',200),(40,'RESEARCH',500);
/*!40000 ALTER TABLE `departments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employees`
--

DROP TABLE IF EXISTS `employees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `employees` (
  `emp_id` int(11) NOT NULL,
  `emp_name` varchar(10) NOT NULL,
  `email` varchar(20) NOT NULL,
  `phone_number` varchar(20) DEFAULT NULL,
  `hire_date` char(8) NOT NULL,
  `salary` int(11) NOT NULL,
  `comm_pct` int(11) DEFAULT NULL,
  `manager_id` int(11) DEFAULT NULL,
  `dept_id` int(11) NOT NULL,
  PRIMARY KEY (`emp_id`),
  KEY `fk_employees_departments_dept_id` (`dept_id`),
  CONSTRAINT `fk_employees_departments_dept_id` FOREIGN KEY (`dept_id`) REFERENCES `departments` (`dept_id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employees`
--

LOCK TABLES `employees` WRITE;
/*!40000 ALTER TABLE `employees` DISABLE KEYS */;
INSERT INTO `employees` VALUES (7001,'Scott','scott@dacafe.kr','020-7578-1000','20200821',4500000,NULL,NULL,20),(7002,'Smith','smith@dacafe.kr','020-7578-1001','20200821',3600000,NULL,7001,20),(7003,'Johnson','johnson@dacafe.kr','020-7578-1002','20201004',4100000,NULL,7001,30),(7004,'Williams','williams@dacafe.kr','020-7578-1003','20201004',3800000,NULL,7003,30),(7005,'Brown','brown@dacafe.kr','020-7578-1004','20200821',5000000,80,7001,40),(7006,'Miller','miller@dacafe.kr','020-7578-1007','20210302',3000000,90,7005,40),(7007,'Jones','jones@dacafe.kr','020-7578-1005','20201004',3700000,50,7005,40),(7008,'Garcia','garcia@dacafe.kr','020-7578-1006','20201201',3600000,90,7005,40),(7100,'Davis','davis@dacafe.kr','020-7578-1008','20210302',4000000,60,7001,10),(7101,'Rodriguez','rodriguez@dacafe.kr','020-7578-1009','20210302',3500000,70,7100,10),(8001,'Martinez','martinez@dacafe.kr','020-7578-1010','20210302',3200000,80,7101,10),(8002,'Hernandez','hernandez@dacafe.kr','020-7578-1011','20210401',2450000,NULL,8001,10),(8003,'Lopez','lopez@dacafe.kr','020-7578-1012','20210401',2400000,NULL,8001,10),(8004,'Gonzalez','gonzalez@dacafe.kr','020-7578-1013','20210501',2400000,NULL,8001,10),(8005,'Wilson','wilson@dacafe.kr','020-7578-1014','20210501',2400000,NULL,8001,10),(8006,'Anderson','anderson@dacafe.kr','020-7578-1015','20210501',2450000,NULL,8001,10),(8007,'Thomas','thomas@dacafe.kr','020-7578-1016','20210501',2400000,NULL,8001,10),(8008,'Taylor','taylor@dacafe.kr','020-7578-1017','20210501',2400000,NULL,8001,10),(8009,'Moore','moore@dacafe.kr','020-7578-1018','20210501',2400000,NULL,8001,10),(8010,'Jackson','jackson@dacafe.kr','020-7578-1019','20210501',2500000,NULL,8001,10),(8012,'Martin','martin@dacafe.kr','020-7578-1020','20210721',2400000,NULL,8001,10),(8013,'Lee','lee@dacafe.kr','020-7578-1021','20210721',2400000,NULL,8001,10),(8014,'Perez','perez@dacafe.kr','020-7578-1022','20210721',2400000,NULL,8001,10),(8015,'Thompson','thompson@dacafe.kr','020-7578-1023','20210721',2300000,NULL,8001,10),(8016,'White','white@dacafe.kr','020-7578-1024','20210801',2300000,NULL,8001,10),(8018,'Harris','harris@dacafe.kr','020-7578-1025','20210801',2500000,NULL,8001,10),(8019,'Sanchez','sanchez@dacafe.kr','020-7578-1026','20210801',2300000,NULL,8001,10),(8020,'Clark','clark@dacafe.kr','020-7578-1027','20211001',2400000,NULL,8001,10),(8021,'Ramirez','ramirez@dacafe.kr','020-7578-1028','20211001',2400000,NULL,8001,10),(8022,'Lewis','lewis@dacafe.kr','020-7578-1029','20211001',2400000,NULL,8001,10),(8023,'Robinson','robinson@dacafe.kr','020-7578-1030','20211001',2500000,NULL,8001,10),(8025,'Walker','walker@dacafe.kr','020-7578-1031','20211001',2400000,NULL,8001,10),(8026,'Young','young@dacafe.kr','020-7578-1032','20211001',2400000,NULL,8001,10),(8027,'Allen','allen@dacafe.kr','020-7578-1033','20211001',2300000,NULL,8001,10),(8028,'King','king@dacafe.kr','020-7578-1034','20211201',2400000,NULL,8001,10),(8029,'Wright','wright@dacafe.kr','020-7578-1035','20211201',2600000,NULL,8001,10),(8030,'Scott','scott2@dacafe.kr','020-7578-1036','20211201',2400000,NULL,8001,10),(8031,'Torres','torres@dacafe.kr','020-7578-1037','20211201',2400000,NULL,8001,10);
/*!40000 ALTER TABLE `employees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `s_dept`
--

DROP TABLE IF EXISTS `s_dept`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_dept` (
  `deptno` int(11) NOT NULL,
  `dname` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `s_dept`
--

LOCK TABLES `s_dept` WRITE;
/*!40000 ALTER TABLE `s_dept` DISABLE KEYS */;
INSERT INTO `s_dept` VALUES (10,'HR'),(20,'Research'),(30,'Design'),(40,'Consulting');
/*!40000 ALTER TABLE `s_dept` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `s_emp`
--


DROP TABLE IF EXISTS `s_emp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_emp` (
  `empno` int(11) NOT NULL,
  `ename` varchar(10) NOT NULL,
  `hiredate` char(8) NOT NULL,
  `deptno` int(11) NOT NULL,
  `manager` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `s_emp`
--

LOCK TABLES `s_emp` WRITE;
/*!40000 ALTER TABLE `s_emp` DISABLE KEYS */;
INSERT INTO `s_emp` VALUES (1001,'임우진','20010104',10,''),(2001,'이지원','20020502',20,'1001'),(2100,'유소영','20101005',20,'2001'),(3001,'유아영','20040601',40,'1001'),(3100,'임소영','20111205',40,'3001'),(4001,'아롱별','20030805',30,'1001'),(4200,'기쁨해','20141111',30,'4001');
/*!40000 ALTER TABLE `s_emp` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-03-10 12:26:30
