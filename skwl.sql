-- MySQL dump 10.13  Distrib 8.0.28, for macos12.2 (x86_64)
--
-- Host: localhost    Database: skwl
-- ------------------------------------------------------
-- Server version	8.0.28

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
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin` (
  `id` int NOT NULL AUTO_INCREMENT,
  `login` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES (1,'admin','root');
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chat`
--

DROP TABLE IF EXISTS `chat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `chat` (
  `id` int NOT NULL AUTO_INCREMENT,
  `creatorId` int DEFAULT NULL,
  `companionId` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_77b3c245a0b1252384b64e53f57` (`creatorId`),
  KEY `FK_a112487a7aef2b7b126119d3bff` (`companionId`),
  CONSTRAINT `FK_77b3c245a0b1252384b64e53f57` FOREIGN KEY (`creatorId`) REFERENCES `user` (`id`),
  CONSTRAINT `FK_a112487a7aef2b7b126119d3bff` FOREIGN KEY (`companionId`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chat`
--

LOCK TABLES `chat` WRITE;
/*!40000 ALTER TABLE `chat` DISABLE KEYS */;
/*!40000 ALTER TABLE `chat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `market_place`
--

DROP TABLE IF EXISTS `market_place`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `market_place` (
  `id` int NOT NULL AUTO_INCREMENT,
  `image_link` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `link` varchar(255) NOT NULL,
  `price` varchar(255) NOT NULL,
  `status` enum('published','draft') NOT NULL DEFAULT 'published',
  `created_at` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `userId` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_dec4e0a61972d346e8eb422d6d9` (`userId`),
  CONSTRAINT `FK_dec4e0a61972d346e8eb422d6d9` FOREIGN KEY (`userId`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `market_place`
--

LOCK TABLES `market_place` WRITE;
/*!40000 ALTER TABLE `market_place` DISABLE KEYS */;
INSERT INTO `market_place` VALUES (1,'image.Location','Keyboard','any link','22.40','published','2022-03-10 12:19:12.170570',5),(2,'image.Location','mouse','other link','22','published','2022-03-10 12:19:37.079797',5);
/*!40000 ALTER TABLE `market_place` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `marketplace_saved`
--

DROP TABLE IF EXISTS `marketplace_saved`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `marketplace_saved` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userId` int DEFAULT NULL,
  `marketplaceId` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_756b18d1198ffbd912c84cc1992` (`userId`),
  KEY `FK_1ce33d5872142e8e0ed0fac6a1d` (`marketplaceId`),
  CONSTRAINT `FK_1ce33d5872142e8e0ed0fac6a1d` FOREIGN KEY (`marketplaceId`) REFERENCES `market_place` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_756b18d1198ffbd912c84cc1992` FOREIGN KEY (`userId`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `marketplace_saved`
--

LOCK TABLES `marketplace_saved` WRITE;
/*!40000 ALTER TABLE `marketplace_saved` DISABLE KEYS */;
/*!40000 ALTER TABLE `marketplace_saved` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `message`
--

DROP TABLE IF EXISTS `message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `message` (
  `id` int NOT NULL AUTO_INCREMENT,
  `message` varchar(255) NOT NULL,
  `image_link` varchar(255) NOT NULL,
  `created_at` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `authorId` int DEFAULT NULL,
  `chatId` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_c72d82fa0e8699a141ed6cc41b3` (`authorId`),
  KEY `FK_619bc7b78eba833d2044153bacc` (`chatId`),
  CONSTRAINT `FK_619bc7b78eba833d2044153bacc` FOREIGN KEY (`chatId`) REFERENCES `chat` (`id`),
  CONSTRAINT `FK_c72d82fa0e8699a141ed6cc41b3` FOREIGN KEY (`authorId`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `message`
--

LOCK TABLES `message` WRITE;
/*!40000 ALTER TABLE `message` DISABLE KEYS */;
/*!40000 ALTER TABLE `message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notification`
--

DROP TABLE IF EXISTS `notification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notification` (
  `id` int NOT NULL AUTO_INCREMENT,
  `type` enum('folloving','message','likes') NOT NULL,
  `message` varchar(255) NOT NULL,
  `userId` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_1ced25315eb974b73391fb1c81b` (`userId`),
  CONSTRAINT `FK_1ced25315eb974b73391fb1c81b` FOREIGN KEY (`userId`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notification`
--

LOCK TABLES `notification` WRITE;
/*!40000 ALTER TABLE `notification` DISABLE KEYS */;
/*!40000 ALTER TABLE `notification` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `saved_videos`
--

DROP TABLE IF EXISTS `saved_videos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `saved_videos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userId` int DEFAULT NULL,
  `videoId` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_6f55d21959f723def0df544505c` (`userId`),
  KEY `FK_cb126ec9bd757700d47f6c14122` (`videoId`),
  CONSTRAINT `FK_6f55d21959f723def0df544505c` FOREIGN KEY (`userId`) REFERENCES `user` (`id`),
  CONSTRAINT `FK_cb126ec9bd757700d47f6c14122` FOREIGN KEY (`videoId`) REFERENCES `video` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `saved_videos`
--

LOCK TABLES `saved_videos` WRITE;
/*!40000 ALTER TABLE `saved_videos` DISABLE KEYS */;
/*!40000 ALTER TABLE `saved_videos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(255) NOT NULL,
  `second_name` varchar(255) NOT NULL,
  `username` varchar(255) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `header` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `website_link` varchar(255) DEFAULT NULL,
  `background_image` varchar(255) DEFAULT NULL,
  `plan` enum('non','base') DEFAULT NULL,
  `plan_end_date` datetime(6) DEFAULT CURRENT_TIMESTAMP(6),
  `is_blocked` tinyint NOT NULL DEFAULT '1',
  `stripe_customer_id` varchar(255) DEFAULT NULL,
  `user_id` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `IDX_e12875dfb3b1d92d7d7c5377e2` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'Артур','Деменський','Arthur','artur.demenskiy@gmail.com','https://lh3.googleusercontent.com/a-/AOh14Gir8hoi8Mi69T7YQB3VLIfYC594uirtRxurKWyjzg=s96-c','','','','red','base','2022-01-11 09:08:27.072000',0,'cus_L9NqBKYw0p1tH6',''),(2,'Артур','Деменський','Skitus','artur.demenskiy03@gmail.com','https://lh3.googleusercontent.com/a/AATXAJxuM7_jCLgty1utG5QoC6QD6dGTWobaduLOFIHX=s96-c','','','','green','non','2022-02-11 09:08:27.072000',0,'cus_L9NsFIsTnCu4FC',''),(3,'arthur','demenskiy',NULL,'artur.demenskiy123@gmail.com','asdasdasdasd',NULL,NULL,NULL,NULL,NULL,'2022-02-16 16:34:05.007000',0,'cus_LA8rBwZkeV9nl8',''),(5,'arthur','demenskiy',NULL,'artur123.demenskiy123@gmail.com','asdasdasdasd',NULL,NULL,NULL,NULL,NULL,'2022-02-16 16:39:19.072000',0,'cus_LA8wlI3cZN9FNe','123'),(6,'armen','sanoyan','armensanoyan','armensanoyan@gmail.com',NULL,NULL,NULL,NULL,NULL,NULL,'2022-03-09 12:55:20.201740',1,NULL,'777');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_followers`
--

DROP TABLE IF EXISTS `user_followers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_followers` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL,
  `followerId` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_347ce7a07457528a1779da8b8f3` (`userId`),
  KEY `FK_c3f56a3157b50bc8adcc6acf278` (`followerId`),
  CONSTRAINT `FK_347ce7a07457528a1779da8b8f3` FOREIGN KEY (`userId`) REFERENCES `user` (`id`),
  CONSTRAINT `FK_c3f56a3157b50bc8adcc6acf278` FOREIGN KEY (`followerId`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_followers`
--

LOCK TABLES `user_followers` WRITE;
/*!40000 ALTER TABLE `user_followers` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_followers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_videos`
--

DROP TABLE IF EXISTS `user_videos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_videos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL,
  `videoId` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_7aac6ea26fe1e59ba4281c6d734` (`userId`),
  KEY `FK_f274ca933d6595de32e7674242d` (`videoId`),
  CONSTRAINT `FK_7aac6ea26fe1e59ba4281c6d734` FOREIGN KEY (`userId`) REFERENCES `user` (`id`),
  CONSTRAINT `FK_f274ca933d6595de32e7674242d` FOREIGN KEY (`videoId`) REFERENCES `video` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_videos`
--

LOCK TABLES `user_videos` WRITE;
/*!40000 ALTER TABLE `user_videos` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_videos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `video`
--

DROP TABLE IF EXISTS `video`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `video` (
  `id` int NOT NULL AUTO_INCREMENT,
  `link` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `product_title` varchar(255) NOT NULL,
  `product_image_link` varchar(255) NOT NULL,
  `product_link` varchar(255) NOT NULL,
  `price` varchar(255) NOT NULL,
  `hashtag` varchar(255) NOT NULL,
  `isTranding` tinyint NOT NULL DEFAULT '1',
  `likes` int NOT NULL DEFAULT '0',
  `created_at` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `userId` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_74e27b13f8ac66f999400df12f6` (`userId`),
  CONSTRAINT `FK_74e27b13f8ac66f999400df12f6` FOREIGN KEY (`userId`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `video`
--

LOCK TABLES `video` WRITE;
/*!40000 ALTER TABLE `video` DISABLE KEYS */;
INSERT INTO `video` VALUES (1,'https://embed.api.video/vod/viFri9VAvemL87rQFIma1D8','New Year','Tree','https://th.bing.com/th/id/R.26cc24f1df080815f09fedba6caec40a?rik=3KzhbNRD6RNWpw&riu=http%3a%2f%2fwww.lovethispic.com%2fuploaded_images%2f46182-Snow-Falling.jpg&ehk=sSqM83BbLgHZAPquEkeNhl2p2jE%2boMYv8k9FTr3rF40%3d&risl=&pid=ImgRaw&r=0','https://th.bing.com/th/id/R.b6f03b06334b88006bd44b21a1f0d85a?rik=Vgnny98tlpUQjA&pid=ImgRaw&r=0','','#fishing',1,2,'2022-01-10 00:00:00.000000',1),(2,'https://qweqweqwe','Christmas','Stick','https://ertrytuyiyt','https://asdasdasdas','','#holidays',1,21,'2022-02-10 00:00:00.000000',1),(3,'https://qwqweqwe123123123eqweqwe','Ester','Branch','https://qweqweqweqwe3245678654','https://adsasdasdasd','','#rest',1,2,'2022-03-11 00:00:00.000000',2);
/*!40000 ALTER TABLE `video` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `videos_likes`
--

DROP TABLE IF EXISTS `videos_likes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `videos_likes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL,
  `videoId` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_b0d72a8de8e6c29b78f38dd8c2d` (`userId`),
  KEY `FK_dd2c3bf195f6fe3bd113683cc38` (`videoId`),
  CONSTRAINT `FK_b0d72a8de8e6c29b78f38dd8c2d` FOREIGN KEY (`userId`) REFERENCES `user` (`id`),
  CONSTRAINT `FK_dd2c3bf195f6fe3bd113683cc38` FOREIGN KEY (`videoId`) REFERENCES `video` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `videos_likes`
--

LOCK TABLES `videos_likes` WRITE;
/*!40000 ALTER TABLE `videos_likes` DISABLE KEYS */;
INSERT INTO `videos_likes` VALUES (3,6,1),(5,5,1);
/*!40000 ALTER TABLE `videos_likes` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-03-14 10:30:50
