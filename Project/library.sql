-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 17, 2023 at 04:45 AM
-- Server version: 10.4.20-MariaDB
-- PHP Version: 8.0.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `library`
--

-- --------------------------------------------------------

--
-- Table structure for table `book`
--

CREATE TABLE `book` (
  `name` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `auther` varchar(255) NOT NULL,
  `field` varchar(255) NOT NULL,
  `publicationData` varchar(255) NOT NULL,
  `pdfFileUrl` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `chapter`
--

CREATE TABLE `chapter` (
  `title` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `bookName` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `interactivebook`
--

CREATE TABLE `interactivebook` (
  `userEmail` varchar(255) NOT NULL,
  `bookName` varchar(255) NOT NULL,
  `dateTime` varchar(255) NOT NULL,
  `bookState` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `readershistory`
--

CREATE TABLE `readershistory` (
  `userEmail` varchar(255) NOT NULL,
  `bookName` varchar(255) NOT NULL,
  `date` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `phone` int(11) NOT NULL,
  `token` varchar(255) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `role` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0 --> normal user\r\n1 --> admin user'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`email`, `password`, `phone`, `token`, `status`, `role`) VALUES
('batsy@gmail.com', '$2b$10$Fbar3dKT8REbk0x07BRdCOCP9EIbOEaD7zqZs9a6g4zNspj5xrnXS', 0, '', 0, 0),
('m123@gmail.com', '$2b$10$ZFxPiAUY9VYFRy0zwsqTYOBlqcO4TpkHMjQsX4/Vv4hAJf/XxT7se', 0, '', 0, 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `book`
--
ALTER TABLE `book`
  ADD PRIMARY KEY (`name`);

--
-- Indexes for table `chapter`
--
ALTER TABLE `chapter`
  ADD KEY `bookName` (`bookName`);

--
-- Indexes for table `interactivebook`
--
ALTER TABLE `interactivebook`
  ADD KEY `bookName` (`bookName`),
  ADD KEY `userEmail` (`userEmail`);

--
-- Indexes for table `readershistory`
--
ALTER TABLE `readershistory`
  ADD KEY `bookName` (`bookName`),
  ADD KEY `userEmail` (`userEmail`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`email`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `chapter`
--
ALTER TABLE `chapter`
  ADD CONSTRAINT `chapter_ibfk_1` FOREIGN KEY (`bookName`) REFERENCES `book` (`name`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `interactivebook`
--
ALTER TABLE `interactivebook`
  ADD CONSTRAINT `interactivebook_ibfk_1` FOREIGN KEY (`bookName`) REFERENCES `book` (`name`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `interactivebook_ibfk_2` FOREIGN KEY (`userEmail`) REFERENCES `users` (`email`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `readershistory`
--
ALTER TABLE `readershistory`
  ADD CONSTRAINT `readershistory_ibfk_1` FOREIGN KEY (`bookName`) REFERENCES `book` (`name`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `readershistory_ibfk_2` FOREIGN KEY (`userEmail`) REFERENCES `users` (`email`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
