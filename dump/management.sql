-- MariaDB dump 10.19  Distrib 10.9.3-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: management
-- ------------------------------------------------------
-- Server version	10.9.3-MariaDB-1:10.9.3+maria~ubu2204-log

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

--
-- Table structure for table `code`
--

DROP TABLE IF EXISTS `code`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `code` (
  `id` int(11) NOT NULL,
  `grp` varchar(10) NOT NULL,
  `class` varchar(10) NOT NULL,
  `name` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `code`
--

LOCK TABLES `code` WRITE;
/*!40000 ALTER TABLE `code` DISABLE KEYS */;
INSERT INTO `code` VALUES
(1,'부서','100','경영지원'),
(2,'부서','200','영업'),
(3,'부서','300','홍보'),
(4,'부서','400','인사'),
(5,'부서','500','유통'),
(6,'고객등급','MS001','GOLD'),
(7,'고객등급','MS002','SILVER'),
(8,'고객등급','MS003','BRONZE'),
(9,'고객등급','MS004','FAMILY'),
(10,'상품구분','F','음식'),
(11,'상품구분','E','전자제품'),
(12,'상품구분','A','사무용품'),
(13,'상품구분','C','화장품'),
(14,'상품구분','Z','가구'),
(15,'상품구분','S','문구'),
(16,'상품구분','B','책');
/*!40000 ALTER TABLE `code` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer` (
  `id` int(11) NOT NULL,
  `name` varchar(10) NOT NULL,
  `phone` varchar(50) NOT NULL,
  `address` varchar(50) NOT NULL,
  `age` int(11) NOT NULL,
  `rank` varchar(50) NOT NULL,
  `emp_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES
(1,'김승재','010-2222-2222','서울특별시 강남구',50,'MS001',1709),
(2,'윤지우','010-5555-5555','서울특별시 마포구',30,'MS001',1709),
(3,'박보검','010-1234-1234','서울특별시 성북구',25,'MS002',1709),
(4,'송강','010-3333-3333','서울특별시 마포구',28,'MS004',1709),
(5,'송혜교','010-9999-9999','서울특별시 서초구',29,'MS002',1205),
(6,'김수민','010-6666-6666','부산광역시 중구',31,'MS003',1205),
(7,'한소희','010-1111-1111','대전광역시 유성구',36,'MS001',1205),
(8,'구민수','010-8888-8888','대구광역시 중구',45,'MS004',1205),
(9,'홍수민','010-7777-7777','울산광역시 남구',61,'MS004',906),
(10,'김민정','010-0000-0000','인천광역시 남동구',49,'MS002',906),
(11,'임성빈','010-1111-2222','수원시 장안구',27,'MS004',906),
(12,'유재석','010-1111-3333','서울특별시 용산구',50,'MS003',906),
(13,'김태연','010-2222-1111','서울특별시 서대문구',30,'MS004',9901),
(14,'유연석','010-1111-4444','서울특별시 양천구',34,'MS004',9901),
(15,'이유나','010-5555-9999','광주광역시 서구',22,'MS004',9901),
(16,'강민경','010-6666-3333','세종특별자치시 보람동',25,'MS001',9901),
(17,'백예린','010-7777-2222','대구광역시 동구',21,'MS003',2012),
(18,'전지현','010-8888-5555','부산광역시 영도구',56,'MS004',2012),
(19,'김수현','010-9999-1111','부산광역시 해운대구',67,'MS002',2012),
(20,'권지용','010-2222-8888','대구광역시 동구',39,'MS002',2012);
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `employee` (
  `id` int(11) NOT NULL,
  `code` int(11) NOT NULL,
  `name` varchar(10) NOT NULL,
  `rank` varchar(10) NOT NULL,
  `sex` varchar(10) NOT NULL,
  `s_date` varchar(20) NOT NULL,
  `dept_code` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES
(1,1709,'차은우','대리','남','2017-09-08',100),
(2,1205,'정우성','과장','남','2012-05-12',400),
(3,906,'송중기','차장','남','2009-06-15',300),
(4,9901,'김혜수','부장','여','1999-01-05',500),
(5,2012,'송소희','인턴','여','2020-12-27',200);
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product` (
  `id` int(11) NOT NULL,
  `name` varchar(20) NOT NULL,
  `grp` varchar(10) NOT NULL,
  `price` int(11) NOT NULL,
  `inventory` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES
(1,'민트초코아이스크림','F',1000,230),
(2,'파인애플피자','F',9000,300),
(3,'스마트폰','E',1060000,250),
(4,'블루투스 이어폰','E',230000,1000),
(5,'블루투스 램프','E',15000,300),
(6,'곱창전골 밀키트','F',18500,200),
(7,'굴림만두','F',9750,150),
(8,'무풍 에어컨','E',1679000,50),
(9,'커피머신','E',257000,120),
(10,'와플메이커','E',35000,80),
(11,'텀블러','A',12000,95),
(12,'노트북','E',1869000,30),
(13,'핸드폰 충전기','E',14400,200),
(14,'키보드','E',55000,100),
(15,'무선 이어폰','E',8500,90),
(16,'소설책','B',12000,100),
(17,'맥주','F',3500,52),
(18,'기저귀','A',30600,80),
(19,'물티슈','A',8300,100),
(20,'립스틱','C',45000,25),
(21,'드라이기','A',19900,70),
(22,'화장솜','C',5500,180),
(23,'마우스','E',3460,50),
(24,'카페트','Z',75000,90),
(25,'암체어','Z',39900,100),
(26,'독서등','Z',58410,205),
(27,'안마의자','Z',4200000,15),
(28,'가발','A',66500,23),
(29,'호빵','F',17010,401),
(30,'시계','A',480000,27),
(31,'신라면','F',750,105),
(32,'커피원두','F',7900,80),
(33,'믹스커피','F',5400,76),
(34,'녹차티백세트','F',8070,300),
(35,'핸드크림','A',15000,155),
(36,'두루마리휴지','A',12050,90),
(37,'삼색볼펜','S',700,100),
(38,'초코칩','F',13450,302),
(39,'캠핑텐트','A',79400,101),
(40,'만화책','B',9500,150),
(41,'자격증책','B',12500,170),
(42,'마스카라','C',17700,29),
(43,'노트','S',870,112),
(44,'크레파스','S',3500,257),
(45,'지우개','S',500,503);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `purchase`
--

DROP TABLE IF EXISTS `purchase`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `purchase` (
  `id` int(11) NOT NULL,
  `cst_id` int(11) NOT NULL,
  `prd_id` int(11) NOT NULL,
  `num` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `purchase`
--

LOCK TABLES `purchase` WRITE;
/*!40000 ALTER TABLE `purchase` DISABLE KEYS */;
INSERT INTO `purchase` VALUES
(1,1,6,1),
(2,1,1,2),
(3,2,4,20),
(4,3,12,2),
(5,4,19,5),
(6,5,25,2),
(7,6,18,10),
(8,7,22,6),
(9,6,23,30),
(10,9,20,4),
(11,10,21,5),
(12,2,5,3),
(13,7,20,1),
(14,4,40,2),
(15,4,41,1),
(16,5,43,1),
(17,5,44,3),
(18,5,45,1),
(19,1,8,2),
(20,10,3,2),
(21,7,27,1),
(22,5,30,2),
(23,1,39,3),
(24,1,3,1),
(25,9,35,3),
(26,2,3,1),
(27,2,23,3),
(28,3,4,1),
(29,7,34,2),
(30,7,39,1),
(31,3,34,1),
(32,8,7,1),
(33,11,34,1),
(34,12,9,2),
(35,16,27,1),
(36,15,20,1),
(37,15,22,5),
(38,20,4,1),
(39,20,5,2),
(40,20,12,2),
(41,18,1,10),
(42,18,2,20),
(43,12,13,3),
(44,11,31,3),
(45,17,39,1),
(46,17,28,2),
(47,17,11,10),
(48,19,14,1),
(49,19,12,1),
(50,12,10,3),
(51,13,17,2),
(52,14,19,1),
(53,6,30,1),
(54,17,30,1),
(55,18,6,2);
/*!40000 ALTER TABLE `purchase` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-12-04 13:42:27
