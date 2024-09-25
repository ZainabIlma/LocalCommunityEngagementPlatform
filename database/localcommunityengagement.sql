-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 16, 2024 at 12:12 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `localcommunityengagement`
--

-- --------------------------------------------------------

--
-- Table structure for table `announcement_tb`
--

CREATE TABLE `announcement_tb` (
  `aid` int(20) NOT NULL,
  `atitle` varchar(70) NOT NULL,
  `adate` date NOT NULL DEFAULT current_timestamp(),
  `atime` time NOT NULL DEFAULT current_timestamp(),
  `acon` varchar(250) NOT NULL,
  `aauthor` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `announcement_tb`
--

INSERT INTO `announcement_tb` (`aid`, `atitle`, `adate`, `atime`, `acon`, `aauthor`) VALUES
(1, 'first announcement', '2024-08-16', '19:34:00', 'recent announcement', 'here');

-- --------------------------------------------------------

--
-- Table structure for table `event_tb`
--

CREATE TABLE `event_tb` (
  `eid` int(20) NOT NULL,
  `edate` date NOT NULL,
  `ename` varchar(30) NOT NULL,
  `etime` time NOT NULL,
  `eimage` varchar(70) NOT NULL,
  `edesc` varchar(250) NOT NULL,
  `eplace` varchar(70) NOT NULL,
  `eorg` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `event_tb`
--

INSERT INTO `event_tb` (`eid`, `edate`, `ename`, `etime`, `eimage`, `edesc`, `eplace`, `eorg`) VALUES
(1, '2024-08-06', 'Sih2024', '17:20:00', 'download (3).jpg', 'a national leve hackathon for engineerig students to come up with exclusive ideas for the problem statements given', 'India', 'government'),
(2, '2024-08-24', 'hacknovate', '18:23:00', 'download (1).jpg', 'this is the hackathon organised by ABESIT each year, it is a 24 hour hackathon packed with activities fun and food with coding sesiion and mentor rounds done in regular intervals', 'ghaziabad,India', 'ABESIT');

-- --------------------------------------------------------

--
-- Table structure for table `localbsns_tb`
--

CREATE TABLE `localbsns_tb` (
  `lid` int(20) NOT NULL,
  `ltitle` varchar(70) NOT NULL,
  `ldate` date NOT NULL DEFAULT current_timestamp(),
  `lloc` varchar(70) NOT NULL,
  `limage` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `localbsns_tb`
--

INSERT INTO `localbsns_tb` (`lid`, `ltitle`, `ldate`, `lloc`, `limage`) VALUES
(1, 'Preeti GlassWorks', '2024-08-12', 'Crossings Republik, Ghaziabad', 'OIP (5).jpg'),
(2, 'Zee Interior Designers', '2024-08-12', 'Raj Nagar, Ghaziabad', 'OIP (4).jpg'),
(3, 'Balaji Sweets', '2024-08-12', ' shop 128, Vasundhara,  opp Vishal MegaMart', 'download (7).jpg');

-- --------------------------------------------------------

--
-- Table structure for table `mgmtlogin`
--

CREATE TABLE `mgmtlogin` (
  `mgmt_id` int(20) NOT NULL,
  `email` varchar(50) NOT NULL,
  `full_name` varchar(30) NOT NULL,
  `password` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `mgmtlogin`
--

INSERT INTO `mgmtlogin` (`mgmt_id`, `email`, `full_name`, `password`) VALUES
(1, 'zainabilma244901@gmail.com', 'Zainab Ilma', 'zai123');

-- --------------------------------------------------------

--
-- Table structure for table `news_tb`
--

CREATE TABLE `news_tb` (
  `nid` int(20) NOT NULL,
  `ntitle` varchar(50) NOT NULL,
  `ndate` date NOT NULL DEFAULT current_timestamp(),
  `ntime` time NOT NULL DEFAULT current_timestamp(),
  `nimage` varchar(50) NOT NULL,
  `ncon` varchar(250) NOT NULL,
  `nauthor` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `news_tb`
--

INSERT INTO `news_tb` (`nid`, `ntitle`, `ndate`, `ntime`, `nimage`, `ncon`, `nauthor`) VALUES
(1, 'new virus outbreak', '2024-08-12', '14:25:43', 'th.jpg', 'Anew virus found in people of China', 'jk news'),
(2, 'something happended somewhere', '2024-08-12', '14:26:37', 'download (4).jpg', 'new news title and discription', 'jk news'),
(4, 'Gold prices hiked by 1.5%', '2024-08-16', '00:00:00', 'download(6)', '18k gold prices today witnessed sharp surge of Rs 780 to settle at Rs 53,720/10 grams and 100 grams of 18 carat yellow metal prices today gained by Rs 7,800 to Rs 5,37,200 on August 13, 2024. Spot Gold, Spot Silver Prices Today: Spot gold jumped 1.5%', 'IndiaToday');

-- --------------------------------------------------------

--
-- Table structure for table `reventh_tb`
--

CREATE TABLE `reventh_tb` (
  `rehid` int(20) NOT NULL,
  `rehdate` date NOT NULL,
  `rehtime` time NOT NULL,
  `rehprogram` varchar(30) NOT NULL,
  `rehcontact` varchar(13) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `reventh_tb`
--

INSERT INTO `reventh_tb` (`rehid`, `rehdate`, `rehtime`, `rehprogram`, `rehcontact`) VALUES
(2, '2024-08-09', '13:00:00', 'Birthday Party', '12121212');

-- --------------------------------------------------------

--
-- Table structure for table `rmaintenance_tb`
--

CREATE TABLE `rmaintenance_tb` (
  `rmid` int(20) NOT NULL,
  `rmdate` date NOT NULL,
  `rmtime` time NOT NULL,
  `rmservice` varchar(50) NOT NULL,
  `rmcontact` varchar(13) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `rmaintenance_tb`
--

INSERT INTO `rmaintenance_tb` (`rmid`, `rmdate`, `rmtime`, `rmservice`, `rmcontact`) VALUES
(4, '2024-08-09', '14:30:00', 'Plumbing', '25252525'),
(5, '2024-08-16', '12:12:00', 'Plumbing', '25252525');

-- --------------------------------------------------------

--
-- Table structure for table `rpark_tb`
--

CREATE TABLE `rpark_tb` (
  `rpid` int(20) NOT NULL,
  `rpdate` date NOT NULL,
  `rptime` time NOT NULL,
  `rpnum` int(2) NOT NULL,
  `rpcontact` varchar(13) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `rpark_tb`
--

INSERT INTO `rpark_tb` (`rpid`, `rpdate`, `rptime`, `rpnum`, `rpcontact`) VALUES
(1, '2024-08-06', '22:48:14', 1, '5463410325'),
(3, '2024-08-03', '12:20:00', 2, '454664');

-- --------------------------------------------------------

--
-- Table structure for table `threadreply_tb`
--

CREATE TABLE `threadreply_tb` (
  `trid` int(20) NOT NULL,
  `tid` int(20) NOT NULL,
  `trauthor` varchar(30) NOT NULL,
  `trtimestamp` datetime NOT NULL DEFAULT current_timestamp(),
  `trcon` varchar(250) NOT NULL,
  `trimage` varchar(70) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `threadreply_tb`
--

INSERT INTO `threadreply_tb` (`trid`, `tid`, `trauthor`, `trtimestamp`, `trcon`, `trimage`) VALUES
(1, 2, 'user1', '2024-08-12 16:32:15', 'checking reply', ''),
(2, 2, 'user2', '2024-08-12 16:32:56', 'checking reply2', '');

-- --------------------------------------------------------

--
-- Table structure for table `thread_tb`
--

CREATE TABLE `thread_tb` (
  `tid` int(20) NOT NULL,
  `ttitle` varchar(100) NOT NULL,
  `ttimestamp` datetime NOT NULL DEFAULT current_timestamp(),
  `tauthor` varchar(30) NOT NULL,
  `timage` varchar(70) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `thread_tb`
--

INSERT INTO `thread_tb` (`tid`, `ttitle`, `ttimestamp`, `tauthor`, `timage`) VALUES
(2, 'Tank Cleaning is required', '2024-08-12 14:48:01', 'Admin', 'th.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `userlogin`
--

CREATE TABLE `userlogin` (
  `uid` int(20) NOT NULL,
  `uname` varchar(30) NOT NULL,
  `uemail` varchar(50) NOT NULL,
  `upass` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `userlogin`
--

INSERT INTO `userlogin` (`uid`, `uname`, `uemail`, `upass`) VALUES
(1, 'admin', 'admin@gmail.com', 'admin123'),
(2, 'kajal', 'kajal@gmail.com', 'kaju123');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `announcement_tb`
--
ALTER TABLE `announcement_tb`
  ADD PRIMARY KEY (`aid`);

--
-- Indexes for table `event_tb`
--
ALTER TABLE `event_tb`
  ADD PRIMARY KEY (`eid`);

--
-- Indexes for table `localbsns_tb`
--
ALTER TABLE `localbsns_tb`
  ADD PRIMARY KEY (`lid`);

--
-- Indexes for table `mgmtlogin`
--
ALTER TABLE `mgmtlogin`
  ADD PRIMARY KEY (`mgmt_id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `news_tb`
--
ALTER TABLE `news_tb`
  ADD PRIMARY KEY (`nid`);

--
-- Indexes for table `reventh_tb`
--
ALTER TABLE `reventh_tb`
  ADD PRIMARY KEY (`rehid`);

--
-- Indexes for table `rmaintenance_tb`
--
ALTER TABLE `rmaintenance_tb`
  ADD PRIMARY KEY (`rmid`);

--
-- Indexes for table `rpark_tb`
--
ALTER TABLE `rpark_tb`
  ADD PRIMARY KEY (`rpid`);

--
-- Indexes for table `threadreply_tb`
--
ALTER TABLE `threadreply_tb`
  ADD PRIMARY KEY (`trid`),
  ADD KEY `tid` (`tid`);

--
-- Indexes for table `thread_tb`
--
ALTER TABLE `thread_tb`
  ADD PRIMARY KEY (`tid`);

--
-- Indexes for table `userlogin`
--
ALTER TABLE `userlogin`
  ADD PRIMARY KEY (`uid`),
  ADD UNIQUE KEY `uemail` (`uemail`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `announcement_tb`
--
ALTER TABLE `announcement_tb`
  MODIFY `aid` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `event_tb`
--
ALTER TABLE `event_tb`
  MODIFY `eid` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `localbsns_tb`
--
ALTER TABLE `localbsns_tb`
  MODIFY `lid` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `mgmtlogin`
--
ALTER TABLE `mgmtlogin`
  MODIFY `mgmt_id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `news_tb`
--
ALTER TABLE `news_tb`
  MODIFY `nid` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `reventh_tb`
--
ALTER TABLE `reventh_tb`
  MODIFY `rehid` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `rmaintenance_tb`
--
ALTER TABLE `rmaintenance_tb`
  MODIFY `rmid` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `rpark_tb`
--
ALTER TABLE `rpark_tb`
  MODIFY `rpid` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `threadreply_tb`
--
ALTER TABLE `threadreply_tb`
  MODIFY `trid` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `thread_tb`
--
ALTER TABLE `thread_tb`
  MODIFY `tid` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `userlogin`
--
ALTER TABLE `userlogin`
  MODIFY `uid` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `threadreply_tb`
--
ALTER TABLE `threadreply_tb`
  ADD CONSTRAINT `threadreply_tb_ibfk_1` FOREIGN KEY (`tid`) REFERENCES `thread_tb` (`tid`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
