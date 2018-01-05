-- phpMyAdmin SQL Dump
-- version 4.0.10.18
-- https://www.phpmyadmin.net
--
-- Host: localhost:3306
-- Generation Time: Jan 04, 2018 at 04:23 PM
-- Server version: 5.5.54-38.7-log
-- PHP Version: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `colandbe_babyears`
--

-- --------------------------------------------------------

--
-- Table structure for table `lang`
--

CREATE TABLE IF NOT EXISTS `lang` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `var` varchar(255) NOT NULL,
  `english` varchar(255) NOT NULL,
  `dutch` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `lang`
--

INSERT INTO `lang` (`id`, `var`, `english`, `dutch`) VALUES
(1, 'user_info', 'User info', 'Gebruikers informatie'),
(2, 'list_of_users', 'List of users', 'Lijst met gebruikers'),
(3, 'user_reg_success', 'User has been registered successfully', 'Gebruiker is succesvol geregistreerd'),
(4, 'email_already_exist', 'Entered email Already Exist', 'Ingevoerde e-mail bestaat al'),
(5, 'complete_info', 'Enter complete user information to save', 'Voer volledige gebruikersinformatie in om op te slaan');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `app_language` enum('Dutch','English') NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=42 ;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `app_language`, `updated_at`, `created_at`) VALUES
(1, 'guna', 'guna@test.com', 'English', '0000-00-00 00:00:00', '2017-12-26 15:56:41'),
(2, 'guna', 'guna@hello.com', 'English', '2017-12-27 06:52:10', '2017-12-26 16:01:43'),
(3, 'guna1', 'guna1@test.com', 'English', '0000-00-00 00:00:00', '2017-12-26 16:01:59'),
(4, 'guna1', 'guna1@test.com', 'English', '0000-00-00 00:00:00', '2017-12-26 16:02:01'),
(5, 'guna1', 'guna1@test.com', 'English', '0000-00-00 00:00:00', '2017-12-26 16:02:05'),
(6, 'guna1', 'guna1@test.com', 'English', '0000-00-00 00:00:00', '2017-12-26 16:02:10'),
(7, 'guna', 'guna@test.com', 'English', '0000-00-00 00:00:00', '2017-12-27 06:02:09'),
(8, 'guna', 'guna@test.com', 'English', '0000-00-00 00:00:00', '2017-12-27 06:39:35'),
(9, 'guna31', 'guna11@test.com', 'English', '0000-00-00 00:00:00', '2017-12-27 07:48:45'),
(10, 'guna', 'guna2@test.com', 'English', '0000-00-00 00:00:00', '2017-12-27 08:02:27'),
(11, 'hhhh', 'ffgg@gg.com', 'Dutch', '0000-00-00 00:00:00', '2017-12-27 10:10:44'),
(12, 'gggg', 'dfgh@dd.co', 'Dutch', '0000-00-00 00:00:00', '2017-12-27 10:53:08'),
(13, 'gma@hhh.com', 'narendh', 'Dutch', '0000-00-00 00:00:00', '2017-12-27 11:10:50'),
(14, 'narendra@gmail.com', 'narendra', 'Dutch', '0000-00-00 00:00:00', '2017-12-27 11:16:18'),
(15, 'guna@testing.com', 'Guna', 'Dutch', '0000-00-00 00:00:00', '2017-12-27 11:20:42'),
(16, 'go@gg.com', 'na', 'Dutch', '0000-00-00 00:00:00', '2017-12-27 12:05:30'),
(17, 'ggg@gg.com', 'hhh', 'Dutch', '0000-00-00 00:00:00', '2017-12-29 05:46:21'),
(18, 'hhshsh@shhs.com', 'Nash', 'Dutch', '0000-00-00 00:00:00', '2017-12-29 09:14:41'),
(19, 'ggggg@fff.com', 'hhhh', 'Dutch', '0000-00-00 00:00:00', '2017-12-29 09:25:20'),
(20, 'gyuuuredffggggggg@gmail.hhh', 'hhhhggggg', 'Dutch', '0000-00-00 00:00:00', '2017-12-29 09:33:33'),
(21, 'bhuvaneswari.m@colanonline.com', 'bhuvaneswari', 'Dutch', '0000-00-00 00:00:00', '2017-12-29 09:51:15'),
(22, 'priyadharshini.b@colanonline.com', 'priya', 'Dutch', '0000-00-00 00:00:00', '2017-12-29 10:02:12'),
(23, 'hdhdj@hdh.com', 'jjj', 'Dutch', '0000-00-00 00:00:00', '2017-12-29 10:34:39'),
(24, 'guna', 'guna@news.com', 'English', '0000-00-00 00:00:00', '2017-12-29 10:37:47'),
(25, 'guna', 'hedfds@news.com', 'English', '0000-00-00 00:00:00', '2017-12-29 10:38:05'),
(26, 'narendh ', 'gggg@ffff.com', 'Dutch', '0000-00-00 00:00:00', '2017-12-29 10:51:16'),
(27, 'narendh', 'ffggg@gddf.com', 'Dutch', '0000-00-00 00:00:00', '2017-12-29 10:54:55'),
(28, 'narendh', 'narendh@gg.com', 'Dutch', '0000-00-00 00:00:00', '2017-12-29 11:04:33'),
(29, 'nare', 'n@g.com', 'Dutch', '0000-00-00 00:00:00', '2017-12-29 11:07:55'),
(30, 'nb', 'g@hh.ch', 'Dutch', '0000-00-00 00:00:00', '2017-12-29 11:11:07'),
(31, 'nnnnn', 'bbbbb@ggg.com', 'Dutch', '0000-00-00 00:00:00', '2017-12-29 11:29:39'),
(32, 'nggg', 'hhh@hhh.bbb', 'Dutch', '0000-00-00 00:00:00', '2017-12-29 11:50:46'),
(33, 'naren ', 'nare@gmail.com', 'Dutch', '0000-00-00 00:00:00', '2017-12-29 12:19:38'),
(34, 'rafi', 'r@gmail.com', 'Dutch', '0000-00-00 00:00:00', '2017-12-29 12:28:59'),
(35, 'been', 'nabja@gags.cch', 'Dutch', '0000-00-00 00:00:00', '2017-12-29 12:46:24'),
(36, 'Sathish', 'sathish@gmail.com', 'Dutch', '0000-00-00 00:00:00', '2018-01-03 09:51:45'),
(37, 'alert', 'Jhajjar@fjjk.vyj', 'Dutch', '0000-00-00 00:00:00', '2018-01-03 10:12:05'),
(38, 'hhh', 'shh@ggg.cvv', 'Dutch', '0000-00-00 00:00:00', '2018-01-03 13:03:15'),
(39, 'ggg', 'hgg@ggg.com', 'Dutch', '0000-00-00 00:00:00', '2018-01-03 13:22:42'),
(40, 'Naeem ', 'Anshan@hdhd.hdhh', 'Dutch', '0000-00-00 00:00:00', '2018-01-03 15:25:16'),
(41, 'Sathish', 'guitar@fhhh.gr', 'Dutch', '0000-00-00 00:00:00', '2018-01-04 04:52:55');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
