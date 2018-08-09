-- phpMyAdmin SQL Dump
-- version 4.8.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 07, 2018 at 01:10 PM
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
  `tm_access_code` varchar(255) DEFAULT NULL,
  `dml_no` varchar(100) DEFAULT NULL,
  `email_id` varchar(100) DEFAULT NULL,
  `mobile_no` varchar(100) NOT NULL,
  `pass` varchar(500) NOT NULL,
  `mr_user_id` int(11) DEFAULT NULL,
  `user_status` int(11) NOT NULL DEFAULT '0' COMMENT '0=>active,1=>not active',
  `added_by` varchar(20) DEFAULT NULL,
  `added_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `next_day` date DEFAULT NULL,
  `updatedOn` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `doctors`
--

INSERT INTO `doctors` (`id`, `name`, `gender`, `dob`, `place`, `tm_access_code`, `dml_no`, `email_id`, `mobile_no`, `pass`, `mr_user_id`, `user_status`, `added_by`, `added_date`, `next_day`, `updatedOn`) VALUES
(2, 'Aniket Pharle', 'MALE', '1992-02-13', '', '345345345', NULL, 'aniket@gmail.com', '9658545221', 'wht6bd5lak/N7d', 2, 0, 'admin@gmail.com', '2018-07-25 06:36:12', NULL, NULL),
(3, 'Vinil', 'MALE', '2018-07-19', 'Mumbai', '345345345', '5645', 'vinil.l@fi.com', '8894475769', 'wht6bd5lak/N7d', 2, 0, NULL, '2018-07-27 06:34:44', '2018-08-03', NULL),
(4, 'ABCD', 'MALE', '0000-00-00', 'Mumbai', '65465465', '5645', 'abcd@gmail.com', '5464565646', 'wht6bd5lak/N7d', 3, 0, NULL, '2018-08-06 11:16:31', '2018-08-07', NULL),
(5, 'XYZ', 'MALE', '1998-03-20', 'Mumbai', '65465465', '5645', 'xyz@gm.com', '5488565646', 'wht6bd5lak/N7d', 4, 0, NULL, '2018-08-06 11:17:58', '2018-08-07', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `prescription_result`
--

CREATE TABLE `prescription_result` (
  `id` int(11) NOT NULL,
  `prescription` text,
  `doctor_id` int(11) NOT NULL,
  `tm_access_code` varchar(255) NOT NULL,
  `added_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedOn` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `prescription_result`
--

INSERT INTO `prescription_result` (`id`, `prescription`, `doctor_id`, `tm_access_code`, `added_date`, `updatedOn`) VALUES
(1, 'What is Lorem Ipsum?', 2, '345345345', '2018-08-01 06:03:29', '0000-00-00 00:00:00'),
(2, 'Why do we use it?', 2, '345345345', '2018-08-01 06:03:29', '0000-00-00 00:00:00'),
(3, 'prescription2', 2, '345345345', '2018-08-01 06:03:29', '0000-00-00 00:00:00'),
(4, 'estsedfsdf', 2, '345345345', '2018-08-01 06:03:29', '0000-00-00 00:00:00'),
(5, 'sdffsdsdfsdfsdfdssdfgsdgfgfd', 2, '345345345', '2018-08-01 06:03:29', '0000-00-00 00:00:00'),
(6, 'What is Lorem Ipsum?', 3, '345345345', '2018-08-01 06:04:16', '0000-00-00 00:00:00'),
(7, 'Why do we use it?', 3, '345345345', '2018-08-01 06:04:16', '0000-00-00 00:00:00'),
(8, 'prescription2', 3, '345345345', '2018-08-01 06:04:16', '0000-00-00 00:00:00'),
(9, 'What is Lorem Ipsum?', 3, '345345345', '2018-08-02 09:52:32', '0000-00-00 00:00:00'),
(10, 'Why do we use it?', 3, '345345345', '2018-08-02 09:52:32', '0000-00-00 00:00:00'),
(11, 'prescription2', 3, '345345345', '2018-08-02 09:52:32', '0000-00-00 00:00:00'),
(12, 'estsedfsdf', 3, '345345345', '2018-08-02 09:52:33', '0000-00-00 00:00:00'),
(13, 'sdffsdsdfsdfsdfdssdfgsdgfgfd', 3, '345345345', '2018-08-02 09:52:33', '0000-00-00 00:00:00'),
(14, 'What is Lorem Ipsum?', 6, '65465465', '2018-08-07 05:17:25', '0000-00-00 00:00:00'),
(15, 'Why do we use it?', 6, '65465465', '2018-08-07 05:17:25', '0000-00-00 00:00:00'),
(16, 'sadsadsad', 6, '65465465', '2018-08-07 05:17:25', '0000-00-00 00:00:00'),
(17, 'ssadsadsadsadasd', 6, '65465465', '2018-08-07 05:17:25', '0000-00-00 00:00:00'),
(18, 'Why do we use it?', 6, '65465465', '2018-08-07 05:17:25', '0000-00-00 00:00:00'),
(19, 'What is Lorem Ipsum?', 6, '65465465', '2018-08-07 05:19:14', '0000-00-00 00:00:00'),
(20, 'Why do we use it?', 6, '65465465', '2018-08-07 05:19:14', '0000-00-00 00:00:00'),
(21, 'sadsadsad', 6, '65465465', '2018-08-07 05:19:14', '0000-00-00 00:00:00'),
(22, 'ssadsadsadsadasd', 6, '65465465', '2018-08-07 05:19:14', '0000-00-00 00:00:00'),
(23, 'Why do we use it?', 6, '65465465', '2018-08-07 05:19:14', '0000-00-00 00:00:00'),
(24, 'What is Lorem Ipsum?', 6, '65465465', '2018-08-07 05:19:15', '0000-00-00 00:00:00'),
(25, 'Why do we use it?', 6, '65465465', '2018-08-07 05:19:15', '0000-00-00 00:00:00'),
(26, 'sadsadsad', 6, '65465465', '2018-08-07 05:19:15', '0000-00-00 00:00:00'),
(27, 'ssadsadsadsadasd', 6, '65465465', '2018-08-07 05:19:15', '0000-00-00 00:00:00'),
(28, 'Why do we use it?', 6, '65465465', '2018-08-07 05:19:15', '0000-00-00 00:00:00'),
(29, 'What is Lorem Ipsum?', 5, '65465465', '2018-08-07 07:31:52', '0000-00-00 00:00:00'),
(30, 'Why do we use it?', 5, '65465465', '2018-08-07 07:31:52', '0000-00-00 00:00:00'),
(31, 'sadsadsad', 5, '65465465', '2018-08-07 07:31:52', '0000-00-00 00:00:00'),
(32, 'ssadsadsadsadasd', 5, '65465465', '2018-08-07 07:31:52', '0000-00-00 00:00:00'),
(33, 'Why do we use it?', 5, '65465465', '2018-08-07 07:31:52', '0000-00-00 00:00:00'),
(34, 'What is Lorem Ipsum?', 5, '65465465', '2018-08-07 07:32:31', '0000-00-00 00:00:00'),
(35, 'Why do we use it?', 5, '65465465', '2018-08-07 07:32:31', '0000-00-00 00:00:00'),
(36, 'sadsadsad', 5, '65465465', '2018-08-07 07:32:31', '0000-00-00 00:00:00'),
(37, 'ssadsadsadsadasd', 5, '65465465', '2018-08-07 07:32:31', '0000-00-00 00:00:00'),
(38, 'Why do we use it?', 5, '65465465', '2018-08-07 07:32:31', '0000-00-00 00:00:00'),
(39, 'What is Lorem Ipsum?', 5, '65465465', '2018-08-07 07:32:32', '0000-00-00 00:00:00'),
(40, 'Why do we use it?', 5, '65465465', '2018-08-07 07:32:32', '0000-00-00 00:00:00'),
(41, 'sadsadsad', 5, '65465465', '2018-08-07 07:32:32', '0000-00-00 00:00:00'),
(42, 'ssadsadsadsadasd', 5, '65465465', '2018-08-07 07:32:32', '0000-00-00 00:00:00'),
(43, 'Why do we use it?', 5, '65465465', '2018-08-07 07:32:32', '0000-00-00 00:00:00'),
(44, 'What is Lorem Ipsum?', 5, '65465465', '2018-08-07 07:32:33', '0000-00-00 00:00:00'),
(45, 'Why do we use it?', 5, '65465465', '2018-08-07 07:32:33', '0000-00-00 00:00:00'),
(46, 'sadsadsad', 5, '65465465', '2018-08-07 07:32:33', '0000-00-00 00:00:00'),
(47, 'ssadsadsadsadasd', 5, '65465465', '2018-08-07 07:32:33', '0000-00-00 00:00:00'),
(48, 'Why do we use it?', 5, '65465465', '2018-08-07 07:32:33', '0000-00-00 00:00:00'),
(49, 'What is Lorem Ipsum?', 5, '65465465', '2018-08-07 07:32:33', '0000-00-00 00:00:00'),
(50, 'Why do we use it?', 5, '65465465', '2018-08-07 07:32:33', '0000-00-00 00:00:00'),
(51, 'sadsadsad', 5, '65465465', '2018-08-07 07:32:33', '0000-00-00 00:00:00'),
(52, 'ssadsadsadsadasd', 5, '65465465', '2018-08-07 07:32:34', '0000-00-00 00:00:00'),
(53, 'Why do we use it?', 5, '65465465', '2018-08-07 07:32:34', '0000-00-00 00:00:00');

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
  `description` text,
  `status` int(11) NOT NULL DEFAULT '0' COMMENT '0=>active,1=>not active',
  `added_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedOn` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `quiz`
--

INSERT INTO `quiz` (`id`, `quiz_id`, `type`, `question`, `file_url`, `show_answers`, `correct_answer`, `description`, `status`, `added_date`, `updatedOn`) VALUES
(1, 507742069, 'VIDEO', 'What is your diagnosis ?', 'http://coughbuster.in/userfiles/doctors/1/DoctorVeetBaljit(mrhd.in).3gp', '[\"Dry cough\",\"Staccato cough\",\"Whooping cough\",\"Wheezing cough\"]', 'Whooping cough', NULL, 0, '2018-07-27 07:19:10', NULL),
(2, 2108327361, 'AUDIO', 'What is your audio diagnosis ?', 'http://coughbuster.in/userfiles/doctors/1/Small_Doctor_-_Japa_Freestyle__Okhype.com_.mp3', '[\"Dry cough\",\"Wheezing cough\",\"Staccato cough\",\"saddddddddddddddddddddddddddddsdsd\",\"Wheezing cough\",\"\"]', 'Dry cough', NULL, 0, '2018-07-27 07:22:18', NULL);

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

--
-- Dumping data for table `quiz_details`
--

INSERT INTO `quiz_details` (`id`, `doctor_id`, `quiz_id`, `added_date`) VALUES
(1, 2, 2, '2018-07-30 11:46:44');

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
  `tm_access_code` varchar(255) DEFAULT NULL,
  `dml_no` varchar(100) DEFAULT NULL,
  `email_id` varchar(100) DEFAULT NULL,
  `mobile_no` varchar(100) NOT NULL,
  `pass` varchar(500) NOT NULL,
  `user_type` int(11) DEFAULT NULL COMMENT '1=>MR, 2=>Super Admin,3=>report',
  `user_status` int(11) NOT NULL DEFAULT '0' COMMENT '0=>active,1=>not active',
  `added_by` varchar(20) DEFAULT NULL,
  `added_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedOn` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `gender`, `dob`, `place`, `tm_access_code`, `dml_no`, `email_id`, `mobile_no`, `pass`, `user_type`, `user_status`, `added_by`, `added_date`, `updatedOn`) VALUES
(1, 'Admin', 'MALE', '1989-10-11', 'Mumbai', NULL, NULL, 'admin@gmail.com', '9876543210', 'wht6bd5lak/N7d', 2, 0, NULL, '2018-07-24 06:06:55', NULL),
(2, 'Dixit', 'MALE', '1999-02-03', 'Mumbai', '345345345', NULL, 'dixit@gmail.com', '8878745651', 'wht6bd5lak/N7d', 1, 0, 'admin@gmail.com', '2018-07-24 06:43:00', NULL),
(33, 'ALPESH SHAH', 'MALE', '0000-00-00', NULL, '805234', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:42', NULL),
(34, 'RAKESH GANJOO', 'MALE', '0000-00-00', NULL, '810086', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:42', NULL),
(35, 'PANKAJ MENDIRATTA', 'MALE', '0000-00-00', NULL, '833', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:42', NULL),
(36, 'DIPIN WADHWA', 'MALE', '0000-00-00', NULL, '815778', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:42', NULL),
(37, 'ABU BAKAR', 'MALE', '0000-00-00', NULL, '820917', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:42', NULL),
(38, 'FARAZ KHAN', 'MALE', '0000-00-00', NULL, '825389', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:42', NULL),
(39, 'MAHESH BAGHEL', 'MALE', '0000-00-00', NULL, '820292', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:42', NULL),
(40, 'NIJAMUDDIN ', 'MALE', '0000-00-00', NULL, '826735', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:42', NULL),
(41, 'RAKESH KUMAR', 'MALE', '0000-00-00', NULL, '824023', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:42', NULL),
(42, 'MEGHA DHAMA', 'MALE', '0000-00-00', NULL, '825555', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:42', NULL),
(43, 'GOLDY SEHGAL', 'MALE', '0000-00-00', NULL, '805262', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:42', NULL),
(44, 'AALIYA ZEHRA', 'MALE', '0000-00-00', NULL, '824558', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:42', NULL),
(45, 'AMIT PANWAR', 'MALE', '0000-00-00', NULL, '811129', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:42', NULL),
(46, 'SHIV SHYAM GUPTA', 'MALE', '0000-00-00', NULL, '818921', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:42', NULL),
(47, 'AJAY KUMAR ', 'MALE', '0000-00-00', NULL, '820404', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:42', NULL),
(48, 'PRAVEEN SHARMA', 'MALE', '0000-00-00', NULL, '819434', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:42', NULL),
(49, 'LALIT KUMAR', 'MALE', '0000-00-00', NULL, '828050', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:42', NULL),
(50, 'RAHUL SHARMA', 'MALE', '0000-00-00', NULL, '813577', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:42', NULL),
(51, 'SURAJ TIWARI', 'MALE', '0000-00-00', NULL, '828294', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:42', NULL),
(52, 'NAGENDRA KUMAR SINGH', 'MALE', '0000-00-00', NULL, '828357', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:42', NULL),
(53, 'MOHAMMAD ASHRAF', 'MALE', '0000-00-00', NULL, '806642', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:42', NULL),
(54, 'MOHAMMAD NAEEM', 'MALE', '0000-00-00', NULL, '808189', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:42', NULL),
(55, 'AJAY SHARMA', 'MALE', '0000-00-00', NULL, '501', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:42', NULL),
(56, 'SALMAN KHAN', 'MALE', '0000-00-00', NULL, '826911', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:42', NULL),
(57, 'NOSHAD QURESHI', 'MALE', '0000-00-00', NULL, '826915', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:42', NULL),
(58, 'SUMIT ARORA', 'MALE', '0000-00-00', NULL, '826701', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:42', NULL),
(59, 'RAHUL KUMAR RATHOR', 'MALE', '0000-00-00', NULL, '825841', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:42', NULL),
(60, 'PUJA KUMARI', 'MALE', '0000-00-00', NULL, '819422', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:42', NULL),
(61, 'NARENDRA PAL', 'MALE', '0000-00-00', NULL, '826702', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:43', NULL),
(63, 'AMIT SHARMA', 'MALE', '0000-00-00', NULL, '4555', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:43', NULL),
(64, 'ADESH KUMAR', 'MALE', '0000-00-00', NULL, '826971', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:43', NULL),
(65, 'MUKESH KUMAR LOVE VANSHI', 'MALE', '0000-00-00', NULL, '814237', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:43', NULL),
(66, 'SANJAY SAINI', 'MALE', '0000-00-00', NULL, '825008', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:43', NULL),
(67, 'BHAVESH PATHAK', 'MALE', '0000-00-00', NULL, '824710', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:43', NULL),
(68, 'RAKESH KUMAR SHARMA', 'MALE', '0000-00-00', NULL, '825384', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:43', NULL),
(69, 'BHAGWATI PRASAD BILKHIWAL ', 'MALE', '0000-00-00', NULL, '823733', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:43', NULL),
(70, 'AKSHAY KUMAR SHARMA', 'MALE', '0000-00-00', NULL, '826142', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:43', NULL),
(71, 'CHETAN KUMAR PARASHAR', 'MALE', '0000-00-00', NULL, '820051', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:43', NULL),
(72, 'PRADEEP KUMAR SHARMA', 'MALE', '0000-00-00', NULL, '826611', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:43', NULL),
(73, 'NARENDRA SINGH', 'MALE', '0000-00-00', NULL, '827245', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:43', NULL),
(74, 'DINESH BAIRWA', 'MALE', '0000-00-00', NULL, '826428', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:43', NULL),
(75, 'AJAY SHARMA', 'MALE', '0000-00-00', NULL, '826799', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:43', NULL),
(76, 'SUNIL JAT', 'MALE', '0000-00-00', NULL, '825558', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:43', NULL),
(77, 'SURESH CHANDRAKHA KHATIK ', 'MALE', '0000-00-00', NULL, '826931', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:43', NULL),
(78, 'FIROJ KHAN', 'MALE', '0000-00-00', NULL, '820697', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:43', NULL),
(79, 'SHATRUGHAN SINGH RAJPUT', 'MALE', '0000-00-00', NULL, '825522', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:43', NULL),
(80, 'MANISH MALHOTRA', 'MALE', '0000-00-00', NULL, '827521', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:43', NULL),
(82, 'VIJAY KUMAR GAUR', 'MALE', '0000-00-00', NULL, '811601', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:43', NULL),
(83, 'JITESH KUMAWAT', 'MALE', '0000-00-00', NULL, '826558', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:43', NULL),
(84, 'MOHAMMED NAVEED', 'MALE', '0000-00-00', NULL, '827637', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:43', NULL),
(85, 'VISHAL BHAYANA', 'MALE', '0000-00-00', NULL, '827480', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:43', NULL),
(86, 'KHUSHAL SINGH', 'MALE', '0000-00-00', NULL, '814483', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:43', NULL),
(87, 'MOHAMMAD ARIF', 'MALE', '0000-00-00', NULL, '827395', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:43', NULL),
(88, 'ANIL PANCHARIYA', 'MALE', '0000-00-00', NULL, '825521', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:43', NULL),
(89, 'GURPAL SINGH', 'MALE', '0000-00-00', NULL, '828229', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:43', NULL),
(91, 'SANJAY SHARMA ', 'MALE', '0000-00-00', NULL, '805497', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:43', NULL),
(92, 'SUNIL KUMAR', 'MALE', '0000-00-00', NULL, '827484', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:43', NULL),
(93, 'HARPREET KAUR', 'MALE', '0000-00-00', NULL, '2333', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:43', NULL),
(94, 'GURPREET SINGH ', 'MALE', '0000-00-00', NULL, '818161', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:43', NULL),
(95, 'SHAMMI VERMA', 'MALE', '0000-00-00', NULL, '823220', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:43', NULL),
(96, 'KULWANT SINGH', 'MALE', '0000-00-00', NULL, '782', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:43', NULL),
(97, 'ROHIT BAJAJ', 'MALE', '0000-00-00', NULL, '818659', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:43', NULL),
(98, 'NARPINDER SHARMA', 'MALE', '0000-00-00', NULL, '820201', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:43', NULL),
(99, 'NAVEEN VASUDEVA', 'MALE', '0000-00-00', NULL, '817960', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:43', NULL),
(100, 'VIKRANT AJRAWAT', 'MALE', '0000-00-00', NULL, '817421', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:43', NULL),
(101, 'HARPREET SINGH', 'MALE', '0000-00-00', NULL, '812136', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:43', NULL),
(102, 'SUMIT VAID', 'MALE', '0000-00-00', NULL, '812684', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:44', NULL),
(103, 'JAHANGIR HUSSAIN MALIK', 'MALE', '0000-00-00', NULL, '810724', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:44', NULL),
(104, 'AHMAD KHAAWAR', 'MALE', '0000-00-00', NULL, '808188', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:44', NULL),
(105, 'MOHD. IQBAL RESHI', 'MALE', '0000-00-00', NULL, '813430', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:44', NULL),
(106, 'SHABIR AHMAD KHANDAY', 'MALE', '0000-00-00', NULL, '817661', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:44', NULL),
(107, 'RAVINDER SINGH', 'MALE', '0000-00-00', NULL, '803342', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:44', NULL),
(108, 'YOGESHWAR SHARMA', 'MALE', '0000-00-00', NULL, '825000', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:44', NULL),
(109, 'KANWAL SAWHNEY', 'MALE', '0000-00-00', NULL, '808459', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:44', NULL),
(110, 'ASHISH KUMAR', 'MALE', '0000-00-00', NULL, '815328', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:44', NULL),
(111, 'RANJIT SINGH', 'MALE', '0000-00-00', NULL, '826009', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:44', NULL),
(112, 'SUNIL KUMAR', 'MALE', '0000-00-00', NULL, '820058', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:44', NULL),
(113, 'VIKAS KAMBOJ', 'MALE', '0000-00-00', NULL, '813438', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:44', NULL),
(115, 'SUMIT SALUJA', 'MALE', '0000-00-00', NULL, '815959', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:44', NULL),
(116, 'YATIN KHATTER', 'MALE', '0000-00-00', NULL, '810309', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:44', NULL),
(117, 'RAHUL TEOTIA', 'MALE', '0000-00-00', NULL, '820822', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:44', NULL),
(118, 'JATIN NAGPAL', 'MALE', '0000-00-00', NULL, '811051', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:44', NULL),
(119, 'ANUPAM RAMBAHAL SHUKLA', 'MALE', '0000-00-00', NULL, '825961', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:44', NULL),
(120, 'AKASH CHOUDHARY', 'MALE', '0000-00-00', NULL, '828511', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:44', NULL),
(121, 'NIKHIL', 'MALE', '0000-00-00', NULL, '827451', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:44', NULL),
(122, 'CHANDA SHARMA', 'MALE', '0000-00-00', NULL, '826802', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:44', NULL),
(123, 'VIKAS KUMAR SHARMA', 'MALE', '0000-00-00', NULL, '819284', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:44', NULL),
(124, 'MADHUR KUNDRA', 'MALE', '0000-00-00', NULL, '827183', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:44', NULL),
(125, 'NIKHIL BATRA', 'MALE', '0000-00-00', NULL, '824127', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:44', NULL),
(126, 'VIKRANT SHARMA', 'MALE', '0000-00-00', NULL, '812103', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:44', NULL),
(127, 'RAHUL RATTI', 'MALE', '0000-00-00', NULL, '819865', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:44', NULL),
(128, 'LOVEPREET', 'MALE', '0000-00-00', NULL, '822611', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:44', NULL),
(129, 'ASHISH GODIA', 'MALE', '0000-00-00', NULL, '825487', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:44', NULL),
(131, 'PULKIT CHAUHAN', 'MALE', '0000-00-00', NULL, '818559', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:44', NULL),
(132, 'PRAMOD KUMAR SHARMA', 'MALE', '0000-00-00', NULL, '808800', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:44', NULL),
(133, 'GAURVI YADAV', 'MALE', '0000-00-00', NULL, '826730', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:44', NULL),
(134, 'HIMANSHU BHARDWAJ', 'MALE', '0000-00-00', NULL, '815905', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:45', NULL),
(135, 'KIRTI KATIYAR', 'MALE', '0000-00-00', NULL, '809123', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:45', NULL),
(136, 'VIJAY MISHRA', 'MALE', '0000-00-00', NULL, '826325', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:45', NULL),
(137, 'PRADHUMAN KUMAR VARSHNEY', 'MALE', '0000-00-00', NULL, '811831', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:45', NULL),
(138, 'GAURAV CHAUHAN', 'MALE', '0000-00-00', NULL, '816466', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:45', NULL),
(139, 'HEMENDRA', 'MALE', '0000-00-00', NULL, '814148', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:45', NULL),
(140, 'GOVIND KUMAR', 'MALE', '0000-00-00', NULL, '826323', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:45', NULL),
(141, 'KRISHAN PAL', 'MALE', '0000-00-00', NULL, '826467', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:45', NULL),
(142, 'SACHIN TYAGI', 'MALE', '0000-00-00', NULL, '828044', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:45', NULL),
(143, 'ADITYA SHARMA', 'MALE', '0000-00-00', NULL, '827261', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:45', NULL),
(144, 'PRADEEP KUMAR', 'MALE', '0000-00-00', NULL, '826849', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:45', NULL),
(145, 'MOHD. IMRAN KHAN', 'MALE', '0000-00-00', NULL, '814529', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:45', NULL),
(146, 'DEEPAK KUMAR', 'MALE', '0000-00-00', NULL, '825319', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:45', NULL),
(147, 'YATENDRA KUMAR MITTAL', 'MALE', '0000-00-00', NULL, '809647', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:45', NULL),
(148, 'RAGHUKUL BHUSHAN', 'MALE', '0000-00-00', NULL, '827143', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:45', NULL),
(149, 'NITESH JAIN', 'MALE', '0000-00-00', NULL, '827526', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:45', NULL),
(150, 'SAURABH GUPTA', 'MALE', '0000-00-00', NULL, '827259', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:45', NULL),
(151, 'DHEERAJ SHARMA', 'MALE', '0000-00-00', NULL, '827305', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:45', NULL),
(152, 'HEMANT LALA', 'MALE', '0000-00-00', NULL, '831', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:45', NULL),
(153, 'AKASH GAHOI', 'MALE', '0000-00-00', NULL, '826314', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:45', NULL),
(154, 'SHIVAM SINGH', 'MALE', '0000-00-00', NULL, '818188', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:45', NULL),
(155, 'SURYA PRATAP SINGH', 'MALE', '0000-00-00', NULL, '827084', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:45', NULL),
(156, 'VIMAL KUMAR SHARMA', 'MALE', '0000-00-00', NULL, '807999', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:45', NULL),
(157, 'UDIT NARAYAN', 'MALE', '0000-00-00', NULL, '827142', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:45', NULL),
(158, 'MANISHA CHAUHAN', 'MALE', '0000-00-00', NULL, '814160', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:45', NULL),
(159, 'RAVI O RICHARDS', 'MALE', '0000-00-00', NULL, '723', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:45', NULL),
(160, 'ABDUL RASHID', 'MALE', '0000-00-00', NULL, '814528', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:46', NULL),
(161, 'SANJAY BHATT', 'MALE', '0000-00-00', NULL, '816228', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:46', NULL),
(163, 'ASHISH PANDEY', 'MALE', '0000-00-00', NULL, '3708', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:46', NULL),
(164, 'YADVENDRA TRIPATHI', 'MALE', '0000-00-00', NULL, '804030', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:46', NULL),
(165, 'TANMAY SAXENA', 'MALE', '0000-00-00', NULL, '801783', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:46', NULL),
(166, 'MUKESH J MISHRA', 'MALE', '0000-00-00', NULL, '925', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:46', NULL),
(168, 'UPENDRA DIXIT', 'MALE', '0000-00-00', NULL, '800123', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:46', NULL),
(169, 'NEELAM SINGH', 'MALE', '0000-00-00', NULL, '814301', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:46', NULL),
(170, 'RAJEEV LOCHAN MISHRA', 'MALE', '0000-00-00', NULL, '816091', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:46', NULL),
(171, 'SATENDRA SAXENA', 'MALE', '0000-00-00', NULL, '825139', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:46', NULL),
(172, 'SAMEER JAUHARI', 'MALE', '0000-00-00', NULL, '825572', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:46', NULL),
(173, 'ASHISH KUMAR VERMA', 'MALE', '0000-00-00', NULL, '817954', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:46', NULL),
(174, 'PRASHANT KUMAR', 'MALE', '0000-00-00', NULL, '827646', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:46', NULL),
(175, 'GAURAV OMER', 'MALE', '0000-00-00', NULL, '825584', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:46', NULL),
(176, 'AKASH ARORA', 'MALE', '0000-00-00', NULL, '825732', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:46', NULL),
(177, 'RAM NIWAS SHARMA', 'MALE', '0000-00-00', NULL, '821588', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:46', NULL),
(178, 'SHYAM KISHOR SINGH RATHOR', 'MALE', '0000-00-00', NULL, '810717', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:46', NULL),
(179, 'ANKIT KUMAR SINGH', 'MALE', '0000-00-00', NULL, '810720', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:46', NULL),
(180, 'RAHUL SRIVASTAVA', 'MALE', '0000-00-00', NULL, '826150', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:46', NULL),
(181, 'SHEKHAR KUMAR - STOP SALARY', 'MALE', '0000-00-00', NULL, '826861', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:46', NULL),
(182, 'RAKESH KUMAR TIWARI', 'MALE', '0000-00-00', NULL, '824373', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:46', NULL),
(183, 'AKHILESH KUMAR TIWARI', 'MALE', '0000-00-00', NULL, '815776', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:46', NULL),
(184, 'ABHINAV AGRAWAL', 'MALE', '0000-00-00', NULL, '816754', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:46', NULL),
(185, 'SHAILENDRA SINGH', 'MALE', '0000-00-00', NULL, '811139', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:46', NULL),
(187, 'MOHIT SINGH', 'MALE', '0000-00-00', NULL, '817608', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:46', NULL),
(188, 'SHALINI BISWAS', 'MALE', '0000-00-00', NULL, '818837', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:46', NULL),
(189, 'SARVESH RAJNARAYAN VISHWAKARMA ', 'MALE', '0000-00-00', NULL, '827306', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:46', NULL),
(190, 'PRINCE KUMAR SINGH', 'MALE', '0000-00-00', NULL, '825762', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:46', NULL),
(191, 'VIJAY KUMAR DUBEY', 'MALE', '0000-00-00', NULL, '672', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:46', NULL),
(192, 'VIJAY PRATAP MISHRA', 'MALE', '0000-00-00', NULL, '804620', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:46', NULL),
(193, 'RAJIV RANJAN SINGH', 'MALE', '0000-00-00', NULL, '823511', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:46', NULL),
(194, 'KUWAR SAMEER', 'MALE', '0000-00-00', NULL, '818034', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:46', NULL),
(195, 'PAWAN KUMAR CHAUBEY', 'MALE', '0000-00-00', NULL, '827520', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:46', NULL),
(196, 'ASHUTOSH KUMAR SRIVASTAVA ', 'MALE', '0000-00-00', NULL, '826869', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:46', NULL),
(197, 'NEERAJ KUMAR SRIVASTAVA', 'MALE', '0000-00-00', NULL, '822450', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:46', NULL),
(199, 'AMIT MANI TRIPATHI', 'MALE', '0000-00-00', NULL, '826268', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:47', NULL),
(200, 'SANTOSH GUPTA', 'MALE', '0000-00-00', NULL, '816005', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:47', NULL),
(203, 'NIRUPAM ACHARJEE', 'MALE', '0000-00-00', NULL, '611', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:47', NULL),
(204, 'SAIBAL BISWAS', 'MALE', '0000-00-00', NULL, '1054', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:47', NULL),
(205, 'SOURAV MUKHERJEE', 'MALE', '0000-00-00', NULL, '811035', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:47', NULL),
(206, 'PRATIK ROY', 'MALE', '0000-00-00', NULL, '825234', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:47', NULL),
(207, 'SARMISTHA BERA', 'MALE', '0000-00-00', NULL, '806618', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:47', NULL),
(208, 'RUDRANATH PAL', 'MALE', '0000-00-00', NULL, '809407', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:47', NULL),
(209, 'TANMOY CHOWDHURY', 'MALE', '0000-00-00', NULL, '825923', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:47', NULL),
(210, 'RITANKAR BHATTACHERJEE', 'MALE', '0000-00-00', NULL, '828064', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:47', NULL),
(211, 'SUMAN CHAKRABORTY', 'MALE', '0000-00-00', NULL, '803935', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:47', NULL),
(212, 'SOURAV SINHA', 'MALE', '0000-00-00', NULL, '817185', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:47', NULL),
(213, 'SUMAN BHATTACHERJEE', 'MALE', '0000-00-00', NULL, '825936', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:47', NULL),
(214, 'SOUMEN DAS', 'MALE', '0000-00-00', NULL, '816463', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:47', NULL),
(215, 'BIDYUT KUMAR BASU', 'MALE', '0000-00-00', NULL, '489', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:47', NULL),
(216, 'SUBRATA GHOSH', 'MALE', '0000-00-00', NULL, '637', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:47', NULL),
(217, 'SURAJIT GUHA', 'MALE', '0000-00-00', NULL, '800994', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:47', NULL),
(218, 'ABHIJIT KUMAR DUTTA', 'MALE', '0000-00-00', NULL, '815807', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:47', NULL),
(219, 'DHIRAJ KUMAR PRASAD', 'MALE', '0000-00-00', NULL, '827672', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:47', NULL),
(220, 'SABYASACHI CHAKRABORTY', 'MALE', '0000-00-00', NULL, '810805', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:47', NULL),
(221, 'ARUNAVA CHAKRABORTY', 'MALE', '0000-00-00', NULL, '5175', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:47', NULL),
(222, 'SANKHA SUBHRA RAUT', 'MALE', '0000-00-00', NULL, '810988', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:47', NULL),
(223, 'MADHUMITA BHADURI', 'MALE', '0000-00-00', NULL, '919', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:47', NULL),
(224, 'SIDDHARTHA ROY', 'MALE', '0000-00-00', NULL, '827145', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:47', NULL),
(225, 'PALASH DAS', 'MALE', '0000-00-00', NULL, '812756', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:47', NULL),
(226, 'RAJDEEP ROY', 'MALE', '0000-00-00', NULL, '669', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:47', NULL),
(227, 'SOURAV DUTTA', 'MALE', '0000-00-00', NULL, '825104', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:47', NULL),
(228, 'TAPAS GHOSH', 'MALE', '0000-00-00', NULL, '803262', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:47', NULL),
(229, 'SUVA SENGUPTA', 'MALE', '0000-00-00', NULL, '825987', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:47', NULL),
(230, 'PRASUN KUMAR ROY', 'MALE', '0000-00-00', NULL, '934', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:47', NULL),
(231, 'PROSENJIT GHOSH', 'MALE', '0000-00-00', NULL, '816613', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:47', NULL),
(232, 'DEEPAK KUMAR LENKA', 'MALE', '0000-00-00', NULL, '800128', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:47', NULL),
(233, 'S K ABDUL SHAMIM ASHRAF', 'MALE', '0000-00-00', NULL, '827125', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:47', NULL),
(234, 'CHINMAYA ACHARYA', 'MALE', '0000-00-00', NULL, '819739', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:48', NULL),
(235, 'ABHISEK DHAL', 'MALE', '0000-00-00', NULL, '809090', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:48', NULL),
(237, 'DWARIKANATH PATRO', 'MALE', '0000-00-00', NULL, '5781', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:48', NULL),
(238, 'ANJAN KUMAR JENA', 'MALE', '0000-00-00', NULL, '826994', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:48', NULL),
(240, 'SUCHARITA BHATACHARJEE', 'MALE', '0000-00-00', NULL, '4914', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:48', NULL),
(241, 'RAKESH BALMIKI', 'MALE', '0000-00-00', NULL, '825614', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:48', NULL),
(242, 'RAJU HAZARIKA', 'MALE', '0000-00-00', NULL, '826450', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:48', NULL),
(243, 'RAJIB SARMA', 'MALE', '0000-00-00', NULL, '821673', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:48', NULL),
(244, 'RAKESH BANIK', 'MALE', '0000-00-00', NULL, '814777', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:48', NULL),
(245, 'MRIDUL KANTI SHARMA', 'MALE', '0000-00-00', NULL, '821063', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:48', NULL),
(246, 'GULAM NASIR', 'MALE', '0000-00-00', NULL, '808112', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:48', NULL),
(247, 'GAUTAM DEY', 'MALE', '0000-00-00', NULL, '811255', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:48', NULL),
(248, 'RAHUL CHAKRABORTY', 'MALE', '0000-00-00', NULL, '826184', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:48', NULL),
(249, 'RAJDEEP BHOWMICK', 'MALE', '0000-00-00', NULL, '826183', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:48', NULL),
(250, 'SUBHABRATA KAR', 'MALE', '0000-00-00', NULL, '816017', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:48', NULL),
(251, 'RAJIV BISWAS', 'MALE', '0000-00-00', NULL, '818040', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:48', NULL),
(252, 'HEIKRUJAM SINGHAJIT KHUMAN ', 'MALE', '0000-00-00', NULL, '827334', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:48', NULL),
(253, 'RINKU KALITA', 'MALE', '0000-00-00', NULL, '828399', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:48', NULL),
(254, 'DEBASHISH KURI', 'MALE', '0000-00-00', NULL, '808110', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:48', NULL),
(255, 'SURAJIT TARAFDER', 'MALE', '0000-00-00', NULL, '823678', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:48', NULL),
(256, 'RAKESH DEBNATH', 'MALE', '0000-00-00', NULL, '816616', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:48', NULL),
(257, 'SUVOJIT KONER', 'MALE', '0000-00-00', NULL, '822274', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:48', NULL),
(258, 'SUMAN DEY', 'MALE', '0000-00-00', NULL, '814821', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:48', NULL),
(259, 'MD.NAWSAD ALI', 'MALE', '0000-00-00', NULL, '814018', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:48', NULL),
(260, 'KAJAL GAYAN', 'MALE', '0000-00-00', NULL, '813407', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:48', NULL),
(261, 'SUBRATA SINHA', 'MALE', '0000-00-00', NULL, '811237', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:48', NULL),
(262, 'GOUTAM MONDAL', 'MALE', '0000-00-00', NULL, '800447', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:48', NULL),
(263, 'RITESH CHOUDHARY', 'MALE', '0000-00-00', NULL, '802168', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:48', NULL),
(264, 'PRADIPTA KUMAR MONDAL', 'MALE', '0000-00-00', NULL, '825612', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:48', NULL),
(265, 'ASHIM KUMAR DAS', 'MALE', '0000-00-00', NULL, '826163', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:48', NULL),
(266, 'ABHIJIT SHOW', 'MALE', '0000-00-00', NULL, '826449', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:48', NULL),
(267, 'SUMIT THAKUR', 'MALE', '0000-00-00', NULL, '828398', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:48', NULL),
(268, 'CHANDAN BANERJEE', 'MALE', '0000-00-00', NULL, '520', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:49', NULL),
(269, 'DEBASIS BANERJEE', 'MALE', '0000-00-00', NULL, '476', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:49', NULL),
(270, 'NILADRI SHEKHAR NATH', 'MALE', '0000-00-00', NULL, '819044', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:49', NULL),
(271, 'CHANDAN GOSWAMI', 'MALE', '0000-00-00', NULL, '805313', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:49', NULL),
(272, 'SNEHASIS BANERJEE', 'MALE', '0000-00-00', NULL, '808108', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:49', NULL),
(273, 'RAJAT BANERJEE', 'MALE', '0000-00-00', NULL, '2062', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:49', NULL),
(274, 'DEBASISH DAS', 'MALE', '0000-00-00', NULL, '805312', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:49', NULL),
(275, 'SANJIT BISWAS', 'MALE', '0000-00-00', NULL, '801', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:49', NULL),
(276, 'MANOJIT MUKHERJEE', 'MALE', '0000-00-00', NULL, '803585', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:49', NULL),
(277, 'SOUMEN DEY', 'MALE', '0000-00-00', NULL, '814508', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:49', NULL),
(279, 'RAJA KUMAR', 'MALE', '0000-00-00', NULL, '5205', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:49', NULL),
(280, 'PRABHASH CHANDRA', 'MALE', '0000-00-00', NULL, '805519', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:49', NULL),
(281, 'BAL YOGESH KUMAR', 'MALE', '0000-00-00', NULL, '825166', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:49', NULL),
(282, 'PRASHANT KUMAR', 'MALE', '0000-00-00', NULL, '820521', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:49', NULL),
(283, 'GAURAV RAJ', 'MALE', '0000-00-00', NULL, '827470', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:49', NULL),
(284, 'BISHWAJIT CHOUBEY', 'MALE', '0000-00-00', NULL, '825167', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:49', NULL),
(286, 'HEMANSHU KUMAR', 'MALE', '0000-00-00', NULL, '828104', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:49', NULL),
(287, 'ARVIND KUMAR', 'MALE', '0000-00-00', NULL, '817302', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:49', NULL),
(288, 'AMIT KUMAR SINGH', 'MALE', '0000-00-00', NULL, '813395', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:49', NULL),
(289, 'ANAND AGGAY', 'MALE', '0000-00-00', NULL, '804643', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:49', NULL),
(290, 'BIBHASH KUMAR JHA', 'MALE', '0000-00-00', NULL, '808501', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:49', NULL),
(291, 'SAURABH KUMAR', 'MALE', '0000-00-00', NULL, '806252', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:49', NULL),
(292, 'ANKUR KUMAR ANAND', 'MALE', '0000-00-00', NULL, '827464', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:49', NULL),
(293, 'VARUN KUMAR MISHRA', 'MALE', '0000-00-00', NULL, '816652', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:49', NULL),
(294, 'RAJESH KUMAR JHA', 'MALE', '0000-00-00', NULL, '822411', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:49', NULL),
(295, 'BIJAY KUMAR JHA', 'MALE', '0000-00-00', NULL, '811011', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:49', NULL),
(296, 'SAWOOD A KHAN', 'MALE', '0000-00-00', NULL, '3237', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:49', NULL),
(297, 'BISHWAJIT KUMAR', 'MALE', '0000-00-00', NULL, '822902', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:49', NULL),
(298, 'SUBRATA DEY', 'MALE', '0000-00-00', NULL, '819611', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:49', NULL),
(299, 'ASHISH AKHOURI', 'MALE', '0000-00-00', NULL, '800892', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:49', NULL),
(300, 'PRITAM KUMAR', 'MALE', '0000-00-00', NULL, '813148', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:49', NULL),
(301, 'ANKIT KUMAR', 'MALE', '0000-00-00', NULL, '812170', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:49', NULL),
(302, 'AMAR KUMAR TARWAY', 'MALE', '0000-00-00', NULL, '938', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:49', NULL),
(303, 'PAWAN KUMAR', 'MALE', '0000-00-00', NULL, '816614', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:49', NULL),
(304, 'SAJAN KUMAR', 'MALE', '0000-00-00', NULL, '827088', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:49', NULL),
(305, 'DANISH HASHMI', 'MALE', '0000-00-00', NULL, '805428', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:49', NULL),
(308, 'VIJAY H KHOND', 'MALE', '0000-00-00', NULL, '3258', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:49', NULL),
(309, 'GUNJAN SAGARE', 'MALE', '0000-00-00', NULL, '806965', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:49', NULL),
(310, 'RAVINDRA JHA', 'MALE', '0000-00-00', NULL, '823882', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:49', NULL),
(311, 'PAWAN TADOKAR', 'MALE', '0000-00-00', NULL, '817525', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:49', NULL),
(312, 'BRAJESH KUMAR SHARMA', 'MALE', '0000-00-00', NULL, '809291', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:49', NULL),
(313, 'RAJRAM V BALIGA ', 'MALE', '0000-00-00', NULL, '1152', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:49', NULL),
(314, 'ANURAG SONI', 'MALE', '0000-00-00', NULL, '806892', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:50', NULL),
(316, 'ARVIND PATIDAR', 'MALE', '0000-00-00', NULL, '826669', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:50', NULL),
(317, 'VINAY KUMAR DUBEY', 'MALE', '0000-00-00', NULL, '1067', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:50', NULL),
(318, 'DEEPAK GUPTA', 'MALE', '0000-00-00', NULL, '803133', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:50', NULL),
(319, 'ASHISH SINGH DIKHIT', 'MALE', '0000-00-00', NULL, '806171', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:50', NULL),
(320, 'VIVEK SAKALLEY', 'MALE', '0000-00-00', NULL, '810084', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:50', NULL),
(321, 'YOGESH SAHU', 'MALE', '0000-00-00', NULL, '819886', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:50', NULL),
(322, 'ABHISHEK GOUR', 'MALE', '0000-00-00', NULL, '827032', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:50', NULL),
(323, 'DEEPAK AGARWAL', 'MALE', '0000-00-00', NULL, '810374', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:50', NULL),
(324, 'NAVEEN VIDYARTHI', 'MALE', '0000-00-00', NULL, '810766', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:50', NULL),
(325, 'GAURAV SONI', 'MALE', '0000-00-00', NULL, '827462', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:50', NULL),
(326, 'NIRAJ KUMAR SHARMA', 'MALE', '0000-00-00', NULL, '806070', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:50', NULL),
(327, 'AJAY NAMDEO KUMAR', 'MALE', '0000-00-00', NULL, '817522', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:50', NULL),
(328, 'GOVIND MEHRA', 'MALE', '0000-00-00', NULL, '806706', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:50', NULL),
(329, 'DHANANJAY B SINGH', 'MALE', '0000-00-00', NULL, '801811', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:50', NULL),
(330, 'ANURAG DWIVEDI', 'MALE', '0000-00-00', NULL, '802696', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:50', NULL),
(331, 'SURENDRA SINGH CHOUHAN', 'MALE', '0000-00-00', NULL, '803341', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:50', NULL),
(332, 'LOMESH PAWAR', 'MALE', '0000-00-00', NULL, '825725', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:50', NULL),
(333, 'JAY KISHOR SHARMA', 'MALE', '0000-00-00', NULL, '812272', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:50', NULL),
(335, 'PARAG GIRJASHANKAR VYAS', 'MALE', '0000-00-00', NULL, '817674', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:50', NULL),
(336, 'HANI J. PATEL', 'MALE', '0000-00-00', NULL, '806228', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:50', NULL),
(337, 'SANJAYKUMAR AMARSINGH VARMA ', 'MALE', '0000-00-00', NULL, '823351', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:50', NULL),
(338, 'RAGHVENDRA RAMRUDRA TRIPATHI ', 'MALE', '0000-00-00', NULL, '827031', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:50', NULL),
(339, 'RAKESH VIRENDRA TIWARI', 'MALE', '0000-00-00', NULL, '828065', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:50', NULL),
(340, 'RAHUL PRAVINBHAI DUBEY', 'MALE', '0000-00-00', NULL, '828158', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:50', NULL),
(341, 'AKASHKUMAR P. MODI', 'MALE', '0000-00-00', NULL, '807551', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:50', NULL),
(342, 'ARTI SAGAR VYAS', 'MALE', '0000-00-00', NULL, '818463', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:50', NULL),
(343, 'SARTHAK MAHENDRABHAI DESAI ', 'MALE', '0000-00-00', NULL, '824967', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:50', NULL),
(344, 'PRATIK ATULBHAI SHAH', 'MALE', '0000-00-00', NULL, '827210', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:50', NULL),
(345, 'NIKUNJ CHANDRKANTBHAI VYAS ', 'MALE', '0000-00-00', NULL, '827232', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:50', NULL),
(346, 'HARESH MANSUKHBHAI VAMJA ', 'MALE', '0000-00-00', NULL, '827235', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:50', NULL),
(347, 'ROHIT KUMAR DAS', 'MALE', '0000-00-00', NULL, '821646', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:50', NULL),
(348, 'HIREN HIMATBHAI LABADIYA ', 'MALE', '0000-00-00', NULL, '823352', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:50', NULL),
(349, 'MEHULKUMAR DILIPBHAI DARJI ', 'MALE', '0000-00-00', NULL, '827104', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:51', NULL),
(350, 'SUNIL PANKAJBHAI RAVAL', 'MALE', '0000-00-00', NULL, '826390', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:51', NULL),
(351, 'KAYYUMAHMED MUKHTYARAHMED SAIYED ', 'MALE', '0000-00-00', NULL, '822720', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:51', NULL),
(352, 'SOHEL NASIR BHAI KHARADI ', 'MALE', '0000-00-00', NULL, '819051', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:51', NULL),
(353, 'PRADIP MASARIBHAI HADIA', 'MALE', '0000-00-00', NULL, '821018', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:51', NULL),
(354, 'KRUNAL JAYESHBHAI KOSAMBIA ', 'MALE', '0000-00-00', NULL, '826284', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:51', NULL),
(355, 'BHAVITA CHETANCHARAN PATEL ', 'MALE', '0000-00-00', NULL, '820050', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:51', NULL),
(357, 'PRADEEP RAMADHAR YADAV', 'MALE', '0000-00-00', NULL, '823436', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:51', NULL),
(358, 'RIJVANBHAI GANIBHAI VAHORA ', 'MALE', '0000-00-00', NULL, '825653', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:51', NULL),
(360, 'MOHAMMAD SARFARAZ A. QURESHI ', 'MALE', '0000-00-00', NULL, '807781', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:51', NULL),
(361, 'ANIL SEN', 'MALE', '0000-00-00', NULL, '810961', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:51', NULL),
(362, 'RAJENDRAPRATAP PAL', 'MALE', '0000-00-00', NULL, '819397', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:51', NULL),
(363, 'SURAJ SHIVSHANKAR GUPTA', 'MALE', '0000-00-00', NULL, '826420', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:51', NULL),
(364, 'PRIYANKA SUBHASH PATHAK', 'MALE', '0000-00-00', NULL, '828283', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:51', NULL),
(365, 'FAKHR E ALAM', 'MALE', '0000-00-00', NULL, '819509', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:51', NULL),
(366, 'MAHESH M. GOILKAR', 'MALE', '0000-00-00', NULL, '812910', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:51', NULL),
(367, 'VED PRAKASH DUBEY', 'MALE', '0000-00-00', NULL, '812446', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:51', NULL),
(368, 'SANDEEP SHOBHNATH PAL', 'MALE', '0000-00-00', NULL, '827917', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:51', NULL),
(369, 'VAIBHAV CHANDRAKANT JADHAV ', 'MALE', '0000-00-00', NULL, '827699', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:51', NULL),
(370, ' MOHAMMED NAFEES SAMANI', 'MALE', '0000-00-00', NULL, '826956', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:51', NULL),
(371, 'VISHAL NARASIMHA VERNEKAR ', 'MALE', '0000-00-00', NULL, '827102', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:51', NULL),
(372, 'ASHISH MANGLAPRASAD DUBEY ', 'MALE', '0000-00-00', NULL, '826763', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:51', NULL),
(373, 'RAVI SHANKAR UPADHYAY', 'MALE', '0000-00-00', NULL, '827629', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:51', NULL),
(375, 'MOHD SHAHVEZ', 'MALE', '0000-00-00', NULL, '826764', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:51', NULL),
(376, 'SAGAR SADANAND GARDI', 'MALE', '0000-00-00', NULL, '817651', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:51', NULL),
(377, 'ABDUL MAJID SHAIKH', 'MALE', '0000-00-00', NULL, '813502', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:51', NULL),
(378, 'NIZAMUDDIN AMIN SHAIKH', 'MALE', '0000-00-00', NULL, '826951', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:51', NULL),
(379, 'AKSHAY DEEPAK KARPE', 'MALE', '0000-00-00', NULL, '825096', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:51', NULL),
(380, 'NAGANATH BALASO SAWANT', 'MALE', '0000-00-00', NULL, '826188', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:51', NULL),
(381, 'SAMEER A. SOLKAR', 'MALE', '0000-00-00', NULL, '808757', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:51', NULL),
(382, 'RAJU BHIKU DIGHE', 'MALE', '0000-00-00', NULL, '822464', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:51', NULL),
(383, 'VIKAS RAGHUNATH SURVE', 'MALE', '0000-00-00', NULL, '827423', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:51', NULL),
(384, 'CHANDAN AMOD JHA', 'MALE', '0000-00-00', NULL, '819692', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:51', NULL),
(385, 'NADEEM AHMED ANSARI', 'MALE', '0000-00-00', NULL, '824148', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:52', NULL),
(386, 'SOHEL DILAWAR MEMON', 'MALE', '0000-00-00', NULL, '822419', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:52', NULL),
(387, 'SHALINE VP SINGH', 'MALE', '0000-00-00', NULL, '825935', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:52', NULL),
(388, 'DHARMENDRA RADHESHYAM YADAV ', 'MALE', '0000-00-00', NULL, '826952', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:52', NULL),
(389, 'ARUN HIRALAL YADAV', 'MALE', '0000-00-00', NULL, '819780', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:52', NULL),
(390, 'AAKASH RAMESH BHAGWANI', 'MALE', '0000-00-00', NULL, '820799', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:52', NULL),
(391, 'TUSHAR AJIT KANGUTKAR', 'MALE', '0000-00-00', NULL, '811349', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:52', NULL),
(392, 'MOHD. SHAHAB AHMED', 'MALE', '0000-00-00', NULL, '1935', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:52', NULL),
(393, 'PAWANKUMAR RAMJEET MOURYA ', 'MALE', '0000-00-00', NULL, '826077', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:52', NULL),
(394, 'RAKESH SHYAMAKANT DUBEY', 'MALE', '0000-00-00', NULL, '826389', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:52', NULL),
(396, 'MANISH KUMAR SHUKLA', 'MALE', '0000-00-00', NULL, '812236', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:52', NULL),
(397, 'ASHISH KAMLESH SINGH', 'MALE', '0000-00-00', NULL, '827034', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:52', NULL),
(399, 'SACHIN L SAWLE', 'MALE', '0000-00-00', NULL, '803131', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:52', NULL),
(400, 'VISHAL BHIKAJI MOHITE', 'MALE', '0000-00-00', NULL, '815607', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:52', NULL),
(401, 'VILAS ZUMBAR KASAR', 'MALE', '0000-00-00', NULL, '808855', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:52', NULL),
(402, 'ANIL ZUMBARLAL RASKAR', 'MALE', '0000-00-00', NULL, '815394', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:52', NULL),
(403, 'ASHUTOSH A. TAMBE', 'MALE', '0000-00-00', NULL, '811443', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:52', NULL),
(404, 'PURUSHOTTAM P. TIKAR', 'MALE', '0000-00-00', NULL, '808989', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:52', NULL),
(405, 'SUJATA V BAPAT', 'MALE', '0000-00-00', NULL, '2184', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:52', NULL),
(406, 'GANESH SHAHURAJ PAWAR', 'MALE', '0000-00-00', NULL, '816100', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:52', NULL),
(407, 'NILESHKUMAR KUNDANMAL UPADHYE ', 'MALE', '0000-00-00', NULL, '822937', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:52', NULL),
(408, 'SUSHANT DATTATRAY PHADATARE ', 'MALE', '0000-00-00', NULL, '822938', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:52', NULL),
(409, 'MADHURI SWAPNIL DESHMUKH ', 'MALE', '0000-00-00', NULL, '827510', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:52', NULL),
(410, 'AKSHAY A.  SAWANT', 'MALE', '0000-00-00', NULL, '800600', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:52', NULL),
(411, 'MUKESH MANOHAR HARMALKAR ', 'MALE', '0000-00-00', NULL, '826539', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:52', NULL),
(412, 'GOURISH NARAYAN BAADKAR', 'MALE', '0000-00-00', NULL, '827680', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:52', NULL),
(413, 'NIKHIL BABASAHEB PATIL', 'MALE', '0000-00-00', NULL, '814793', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:52', NULL),
(414, 'VISHAL KRISHNAT JADHAV', 'MALE', '0000-00-00', NULL, '828219', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:52', NULL),
(415, 'SANDIP ANIL SUTAR', 'MALE', '0000-00-00', NULL, '811186', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:52', NULL);
INSERT INTO `users` (`id`, `name`, `gender`, `dob`, `place`, `tm_access_code`, `dml_no`, `email_id`, `mobile_no`, `pass`, `user_type`, `user_status`, `added_by`, `added_date`, `updatedOn`) VALUES
(416, 'RUSHIKESH RAJENDRA KOLTE ', 'MALE', '0000-00-00', NULL, '827238', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:52', NULL),
(417, 'ANANDA ARUN SHIROLE', 'MALE', '0000-00-00', NULL, '803586', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:52', NULL),
(418, 'SUBHASH BHIMRAO USARE', 'MALE', '0000-00-00', NULL, '828279', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:52', NULL),
(419, 'CHANDRAKANT VISHNU BHANUSE ', 'MALE', '0000-00-00', NULL, '827511', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:52', NULL),
(420, 'PRADIP D. GADEKAR', 'MALE', '0000-00-00', NULL, '808125', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:52', NULL),
(421, 'AVINASH KUMAR', 'MALE', '0000-00-00', NULL, '814233', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:53', NULL),
(423, 'SOMNATH VILAS GADHAVE', 'MALE', '0000-00-00', NULL, '816531', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:53', NULL),
(424, 'DEEPAK KANTILAL VYAVAHARE', 'MALE', '0000-00-00', NULL, '814952', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:53', NULL),
(425, 'RAMCHANDRA BHIMRAO JADHAV ', 'MALE', '0000-00-00', NULL, '827683', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:53', NULL),
(426, 'PRAKASH BABASAHEB KHEDKAR ', 'MALE', '0000-00-00', NULL, '827572', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:53', NULL),
(427, 'CHETAN RAVAN PATIL', 'MALE', '0000-00-00', NULL, '825552', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:53', NULL),
(428, 'TUSHAR MAHENDRAKUMAR SHARMA ', 'MALE', '0000-00-00', NULL, '817451', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:53', NULL),
(429, 'ASIM SHAKIR SHAH', 'MALE', '0000-00-00', NULL, '827374', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:53', NULL),
(430, 'S KALYANASUNDARAM', 'MALE', '0000-00-00', NULL, '498', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:53', NULL),
(431, 'DHARMESH VASANTRAO PATIL ', 'MALE', '0000-00-00', NULL, '817439', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:53', NULL),
(434, 'ATUL KUMAR KHARE', 'MALE', '0000-00-00', NULL, '4841', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:53', NULL),
(435, 'SATYA PRAKASH SHARMA', 'MALE', '0000-00-00', NULL, '806670', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:53', NULL),
(436, 'SHAHZAD AKHTAR', 'MALE', '0000-00-00', NULL, '824599', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:53', NULL),
(437, 'PANKAJ DYANESHWAR BHILKAR ', 'MALE', '0000-00-00', NULL, '828280', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:53', NULL),
(438, 'PRATEEK SANJAY BELSARE', 'MALE', '0000-00-00', NULL, '826790', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:53', NULL),
(439, 'KAILAS BABARAO GHATE', 'MALE', '0000-00-00', NULL, '820828', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:53', NULL),
(440, 'AJAY DEVCHAND RANE', 'MALE', '0000-00-00', NULL, '825412', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:53', NULL),
(441, 'MANGESHKUMAR NARAD TEMBHARE ', 'MALE', '0000-00-00', NULL, '826189', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:53', NULL),
(442, 'SHITALKUMAR K SHRISHRIMAL', 'MALE', '0000-00-00', NULL, '3811', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:53', NULL),
(443, 'SUBHASH V. SAWALE', 'MALE', '0000-00-00', NULL, '804777', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:53', NULL),
(444, 'ASHISH PURUSHOTTAM SOMANI ', 'MALE', '0000-00-00', NULL, '823143', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:53', NULL),
(445, 'ANANTA RAMESHLAL JAISWAL ', 'MALE', '0000-00-00', NULL, '816559', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:53', NULL),
(446, 'NILESH SHIVAJI BORSE', 'MALE', '0000-00-00', NULL, '828282', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:53', NULL),
(448, 'NARESH A PANDIT', 'MALE', '0000-00-00', NULL, '2237', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:53', NULL),
(449, 'SUKHADEO BHIMARAO JAMALE ', 'MALE', '0000-00-00', NULL, '824176', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:53', NULL),
(450, 'KAPIL KAMLESH SHUKLA', 'MALE', '0000-00-00', NULL, '827921', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:53', NULL),
(451, 'BINAY KUMAR SINGH', 'MALE', '0000-00-00', NULL, '805205', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:53', NULL),
(452, 'AMIR KHAN', 'MALE', '0000-00-00', NULL, '828512', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:54', NULL),
(453, 'MUKESH KUMAR JHA', 'MALE', '0000-00-00', NULL, '808921', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:54', NULL),
(454, 'AKHLESH SHUKLA', 'MALE', '0000-00-00', NULL, '822678', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:54', NULL),
(456, 'SACHHIDA NAND SHARMA', 'MALE', '0000-00-00', NULL, '815460', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:54', NULL),
(457, 'SUKHVINDER SINGH', 'MALE', '0000-00-00', NULL, '826421', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:54', NULL),
(458, 'RAJEEV PRASAD SINGH', 'MALE', '0000-00-00', NULL, '815397', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:54', NULL),
(459, 'UJJWAL KUMAR', 'MALE', '0000-00-00', NULL, '821985', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:54', NULL),
(460, 'M A KHADEER', 'MALE', '0000-00-00', NULL, '686', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:54', NULL),
(462, 'KOTESHWAR RAO PASUMARTHI ', 'MALE', '0000-00-00', NULL, '823093', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:54', NULL),
(463, 'JAHANGEER MD PASHA', 'MALE', '0000-00-00', NULL, '823430', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:54', NULL),
(464, 'ANGAD TIWARI - STOP SALARY - ABSCONDING', 'MALE', '0000-00-00', NULL, '807110', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:54', NULL),
(465, 'MOHD ILYAS KHAN', 'MALE', '0000-00-00', NULL, '821300', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:54', NULL),
(466, 'SYED AKBAR', 'MALE', '0000-00-00', NULL, '823933', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:54', NULL),
(467, 'RAJU SEELAM', 'MALE', '0000-00-00', NULL, '823802', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:54', NULL),
(468, 'RAMESH NIMMALA', 'MALE', '0000-00-00', NULL, '823939', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:54', NULL),
(469, 'RAMESH VADDEPALLY', 'MALE', '0000-00-00', NULL, '823936', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:54', NULL),
(470, 'LAXMI NARAYANA PEDHAPURAM ', 'MALE', '0000-00-00', NULL, '822986', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:54', NULL),
(471, 'S SANTOSH KUMAR', 'MALE', '0000-00-00', NULL, '813244', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:54', NULL),
(472, 'RAJESHAM BATHINI', 'MALE', '0000-00-00', NULL, '828181', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:54', NULL),
(473, 'KARANGULA SRINIVAS REDDY', 'MALE', '0000-00-00', NULL, '815577', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:54', NULL),
(474, 'MASHOOR AHMAD', 'MALE', '0000-00-00', NULL, '823206', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:54', NULL),
(475, 'MOHAMMAD ZAHOORUL HASSAN', 'MALE', '0000-00-00', NULL, '807566', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:54', NULL),
(476, 'MAHAMMAD SHAFIR DUDEKULA ', 'MALE', '0000-00-00', NULL, '823696', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:54', NULL),
(477, 'NARESH VALLAPUDAS', 'MALE', '0000-00-00', NULL, '816215', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:54', NULL),
(478, 'JAGADEESH BABU GANDIKOTA ', 'MALE', '0000-00-00', NULL, '827662', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:54', NULL),
(479, 'B RAJASHEKHAR', 'MALE', '0000-00-00', NULL, '810894', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:54', NULL),
(480, 'SUDHEER MUMMADI', 'MALE', '0000-00-00', NULL, '828140', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:54', NULL),
(482, 'AFROZ HUSSAIN', 'MALE', '0000-00-00', NULL, '823681', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:54', NULL),
(484, 'REDDEPPA KOTHAKOTA', 'MALE', '0000-00-00', NULL, '823937', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:55', NULL),
(485, 'L K CHAKRAVARTHY', 'MALE', '0000-00-00', NULL, '810893', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:55', NULL),
(486, 'PRABHU MALLALA', 'MALE', '0000-00-00', NULL, '821568', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:55', NULL),
(487, 'ANAND KUMAR VENTRAPRAGADA ', 'MALE', '0000-00-00', NULL, '824360', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:55', NULL),
(488, 'SREENIVASULU KANDI', 'MALE', '0000-00-00', NULL, '814424', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:55', NULL),
(489, 'KOPPULA BHARATH REDDY', 'MALE', '0000-00-00', NULL, '826778', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:55', NULL),
(490, 'SESHUBABU KATAKAM', 'MALE', '0000-00-00', NULL, '825433', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:55', NULL),
(491, 'MASTAN RAO THAMMANABOINA ', 'MALE', '0000-00-00', NULL, '826645', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:55', NULL),
(492, 'SRINIVASAN AKELLA', 'MALE', '0000-00-00', NULL, '822645', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:55', NULL),
(493, 'HARISH KUMAR ANAPU', 'MALE', '0000-00-00', NULL, '823428', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:55', NULL),
(494, 'SASIDHAR AYINADA', 'MALE', '0000-00-00', NULL, '825024', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:55', NULL),
(495, 'RAMESH GOMPA', 'MALE', '0000-00-00', NULL, '811549', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:55', NULL),
(496, 'SRINIVASA K. RAO DOKI', 'MALE', '0000-00-00', NULL, '806336', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:55', NULL),
(497, 'DILEEP KUMAR MEDURI', 'MALE', '0000-00-00', NULL, '809092', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:55', NULL),
(498, 'G V R LAVAKUMAR', 'MALE', '0000-00-00', NULL, '941', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:55', NULL),
(499, 'LOVAKISHORE KUMAR KAPARAPU ', 'MALE', '0000-00-00', NULL, '824582', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:55', NULL),
(501, 'BASAVARAJ APPARAY MALAGAR ', 'MALE', '0000-00-00', NULL, '827663', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:55', NULL),
(502, 'SANTHOSH SRINIVAS NARASIMHAMURTHY ', 'MALE', '0000-00-00', NULL, '825858', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:55', NULL),
(504, 'WASEEM KHAN MOHAMED', 'MALE', '0000-00-00', NULL, '826922', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:55', NULL),
(505, 'MS.SNEHA N', 'MALE', '0000-00-00', NULL, '815094', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:55', NULL),
(506, 'G HARINATH', 'MALE', '0000-00-00', NULL, '816178', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:55', NULL),
(507, 'D K YUSUF', 'MALE', '0000-00-00', NULL, '825853', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:55', NULL),
(508, 'MANJUNATHA TS', 'MALE', '0000-00-00', NULL, '827741', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:55', NULL),
(510, 'SUHAS M', 'MALE', '0000-00-00', NULL, '827740', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:55', NULL),
(511, 'SURAJ D', 'MALE', '0000-00-00', NULL, '827667', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:55', NULL),
(512, 'K LEELAVATHY', 'MALE', '0000-00-00', NULL, '826854', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:55', NULL),
(513, 'SANJAY KUMAR', 'MALE', '0000-00-00', NULL, '827370', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:55', NULL),
(514, 'KALLAPPAGOUDA PATIL', 'MALE', '0000-00-00', NULL, '825981', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:55', NULL),
(515, 'SREENATH GUPTA', 'MALE', '0000-00-00', NULL, '827169', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:55', NULL),
(516, 'B M MANJUNATH', 'MALE', '0000-00-00', NULL, '504', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:55', NULL),
(517, 'SRNIVASA MURTHY M', 'MALE', '0000-00-00', NULL, '818499', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:55', NULL),
(518, 'JAYASHREE', 'MALE', '0000-00-00', NULL, '827114', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:55', NULL),
(519, 'VINAY G S', 'MALE', '0000-00-00', NULL, '826434', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:55', NULL),
(520, 'CHANDRASEKHAR A', 'MALE', '0000-00-00', NULL, '827171', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:55', NULL),
(522, 'MOHAMMED JAFAR GARAG', 'MALE', '0000-00-00', NULL, '824246', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:55', NULL),
(523, 'MOHAMMED HANEEF BANGALORE ', 'MALE', '0000-00-00', NULL, '823167', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:55', NULL),
(524, 'DADAPEER MAHABOOBSAB CHULBUL ', 'MALE', '0000-00-00', NULL, '825312', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:55', NULL),
(525, 'VILAS SADEPPA JANAGONNA', 'MALE', '0000-00-00', NULL, '827326', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:55', NULL),
(526, 'BASAVARAJ RAMANNA NAIK', 'MALE', '0000-00-00', NULL, '827416', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:56', NULL),
(527, 'A N KULKARNI     ', 'MALE', '0000-00-00', NULL, '593', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:56', NULL),
(528, 'GANAPATI SHIVAPPA MALI', 'MALE', '0000-00-00', NULL, '827172', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:56', NULL),
(529, 'LINGARAJ MALAGI', 'MALE', '0000-00-00', NULL, '811913', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:56', NULL),
(530, 'NAVEEN M V', 'MALE', '0000-00-00', NULL, '807588', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:56', NULL),
(531, 'AMRUTHRAO T MANE', 'MALE', '0000-00-00', NULL, '815062', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:56', NULL),
(532, 'G D CHANDAN ', 'MALE', '0000-00-00', NULL, '811912', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:56', NULL),
(533, 'SANTHOSH K G', 'MALE', '0000-00-00', NULL, '823626', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:56', NULL),
(534, 'GURURAJA ACHARYA', 'MALE', '0000-00-00', NULL, '806734', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:56', NULL),
(535, 'MOHAMMAD ASIF', 'MALE', '0000-00-00', NULL, '822643', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:56', NULL),
(537, 'PRAKASH PR', 'MALE', '0000-00-00', NULL, '827200', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:56', NULL),
(538, 'VINOD HARIHARAN', 'MALE', '0000-00-00', NULL, '827260', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:56', NULL),
(539, 'ANEESH RADHAKRISHNAN', 'MALE', '0000-00-00', NULL, '818400', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:56', NULL),
(540, 'SREEJITH M.', 'MALE', '0000-00-00', NULL, '813282', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:56', NULL),
(541, 'ABDUL RAFEEK M', 'MALE', '0000-00-00', NULL, '811036', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:56', NULL),
(542, 'JOSE VARGHESE', 'MALE', '0000-00-00', NULL, '644', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:56', NULL),
(543, 'SIJJUSH S', 'MALE', '0000-00-00', NULL, '824356', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:56', NULL),
(544, 'ANANTHU KALLUNKAL MAHIPAL ', 'MALE', '0000-00-00', NULL, '822060', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:56', NULL),
(545, 'AFZAL K A', 'MALE', '0000-00-00', NULL, '822029', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:56', NULL),
(546, 'DOMINIC STENOSH V J', 'MALE', '0000-00-00', NULL, '824495', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:56', NULL),
(549, 'RAJESH PAPPINISSERY TAYILVALIPPIL ', 'MALE', '0000-00-00', NULL, '821024', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:56', NULL),
(550, 'SUJITH CHAVARATTIL CHANDRAN ', 'MALE', '0000-00-00', NULL, '826605', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:56', NULL),
(551, 'SYAM SUNIL KS', 'MALE', '0000-00-00', NULL, '822156', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:56', NULL),
(552, 'JOEMON PORUTHUR', 'MALE', '0000-00-00', NULL, '822228', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:56', NULL),
(553, 'MANJUMON P', 'MALE', '0000-00-00', NULL, '800078', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:56', NULL),
(554, 'VIPIN P', 'MALE', '0000-00-00', NULL, '828177', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:56', NULL),
(555, 'NIMALAN N', 'MALE', '0000-00-00', NULL, '825993', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:56', NULL),
(556, 'AJITH M', 'MALE', '0000-00-00', NULL, '804134', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:56', NULL),
(557, 'MUBARIS RAHMAN UC', 'MALE', '0000-00-00', NULL, '826352', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:56', NULL),
(559, 'GOVINDAN K', 'MALE', '0000-00-00', NULL, '825996', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:57', NULL),
(560, 'R ABDUL MUJEER', 'MALE', '0000-00-00', NULL, '825593', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:57', NULL),
(561, 'M ALI AHMED ', 'MALE', '0000-00-00', NULL, '687', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:57', NULL),
(562, 'RAJADURAI SUYAMBULINGAM', 'MALE', '0000-00-00', NULL, '800175', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:57', NULL),
(563, 'N PRABU', 'MALE', '0000-00-00', NULL, '811586', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:57', NULL),
(564, 'SATHISH N', 'MALE', '0000-00-00', NULL, '816593', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:57', NULL),
(565, 'GNANA JOTHI K', 'MALE', '0000-00-00', NULL, '817407', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:57', NULL),
(566, 'KANAGARAJ S', 'MALE', '0000-00-00', NULL, '825675', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:57', NULL),
(567, 'RAJKAMAL V', 'MALE', '0000-00-00', NULL, '826492', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:57', NULL),
(568, 'JAIKUMAR THIRUNAVUKARASU ', 'MALE', '0000-00-00', NULL, '822682', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:57', NULL),
(570, 'S ANAND', 'MALE', '0000-00-00', NULL, '806672', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:57', NULL),
(571, 'E JANI', 'MALE', '0000-00-00', NULL, '811779', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:57', NULL),
(572, 'T G JOTHILAL', 'MALE', '0000-00-00', NULL, '804468', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:57', NULL),
(573, 'K G VENKATESH', 'MALE', '0000-00-00', NULL, '807829', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:57', NULL),
(574, 'R MOHAN', 'MALE', '0000-00-00', NULL, '810449', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:57', NULL),
(575, 'THULASINGAM S', 'MALE', '0000-00-00', NULL, '801085', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:57', NULL),
(576, 'M C PRAKASH', 'MALE', '0000-00-00', NULL, '808886', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:57', NULL),
(577, 'K SANJEEV KUMAR', 'MALE', '0000-00-00', NULL, '803141', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:57', NULL),
(578, 'MANIKANDAN NAGARAJAN', 'MALE', '0000-00-00', NULL, '826890', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:57', NULL),
(579, 'ANANTH KARUPPUSAMY ANANTH ', 'MALE', '0000-00-00', NULL, '820459', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:57', NULL),
(580, 'SRIDHAR D', 'MALE', '0000-00-00', NULL, '818271', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:57', NULL),
(581, 'V SRINIVASAN', 'MALE', '0000-00-00', NULL, '807090', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:57', NULL),
(582, 'KATHIRAVAN A', 'MALE', '0000-00-00', NULL, '827664', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:57', NULL),
(583, 'D.SURESH', 'MALE', '0000-00-00', NULL, '807676', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:57', NULL),
(584, 'KESAVARAJAN S', 'MALE', '0000-00-00', NULL, '818497', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:57', NULL),
(585, 'S ADAM RAMEEZ', 'MALE', '0000-00-00', NULL, '827550', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:57', NULL),
(586, 'S.KALIMUTHU', 'MALE', '0000-00-00', NULL, '806976', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:57', NULL),
(587, 'KARTHICK KUMAR S', 'MALE', '0000-00-00', NULL, '816951', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:57', NULL),
(588, 'B M KUBENDRAN', 'MALE', '0000-00-00', NULL, '825539', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:57', NULL),
(589, 'KALIDASS M.', 'MALE', '0000-00-00', NULL, '806974', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:57', NULL),
(591, 'VENKATESH SK', 'MALE', '0000-00-00', NULL, '826921', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:58', NULL),
(592, 'VIVEKANANDAN SRINIVASAN', 'MALE', '0000-00-00', NULL, '826816', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:58', NULL),
(593, 'KARTHIKEYAN S', 'MALE', '0000-00-00', NULL, '826249', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:58', NULL),
(594, 'DHAYANIDHI M.', 'MALE', '0000-00-00', NULL, '806930', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:58', NULL),
(595, 'RAJESH KUMAR KARUPPUSAMY ', 'MALE', '0000-00-00', NULL, '825799', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:58', NULL),
(596, 'SUDARSANAN GURUSAMYPANDIYAN ', 'MALE', '0000-00-00', NULL, '824982', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:58', NULL),
(597, 'UMAR HATHA MOHAMED IBRAHIM ', 'MALE', '0000-00-00', NULL, '824956', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:58', NULL),
(598, 'ZIAUL HAQ MOHAMEDHANIFA', 'MALE', '0000-00-00', NULL, '827738', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:58', NULL),
(599, 'SATHIYARAJ D', 'MALE', '0000-00-00', NULL, '826055', NULL, NULL, '', 'wht6bd5lak/N7d', 1, 0, NULL, '2018-07-30 12:01:58', NULL),
(600, 'Report', 'MALE', '2018-08-01', NULL, NULL, NULL, 'report@gmail.com', '', 'wht6bd5lak/N7d', 3, 0, NULL, '2018-08-07 10:05:10', NULL);

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
(1, 'About Us', 'ABout Us', 'About', 'About', 'Cough is one of the common clinical conditions observed in clinical practice. Most widely adopted diagnostic modality for patient evaluation is hearing to the cough sounds. Although easy to hear but it’s always challenging to evaluate the specic sound & make appropriate clinical interpretations. Cough Buster is a digital initiative of Wockhardt, the makers of Brozedex, Brozedex-LS & Brozedex Kid takes pride in bringing up an in-clinic initiative for clinical evaluations & interpretation of cough sounds. This is a quick & easy application developed with an objective of providing key insights about the various cough sounds so as to improve its diagnostic evaluation in clinical practice.  ', '', '2017-03-08 13:11:00', 'Active', '2018-08-03 20:56:22', 'Dixit'),
(2, 'Disclamier', 'Disclamier', '', '', '', '', '2018-07-24 07:31:03', 'Active', NULL, 'Dixit');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `doctors`
--
ALTER TABLE `doctors`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `prescription_result`
--
ALTER TABLE `prescription_result`
  ADD PRIMARY KEY (`id`);

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
  ADD PRIMARY KEY (`id`);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `prescription_result`
--
ALTER TABLE `prescription_result`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;

--
-- AUTO_INCREMENT for table `quiz`
--
ALTER TABLE `quiz`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `quiz_details`
--
ALTER TABLE `quiz_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=601;

--
-- AUTO_INCREMENT for table `webpage`
--
ALTER TABLE `webpage`
  MODIFY `Wp_Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
