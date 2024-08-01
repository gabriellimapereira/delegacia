-- MySQL dump 10.13  Distrib 8.0.37, for Linux (x86_64)
--
-- Host: localhost    Database: minimundo
-- ------------------------------------------------------
-- Server version	8.0.37-0ubuntu0.24.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `Acessorio`
--

DROP TABLE IF EXISTS `Acessorio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Acessorio` (
  `ID_Equip` int NOT NULL,
  `Acessorio` varchar(50) NOT NULL,
  KEY `ID_Equip` (`ID_Equip`),
  CONSTRAINT `Acessorio_ibfk_1` FOREIGN KEY (`ID_Equip`) REFERENCES `Equipamento` (`ID_Equip`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Acessorio`
--

LOCK TABLES `Acessorio` WRITE;
/*!40000 ALTER TABLE `Acessorio` DISABLE KEYS */;
INSERT INTO `Acessorio` VALUES (21,'Mira telescópica'),(22,'Silenciador'),(23,'Lanterna tática'),(24,'Cano de alta precisão'),(25,'Empunhadura ergonômica'),(26,'Bipé'),(27,'Coronha ajustável'),(28,'Mira laser'),(29,'Capacete com visor integrado'),(30,'Suporte para carregadores');
/*!40000 ALTER TABLE `Acessorio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Arma_Branca`
--

DROP TABLE IF EXISTS `Arma_Branca`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Arma_Branca` (
  `ID_Equip` int NOT NULL,
  `Numero_Serie` int NOT NULL,
  KEY `ID_Equip` (`ID_Equip`),
  CONSTRAINT `Arma_Branca_ibfk_1` FOREIGN KEY (`ID_Equip`) REFERENCES `Equipamento` (`ID_Equip`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Arma_Branca`
--

LOCK TABLES `Arma_Branca` WRITE;
/*!40000 ALTER TABLE `Arma_Branca` DISABLE KEYS */;
INSERT INTO `Arma_Branca` VALUES (11,10001),(12,10002),(13,10003),(14,10004),(15,10005),(16,10006),(17,10007),(18,10008),(19,10009),(20,10010);
/*!40000 ALTER TABLE `Arma_Branca` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Armas_De_Fogo`
--

DROP TABLE IF EXISTS `Armas_De_Fogo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Armas_De_Fogo` (
  `ID_Equip` int NOT NULL,
  `Numeracao` int NOT NULL,
  `Capacidade` int NOT NULL,
  KEY `ID_Equip` (`ID_Equip`),
  CONSTRAINT `Armas_De_Fogo_ibfk_1` FOREIGN KEY (`ID_Equip`) REFERENCES `Equipamento` (`ID_Equip`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Armas_De_Fogo`
--

LOCK TABLES `Armas_De_Fogo` WRITE;
/*!40000 ALTER TABLE `Armas_De_Fogo` DISABLE KEYS */;
INSERT INTO `Armas_De_Fogo` VALUES (21,20001,15),(22,20002,6),(23,20003,30),(24,20004,30),(25,20005,14),(26,20006,10),(27,20007,25),(28,20008,5),(29,20009,17),(30,20010,40);
/*!40000 ALTER TABLE `Armas_De_Fogo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Atendente`
--

DROP TABLE IF EXISTS `Atendente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Atendente` (
  `ID_Func` int NOT NULL,
  KEY `ID_Func` (`ID_Func`),
  CONSTRAINT `Atendente_ibfk_1` FOREIGN KEY (`ID_Func`) REFERENCES `Funcionario` (`ID_Func`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Atendente`
--

LOCK TABLES `Atendente` WRITE;
/*!40000 ALTER TABLE `Atendente` DISABLE KEYS */;
INSERT INTO `Atendente` VALUES (6),(7),(8),(9),(10);
/*!40000 ALTER TABLE `Atendente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Boletim_Evidencia`
--

DROP TABLE IF EXISTS `Boletim_Evidencia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Boletim_Evidencia` (
  `ID_Evi` int NOT NULL,
  `ID_Bol` int NOT NULL,
  PRIMARY KEY (`ID_Bol`,`ID_Evi`),
  KEY `ID_Evi` (`ID_Evi`),
  CONSTRAINT `Boletim_Evidencia_ibfk_1` FOREIGN KEY (`ID_Bol`) REFERENCES `Boletim_Ocorrencia` (`ID_Bol`),
  CONSTRAINT `Boletim_Evidencia_ibfk_2` FOREIGN KEY (`ID_Evi`) REFERENCES `Evidencias` (`ID_Evi`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Boletim_Evidencia`
--

LOCK TABLES `Boletim_Evidencia` WRITE;
/*!40000 ALTER TABLE `Boletim_Evidencia` DISABLE KEYS */;
INSERT INTO `Boletim_Evidencia` VALUES (1,1),(2,1),(3,2),(4,2),(5,3),(6,3),(7,4),(8,4),(9,5),(10,5),(11,6),(12,6),(13,7),(14,7),(15,8);
/*!40000 ALTER TABLE `Boletim_Evidencia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Boletim_Ocorrencia`
--

DROP TABLE IF EXISTS `Boletim_Ocorrencia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Boletim_Ocorrencia` (
  `ID_Bol` int NOT NULL,
  `CPF` char(11) NOT NULL,
  `ID_Func` int NOT NULL,
  PRIMARY KEY (`ID_Bol`),
  KEY `CPF` (`CPF`),
  KEY `Boletim_Ocorrencia_ibfk_2` (`ID_Func`),
  CONSTRAINT `Boletim_Ocorrencia_ibfk_1` FOREIGN KEY (`CPF`) REFERENCES `Vitima` (`CPF`),
  CONSTRAINT `Boletim_Ocorrencia_ibfk_2` FOREIGN KEY (`ID_Func`) REFERENCES `Atendente` (`ID_Func`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Boletim_Ocorrencia`
--

LOCK TABLES `Boletim_Ocorrencia` WRITE;
/*!40000 ALTER TABLE `Boletim_Ocorrencia` DISABLE KEYS */;
INSERT INTO `Boletim_Ocorrencia` VALUES (1,'01234567810',6),(2,'01234567821',7),(3,'01234567899',8),(4,'12345678900',9),(5,'12345678901',10),(6,'12345678912',6),(7,'12345678923',7),(8,'12345678971',8),(9,'23456789011',9),(10,'23456789012',10);
/*!40000 ALTER TABLE `Boletim_Ocorrencia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Boletim_Registro`
--

DROP TABLE IF EXISTS `Boletim_Registro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Boletim_Registro` (
  `ID_Bol` int NOT NULL,
  `ID_Reg` int NOT NULL,
  PRIMARY KEY (`ID_Bol`,`ID_Reg`),
  KEY `ID_Reg` (`ID_Reg`),
  CONSTRAINT `Boletim_Registro_ibfk_1` FOREIGN KEY (`ID_Bol`) REFERENCES `Boletim_Ocorrencia` (`ID_Bol`),
  CONSTRAINT `Boletim_Registro_ibfk_2` FOREIGN KEY (`ID_Reg`) REFERENCES `Registro_Criminal` (`ID_Reg`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Boletim_Registro`
--

LOCK TABLES `Boletim_Registro` WRITE;
/*!40000 ALTER TABLE `Boletim_Registro` DISABLE KEYS */;
INSERT INTO `Boletim_Registro` VALUES (1,1),(2,2),(3,3),(4,4),(5,5),(6,6),(7,7),(8,8),(9,9),(10,10);
/*!40000 ALTER TABLE `Boletim_Registro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Delegado`
--

DROP TABLE IF EXISTS `Delegado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Delegado` (
  `ID_Func` int NOT NULL,
  KEY `ID_Func` (`ID_Func`),
  CONSTRAINT `Delegado_ibfk_1` FOREIGN KEY (`ID_Func`) REFERENCES `Policial` (`ID_Func`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Delegado`
--

LOCK TABLES `Delegado` WRITE;
/*!40000 ALTER TABLE `Delegado` DISABLE KEYS */;
INSERT INTO `Delegado` VALUES (26),(27),(28),(29),(30);
/*!40000 ALTER TABLE `Delegado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Equipamento`
--

DROP TABLE IF EXISTS `Equipamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Equipamento` (
  `ID_Equip` int NOT NULL,
  `Tipo` varchar(50) NOT NULL,
  `Modelo` varchar(50) NOT NULL,
  `ID_Func` int NOT NULL,
  PRIMARY KEY (`ID_Equip`),
  KEY `ID_Func` (`ID_Func`),
  CONSTRAINT `Equipamento_ibfk_1` FOREIGN KEY (`ID_Func`) REFERENCES `Policial` (`ID_Func`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Equipamento`
--

LOCK TABLES `Equipamento` WRITE;
/*!40000 ALTER TABLE `Equipamento` DISABLE KEYS */;
INSERT INTO `Equipamento` VALUES (1,'Colete','Colete Balístico X1',11),(2,'Colete','Colete Balístico X2',12),(3,'Colete','Colete Tático V3',13),(4,'Colete','Colete Protetor Y4',14),(5,'Colete','Colete Anti-Impacto Z5',15),(6,'Colete','Colete Militar M6',16),(7,'Colete','Colete Urbano N7',17),(8,'Colete','Colete Anti-Furto O8',18),(9,'Colete','Colete Tático P9',19),(10,'Colete','Colete de Proteção Q10',20),(11,'Arma Branca','Faca Tática A1',11),(12,'Arma Branca','Porrete de Madeira B2',12),(13,'Arma Branca','Faca de Sobrevivência C3',13),(14,'Arma Branca','Cachimbo de Metal D4',14),(15,'Arma Branca','Facão E5',15),(16,'Arma Branca','Canivete Militar F6',16),(17,'Arma Branca','Porrete de Ferro G7',17),(18,'Arma Branca','Faca de Campo H8',18),(19,'Arma Branca','Espada de Treinamento I9',19),(20,'Arma Branca','Porrete Elétrico J10',20),(21,'Arma de Fogo','Pistola 9mm K1',11),(22,'Arma de Fogo','Revólver .38 L2',12),(23,'Arma de Fogo','Fuzil AR-15 M3',13),(24,'Arma de Fogo','Carabina de Assalto AK-47 N4',14),(25,'Arma de Fogo','Pistola .40 O5',15),(26,'Arma de Fogo','Rifle de Precisão P6',16),(27,'Arma de Fogo','Submetralhadora Uzi Q7',17),(28,'Arma de Fogo','Espingarda Remington R8',18),(29,'Arma de Fogo','Pistola Glock 17 S9',19),(30,'Arma de Fogo','Fuzil de Assalto F2000 T10',20);
/*!40000 ALTER TABLE `Equipamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Equipamento_Protecao`
--

DROP TABLE IF EXISTS `Equipamento_Protecao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Equipamento_Protecao` (
  `ID_Equip` int NOT NULL,
  `Nivel_Protecao_Balistica` enum('IIA','II','IIIA','III','IV') NOT NULL,
  KEY `ID_Equip` (`ID_Equip`),
  CONSTRAINT `Equipamento_Protecao_ibfk_1` FOREIGN KEY (`ID_Equip`) REFERENCES `Equipamento` (`ID_Equip`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Equipamento_Protecao`
--

LOCK TABLES `Equipamento_Protecao` WRITE;
/*!40000 ALTER TABLE `Equipamento_Protecao` DISABLE KEYS */;
INSERT INTO `Equipamento_Protecao` VALUES (1,'III'),(2,'III'),(3,'IIIA'),(4,'IIIA'),(5,'II'),(6,'IIIA'),(7,'II'),(8,'IIIA'),(9,'III'),(10,'II');
/*!40000 ALTER TABLE `Equipamento_Protecao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Escrivao`
--

DROP TABLE IF EXISTS `Escrivao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Escrivao` (
  `ID_Func` int NOT NULL,
  KEY `ID_Func` (`ID_Func`),
  CONSTRAINT `Escrivao_ibfk_1` FOREIGN KEY (`ID_Func`) REFERENCES `Funcionario` (`ID_Func`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Escrivao`
--

LOCK TABLES `Escrivao` WRITE;
/*!40000 ALTER TABLE `Escrivao` DISABLE KEYS */;
INSERT INTO `Escrivao` VALUES (1),(2),(3),(4),(5);
/*!40000 ALTER TABLE `Escrivao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Evidencias`
--

DROP TABLE IF EXISTS `Evidencias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Evidencias` (
  `ID_Evi` int NOT NULL,
  `Descricao` varchar(100) DEFAULT NULL,
  `ID_Func` int NOT NULL,
  PRIMARY KEY (`ID_Evi`),
  KEY `ID_Func` (`ID_Func`),
  CONSTRAINT `Evidencias_ibfk_1` FOREIGN KEY (`ID_Func`) REFERENCES `Investigador` (`ID_Func`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Evidencias`
--

LOCK TABLES `Evidencias` WRITE;
/*!40000 ALTER TABLE `Evidencias` DISABLE KEYS */;
INSERT INTO `Evidencias` VALUES (1,'Impressões digitais encontradas na cena do crime',21),(2,'Arma do crime com vestígios de sangue',22),(3,'Câmera de segurança capturou o suspeito',23),(4,'Depoimento de testemunha ocular',24),(5,'Análise de DNA compatível com o suspeito',25),(6,'Relatório de perícia no local do crime',21),(7,'Celular do suspeito com mensagens incriminatórias',22),(8,'Computador com histórico de pesquisa suspeita',23),(9,'Gravações de áudio de ameaças',24),(10,'Registro de chamadas entre os suspeitos',25),(11,'Documentos falsificados encontrados',21),(12,'Fotos da cena do crime',22),(13,'Relatório de balística confirmando o uso da arma',23),(14,'Vestígios de substâncias ilícitas',24),(15,'Extrato bancário indicando transações suspeitas',25);
/*!40000 ALTER TABLE `Evidencias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Funcionario`
--

DROP TABLE IF EXISTS `Funcionario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Funcionario` (
  `ID_Func` int NOT NULL,
  `CPF` char(11) NOT NULL,
  `Salario` decimal(10,2) DEFAULT NULL,
  `Funcao` varchar(50) NOT NULL,
  PRIMARY KEY (`ID_Func`),
  KEY `CPF` (`CPF`),
  CONSTRAINT `Funcionario_ibfk_1` FOREIGN KEY (`CPF`) REFERENCES `Pessoa` (`CPF`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Funcionario`
--

LOCK TABLES `Funcionario` WRITE;
/*!40000 ALTER TABLE `Funcionario` DISABLE KEYS */;
INSERT INTO `Funcionario` VALUES (1,'01234567822',2500.00,'Escrivão'),(2,'01234567833',2600.00,'Escrivão'),(3,'12345678924',2700.00,'Escrivão'),(4,'12345678935',2800.00,'Escrivão'),(5,'23456789046',2900.00,'Escrivão'),(6,'34567890156',3000.00,'Atendente'),(7,'34567890167',3100.00,'Atendente'),(8,'45678901267',3200.00,'Atendente'),(9,'45678901278',3300.00,'Atendente'),(10,'56789012344',3400.00,'Atendente'),(11,'56789012345',2500.00,'Policial'),(12,'56789012356',2600.00,'Policial'),(13,'56789012357',2700.00,'Policial'),(14,'56789012368',2800.00,'Policial'),(15,'67890123455',2900.00,'Policial'),(16,'67890123456',3000.00,'Policial'),(17,'67890123467',3100.00,'Policial'),(18,'67890123478',3200.00,'Policial'),(19,'67890123489',3300.00,'Policial'),(20,'78901234566',3400.00,'Policial'),(21,'78901234567',2500.00,'Investigador'),(22,'78901234578',2600.00,'Investigador'),(23,'78901234579',2700.00,'Investigador'),(24,'78901234580',2800.00,'Investigador'),(25,'89012345677',2900.00,'Investigador'),(26,'89012345678',3000.00,'Delegado'),(27,'89012345680',3100.00,'Delegado'),(28,'89012345689',3200.00,'Delegado'),(29,'89012345691',3300.00,'Delegado'),(30,'90123456788',3400.00,'Delegado'),(31,'90123456789',3500.00,'Administrativo'),(32,'90123456790',3600.00,'Administrativo'),(33,'90123456791',3700.00,'Administrativo'),(34,'90123456792',3800.00,'Administrativo'),(35,'67890123489',3900.00,'Administrativo');
/*!40000 ALTER TABLE `Funcionario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Investigador`
--

DROP TABLE IF EXISTS `Investigador`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Investigador` (
  `ID_Func` int NOT NULL,
  KEY `ID_Func` (`ID_Func`),
  CONSTRAINT `Investigador_ibfk_1` FOREIGN KEY (`ID_Func`) REFERENCES `Policial` (`ID_Func`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Investigador`
--

LOCK TABLES `Investigador` WRITE;
/*!40000 ALTER TABLE `Investigador` DISABLE KEYS */;
INSERT INTO `Investigador` VALUES (21),(22),(23),(24),(25);
/*!40000 ALTER TABLE `Investigador` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Meliante`
--

DROP TABLE IF EXISTS `Meliante`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Meliante` (
  `CPF` char(11) NOT NULL,
  KEY `CPF` (`CPF`),
  CONSTRAINT `Meliante_ibfk_1` FOREIGN KEY (`CPF`) REFERENCES `Pessoa` (`CPF`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Meliante`
--

LOCK TABLES `Meliante` WRITE;
/*!40000 ALTER TABLE `Meliante` DISABLE KEYS */;
INSERT INTO `Meliante` VALUES ('23456789023'),('23456789034'),('34567890122'),('34567890123'),('34567890134'),('34567890145'),('45678901233'),('45678901234'),('45678901245'),('45678901256');
/*!40000 ALTER TABLE `Meliante` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Operacao`
--

DROP TABLE IF EXISTS `Operacao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Operacao` (
  `ID_Op` int NOT NULL,
  `ID_Func` int NOT NULL,
  `Data_Op` date DEFAULT NULL,
  PRIMARY KEY (`ID_Op`),
  KEY `ID_Func` (`ID_Func`),
  CONSTRAINT `Operacao_ibfk_1` FOREIGN KEY (`ID_Func`) REFERENCES `Delegado` (`ID_Func`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Operacao`
--

LOCK TABLES `Operacao` WRITE;
/*!40000 ALTER TABLE `Operacao` DISABLE KEYS */;
INSERT INTO `Operacao` VALUES (1,26,'2024-01-01'),(2,27,'2024-02-01'),(3,28,'2024-03-01'),(4,29,'2024-04-01'),(5,30,'2024-05-01'),(6,26,'2023-06-01'),(7,27,'2023-07-01'),(8,28,'2023-08-01'),(9,29,'2023-09-01'),(10,30,'2023-10-01'),(11,26,'2022-11-01'),(12,27,'2022-12-01'),(13,28,'2022-01-01'),(14,29,'2022-02-01'),(15,30,'2021-03-01'),(16,26,'2021-04-01'),(17,27,'2021-05-01'),(18,28,'2021-06-01'),(19,29,'2020-07-01'),(20,30,'2020-08-01');
/*!40000 ALTER TABLE `Operacao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Pessoa`
--

DROP TABLE IF EXISTS `Pessoa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Pessoa` (
  `CPF` char(11) NOT NULL,
  `Nome` varchar(100) NOT NULL,
  `Idade` int DEFAULT NULL,
  `Data_Nasc` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`CPF`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Pessoa`
--

LOCK TABLES `Pessoa` WRITE;
/*!40000 ALTER TABLE `Pessoa` DISABLE KEYS */;
INSERT INTO `Pessoa` VALUES ('00028922132','Tanenbaum da Silva',200,'1824-01-01'),('01234567810','Fábio Rodrigues',35,'1988-09-12'),('01234567821','Michele Silva',30,'1993-07-10'),('01234567822','Gustavo Lima',40,'1983-09-15'),('01234567833','Fernanda Souza',31,'1992-03-15'),('01234567899','Eduardo Silva',25,'1998-11-01'),('12345678900','Ana Silva',28,'1996-02-20'),('12345678901','João Silva',34,'1990-07-25'),('12345678912','Tatiane Silva',24,'1999-10-09'),('12345678923','Pedro Costa',38,'1985-08-17'),('12345678924','Simone Oliveira',29,'1994-02-25'),('12345678935','Júlio Costa',26,'1997-05-20'),('12345678971','Paula Fernandes',38,'1985-12-05'),('23456789011','João Oliveira',34,'1989-03-15'),('23456789012','Marcelo Souza',41,'1982-01-13'),('23456789023','Victor Fernandes',39,'1984-11-15'),('23456789034','Eliane Martins',29,'1994-09-21'),('23456789035','Amanda Souza',31,'1992-06-12'),('23456789046','Gabriela Lima',29,'1994-06-10'),('34567890122','Maria Santos',42,'1982-04-10'),('34567890123','Carla Castro',26,'1997-02-14'),('34567890134','Isabela Castro',27,'1996-12-20'),('34567890145','Henrique Castro',33,'1990-10-30'),('34567890156','Daniel Pereira',27,'1996-12-01'),('34567890167','Eduardo Silva',34,'1989-07-13'),('45678901233','Carlos Pereira',23,'2001-05-05'),('45678901234','Roberto Lima',30,'1993-03-18'),('45678901245','André Souza',31,'1992-01-08'),('45678901256','Letícia Lima',24,'1999-11-15'),('45678901267','Viviane Costa',33,'1991-03-22'),('45678901278','Camila Castro',27,'1996-08-22'),('56789012344','Fernanda Costa',31,'1993-06-25'),('56789012345','Luciana Oliveira',28,'1995-04-21'),('56789012356','Patrícia Lima',34,'1989-02-14'),('56789012357','Fernando Almeida',26,'1997-11-30'),('56789012368','Lúcia Almeida',38,'1985-09-18'),('67890123455','Rafael Almeida',27,'1996-07-12'),('67890123456','Gustavo Pereira',32,'1991-05-27'),('67890123467','Julio Oliveira',29,'1994-03-30'),('67890123478','Mariana Santos',32,'1991-07-19'),('67890123489','Robson Pereira',32,'1991-12-05'),('78901234566','Juliana Lima',29,'1994-08-19'),('78901234567','Sofia Santos',37,'1986-06-30'),('78901234578','Mariana Almeida',32,'1991-04-12'),('78901234579','Roberta Castro',28,'1995-04-07'),('78901234580','Larissa Oliveira',30,'1993-04-16'),('89012345677','Lucas Rodrigues',36,'1987-09-30'),('89012345678','Marcos Almeida',40,'1983-07-23'),('89012345680','Cláudia Silva',30,'1993-10-25'),('89012345689','Daniela Santos',35,'1988-05-18'),('89012345691','Marcelo Silva',26,'1997-06-01'),('90123456788','Beatriz Martins',33,'1990-10-22'),('90123456789','Aline Costa',29,'1994-08-17'),('90123456790','Rogério Rodrigues',27,'1996-06-24'),('90123456791','Thiago Martins',35,'1988-11-17'),('90123456792','Tatiane Costa',33,'1990-07-30');
/*!40000 ALTER TABLE `Pessoa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Policial`
--

DROP TABLE IF EXISTS `Policial`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Policial` (
  `ID_Func` int NOT NULL,
  KEY `ID_Func` (`ID_Func`),
  CONSTRAINT `Policial_ibfk_1` FOREIGN KEY (`ID_Func`) REFERENCES `Funcionario` (`ID_Func`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Policial`
--

LOCK TABLES `Policial` WRITE;
/*!40000 ALTER TABLE `Policial` DISABLE KEYS */;
INSERT INTO `Policial` VALUES (11),(11),(12),(12),(13),(13),(14),(14),(15),(15),(16),(16),(17),(17),(18),(18),(19),(19),(20),(20),(21),(22),(23),(24),(25),(26),(27),(28),(29),(30);
/*!40000 ALTER TABLE `Policial` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Policial_Operacao`
--

DROP TABLE IF EXISTS `Policial_Operacao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Policial_Operacao` (
  `ID_Op` int NOT NULL,
  `ID_Func` int NOT NULL,
  PRIMARY KEY (`ID_Func`,`ID_Op`),
  KEY `ID_Op` (`ID_Op`),
  CONSTRAINT `Policial_Operacao_ibfk_1` FOREIGN KEY (`ID_Op`) REFERENCES `Operacao` (`ID_Op`),
  CONSTRAINT `Policial_Operacao_ibfk_2` FOREIGN KEY (`ID_Func`) REFERENCES `Policial` (`ID_Func`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Policial_Operacao`
--

LOCK TABLES `Policial_Operacao` WRITE;
/*!40000 ALTER TABLE `Policial_Operacao` DISABLE KEYS */;
INSERT INTO `Policial_Operacao` VALUES (1,11),(1,12),(1,13),(1,14),(1,15),(1,16),(1,17),(1,18),(1,19),(1,20),(2,11),(2,12),(2,13),(2,16),(2,17),(2,18),(2,19),(2,20),(3,11),(3,12),(3,14),(3,15),(3,16),(3,17),(3,18),(3,19),(4,11),(4,13),(4,14),(4,15),(4,16),(4,17),(4,18),(4,19),(4,20),(5,12),(5,13),(5,14),(5,15),(5,16),(5,17),(5,18),(5,19),(5,20),(6,11),(6,12),(6,13),(6,14),(6,15),(6,16),(6,17),(6,18),(7,12),(7,13),(7,14),(7,15),(7,16),(7,17),(7,18),(7,19),(7,20),(8,11),(8,12),(8,14),(8,15),(8,16),(8,17),(8,18),(8,19),(9,12),(9,13),(9,14),(9,16),(9,17),(9,18),(9,19),(9,20),(10,11),(10,12),(10,13),(10,15),(10,16),(10,17),(10,18),(11,11),(11,12),(11,14),(11,15),(11,16),(11,17),(11,18),(11,19),(11,20),(12,12),(12,13),(12,14),(12,15),(12,16),(12,17),(12,18),(13,11),(13,12),(13,13),(13,15),(13,16),(13,17),(13,18),(13,19),(14,11),(14,13),(14,14),(14,15),(14,16),(14,17),(14,18),(14,20),(15,12),(15,13),(15,14),(15,15),(15,16),(15,17),(15,18),(16,11),(16,12),(16,13),(16,14),(16,16),(16,17),(16,18),(17,12),(17,13),(17,15),(17,16),(17,17),(17,18),(17,19),(18,11),(18,12),(18,13),(18,14),(18,15),(18,16),(18,17),(18,18),(19,11),(19,12),(19,13),(19,14),(19,15),(19,16),(19,17),(20,11),(20,12),(20,13),(20,15),(20,16),(20,17),(20,18);
/*!40000 ALTER TABLE `Policial_Operacao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Registro_Criminal`
--

DROP TABLE IF EXISTS `Registro_Criminal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Registro_Criminal` (
  `ID_Reg` int NOT NULL,
  `Tipo_Crime` varchar(100) NOT NULL,
  `Pena` varchar(150) NOT NULL,
  `CPF` char(11) NOT NULL,
  `ID_Func` int NOT NULL,
  PRIMARY KEY (`ID_Reg`),
  KEY `CPF` (`CPF`),
  KEY `ID_Func` (`ID_Func`),
  CONSTRAINT `Registro_Criminal_ibfk_1` FOREIGN KEY (`CPF`) REFERENCES `Meliante` (`CPF`),
  CONSTRAINT `Registro_Criminal_ibfk_2` FOREIGN KEY (`ID_Func`) REFERENCES `Escrivao` (`ID_Func`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Registro_Criminal`
--

LOCK TABLES `Registro_Criminal` WRITE;
/*!40000 ALTER TABLE `Registro_Criminal` DISABLE KEYS */;
INSERT INTO `Registro_Criminal` VALUES (1,'Furto','2 anos de reclusão','23456789023',1),(2,'Roubo','4 anos de reclusão','23456789034',2),(3,'Tráfico de drogas','6 anos de reclusão','34567890122',3),(4,'Homicídio','12 anos de reclusão','34567890123',4),(5,'Estelionato','3 anos de reclusão','34567890134',5),(6,'Lesão corporal','1 ano de reclusão','34567890145',1),(7,'Porte ilegal de arma','2 anos de reclusão','45678901233',2),(8,'Lavagem de dinheiro','7 anos de reclusão','45678901234',3),(9,'Sequestro','8 anos de reclusão','45678901245',4),(10,'Corrupção','5 anos de reclusão','45678901256',5);
/*!40000 ALTER TABLE `Registro_Criminal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Veiculo`
--

DROP TABLE IF EXISTS `Veiculo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Veiculo` (
  `Placa` char(7) NOT NULL,
  `Modelo` varchar(50) NOT NULL,
  `Blindagem` varchar(50) NOT NULL,
  PRIMARY KEY (`Placa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Veiculo`
--

LOCK TABLES `Veiculo` WRITE;
/*!40000 ALTER TABLE `Veiculo` DISABLE KEYS */;
INSERT INTO `Veiculo` VALUES ('ABC1234','Toyota Corolla','Nível 3'),('BCD6789','Subaru Forester','Nível 3'),('DEF4567','Mercedes-Benz C-Class','Nível 4'),('GHI8901','Audi A4','Nível 2'),('JKL2345','Hyundai Tucson','Nível 3'),('LMN9012','Ford Mustang','Nível 4'),('MNO6789','Nissan X-Trail','Sem Blindagem'),('PQR0123','Jeep Compass','Nível 2'),('PQR3456','Chevrolet Tracker','Nível 3'),('STU4567','Kia Sportage','Nível 3'),('STU7890','Volkswagen Golf','Sem Blindagem'),('UVW1234','BMW 320i','Nível 3'),('VWX8901','Renault Duster','Sem Blindagem'),('XYZ5678','Honda Civic','Nível 2'),('YZA2345','Peugeot 3008','Nível 4');
/*!40000 ALTER TABLE `Veiculo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Veiculo_Operacao`
--

DROP TABLE IF EXISTS `Veiculo_Operacao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Veiculo_Operacao` (
  `ID_Op` int NOT NULL,
  `Placa` char(7) NOT NULL,
  PRIMARY KEY (`ID_Op`,`Placa`),
  KEY `Placa` (`Placa`),
  CONSTRAINT `Veiculo_Operacao_ibfk_1` FOREIGN KEY (`ID_Op`) REFERENCES `Operacao` (`ID_Op`),
  CONSTRAINT `Veiculo_Operacao_ibfk_2` FOREIGN KEY (`Placa`) REFERENCES `Veiculo` (`Placa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Veiculo_Operacao`
--

LOCK TABLES `Veiculo_Operacao` WRITE;
/*!40000 ALTER TABLE `Veiculo_Operacao` DISABLE KEYS */;
INSERT INTO `Veiculo_Operacao` VALUES (1,'ABC1234'),(16,'ABC1234'),(15,'BCD6789'),(7,'DEF4567'),(8,'GHI8901'),(9,'JKL2345'),(3,'LMN9012'),(18,'LMN9012'),(10,'MNO6789'),(11,'PQR0123'),(4,'PQR3456'),(19,'PQR3456'),(12,'STU4567'),(5,'STU7890'),(20,'STU7890'),(6,'UVW1234'),(13,'VWX8901'),(2,'XYZ5678'),(17,'XYZ5678'),(14,'YZA2345');
/*!40000 ALTER TABLE `Veiculo_Operacao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Vitima`
--

DROP TABLE IF EXISTS `Vitima`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Vitima` (
  `CPF` char(11) NOT NULL,
  KEY `CPF` (`CPF`),
  CONSTRAINT `Vitima_ibfk_1` FOREIGN KEY (`CPF`) REFERENCES `Pessoa` (`CPF`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Vitima`
--

LOCK TABLES `Vitima` WRITE;
/*!40000 ALTER TABLE `Vitima` DISABLE KEYS */;
INSERT INTO `Vitima` VALUES ('00028922132'),('01234567810'),('01234567821'),('01234567899'),('12345678900'),('12345678901'),('12345678912'),('12345678923'),('12345678971'),('23456789011'),('23456789012');
/*!40000 ALTER TABLE `Vitima` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-08-01 10:58:07
