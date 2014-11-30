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
  `Nom` varchar(16) NOT NULL COMMENT 'Nom de la BDD.',
  `NomInstance` varchar(16) NOT NULL,
  PRIMARY KEY (`Nom`,`NomInstance`),
  KEY `BDD Instance_idx` (`NomInstance`),
  CONSTRAINT `BDD Instance` FOREIGN KEY (`NomInstance`) REFERENCES `instance` (`Nom`) ON DELETE NO ACTION ON UPDATE NO ACTION
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
-- Table structure for table `instance`
--

DROP TABLE IF EXISTS `instance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `instance` (
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
-- Dumping data for table `instance`
--

LOCK TABLES `instance` WRITE;
/*!40000 ALTER TABLE `instance` DISABLE KEYS */;
/*!40000 ALTER TABLE `instance` ENABLE KEYS */;
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
  `EspaceUtilise` int(11) DEFAULT NULL,
  `Processeur` varchar(45) DEFAULT NULL,
  `Localisation` varchar(45) DEFAULT NULL,
  `OS` varchar(20) DEFAULT NULL,
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
-- Table structure for table `serveur`
--

DROP TABLE IF EXISTS `serveur`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `serveur` (
  `Nom_serveur` varchar(10) NOT NULL,
  `Consommation_RAM (To)` int(11) DEFAULT NULL,
  `Consommation_CPU(Go)` int(11) DEFAULT NULL,
  PRIMARY KEY (`Nom_serveur`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `serveur`
--

LOCK TABLES `serveur` WRITE;
/*!40000 ALTER TABLE `serveur` DISABLE KEYS */;
INSERT INTO `serveur` VALUES ('S1',400,4);
INSERT INTO `serveur` VALUES ('S2',500,6);
INSERT INTO `serveur` VALUES ('S3',300,8);
INSERT INTO `serveur` VALUES ('S4',400,9);
/*!40000 ALTER TABLE `serveur` ENABLE KEYS */;
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
  `NbrDoublonsRelatif` int(11) DEFAULT NULL COMMENT 'Nombre de doublons',
  `NbrDoublonsAbsolu` int(11) DEFAULT NULL,
  `NbrAttributsValeurConstante` int(11) DEFAULT NULL COMMENT '???',
  PRIMARY KEY (`NomTable`,`NomBDD`,`Proprietaire`),
  KEY `Nom_idx` (`NomBDD`),
  KEY `TableUsers_idx` (`Proprietaire`),
  CONSTRAINT `Nom` FOREIGN KEY (`NomBDD`) REFERENCES `base_de_donnee` (`Nom`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `TableUsers` FOREIGN KEY (`Proprietaire`) REFERENCES `users` (`Identifiant`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tables`
--

LOCK TABLES `tables` WRITE;
/*!40000 ALTER TABLE `tables` DISABLE KEYS */;
/*!40000 ALTER TABLE `tables` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `test-defaut`
--

DROP TABLE IF EXISTS `test-defaut`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `test-defaut` (
  `name` int(11) NOT NULL,
  `nemedef` varchar(45) DEFAULT 'salma',
  `age` int(11) DEFAULT '50',
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `test-defaut`
--

LOCK TABLES `test-defaut` WRITE;
/*!40000 ALTER TABLE `test-defaut` DISABLE KEYS */;
INSERT INTO `test-defaut` VALUES (1,'salma',50);
INSERT INTO `test-defaut` VALUES (2,'salma',50);
INSERT INTO `test-defaut` VALUES (3,'mourad',64);
INSERT INTO `test-defaut` VALUES (4,'zejli',15);
/*!40000 ALTER TABLE `test-defaut` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `Identifiant` varchar(16) NOT NULL,
  `NomInstance` varchar(16) NOT NULL,
  PRIMARY KEY (`Identifiant`,`NomInstance`),
  KEY `UsersNomSGBD_idx` (`NomInstance`),
  CONSTRAINT `UsersNomInstance` FOREIGN KEY (`NomInstance`) REFERENCES `instance` (`Nom`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-11-30 12:51:46
