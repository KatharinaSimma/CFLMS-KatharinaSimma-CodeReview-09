-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Nov 07, 2020 at 12:03 PM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.4.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cr09_katharina_simma_delivery`
--
CREATE DATABASE IF NOT EXISTS `cr09_katharina_simma_delivery` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `cr09_katharina_simma_delivery`;

-- --------------------------------------------------------

--
-- Table structure for table `address`
--

CREATE TABLE `address` (
  `address_id` int(11) NOT NULL,
  `address` varchar(55) DEFAULT NULL,
  `zip` int(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `address`
--

INSERT INTO `address` (`address_id`, `address`, `zip`) VALUES
(1, 'Street of Alchemists 42', 1010),
(2, 'Easy Street 15', 1020),
(3, 'Dolly Sisters 4', 1100),
(4, 'Sator Square 666', 1040),
(5, 'The Shades 13', 1100),
(6, 'Scoone Avenue 5', 1100),
(7, 'Pseudopolis Yard 1', 1010);

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `customer_id` int(11) NOT NULL,
  `first_name` varchar(55) NOT NULL,
  `last_name` varchar(55) NOT NULL,
  `fk_address_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`customer_id`, `first_name`, `last_name`, `fk_address_id`) VALUES
(1, 'Samuel', 'Vimes', 7),
(2, 'Carrot', 'Ironfoundersson', 7),
(3, 'Angua', 'von Überwald', 7),
(4, 'Adora Belle', 'Dearheart', 4),
(5, 'Harry', 'King', 5),
(6, 'CMOT', 'Dibbler', 1),
(7, 'Rosemary', 'Palm', 2),
(8, 'William', 'de Worde', 4);

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE `employee` (
  `employee_id` int(11) NOT NULL,
  `first_name` char(55) DEFAULT NULL,
  `last_name` char(55) DEFAULT NULL,
  `fk_office_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`employee_id`, `first_name`, `last_name`, `fk_office_id`) VALUES
(1, 'Moist', 'von Lipwick', 1),
(2, 'Stanley', 'Howler', 2),
(3, 'Tolliver', 'Groat', 3),
(4, 'Mister', 'Tiddles', 1);

-- --------------------------------------------------------

--
-- Table structure for table `office`
--

CREATE TABLE `office` (
  `office_id` int(11) NOT NULL,
  `capacity` int(11) DEFAULT NULL,
  `fk_address_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `office`
--

INSERT INTO `office` (`office_id`, `capacity`, `fk_address_id`) VALUES
(1, 5000, 4),
(2, 3000, 5),
(3, 8000, 6);

-- --------------------------------------------------------

--
-- Table structure for table `package`
--

CREATE TABLE `package` (
  `package_id` int(11) NOT NULL,
  `weight` int(11) DEFAULT NULL,
  `size` int(11) DEFAULT NULL,
  `postage` int(11) DEFAULT NULL,
  `drop_off_date` date DEFAULT NULL,
  `fk_customer_id` int(11) DEFAULT NULL,
  `fk_route_id` int(11) NOT NULL,
  `fk_address_id` int(11) DEFAULT NULL,
  `fk_office_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `package`
--

INSERT INTO `package` (`package_id`, `weight`, `size`, `postage`, `drop_off_date`, `fk_customer_id`, `fk_route_id`, `fk_address_id`, `fk_office_id`) VALUES
(1, 30, 4, 1, '2020-10-02', 8, 1, 7, 3),
(2, 29, 5, 2, '2020-10-03', 7, 3, 7, 3),
(3, 30, 4, 2, '2020-10-03', 6, 2, 7, 3),
(4, 28, 3, 1, '2020-10-05', 5, 3, 4, 2),
(5, 27, 1, 6, '2020-10-05', 4, 4, 7, 2),
(6, 26, 6, 1, '2020-10-05', 4, 3, 3, 2),
(7, 26, 1, 4, '2020-10-01', 4, 1, 2, 2),
(8, 26, 1, 1, '2020-10-01', 6, 3, 7, 1),
(9, 35, 1, 1, '2020-10-02', 1, 3, 5, 1),
(10, 50, 1, 1, '2020-10-02', 2, 3, 6, 1);

-- --------------------------------------------------------

--
-- Table structure for table `route`
--

CREATE TABLE `route` (
  `route_id` int(11) NOT NULL,
  `capacity` int(11) DEFAULT NULL,
  `delivery_date` date DEFAULT NULL,
  `fk_employee_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `route`
--

INSERT INTO `route` (`route_id`, `capacity`, `delivery_date`, `fk_employee_id`) VALUES
(1, 200, '2020-11-01', 4),
(2, 350, '2020-11-02', 4),
(3, 60, '2020-11-03', 4),
(4, 150, '2020-11-04', 4);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `address`
--
ALTER TABLE `address`
  ADD PRIMARY KEY (`address_id`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`customer_id`),
  ADD KEY `fk_address_id` (`fk_address_id`);

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`employee_id`),
  ADD KEY `fk_office_id` (`fk_office_id`);

--
-- Indexes for table `office`
--
ALTER TABLE `office`
  ADD PRIMARY KEY (`office_id`),
  ADD KEY `fk_address_id` (`fk_address_id`);

--
-- Indexes for table `package`
--
ALTER TABLE `package`
  ADD PRIMARY KEY (`package_id`),
  ADD KEY `fk_customer_id` (`fk_customer_id`),
  ADD KEY `fk_address_id` (`fk_address_id`),
  ADD KEY `fk_office_id` (`fk_office_id`),
  ADD KEY `fk_route_id` (`fk_route_id`);

--
-- Indexes for table `route`
--
ALTER TABLE `route`
  ADD PRIMARY KEY (`route_id`),
  ADD KEY `fk_employee_id` (`fk_employee_id`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `customer`
--
ALTER TABLE `customer`
  ADD CONSTRAINT `customer_ibfk_1` FOREIGN KEY (`fk_address_id`) REFERENCES `address` (`address_id`);

--
-- Constraints for table `employee`
--
ALTER TABLE `employee`
  ADD CONSTRAINT `employee_ibfk_1` FOREIGN KEY (`fk_office_id`) REFERENCES `office` (`office_id`);

--
-- Constraints for table `office`
--
ALTER TABLE `office`
  ADD CONSTRAINT `office_ibfk_1` FOREIGN KEY (`fk_address_id`) REFERENCES `address` (`address_id`);

--
-- Constraints for table `package`
--
ALTER TABLE `package`
  ADD CONSTRAINT `package_ibfk_1` FOREIGN KEY (`fk_customer_id`) REFERENCES `customer` (`customer_id`),
  ADD CONSTRAINT `package_ibfk_2` FOREIGN KEY (`fk_address_id`) REFERENCES `address` (`address_id`),
  ADD CONSTRAINT `package_ibfk_3` FOREIGN KEY (`fk_office_id`) REFERENCES `office` (`office_id`),
  ADD CONSTRAINT `package_ibfk_4` FOREIGN KEY (`fk_route_id`) REFERENCES `route` (`route_id`);

--
-- Constraints for table `route`
--
ALTER TABLE `route`
  ADD CONSTRAINT `route_ibfk_2` FOREIGN KEY (`fk_employee_id`) REFERENCES `employee` (`employee_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
