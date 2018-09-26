-- MySQL dump 10.13  Distrib 8.0.12, for Win64 (x86_64)
--
-- Host: localhost    Database: grocerydb
-- ------------------------------------------------------
-- Server version	8.0.12

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
-- Table structure for table `groceryitems`
--

DROP TABLE IF EXISTS `groceryitems`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `groceryitems` (
  `ID` text,
  `Description` text,
  `lastSold` text,
  `ShelfLife` text,
  `Department` text,
  `Price` text,
  `Unit` text,
  `xFor` text,
  `Cost` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `groceryitems`
--

LOCK TABLES `groceryitems` WRITE;
/*!40000 ALTER TABLE `groceryitems` DISABLE KEYS */;
INSERT INTO `groceryitems` VALUES ('753542','banana','9/5/2017','4d','Produce',' $2.99 ','lb','1',' $0.44'),('321654','apples','9/6/2017','7d','Produce',' $1.49 ','lb','1',' $0.20'),('95175','Strawberry','9/7/2017','3d','Produce',' $2.49 ','lb','1',' $0.10'),('321753','onion','9/8/2017','9d','Produce',' $1.00 ','Each','1',' $0.05'),('987654','Tomato','9/9/2017','4d','Produce',' $2.35 ','lb','1',' $0.20'),('11122','grapes','9/10/2017','7d','Produce',' $4.00 ','lb','1',' $1.20'),('124872','Lettuce','9/11/2017','5d','Produce',' $0.79 ','lb','1',' $0.10'),('113','bread','9/12/2017','14d','Grocery',' $1.50 ','Each','1',' $0.12'),('1189','hamburger buns','9/13/2017','14d','Grocery',' $1.75 ','Each','1',' $0.14'),('12221','pasta sauce','9/14/2017','23d','Grocery',' $3.75 ','Each','1',' $1.00'),('1111','cheese slices','9/15/2017','20d','Grocery',' $2.68 ','Each','1',' $0.40'),('18939','sliced turkey','9/16/2017','20d','Grocery',' $3.29 ','Each','1',' $0.67'),('90879','tortilla chips','9/17/2017','45d','Grocery',' $1.99 ','Each','1',' $0.14'),('119290','cereal','9/18/2017','40d','Grocery',' $3.19 ','Each','1',' $0.19'),('4629464','canned vegtables','9/19/2017','200d','Grocery',' $1.89 ','Each','1',' $0.19'),('9000001','headache medicine','9/20/2017','365d','Pharmacy',' $4.89 ','Each','1',' $1.90'),('9000002','Migraine Medicine','9/21/2017','365d','Pharmacy',' $5.89 ','Each','1',' $1.90'),('9000003','Cold and Flu','9/22/2017','365d','Pharmacy',' $3.29 ','Each','1',' $1.90'),('9000004','Allegry Medicine','9/23/2017','365d','Pharmacy',' $3.00 ','Each','1',' $1.25'),('9000005','Pain','9/24/2017','365d','Pharmacy',' $2.89 ','Each','1',' $1.00');
/*!40000 ALTER TABLE `groceryitems` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grocerylist`
--

DROP TABLE IF EXISTS `grocerylist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `grocerylist` (
  `id` int(11) NOT NULL,
  `description` varchar(45) DEFAULT NULL,
  `last_sold` varchar(45) DEFAULT NULL,
  `shelf_life` varchar(45) DEFAULT NULL,
  `department` varchar(45) DEFAULT NULL,
  `price` varchar(45) DEFAULT NULL,
  `unit` varchar(45) DEFAULT NULL,
  `x_for` varchar(45) DEFAULT NULL,
  `cost` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grocerylist`
--

LOCK TABLES `grocerylist` WRITE;
/*!40000 ALTER TABLE `grocerylist` DISABLE KEYS */;
/*!40000 ALTER TABLE `grocerylist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `new_table`
--

DROP TABLE IF EXISTS `new_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `new_table` (
  `id` int(11) NOT NULL,
  `description` varchar(45) DEFAULT NULL,
  `last_sold` varchar(45) DEFAULT NULL,
  `shelf_life` varchar(45) DEFAULT NULL,
  `department` varchar(45) DEFAULT NULL,
  `price` varchar(45) DEFAULT NULL,
  `unit` varchar(45) DEFAULT NULL,
  `x_for` varchar(45) DEFAULT NULL,
  `cost` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `new_table`
--

LOCK TABLES `new_table` WRITE;
/*!40000 ALTER TABLE `new_table` DISABLE KEYS */;
/*!40000 ALTER TABLE `new_table` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-09-25 22:21:14
