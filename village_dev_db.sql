-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 24, 2025 at 06:07 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `village_dev_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `events`
--

CREATE TABLE `events` (
  `event_id` int(11) NOT NULL,
  `event_name` varchar(255) DEFAULT NULL,
  `event_type` varchar(50) DEFAULT NULL,
  `event_date` date DEFAULT NULL,
  `event_description` text DEFAULT NULL,
  `event_created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `issues`
--

CREATE TABLE `issues` (
  `issue_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `issue_type` enum('technical','billing','account','other') NOT NULL,
  `description` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `issues`
--

INSERT INTO `issues` (`issue_id`, `name`, `email`, `issue_type`, `description`, `created_at`) VALUES
(1, 'Joy Moth', 'joy@gmail.com', 'account', 'issue\r\n', '2025-03-23 23:38:33'),
(2, 'meghna', 'meghna.m.dolui@gmail.com', 'billing', 'good', '2025-03-24 00:46:28');

-- --------------------------------------------------------

--
-- Table structure for table `problems`
--

CREATE TABLE `problems` (
  `problem_id` int(11) NOT NULL,
  `user_email` varchar(255) NOT NULL,
  `problem_title` varchar(255) NOT NULL,
  `problem_description` text NOT NULL,
  `assigned_volunteer` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `solutions`
--

CREATE TABLE `solutions` (
  `solution_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `solution` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `solutions`
--

INSERT INTO `solutions` (`solution_id`, `name`, `email`, `solution`, `created_at`) VALUES
(1, 'Joy Moth', 'joy@gmail.com', 'solve', '2025-03-23 23:50:36');

-- --------------------------------------------------------

--
-- Table structure for table `suggestion_for_improvement`
--

CREATE TABLE `suggestion_for_improvement` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `suggestion` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `suggestion_for_improvement`
--

INSERT INTO `suggestion_for_improvement` (`id`, `name`, `email`, `suggestion`, `created_at`) VALUES
(1, 'Joy Moth', 'joy@gmail.com', 'hqppy', '2025-03-23 23:25:59'),
(2, 'jyoti', 'jyoti@gmail.com', 'happy', '2025-03-23 23:28:23'),
(3, 'jyoti', 'jyoti@gmail.com', 'happy', '2025-03-23 23:28:58'),
(4, 'meghna', 'meghna.m.dolui@gmail.com', 'bad', '2025-03-24 00:45:56');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `full_name` varchar(255) NOT NULL,
  `email_address` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `address` text DEFAULT NULL,
  `phone_number` varchar(15) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `full_name`, `email_address`, `password`, `address`, `phone_number`, `created_at`) VALUES
(1, 'meghna', 'meghna.m.dolui@gmail.com', '7c4a8d09ca3762af61e59520943dc26494f8941b', 'Mumbai', '7896654', '2024-10-23 21:10:27'),
(2, 'arun', 'arun@gmail.com', '7110eda4d09e062aa5e4a390b0a572ac0d2c0220', 'mumbai west', '1234567890', '2025-02-05 16:24:18'),
(3, 'ifa', 'ifa@gmail.com', '40bd001563085fc35165329ea1ff5c5ecbdbbeef', 'abc', '123456789', '2025-02-06 08:58:31'),
(6, 'Joy Moth', 'joy@gmail.com', '7c4a8d09ca3762af61e59520943dc26494f8941b', 'abc', '1234567890', '2025-03-23 13:32:50'),
(7, 'joy', 'moth@gmail.com', '6216f8a75fd5bb3d5f22b6f9958cdede3fc086c2', 'bvc', '00', '2025-03-24 04:00:15'),
(8, 'kashish gupta', 'kashish@gmail.com', '7110eda4d09e062aa5e4a390b0a572ac0d2c0220', 'abcd', '1234567', '2025-03-24 04:55:16');

-- --------------------------------------------------------

--
-- Table structure for table `volunteers`
--

CREATE TABLE `volunteers` (
  `user_id` int(11) NOT NULL,
  `full_name` varchar(255) NOT NULL,
  `email_address` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `address` text DEFAULT NULL,
  `phone_number` varchar(15) DEFAULT NULL,
  `skills_experience` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `volunteers`
--

INSERT INTO `volunteers` (`user_id`, `full_name`, `email_address`, `password`, `address`, `phone_number`, `skills_experience`, `created_at`) VALUES
(1, 'jyoti', 'jyoti@gmail.com', '40bd001563085fc35165329ea1ff5c5ecbdbbeef', '1bc', '123', 'happy', '2025-03-23 21:30:51'),
(2, 'Arun', 'arun@gmail.com', '6216f8a75fd5bb3d5f22b6f9958cdede3fc086c2', 'bvc', '222', 'hab', '2025-03-24 04:06:08'),
(3, 'meghna', 'meghna@gmail.com', '0ec09ef9836da03f1add21e3ef607627e687e790', 'abc', '12345', 'gggg', '2025-03-24 04:58:08');

-- --------------------------------------------------------

--
-- Table structure for table `volunteer_feedback`
--

CREATE TABLE `volunteer_feedback` (
  `feedback_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `event` varchar(255) NOT NULL,
  `rating` int(11) NOT NULL CHECK (`rating` >= 1 and `rating` <= 5),
  `experience` text NOT NULL,
  `improvement` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `volunteer_feedback`
--

INSERT INTO `volunteer_feedback` (`feedback_id`, `name`, `email`, `event`, `rating`, `experience`, `improvement`, `created_at`) VALUES
(1, 'Joy Moth', 'joy@gmail.com', 'sale', 5, 'good', 'good', '2025-03-23 23:42:43');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `events`
--
ALTER TABLE `events`
  ADD PRIMARY KEY (`event_id`);

--
-- Indexes for table `issues`
--
ALTER TABLE `issues`
  ADD PRIMARY KEY (`issue_id`);

--
-- Indexes for table `problems`
--
ALTER TABLE `problems`
  ADD PRIMARY KEY (`problem_id`);

--
-- Indexes for table `solutions`
--
ALTER TABLE `solutions`
  ADD PRIMARY KEY (`solution_id`);

--
-- Indexes for table `suggestion_for_improvement`
--
ALTER TABLE `suggestion_for_improvement`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `email_address` (`email_address`);

--
-- Indexes for table `volunteers`
--
ALTER TABLE `volunteers`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `email_address` (`email_address`);

--
-- Indexes for table `volunteer_feedback`
--
ALTER TABLE `volunteer_feedback`
  ADD PRIMARY KEY (`feedback_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `events`
--
ALTER TABLE `events`
  MODIFY `event_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `issues`
--
ALTER TABLE `issues`
  MODIFY `issue_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `problems`
--
ALTER TABLE `problems`
  MODIFY `problem_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `solutions`
--
ALTER TABLE `solutions`
  MODIFY `solution_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `suggestion_for_improvement`
--
ALTER TABLE `suggestion_for_improvement`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `volunteers`
--
ALTER TABLE `volunteers`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `volunteer_feedback`
--
ALTER TABLE `volunteer_feedback`
  MODIFY `feedback_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
