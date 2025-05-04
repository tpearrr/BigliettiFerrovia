-- MySQL dump 10.13  Distrib 8.0.41, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: sistemaferroviarioveneto
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
  `Prezzo` decimal(7,2) NOT NULL,
  `Data_Acquisto` date NOT NULL,
  `ID_Cliente` int NOT NULL,
  `ID_Tratta` int NOT NULL,
  `ID_Treno` int NOT NULL,
  PRIMARY KEY (`ID_Biglietto`),
  KEY `idx_biglietto_cliente` (`ID_Cliente`),
  KEY `idx_biglietto_treno` (`ID_Treno`),
  KEY `idx_biglietto_tratta` (`ID_Tratta`),
  CONSTRAINT `biglietto_ibfk_1` FOREIGN KEY (`ID_Cliente`) REFERENCES `cliente` (`ID_Cliente`),
  CONSTRAINT `biglietto_ibfk_2` FOREIGN KEY (`ID_Tratta`) REFERENCES `tratta` (`ID_Tratta`),
  CONSTRAINT `biglietto_ibfk_3` FOREIGN KEY (`ID_Treno`) REFERENCES `treno` (`ID_Treno`),
  CONSTRAINT `biglietto_chk_1` CHECK ((`Prezzo` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente` (
  `ID_Cliente` int NOT NULL AUTO_INCREMENT,
  `Nome` varchar(50) NOT NULL,
  `Cognome` varchar(50) NOT NULL,
  `Email` varchar(100) NOT NULL,
  `Cellulare` varchar(15) NOT NULL,
  PRIMARY KEY (`ID_Cliente`),
  UNIQUE KEY `Email` (`Email`),
  KEY `idx_cliente_cognome` (`Cognome`),
  KEY `idx_cliente_email` (`Email`),
  CONSTRAINT `cliente_chk_1` CHECK ((length(`Cellulare`) >= 8))
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
  `ID_Tratta` int NOT NULL,
  `ID_Stazione` int NOT NULL,
  `Ordine` int NOT NULL,
  `Tempo_sosta` time NOT NULL,
  PRIMARY KEY (`ID_Scalo`),
  KEY `idx_scalo_tratta` (`ID_Tratta`),
  KEY `idx_scalo_stazione` (`ID_Stazione`),
  CONSTRAINT `scalo_ibfk_1` FOREIGN KEY (`ID_Tratta`) REFERENCES `tratta` (`ID_Tratta`),
  CONSTRAINT `scalo_ibfk_2` FOREIGN KEY (`ID_Stazione`) REFERENCES `stazione` (`ID_Stazione`),
  CONSTRAINT `scalo_chk_1` CHECK ((`Ordine` > 0))
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `stazione`
--

DROP TABLE IF EXISTS `stazione`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stazione` (
  `ID_Stazione` int NOT NULL AUTO_INCREMENT,
  `Nome` varchar(100) NOT NULL,
  `Città` varchar(100) NOT NULL,
  PRIMARY KEY (`ID_Stazione`),
  KEY `idx_stazione_nome` (`Nome`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tratta`
--

DROP TABLE IF EXISTS `tratta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tratta` (
  `ID_Tratta` int NOT NULL AUTO_INCREMENT,
  `Durata` time NOT NULL,
  `ID_Treno` int NOT NULL,
  `ID_Stazione_Partenza` int NOT NULL,
  `ID_Stazione_Arrivo` int NOT NULL,
  PRIMARY KEY (`ID_Tratta`),
  KEY `ID_Treno` (`ID_Treno`),
  KEY `idx_tratta_partenza` (`ID_Stazione_Partenza`),
  KEY `idx_tratta_arrivo` (`ID_Stazione_Arrivo`),
  CONSTRAINT `tratta_ibfk_1` FOREIGN KEY (`ID_Treno`) REFERENCES `treno` (`ID_Treno`),
  CONSTRAINT `tratta_ibfk_2` FOREIGN KEY (`ID_Stazione_Partenza`) REFERENCES `stazione` (`ID_Stazione`),
  CONSTRAINT `tratta_ibfk_3` FOREIGN KEY (`ID_Stazione_Arrivo`) REFERENCES `stazione` (`ID_Stazione`),
  CONSTRAINT `tratta_chk_1` CHECK ((`ID_Stazione_Partenza` <> `ID_Stazione_Arrivo`))
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `treno`
--

DROP TABLE IF EXISTS `treno`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `treno` (
  `ID_Treno` int NOT NULL AUTO_INCREMENT,
  `Orario` time NOT NULL,
  `Capacità` int NOT NULL,
  `Tipo_Treno` varchar(10) NOT NULL,
  PRIMARY KEY (`ID_Treno`),
  KEY `idx_treno_tipo` (`Tipo_Treno`),
  CONSTRAINT `treno_chk_1` CHECK ((`Capacità` > 0)),
  CONSTRAINT `treno_chk_2` CHECK ((`Tipo_Treno` in (_utf8mb4'Regionale',_utf8mb4'Diretto')))
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-05-04 12:48:08
