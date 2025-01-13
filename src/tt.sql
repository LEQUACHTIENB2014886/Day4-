-- MySQL dump 10.13  Distrib 8.0.40, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: shop
-- ------------------------------------------------------
-- Server version	8.0.40

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
-- Table structure for table `carosel`
--

DROP TABLE IF EXISTS `carosel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `carosel` (
  `id` int NOT NULL AUTO_INCREMENT,
  `src` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carosel`
--

LOCK TABLES `carosel` WRITE;
/*!40000 ALTER TABLE `carosel` DISABLE KEYS */;
INSERT INTO `carosel` VALUES (1,'./src/assets/carosel/1.jpg'),(2,'./src/assets/carosel/2.jpg'),(3,'./src/assets/carosel/3.jpg'),(4,'./src/assets/carosel/4.jpg');
/*!40000 ALTER TABLE `carosel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `feedback`
--

DROP TABLE IF EXISTS `feedback`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `feedback` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `note` varchar(255) NOT NULL,
  `rate` tinyint DEFAULT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `feedback_chk_1` CHECK ((`rate` between 1 and 5))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `feedback`
--

LOCK TABLES `feedback` WRITE;
/*!40000 ALTER TABLE `feedback` DISABLE KEYS */;
/*!40000 ALTER TABLE `feedback` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `id` int NOT NULL AUTO_INCREMENT,
  `image` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `salePrice` varchar(255) DEFAULT NULL,
  `rate` decimal(3,1) DEFAULT NULL,
  `size` varchar(50) DEFAULT NULL,
  `quantity` varchar(50) DEFAULT NULL,
  `originalPrice` varchar(255) DEFAULT NULL,
  `sale` varchar(50) DEFAULT NULL,
  `brand` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'./src/assets/products/hoka/Mach 6 Wide/1.jpg','Giày Chạy Bộ Nam HOKA Mach 6 Wide','2.485.000',5.0,'37,38,39,40,41,42,43,44','3,6,5,10,4,8,1,9','3.550.000','*','Hoka'),(2,'./src/assets/products/hoka/Bondi 8/1.jpg','Giày Chạy Bộ Nam HOKA Bondi 8','1.800.000',4.2,'37,38,39,40,41,42,43,44','3,6,5,10,4,8,1,9','3.599.000','*','Hoka'),(3,'./src/assets/products/hoka/Rincon 4/1.jpg','Giày Chạy Bộ Nam HOKA Rincon 4','1.348.000',4.1,'37,38,39,40,41,42,43,44','2,7,3,8,12,6,0,10','2.695.000','*','Hoka'),(4,'./src/assets/products/hoka/Speedgoat 6/1.jpg','Giày Chạy Bộ Nam HOKA Speedgoat 6','2.589.000',4.9,'37,38,39,40,41,42,43,44','4,5,2,6,9,3,11,1','3.699.000','*','Hoka'),(5,'./src/assets/products/new_balance/237V1/1.jpg','Giày Thời Trang Unisex New Balance U327V1','1.644.000',4.3,'37,38,39,40,41,42,43,44','1,3,8,2,10,4,7,5','2.959.000','*','New Balance'),(6,'./src/assets/products/new_balance/Fresh Foam 680V7/1.jpg','Giày Chạy Bộ Nữ New Balance Fresh Foam 680V7','1.422.000',4.3,'37,38,39,40,41,42,43,44','9,4,6,3,7,1,5,2',' 2.559.000','*','New Balance'),(7,'./src/assets/products/new_balance/Fresh Foam Roav/1.jpg','Giày Chạy Bộ Nam New Balance Fresh Foam Roav','1.422.000',5.0,'37,38,39,40,41,42,43,44','8,2,9,6,1,7,3,4','2.559.000','*','New Balance'),(8,'./src/assets/products/new_balance/U327V1/1.jpg','Giày Thời Trang Unisex New Balance U327V1','1.644.000',5.0,'37,38,39,40,41,42,43,44','8,2,9,6,1,7,3,4','2.959.000','*','New Balance'),(9,'./src/assets/products/hoka/Stinson 7/1.jpg','Giày Chạy Bộ Nam HOKA Stinson 7','1.998.000',4.9,'37,38,39,40,41,42,43,44','8,2,9,6,1,7,3,4','3.995.000',NULL,'Hoka');
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-01-13 16:14:57
