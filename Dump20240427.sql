CREATE DATABASE  IF NOT EXISTS `banking_database_management` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `banking_database_management`;
-- MySQL dump 10.13  Distrib 8.0.36, for macos14 (arm64)
--
-- Host: localhost    Database: banking_database_management
-- ------------------------------------------------------
-- Server version	8.0.36

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
-- Table structure for table `Accounts`
--

DROP TABLE IF EXISTS `Accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Accounts` (
  `AccountID` int NOT NULL AUTO_INCREMENT,
  `CustomerID` int NOT NULL,
  `AccountTypeID` int NOT NULL,
  `AccountStatusID` int NOT NULL,
  `Balance` decimal(10,2) NOT NULL DEFAULT '0.00',
  `DateOpened` datetime NOT NULL,
  `DateClosed` datetime DEFAULT NULL,
  PRIMARY KEY (`AccountID`),
  KEY `CustomerID` (`CustomerID`),
  KEY `AccountTypeID` (`AccountTypeID`),
  KEY `AccountStatusID` (`AccountStatusID`),
  CONSTRAINT `accounts_ibfk_1` FOREIGN KEY (`CustomerID`) REFERENCES `Customers` (`CustomerID`),
  CONSTRAINT `accounts_ibfk_2` FOREIGN KEY (`AccountTypeID`) REFERENCES `AccountTypes` (`AccountTypeID`),
  CONSTRAINT `accounts_ibfk_3` FOREIGN KEY (`AccountStatusID`) REFERENCES `AccountStatus` (`StatusID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Accounts`
--

LOCK TABLES `Accounts` WRITE;
/*!40000 ALTER TABLE `Accounts` DISABLE KEYS */;
INSERT INTO `Accounts` VALUES (1,1,1,1,1000.00,'2024-04-26 10:07:05',NULL),(2,2,2,1,500.00,'2024-04-26 10:07:05',NULL),(3,3,1,1,1500.00,'2024-04-26 10:07:05',NULL);
/*!40000 ALTER TABLE `Accounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AccountStatus`
--

DROP TABLE IF EXISTS `AccountStatus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AccountStatus` (
  `StatusID` int NOT NULL AUTO_INCREMENT,
  `StatusName` varchar(50) NOT NULL,
  PRIMARY KEY (`StatusID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AccountStatus`
--

LOCK TABLES `AccountStatus` WRITE;
/*!40000 ALTER TABLE `AccountStatus` DISABLE KEYS */;
INSERT INTO `AccountStatus` VALUES (1,'Active'),(2,'Closed');
/*!40000 ALTER TABLE `AccountStatus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AccountTypes`
--

DROP TABLE IF EXISTS `AccountTypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AccountTypes` (
  `AccountTypeID` int NOT NULL AUTO_INCREMENT,
  `TypeName` varchar(50) NOT NULL,
  `InterestRate` decimal(5,2) NOT NULL,
  PRIMARY KEY (`AccountTypeID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AccountTypes`
--

LOCK TABLES `AccountTypes` WRITE;
/*!40000 ALTER TABLE `AccountTypes` DISABLE KEYS */;
INSERT INTO `AccountTypes` VALUES (1,'Savings Account',0.50),(2,'Checking Account',0.10),(3,'Fixed Deposit Account',2.00);
/*!40000 ALTER TABLE `AccountTypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `branchemployees`
--

DROP TABLE IF EXISTS `branchemployees`;
/*!50001 DROP VIEW IF EXISTS `branchemployees`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `branchemployees` AS SELECT 
 1 AS `BranchID`,
 1 AS `BranchName`,
 1 AS `Location`,
 1 AS `EmployeeID`,
 1 AS `EmployeeName`,
 1 AS `DateOfBirth`,
 1 AS `PhoneNumber`,
 1 AS `Email`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `Branches`
--

DROP TABLE IF EXISTS `Branches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Branches` (
  `BranchID` int NOT NULL AUTO_INCREMENT,
  `BranchName` varchar(100) NOT NULL,
  `Location` varchar(100) NOT NULL,
  PRIMARY KEY (`BranchID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Branches`
--

LOCK TABLES `Branches` WRITE;
/*!40000 ALTER TABLE `Branches` DISABLE KEYS */;
INSERT INTO `Branches` VALUES (1,'Main Branch','Boston'),(2,'Downtown Branch','New Jersey'),(3,'Seaport branch','Maryland');
/*!40000 ALTER TABLE `Branches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Customers`
--

DROP TABLE IF EXISTS `Customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Customers` (
  `CustomerID` int NOT NULL AUTO_INCREMENT,
  `FirstName` varchar(50) NOT NULL,
  `LastName` varchar(50) NOT NULL,
  `DateOfBirth` date NOT NULL,
  `PhoneNumber` varchar(15) DEFAULT NULL,
  `Email` varchar(100) NOT NULL,
  `Address` varchar(255) NOT NULL,
  `City` varchar(100) NOT NULL,
  `State` varchar(100) NOT NULL,
  `ZipCode` varchar(20) NOT NULL,
  `Password` varchar(255) NOT NULL,
  PRIMARY KEY (`CustomerID`),
  UNIQUE KEY `Email` (`Email`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Customers`
--

LOCK TABLES `Customers` WRITE;
/*!40000 ALTER TABLE `Customers` DISABLE KEYS */;
INSERT INTO `Customers` VALUES (1,'Richard','Webber','1990-03-25','111222333','richard.webber@gmail.com','123 Main St','New York','NY','10001','password123'),(2,'Jackson','Avery','1988-07-12','444555666','jackson.avery@gmail.com','456 Walnut St','Los Angeles','CA','90001','password456'),(3,'April','Kepner','1975-11-30','777888999','april.kepner@gmail.com','789 Oakland St','Chicago','IL','60601','password789');
/*!40000 ALTER TABLE `Customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Employees`
--

DROP TABLE IF EXISTS `Employees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Employees` (
  `EmployeeID` int NOT NULL AUTO_INCREMENT,
  `FirstName` varchar(50) NOT NULL,
  `LastName` varchar(50) NOT NULL,
  `DateOfBirth` date NOT NULL,
  `PhoneNumber` varchar(15) DEFAULT NULL,
  `Email` varchar(100) NOT NULL,
  `BranchID` int NOT NULL,
  PRIMARY KEY (`EmployeeID`),
  UNIQUE KEY `Email` (`Email`),
  KEY `BranchID` (`BranchID`),
  CONSTRAINT `employees_ibfk_1` FOREIGN KEY (`BranchID`) REFERENCES `Branches` (`BranchID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Employees`
--

LOCK TABLES `Employees` WRITE;
/*!40000 ALTER TABLE `Employees` DISABLE KEYS */;
INSERT INTO `Employees` VALUES (1,'Meredith','Grey','1980-05-15','123456789','mer.grey@.gmailcom',1),(2,'Alex','Karev','1985-08-22','987654321','alex.karev@gmailcom',2),(3,'Izzie','Stevens','1976-12-10','555555555','izzie.stevens@gmail.com',3);
/*!40000 ALTER TABLE `Employees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `LoanPayments`
--

DROP TABLE IF EXISTS `LoanPayments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `LoanPayments` (
  `PaymentID` int NOT NULL AUTO_INCREMENT,
  `LoanID` int NOT NULL,
  `Amount` decimal(10,2) NOT NULL,
  `PaymentDate` datetime NOT NULL,
  PRIMARY KEY (`PaymentID`),
  KEY `LoanID` (`LoanID`),
  CONSTRAINT `loanpayments_ibfk_1` FOREIGN KEY (`LoanID`) REFERENCES `Loans` (`LoanID`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `LoanPayments`
--

LOCK TABLES `LoanPayments` WRITE;
/*!40000 ALTER TABLE `LoanPayments` DISABLE KEYS */;
INSERT INTO `LoanPayments` VALUES (1,1,500.00,'2024-04-26 10:07:05'),(2,2,1000.00,'2024-04-26 10:07:05'),(3,3,200.00,'2024-04-26 10:07:05'),(4,1,500.00,'2024-04-26 10:07:05'),(5,2,1000.00,'2024-04-26 10:07:05'),(6,2,2000.00,'2024-04-26 10:07:05'),(7,3,200.00,'2024-04-26 10:07:05');
/*!40000 ALTER TABLE `LoanPayments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Loans`
--

DROP TABLE IF EXISTS `Loans`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Loans` (
  `LoanID` int NOT NULL AUTO_INCREMENT,
  `CustomerID` int NOT NULL,
  `LoanTypeID` int NOT NULL,
  `Amount` decimal(10,2) NOT NULL,
  `DateApplied` datetime NOT NULL,
  `Status` enum('Pending','Approved','Rejected') NOT NULL,
  PRIMARY KEY (`LoanID`),
  KEY `CustomerID` (`CustomerID`),
  KEY `LoanTypeID` (`LoanTypeID`),
  CONSTRAINT `loans_ibfk_1` FOREIGN KEY (`CustomerID`) REFERENCES `Customers` (`CustomerID`),
  CONSTRAINT `loans_ibfk_2` FOREIGN KEY (`LoanTypeID`) REFERENCES `LoanTypes` (`LoanTypeID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Loans`
--

LOCK TABLES `Loans` WRITE;
/*!40000 ALTER TABLE `Loans` DISABLE KEYS */;
INSERT INTO `Loans` VALUES (1,1,1,10000.00,'2024-04-26 10:07:05','Pending'),(2,2,2,200000.00,'2024-04-26 10:07:05','Approved'),(3,3,3,5000.00,'2024-04-26 10:07:05','Rejected');
/*!40000 ALTER TABLE `Loans` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `loanstatus`
--

DROP TABLE IF EXISTS `loanstatus`;
/*!50001 DROP VIEW IF EXISTS `loanstatus`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `loanstatus` AS SELECT 
 1 AS `LoanID`,
 1 AS `CustomerName`,
 1 AS `LoanTypeName`,
 1 AS `LoanAmount`,
 1 AS `DateApplied`,
 1 AS `Status`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `LoanTypes`
--

DROP TABLE IF EXISTS `LoanTypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `LoanTypes` (
  `LoanTypeID` int NOT NULL AUTO_INCREMENT,
  `LoanTypeName` varchar(100) NOT NULL,
  `InterestRate` decimal(5,2) NOT NULL,
  PRIMARY KEY (`LoanTypeID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `LoanTypes`
--

LOCK TABLES `LoanTypes` WRITE;
/*!40000 ALTER TABLE `LoanTypes` DISABLE KEYS */;
INSERT INTO `LoanTypes` VALUES (1,'Personal Loan',8.50),(2,'Home Loan',6.00),(3,'Student Loan',7.00);
/*!40000 ALTER TABLE `LoanTypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TransactionFees`
--

DROP TABLE IF EXISTS `TransactionFees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `TransactionFees` (
  `TransactionFeeID` int NOT NULL,
  `TransactionID` int NOT NULL,
  `TransactionType` enum('Deposit','Withdrawal','Transfer') NOT NULL,
  `Fee` decimal(10,2) NOT NULL,
  PRIMARY KEY (`TransactionFeeID`),
  KEY `TransactionID` (`TransactionID`),
  CONSTRAINT `transactionfees_ibfk_1` FOREIGN KEY (`TransactionID`) REFERENCES `Transactions` (`TransactionID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TransactionFees`
--

LOCK TABLES `TransactionFees` WRITE;
/*!40000 ALTER TABLE `TransactionFees` DISABLE KEYS */;
INSERT INTO `TransactionFees` VALUES (1,1,'Deposit',0.50),(2,2,'Withdrawal',1.00),(3,3,'Transfer',2.00);
/*!40000 ALTER TABLE `TransactionFees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TransactionLogs`
--

DROP TABLE IF EXISTS `TransactionLogs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `TransactionLogs` (
  `LogID` int NOT NULL AUTO_INCREMENT,
  `CustomerID` int NOT NULL,
  `TransactionType` enum('Deposit','Withdrawal','Transfer') NOT NULL,
  `Amount` decimal(10,2) NOT NULL,
  `TransactionDate` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`LogID`),
  KEY `CustomerID` (`CustomerID`),
  CONSTRAINT `transactionlogs_ibfk_1` FOREIGN KEY (`CustomerID`) REFERENCES `Customers` (`CustomerID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TransactionLogs`
--

LOCK TABLES `TransactionLogs` WRITE;
/*!40000 ALTER TABLE `TransactionLogs` DISABLE KEYS */;
INSERT INTO `TransactionLogs` VALUES (1,1,'Deposit',100.00,'2024-04-26 10:07:05'),(2,2,'Withdrawal',50.00,'2024-04-26 10:07:05'),(3,3,'Transfer',200.00,'2024-04-26 10:07:05'),(4,1,'Deposit',500.00,'2024-04-26 12:12:47'),(5,1,'Withdrawal',500.00,'2024-04-26 13:04:17'),(6,1,'Withdrawal',1000.00,'2024-04-26 13:04:40');
/*!40000 ALTER TABLE `TransactionLogs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Transactions`
--

DROP TABLE IF EXISTS `Transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Transactions` (
  `TransactionID` int NOT NULL AUTO_INCREMENT,
  `AccountID` int NOT NULL,
  `TransactionType` enum('Deposit','Withdrawal','Transfer') NOT NULL,
  `Amount` decimal(10,2) NOT NULL,
  `TransactionDate` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`TransactionID`),
  KEY `AccountID` (`AccountID`),
  CONSTRAINT `transactions_ibfk_1` FOREIGN KEY (`AccountID`) REFERENCES `Accounts` (`AccountID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Transactions`
--

LOCK TABLES `Transactions` WRITE;
/*!40000 ALTER TABLE `Transactions` DISABLE KEYS */;
INSERT INTO `Transactions` VALUES (1,1,'Deposit',500.00,'2024-04-26 10:07:05'),(2,2,'Withdrawal',200.00,'2024-04-26 10:07:05'),(3,3,'Deposit',1000.00,'2024-04-26 10:07:05'),(4,1,'Deposit',500.00,'2024-04-26 12:12:47'),(5,1,'Withdrawal',500.00,'2024-04-26 13:04:17'),(6,1,'Withdrawal',1000.00,'2024-04-26 13:04:40');
/*!40000 ALTER TABLE `Transactions` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `Before_Transaction` BEFORE INSERT ON `transactions` FOR EACH ROW BEGIN
    DECLARE current_balance DECIMAL(10,2);
    
/*Get the current balance of the account*/
    SELECT Balance INTO current_balance
    FROM Accounts
    WHERE AccountID = NEW.AccountID;
    
    /*Check if the transaction type is Withdrawal or Transfer*/
    IF NEW.TransactionType = 'Withdrawal' OR NEW.TransactionType = 'Transfer' THEN
        /*Check if the current balance is sufficient for the transaction*/
        IF current_balance - NEW.Amount < 0 THEN
            SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Insufficient balance for the transaction';
        END IF;
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `TransactionLogTrigger` AFTER INSERT ON `transactions` FOR EACH ROW BEGIN
    INSERT INTO TransactionLogs (CustomerID, TransactionType, Amount, TransactionDate)
    VALUES (
        (SELECT CustomerID FROM Accounts WHERE AccountID = NEW.AccountID),
        NEW.TransactionType,
        NEW.Amount,
        NEW.TransactionDate
    );
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `Transfer`
--

DROP TABLE IF EXISTS `Transfer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Transfer` (
  `TransferID` int NOT NULL AUTO_INCREMENT,
  `FromAccountID` int NOT NULL,
  `ToAccountID` int NOT NULL,
  `Amount` decimal(10,2) NOT NULL,
  `TransferDate` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`TransferID`),
  KEY `FromAccountID` (`FromAccountID`),
  KEY `ToAccountID` (`ToAccountID`),
  CONSTRAINT `transfer_ibfk_1` FOREIGN KEY (`FromAccountID`) REFERENCES `Accounts` (`AccountID`),
  CONSTRAINT `transfer_ibfk_2` FOREIGN KEY (`ToAccountID`) REFERENCES `Accounts` (`AccountID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Transfer`
--

LOCK TABLES `Transfer` WRITE;
/*!40000 ALTER TABLE `Transfer` DISABLE KEYS */;
INSERT INTO `Transfer` VALUES (1,1,2,300.00,'2024-04-26 10:07:05'),(2,3,1,200.00,'2024-04-26 10:07:05');
/*!40000 ALTER TABLE `Transfer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `UserSessions`
--

DROP TABLE IF EXISTS `UserSessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `UserSessions` (
  `SessionID` int NOT NULL AUTO_INCREMENT,
  `CustomerID` int NOT NULL,
  `SessionToken` varchar(255) NOT NULL,
  `Expiry` datetime NOT NULL,
  PRIMARY KEY (`SessionID`),
  KEY `CustomerID` (`CustomerID`),
  CONSTRAINT `usersessions_ibfk_1` FOREIGN KEY (`CustomerID`) REFERENCES `Customers` (`CustomerID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `UserSessions`
--

LOCK TABLES `UserSessions` WRITE;
/*!40000 ALTER TABLE `UserSessions` DISABLE KEYS */;
INSERT INTO `UserSessions` VALUES (1,1,'session_token_1','2024-04-26 11:07:05'),(2,2,'session_token_2','2024-04-26 11:07:05'),(3,3,'session_token_3','2024-04-26 11:07:05');
/*!40000 ALTER TABLE `UserSessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'banking_database_management'
--

--
-- Dumping routines for database 'banking_database_management'
--
/*!50003 DROP FUNCTION IF EXISTS `CalculateLoanPayments` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `CalculateLoanPayments`(loan_id INT) RETURNS decimal(10,2)
    READS SQL DATA
BEGIN
    DECLARE total_payments DECIMAL(10, 2);
    
    SELECT SUM(Amount) INTO total_payments 
    FROM LoanPayments 
    WHERE LoanID = loan_id;
    
    RETURN total_payments;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `CustomerExists` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `CustomerExists`(customer_id INT) RETURNS tinyint(1)
    DETERMINISTIC
BEGIN
    DECLARE result BOOLEAN;
    DECLARE count_customer INT;

    SELECT COUNT(*) INTO count_customer FROM Customers WHERE CustomerID = customer_id;

    IF count_customer > 0 THEN
        SET result = TRUE;
    ELSE
        SET result = FALSE;
    END IF;

    RETURN result;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetAccountBalance` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetAccountBalance`(IN account_id INT)
BEGIN
    SELECT Balance
    FROM Accounts
    WHERE AccountID = account_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetLoanDetails` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetLoanDetails`(IN customer_id INT)
BEGIN
    SELECT l.*, lt.LoanTypeName, lt.InterestRate
    FROM Loans l
    JOIN LoanTypes lt ON l.LoanTypeID = lt.LoanTypeID
    WHERE l.CustomerID = customer_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetTransactionsByEmail` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetTransactionsByEmail`(IN customer_email VARCHAR(100))
BEGIN
    SELECT t.*
    FROM Transactions t
    JOIN Accounts a ON t.AccountID = a.AccountID
    JOIN Customers c ON a.CustomerID = c.CustomerID
    WHERE c.Email = customer_email;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `branchemployees`
--

/*!50001 DROP VIEW IF EXISTS `branchemployees`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `branchemployees` AS select `B`.`BranchID` AS `BranchID`,`B`.`BranchName` AS `BranchName`,`B`.`Location` AS `Location`,`E`.`EmployeeID` AS `EmployeeID`,concat(`E`.`FirstName`,' ',`E`.`LastName`) AS `EmployeeName`,`E`.`DateOfBirth` AS `DateOfBirth`,`E`.`PhoneNumber` AS `PhoneNumber`,`E`.`Email` AS `Email` from (`branches` `B` join `employees` `E` on((`B`.`BranchID` = `E`.`BranchID`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `loanstatus`
--

/*!50001 DROP VIEW IF EXISTS `loanstatus`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `loanstatus` AS select `L`.`LoanID` AS `LoanID`,concat(`C`.`FirstName`,' ',`C`.`LastName`) AS `CustomerName`,`LT`.`LoanTypeName` AS `LoanTypeName`,`L`.`Amount` AS `LoanAmount`,`L`.`DateApplied` AS `DateApplied`,`L`.`Status` AS `Status` from ((`loans` `L` join `customers` `C` on((`L`.`CustomerID` = `C`.`CustomerID`))) join `loantypes` `LT` on((`L`.`LoanTypeID` = `LT`.`LoanTypeID`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-04-27 12:53:49
