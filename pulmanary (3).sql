-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 09, 2024 at 09:22 AM
-- Server version: 8.0.40
-- PHP Version: 8.0.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pulmanary`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `username` varchar(30) NOT NULL,
  `password` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`username`, `password`) VALUES
('satyam', 'sk2004'),
('satyam', 'sk2004');

-- --------------------------------------------------------

--
-- Table structure for table `asmwt`
--

CREATE TABLE `asmwt` (
  `pid` varchar(25) NOT NULL,
  `pbp` varchar(20) NOT NULL,
  `phr` varchar(7) NOT NULL,
  `pso2` varchar(7) NOT NULL,
  `pdys` varchar(7) NOT NULL,
  `pfat` varchar(7) NOT NULL,
  `ebp` varchar(7) NOT NULL,
  `ehr` varchar(7) NOT NULL,
  `eso2` varchar(7) NOT NULL,
  `edys` varchar(7) NOT NULL,
  `efat` varchar(7) NOT NULL,
  `t1` varchar(40) NOT NULL,
  `t2` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `asmwt`
--

INSERT INTO `asmwt` (`pid`, `pbp`, `phr`, `pso2`, `pdys`, `pfat`, `ebp`, `ehr`, `eso2`, `edys`, `efat`, `t1`, `t2`) VALUES
('', '', '', '', '', '', '', '', '', '', '', '', ''),
('er', '', '', '', '', '', '', '', '', '', '', '', ''),
('ffgh', '', '', '', '', '', '', '', '', '', '', '', ''),
('smc20241', '', '', '', '', '', '', '', '', '', '', '', ''),
('smc20242', '', '', '', '', '', '', '', '', '', '', '', ''),
('smc20243', '', '', '', '', '', '', '', '', '', '', '', ''),
('smc20245', '', '', '', '', '', '', '', '', '', '', '', ''),
('smc20247', '', '', '', '', '', '', '', '', '', '', '', ''),
('smc20249', '', '', '', '', '', '', '', '', '', '', '', ''),
('smc20250', '', '', '', '', '', '', '', '', '', '', '', ''),
('smc20251', '', '', '', '', '', '', '', '', '', '', '', ''),
('smc20252', '', '', '', '', '', '', '', '', '', '', '', ''),
('smc20256', '', '', '', '', '', '', '', '', '', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `bsmwt`
--

CREATE TABLE `bsmwt` (
  `pid` varchar(25) NOT NULL,
  `pbp` varchar(20) NOT NULL,
  `phr` varchar(7) NOT NULL,
  `pso2` varchar(7) NOT NULL,
  `pdys` varchar(7) NOT NULL,
  `pfat` varchar(7) NOT NULL,
  `ebp` varchar(7) NOT NULL,
  `ehr` varchar(7) NOT NULL,
  `eso2` varchar(7) NOT NULL,
  `edys` varchar(7) NOT NULL,
  `efat` varchar(7) NOT NULL,
  `t1` varchar(40) NOT NULL,
  `t2` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `bsmwt`
--

INSERT INTO `bsmwt` (`pid`, `pbp`, `phr`, `pso2`, `pdys`, `pfat`, `ebp`, `ehr`, `eso2`, `edys`, `efat`, `t1`, `t2`) VALUES
('', '', '', '', '', '', '', '', '', '', '', '', ''),
('er', '', '', '', '', '', '', '', '', '', '', '', ''),
('ffgh', '', '', '', '', '', '', '', '', '', '', '', ''),
('smc20241', '', '', '', '', '', '', '', '', '', '', '', ''),
('smc20242', '', '', '', '', '', '', '', '', '', '', '', ''),
('smc20243', '', '', '', '', '', '', '', '', '', '', '', ''),
('smc20245', '', '', '', '', '', '', '', '', '', '', '', ''),
('smc20247', '', '', '', '', '', '', '', '', '', '', '', ''),
('smc20249', '', '', '', '', '', '', '', '', '', '', '', ''),
('smc20250', '', '', '', '', '', '', '', '', '', '', '', ''),
('smc20251', '', '', '', '', '', '', '', '', '', '', '', ''),
('smc20252', '', '', '', '', '', '', '', '', '', '', '', ''),
('smc20256', '', '', '', '', '', '', '', '', '', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `d_login`
--

CREATE TABLE `d_login` (
  `D_id` varchar(30) NOT NULL,
  `password` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `d_login`
--

INSERT INTO `d_login` (`D_id`, `password`) VALUES
('D1234', '1234'),
('D12345', '12345');

-- --------------------------------------------------------

--
-- Table structure for table `d_profile`
--

CREATE TABLE `d_profile` (
  `D_id` varchar(20) NOT NULL,
  `D_name` varchar(50) NOT NULL,
  `D_dep` varchar(30) NOT NULL,
  `D_phno` varchar(12) NOT NULL,
  `image` varchar(250) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `d_profile`
--

INSERT INTO `d_profile` (`D_id`, `D_name`, `D_dep`, `D_phno`, `image`, `password`) VALUES
('123', 'satyam', 'cse', '1234567890', 'doc/123.jpg', '123'),
('D008', 'gobi', 'mbbs', '9876543210', 'doc/D008.jpg', '1234'),
('D12', 'Babita Singh', 'gynecologist ', '8778388588', 'doc/D12.jpg', 'babita'),
('D123', 'Aarti ', 'Physico', '6372826363', 'doc/D123.jpg', '1234'),
('D777', 'Satyam Kumar', 'Ortho', '9543956924', 'doc/D777.jpg', 'satyam'),
('D888', 'sk', 'ot', '999', 'doc/D888.jpg', '1234');

-- --------------------------------------------------------

--
-- Table structure for table `image`
--

CREATE TABLE `image` (
  `img` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `image`
--

INSERT INTO `image` (`img`) VALUES
('image 3.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `img`
--

CREATE TABLE `img` (
  `id` int NOT NULL,
  `filename` varchar(255) NOT NULL,
  `data` longblob NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `login`
--

CREATE TABLE `login` (
  `userName` varchar(20) NOT NULL,
  `password` varchar(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `login`
--

INSERT INTO `login` (`userName`, `password`) VALUES
('smc20241', '0241'),
('smc20242', '0242'),
('smc20243', '0243'),
('smc20247', '0247'),
('ffgh', 'ffgh'),
('er', 'er'),
('smc20249', '0249'),
('smc20241', '0241'),
('smc20241', '0241'),
('smc20241', '0241'),
('smc20241', '0241'),
('smc20241', '0241'),
('smc20250', ''),
('', ''),
('smc20251', ''),
('smc20252', ''),
('smc20245', ''),
('smc20256', ''),
('', ''),
('', '');

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `pid` varchar(10) NOT NULL,
  `message` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`pid`, `message`) VALUES
('', ''),
('', ''),
('smc113', 'Doctor accepted your appointment on 2024-07-03 15:25:06'),
('smc123', 'Doctor accepted your appointment on 2024-07-03 15:36:09'),
('smc111', 'Doctor accepted your appointment on 2024-07-03 15:36:28'),
('smc123', 'Doctor accepted your appointment on 2024-07-03 15:47:31'),
('smc111', 'Doctor accepted your appointment on 2024-07-04 10:09:25'),
('smc112', 'Doctor accepted your appointment on 2024-07-06 10:50:52'),
('smc123', 'Doctor accepted your appointment on 2024-07-06 13:38:32'),
('smc111', 'Doctor accepted your appointment on 2024-07-08 09:48:03'),
('smc1234', 'Doctor accepted your appointment on 2024-07-09 08:42:31'),
('smc113', 'Doctor accepted your appointment on 2024-07-09 09:26:24'),
('smc1234', 'Doctor accepted your appointment on 2024-07-10 09:04:17'),
('smc111', 'Doctor accepted your appointment on 2024-07-10 09:04:19'),
('smc111', 'Doctor accepted your appointment on 2024-07-13 16:11:58'),
('smc111', 'Doctor accepted your appointment on 2024-07-17 10:01:35'),
('smc123', 'Doctor accepted your appointment on 2024-07-17 14:37:46'),
('smc111', 'Doctor accepted your appointment on 2024-07-18 13:08:48'),
('smc111', 'Doctor accepted your appointment on 2024-08-20 21:47:14'),
('smc111', 'Doctor accepted your appointment on 2024-10-20 18:38:37'),
('smc001', 'Doctor accepted your appointment on 2024-10-22 12:14:27'),
('smc111', 'Doctor accepted your appointment on 2024-10-22 12:19:14'),
('smc112', 'Doctor accepted your appointment on 2024-10-26 11:53:42'),
('smc111', 'Doctor accepted your appointment on 2024-11-10 22:22:18'),
('smc111', 'Doctor accepted your appointment on 2024-11-16 12:59:08'),
('smc111', 'Doctor accepted your appointment on 2024-12-05 13:09:06'),
('smc111', 'Doctor accepted your appointment on 2024-12-07 16:12:42');

-- --------------------------------------------------------

--
-- Table structure for table `patient_info`
--

CREATE TABLE `patient_info` (
  `P_id` varchar(255) NOT NULL,
  `P_name` varchar(255) DEFAULT NULL,
  `P_age` varchar(255) DEFAULT NULL,
  `P_gender` varchar(255) DEFAULT NULL,
  `cause` varchar(50) NOT NULL,
  `1Qnr1` int DEFAULT '0',
  `2Qnr2` int DEFAULT '0',
  `ess1` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `ess2` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `mmr1` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `mmr2` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `mbds1` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `mbds2` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `bpr` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `bprfvc` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `bprfev1` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `bprfef` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `bpo` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `bpofvc` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `bpofev1` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `bpofef` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `apr` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `aprfvc` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `aprfev1` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `aprfef` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `apo` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `apofvc` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `apofev1` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `apofef` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `pso2` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `eso2` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `pbp` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `phr` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `pdys` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `pfat` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `ebp` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `ehr` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `edys` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `efat` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `t1` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `t2` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Stques1` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Stques2` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `patient_info`
--

INSERT INTO `patient_info` (`P_id`, `P_name`, `P_age`, `P_gender`, `cause`, `1Qnr1`, `2Qnr2`, `ess1`, `ess2`, `mmr1`, `mmr2`, `mbds1`, `mbds2`, `bpr`, `bprfvc`, `bprfev1`, `bprfef`, `bpo`, `bpofvc`, `bpofev1`, `bpofef`, `apr`, `aprfvc`, `aprfev1`, `aprfef`, `apo`, `apofvc`, `apofev1`, `apofef`, `pso2`, `eso2`, `pbp`, `phr`, `pdys`, `pfat`, `ebp`, `ehr`, `edys`, `efat`, `t1`, `t2`, `Stques1`, `Stques2`) VALUES
('smc000', 'SAVEETHA', '20', 'Not Decided ', 'Mental', 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'satuam', 'jxj', '20', 'satyam', 'satyam', 'sj', 'bdb', 'ndn', 'jdj', 'js', '', '', '24', '6'),
('smc001', 'ramu', '21', 'male', 'don', 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '7', '3'),
('smc002', 'Ramana', '21', 'Female', '', 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('smc003', 'Demo', '21', 'male', 'nothing ', 0, 0, NULL, NULL, NULL, NULL, '5', '2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('smc111', 'jagadeesh ', '22', 'Male', 'sadist ', 2, 8, '8', '15', 'I only get breathless with strenuous exercise', 'I walk slower than people of the same age on the level because of breathlessness or have to stop for', '3', '8', '90', '90', '90', '90', '91', '91', '91', '91', '80', '80', '80', '80', '81', '81', '81', '81', 'satyam', 'kumar', 'satyam', 'satyam', 'satyam', 'satyam', 'kumar', 'kumar', '20', '200km', '2', '2', '4', '64'),
('smc112', 'Mirror', '1000', 'common ', 'Showing Truth ', 3, 8, '8', '32', 'usefull', 'useless', '1', '10', '123', '13448', '167838', '35', '25783', '26788', '673838', '356738', '30', '30', '30', '30', '30', '30', '30', '30', '20', '25', '20', '20', '20', '20', '25', '25', '25', '25', '', '', '60', '64'),
('smc1122', 'sk', '21', 'male', 'na', 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('smc113', 'Krishna ', '10000', 'Male ', 'Healer ', 4, 6, '16', '12', '', 'I only get breathless with strenuous exercise', '', '', 'hdfc', 'sbi', 'canara', 'rbi', 'rbi', 'rbi', 'rbi', 'rbi', '', '', '', '', '', '', '', '', 'od ', 'ft', 'sk', 'le', 'ld', '30', 'gh', 'gg', 'cf', 'gf', '', '', '', ''),
('smc123', 'nevobi', '20', 'Female ', 'Mental disorder ', 8, 2, '32', '0', 'I walk slower than people of the same age on the level because of breathlessness or have to stop for', 'I walk slower than people of the same age on the level because of breathlessness or have to stop for', '1', '4', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '22', '98', '20', '20', '20', '20', '90/60', '80', 'mmrc3', '30', '', '', '69', '3'),
('smc1234', 'Cake', '20', 'common ', 'sweet ', 0, 4, '8', '9', 'I walk slower than people of the same age on the level because of breathlessness or have to stop for', 'I only get breathless with strenuous exercise', '9', '0', 'jd', 'jd', 'dj', 'jxj', 'kd', 'xnj', 'wo', 'zid', '10', '11/20', 'Ec20', 'Rt50', 'smme', 'mir', 'jfj', 'jjc', 'je', '52', 'shh', 'je', 'hd', 'hs', '50', '51', '53', '54', '', '', '', ''),
('smc1235', 'Satyam', '25', 'male', 'drinking', 3, 8, '8', '8', 'I stop for breath after walking about 100 yards or after a few minutes on the level', 'I only get breathless with strenuous exercise', '2', '10', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
('smc20241', 'gopal', '20', 'male', 'smoking', 8, 5, '11', '', 'I stop for breath after walking about 100 yards or after a few minutes on the level', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
('smc20247', 'narasimha', '21', 'm', 'smoking', 7, 3, '', '', 'OptionValue', 'OptionValue', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
('smc20249', 'sumnth', '21', 'male', 'smoking', 5, 4, '17', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
('smc444', 'yukesh', '20', 'male', 'chain smoking ', 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
('smc776', 'naveen', '20', 'male', 'mental disorder ', 2, 6, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `p_profile`
--

CREATE TABLE `p_profile` (
  `P_id` varchar(30) NOT NULL,
  `P_name` varchar(30) NOT NULL,
  `P_gender` varchar(10) NOT NULL,
  `P_phno` varchar(12) NOT NULL,
  `img` text NOT NULL,
  `cause` varchar(200) DEFAULT NULL,
  `password` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `p_profile`
--

INSERT INTO `p_profile` (`P_id`, `P_name`, `P_gender`, `P_phno`, `img`, `cause`, `password`) VALUES
('smc000', 'sk', 'male', '9543', 'uploads/smc000.jpg', 'dope', '1234'),
('smc001', 'ramu', 'male', '9747', 'uploads/smc001.jpg', 'don', '1234'),
('smc002', 'Ramana', 'Female', '999', 'uploads/smc002.jpg', '', '1234'),
('smc003', 'Demo', 'male', '999', 'uploads/smc003.jpg', 'nothing ', '1234'),
('smc111', 'Jagadeeshwaran', 'Male', '987456321', 'uploads/smc111.jpg', 'sadist ', '1234'),
('smc112', 'Mirror', 'common ', '999+', 'uploads/smc112.jpg', 'Showing Truth ', '1234'),
('smc1122', 'sk', 'male', '999', 'uploads/smc1122.jpg', 'na', '1234'),
('smc113', 'Krishna ', 'Male ', '000', 'uploads/smc113.jpg', 'Healer ', '1234'),
('smc123', 'nevobi', 'Fem', '999', 'uploads/smc123.jpg', 'Mental disorder ', '1234'),
('smc1234', 'Cake', 'common ', '999', 'uploads/smc1234.jpg', 'sweet ', '1234'),
('smc1235', 'Satyam', 'male', '999+', 'uploads/smc1235.jpg', 'drinking', '1234'),
('smc776', 'naveen', 'female ', '999', 'uploads/smc776.jpg', 'mental disorder ', '1234');

-- --------------------------------------------------------

--
-- Table structure for table `result`
--

CREATE TABLE `result` (
  `date` varchar(50) NOT NULL,
  `subid` varchar(40) NOT NULL,
  `resultval` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `result`
--

INSERT INTO `result` (`date`, `subid`, `resultval`) VALUES
('20-10-2024', '23', '657'),
('20-10-2024', '27', '657');

-- --------------------------------------------------------

--
-- Table structure for table `samimg`
--

CREATE TABLE `samimg` (
  `img` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `samimg`
--

INSERT INTO `samimg` (`img`) VALUES
('img/65734a4a9a310.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `tempappo`
--

CREATE TABLE `tempappo` (
  `pid` varchar(20) NOT NULL,
  `name` varchar(50) NOT NULL,
  `date` date NOT NULL,
  `status` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `tempappo`
--

INSERT INTO `tempappo` (`pid`, `name`, `date`, `status`) VALUES
('smc252', 'satyam', '2024-04-23', 'Approved'),
('smc20241', 'dude', '2024-04-23', 'Approved'),
('smc20', 'satyam', '2024-04-23', 'Approved'),
('smc123', 'make', '2024-04-23', 'Approved'),
('smc20241', 'satyam', '2024-04-23', 'Approved'),
('smc258', 'aarthi', '2024-04-23', 'Approved'),
('smc252', 'helo', '2024-04-24', 'Approved'),
('smc123', 'satyam', '2024-04-24', 'Approved'),
('smc123', 'try', '2024-04-25', 'Approved'),
('smc123', 'fgggg', '2024-04-25', 'Approved'),
('smc123', 'satyam', '2024-04-30', 'Approved'),
('smc111', 'sk', '2024-04-30', 'Approved'),
('smc254', 'gobi', '2024-05-04', 'Approved'),
('smc254', '', '2024-05-04', 'Approved'),
('smc253', 'ee', '2024-05-04', 'Approved'),
('smc111', 'satyam', '2024-05-04', 'Approved'),
('smc113', 'Krishna ', '2024-05-05', 'Approved'),
('smc111', 'sk', '2024-05-06', 'Approved'),
('smc112', 'mirror', '2024-05-06', 'Approved'),
('smc113', 'krishna', '2024-05-06', 'Approved'),
('smc111', 'satyam', '2024-05-07', 'Approved'),
('smc1235', 'ram', '2024-05-07', 'Approved'),
('smc112', 'mirror ', '2024-05-07', 'Approved'),
('smc111', 'satyam', '2024-05-08', 'Approved'),
('smc776', 'fu', '2024-05-08', 'Approved'),
('smc111', '', '2024-05-09', 'Approved'),
('smc113', 'Krishna ', '2024-05-09', 'Approved'),
('smc112', 'mirror', '2024-05-09', 'Approved'),
('smc444', 'yukesh', '2024-05-23', 'Approved'),
('smc111', 'mm ', '2024-05-10', 'Approved'),
('smc112', 'mirror ', '2024-05-10', 'Approved'),
('smc113', 'tt', '2024-05-10', 'Approved'),
('smc1235', 'es', '2024-05-10', 'Approved'),
('smc111', 'jagadeesh ', '2024-05-10', 'Approved'),
('smc111', 'gobi', '2024-05-15', 'Approved'),
('smc111', 'satyam ', '2024-05-16', 'Approved'),
('smc111', 'hello', '2024-05-22', 'Approved'),
('smc111', 'book', '2024-05-17', 'Approved'),
('smc112', 'tai', '2024-05-17', 'Approved'),
('smc111', 'jaga', '2024-05-28', 'Approved'),
('smc1235', 'ram', '2024-06-02', 'Approved'),
('smc111', 'satyam', '2024-06-02', 'Approved'),
('smc112', 'mirror', '2024-06-02', 'Approved'),
('smc111', 'satyam', '2024-06-07', 'Approved'),
('smc111', 'vasanth', '2024-06-11', 'Approved'),
('smc111', 'hsh', '2024-06-07', 'Approved'),
('smc111', '', '2024-06-07', 'Approved'),
('smc111', 'satyam', '2024-06-07', 'Approved'),
('smc111', 'satyam', '2024-06-09', 'Approved'),
('smc111', 'sk', '2024-06-09', 'Approved'),
('smc111', 'satyam', '2024-06-09', 'Approved'),
('smc112', 'sk', '2024-06-09', 'Approved'),
('smc111', 'satyam', '2024-06-10', 'Approved'),
('smc111', 'John Doe', '2024-06-12', 'Approved'),
('smc112', 'John Doe', '2024-06-12', 'Approved'),
('smc113', 'John Doe', '2024-06-12', 'Approved'),
('smc111', '', '2024-06-13', 'Approved'),
('smc112', 'hk', '2024-06-13', 'Approved'),
('smc113', 'tt', '2024-06-13', 'Approved'),
('smc111', 'sk', '2024-06-15', 'Approved'),
('smc111', 'satyam', '2024-06-17', 'Approved'),
('smc111', 'sk', '2024-06-18', 'Approved'),
('smc111', 'sk', '2024-06-19', 'Approved'),
('smc111', 'satyam ', '2024-06-20', 'Approved'),
('smc123', 'nevobi', '2024-06-20', 'Approved'),
('smc111', 'sk', '2024-06-22', 'Approved'),
('smc123', 'nev', '2024-06-22', 'Approved'),
('smc111', 'satyam', '2024-07-01', 'Approved'),
('smc123', 'nev', '2024-07-01', 'Approved'),
('smc111', 'sk', '2024-07-02', 'Approved'),
('smc113', 'gobi', '2024-07-02', 'Approved'),
('smc111', 'satyam', '2024-07-03', 'Approved'),
('smc112', 'dk', '2024-07-03', 'Approved'),
('smc113', 'sk', '2024-07-03', 'Approved'),
('smc113', 'gobi', '2024-07-02', 'Approved'),
('smc123', 'babitha', '2024-07-03', 'Approved'),
('smc111', 's', '2024-07-03', 'Approved'),
('smc111', 'sk', '2024-07-04', 'Approved'),
('smc112', 'sk', '2024-07-06', 'Approved'),
('smc123', 'viji', '2024-07-06', 'Approved'),
('smc111', 'jaga', '2024-07-08', 'Approved'),
('smc1234', 'sk', '2024-07-09', 'Approved'),
('smc113', 'Krish ', '2024-07-09', 'Approved'),
('smc111', 'sk', '2024-07-10', 'Approved'),
('smc1234', 'cake ', '2024-07-10', 'Approved'),
('smc111', 'Desika', '2024-07-13', 'Approved'),
('smc111', 'jaga', '2024-07-17', 'Approved'),
('smc123', 'nevobi', '2024-07-17', 'Approved'),
('smc111', 'kk', '2024-07-18', 'Approved'),
('smc111', 'satyam', '2024-08-20', 'Approved'),
('smc111', 'sk', '2024-10-21', 'Approved'),
('smc001', 'demo', '2024-10-21', 'Approved'),
('smc111', 'pulmo', '2024-10-22', 'Approved'),
('smc111', 'pulmo', '2024-10-22', 'Approved'),
('smc112', 'sk', '2024-10-26', 'Approved'),
('smc111', 'sk', '2024-11-11', 'Approved'),
('smc111', 'sk', '2024-11-16', 'Approved'),
('smc111', 'jaga', '2024-12-05', 'Approved'),
('smc111', 'sk', '2024-12-07', 'Approved');

-- --------------------------------------------------------

--
-- Table structure for table `videos`
--

CREATE TABLE `videos` (
  `uVideos` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `videos`
--

INSERT INTO `videos` (`uVideos`) VALUES
('videos/PULMONARY REHABILITATION HD.mp4'),
('videos/1000064200.mp4');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `asmwt`
--
ALTER TABLE `asmwt`
  ADD PRIMARY KEY (`pid`);

--
-- Indexes for table `bsmwt`
--
ALTER TABLE `bsmwt`
  ADD PRIMARY KEY (`pid`);

--
-- Indexes for table `d_login`
--
ALTER TABLE `d_login`
  ADD PRIMARY KEY (`D_id`);

--
-- Indexes for table `d_profile`
--
ALTER TABLE `d_profile`
  ADD PRIMARY KEY (`D_id`);

--
-- Indexes for table `img`
--
ALTER TABLE `img`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `patient_info`
--
ALTER TABLE `patient_info`
  ADD PRIMARY KEY (`P_id`);

--
-- Indexes for table `p_profile`
--
ALTER TABLE `p_profile`
  ADD PRIMARY KEY (`P_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `img`
--
ALTER TABLE `img`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
