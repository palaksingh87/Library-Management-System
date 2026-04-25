-- MySQL dump 10.13  Distrib 8.0.44, for Win64 (x86_64)
--
-- Host: localhost    Database: librarydb
-- ------------------------------------------------------
-- Server version	8.0.44

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
-- Table structure for table `book`
--

DROP TABLE IF EXISTS `book`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `book` (
  `Book_ID` int NOT NULL,
  `Title` varchar(100) DEFAULT NULL,
  `Author` varchar(100) DEFAULT NULL,
  `Publisher` varchar(100) DEFAULT NULL,
  `Category` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`Book_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `book`
--

LOCK TABLES `book` WRITE;
/*!40000 ALTER TABLE `book` DISABLE KEYS */;
INSERT INTO `book` VALUES (1,'Database Systems','Korth','McGraw Hill','Education'),(2,'Data Structures','Seymour Lipschutz','Schaum','Education'),(3,'Physics Fundamentals','Resnick','Wiley','Science'),(4,'Chemistry Basics','Morrison','Pearson','Science'),(5,'English Grammar','Wren & Martin','S Chand','Language'),(6,'Artificial Intelligence','Stuart Russell','Pearson','Technology'),(7,'Operating Systems','Galvin','Wiley','Technology'),(8,'Mathematics for Engineers','Grewal','Khanna Publishers','Education'),(9,'Biology Today','Trueman','Trueman Publications','Science');
/*!40000 ALTER TABLE `book` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fine`
--

DROP TABLE IF EXISTS `fine`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fine` (
  `Fine_ID` int NOT NULL,
  `Issue_ID` int DEFAULT NULL,
  `Fine_Amount` int DEFAULT NULL,
  `Payment_Status` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`Fine_ID`),
  KEY `Issue_ID` (`Issue_ID`),
  CONSTRAINT `fine_ibfk_1` FOREIGN KEY (`Issue_ID`) REFERENCES `issue` (`Issue_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fine`
--

LOCK TABLES `fine` WRITE;
/*!40000 ALTER TABLE `fine` DISABLE KEYS */;
INSERT INTO `fine` VALUES (1,1,50,'Paid'),(2,2,30,'Pending'),(3,3,20,'Paid'),(4,4,40,'Pending'),(5,6,60,'Pending'),(6,7,10,'Paid');
/*!40000 ALTER TABLE `fine` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `issue`
--

DROP TABLE IF EXISTS `issue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `issue` (
  `Issue_ID` int NOT NULL,
  `Book_ID` int DEFAULT NULL,
  `Member_ID` int DEFAULT NULL,
  `Issue_Date` date DEFAULT NULL,
  `Return_Date` date DEFAULT NULL,
  PRIMARY KEY (`Issue_ID`),
  KEY `Book_ID` (`Book_ID`),
  KEY `Member_ID` (`Member_ID`),
  CONSTRAINT `issue_ibfk_1` FOREIGN KEY (`Book_ID`) REFERENCES `book` (`Book_ID`),
  CONSTRAINT `issue_ibfk_2` FOREIGN KEY (`Member_ID`) REFERENCES `member` (`Member_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `issue`
--

LOCK TABLES `issue` WRITE;
/*!40000 ALTER TABLE `issue` DISABLE KEYS */;
INSERT INTO `issue` VALUES (1,1,101,'2026-03-01','2026-03-10'),(2,3,102,'2026-03-05','2026-03-25'),(3,2,103,'2026-03-07','2026-03-15'),(4,4,104,'2026-03-10',NULL),(5,6,101,'2026-03-12','2026-03-20'),(6,7,106,'2026-03-15',NULL),(7,8,107,'2026-03-16','2026-03-22'),(8,9,108,'2026-03-18',NULL);
/*!40000 ALTER TABLE `issue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `librarian`
--

DROP TABLE IF EXISTS `librarian`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `librarian` (
  `Librarian_ID` int NOT NULL,
  `Name` varchar(100) DEFAULT NULL,
  `Contact_Number` varchar(15) DEFAULT NULL,
  `Email` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`Librarian_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `librarian`
--

LOCK TABLES `librarian` WRITE;
/*!40000 ALTER TABLE `librarian` DISABLE KEYS */;
INSERT INTO `librarian` VALUES (1,'Anita Mehra','9998887776','anita@library.com'),(2,'Rajesh Kumar','8887776665','rajesh@library.com'),(3,'Neha Kapoor','9870001112','neha@library.com');
/*!40000 ALTER TABLE `librarian` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `member`
--

DROP TABLE IF EXISTS `member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `member` (
  `Member_ID` int NOT NULL,
  `Name` varchar(100) DEFAULT NULL,
  `Contact_Number` varchar(15) DEFAULT NULL,
  `Email` varchar(100) DEFAULT NULL,
  `Membership_Date` date DEFAULT NULL,
  PRIMARY KEY (`Member_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `member`
--

LOCK TABLES `member` WRITE;
/*!40000 ALTER TABLE `member` DISABLE KEYS */;
INSERT INTO `member` VALUES (101,'Rahul Sharma','9876543210','rahul@gmail.com','2023-01-15'),(102,'Priya Singh','9876501234','priya@gmail.com','2022-12-10'),(103,'Amit Verma','9123456780','amit@gmail.com','2024-02-20'),(104,'Sneha Gupta','9988776655','sneha@gmail.com','2023-05-25'),(105,'Rohit Kumar','9871234567','rohit@gmail.com','2021-11-11'),(106,'Karan Malhotra','9812345678','karan@gmail.com','2024-01-10'),(107,'Anjali Mehta','9823456789','anjali@gmail.com','2023-07-18'),(108,'Vikas Yadav','9834567890','vikas@gmail.com','2022-09-05');
/*!40000 ALTER TABLE `member` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-04-21 20:15:45
