-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Nov 22, 2019 at 05:26 AM
-- Server version: 10.1.16-MariaDB
-- PHP Version: 5.6.24

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `movie_theater`
--

-- --------------------------------------------------------

--
-- Table structure for table `tb_actor`
--

CREATE TABLE `tb_actor` (
  `actor_id` int(11) NOT NULL,
  `movie_id` int(11) NOT NULL,
  `actor_nm` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_actor`
--

INSERT INTO `tb_actor` (`actor_id`, `movie_id`, `actor_nm`) VALUES
(1, 1, 'Elizabeth'),
(2, 1, 'Marcopolo'),
(3, 2, 'John Stratam'),
(4, 3, 'Johny Reevess'),
(5, 4, 'Margareth Liu'),
(6, 4, 'Gate. B. John');

-- --------------------------------------------------------

--
-- Table structure for table `tb_category`
--

CREATE TABLE `tb_category` (
  `category_id` int(11) NOT NULL,
  `category_nm` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_category`
--

INSERT INTO `tb_category` (`category_id`, `category_nm`) VALUES
(1, 'Drama'),
(2, 'Action'),
(3, 'Comedy'),
(4, 'Mystery');

-- --------------------------------------------------------

--
-- Table structure for table `tb_movie`
--

CREATE TABLE `tb_movie` (
  `movie_id` int(11) NOT NULL,
  `movie_tittle` text NOT NULL,
  `movie_desc` text NOT NULL,
  `movie_year` int(11) NOT NULL,
  `movie_price` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_movie`
--

INSERT INTO `tb_movie` (`movie_id`, `movie_tittle`, `movie_desc`, `movie_year`, `movie_price`) VALUES
(1, 'Harry Potter', 'Harry Potter Part 1', 2009, 50000),
(2, 'The Journey Of Pinokio', 'Pinokio and his journey begin', 2006, 40000),
(3, 'Godzilla 2019', 'A new era of godzila arise', 2019, 60000),
(4, 'I Want To Eat Your Pankreas', 'a classic story movie from Japan', 2019, 50000);

-- --------------------------------------------------------

--
-- Table structure for table `tb_movie_category`
--

CREATE TABLE `tb_movie_category` (
  `movie_cat_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `movie_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_movie_category`
--

INSERT INTO `tb_movie_category` (`movie_cat_id`, `category_id`, `movie_id`) VALUES
(1, 2, 1),
(2, 4, 1),
(3, 1, 2),
(4, 3, 2),
(5, 1, 3),
(6, 1, 4);

-- --------------------------------------------------------

--
-- Table structure for table `tb_schedule`
--

CREATE TABLE `tb_schedule` (
  `schedule_id` int(11) NOT NULL,
  `movie_id` int(11) NOT NULL,
  `schedule_date` date NOT NULL,
  `schedule_time` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_schedule`
--

INSERT INTO `tb_schedule` (`schedule_id`, `movie_id`, `schedule_date`, `schedule_time`) VALUES
(1, 1, '2019-11-21', '10:00:00'),
(2, 1, '2019-11-21', '13:00:00'),
(3, 1, '2019-11-21', '20:00:00'),
(4, 2, '2019-11-21', '15:00:00'),
(5, 2, '2019-11-22', '10:00:00'),
(6, 3, '2019-11-22', '13:00:00'),
(7, 4, '2019-11-22', '16:00:00');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tb_actor`
--
ALTER TABLE `tb_actor`
  ADD PRIMARY KEY (`actor_id`),
  ADD KEY `movie_id` (`movie_id`);

--
-- Indexes for table `tb_category`
--
ALTER TABLE `tb_category`
  ADD PRIMARY KEY (`category_id`);

--
-- Indexes for table `tb_movie`
--
ALTER TABLE `tb_movie`
  ADD PRIMARY KEY (`movie_id`);

--
-- Indexes for table `tb_movie_category`
--
ALTER TABLE `tb_movie_category`
  ADD PRIMARY KEY (`movie_cat_id`),
  ADD KEY `movie_id` (`movie_id`),
  ADD KEY `category_id` (`category_id`);

--
-- Indexes for table `tb_schedule`
--
ALTER TABLE `tb_schedule`
  ADD PRIMARY KEY (`schedule_id`),
  ADD KEY `movie_id` (`movie_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tb_actor`
--
ALTER TABLE `tb_actor`
  MODIFY `actor_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `tb_category`
--
ALTER TABLE `tb_category`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `tb_movie`
--
ALTER TABLE `tb_movie`
  MODIFY `movie_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `tb_movie_category`
--
ALTER TABLE `tb_movie_category`
  MODIFY `movie_cat_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `tb_schedule`
--
ALTER TABLE `tb_schedule`
  MODIFY `schedule_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `tb_actor`
--
ALTER TABLE `tb_actor`
  ADD CONSTRAINT `tb_actor_ibfk_1` FOREIGN KEY (`movie_id`) REFERENCES `tb_movie` (`movie_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `tb_actor_ibfk_2` FOREIGN KEY (`movie_id`) REFERENCES `tb_movie` (`movie_id`) ON UPDATE CASCADE;

--
-- Constraints for table `tb_movie_category`
--
ALTER TABLE `tb_movie_category`
  ADD CONSTRAINT `tb_movie_category_ibfk_1` FOREIGN KEY (`movie_id`) REFERENCES `tb_movie` (`movie_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `tb_movie_category_ibfk_2` FOREIGN KEY (`category_id`) REFERENCES `tb_category` (`category_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `tb_movie_category_ibfk_3` FOREIGN KEY (`movie_id`) REFERENCES `tb_movie` (`movie_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `tb_movie_category_ibfk_4` FOREIGN KEY (`category_id`) REFERENCES `tb_category` (`category_id`) ON UPDATE CASCADE;

--
-- Constraints for table `tb_schedule`
--
ALTER TABLE `tb_schedule`
  ADD CONSTRAINT `tb_schedule_ibfk_1` FOREIGN KEY (`movie_id`) REFERENCES `tb_movie` (`movie_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `tb_schedule_ibfk_2` FOREIGN KEY (`movie_id`) REFERENCES `tb_movie` (`movie_id`) ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
