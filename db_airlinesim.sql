CREATE DATABASE  IF NOT EXISTS `airlinesim`;
USE `airlinesim`;
SET GLOBAL time_zone = '+3:00';

DROP TABLE IF EXISTS `finance`;
DROP TABLE IF EXISTS `disasters`;
DROP TABLE IF EXISTS `airplane`;
DROP TABLE IF EXISTS `ads`;
DROP TABLE IF EXISTS `users`;
DROP TABLE IF EXISTS `ticket`;
DROP TABLE IF EXISTS `staff`;
DROP TABLE IF EXISTS `loan`;
DROP TABLE IF EXISTS `flight`;
DROP TABLE IF EXISTS `airport`;

CREATE TABLE `finance` (
  `Balance` int(20) NOT NULL,
  `keyword` int(1) NOT NULL,
  PRIMARY KEY (`keyword`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
INSERT INTO `finance` VALUES (100000000,1);

CREATE TABLE `disasters` (
  `Disaster_Type` varchar(45) NOT NULL,
  `Disaster_Possibility` float NOT NULL,
  PRIMARY KEY (`Disaster_Type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
INSERT INTO `disasters` VALUES ('BirdInEngine',0.04),('Hijacking',0.04),('HumanError',0.15),('Lightning',0.05),('MechanicalFailure',0.09),('None',0.64),('Tornado',0.01);

 CREATE TABLE `airplane` (
  `AIRPLANE_ID` int(11) NOT NULL AUTO_INCREMENT,
  `MODEL` varchar(45) NOT NULL,
  `PRICE` int(11) NOT NULL,
  `SELL_PRICE` int(11) NOT NULL,
  `SEATS` int(11) NOT NULL,
  `SIZE` varchar(45) NOT NULL,
  `FLIGHT_ID` int(11) DEFAULT NULL,
  `CONDITION` int(11) NOT NULL,
  `REPAIR_COST` int(11) NOT NULL,
  `USE_COST` int(11) NOT NULL,
  `CAPTAIN` varchar(45) DEFAULT NULL,
  `CREW` varchar(45) DEFAULT NULL,
  `OWNED` varchar(3) NOT NULL,
  PRIMARY KEY (`AIRPLANE_ID`),
  UNIQUE KEY `ID_UNIQUE` (`AIRPLANE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `ads` (
  `ad_id` int(11) NOT NULL AUTO_INCREMENT,
  `ad_type` enum('TV','Magazines','Internet','Poster','Contest') NOT NULL,
  `ad_time` enum('3','6','9') NOT NULL,
  `ad_cost` int(11) DEFAULT NULL,
  `ad_running` varchar(45) NOT NULL DEFAULT 'No',
  `ad_impact` float DEFAULT NULL,
  PRIMARY KEY (`ad_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
INSERT INTO `ads` VALUES (1,'TV','3',3000,'No',0.2),(2,'TV','6',6000,'No',0.25),(3,'TV','9',9000,'No',0.3),(4,'Magazines','3',1500,'No',0.05),(5,'Magazines','6',3000,'No',0.1),(6,'Magazines','9',4500,'No',0.15),(7,'Internet','3',5000,'No',0.4),(8,'Internet','6',10000,'No',0.45),(9,'Internet','9',15000,'No',0.5),(10,'Poster','3',2000,'No',0.1),(11,'Poster','6',4000,'No',0.15),(12,'Poster','9',6000,'No',0.2),(13,'Contest','3',4000,'No',0.3),(14,'Contest','6',8000,'No',0.35),(15,'Contest','9',12000,'No',0.4);

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `ticket` (
  `price1` float DEFAULT NULL,
  `price2` float DEFAULT NULL,
  `price3` float DEFAULT NULL,
  `flight_id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`flight_id`)
  ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `staff` (
  `name` varchar(25) NOT NULL,
  `st_id` int(4) NOT NULL,
  `experience` int(1) NOT NULL,
  `salary` int(4) NOT NULL,
  `is_captain` tinyint(1) NOT NULL,
  `acquired` tinyint(1) NOT NULL,
  PRIMARY KEY (`st_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `loan` (
  `LOAN_ID` int(11) NOT NULL,
  `AMOUNT` int(11) NOT NULL,
  `PAYMENTS` int(11) NOT NULL,
  `INTEREST` float NOT NULL,
  PRIMARY KEY (`LOAN_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `airport` (
  `airport_name` varchar(25) NOT NULL,
  `price` int(8) NOT NULL,
  `is_available` tinyint(1) NOT NULL,
  `coordinates` varchar(25) NOT NULL,
  `airport_id` int(4) NOT NULL,
  `acquired` tinyint(1) NOT NULL,
  PRIMARY KEY (`airport_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
INSERT INTO `airport` VALUES ('Heathrow',1500000,1,'51.4700, 0.4543',2342,0),('Ελευθέριος Βενιζέλος',1800000,1,'37.9430, 23.9546',2348,0),('Ιωάννης Δασκαλογιάννης',1400000,1,'35.5316, 24.1485',2524,0),("Changi", 2400000, 1, "1.3644, 103.9915", 2245, 0),("Dubai airport", 4500000, 1, "25.2532, 553657", 2379, 0),("Newark", 2500000, 1, "40.6895, 74.1745", 2783, 0);


CREATE TABLE `flight` (
  `FLIGHT_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Startline` varchar(25) NOT NULL,
  `Destination` varchar(25) NOT NULL,
  `PLANE_ID` varchar(25) NOT NULL,
  `DAY` varchar(15) DEFAULT NULL,
  `Income` int(11) DEFAULT NULL,
  `Disaster` varchar(45) DEFAULT 'None',
  PRIMARY KEY (`FLIGHT_ID`)
   ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


