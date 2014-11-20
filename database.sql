-- MySQL dump 10.13  Distrib 5.6.21, for Win64 (x86_64)
--
-- Host: localhost    Database: pdc4
-- ------------------------------------------------------
-- Server version	5.6.21-log

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
-- Table structure for table `base_de_donnee`
--

DROP TABLE IF EXISTS `base_de_donnee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `base_de_donnee` (
  `Nom` varchar(10) NOT NULL COMMENT 'Nom de la BDD.',
  `NbrTable` int(11) NOT NULL DEFAULT '0' COMMENT 'Nombre de tables dans la BDD.',
  PRIMARY KEY (`Nom`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Table contenant la totalité des bases de données.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `base_de_donnee`
--

LOCK TABLES `base_de_donnee` WRITE;
/*!40000 ALTER TABLE `base_de_donnee` DISABLE KEYS */;
/*!40000 ALTER TABLE `base_de_donnee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `colonnes`
--

DROP TABLE IF EXISTS `colonnes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `colonnes` (
  `NomBDD` varchar(10) NOT NULL,
  `NomTable` varchar(10) NOT NULL,
  `NomColonne` varchar(10) NOT NULL,
  `Type` varchar(20) DEFAULT NULL,
  `PK` bit(1) DEFAULT NULL,
  `NbrValeurDefaut` int(11) DEFAULT NULL COMMENT 'Nombre de valeur par défault',
  `NbrValeurNull` int(11) DEFAULT NULL COMMENT 'Nombre de valeur nulle',
  `Moyenne` int(11) DEFAULT NULL COMMENT '???',
  `DeviationStandard` int(11) DEFAULT NULL,
  `NbrMauvaisFormat` int(11) DEFAULT NULL,
  PRIMARY KEY (`NomTable`,`NomColonne`,`NomBDD`),
  KEY `NomBDD_idx` (`NomBDD`),
  CONSTRAINT `NomBDD` FOREIGN KEY (`NomBDD`) REFERENCES `tables` (`NomBDD`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `NomTable` FOREIGN KEY (`NomTable`) REFERENCES `tables` (`NomTable`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `colonnes`
--

LOCK TABLES `colonnes` WRITE;
/*!40000 ALTER TABLE `colonnes` DISABLE KEYS */;
/*!40000 ALTER TABLE `colonnes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `server`
--

DROP TABLE IF EXISTS `server`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `server` (
  `Nom` varchar(16) NOT NULL,
  `RAM` int(11) DEFAULT NULL COMMENT 'Mémoire vive.',
  `EspaceTotal` int(11) DEFAULT NULL COMMENT 'Espace disque total',
  `Processeur` varchar(45) DEFAULT NULL,
  `Localisation` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`Nom`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `server`
--

LOCK TABLES `server` WRITE;
/*!40000 ALTER TABLE `server` DISABLE KEYS */;
/*!40000 ALTER TABLE `server` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sgbd`
--

DROP TABLE IF EXISTS `sgbd`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sgbd` (
  `Nom` varchar(16) NOT NULL,
  `Server` varchar(16) NOT NULL,
  `Type` varchar(16) DEFAULT NULL,
  `Version` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`Nom`,`Server`),
  KEY `Nom_idx` (`Server`),
  CONSTRAINT `NomServer` FOREIGN KEY (`Server`) REFERENCES `server` (`Nom`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sgbd`
--

LOCK TABLES `sgbd` WRITE;
/*!40000 ALTER TABLE `sgbd` DISABLE KEYS */;
/*!40000 ALTER TABLE `sgbd` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tables`
--

DROP TABLE IF EXISTS `tables`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tables` (
  `NomTable` varchar(16) NOT NULL,
  `NomBDD` varchar(16) NOT NULL,
  `Proprietaire` varchar(45) NOT NULL,
  `NbrTuples` int(11) DEFAULT NULL COMMENT 'Nombre de tuples dans la table.',
  `NbrAttributs` int(11) DEFAULT NULL COMMENT 'Nombre d''attributs dans la table',
  `DateCreation` date DEFAULT NULL COMMENT 'Date de création de la table.',
  `DateDerniereModif` date DEFAULT NULL COMMENT 'Date de dernière modif de la table.',
  `NbrDoublons` int(11) DEFAULT NULL COMMENT 'Nombre de doublons',
  `NbrAttributsValeurConstante` int(11) DEFAULT NULL COMMENT '???',
  PRIMARY KEY (`NomTable`,`NomBDD`,`Proprietaire`),
  KEY `Nom_idx` (`NomBDD`),
  CONSTRAINT `Nom` FOREIGN KEY (`NomBDD`) REFERENCES `base_de_donnee` (`Nom`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tables`
--

LOCK TABLES `tables` WRITE;
/*!40000 ALTER TABLE `tables` DISABLE KEYS */;
/*!40000 ALTER TABLE `tables` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-11-20 10:44:46
