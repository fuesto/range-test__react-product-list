-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Jan 07, 2025 at 08:52 AM
-- Server version: 8.2.0
-- PHP Version: 8.2.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `product_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
CREATE TABLE IF NOT EXISTS `product` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `was_price` decimal(10,2) DEFAULT NULL,
  `reviews` int DEFAULT NULL,
  `img` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`id`, `name`, `price`, `was_price`, `reviews`, `img`) VALUES
(1, 'Nature Patterned Envelope Files', 1.00, NULL, 90, '1.jpg'),
(2, 'Manhatten Veneer Photobook', 7.99, 9.99, 70, '2.jpg'),
(3, 'Really Useful Box', 7.99, 9.99, NULL, '3.jpg'),
(4, 'Silver Mesh Tier Drawers', 25.99, NULL, 80, '4.jpg'),
(5, '14 Litre Waste Bin - Warm Grey', 2.99, NULL, 30, '5.jpg'),
(6, 'Punched Folder Pockets', 1.00, 2.00, 70, '6.jpg'),
(7, 'Natural Look Photo Album', 8.99, 11.99, NULL, '7.jpg'),
(8, 'Faux Leather Desk Organiser', 11.99, NULL, NULL, '8.jpg'),
(9, '14 Litre Waste Bin - Peppermint', 2.99, 3.99, 80, '9.jpg'),
(10, 'Flexi Cover Pocket Display Book', 2.49, NULL, NULL, '10.jpg'),
(11, 'Duo Leather Photo Album', 11.99, NULL, NULL, '11.jpg'),
(12, 'Silver Mesh Four Drawer Chest', 8.99, 11.99, NULL, '12.jpg');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
