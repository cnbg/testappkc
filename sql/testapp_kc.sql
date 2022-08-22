-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               8.0.19 - MySQL Community Server - GPL
-- Server OS:                    Win64
-- HeidiSQL Version:             12.1.0.6540
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for testapp_kc
CREATE DATABASE IF NOT EXISTS `testapp_kc` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `testapp_kc`;

-- Dumping structure for table testapp_kc.api_users
CREATE TABLE IF NOT EXISTS `api_users` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `api_key` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table testapp_kc.api_users: ~1 rows (approximately)
DELETE FROM `api_users`;
INSERT INTO `api_users` (`id`, `username`, `password`, `api_key`) VALUES
	(1, 'demo', '$2y$10$e4iXORiIC.Em0DlNcS97mOONM8d9vIqR78MuW0C1PkAWE3cL4g8oK', 'fe01ce2a7fbac8fafaed7c982a04e229-630175bf88dcf1.28105803');

-- Dumping structure for table testapp_kc.groups
CREATE TABLE IF NOT EXISTS `groups` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table testapp_kc.groups: ~1 rows (approximately)
DELETE FROM `groups`;
INSERT INTO `groups` (`id`, `name`) VALUES
	(1, 'Default group'),
	(4, 'Special group');

-- Dumping structure for table testapp_kc.students
CREATE TABLE IF NOT EXISTS `students` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `group_id` int unsigned DEFAULT NULL,
  `status` tinyint unsigned DEFAULT '0',
  `username` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  KEY `fk_student_group` (`group_id`),
  CONSTRAINT `fk_student_group` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table testapp_kc.students: ~25 rows (approximately)
DELETE FROM `students`;
INSERT INTO `students` (`id`, `group_id`, `status`, `username`, `name`) VALUES
	(1, 1, 1, 'kctest00202', 'Bernardo Santini'),
	(2, 1, 1, 'kctest00203', 'George Quebedo'),
	(3, 4, 0, 'kctest00204', 'Rob Schneider'),
	(4, 1, 1, 'kctest00205', 'Terry Cruz'),
	(5, 4, 1, 'kctest00206', 'David Smith'),
	(7, 1, 0, 'kctest00207', 'John Terry'),
	(8, 4, 1, 'kctest00208', 'David Alaba'),
	(11, 1, 1, 'kctest00209', 'Maxi Lopez'),
	(12, 4, 1, 'kctest00210', 'Lessandro Gomez'),
	(13, 1, 0, 'kctest00211', 'Alvaro Morata'),
	(14, 1, 1, 'kctest00212', 'Luis Suarez'),
	(15, 1, 1, 'kctest00213', 'Michael Owen'),
	(16, 4, 0, 'kctest00214', 'Adama Traore'),
	(17, 1, 1, 'kctest00215', 'Jibril Cisse'),
	(18, 1, 1, 'kctest00216', 'John Oshea'),
	(19, 4, 0, 'kctest00217', 'Milinkovic Savic'),
	(20, 1, 1, 'kctest00218', 'Bernardo Silva'),
	(21, 1, 1, 'kctest00219', 'Carloz Tevez'),
	(22, 4, 0, 'kctest00220', 'Christian Pulisic'),
	(23, 1, 1, 'kctest00221', 'Thomas Muller'),
	(24, 1, 0, 'kctest00222', 'Robert Lewa'),
	(25, 4, 1, 'kctest00223', 'Manuel Nueuer'),
	(26, 1, 0, 'kctest00224', 'Roberto Mancini'),
	(27, 1, 1, 'kctest00225', 'Thomas Tuchel'),
	(28, 1, 1, 'kctest00226', 'Antonio Conte');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
