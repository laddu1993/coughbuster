-- phpMyAdmin SQL Dump
-- version 4.8.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 26, 2018 at 04:37 PM
-- Server version: 10.1.32-MariaDB
-- PHP Version: 7.2.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `brozed`
--

-- --------------------------------------------------------

--
-- Table structure for table `doctors`
--

CREATE TABLE `doctors` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `gender` enum('MALE','FEMALE') NOT NULL,
  `dob` date NOT NULL,
  `place` varchar(255) DEFAULT NULL,
  `tm_access_code` varchar(255) NOT NULL,
  `dml_no` varchar(100) DEFAULT NULL,
  `email_id` varchar(100) DEFAULT NULL,
  `mobile_no` varchar(100) NOT NULL,
  `pass` varchar(500) NOT NULL,
  `md_user_id` int(11) DEFAULT NULL,
  `user_status` int(11) NOT NULL DEFAULT '0' COMMENT '0=>active,1=>not active',
  `added_by` varchar(20) DEFAULT NULL,
  `added_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedOn` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `doctors`
--

INSERT INTO `doctors` (`id`, `name`, `gender`, `dob`, `place`, `tm_access_code`, `dml_no`, `email_id`, `mobile_no`, `pass`, `md_user_id`, `user_status`, `added_by`, `added_date`, `updatedOn`) VALUES
(2, 'Aniket Pharle', 'MALE', '1992-02-13', '', 'DR_786043409', NULL, 'aniket@gmail.com', '9658545221', 'rl5ajNpZ', 2, 0, 'admin@gmail.com', '2018-07-25 06:36:12', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `quiz`
--

CREATE TABLE `quiz` (
  `id` int(11) NOT NULL,
  `quiz_id` int(11) NOT NULL,
  `type` enum('AUDIO','VIDEO') NOT NULL,
  `question` varchar(500) DEFAULT NULL,
  `file_url` varchar(255) DEFAULT NULL,
  `show_answers` varchar(500) DEFAULT NULL,
  `correct_answer` varchar(100) DEFAULT NULL,
  `added_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedOn` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `quiz`
--

INSERT INTO `quiz` (`id`, `quiz_id`, `type`, `question`, `file_url`, `show_answers`, `correct_answer`, `added_date`, `updatedOn`) VALUES
(1, 0, 'AUDIO', 'asdasdasdasdasdasdas', 'http://localhost/userfiles/doctors/1/2019-Audi-A6-1-630x330.jpg', '[\"BROZEDEXLS\"]', 'BROZEDEXLS', '2018-07-26 14:24:14', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `quiz_details`
--

CREATE TABLE `quiz_details` (
  `id` int(11) NOT NULL,
  `doctor_id` int(11) NOT NULL,
  `quiz_id` bigint(20) NOT NULL,
  `added_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `gender` enum('MALE','FEMALE') NOT NULL,
  `dob` date NOT NULL,
  `place` varchar(255) DEFAULT NULL,
  `tm_access_code` varchar(255) NOT NULL,
  `dml_no` varchar(100) DEFAULT NULL,
  `email_id` varchar(100) DEFAULT NULL,
  `mobile_no` varchar(100) NOT NULL,
  `pass` varchar(500) NOT NULL,
  `user_type` int(11) DEFAULT NULL COMMENT '1=&gt;MR, 2=&gt;Super Admin',
  `user_status` int(11) NOT NULL DEFAULT '0' COMMENT '0=>active,1=>not active',
  `added_by` varchar(20) DEFAULT NULL,
  `added_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedOn` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `gender`, `dob`, `place`, `tm_access_code`, `dml_no`, `email_id`, `mobile_no`, `pass`, `user_type`, `user_status`, `added_by`, `added_date`, `updatedOn`) VALUES
(1, 'Admin', 'MALE', '1989-10-11', 'Mumbai', '', NULL, 'admin@gmail.com', '9876543210', 'wht6bd5lak/N7d', 2, 0, NULL, '2018-07-24 06:06:55', NULL),
(2, 'Dixit', 'MALE', '1999-02-03', 'Mumbai', 'MR_1944932137', NULL, 'dixit@gmail.com', '8878745651', 'wht6bd5lak/N7d', 1, 0, 'admin@gmail.com', '2018-07-24 06:43:00', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `webpage`
--

CREATE TABLE `webpage` (
  `Wp_Id` int(11) NOT NULL,
  `Wp_Name` varchar(500) NOT NULL,
  `Wp_Title` varchar(500) NOT NULL,
  `Wp_Key` varchar(500) NOT NULL,
  `Wp_Des` varchar(1000) NOT NULL,
  `Wp_Content` longtext NOT NULL,
  `Wp_ShortContent` longtext NOT NULL,
  `Wp_Created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Wp_Status` varchar(100) NOT NULL DEFAULT 'Active',
  `Wp_Last_UpdatedOn` datetime DEFAULT NULL,
  `Wp_UpdatedBy` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `webpage`
--

INSERT INTO `webpage` (`Wp_Id`, `Wp_Name`, `Wp_Title`, `Wp_Key`, `Wp_Des`, `Wp_Content`, `Wp_ShortContent`, `Wp_Created`, `Wp_Status`, `Wp_Last_UpdatedOn`, `Wp_UpdatedBy`) VALUES
(1, 'About Us', 'ABout Us', 'About', 'About', 'Our Story. Website.com began in 2005. After years in the web hosting ... you can create a professional website or online store using our free and intuitive tools.', '', '2017-03-08 13:11:00', 'Active', '2018-07-24 13:00:37', 'Dixit'),
(2, 'Disclamier', 'Disclamier', '', '', '', '', '2018-07-24 07:31:03', 'Active', NULL, 'Dixit');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `doctors`
--
ALTER TABLE `doctors`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `TM_` (`tm_access_code`);

--
-- Indexes for table `quiz`
--
ALTER TABLE `quiz`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `QUESTION_` (`quiz_id`);

--
-- Indexes for table `quiz_details`
--
ALTER TABLE `quiz_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `TM_` (`tm_access_code`);

--
-- Indexes for table `webpage`
--
ALTER TABLE `webpage`
  ADD PRIMARY KEY (`Wp_Id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `doctors`
--
ALTER TABLE `doctors`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `quiz`
--
ALTER TABLE `quiz`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `quiz_details`
--
ALTER TABLE `quiz_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `webpage`
--
ALTER TABLE `webpage`
  MODIFY `Wp_Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
