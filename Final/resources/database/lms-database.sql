-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jun 22, 2016 at 03:16 PM
-- Server version: 10.1.10-MariaDB
-- PHP Version: 5.6.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `lms project`
--

-- --------------------------------------------------------

--
-- Table structure for table `degree`
--

CREATE TABLE `degree` (
  `D_ID` varchar(3) NOT NULL,
  `D_name` varchar(50) NOT NULL,
  `F_ID` varchar(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `degree_consists_of_years`
--

CREATE TABLE `degree_consists_of_years` (
  `D_ID` varchar(3) NOT NULL,
  `Y_ID` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `events`
--

CREATE TABLE `events` (
  `E_ID` varchar(15) NOT NULL,
  `Name` varchar(40) NOT NULL,
  `Date` date NOT NULL,
  `Time` time NOT NULL,
  `Venue` text NOT NULL,
  `Description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `faculty`
--

CREATE TABLE `faculty` (
  `F_name` varchar(30) NOT NULL,
  `F_ID` varchar(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `faculty_have_events`
--

CREATE TABLE `faculty_have_events` (
  `F_ID` varchar(2) NOT NULL,
  `E_ID` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `lectureres`
--

CREATE TABLE `lectureres` (
  `L_ID` varchar(3) NOT NULL,
  `NIC` varchar(10) NOT NULL,
  `F_name` varchar(20) NOT NULL,
  `M_name` varchar(20) NOT NULL,
  `L_name` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `lessons`
--

CREATE TABLE `lessons` (
  `L_no` varchar(3) NOT NULL,
  `L_name` varchar(20) NOT NULL,
  `M_no` varchar(15) NOT NULL,
  `Date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `modules`
--

CREATE TABLE `modules` (
  `M_code` varchar(15) NOT NULL,
  `M_name` varchar(15) NOT NULL,
  `L_no` varchar(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `semesters`
--

CREATE TABLE `semesters` (
  `Se_ID` varchar(10) NOT NULL,
  `Se_name` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

CREATE TABLE `student` (
  `S_ID` varchar(5) NOT NULL,
  `F_name` varchar(20) NOT NULL,
  `M_name` varchar(20) NOT NULL,
  `L_name` varchar(40) NOT NULL,
  `DOB` date NOT NULL,
  `F_ID` varchar(2) NOT NULL,
  `D_ID` varchar(2) NOT NULL,
  `Password` varchar(10) NOT NULL,
  `User_name` varchar(15) NOT NULL,
  `NIC` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `students_follow_modules`
--

CREATE TABLE `students_follow_modules` (
  `S_ID` varchar(5) NOT NULL,
  `M_code` varchar(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `year`
--

CREATE TABLE `year` (
  `Y_ID` varchar(10) NOT NULL,
  `Y_name` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `year_has_semesters`
--

CREATE TABLE `year_has_semesters` (
  `Y_ID` varchar(10) NOT NULL,
  `Se_ID` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `degree`
--
ALTER TABLE `degree`
  ADD PRIMARY KEY (`D_ID`),
  ADD KEY `Faculty` (`F_ID`);

--
-- Indexes for table `degree_consists_of_years`
--
ALTER TABLE `degree_consists_of_years`
  ADD KEY `Degree` (`D_ID`),
  ADD KEY `Year` (`Y_ID`);

--
-- Indexes for table `events`
--
ALTER TABLE `events`
  ADD PRIMARY KEY (`E_ID`);

--
-- Indexes for table `faculty`
--
ALTER TABLE `faculty`
  ADD PRIMARY KEY (`F_ID`);

--
-- Indexes for table `faculty_have_events`
--
ALTER TABLE `faculty_have_events`
  ADD KEY `Faculty` (`F_ID`),
  ADD KEY `Events` (`E_ID`);

--
-- Indexes for table `lectureres`
--
ALTER TABLE `lectureres`
  ADD PRIMARY KEY (`L_ID`);

--
-- Indexes for table `lessons`
--
ALTER TABLE `lessons`
  ADD PRIMARY KEY (`L_no`),
  ADD KEY `Module` (`M_no`);

--
-- Indexes for table `modules`
--
ALTER TABLE `modules`
  ADD PRIMARY KEY (`M_code`),
  ADD KEY `Lessons` (`L_no`);

--
-- Indexes for table `semesters`
--
ALTER TABLE `semesters`
  ADD PRIMARY KEY (`Se_ID`);

--
-- Indexes for table `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`S_ID`),
  ADD KEY `Faculty` (`F_ID`),
  ADD KEY `Degree` (`D_ID`);

--
-- Indexes for table `students_follow_modules`
--
ALTER TABLE `students_follow_modules`
  ADD KEY `Student` (`S_ID`),
  ADD KEY `Modules` (`M_code`);

--
-- Indexes for table `year`
--
ALTER TABLE `year`
  ADD PRIMARY KEY (`Y_ID`);

--
-- Indexes for table `year_has_semesters`
--
ALTER TABLE `year_has_semesters`
  ADD KEY `Year` (`Y_ID`),
  ADD KEY `Semesters` (`Se_ID`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
