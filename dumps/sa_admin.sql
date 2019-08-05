-- phpMyAdmin SQL Dump
-- version 4.5.4.1deb2ubuntu2.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Aug 04, 2019 at 09:03 PM
-- Server version: 5.7.27-0ubuntu0.16.04.1
-- PHP Version: 7.0.33-0ubuntu0.16.04.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "-03:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sa_admin`
--

-- --------------------------------------------------------

--
-- Table structure for table `deployments`
--

CREATE TABLE `deployments` (
  `id` int(11) NOT NULL,
  `name` varchar(80) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `deployments`
--

INSERT INTO `deployments` (`id`, `name`, `user_id`) VALUES
(1, 'sa-example-deploy-1', 1),
(2, 'sa-example-deploy-2', 1);

-- --------------------------------------------------------

--
-- Table structure for table `deployment_modules`
--

CREATE TABLE `deployment_modules` (
  `id` int(11) NOT NULL,
  `deployment_id` int(11) NOT NULL,
  `module_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `deployment_modules`
--

INSERT INTO `deployment_modules` (`id`, `deployment_id`, `module_id`) VALUES
(1, 1, 15),
(2, 1, 16),
(3, 1, 17),
(4, 1, 18),
(5, 1, 19),
(6, 1, 20),
(7, 1, 21),
(8, 1, 22),
(9, 1, 23),
(10, 1, 24),
(11, 1, 25),
(12, 1, 26),
(13, 1, 27),
(14, 1, 28);

-- --------------------------------------------------------

--
-- Table structure for table `modules`
--

CREATE TABLE `modules` (
  `id` int(11) NOT NULL,
  `name` varchar(80) NOT NULL,
  `full_name` varchar(80) DEFAULT NULL,
  `description` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `modules`
--

INSERT INTO `modules` (`id`, `name`, `full_name`, `description`) VALUES
(15, 'backup-config', 'Backup Config', NULL),
(16, 'change-user', 'Change Users', NULL),
(17, 'syslog', 'System Log', NULL),
(18, 'system-status', 'System Status', NULL),
(19, 'apache', 'Apache Web Server', NULL),
(20, 'bind8', 'BIND DNS Server', NULL),
(21, 'mysql', 'MySQL Database', NULL),
(22, 'postfix', 'Postfix Mail Server', NULL),
(23, 'proftpd', 'ProFTPd Server', NULL),
(24, 'spam', 'Antispam', NULL),
(25, 'firewall', 'Linux Firewall', NULL),
(26, 'shorewall6', 'Shorewall 6', NULL),
(27, 'heartbeat', 'Heartbeat Monitor', NULL),
(28, 'phpini', 'PHP Config File', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(80) NOT NULL,
  `username` varchar(80) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `username`, `password`) VALUES
(1, 'Sample User', 'user', '5e884898da28047151d0e56f8dc6292773603d0d6aabbdd62a11ef721d1542d8');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `deployments`
--
ALTER TABLE `deployments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `deployment_modules`
--
ALTER TABLE `deployment_modules`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `modules`
--
ALTER TABLE `modules`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `deployments`
--
ALTER TABLE `deployments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `deployment_modules`
--
ALTER TABLE `deployment_modules`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT for table `modules`
--
ALTER TABLE `modules`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
