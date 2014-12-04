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
  `Nom` varchar(30) NOT NULL COMMENT 'Nom de la BDD.',
  `NomInstance` varchar(30) NOT NULL,
  PRIMARY KEY (`Nom`,`NomInstance`),
  KEY `BDD Instance_idx` (`NomInstance`),
  CONSTRAINT `BDD Instance` FOREIGN KEY (`NomInstance`) REFERENCES `instance` (`Nom`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Table contenant la totalite des bases de donnees.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `base_de_donnee`
--

LOCK TABLES `base_de_donnee` WRITE;
/*!40000 ALTER TABLE `base_de_donnee` DISABLE KEYS */;
INSERT INTO `base_de_donnee` VALUES ('3IF','3IF');
/*!40000 ALTER TABLE `base_de_donnee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `colonnes`
--

DROP TABLE IF EXISTS `colonnes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `colonnes` (
  `NomBDD` varchar(30) NOT NULL,
  `NomTable` varchar(30) NOT NULL,
  `NomColonne` varchar(30) NOT NULL,
  `Type` varchar(20) DEFAULT NULL,
  `PK` bit(1) DEFAULT NULL,
  `NbrValeurDefaut` int(11) DEFAULT NULL COMMENT 'Nombre de valeur par default',
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
  `Nom` varchar(30) NOT NULL,
  `Server` varchar(30) NOT NULL,
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
INSERT INTO `instance` VALUES ('3IF','3IF','ORACLE','42.0');
/*!40000 ALTER TABLE `instance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `server`
--

DROP TABLE IF EXISTS `server`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `server` (
  `Nom` varchar(30) NOT NULL,
  `RAM` int(11) DEFAULT NULL COMMENT 'Memoire vive.',
  `EspaceTotal` int(11) DEFAULT NULL COMMENT 'Espace disque total',
  `EspaceUtilise` int(11) DEFAULT NULL,
  `Processeur` varchar(45) DEFAULT NULL,
  `Localisation` varchar(30) DEFAULT NULL,
  `OS` varchar(20) DEFAULT NULL,
  `ServerHote` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`Nom`),
  KEY `FK_server_server_idx` (`ServerHote`),
  KEY `FK_server_site_idx` (`Localisation`),
  CONSTRAINT `FK_server_server` FOREIGN KEY (`ServerHote`) REFERENCES `server` (`Nom`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_server_site` FOREIGN KEY (`Localisation`) REFERENCES `site` (`Nom`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `server`
--

LOCK TABLES `server` WRITE;
/*!40000 ALTER TABLE `server` DISABLE KEYS */;
INSERT INTO `server` VALUES ('3IF',1337,1337,42,'OMG NASA','INSA LYON','Linux',NULL);
/*!40000 ALTER TABLE `server` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `site`
--

DROP TABLE IF EXISTS `site`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `site` (
  `Nom` varchar(30) NOT NULL,
  `Adresse` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`Nom`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `site`
--

LOCK TABLES `site` WRITE;
/*!40000 ALTER TABLE `site` DISABLE KEYS */;
INSERT INTO `site` VALUES ('INSA LYON','32, BANANA LES BAINS');
/*!40000 ALTER TABLE `site` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tables`
--

DROP TABLE IF EXISTS `tables`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tables` (
  `NomTable` varchar(30) NOT NULL,
  `NomBDD` varchar(30) NOT NULL,
  `Proprietaire` varchar(30) NOT NULL,
  `NbrTuples` int(11) DEFAULT NULL COMMENT 'Nombre de tuples dans la table.',
  `NbrAttributs` int(11) DEFAULT NULL COMMENT 'Nombre d''attributs dans la table',
  `DateCreation` date DEFAULT NULL COMMENT 'Date de creation de la table.',
  `DateDerniereModif` date DEFAULT NULL COMMENT 'Date de derniere modif de la table.',
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
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `Identifiant` varchar(30) NOT NULL,
  `NomInstance` varchar(30) NOT NULL,
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
INSERT INTO `users` VALUES (' AACCARDO                     ','3IF');
INSERT INTO `users` VALUES (' AANDRA                       ','3IF');
INSERT INTO `users` VALUES (' ABATTO                       ','3IF');
INSERT INTO `users` VALUES (' ACHABERT                     ','3IF');
INSERT INTO `users` VALUES (' ACHIOUKH                     ','3IF');
INSERT INTO `users` VALUES (' ACOUSSAT                     ','3IF');
INSERT INTO `users` VALUES (' AFOSSART                     ','3IF');
INSERT INTO `users` VALUES (' AGONZALEZ1                   ','3IF');
INSERT INTO `users` VALUES (' AICMEZ                       ','3IF');
INSERT INTO `users` VALUES (' AJUGUET                      ','3IF');
INSERT INTO `users` VALUES (' AMAHAJAN                     ','3IF');
INSERT INTO `users` VALUES (' AMENELLA                     ','3IF');
INSERT INTO `users` VALUES (' AMHYVARINEN                  ','3IF');
INSERT INTO `users` VALUES (' ANONYMOUS                    ','3IF');
INSERT INTO `users` VALUES (' AOPRISOR                     ','3IF');
INSERT INTO `users` VALUES (' APAPIN                       ','3IF');
INSERT INTO `users` VALUES (' APEX_030200                  ','3IF');
INSERT INTO `users` VALUES (' APEX_PUBLIC_USER             ','3IF');
INSERT INTO `users` VALUES (' APICHOTUTR                   ','3IF');
INSERT INTO `users` VALUES (' APPQOSSYS                    ','3IF');
INSERT INTO `users` VALUES (' AROSSI1                      ','3IF');
INSERT INTO `users` VALUES (' ASALIHI                      ','3IF');
INSERT INTO `users` VALUES (' ASBRYLINSKI                  ','3IF');
INSERT INTO `users` VALUES (' ATERTIUC                     ','3IF');
INSERT INTO `users` VALUES (' AVERNASSIE                   ','3IF');
INSERT INTO `users` VALUES (' AWALSH                       ','3IF');
INSERT INTO `users` VALUES (' BCHABOD                      ','3IF');
INSERT INTO `users` VALUES (' BDONET                       ','3IF');
INSERT INTO `users` VALUES (' BKANG                        ','3IF');
INSERT INTO `users` VALUES (' BLEBEAU                      ','3IF');
INSERT INTO `users` VALUES (' CBOSCHER                     ','3IF');
INSERT INTO `users` VALUES (' CCACHARD                     ','3IF');
INSERT INTO `users` VALUES (' CCANETE                      ','3IF');
INSERT INTO `users` VALUES (' CMERCIERDE                   ','3IF');
INSERT INTO `users` VALUES (' CMOREAU                      ','3IF');
INSERT INTO `users` VALUES (' CNI                          ','3IF');
INSERT INTO `users` VALUES (' CRIHOUEY                     ','3IF');
INSERT INTO `users` VALUES (' CTXSYS                       ','3IF');
INSERT INTO `users` VALUES (' DBSNMP                       ','3IF');
INSERT INTO `users` VALUES (' DESKIOCAK                    ','3IF');
INSERT INTO `users` VALUES (' DGALLET                      ','3IF');
INSERT INTO `users` VALUES (' DIP                          ','3IF');
INSERT INTO `users` VALUES (' DMITRICA                     ','3IF');
INSERT INTO `users` VALUES (' DWOBROCK                     ','3IF');
INSERT INTO `users` VALUES (' EBAI                         ','3IF');
INSERT INTO `users` VALUES (' ECASTRILLO                   ','3IF');
INSERT INTO `users` VALUES (' EDELASTICS                   ','3IF');
INSERT INTO `users` VALUES (' EEGYED                       ','3IF');
INSERT INTO `users` VALUES (' ELEPEIGNEU                   ','3IF');
INSERT INTO `users` VALUES (' EXFSYS                       ','3IF');
INSERT INTO `users` VALUES (' FC01                         ','3IF');
INSERT INTO `users` VALUES (' FC02                         ','3IF');
INSERT INTO `users` VALUES (' FC03                         ','3IF');
INSERT INTO `users` VALUES (' FC04                         ','3IF');
INSERT INTO `users` VALUES (' FC05                         ','3IF');
INSERT INTO `users` VALUES (' FC06                         ','3IF');
INSERT INTO `users` VALUES (' FC07                         ','3IF');
INSERT INTO `users` VALUES (' FC08                         ','3IF');
INSERT INTO `users` VALUES (' FC09                         ','3IF');
INSERT INTO `users` VALUES (' FC10                         ','3IF');
INSERT INTO `users` VALUES (' FC11                         ','3IF');
INSERT INTO `users` VALUES (' FC12                         ','3IF');
INSERT INTO `users` VALUES (' FC13                         ','3IF');
INSERT INTO `users` VALUES (' FC21                         ','3IF');
INSERT INTO `users` VALUES (' FC22                         ','3IF');
INSERT INTO `users` VALUES (' FC23                         ','3IF');
INSERT INTO `users` VALUES (' FC24                         ','3IF');
INSERT INTO `users` VALUES (' FC25                         ','3IF');
INSERT INTO `users` VALUES (' FC26                         ','3IF');
INSERT INTO `users` VALUES (' FC27                         ','3IF');
INSERT INTO `users` VALUES (' FC28                         ','3IF');
INSERT INTO `users` VALUES (' FC29                         ','3IF');
INSERT INTO `users` VALUES (' FC30                         ','3IF');
INSERT INTO `users` VALUES (' FCALLET                      ','3IF');
INSERT INTO `users` VALUES (' FDRAXLER                     ','3IF');
INSERT INTO `users` VALUES (' FGUGLIELMI                   ','3IF');
INSERT INTO `users` VALUES (' FGUTEKUNST                   ','3IF');
INSERT INTO `users` VALUES (' FLOWS_FILES                  ','3IF');
INSERT INTO `users` VALUES (' FMEYER1                      ','3IF');
INSERT INTO `users` VALUES (' FPIZZO                       ','3IF');
INSERT INTO `users` VALUES (' GBERTHIER                    ','3IF');
INSERT INTO `users` VALUES (' GGONZALEZT1                  ','3IF');
INSERT INTO `users` VALUES (' GGOUZI                       ','3IF');
INSERT INTO `users` VALUES (' GKHENG                       ','3IF');
INSERT INTO `users` VALUES (' GSARNETTE                    ','3IF');
INSERT INTO `users` VALUES (' HBARATTOLO                   ','3IF');
INSERT INTO `users` VALUES (' HDELVAL                      ','3IF');
INSERT INTO `users` VALUES (' HSIPAHIMAL                   ','3IF');
INSERT INTO `users` VALUES (' HVERLIN                      ','3IF');
INSERT INTO `users` VALUES (' IST01                        ','3IF');
INSERT INTO `users` VALUES (' IST02                        ','3IF');
INSERT INTO `users` VALUES (' IST03                        ','3IF');
INSERT INTO `users` VALUES (' IST04                        ','3IF');
INSERT INTO `users` VALUES (' IST05                        ','3IF');
INSERT INTO `users` VALUES (' IST06                        ','3IF');
INSERT INTO `users` VALUES (' IST07                        ','3IF');
INSERT INTO `users` VALUES (' IST08                        ','3IF');
INSERT INTO `users` VALUES (' IST09                        ','3IF');
INSERT INTO `users` VALUES (' IST10                        ','3IF');
INSERT INTO `users` VALUES (' IST11                        ','3IF');
INSERT INTO `users` VALUES (' IST12                        ','3IF');
INSERT INTO `users` VALUES (' IST13                        ','3IF');
INSERT INTO `users` VALUES (' IST14                        ','3IF');
INSERT INTO `users` VALUES (' IST15                        ','3IF');
INSERT INTO `users` VALUES (' IST16                        ','3IF');
INSERT INTO `users` VALUES (' JBARA                        ','3IF');
INSERT INTO `users` VALUES (' JCORNEVIN                    ','3IF');
INSERT INTO `users` VALUES (' JGUICHARD                    ','3IF');
INSERT INTO `users` VALUES (' JROGALSKI                    ','3IF');
INSERT INTO `users` VALUES (' JTAWS                        ','3IF');
INSERT INTO `users` VALUES (' JVERNET                      ','3IF');
INSERT INTO `users` VALUES (' JWIMSINGUE                   ','3IF');
INSERT INTO `users` VALUES (' KBULME                       ','3IF');
INSERT INTO `users` VALUES (' KDIRI                        ','3IF');
INSERT INTO `users` VALUES (' KMAS                         ','3IF');
INSERT INTO `users` VALUES (' KOLLIVIER                    ','3IF');
INSERT INTO `users` VALUES (' LCHAMPAVER                   ','3IF');
INSERT INTO `users` VALUES (' LCOURANT                     ','3IF');
INSERT INTO `users` VALUES (' LFORGET                      ','3IF');
INSERT INTO `users` VALUES (' LGAO                         ','3IF');
INSERT INTO `users` VALUES (' LJOB                         ','3IF');
INSERT INTO `users` VALUES (' LMURAYAMA                    ','3IF');
INSERT INTO `users` VALUES (' LTOUZARD                     ','3IF');
INSERT INTO `users` VALUES (' MCAVDAR                      ','3IF');
INSERT INTO `users` VALUES (' MCHABANCE                    ','3IF');
INSERT INTO `users` VALUES (' MCHALUMEAU                   ','3IF');
INSERT INTO `users` VALUES (' MCHAOUCHE                    ','3IF');
INSERT INTO `users` VALUES (' MCHRIST                      ','3IF');
INSERT INTO `users` VALUES (' MDDATA                       ','3IF');
INSERT INTO `users` VALUES (' MDSYS                        ','3IF');
INSERT INTO `users` VALUES (' MGAILLARD                    ','3IF');
INSERT INTO `users` VALUES (' MGMT_VIEW                    ','3IF');
INSERT INTO `users` VALUES (' MHAIDARA                     ','3IF');
INSERT INTO `users` VALUES (' MJAVIN                       ','3IF');
INSERT INTO `users` VALUES (' MLEE                         ','3IF');
INSERT INTO `users` VALUES (' MLEGUILLY                    ','3IF');
INSERT INTO `users` VALUES (' MPIVA                        ','3IF');
INSERT INTO `users` VALUES (' MSKIM                        ','3IF');
INSERT INTO `users` VALUES (' MSOUCHON                     ','3IF');
INSERT INTO `users` VALUES (' MTAYIB                       ','3IF');
INSERT INTO `users` VALUES (' NATAMAN                      ','3IF');
INSERT INTO `users` VALUES (' NBONFANTE                    ','3IF');
INSERT INTO `users` VALUES (' NLAWLOR                      ','3IF');
INSERT INTO `users` VALUES (' NNADISIC                     ','3IF');
INSERT INTO `users` VALUES (' NNATIVEL                     ','3IF');
INSERT INTO `users` VALUES (' NOTTEN                       ','3IF');
INSERT INTO `users` VALUES (' NSERGENT                     ','3IF');
INSERT INTO `users` VALUES (' NSTANCIOIU                   ','3IF');
INSERT INTO `users` VALUES (' NWILSON                      ','3IF');
INSERT INTO `users` VALUES (' OARIOZ                       ','3IF');
INSERT INTO `users` VALUES (' OBENEA                       ','3IF');
INSERT INTO `users` VALUES (' ODELSAUX                     ','3IF');
INSERT INTO `users` VALUES (' OLAPSYS                      ','3IF');
INSERT INTO `users` VALUES (' ORACLE_OCM                   ','3IF');
INSERT INTO `users` VALUES (' ORDDATA                      ','3IF');
INSERT INTO `users` VALUES (' ORDPLUGINS                   ','3IF');
INSERT INTO `users` VALUES (' ORDSYS                       ','3IF');
INSERT INTO `users` VALUES (' OUTLN                        ','3IF');
INSERT INTO `users` VALUES (' OWBSYS                       ','3IF');
INSERT INTO `users` VALUES (' OWBSYS_AUDIT                 ','3IF');
INSERT INTO `users` VALUES (' PCOMPAGNON                   ','3IF');
INSERT INTO `users` VALUES (' PDAUTRY                      ','3IF');
INSERT INTO `users` VALUES (' PDC4                         ','3IF');
INSERT INTO `users` VALUES (' PDC4_1                       ','3IF');
INSERT INTO `users` VALUES (' PDC4_2                       ','3IF');
INSERT INTO `users` VALUES (' PDC4_3                       ','3IF');
INSERT INTO `users` VALUES (' PDC4_4                       ','3IF');
INSERT INTO `users` VALUES (' PDC4_5                       ','3IF');
INSERT INTO `users` VALUES (' PDC4_6                       ','3IF');
INSERT INTO `users` VALUES (' PDC4_7                       ','3IF');
INSERT INTO `users` VALUES (' PDC4_8                       ','3IF');
INSERT INTO `users` VALUES (' PDUMAITRE                    ','3IF');
INSERT INTO `users` VALUES (' PJARSAILLO                   ','3IF');
INSERT INTO `users` VALUES (' PLAMARRE                     ','3IF');
INSERT INTO `users` VALUES (' PLAMARRE2                    ','3IF');
INSERT INTO `users` VALUES (' PTERAKOPIA                   ','3IF');
INSERT INTO `users` VALUES (' QBAYART                      ','3IF');
INSERT INTO `users` VALUES (' QLABERNIA                    ','3IF');
INSERT INTO `users` VALUES (' RBAGHEZZA                    ','3IF');
INSERT INTO `users` VALUES (' RBOURRIER                    ','3IF');
INSERT INTO `users` VALUES (' RBOURY                       ','3IF');
INSERT INTO `users` VALUES (' RCUMONT                      ','3IF');
INSERT INTO `users` VALUES (' RDELEYDET                    ','3IF');
INSERT INTO `users` VALUES (' RDUTEIL                      ','3IF');
INSERT INTO `users` VALUES (' RMATHONAT                    ','3IF');
INSERT INTO `users` VALUES (' RROYER                       ','3IF');
INSERT INTO `users` VALUES (' RSAUGET                      ','3IF');
INSERT INTO `users` VALUES (' SAGRAWAL                     ','3IF');
INSERT INTO `users` VALUES (' SCAZALENS                    ','3IF');
INSERT INTO `users` VALUES (' SCOTT                        ','3IF');
INSERT INTO `users` VALUES (' SI_INFORMTN_SCHEMA           ','3IF');
INSERT INTO `users` VALUES (' SLAHMAR                      ','3IF');
INSERT INTO `users` VALUES (' SLEGRAS                      ','3IF');
INSERT INTO `users` VALUES (' SLESCANOCA                   ','3IF');
INSERT INTO `users` VALUES (' SMANKAI                      ','3IF');
INSERT INTO `users` VALUES (' SPATIAL_CSW_ADMIN_USR        ','3IF');
INSERT INTO `users` VALUES (' SPATIAL_WFS_ADMIN_USR        ','3IF');
INSERT INTO `users` VALUES (' SROUX1                       ','3IF');
INSERT INTO `users` VALUES (' SSCHOCH                      ','3IF');
INSERT INTO `users` VALUES (' STOKO                        ','3IF');
INSERT INTO `users` VALUES (' STURUNEN                     ','3IF');
INSERT INTO `users` VALUES (' SYILMAZ                      ','3IF');
INSERT INTO `users` VALUES (' SYS                          ','3IF');
INSERT INTO `users` VALUES (' SYSMAN                       ','3IF');
INSERT INTO `users` VALUES (' SYSTEM                       ','3IF');
INSERT INTO `users` VALUES (' TBASEILHAC                   ','3IF');
INSERT INTO `users` VALUES (' TCOLARD                      ','3IF');
INSERT INTO `users` VALUES (' TFAURE1                      ','3IF');
INSERT INTO `users` VALUES (' TFAVROT                      ','3IF');
INSERT INTO `users` VALUES (' TFERNANDEZ1                  ','3IF');
INSERT INTO `users` VALUES (' TGUEGAN                      ','3IF');
INSERT INTO `users` VALUES (' THALEPIAN                    ','3IF');
INSERT INTO `users` VALUES (' VLUNGENSTR                   ','3IF');
INSERT INTO `users` VALUES (' VNOUVELLET                   ','3IF');
INSERT INTO `users` VALUES (' VRIGAUD                      ','3IF');
INSERT INTO `users` VALUES (' WMSYS                        ','3IF');
INSERT INTO `users` VALUES (' XDB                          ','3IF');
INSERT INTO `users` VALUES (' XS$NULL                      ','3IF');
INSERT INTO `users` VALUES (' XXU1                         ','3IF');
INSERT INTO `users` VALUES (' YAMGHAR                      ','3IF');
INSERT INTO `users` VALUES (' YBOUIRY                      ','3IF');
INSERT INTO `users` VALUES (' YHARZALLAH                   ','3IF');
INSERT INTO `users` VALUES (' YHAZOT                       ','3IF');
INSERT INTO `users` VALUES (' YTANG1                       ','3IF');
INSERT INTO `users` VALUES (' YZHANG1                      ','3IF');
INSERT INTO `users` VALUES (' ZLAHJOUJI                    ','3IF');
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

-- Dump completed on 2014-12-04 16:18:21
