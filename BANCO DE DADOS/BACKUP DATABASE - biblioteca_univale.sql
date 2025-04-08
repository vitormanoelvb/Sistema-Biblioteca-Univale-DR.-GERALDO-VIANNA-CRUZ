-- MySQL dump 10.13  Distrib 8.0.41, for Win64 (x86_64)
--
-- Host: localhost    Database: biblioteca_univale
-- ------------------------------------------------------
-- Server version	8.0.41

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
-- Table structure for table `alugueis`
--

DROP TABLE IF EXISTS `alugueis`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `alugueis` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `LivroId` int DEFAULT NULL,
  `NomeCliente` varchar(255) DEFAULT NULL,
  `CPF` varchar(20) DEFAULT NULL,
  `Telefone` varchar(20) DEFAULT NULL,
  `DataAluguel` datetime DEFAULT NULL,
  `DataDevolucao` datetime DEFAULT NULL,
  `Valor` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `LivroId` (`LivroId`),
  CONSTRAINT `alugueis_ibfk_1` FOREIGN KEY (`LivroId`) REFERENCES `livros` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alugueis`
--

LOCK TABLES `alugueis` WRITE;
/*!40000 ALTER TABLE `alugueis` DISABLE KEYS */;
INSERT INTO `alugueis` VALUES (1,1,'João da Silva','123.456.789-00','(33) 99999-1111','2025-04-01 08:15:37','2025-04-08 08:15:37',16.00),(2,2,'Maria Oliveira','234.567.890-11','(33) 99999-2222','2025-04-04 08:15:37','2025-04-10 08:15:37',19.00);
/*!40000 ALTER TABLE `alugueis` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `deletados`
--

DROP TABLE IF EXISTS `deletados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `deletados` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `LivroId` int DEFAULT NULL,
  `Titulo` varchar(255) DEFAULT NULL,
  `Motivo` text,
  `DataExclusao` datetime DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `deletados`
--

LOCK TABLES `deletados` WRITE;
/*!40000 ALTER TABLE `deletados` DISABLE KEYS */;
INSERT INTO `deletados` VALUES (1,7,'Livro Obsoleto','Desatualizado para o acervo','2025-04-06 08:15:57');
/*!40000 ALTER TABLE `deletados` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `livros`
--

DROP TABLE IF EXISTS `livros`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `livros` (
  `Id` int NOT NULL,
  `Titulo` varchar(255) NOT NULL,
  `Autor` varchar(255) NOT NULL,
  `Ano` int DEFAULT NULL,
  `Historia` text,
  `Disponivel` tinyint(1) DEFAULT '1',
  `Categoria` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `livros`
--

LOCK TABLES `livros` WRITE;
/*!40000 ALTER TABLE `livros` DISABLE KEYS */;
INSERT INTO `livros` VALUES (1,'Dom Casmurro','Machado de Assis',1899,'Um clássico que explora ciúmes e ambiguidade.',1,NULL),(2,'O Pequeno Príncipe','Antoine de Saint-Exupéry',1943,'Obra poética sobre amizade e infância.',1,NULL),(3,'Memórias Póstumas de Brás Cubas','Machado de Assis',1881,'Narrativa crítica e irônica da sociedade.',1,NULL),(4,'Capitães da Areia','Jorge Amado',1937,'Meninos de rua em Salvador.',1,NULL),(5,'1984','George Orwell',1949,'Distopia sobre vigilância totalitária.',1,NULL),(6,'A Revolução dos Bichos','George Orwell',1945,'Fábula sobre revolução e corrupção.',1,NULL);
/*!40000 ALTER TABLE `livros` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `retiradas`
--

DROP TABLE IF EXISTS `retiradas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `retiradas` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `LivroId` int DEFAULT NULL,
  `NomeCliente` varchar(255) DEFAULT NULL,
  `CPF` varchar(20) DEFAULT NULL,
  `Telefone` varchar(20) DEFAULT NULL,
  `DataRetirada` datetime DEFAULT NULL,
  `DataDevolucao` datetime DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `LivroId` (`LivroId`),
  CONSTRAINT `retiradas_ibfk_1` FOREIGN KEY (`LivroId`) REFERENCES `livros` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `retiradas`
--

LOCK TABLES `retiradas` WRITE;
/*!40000 ALTER TABLE `retiradas` DISABLE KEYS */;
INSERT INTO `retiradas` VALUES (1,3,'Carlos Pereira','345.678.901-22','(33) 99999-3333','2025-04-05 08:15:45','2025-04-07 08:15:45');
/*!40000 ALTER TABLE `retiradas` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-04-06  8:24:32
