-- MySQL dump 10.13  Distrib 8.0.41, for Win64 (x86_64)
--
-- Host: localhost    Database: sistemabigliettiferroviari
-- ------------------------------------------------------
-- Server version	9.2.0

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
-- Table structure for table `biglietto`
--

DROP TABLE IF EXISTS `biglietto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `biglietto` (
  `ID_Biglietto` int NOT NULL AUTO_INCREMENT,
  `ID_Tratta` int DEFAULT NULL,
  `ID_Cliente` int DEFAULT NULL,
  `Prezzo` decimal(10,2) DEFAULT NULL,
  `Data_Acquisto` datetime DEFAULT NULL,
  PRIMARY KEY (`ID_Biglietto`),
  KEY `ID_Tratta` (`ID_Tratta`),
  KEY `ID_Cliente` (`ID_Cliente`),
  CONSTRAINT `biglietto_ibfk_1` FOREIGN KEY (`ID_Tratta`) REFERENCES `tratta` (`ID_Tratta`),
  CONSTRAINT `biglietto_ibfk_2` FOREIGN KEY (`ID_Cliente`) REFERENCES `cliente` (`ID_Cliente`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente` (
  `ID_Cliente` int NOT NULL AUTO_INCREMENT,
  `Nome` varchar(50) DEFAULT NULL,
  `Cognome` varchar(50) DEFAULT NULL,
  `Email` varchar(50) DEFAULT NULL,
  `Cellulare` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`ID_Cliente`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `prenotazione`
--

DROP TABLE IF EXISTS `prenotazione`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `prenotazione` (
  `ID_Prenotazione` int NOT NULL AUTO_INCREMENT,
  `ID_Biglietto` int DEFAULT NULL,
  `ID_Cliente` int DEFAULT NULL,
  PRIMARY KEY (`ID_Prenotazione`),
  KEY `ID_Biglietto` (`ID_Biglietto`),
  KEY `ID_Cliente` (`ID_Cliente`),
  CONSTRAINT `prenotazione_ibfk_1` FOREIGN KEY (`ID_Biglietto`) REFERENCES `biglietto` (`ID_Biglietto`),
  CONSTRAINT `prenotazione_ibfk_2` FOREIGN KEY (`ID_Cliente`) REFERENCES `cliente` (`ID_Cliente`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `scalo`
--

DROP TABLE IF EXISTS `scalo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `scalo` (
  `ID_Scalo` int NOT NULL AUTO_INCREMENT,
  `ID_Tratta` int DEFAULT NULL,
  `ID_Stazione` int DEFAULT NULL,
  `Ordine` int DEFAULT NULL,
  `Tempo_Sosta` time DEFAULT NULL,
  PRIMARY KEY (`ID_Scalo`),
  KEY `ID_Tratta` (`ID_Tratta`),
  KEY `ID_Stazione` (`ID_Stazione`),
  CONSTRAINT `scalo_ibfk_1` FOREIGN KEY (`ID_Tratta`) REFERENCES `tratta` (`ID_Tratta`),
  CONSTRAINT `scalo_ibfk_2` FOREIGN KEY (`ID_Stazione`) REFERENCES `stazione` (`ID_Stazione`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `stazione`
--

DROP TABLE IF EXISTS `stazione`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stazione` (
  `ID_Stazione` int NOT NULL AUTO_INCREMENT,
  `Citta` varchar(100) DEFAULT NULL,
  `Nome` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ID_Stazione`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tratta`
--

DROP TABLE IF EXISTS `tratta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tratta` (
  `ID_Tratta` int NOT NULL AUTO_INCREMENT,
  `ID_Stazione_Partenza` int DEFAULT NULL,
  `ID_Stazione_Arrivo` int DEFAULT NULL,
  `ID_Treno` int DEFAULT NULL,
  `Durata` time DEFAULT NULL,
  PRIMARY KEY (`ID_Tratta`),
  KEY `ID_Stazione_Partenza` (`ID_Stazione_Partenza`),
  KEY `ID_Stazione_Arrivo` (`ID_Stazione_Arrivo`),
  KEY `ID_Treno` (`ID_Treno`),
  CONSTRAINT `tratta_ibfk_1` FOREIGN KEY (`ID_Stazione_Partenza`) REFERENCES `stazione` (`ID_Stazione`),
  CONSTRAINT `tratta_ibfk_2` FOREIGN KEY (`ID_Stazione_Arrivo`) REFERENCES `stazione` (`ID_Stazione`),
  CONSTRAINT `tratta_ibfk_3` FOREIGN KEY (`ID_Treno`) REFERENCES `treno` (`ID_Treno`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `treno`
--

DROP TABLE IF EXISTS `treno`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `treno` (
  `ID_Treno` int NOT NULL AUTO_INCREMENT,
  `Tipo_Treno` varchar(50) DEFAULT NULL,
  `Capacita` int DEFAULT NULL,
  PRIMARY KEY (`ID_Treno`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-03-29 11:30:24
