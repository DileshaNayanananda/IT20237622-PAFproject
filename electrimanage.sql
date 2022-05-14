-- phpMyAdmin SQL Dump
-- version 5.3.0-dev+20220503.92457c1607
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 14, 2022 at 04:40 PM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `electrimanage`
--

-- --------------------------------------------------------

--
-- Table structure for table `inquiry1`
--

CREATE TABLE `inquiry1` (
  `inquiryId` int(6) NOT NULL,
  `inquiry_name` varchar(200) NOT NULL,
  `inquiry_acc` varchar(40) NOT NULL,
  `inquiry_reason` varchar(100) NOT NULL,
  `inquiry_date` varchar(30) NOT NULL,
  `inquiry_pNo` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `payment1`
--

CREATE TABLE `payment1` (
  `paymnt_id` int(4) NOT NULL,
  `date_time` varchar(20) NOT NULL,
  `user_address` varchar(50) NOT NULL,
  `amount` varchar(10) NOT NULL,
  `payment_method` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `payment1`
--

INSERT INTO `payment1` (`paymnt_id`, `date_time`, `user_address`, `amount`, `payment_method`) VALUES
(2, '10-04-2022 & 10:30', 'Kandy', '1500', 'Card');

-- --------------------------------------------------------

--
-- Table structure for table `powercut1`
--

CREATE TABLE `powercut1` (
  `id` int(4) NOT NULL,
  `date` varchar(20) NOT NULL,
  `time` varchar(20) NOT NULL,
  `area` varchar(200) NOT NULL,
  `duration` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `user1`
--

CREATE TABLE `user1` (
  `user_id` int(8) NOT NULL,
  `user_name` varchar(200) NOT NULL,
  `email` varchar(100) NOT NULL,
  `address` varchar(200) NOT NULL,
  `phone_num` varchar(10) NOT NULL,
  `password` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user1`
--

INSERT INTO `user1` (`user_id`, `user_name`, `email`, `address`, `phone_num`, `password`) VALUES
(9, 'Jane', 'j@gmail.com', 'Kandy', '0117654321', 'qqqq'),
(10, 'John', 'john@gmail.com', 'Colombo', '5555555555', '3333'),
(15, 'Shane', 's@gmail.com', 'Anuradhapura', '0764566787', 'shane'),
(16, 'Watson', 'w@gmail.com', 'Galle', '0781234567', 'watson'),
(17, 'william', 'william@gmail.com', 'Jaffna', '0711234569', 'wiiliam');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `inquiry1`
--
ALTER TABLE `inquiry1`
  ADD PRIMARY KEY (`inquiryId`);

--
-- Indexes for table `payment1`
--
ALTER TABLE `payment1`
  ADD PRIMARY KEY (`paymnt_id`);

--
-- Indexes for table `powercut1`
--
ALTER TABLE `powercut1`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user1`
--
ALTER TABLE `user1`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `inquiry1`
--
ALTER TABLE `inquiry1`
  MODIFY `inquiryId` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `payment1`
--
ALTER TABLE `payment1`
  MODIFY `paymnt_id` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `powercut1`
--
ALTER TABLE `powercut1`
  MODIFY `id` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `user1`
--
ALTER TABLE `user1`
  MODIFY `user_id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;



