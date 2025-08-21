-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Aug 20, 2025 at 06:16 AM
-- Server version: 8.0.42-33
-- PHP Version: 8.3.23

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `virungaecotoursdb`
--

-- --------------------------------------------------------

--
-- Table structure for table `about_cta`
--

CREATE TABLE `about_cta` (
  `cta_id` int NOT NULL,
  `section_title` varchar(255) NOT NULL DEFAULT 'Join Our Journey',
  `section_description` text NOT NULL,
  `button_text` varchar(100) NOT NULL DEFAULT 'Plan Your Adventure',
  `button_link` varchar(255) NOT NULL DEFAULT '#',
  `background_image` varchar(255) NOT NULL,
  `facebook_url` varchar(255) DEFAULT NULL,
  `instagram_url` varchar(255) DEFAULT NULL,
  `twitter_url` varchar(255) DEFAULT NULL,
  `youtube_url` varchar(255) DEFAULT NULL,
  `pinterest_url` varchar(255) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `about_cta`
--

INSERT INTO `about_cta` (`cta_id`, `section_title`, `section_description`, `button_text`, `button_link`, `background_image`, `facebook_url`, `instagram_url`, `twitter_url`, `youtube_url`, `pinterest_url`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'Join Our Journey', 'Ready to explore the world sustainably? Connect with us to start planning your next eco-adventure.', 'Plan Your Adventure', 'build.php', '1748705200_683b1fb096b8a.png', 'https://www.facebook.com/share/16fnudwqJC/?mibextid=LQQJ4d', 'https://www.instagram.com/virunga_ecotours?igsh=YWtnY3FmZjcwdzFl&utm_source=qr', 'https://www.linkedin.com/in/virunga-ecotours-863a221b1?utm_source=share&utm_campaign=share_via&utm_content=profile&utm_medium=ios_app', 'https://www.youtube.com/@virungaecotours8285', 'https://website-58827336.dmx.ewb.mybluehost.me/', 1, '2025-05-30 09:35:48', '2025-05-31 15:27:15');

-- --------------------------------------------------------

--
-- Table structure for table `about_gallery`
--

CREATE TABLE `about_gallery` (
  `gallery_id` int NOT NULL,
  `section_id` int NOT NULL,
  `image` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `alt_text` varchar(255) NOT NULL,
  `display_order` int NOT NULL DEFAULT '1',
  `is_active` tinyint(1) DEFAULT '1',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `about_gallery`
--

INSERT INTO `about_gallery` (`gallery_id`, `section_id`, `image`, `title`, `alt_text`, `display_order`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 1, 'gallery_1748707573_683b28f52e1e3.jpg', 'Tour Photography', 'Tour Photography', 1, 1, '2025-05-30 09:35:48', '2025-06-02 14:41:06'),
(2, 1, 'gallery_1748707622_683b2926a0cbf.jpg', 'Nature Walk Tour', 'Nature Walk Tour', 2, 1, '2025-05-30 09:35:48', '2025-05-31 16:07:02'),
(3, 1, 'gallery_1748710098_683b32d297b14.jpg', 'Mountain Sustainable Trek', 'Mountain Trekking', 3, 1, '2025-05-30 09:35:48', '2025-05-31 16:48:18'),
(4, 1, 'gallery_1748707718_683b2986ad033.jpg', 'Cultural Tour', 'Cultural Tour', 4, 1, '2025-05-30 09:35:48', '2025-05-31 16:08:38'),
(5, 1, 'gallery_1748707745_683b29a17a484.jpg', 'Cultural Exchange', 'Cultural Experience', 5, 1, '2025-05-30 09:35:48', '2025-05-31 16:09:05'),
(6, 1, 'gallery_1748707776_683b29c0d046b.jpg', 'Gorilla Trekking', 'Gorilla Trekking', 6, 1, '2025-05-30 09:35:48', '2025-05-31 16:09:36');

-- --------------------------------------------------------

--
-- Table structure for table `about_gallery_section`
--

CREATE TABLE `about_gallery_section` (
  `section_id` int NOT NULL,
  `section_title` varchar(255) NOT NULL DEFAULT 'Experience Snapshots',
  `section_intro` text NOT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `about_gallery_section`
--

INSERT INTO `about_gallery_section` (`section_id`, `section_title`, `section_intro`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'Experience Snapshots', 'Glimpses of the breathtaking landscapes, wildlife encounters, and cultural experiences that await you with EcoTours.', 1, '2025-05-30 09:35:48', '2025-05-30 09:35:48');

-- --------------------------------------------------------

--
-- Table structure for table `about_hero`
--

CREATE TABLE `about_hero` (
  `hero_id` int NOT NULL,
  `title` varchar(255) NOT NULL DEFAULT 'EcoTours',
  `subtitle` varchar(500) NOT NULL DEFAULT 'Discover Nature, Sustainably',
  `button_text` varchar(100) NOT NULL DEFAULT 'Explore Our Story',
  `button_link` varchar(255) NOT NULL DEFAULT '#our-story',
  `background_image` varchar(255) NOT NULL DEFAULT '1744328168_worship-background-d436nxs98r8bf26n.jpg',
  `is_active` tinyint(1) DEFAULT '1',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `about_hero`
--

INSERT INTO `about_hero` (`hero_id`, `title`, `subtitle`, `button_text`, `button_link`, `background_image`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'Ecotours', 'Discover Nature, Sustainably', 'Explore Our Story', '#our-story', '1748709866_683b31ea7d822.jpg', 1, '2025-05-30 09:35:48', '2025-05-31 16:44:26');

-- --------------------------------------------------------

--
-- Table structure for table `about_impact`
--

CREATE TABLE `about_impact` (
  `impact_id` int NOT NULL,
  `section_title` varchar(255) NOT NULL DEFAULT 'Our Impact',
  `section_intro` text NOT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `about_impact`
--

INSERT INTO `about_impact` (`impact_id`, `section_title`, `section_intro`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'Our Impact', 'Since our founding, we\'ve been measuring our positive influence on the planet and the communities we work with. Here\'s what we\'ve accomplished together:', 1, '2025-05-30 09:35:48', '2025-05-30 09:35:48');

-- --------------------------------------------------------

--
-- Table structure for table `about_impact_stats`
--

CREATE TABLE `about_impact_stats` (
  `stat_id` int NOT NULL,
  `impact_id` int NOT NULL,
  `icon_class` varchar(100) NOT NULL,
  `stat_count` int NOT NULL,
  `stat_title` varchar(255) NOT NULL,
  `display_order` int NOT NULL DEFAULT '1',
  `is_active` tinyint(1) DEFAULT '1',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `about_impact_stats`
--

INSERT INTO `about_impact_stats` (`stat_id`, `impact_id`, `icon_class`, `stat_count`, `stat_title`, `display_order`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 1, 'fas fa-users', 1500, 'Happy Travelers', 1, 1, '2025-05-30 09:35:48', '2025-05-30 09:35:48'),
(2, 1, 'fas fa-map-marker-alt', 175, 'Eco Destinations', 2, 1, '2025-05-30 09:35:48', '2025-05-30 09:35:48'),
(4, 1, 'fas fa-hands-helping', 48, 'Community Projects', 4, 1, '2025-05-30 09:35:48', '2025-05-30 09:35:48');

-- --------------------------------------------------------

--
-- Table structure for table `about_story`
--

CREATE TABLE `about_story` (
  `story_id` int NOT NULL,
  `section_title` varchar(255) NOT NULL DEFAULT 'Our Story',
  `paragraph_1` text NOT NULL,
  `paragraph_2` text NOT NULL,
  `paragraph_3` text NOT NULL,
  `button_text` varchar(100) NOT NULL DEFAULT 'Learn More',
  `button_link` varchar(255) NOT NULL DEFAULT '#',
  `story_image` varchar(255) NOT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `about_story`
--

INSERT INTO `about_story` (`story_id`, `section_title`, `paragraph_1`, `paragraph_2`, `paragraph_3`, `button_text`, `button_link`, `story_image`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'Our Story', 'Founded in 2017, Virunga Ecotours began with a simple vision: to share the beauty of our planet while protecting it for future generations. Our journey started with small guided hikes in local nature reserves, but our commitment to sustainable tourism and authentic experiences quickly gained recognition.', 'Virunga Ecotours is an eco-tourism company offering authentic, sustainable travel experiences across Rwanda, the Democratic Republic of Congo (DRC), and Uganda.', 'Our mission is to connect travelers with the remarkable biodiversity and natural beauty of East and Central Africa, while promoting conservation, cultural exchange, and the well-being of local communities.', 'Learn More', '#', '1748703248_683b1810536d4.jpg', 1, '2025-05-30 09:35:48', '2025-05-31 14:54:08');

-- --------------------------------------------------------

--
-- Table structure for table `about_team_members`
--

CREATE TABLE `about_team_members` (
  `member_id` int NOT NULL,
  `section_id` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `role` varchar(255) NOT NULL,
  `bio` text NOT NULL,
  `image` varchar(255) NOT NULL,
  `linkedin_url` varchar(255) DEFAULT NULL,
  `twitter_url` varchar(255) DEFAULT NULL,
  `instagram_url` varchar(255) DEFAULT NULL,
  `display_order` int NOT NULL DEFAULT '1',
  `is_active` tinyint(1) DEFAULT '1',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `about_team_members`
--

INSERT INTO `about_team_members` (`member_id`, `section_id`, `name`, `role`, `bio`, `image`, `linkedin_url`, `twitter_url`, `instagram_url`, `display_order`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 1, '...', 'Founder & CEO', 'With 5 years of experience in sustainable tourism, Emma founded EcoTours with a mission to connect people with nature while preserving delicate ecosystems.', '1744328168_worship-background-d436nxs98r8bf26n.jpg', 'https://www.linkedin.com/in/aime-claudien-mazimpaka-61801b356/', 'https://x.com/aimecol314', 'https://www.instagram.com/mazimpaka_aimecol/', 1, 1, '2025-05-30 09:35:48', '2025-05-31 15:05:35'),
(2, 1, 'Aime Claudien Mazimpaka', 'Tour Guide', 'With a background in environmental policy, Aime ensures all our operations meet the highest standards of sustainability and positive community impact.', '1748703572_683b1954ae38e.png', 'https://www.linkedin.com/in/aime-claudien-mazimpaka-61801b356/', 'https://x.com/aimecol314', 'https://www.instagram.com/mazimpaka_aimecol/', 2, 1, '2025-05-30 09:35:48', '2025-05-31 14:59:32'),
(3, 1, 'Fabrice Igiraneza', 'Tour Guide', 'With a background in environmental policy, Fabrice ensures all our operations meet the highest standards of sustainability and positive community impact.', '1748703721_683b19e9c718b.png', 'https://www.linkedin.com/in/aime-claudien-mazimpaka-61801b356/', 'https://x.com/aimecol314', 'https://www.instagram.com/mazimpaka_aimecol/', 3, 1, '2025-05-30 09:35:48', '2025-05-31 15:02:01');

-- --------------------------------------------------------

--
-- Table structure for table `about_team_section`
--

CREATE TABLE `about_team_section` (
  `section_id` int NOT NULL,
  `section_title` varchar(255) NOT NULL DEFAULT 'Meet the Team',
  `section_intro` text NOT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `about_team_section`
--

INSERT INTO `about_team_section` (`section_id`, `section_title`, `section_intro`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'Meet the Team', 'Our dedicated team of conservation enthusiasts, travel experts, and local guides work together to create unforgettable and responsible travel experiences.', 1, '2025-05-30 09:35:48', '2025-05-30 09:35:48');

-- --------------------------------------------------------

--
-- Table structure for table `about_values`
--

CREATE TABLE `about_values` (
  `value_id` int NOT NULL,
  `section_id` int NOT NULL,
  `icon_class` varchar(100) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `display_order` int NOT NULL DEFAULT '1',
  `is_active` tinyint(1) DEFAULT '1',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `about_values`
--

INSERT INTO `about_values` (`value_id`, `section_id`, `icon_class`, `title`, `description`, `display_order`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 1, 'fas fa-leaf', 'Environmental Responsibility', 'We minimize our ecological footprint through carbon offsetting, zero-waste policies, and supporting conservation projects in every destination we visit.', 1, 1, '2025-05-30 09:35:48', '2025-05-30 09:35:48'),
(2, 1, 'fas fa-handshake', 'Community Partnerships', 'We work directly with local communities, ensuring fair wages, supporting local businesses, and creating economic opportunities through tourism.', 2, 1, '2025-05-30 09:35:48', '2025-05-30 09:35:48'),
(3, 1, 'fas fa-book-open', 'Educational Experiences', 'Our tours go beyond sightseeing, offering deeper understanding of ecosystems, wildlife, and sustainable practices through expert guides.', 3, 1, '2025-05-30 09:35:48', '2025-05-30 09:35:48'),
(4, 1, 'fas fa-heart', 'Authentic Connections', 'We create opportunities for meaningful cultural exchanges and personal connections with nature that inspire lasting positive change.', 4, 1, '2025-05-30 09:35:48', '2025-05-30 09:35:48'),
(5, 1, 'fas fa-certificate', 'Certified Excellence', 'We maintain the highest standards with certifications from leading sustainable tourism organizations and consistent 5-star traveler reviews.', 5, 1, '2025-05-30 09:35:48', '2025-05-30 09:35:48'),
(6, 1, 'fas fa-globe-americas', 'Global Perspective', 'With operations in over 3 countries and a diverse international team, we bring a worldwide perspective to responsible tourism.', 6, 1, '2025-05-30 09:35:48', '2025-05-31 15:02:54');

-- --------------------------------------------------------

--
-- Table structure for table `about_values_section`
--

CREATE TABLE `about_values_section` (
  `section_id` int NOT NULL,
  `section_title` varchar(255) NOT NULL DEFAULT 'Why Choose Us',
  `section_intro` text NOT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `about_values_section`
--

INSERT INTO `about_values_section` (`section_id`, `section_title`, `section_intro`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'Why Choose Us', 'We believe in responsible travel that respects nature, supports local communities, and creates meaningful experiences. Here\'s what sets EcoTours apart:', 1, '2025-05-30 09:35:48', '2025-05-30 09:35:48');

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `admin_id` int NOT NULL,
  `first_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `profile_image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT 'costa-rica.jpg',
  `last_login` datetime DEFAULT NULL,
  `login_attempts` int DEFAULT '0',
  `account_status` enum('active','suspended','inactive') COLLATE utf8mb4_unicode_ci DEFAULT 'active',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`admin_id`, `first_name`, `last_name`, `email`, `password`, `phone`, `profile_image`, `last_login`, `login_attempts`, `account_status`, `created_at`, `updated_at`) VALUES
(1, 'Virunga', 'Ecotours', 'virungaecotours@gmail.com', '$2y$10$1eBZ7fS/lmyGWgIUCineN.CEY3JSK/vTCDX/UZqM0N6RfAGtRJ6GS', '+(250)784513435', '../images/profile/682347ba5168e_69816a90-0e27-4d22-ba16-125f23191e39.jpg', '2025-08-20 01:30:49', 0, 'active', '2025-04-01 10:32:53', '2025-08-20 07:30:49');

-- --------------------------------------------------------

--
-- Table structure for table `admin_activity_logs`
--

CREATE TABLE `admin_activity_logs` (
  `log_id` int NOT NULL,
  `admin_id` int NOT NULL,
  `action` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admin_activity_logs`
--

INSERT INTO `admin_activity_logs` (`log_id`, `admin_id`, `action`, `description`, `ip_address`, `created_at`) VALUES
(1, 1, 'login', 'Successful login', '::1', '2025-04-01 10:46:54'),
(2, 1, 'login', 'Successful login', '::1', '2025-04-01 10:47:57'),
(3, 1, 'login', 'Successful login', '::1', '2025-04-01 10:48:31'),
(4, 1, 'login', 'Successful login', '::1', '2025-04-03 16:11:32'),
(5, 1, 'login', 'Successful login', '::1', '2025-04-09 20:42:57'),
(6, 1, 'login', 'Successful login', '::1', '2025-04-09 20:59:15'),
(7, 1, 'login', 'Successful login', '::1', '2025-04-09 21:01:19'),
(8, 1, 'logout', 'User logged out', '::1', '2025-04-09 21:19:13'),
(9, 1, 'login', 'Successful login', '::1', '2025-04-09 21:19:33'),
(10, 1, 'login', 'Successful login', '::1', '2025-04-09 21:20:13'),
(11, 1, 'login', 'Successful login', '::1', '2025-04-09 21:21:03'),
(12, 1, 'logout', 'User logged out', '::1', '2025-04-09 21:22:16'),
(13, 1, 'login', 'Successful login', '::1', '2025-04-09 21:22:58'),
(14, 1, 'login', 'Successful login', '41.173.34.101', '2025-04-10 14:43:49'),
(15, 1, 'login', 'Successful login', '41.186.192.200', '2025-04-10 16:56:57'),
(16, 1, 'login', 'Successful login', '102.22.186.198', '2025-04-10 17:03:39'),
(17, 1, 'login', 'Successful login', '41.186.192.200', '2025-04-10 18:09:27'),
(18, 1, 'login', 'Successful login', '41.186.192.200', '2025-04-10 18:36:11'),
(19, 1, 'login', 'Successful login', '41.173.34.101', '2025-04-11 07:54:33'),
(20, 1, 'login', 'Successful login', '41.173.34.101', '2025-04-11 10:29:54'),
(21, 1, 'login', 'Successful login', '41.186.78.5', '2025-04-11 11:54:07'),
(22, 1, 'login', 'Successful login', '102.22.186.198', '2025-04-11 12:45:56'),
(23, 1, 'login', 'Successful login', '102.22.186.198', '2025-04-11 13:16:19'),
(24, 1, 'login', 'Successful login', '41.173.34.101', '2025-04-11 15:03:49'),
(25, 1, 'login', 'Successful login', '102.22.186.198', '2025-04-11 16:33:20'),
(26, 1, 'logout', 'User logged out', '102.22.186.198', '2025-04-11 16:41:09'),
(27, 1, 'login', 'Successful login', '102.22.186.198', '2025-04-11 16:41:23'),
(28, 1, 'login', 'Successful login', '41.173.34.101', '2025-04-11 17:37:12'),
(29, 1, 'login', 'Successful login', '41.173.34.101', '2025-04-11 18:16:09'),
(30, 1, 'login', 'Successful login', '102.22.186.198', '2025-04-11 19:30:21'),
(31, 1, 'login', 'Successful login', '102.22.186.198', '2025-04-12 08:52:33'),
(32, 1, 'login', 'Successful login', '41.173.34.101', '2025-04-12 09:34:01'),
(33, 1, 'login', 'Successful login', '41.173.34.101', '2025-04-12 10:50:28'),
(34, 1, 'login', 'Successful login', '41.173.34.101', '2025-04-12 11:47:43'),
(35, 1, 'login', 'Successful login', '41.186.192.200', '2025-04-12 12:00:45'),
(36, 1, 'login', 'Successful login', '41.173.34.101', '2025-04-12 13:27:21'),
(37, 1, 'login', 'Successful login', '196.12.144.250', '2025-04-13 12:48:33'),
(38, 1, 'login', 'Successful login', '196.12.144.250', '2025-04-13 17:30:45'),
(39, 1, 'login', 'Successful login', '196.12.144.250', '2025-04-13 17:41:25'),
(40, 1, 'login', 'Successful login', '196.12.144.250', '2025-04-13 18:30:18'),
(41, 1, 'login', 'Successful login', '102.22.186.198', '2025-04-14 07:51:15'),
(42, 1, 'login', 'Successful login', '196.12.144.250', '2025-04-14 18:50:31'),
(43, 1, 'logout', 'User logged out', '196.12.144.250', '2025-04-14 19:52:38'),
(44, 1, 'login', 'Successful login', '102.22.186.198', '2025-04-14 20:07:22'),
(45, 1, 'login', 'Successful login', '196.12.144.250', '2025-04-15 12:55:33'),
(46, 1, 'login', 'Successful login', '196.12.144.250', '2025-04-15 12:56:12'),
(47, 1, 'login', 'Successful login', '196.12.144.250', '2025-04-15 14:45:52'),
(48, 1, 'login', 'Successful login', '196.12.144.250', '2025-04-15 14:55:40'),
(49, 1, 'login', 'Successful login', '196.12.144.250', '2025-04-15 16:16:08'),
(50, 1, 'login', 'Successful login', '196.12.144.250', '2025-04-15 17:53:52'),
(51, 1, 'login', 'Successful login', '196.12.144.250', '2025-04-15 19:10:07'),
(52, 1, 'login', 'Successful login', '196.12.144.250', '2025-04-16 09:27:39'),
(53, 1, 'login', 'Successful login', '196.12.144.250', '2025-04-16 10:18:35'),
(54, 1, 'login', 'Successful login', '196.12.144.250', '2025-04-16 11:51:16'),
(55, 1, 'login', 'Successful login', '196.12.144.250', '2025-04-16 14:00:19'),
(56, 1, 'login', 'Successful login', '196.12.144.250', '2025-04-16 15:24:36'),
(57, 1, 'login', 'Successful login', '41.173.35.217', '2025-04-16 17:00:23'),
(58, 1, 'login', 'Successful login', '41.173.35.217', '2025-04-17 08:57:14'),
(59, 1, 'login', 'Successful login', '41.173.35.217', '2025-04-17 09:33:53'),
(60, 1, 'login', 'Successful login', '41.173.35.217', '2025-04-17 09:39:33'),
(61, 1, 'logout', 'User logged out', '41.173.35.217', '2025-04-17 09:55:27'),
(62, 1, 'login', 'Successful login', '41.173.35.217', '2025-04-17 09:55:30'),
(63, 1, 'login', 'Successful login', '41.173.35.217', '2025-04-17 15:26:20'),
(64, 1, 'login', 'Successful login', '41.173.35.217', '2025-04-18 09:31:49'),
(65, 1, 'login', 'Successful login', '41.173.35.217', '2025-04-18 11:10:10'),
(66, 1, 'login', 'Successful login', '41.173.35.217', '2025-04-18 15:40:50'),
(67, 1, 'login', 'Successful login', '41.173.35.217', '2025-04-18 16:23:43'),
(68, 1, 'login', 'Successful login', '41.173.35.217', '2025-04-18 19:01:54'),
(69, 1, 'login', 'Successful login', '41.186.194.52', '2025-04-19 06:58:00'),
(70, 1, 'login', 'Successful login', '41.173.35.217', '2025-04-19 13:13:27'),
(71, 1, 'login', 'Successful login', '41.173.35.217', '2025-04-19 13:35:16'),
(72, 1, 'login', 'Successful login', '41.173.35.41', '2025-04-20 07:02:49'),
(73, 1, 'login', 'Successful login', '41.173.34.4', '2025-04-20 08:42:43'),
(74, 1, 'login', 'Successful login', '41.173.34.4', '2025-04-20 08:57:19'),
(75, 1, 'login', 'Successful login', '41.173.34.4', '2025-04-20 09:50:33'),
(76, 1, 'login', 'Successful login', '41.173.34.4', '2025-04-20 10:53:55'),
(77, 1, 'login', 'Successful login', '41.173.34.33', '2025-04-20 14:42:12'),
(78, 1, 'login', 'Successful login', '41.186.192.200', '2025-04-20 15:03:31'),
(79, 1, 'login', 'Successful login', '41.173.34.33', '2025-04-20 16:37:39'),
(80, 1, 'login', 'Successful login', '41.173.34.33', '2025-04-20 16:57:10'),
(81, 1, 'login', 'Successful login', '41.173.34.33', '2025-04-20 17:36:57'),
(82, 1, 'login', 'Successful login', '41.173.34.33', '2025-04-22 09:34:33'),
(83, 1, 'login', 'Successful login', '41.173.34.33', '2025-04-22 10:09:59'),
(84, 1, 'login', 'Successful login', '41.173.34.33', '2025-04-22 11:04:59'),
(85, 1, 'login', 'Successful login', '41.173.34.33', '2025-04-22 13:04:14'),
(86, 1, 'login', 'Successful login', '41.173.34.33', '2025-04-22 15:30:42'),
(87, 1, 'login', 'Successful login', '41.173.35.86', '2025-04-23 14:29:30'),
(88, 1, 'login', 'Successful login', '41.173.35.86', '2025-04-23 14:29:55'),
(89, 1, 'login', 'Successful login', '41.173.35.86', '2025-04-23 16:42:32'),
(90, 1, 'login', 'Successful login', '41.173.35.86', '2025-04-23 18:12:00'),
(91, 1, 'login', 'Successful login', '41.173.35.86', '2025-04-25 17:21:27'),
(92, 1, 'login', 'Successful login', '41.173.35.86', '2025-04-26 13:42:25'),
(93, 1, 'login', 'Successful login', '41.173.35.86', '2025-04-26 15:39:44'),
(94, 1, 'login', 'Successful login', '41.173.35.86', '2025-04-26 16:48:01'),
(95, 1, 'login', 'Successful login', '41.173.35.86', '2025-04-26 19:09:12'),
(96, 1, 'login', 'Successful login', '197.157.186.58', '2025-04-27 07:26:49'),
(97, 1, 'login', 'Successful login', '41.173.35.86', '2025-04-27 12:06:13'),
(98, 1, 'login', 'Successful login', '41.173.35.86', '2025-04-27 13:59:21'),
(99, 1, 'login', 'Successful login', '41.173.35.86', '2025-04-27 15:12:59'),
(100, 1, 'login', 'Successful login', '41.173.35.86', '2025-04-28 11:06:55'),
(101, 1, 'login', 'Successful login', '41.173.35.86', '2025-04-28 11:15:01'),
(102, 1, 'login', 'Successful login', '41.173.35.86', '2025-04-28 12:11:35'),
(103, 1, 'login', 'Successful login', '41.173.35.86', '2025-04-28 14:01:24'),
(104, 1, 'login', 'Successful login', '41.173.35.86', '2025-04-28 14:25:36'),
(105, 1, 'login', 'Successful login', '41.173.35.86', '2025-04-28 14:42:28'),
(106, 1, 'login', 'Successful login', '41.173.35.86', '2025-04-28 14:44:15'),
(107, 1, 'login', 'Successful login', '41.173.35.86', '2025-04-28 14:52:57'),
(108, 1, 'login', 'Successful login', '41.173.35.86', '2025-04-28 15:32:32'),
(109, 1, 'login', 'Successful login', '41.173.35.86', '2025-04-28 16:03:00'),
(110, 1, 'login', 'Successful login', '41.173.35.86', '2025-04-28 16:11:46'),
(111, 1, 'login', 'Successful login', '41.173.35.86', '2025-04-28 16:32:41'),
(112, 1, 'login', 'Successful login', '41.186.194.52', '2025-04-28 19:51:47'),
(113, 1, 'login', 'Successful login', '41.186.194.52', '2025-04-28 19:56:19'),
(114, 1, 'login', 'Successful login', '41.186.194.52', '2025-04-28 21:13:51'),
(115, 1, 'login', 'Successful login', '197.157.187.15', '2025-04-30 06:58:21'),
(116, 1, 'login', 'Successful login', '197.157.187.15', '2025-04-30 07:10:23'),
(117, 1, 'login', 'Successful login', '41.173.35.86', '2025-04-30 10:27:08'),
(118, 1, 'login', 'Successful login', '41.173.252.140', '2025-04-30 12:22:48'),
(119, 1, 'login', 'Successful login', '41.173.252.140', '2025-04-30 12:23:19'),
(120, 1, 'login', 'Successful login', '41.216.119.152', '2025-05-02 06:44:52'),
(121, 1, 'login', 'Successful login', '41.216.119.152', '2025-05-02 08:02:32'),
(122, 1, 'login', 'Successful login', '41.216.119.152', '2025-05-02 19:23:32'),
(123, 1, 'login', 'Successful login', '41.216.119.152', '2025-05-02 19:35:16'),
(124, 1, 'login', 'Successful login', '41.216.119.152', '2025-05-02 19:40:36'),
(125, 1, 'login', 'Successful login', '41.216.119.152', '2025-05-02 19:58:46'),
(126, 1, 'login', 'Successful login', '41.216.119.152', '2025-05-02 20:50:08'),
(127, 1, 'login', 'Successful login', '41.216.119.152', '2025-05-02 20:51:42'),
(128, 1, 'login', 'Successful login', '41.216.119.152', '2025-05-03 07:19:04'),
(129, 1, 'login', 'Successful login', '41.186.78.52', '2025-05-03 08:47:45'),
(130, 1, 'login', 'Successful login', '41.216.119.152', '2025-05-03 08:49:44'),
(131, 1, 'login', 'Successful login', '41.216.119.152', '2025-05-03 09:29:30'),
(132, 1, 'login', 'Successful login', '41.173.35.86', '2025-05-04 08:42:01'),
(133, 1, 'login', 'Successful login', '41.173.35.86', '2025-05-04 08:58:14'),
(134, 1, 'login', 'Successful login', '41.173.35.86', '2025-05-04 09:24:33'),
(135, 1, 'login', 'Successful login', '41.173.35.86', '2025-05-04 11:12:35'),
(136, 1, 'login', 'Successful login', '41.216.119.152', '2025-05-04 11:18:14'),
(137, 1, 'login', 'Successful login', '41.173.35.86', '2025-05-04 12:21:31'),
(138, 1, 'login', 'Successful login', '41.173.35.86', '2025-05-04 13:03:47'),
(139, 1, 'login', 'Successful login', '41.173.35.86', '2025-05-04 13:25:57'),
(140, 1, 'login', 'Successful login', '41.173.35.86', '2025-05-04 14:55:43'),
(141, 1, 'login', 'Successful login', '41.173.35.86', '2025-05-04 15:49:37'),
(142, 1, 'login', 'Successful login', '41.173.35.86', '2025-05-04 17:27:12'),
(143, 1, 'login', 'Successful login', '41.173.35.86', '2025-05-04 18:40:39'),
(144, 1, 'login', 'Successful login', '197.243.1.51', '2025-05-06 06:27:27'),
(145, 1, 'login', 'Successful login', '41.173.34.115', '2025-05-06 11:39:08'),
(146, 1, 'login', 'Successful login', '41.173.34.115', '2025-05-06 13:13:02'),
(147, 1, 'login', 'Successful login', '41.173.34.115', '2025-05-06 14:04:55'),
(148, 1, 'login', 'Successful login', '41.173.34.115', '2025-05-06 14:10:22'),
(149, 1, 'login', 'Successful login', '41.173.34.115', '2025-05-06 15:54:25'),
(150, 1, 'login', 'Successful login', '41.173.34.115', '2025-05-06 17:18:57'),
(151, 1, 'login', 'Successful login', '41.173.34.115', '2025-05-06 18:38:33'),
(152, 1, 'login', 'Successful login', '41.173.34.115', '2025-05-06 19:03:49'),
(153, 1, 'login', 'Successful login', '41.173.34.115', '2025-05-06 19:04:00'),
(154, 1, 'login', 'Successful login', '41.173.34.115', '2025-05-06 19:19:13'),
(155, 1, 'login', 'Successful login', '41.173.34.115', '2025-05-06 20:53:39'),
(156, 1, 'login', 'Successful login', '41.216.119.152', '2025-05-06 21:08:02'),
(157, 1, 'login', 'Successful login', '41.173.34.115', '2025-05-07 08:04:31'),
(158, 1, 'login', 'Successful login', '41.173.34.115', '2025-05-07 11:33:15'),
(159, 1, 'login', 'Successful login', '41.173.34.115', '2025-05-07 12:27:58'),
(160, 1, 'login', 'Successful login', '197.243.1.51', '2025-05-07 14:12:18'),
(161, 1, 'login', 'Successful login', '41.216.114.154', '2025-05-07 19:16:49'),
(162, 1, 'login', 'Successful login', '41.173.34.115', '2025-05-08 06:45:10'),
(163, 1, 'login', 'Successful login', '41.173.34.115', '2025-05-08 06:49:58'),
(164, 1, 'login', 'Successful login', '41.173.34.115', '2025-05-08 07:44:12'),
(165, 1, 'login', 'Successful login', '41.173.34.115', '2025-05-08 13:01:09'),
(166, 1, 'login', 'Successful login', '41.173.34.115', '2025-05-08 15:31:56'),
(167, 1, 'login', 'Successful login', '41.173.34.115', '2025-05-08 16:53:48'),
(168, 1, 'login', 'Successful login', '41.216.114.154', '2025-05-08 17:31:36'),
(169, 1, 'login', 'Successful login', '41.216.114.154', '2025-05-08 17:32:10'),
(170, 1, 'login', 'Successful login', '41.173.34.115', '2025-05-09 08:28:47'),
(171, 1, 'login', 'Successful login', '41.173.34.115', '2025-05-09 08:34:33'),
(172, 1, 'login', 'Successful login', '41.173.34.115', '2025-05-09 10:55:23'),
(173, 1, 'login', 'Successful login', '41.173.34.115', '2025-05-09 10:58:47'),
(174, 1, 'login', 'Successful login', '41.173.34.115', '2025-05-09 11:05:06'),
(175, 1, 'login', 'Successful login', '41.173.34.115', '2025-05-09 11:29:35'),
(176, 1, 'login', 'Successful login', '41.173.34.115', '2025-05-09 12:36:11'),
(177, 1, 'login', 'Successful login', '197.157.186.178', '2025-05-09 14:38:41'),
(178, 1, 'login', 'Successful login', '41.173.34.115', '2025-05-09 16:56:52'),
(179, 1, 'login', 'Successful login', '41.173.34.115', '2025-05-10 13:43:10'),
(180, 1, 'login', 'Successful login', '197.157.185.184', '2025-05-10 13:55:13'),
(181, 1, 'login', 'Successful login', '41.173.34.115', '2025-05-10 15:24:06'),
(182, 1, 'login', 'Successful login', '41.216.112.224', '2025-05-10 17:28:42'),
(183, 1, 'login', 'Successful login', '41.216.112.224', '2025-05-10 17:50:22'),
(184, 1, 'login', 'Successful login', '41.173.34.115', '2025-05-11 08:54:44'),
(185, 1, 'login', 'Successful login', '105.178.104.232', '2025-05-11 09:19:04'),
(186, 1, 'login', 'Successful login', '41.173.34.115', '2025-05-11 09:19:46'),
(187, 1, 'login', 'Successful login', '197.157.184.80', '2025-05-11 11:43:07'),
(188, 1, 'login', 'Successful login', '105.178.104.2', '2025-05-11 11:46:24'),
(189, 1, 'login', 'Successful login', '41.173.34.115', '2025-05-11 15:18:16'),
(190, 1, 'login', 'Successful login', '41.173.34.115', '2025-05-11 15:47:29'),
(191, 1, 'login', 'Successful login', '41.186.78.242', '2025-05-12 05:37:00'),
(192, 1, 'login', 'Successful login', '41.173.34.115', '2025-05-12 10:23:00'),
(193, 1, 'login', 'Successful login', '197.157.187.227', '2025-05-12 12:21:45'),
(194, 1, 'login', 'Successful login', '41.173.34.115', '2025-05-12 14:01:32'),
(195, 1, 'login', 'Successful login', '196.12.144.18', '2025-05-13 11:54:09'),
(196, 1, 'login', 'Successful login', '196.12.144.18', '2025-05-13 12:45:06'),
(197, 1, 'login', 'Successful login', '196.12.144.18', '2025-05-13 12:46:43'),
(198, 1, 'login', 'Successful login', '196.12.144.18', '2025-05-13 14:46:22'),
(199, 1, 'login', 'Successful login', '196.12.144.18', '2025-05-13 17:23:42'),
(200, 1, 'login', 'Successful login', '196.12.144.18', '2025-05-13 18:25:57'),
(201, 1, 'login', 'Successful login', '196.12.144.18', '2025-05-14 09:16:10'),
(202, 1, 'login', 'Successful login', '41.173.34.99', '2025-05-14 11:01:17'),
(203, 1, 'login', 'Successful login', '41.173.34.99', '2025-05-14 13:28:04'),
(204, 1, 'login', 'Successful login', '41.173.34.99', '2025-05-14 13:45:11'),
(205, 1, 'login', 'Successful login', '41.173.34.99', '2025-05-14 15:58:00'),
(206, 1, 'login', 'Successful login', '41.173.34.99', '2025-05-14 17:18:48'),
(207, 1, 'login', 'Successful login', '41.173.34.99', '2025-05-14 18:11:01'),
(208, 1, 'login', 'Successful login', '41.173.34.99', '2025-05-14 18:38:08'),
(209, 1, 'login', 'Successful login', '41.173.34.99', '2025-05-14 18:40:02'),
(210, 1, 'login', 'Successful login', '41.173.34.99', '2025-05-15 12:55:06'),
(211, 1, 'login', 'Successful login', '41.173.34.99', '2025-05-15 15:18:58'),
(212, 1, 'login', 'Successful login', '41.173.34.99', '2025-05-16 12:55:23'),
(213, 1, 'login', 'Successful login', '197.243.1.51', '2025-05-20 06:15:16'),
(214, 1, 'login', 'Successful login', '41.173.33.102', '2025-05-20 12:35:40'),
(215, 1, 'login', 'Successful login', '41.173.34.19', '2025-05-21 08:35:53'),
(216, 1, 'login', 'Successful login', '41.173.34.19', '2025-05-21 09:42:43'),
(217, 1, 'login', 'Successful login', '41.173.34.19', '2025-05-21 10:45:39'),
(218, 1, 'login', 'Successful login', '41.173.35.58', '2025-05-29 12:54:39'),
(219, 1, 'login', 'Successful login', '41.173.35.58', '2025-05-29 15:36:23'),
(220, 1, 'login', 'Successful login', '41.173.34.48', '2025-05-29 16:11:45'),
(221, 1, 'login', 'Successful login', '41.173.34.48', '2025-05-29 17:05:55'),
(222, 1, 'login', 'Successful login', '41.186.192.200', '2025-05-30 09:59:23'),
(223, 1, 'login', 'Successful login', '41.186.192.200', '2025-05-30 09:59:37'),
(224, 1, 'login', 'Successful login', '41.186.137.78', '2025-05-31 04:17:07'),
(225, 1, 'login', 'Successful login', '41.186.137.78', '2025-05-31 05:10:25'),
(226, 1, 'login', 'Successful login', '105.178.104.196', '2025-05-31 09:28:52'),
(227, 1, 'login', 'Successful login', '41.173.34.217', '2025-05-31 14:19:31'),
(228, 1, 'login', 'Successful login', '41.173.34.217', '2025-05-31 14:41:40'),
(229, 1, 'login', 'Successful login', '41.173.34.217', '2025-05-31 16:08:30'),
(230, 1, 'login', 'Successful login', '41.173.34.217', '2025-05-31 16:42:04'),
(231, 1, 'login', 'Successful login', '41.173.34.217', '2025-06-01 12:47:13'),
(232, 1, 'login', 'Successful login', '41.173.34.217', '2025-06-01 14:34:47'),
(233, 1, 'login', 'Successful login', '41.173.34.217', '2025-06-01 15:15:32'),
(234, 1, 'login', 'Successful login', '41.173.34.217', '2025-06-02 13:57:55'),
(235, 1, 'login', 'Successful login', '41.173.34.217', '2025-06-02 15:44:04'),
(236, 1, 'login', 'Successful login', '41.173.34.217', '2025-06-02 16:19:02'),
(237, 1, 'login', 'Successful login', '41.173.35.200', '2025-06-04 10:55:25'),
(238, 1, 'login', 'Successful login', '41.173.34.208', '2025-06-04 12:34:10'),
(239, 1, 'login', 'Successful login', '41.173.35.44', '2025-06-04 13:07:51'),
(240, 1, 'login', 'Successful login', '41.173.35.44', '2025-06-04 13:23:27'),
(241, 1, 'login', 'Successful login', '41.173.35.44', '2025-06-04 14:10:39'),
(242, 1, 'login', 'Successful login', '41.173.35.44', '2025-06-04 14:12:17'),
(243, 1, 'login', 'Successful login', '41.173.35.44', '2025-06-04 15:55:20'),
(244, 1, 'login', 'Successful login', '41.173.35.44', '2025-06-04 16:00:50'),
(245, 1, 'login', 'Successful login', '41.173.35.44', '2025-06-04 16:57:47'),
(246, 1, 'login', 'Successful login', '41.173.35.44', '2025-06-04 18:13:25'),
(247, 1, 'login', 'Successful login', '41.173.35.44', '2025-06-04 18:20:19'),
(248, 1, 'login', 'Successful login', '41.173.35.44', '2025-06-04 18:22:10'),
(249, 1, 'login', 'Successful login', '41.173.35.44', '2025-06-04 18:23:37'),
(250, 1, 'login', 'Successful login', '41.173.35.44', '2025-06-05 07:52:46'),
(251, 1, 'login', 'Successful login', '41.173.35.44', '2025-06-05 09:03:17'),
(252, 1, 'login', 'Successful login', '41.173.35.44', '2025-06-05 15:13:20'),
(253, 1, 'login', 'Successful login', '41.173.33.131', '2025-06-08 11:24:28'),
(254, 1, 'login', 'Successful login', '41.173.33.131', '2025-06-08 15:01:53'),
(255, 1, 'login', 'Successful login', '41.173.33.131', '2025-06-08 15:14:19'),
(256, 1, 'login', 'Successful login', '41.173.33.131', '2025-06-08 15:55:08'),
(257, 1, 'login', 'Successful login', '41.173.33.131', '2025-06-09 14:10:17'),
(258, 1, 'login', 'Successful login', '41.173.33.131', '2025-06-09 16:06:26'),
(259, 1, 'login', 'Successful login', '41.173.33.131', '2025-06-09 17:32:23'),
(260, 1, 'login', 'Successful login', '41.173.33.131', '2025-06-09 17:38:36'),
(261, 1, 'login', 'Successful login', '41.173.33.131', '2025-06-09 18:44:53'),
(262, 1, 'login', 'Successful login', '41.173.33.131', '2025-06-10 15:55:11'),
(263, 1, 'login', 'Successful login', '41.173.33.131', '2025-06-10 17:18:38'),
(264, 1, 'login', 'Successful login', '41.173.33.131', '2025-06-10 17:49:08'),
(265, 1, 'login', 'Successful login', '41.173.33.131', '2025-06-10 19:47:48'),
(266, 1, 'login', 'Successful login', '41.173.33.131', '2025-06-11 12:43:01'),
(267, 1, 'login', 'Successful login', '41.173.33.131', '2025-06-11 12:44:41'),
(268, 1, 'login', 'Successful login', '41.173.33.131', '2025-06-11 13:24:59'),
(269, 1, 'login', 'Successful login', '41.173.33.131', '2025-06-11 16:55:01'),
(270, 1, 'login', 'Successful login', '41.173.33.131', '2025-06-11 18:49:07'),
(271, 1, 'login', 'Successful login', '41.173.33.131', '2025-06-12 10:59:24'),
(272, 1, 'login', 'Successful login', '41.173.33.131', '2025-06-12 12:45:32'),
(273, 1, 'login', 'Successful login', '41.173.33.131', '2025-06-12 13:12:46'),
(274, 1, 'login', 'Successful login', '41.173.33.131', '2025-06-12 14:18:22'),
(275, 1, 'login', 'Successful login', '41.173.33.131', '2025-06-12 17:21:20'),
(276, 1, 'login', 'Successful login', '41.173.33.131', '2025-06-12 18:09:34'),
(277, 1, 'login', 'Successful login', '41.186.139.41', '2025-06-12 22:14:21'),
(278, 1, 'login', 'Successful login', '41.173.33.131', '2025-06-13 08:12:06'),
(279, 1, 'login', 'Successful login', '41.173.33.131', '2025-06-13 09:13:13'),
(280, 1, 'login', 'Successful login', '41.186.112.37', '2025-06-14 16:07:05'),
(281, 1, 'login', 'Successful login', '41.173.35.188', '2025-06-15 14:08:44'),
(282, 1, 'login', 'Successful login', '41.173.35.188', '2025-06-15 14:39:14'),
(283, 1, 'login', 'Successful login', '41.173.35.188', '2025-06-15 14:45:25'),
(284, 1, 'login', 'Successful login', '41.173.35.188', '2025-06-15 15:59:56'),
(285, 1, 'logout', 'User logged out', '41.173.35.188', '2025-06-15 16:03:29'),
(286, 1, 'login', 'Successful login', '41.173.35.188', '2025-06-15 16:42:53'),
(287, 1, 'login', 'Successful login', '41.186.138.25', '2025-06-18 01:03:08'),
(288, 1, 'login', 'Successful login', '41.173.34.145', '2025-06-18 05:02:22'),
(289, 1, 'login', 'Successful login', '41.173.34.145', '2025-06-18 05:23:02'),
(290, 1, 'login', 'Successful login', '41.173.34.145', '2025-06-18 06:15:25'),
(291, 1, 'login', 'Successful login', '41.173.34.145', '2025-06-18 06:26:16'),
(292, 1, 'login', 'Successful login', '41.186.137.201', '2025-06-18 07:41:37'),
(293, 1, 'login', 'Successful login', '41.216.96.151', '2025-06-18 08:14:59'),
(294, 1, 'login', 'Successful login', '41.216.96.151', '2025-06-18 10:40:58'),
(295, 1, 'login', 'Successful login', '41.216.96.151', '2025-06-18 12:37:47'),
(296, 1, 'login', 'Successful login', '41.216.96.151', '2025-06-18 12:44:52'),
(297, 1, 'logout', 'User logged out', '41.216.96.151', '2025-06-18 13:50:38'),
(298, 1, 'login', 'Successful login', '41.216.96.151', '2025-06-18 17:02:55'),
(299, 1, 'logout', 'User logged out', '41.216.96.151', '2025-06-18 17:03:24'),
(300, 1, 'login', 'Successful login', '41.216.96.151', '2025-06-18 17:27:07'),
(301, 1, 'login', 'Successful login', '41.216.96.151', '2025-06-18 17:49:00'),
(302, 1, 'login', 'Successful login', '41.216.96.151', '2025-06-18 17:55:25'),
(303, 1, 'login', 'Successful login', '41.216.96.244', '2025-06-20 16:22:00'),
(304, 1, 'login', 'Successful login', '41.216.96.244', '2025-06-22 11:21:55'),
(305, 1, 'login', 'Successful login', '41.216.96.244', '2025-06-22 14:52:57'),
(306, 1, 'login', 'Successful login', '196.12.152.67', '2025-06-23 18:24:04'),
(307, 1, 'login', 'Successful login', '196.12.152.67', '2025-06-24 15:34:02'),
(308, 1, 'login', 'Successful login', '196.12.152.67', '2025-06-24 18:50:28'),
(309, 1, 'login', 'Successful login', '196.12.152.67', '2025-06-24 19:47:09'),
(310, 1, 'login', 'Successful login', '41.173.33.25', '2025-06-25 08:35:22'),
(311, 1, 'login', 'Successful login', '41.173.33.25', '2025-06-25 17:35:12'),
(312, 1, 'login', 'Successful login', '41.173.33.25', '2025-06-25 19:31:22'),
(313, 1, 'login', 'Successful login', '41.173.33.25', '2025-06-26 04:53:30'),
(314, 1, 'login', 'Successful login', '41.173.33.25', '2025-06-27 17:09:01'),
(315, 1, 'login', 'Successful login', '41.173.33.25', '2025-06-29 10:01:23'),
(316, 1, 'login', 'Successful login', '41.173.33.25', '2025-06-29 14:29:53'),
(317, 1, 'login', 'Successful login', '41.216.96.161', '2025-07-04 09:51:28'),
(318, 1, 'login', 'Successful login', '41.216.96.161', '2025-07-04 14:01:57'),
(319, 1, 'login', 'Successful login', '41.173.35.72', '2025-07-20 12:02:45'),
(320, 1, 'login', 'Successful login', '196.12.144.147', '2025-07-31 08:33:10'),
(321, 1, 'logout', 'User logged out', '196.12.144.147', '2025-07-31 09:23:20'),
(322, 1, 'login', 'Successful login', '196.12.144.147', '2025-07-31 09:23:26'),
(323, 1, 'login', 'Successful login', '41.186.136.220', '2025-07-31 11:16:18'),
(324, 1, 'login', 'Successful login', '41.186.136.220', '2025-07-31 14:11:29'),
(325, 1, 'login', 'Successful login', '41.186.136.220', '2025-07-31 15:01:35'),
(326, 1, 'login', 'Successful login', '41.186.136.220', '2025-07-31 17:59:15'),
(327, 1, 'login', 'Successful login', '41.186.134.251', '2025-08-15 16:09:45'),
(328, 1, 'login', 'Successful login', '196.12.152.55', '2025-08-20 07:30:49');

-- --------------------------------------------------------

--
-- Table structure for table `attraction_details`
--

CREATE TABLE `attraction_details` (
  `id` int NOT NULL,
  `attraction_id` int NOT NULL,
  `description` text NOT NULL,
  `location` varchar(255) NOT NULL,
  `activities` text NOT NULL,
  `external_link` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `attraction_details`
--

INSERT INTO `attraction_details` (`id`, `attraction_id`, `description`, `location`, `activities`, `external_link`, `created_at`, `updated_at`) VALUES
(1, 1, 'Volcanoes National Park, situated in northwestern Rwanda, is a haven for the endangered mountain gorillas. Established in 1925 as Africa\'s first national park, it covers 160 sq km of rainforest and encompasses five of the eight volcanoes in the Virunga Mountains. The park gained international fame through the work of primatologist Dian Fossey, whose conservation efforts were chronicled in the film \"Gorillas in the Mist.\" Today, it stands as a testament to successful conservation, with gorilla populations steadily increasing.', 'Northwestern Rwanda, bordering the Democratic Republic of Congo and Uganda', 'Mountain gorilla trekking,Golden monkey tracking,Volcano hikes Bisoke, Karisimbi, Muhabura, Gahinga, Sabyinyo,Dian Fossey tomb hike,Birdwatching,Nature and forest walks,Musanze caves tour,Cultural visits (e.g. Iby’Iwacu Cultural Village),Scenic visits to Twin Lakes Burera and Ruhondo,Community encounters and local experiences,Guided photography and filming tours', 'https://www.rwandatourism.com/destinations/volcanoes-national-park/', '2025-06-01 03:30:18', '2025-06-11 14:36:48'),
(2, 2, 'Virunga National Park, Africa\'s oldest national park and a UNESCO World Heritage site, spans over 7,800 square kilometers in the eastern Democratic Republic of Congo. Established in 1925, it\'s home to an extraordinary diversity of habitats, from active volcanoes and savannas to swamps, lava plains, and the snowfields of Rwenzori mountains. The park protects over 700 bird species, 200 mammal species, and harbors more endemic species than any other park in Africa, including one-third of the world\'s endangered mountain gorillas.', 'Eastern Democratic Republic of Congo, bordering Rwanda and Uganda', 'Mountain gorilla trekking,Chimpanzee habituation walks,Nyiragongo volcano hike (Note: currently closed as of 2024),Birdwatching,Nature walks and forest hikes,Scenic drives and photography,Cultural experiences with local communities', 'https://virunga.org/', '2025-06-01 03:30:18', '2025-06-11 14:55:54'),
(3, 3, 'Bwindi Impenetrable Forest, a UNESCO World Heritage site in southwestern Uganda, is one of Africa\'s most biologically diverse areas. This ancient rainforest covers 321 sq km and is home to nearly half of the world\'s remaining mountain gorillas. The forest\'s name \"Bwindi\" means \"dark place,\" reflecting its dense tree canopy and lush vegetation. Beyond gorillas, the forest harbors over 120 mammal species, 350 bird species, 202 butterfly species, and 1,000+ flowering plant species.', 'Southwestern Uganda, on the edge of the Albertine Rift', 'Gorilla trekking,Birdwatching,Nature walks,Cultural encounters with the Batwa,Forest hiking trails,Photography tours,Primate viewing,Community visits,Waterfall hikes,Plant and butterfly observation', 'https://www.ugandawildlife.org/explore-our-parks/parks-by-name-a-z/bwindi-impenetrable-national-park', '2025-06-01 03:30:18', '2025-06-11 15:05:56'),
(4, 4, 'Mgahinga National Park is a beautiful protected area in southwestern Uganda, part of the Virunga volcanic mountain range that stretches across three countries. Known for its dramatic volcanic peaks, dense montane forests, and rare wildlife, the park is home to endangered mountain gorillas and golden monkeys. With its rich natural and cultural heritage, Mgahinga offers visitors an unforgettable experience of adventure and wildlife in a stunning, peaceful setting.', 'Southwestern Uganda, on the edge of the Albertine Rift', 'Gorilla trekking,Golden monkey tracking,Bird watching,Nature walks and hiking,Cultural visits to local communities,Volcano climbing (e.g., Mount Mgahinga),Canoeing on Lake Mutanda (nearby)', '', '2025-06-11 17:19:38', '2025-06-11 17:19:38'),
(5, 5, 'Nyungwe National Park is a vast tropical rainforest in southwestern Rwanda, known for its rich biodiversity and breathtaking scenery. As one of Africa’s oldest montane rainforests, Nyungwe is home to over 1,000 plant species, 13 primate species—including chimpanzees and colobus monkeys—and hundreds of birds, many found nowhere else. With mist-covered hills, waterfalls, and one of Africa’s highest canopy walkways, Nyungwe offers a deeply immersive experience in nature. It is not only a vital refuge for wildlife, but also a place of cultural significance, where local communities have long lived in harmony with the forest.', 'Southwestern Rwanda', 'Canopy walk,Zipline adventure,Chimpanzee trekking,Birdwatching,Nature hikes and guided forest walks,Waterfall trail,Colobus monkey tracking,Community and cultural experiences,Tea plantation visits,Photography and scenic viewpoints', '', '2025-06-11 17:31:05', '2025-06-12 11:19:29'),
(6, 6, 'Kahuzi-Biega National Park is one of Africa’s most biologically rich and dramatic landscapes, nestled along the eastern edge of the Democratic Republic of Congo. Named after two extinct volcanoes—Mount Kahuzi and Mount Biega—the park spans a vast 6,000 square kilometers, stretching from the lush lowland rainforests near the Congo Basin to the mist-shrouded highlands of the Albertine Rift.\r\n\r\nEstablished in 1970 and inscribed as a UNESCO World Heritage Site in 1980, Kahuzi-Biega is globally significant for harboring one of the last remaining populations of the critically endangered eastern lowland gorilla, also known as the Grauer’s gorilla (Gorilla beringei graueri). This gentle giant, the largest of all gorilla subspecies, finds refuge in the park’s ancient forests, which also support a rich diversity of other primates, forest elephants, endemic birds, and unique plant life.\r\n\r\nThe park is not only a biological treasure, but also a cultural landscape. It is deeply interwoven with the traditions of local communities, particularly the indigenous Batwa people, who have lived in harmony with the forest for generations. Despite decades of political instability in the region, Kahuzi-Biega remains a beacon of hope for conservation in Central Africa, where science, community, and heritage intersect in the shadow of the Congo’s forgotten volcanoes.', 'Eastern part of the Democratic Republic of the Congo (DRC).', 'Gorilla trekking\r\nChimpanzee tracking,Guided nature walks,Bird watching,Visiting the museum,Scenic drives through the park,Exploring the forest trails,Photography of wildlife and landscapes', '', '2025-06-11 17:50:42', '2025-06-11 17:50:42'),
(7, 7, 'Akagera National Park, located in eastern Rwanda along the border with Tanzania, is a captivating blend of savannah, wetlands, and lakes, making it one of the country’s most diverse and scenic protected areas. Spanning approximately 1,200 square kilometers, Akagera offers visitors a remarkable opportunity to experience classic African wildlife and landscapes within Rwanda’s unique context.\r\n\r\nThe park’s ecosystem is characterized by rolling grasslands dotted with acacia trees, extensive papyrus swamps, and seven stunning lakes that are part of the upper Nile basin. This mosaic of habitats supports a rich variety of wildlife, including large herds of elephants, buffalo, giraffes, zebras, and multiple antelope species. Predators such as lions, leopards, and hyenas have been successfully reintroduced in recent years, restoring the park’s status as a prime safari destination.\r\n\r\nAkagera’s history as Rwanda’s only savannah national park contrasts with the more forested and mountainous parks in the country, offering a distinctly different wildlife experience. It serves as a vital refuge for endangered species and plays an important role in regional biodiversity conservation.\r\n\r\nVisitors to Akagera can enjoy game drives, boat safaris on the tranquil lakes, birdwatching—home to over 500 bird species—and guided walking tours, all set against the backdrop of spectacular landscapes. The park is also significant culturally, with local communities living around its borders and engaging in eco-tourism activities.\r\n\r\nOverall, Akagera National Park presents a thrilling glimpse into Rwanda’s natural heritage, where wide-open plains meet sparkling waters, and wildlife roams freely in one of East Africa’s most picturesque settings.', 'Eastern Rwanda', 'Game Drives (Wildlife Safaris),Boat Safaris on Lake Ihema,Bird Watching Tours,Guided Nature Walks,Night Game Drives,Fishing Trips,Visiting Local Communities and Cultural Experiences,Photography Safaris,Canoeing on the Lakes and Wetlands,Rhino Tracking Experiences', '', '2025-06-11 18:09:26', '2025-06-11 18:09:26'),
(8, 8, 'Queen Elizabeth National Park, located in western Uganda, is one of the country’s most celebrated and diverse wildlife reserves. Spanning approximately 1,978 square kilometers, the park is renowned for its rich biodiversity and stunning landscapes that range from savannah plains and dense forests to sparkling lakes and volcanic craters. It is home to an extraordinary variety of animals, including elephants, lions, leopards, hippos, crocodiles, and over 600 bird species, making it a premier destination for safari enthusiasts and bird watchers alike.\r\n\r\nThe park also holds significant cultural and historical importance, with nearby communities whose traditions and lifestyles have intertwined with the natural environment for centuries. Visitors to Queen Elizabeth National Park can enjoy thrilling game drives, boat cruises on the Kazinga Channel—a natural waterway teeming with wildlife—and guided nature walks. Its diverse habitats and scenic beauty, combined with abundant wildlife, offer an unforgettable safari experience that highlights the remarkable natural heritage of Uganda.', 'Western Uganda,', 'Game Drives,Boat Cruises on the Kazinga Channel,Chimpanzee Tracking in Kyambura Gorge,Nature Walks,Bird Watching,Cultural Tours,Hot Air Balloon Safaris,Lion Tracking,Fishing,Hiking in the Ishasha Sector,Visit to Local Communities,Night Game Drives', '', '2025-06-11 18:54:29', '2025-06-11 18:54:29');

-- --------------------------------------------------------

--
-- Table structure for table `attraction_gallery`
--

CREATE TABLE `attraction_gallery` (
  `id` int NOT NULL,
  `attraction_id` int NOT NULL,
  `image_url` varchar(255) NOT NULL,
  `caption` varchar(255) DEFAULT NULL,
  `display_order` int DEFAULT '0',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `attraction_gallery`
--

INSERT INTO `attraction_gallery` (`id`, `attraction_id`, `image_url`, `caption`, `display_order`, `created_at`) VALUES
(2, 1, '../../images/attractions/volcanoes/gallery2.jpg', 'Karisimbi Volcano summit view', 2, '2025-06-01 03:31:04'),
(3, 1, '../../images/attractions/volcanoes/gallery3.jpg', 'Golden monkeys in bamboo forest', 3, '2025-06-01 03:31:04'),
(4, 1, '../../images/attractions/volcanoes/gallery4.jpg', 'Trekking through the lush rainforest', 4, '2025-06-01 03:31:04'),
(5, 2, '../../images/attractions/virunga/gallery1.jpg', 'Nyiragongo volcano active lava lake', 1, '2025-06-01 03:31:04'),
(6, 2, '../../images/attractions/virunga/gallery2.jpg', 'Mountain gorilla silverback', 2, '2025-06-01 03:31:04'),
(7, 2, '../../images/attractions/virunga/gallery3.jpg', 'Savanna elephants near Lake Edward', 3, '2025-06-01 03:31:04'),
(8, 2, '../../images/attractions/virunga/gallery4.jpg', 'Rwenzori mountains snow-capped peaks', 4, '2025-06-01 03:31:04'),
(9, 1, '../../uploads/attractions/gallery/6849d344e4978.jpg', '', 1, '2025-06-11 19:04:36'),
(10, 1, '../../uploads/attractions/gallery/6849d3c5704ec.jpg', 'Golden Monkey', 1, '2025-06-11 19:06:45'),
(11, 1, '../../uploads/attractions/gallery/6849d4a908fce.jpg', 'Tradition dance', 1, '2025-06-11 19:10:33');

-- --------------------------------------------------------

--
-- Table structure for table `blog_categories`
--

CREATE TABLE `blog_categories` (
  `category_id` int NOT NULL,
  `category_slug` varchar(50) NOT NULL,
  `category_name` varchar(50) NOT NULL,
  `category_description` text,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `blog_categories`
--

INSERT INTO `blog_categories` (`category_id`, `category_slug`, `category_name`, `category_description`, `created_at`, `updated_at`) VALUES
(1, 'lifestyle', 'Lifestyle', NULL, '2025-04-30 06:54:27', '2025-04-30 06:54:27'),
(2, 'travel', 'Travel', NULL, '2025-04-30 06:54:27', '2025-04-30 06:54:27'),
(3, 'food', 'Food', NULL, '2025-04-30 06:54:27', '2025-04-30 06:54:27'),
(4, 'technology', 'Technology', NULL, '2025-04-30 06:54:27', '2025-04-30 06:54:27'),
(5, 'health', 'Health', NULL, '2025-04-30 06:54:27', '2025-04-30 06:54:27'),
(6, 'design', 'Design', NULL, '2025-04-30 06:54:27', '2025-04-30 06:54:27');

-- --------------------------------------------------------

--
-- Table structure for table `blog_comments`
--

CREATE TABLE `blog_comments` (
  `comment_id` int NOT NULL,
  `blog_id` int NOT NULL,
  `parent_comment_id` int DEFAULT NULL,
  `commenter_name` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `commenter_email` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `comment_text` text COLLATE utf8mb4_general_ci NOT NULL,
  `is_approved` tinyint(1) DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `blog_comments`
--

INSERT INTO `blog_comments` (`comment_id`, `blog_id`, `parent_comment_id`, `commenter_name`, `commenter_email`, `comment_text`, `is_approved`, `created_at`) VALUES
(5, 24, NULL, 'Jvspyv p', 'zoe.anderson@fastbizfunds.capital', '\r\nIf you’ve been in business 6+ months and deposit at least $10k/month, you may already pre-qualify for fast working capital. Start here: https://fastbizfunds.capital\r\n\r\n', 0, '2025-08-08 19:04:20'),
(6, 24, NULL, 'Q Bcnle H vydx', 'emily.brown@smallbizline.com', '\r\nNeed a business loan or line of credit? Our streamlined process gets you approved in under 30 seconds with flexible terms and next-day funding. Check your options now: https://smallbizline.com\r\n', 0, '2025-08-17 13:39:47');

-- --------------------------------------------------------

--
-- Table structure for table `blog_content_blocks`
--

CREATE TABLE `blog_content_blocks` (
  `block_id` int NOT NULL,
  `blog_id` int NOT NULL,
  `block_type` enum('text','image','quote','list') NOT NULL,
  `block_order` int NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `blog_content_blocks`
--

INSERT INTO `blog_content_blocks` (`block_id`, `blog_id`, `block_type`, `block_order`, `created_at`, `updated_at`) VALUES
(23, 14, 'text', 1, '2025-05-04 16:25:46', '2025-05-04 16:25:46'),
(29, 20, 'text', 1, '2025-05-13 14:50:39', '2025-05-13 14:50:39'),
(30, 20, 'image', 2, '2025-05-13 14:50:39', '2025-05-13 14:50:39'),
(31, 20, 'text', 3, '2025-05-13 14:50:39', '2025-05-13 14:50:39'),
(32, 20, 'image', 4, '2025-05-13 14:50:39', '2025-05-13 14:50:39'),
(33, 20, 'text', 5, '2025-05-13 14:50:39', '2025-05-13 14:50:39'),
(35, 22, 'text', 1, '2025-05-13 18:35:44', '2025-05-13 18:35:44'),
(36, 22, 'image', 2, '2025-05-13 18:35:44', '2025-05-13 18:35:44'),
(37, 22, 'text', 3, '2025-05-13 18:35:44', '2025-05-13 18:35:44'),
(38, 22, 'quote', 4, '2025-05-13 18:35:44', '2025-05-13 18:35:44'),
(39, 22, 'image', 5, '2025-05-13 18:35:44', '2025-05-13 18:35:44'),
(40, 22, 'text', 6, '2025-05-13 18:35:44', '2025-05-13 18:35:44'),
(41, 22, 'image', 7, '2025-05-13 18:35:44', '2025-05-13 18:35:44'),
(42, 22, 'text', 8, '2025-05-13 18:35:44', '2025-05-13 18:35:44'),
(43, 23, 'text', 1, '2025-05-14 15:38:30', '2025-05-14 15:38:30'),
(44, 23, 'image', 2, '2025-05-14 15:38:30', '2025-05-14 15:38:30'),
(45, 23, 'text', 3, '2025-05-14 15:38:30', '2025-05-14 15:38:30'),
(46, 23, 'image', 4, '2025-05-14 15:38:30', '2025-05-14 15:38:30'),
(47, 23, 'text', 5, '2025-05-14 15:38:30', '2025-05-14 15:38:30'),
(48, 23, 'image', 6, '2025-05-14 15:38:30', '2025-05-14 15:38:30'),
(49, 23, 'text', 7, '2025-05-14 15:38:30', '2025-05-14 15:38:30'),
(50, 23, 'image', 8, '2025-05-14 15:38:30', '2025-05-14 15:38:30'),
(51, 23, 'text', 9, '2025-05-14 15:38:30', '2025-05-14 15:38:30'),
(52, 24, 'text', 1, '2025-05-14 19:00:37', '2025-05-14 19:00:37'),
(53, 24, 'image', 2, '2025-05-14 19:00:37', '2025-05-14 19:00:37'),
(54, 24, 'text', 3, '2025-05-14 19:00:37', '2025-05-14 19:00:37'),
(55, 24, 'image', 4, '2025-05-14 19:00:37', '2025-05-14 19:00:37'),
(56, 24, 'text', 5, '2025-05-14 19:00:37', '2025-05-14 19:00:37'),
(57, 24, 'image', 6, '2025-05-14 19:00:37', '2025-05-14 19:00:37'),
(58, 24, 'text', 7, '2025-05-14 19:00:37', '2025-05-14 19:00:37'),
(59, 24, 'image', 8, '2025-05-14 19:00:37', '2025-05-14 19:00:37'),
(60, 24, 'text', 9, '2025-05-14 19:00:37', '2025-05-14 19:00:37'),
(61, 24, 'image', 10, '2025-05-14 19:00:37', '2025-05-14 19:00:37'),
(78, 27, 'image', 1, '2025-06-18 18:54:39', '2025-06-18 18:54:39'),
(79, 27, 'text', 2, '2025-06-18 18:54:39', '2025-06-18 18:54:39'),
(80, 27, 'text', 3, '2025-06-18 18:54:39', '2025-06-18 18:54:39'),
(81, 27, 'text', 4, '2025-06-18 18:54:39', '2025-06-18 18:54:39'),
(82, 27, 'image', 5, '2025-06-18 18:54:39', '2025-06-18 18:54:39'),
(83, 27, 'text', 6, '2025-06-18 18:54:39', '2025-06-18 18:54:39'),
(84, 27, 'text', 7, '2025-06-18 18:54:39', '2025-06-18 18:54:39'),
(85, 27, 'text', 8, '2025-06-18 18:54:39', '2025-06-18 18:54:39'),
(86, 27, 'image', 9, '2025-06-18 18:54:39', '2025-06-18 18:54:39'),
(87, 27, 'text', 10, '2025-06-18 18:54:39', '2025-06-18 18:54:39'),
(88, 27, 'text', 11, '2025-06-18 18:54:39', '2025-06-18 18:54:39'),
(89, 27, 'image', 12, '2025-06-18 18:54:39', '2025-06-18 18:54:39'),
(90, 27, 'text', 13, '2025-06-18 18:54:39', '2025-06-18 18:54:39'),
(91, 28, 'image', 1, '2025-07-31 18:56:40', '2025-07-31 18:56:40'),
(92, 28, 'text', 2, '2025-07-31 18:56:40', '2025-07-31 18:56:40'),
(93, 28, 'image', 3, '2025-07-31 18:56:40', '2025-07-31 18:56:40'),
(94, 28, 'text', 4, '2025-07-31 18:56:40', '2025-07-31 18:56:40'),
(95, 28, 'image', 5, '2025-07-31 18:56:40', '2025-07-31 18:56:40'),
(96, 28, 'text', 6, '2025-07-31 18:56:40', '2025-07-31 18:56:40'),
(97, 28, 'image', 7, '2025-07-31 18:56:40', '2025-07-31 18:56:40'),
(98, 28, 'text', 8, '2025-07-31 18:56:40', '2025-07-31 18:56:40'),
(99, 28, 'image', 9, '2025-07-31 18:56:40', '2025-07-31 18:56:40'),
(100, 28, 'text', 10, '2025-07-31 18:56:40', '2025-07-31 18:56:40'),
(101, 28, 'text', 11, '2025-07-31 18:56:40', '2025-07-31 18:56:40'),
(102, 28, 'image', 12, '2025-07-31 18:56:40', '2025-07-31 18:56:40'),
(103, 28, 'text', 13, '2025-07-31 18:56:40', '2025-07-31 18:56:40');

-- --------------------------------------------------------

--
-- Table structure for table `blog_gallery_images`
--

CREATE TABLE `blog_gallery_images` (
  `gallery_image_id` int NOT NULL,
  `blog_id` int NOT NULL,
  `image_path` varchar(255) NOT NULL,
  `image_order` int NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `blog_gallery_images`
--

INSERT INTO `blog_gallery_images` (`gallery_image_id`, `blog_id`, `image_path`, `image_order`, `created_at`) VALUES
(16, 14, '1746375946_Backpack.JPG', 0, '2025-05-04 16:25:46'),
(17, 14, '1746375946_Volcanoes.JPG', 1, '2025-05-04 16:25:46'),
(18, 14, '1746375946_Wheat farm.JPG', 2, '2025-05-04 16:25:46'),
(36, 20, '1747147839_IMG_0218.jpg', 0, '2025-05-13 14:50:39'),
(37, 20, '1747147839_WhatsApp Image 2025-05-13 at 15.56.06.jpeg', 1, '2025-05-13 14:50:39'),
(38, 20, '1747147839_WhatsApp Image 2025-05-13 at 15.56.06 (1).jpeg', 2, '2025-05-13 14:50:39'),
(39, 22, '1747161344_PHOTO-2025-04-27-18-04-41.jpg', 0, '2025-05-13 18:35:44'),
(40, 22, '1747161344_IMG_0218.jpg', 1, '2025-05-13 18:35:44'),
(41, 22, '1747161344_WhatsApp Image 2025-04-09 at 16.07.03_7cde5e59.jpg', 2, '2025-05-13 18:35:44'),
(42, 23, '1747237110_IMG_1314.jpg', 0, '2025-05-14 15:38:30'),
(43, 23, '1747237110_IMG_8564.png', 1, '2025-05-14 15:38:30'),
(44, 23, '1747237110_IMG_7740 (1).jpg', 2, '2025-05-14 15:38:30'),
(45, 24, '1747249237_WhatsApp Image 2025-05-14 at 8.21.41 PM.jpeg', 0, '2025-05-14 19:00:37'),
(46, 24, '1747249237_WhatsApp Image 2025-05-14 at 8.01.18 PM.jpeg', 1, '2025-05-14 19:00:37'),
(47, 24, '1747249237_WhatsApp Image 2025-05-14 at 8.03.44 PM.jpeg', 2, '2025-05-14 19:00:37'),
(60, 27, '1750272879_HO2A0379.jpg', 0, '2025-06-18 18:54:39'),
(61, 27, '1750272879_IMG_3012.jpg', 1, '2025-06-18 18:54:39'),
(62, 27, '1750272879_HO2A0881.jpg', 2, '2025-06-18 18:54:39'),
(63, 27, '1750272879_IMG_1498.jpg', 3, '2025-06-18 18:54:39'),
(64, 27, '1750272879_IMG_0790.jpg', 4, '2025-06-18 18:54:39'),
(65, 27, '1750272879_IMG_2410.jpg', 5, '2025-06-18 18:54:39'),
(66, 28, '1753988200_IMG-20250731-WA0015.jpg', 0, '2025-07-31 18:56:40'),
(67, 28, '1753988200_WhatsApp Image 2025-07-31 at 19.05.52_9775ccd7.jpg', 1, '2025-07-31 18:56:40'),
(68, 28, '1753988200_IMG-20250731-WA0029.jpg', 2, '2025-07-31 18:56:40'),
(69, 28, '1753988200_IMG-20250731-WA0026.jpg', 3, '2025-07-31 18:56:40'),
(70, 28, '1753988200_IMG-20250731-WA0023.jpg', 4, '2025-07-31 18:56:40'),
(71, 28, '1753988200_IMG-20250731-WA0020.jpg', 5, '2025-07-31 18:56:40');

-- --------------------------------------------------------

--
-- Table structure for table `blog_image_blocks`
--

CREATE TABLE `blog_image_blocks` (
  `image_block_id` int NOT NULL,
  `block_id` int NOT NULL,
  `image_path` varchar(255) NOT NULL,
  `caption` varchar(255) DEFAULT NULL,
  `alignment` enum('left','center','right','full') NOT NULL DEFAULT 'center'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `blog_image_blocks`
--

INSERT INTO `blog_image_blocks` (`image_block_id`, `block_id`, `image_path`, `caption`, `alignment`) VALUES
(5, 30, '1747147839_WhatsApp Image 2025-05-13 at 15.56.06.jpeg', 'Umuzabibu', 'left'),
(6, 32, '1747147839_WhatsApp Image 2025-05-13 at 15.56.06 (1).jpeg', 'Umuzabibu', 'left'),
(14, 44, '1747237110_IMG_0875.png', 'Tourism as a Village Economy', 'center'),
(15, 46, '1747237110_IMG_7461.webp', 'Toward an Inclusive Conservation Future', 'center'),
(16, 36, '1747161344_PHOTO-2025-04-27-19-10-58 (2).jpg', 'Rose, one of the cooperative’s founding members.', 'center'),
(17, 53, '1747249237_WhatsApp Image 2025-05-14 at 7.47.46 PM.jpeg', 'A Tradition of Exclusion, a Legacy of Wisdom', 'left'),
(18, 55, '1747249237_WhatsApp Image 2025-05-14 at 8.21.05 PM.jpeg', 'The Turning Tide: Education, Opportunity, and Vision', 'left'),
(19, 57, '1747249237_WhatsApp Image 2025-05-14 at 8.25.31 PM.jpeg', 'Where Culture and Conservation Intertwine', 'left'),
(20, 59, '1747249237_WhatsApp Image 2025-05-14 at 7.48.36 PM.jpeg', ' Conservation cannot succeed if it leaves half the population behind.', 'left'),
(21, 61, '1747249237_WhatsApp Image 2025-05-14 at 8.24.14 PM.jpeg', 'Deliberate gender sensitive planning', 'left'),
(33, 78, '1750272879_IMG_0012.jpg', 'Rwandan Volcanoes', 'left'),
(34, 82, '1750272879_IMG_0285.jpg', 'Volcanoes National Park', 'left'),
(35, 86, '1750272879_IMG_0569 (1).jpg', 'Trackers locate and follow each habituated family daily', 'left'),
(36, 89, '1750272879_IMG_1441.jpg', 'hectares are being added to create more space for the growing gorilla population', 'left'),
(37, 91, '1753988200_WhatsApp Image 2025-07-31 at 20.23.51_06f01dc6.jpg', 'World Ranger Day', 'left'),
(38, 93, '1753988200_IMG-20250731-WA0031.jpg', 'forests, wildlife, and entire ecosystems', 'left'),
(39, 95, '1753988200_IMG-20250731-WA0030.jpg', 'Volcanoes National Park', 'left'),
(40, 97, '1753988200_WhatsApp Image 2025-07-31 at 18.58.56_00866a55.jpg', 'gorillas', 'left'),
(41, 99, '1753988200_IMG-20250731-WA0018.jpg', 'Conservation in the Virunga Massif', 'left'),
(42, 102, '1753988200_IMG-20250731-WA0025.jpg', 'Communities see its benefits', 'left');

-- --------------------------------------------------------

--
-- Table structure for table `blog_list_blocks`
--

CREATE TABLE `blog_list_blocks` (
  `list_block_id` int NOT NULL,
  `block_id` int NOT NULL,
  `list_title` varchar(255) DEFAULT NULL,
  `list_type` enum('bullet','numbered','checklist') NOT NULL DEFAULT 'bullet'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `blog_list_items`
--

CREATE TABLE `blog_list_items` (
  `item_id` int NOT NULL,
  `list_block_id` int NOT NULL,
  `item_text` text NOT NULL,
  `item_order` int NOT NULL,
  `is_checked` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `blog_posts`
--

CREATE TABLE `blog_posts` (
  `blog_id` int NOT NULL,
  `title` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `author` varchar(100) NOT NULL,
  `read_minutes` int NOT NULL,
  `category_id` int NOT NULL,
  `cover_image` varchar(255) NOT NULL,
  `main_headline` varchar(255) NOT NULL,
  `introduction` text NOT NULL,
  `status` enum('draft','published','archived') NOT NULL DEFAULT 'draft',
  `views` int DEFAULT '0',
  `created_by` int NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `published_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `blog_posts`
--

INSERT INTO `blog_posts` (`blog_id`, `title`, `slug`, `author`, `read_minutes`, `category_id`, `cover_image`, `main_headline`, `introduction`, `status`, `views`, `created_by`, `created_at`, `updated_at`, `published_at`) VALUES
(14, 'Understanding Tourist Preferences in the Virunga Massif Region: A Multidimensional Perspective', 'understanding-tourist-preferences-in-the-virunga-massif-region-a-multidimensional-perspective-6817950ad5c2c', 'Virunga Ecotours', 1, 2, '1746375946_IMG_9383.JPG', 'Understanding Tourist Preferences in the Virunga Massif Region: A Multidimensional Perspective', 'The Virunga Massif Region encompassing protected areas across the Democratic Republic of Congo, Rwanda, and Uganda is renowned for its ecological significance, cultural diversity, and dramatic landscapes. As a growing hub for eco-tourism, it attracts a wide range of travelers whose interests span cultural, recreational, and educational dimensions. The following outlines key tourism preferences and activities that continue to shape travel behavior in the region.', 'published', 0, 1, '2025-05-04 16:25:46', '2025-05-04 16:25:46', NULL),
(20, 'A Visit to Handspun Hope “Umuzabibu Mwiza” in Musanze: Weaving Dignity and Empowerment with Virunga Ecotours', 'a-visit-to-handspun-hope-umuzabibu-mwiza-in-musanze-weaving-dignity-and-empowerment-with-virunga-ecotours-68235c3f4c779', 'Virunga Ecotours', 2, 2, '1747147839_WhatsApp Image 2025-05-13 at 16.01.50.jpeg', 'Umuzabibu Mwiza is a faith based, non profit organization dedicated to empowering some of Rwanda’s most vulnerable women widows, survivors of trauma, and those once excluded from opportunity. ', '<span style=\\\"color: rgb(58, 48, 38); font-family: Arial, sans-serif; background-color: rgb(246, 244, 240);\\\">Embark on a heartwarming journey with Virunga Ecotours to the soulful haven of Umuzabibu Mwiza also known as Handspun Hope in the scenic town of Musanze, Rwanda. More than a destination, this experience is a window into a story of healing, strength, and transformation, where tourism becomes a bridge between cultures and a catalyst for social change.</span>', 'published', 0, 1, '2025-05-13 14:50:39', '2025-05-13 14:50:39', NULL),
(22, 'How Virunga Ecotours and Mutima w’urugo cooperative are weaving a future of conservation and community empowerment.', 'how-virunga-ecotours-and-mutima-wurugo-cooperative-are-weaving-a-future-of-conservation-and-community-empowerment', 'Virunga Ecotours', 3, 1, '1747161344_PHOTO-2025-04-27-19-10-58 (3).jpg', 'Mutima w’urugo, a women’s weaving cooperative ', '<span style=\\\"font-size:14.0pt;line-height:107%;rnfont-family:&quot;Bookman Old Style&quot;,serif;mso-fareast-font-family:&quot;Times New Roman&quot;;rnmso-bidi-font-family:&quot;Times New Roman&quot;;mso-ansi-language:EN-US;mso-fareast-language:rnEN-US;mso-bidi-language:AR-SA\\\">In the tranquil, volcanic landscape surroundingrnVolcanoes National Park, a nature preserve for the majestic mountain gorillas, anrninspiring tale of empowerment and conservation is unfolding. At the heart ofrnthis transformative story is \\\"Mutima w’urugo,\\\" a women’s weavingrncooperative supported by Virunga Ecotours. This cooperative is not just arnbeacon of traditional craftsmanship but also a powerful force for community andrnenvironmental stewardship.</span>', 'published', 0, 1, '2025-05-13 18:35:44', '2025-05-14 18:46:02', NULL),
(23, 'Hands Behind the Journey: The Human Face of Tourism in the Virunga Massif', 'hands-behind-the-journey-the-human-face-of-tourism-in-the-virunga-massif', 'Virunga Ecotours', 1, 1, '1747237110_IMG_6672 (1).png', 'Guiding More Than the Way: The Role of Local Trekking Staff', '<div>In the towering highlands where Rwanda, Uganda, and the Democratic Republic of Congo converge, the Virunga Massif rises like a green fortress a haven for rare wildlife and a magnet for adventure seekers. Tourists often arrive seeking gorillas and panoramic landscapes, yet beneath the surface of these experiences lies a human story less often told. This is the story of the men and women who walk these trails daily, not as visitors, but as the quiet custodians of both the forest and the tourism industry that depends on it.</div><div><br></div>', 'published', 0, 1, '2025-05-14 15:38:30', '2025-05-14 18:41:34', NULL),
(24, 'Rising Together: Women’s Role in Conservation Around the Virunga Massif', 'rising-together-womens-role-in-conservation-around-the-virunga-massif-6824e855ce772', 'Virunga Ecotours', 3, 2, '1747249237_WhatsApp Image 2025-05-14 at 7.55.09 PM.jpeg', 'Virunga Massif a land famous for its towering volcanoes', '<div>In the early morning hours, the forest stirs awake. Mist floats over the ridges that connect Rwanda, Uganda, and the Democratic Republic of Congo. This is the Virunga Massif a land famous for its towering volcanoes, deep green valleys, and the endangered mountain gorillas that quietly move through its ancient woods.</div><div>Tourists travel from around the world for a glimpse of these majestic creatures. But few realize that another quiet transformation is taking place one not of animals, but of people. Of women.</div><div>Once confined to the margins of conservation efforts, women across the Virunga region are stepping forward, reshaping the way communities interact with nature. Their work is subtle but powerful. And their stories, once whispered, are now being heard.</div>', 'published', 0, 1, '2025-05-14 19:00:37', '2025-05-14 19:00:37', NULL),
(27, 'Volcanoes National Park: A Century of Conservation and Transformation', 'volcanoes-national-park-a-century-of-conservation-and-transformation-68530b6f8ca8c', 'Virunga Ecotours', 20, 2, '1750272879_368d3e52-a5bd-45d9-a7a6-aa2d1ff63816.jpg', 'From Colonial Preserve to Community Partnership: How Rwanda’s Premier Wildlife Sanctuary Redefined African Conservation', 'Amid the swirling mists of Rwanda’s Virunga volcanoes, where dense montane forests stretch toward the sky and the iconic mountain gorilla roams, a profound milestone is being marked: the 100th anniversary of Volcanoes National Park. One of Africa’s most storied protected areas, the park’s centenary commemorates a century of complex history of protection and exclusion, crisis and resilience, research and reinvention.', 'published', 0, 1, '2025-06-18 18:54:39', '2025-06-18 18:54:39', NULL),
(28, 'Honoring Nature’s Guardians: World Ranger Day and 100 Years of Protection in the Virunga Massif', 'honoring-natures-guardians-world-ranger-day-and-100-years-of-protection-in-the-virunga-massif-688bbc68d414e', 'Virunga Ecotours', 8, 1, '1753988200_WhatsApp Image 2025-07-31 at 19.03.58_31da8d51.jpg', 'A Day for the Brave: Why July 31st Matters More Than Ever', 'On July 31st, the world honors the quiet strength of wildlife rangers the individuals who walk unmarked paths, cross into danger zones, and rise before dawn to guard the most vulnerable life on Earth. World Ranger Day is not just a day of remembrance, but a call to recognition of courage, discipline, and the lifelong commitment to nature.\\r\\n\\r\\nIn 2025, this day carries deeper weight across the Virunga Massif, a volcanic chain straddling Rwanda, Uganda, and the Democratic Republic of Congo (DR Congo). It marks 100 years since the creation of both Volcanoes National Park and Virunga National Park, the first formal steps in protecting the mountain gorilla — a species that has come back from the edge of extinction thanks to the resolve of the very people we celebrate today.', 'published', 0, 1, '2025-07-31 18:56:40', '2025-07-31 18:56:40', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `blog_quote_blocks`
--

CREATE TABLE `blog_quote_blocks` (
  `quote_block_id` int NOT NULL,
  `block_id` int NOT NULL,
  `quote_text` text NOT NULL,
  `attribution` varchar(255) DEFAULT NULL,
  `style` enum('standard','pullquote','blockquote') NOT NULL DEFAULT 'standard'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `blog_quote_blocks`
--

INSERT INTO `blog_quote_blocks` (`quote_block_id`, `block_id`, `quote_text`, `attribution`, `style`) VALUES
(2, 38, '', '', 'standard');

-- --------------------------------------------------------

--
-- Table structure for table `blog_text_blocks`
--

CREATE TABLE `blog_text_blocks` (
  `text_block_id` int NOT NULL,
  `block_id` int NOT NULL,
  `section_title` varchar(255) DEFAULT NULL,
  `content` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `blog_text_blocks`
--

INSERT INTO `blog_text_blocks` (`text_block_id`, `block_id`, `section_title`, `content`) VALUES
(18, 23, 'Understanding Tourist Preferences in the Virunga Massif Region: A Multidimensional Perspective', '<div>The Virunga Massif Region—encompassing protected areas across the Democratic Republic of Congo, Rwanda, and Uganda—is renowned for its ecological significance, cultural diversity, and dramatic landscapes. As a growing hub for eco-tourism, it attracts a wide range of travelers whose interests span cultural, recreational, and educational dimensions. The following outlines key tourism preferences and activities that continue to shape travel behavior in the region.</div><div><br></div><div>1. Cultural Immersion and Local Heritage Engagement</div><div><br></div><div>Tourists are increasingly drawn to meaningful cultural experiences. In the Virunga Massif Region, this includes engaging with indigenous communities such as the Batwa and observing traditional ways of life. Cultural immersion often involves visiting heritage museums, attending local festivals, and participating in storytelling traditions or artisanal workshops. Many travelers seek to understand the region’s history, post-colonial transformations, and current social dynamics, making cultural tourism a significant component of regional travel.</div><div><br></div><div>2. Culinary Tourism and Gastronomic Exploration</div><div><br></div><div>Local cuisine is central to the travel experience. Tourists often enjoy sampling regional dishes such as isombe, nyama choma, matoke, and ugali, as well as participating in cooking classes and visiting open-air markets. Food becomes both a sensory and cultural entry point into understanding the identity and traditions of the region. Culinary tourism also supports local food economies and highlights sustainable agricultural practices.</div><div><br></div><div>3. Adventure and Nature-Based Activities</div><div><br></div><div>The region’s physical geography—characterized by volcanic mountains, tropical forests, and alpine ecosystems—offers numerous opportunities for adventure tourism. Gorilla trekking in Volcanoes, Virunga, or Mgahinga National Parks remains the most sought-after experience. Other popular activities include volcano hikes (e.g., Mount Nyiragongo), nature walks, birdwatching, canoeing, and landscape photography. These activities support conservation goals while meeting the growing global demand for responsible, outdoor experiences.</div><div><br></div><div>4. Craft Shopping and Cultural Souvenirs</div><div><br></div><div>Tourists often express interest in purchasing locally made products, especially those with cultural or artisanal value. Hand-woven baskets, banana-fiber art, pottery, and wood carvings are especially popular. Markets and cooperatives provide economic opportunities for local artisans, while also allowing visitors to take home tangible memories that reflect the region’s identity.</div><div><br></div><div>5. Wellness and Relaxation Tourism</div><div><br></div><div>In addition to high-energy eco-adventures, the Virunga region offers destinations conducive to rest and rejuvenation. Lake Kivu, for example, serves as a tranquil retreat with beach resorts, scenic boat tours, and spa facilities. This appeals to tourists seeking balance—combining nature exploration with wellness experiences in a serene environment.</div><div><br></div><div>6. Photography and Visual Documentation</div><div><br></div><div>With its rich biodiversity, diverse cultures, and awe-inspiring landscapes, the Virunga Massif is a paradise for photographers. Tourists often seek out iconic views—such as gorilla families in the mist, active volcanoes, or traditional ceremonies—to document and share. Visual storytelling plays a critical role in conservation awareness and promotes tourism through digital and social media platforms.</div><div><br></div><div>7. Architectural and Historical Exploration</div><div><br></div><div>Historical landmarks and architectural heritage also contribute to tourist interest. From colonial-era buildings in Goma to cultural sites in Musanze and Kisoro, visitors are intrigued by how architecture narrates the region’s socio-political past. Guided historical tours provide deeper insights into the legacy of conflict, resilience, and reconstruction in the area.</div><div><br></div><div>8. Performing Arts and Community-Based Entertainment</div><div><br></div><div>Music, dance, and theater are vital expressions of identity and resilience in the Virunga region. Tourists frequently attend live performances, community festivals, and music events that showcase traditional instruments, folk narratives, and contemporary creativity. This form of cultural participation allows for deeper emotional and social connection with host communities.</div><div><br></div><div>9. Social Interaction and Cultural Exchange</div><div><br></div><div>Modern travelers often value interpersonal connection as part of their experience. Whether through community-based tourism, homestays, or guided cultural walks, many seek direct interaction with local residents. These exchanges foster mutual respect, cultural understanding, and can challenge preconceived ideas about the region.</div><div><br></div><div>10. Educational and Conservation-Based Tourism</div><div><br></div><div>A significant number of tourists are motivated by a desire to learn and contribute. Educational programs—such as ranger-led conservation talks, biodiversity research visits, or language immersion—are popular, especially among students and professionals. These opportunities also raise awareness about environmental challenges and promote sustainable tourism ethics.</div><div><br></div><div>11. Accessibility and Infrastructure for Exploration</div><div><br></div><div>Ease of travel is an essential consideration. Tourists prefer regions with well-developed infrastructure, including reliable transport systems, multilingual guides, clear signage, and secure accommodations. The growing presence of eco-lodges, community tourism centers, and cross-border connectivity in the Virunga region enhances the travel experience while promoting regional integration.</div><div><br></div><div>12. Pursuit of Authentic and Transformative Experiences</div><div><br></div><div>Perhaps above all, travelers to the Virunga Massif seek authenticity. Unique and off-the-beaten-path activities—such as attending a local wedding, witnessing traditional ceremonies, or joining conservation patrols—create profound, personal experiences. These encounters often lead to emotional and intellectual transformation, aligning with the deeper motivations behind responsible travel.</div>'),
(29, 29, 'Umuzabibu Mwiza', '<span style=\\\"color: rgb(58, 48, 38); font-family: Arial, sans-serif; background-color: rgb(246, 244, 240);\\\">Umuzabibu Mwiza is a faith based, non profit organization dedicated to empowering some of Rwanda’s most vulnerable women widows, survivors of trauma, and those once excluded from opportunity. Through meaningful employment in traditional textile arts, alongside spiritual guidance and emotional support, the organization offers a path to dignity and self sufficiency for over 209 women.</span>'),
(30, 31, 'Extraordinary journey', '<div style=\\\"font-family: Arial, sans-serif;\\\">When you arrive at this welcoming center with Virunga Ecotours, you don’t just observe you step into the rhythm of a community rooted in resilience. Our experienced guides facilitate intimate, respectful engagement with the artisans themselves. You’ll meet the women whose hands transform raw Merino wool into exquisite works of art, and hear firsthand how this work has changed their lives.</div><div style=\\\"font-family: Arial, sans-serif;\\\"><br></div><div style=\\\"font-family: Arial, sans-serif;\\\">From the gentle washing of fleece to the hand carding, picking, and spinning, the process is entirely done by hand using sustainable and traditional methods. You’ll witness the alchemy of natural dyeing with local plants, transforming plain wool into vibrant hues, and observe the meticulous knitting and needle felting techniques that bring scarves, garments, and soft felt animals to life.</div><div style=\\\"font-family: Arial, sans-serif;\\\"><br></div><div style=\\\"font-family: Arial, sans-serif;\\\">But this tour goes far beyond education it is about empowerment through action. At the end of each visit, guests are invited into the on site artisan boutique, where the women’s creations are proudly displayed. With guidance from your Virunga Ecotours host, you’ll have the opportunity to purchase these handspun, handmade products, knowing that every item sold contributes directly to the artisan who made it.</div><div style=\\\"font-family: Arial, sans-serif;\\\"><br style=\\\"color: rgb(58, 48, 38); background-color: rgb(246, 244, 240);\\\"></div>'),
(31, 33, 'To Conclude', '<div style=\\\"font-family: Arial, sans-serif; color: rgb(58, 48, 38); background-color: rgb(246, 244, 240);\\\">Virunga Ecotours carefully curates this experience as part of its commitment to community-based, responsible tourism. By including Umuzabibu Mwiza in its itineraries, Virunga not only shares Rwanda’s rich culture and heritage with the world, but also generates sustainable income for the women artisans. Each tourist becomes a patron of hope, enabling women to feed their families, pay school fees, and invest in their futures.</div><div style=\\\"font-family: Arial, sans-serif; color: rgb(58, 48, 38); background-color: rgb(246, 244, 240);\\\"><br></div><div style=\\\"font-family: Arial, sans-serif; color: rgb(58, 48, 38); background-color: rgb(246, 244, 240);\\\">Transportation to and from Musanze is organized seamlessly by Virunga Ecotours, with options tailored to both private travelers and small group ecotours. Our guides provide cultural context, translation when needed, and ensure that each visit respects the integrity of the women’s workspace while fostering meaningful exchange.</div><div style=\\\"font-family: Arial, sans-serif; color: rgb(58, 48, 38); background-color: rgb(246, 244, 240);\\\"><br></div><div style=\\\"font-family: Arial, sans-serif; color: rgb(58, 48, 38); background-color: rgb(246, 244, 240);\\\">Join Virunga Ecotours on this extraordinary journey, where compassion meets craftsmanship, and every purchase becomes a gesture of solidarity. Umuzabibu Mwiza is not just a place to visit it is a story to become part of, a legacy of resilience spun into every thread.</div>'),
(42, 43, 'Successful trek into the Virunga forests', '<div>For every successful trek into the Virunga forests, there is a network of local support that makes the experience possible. Guides and porters many of whom come from neighboring communities are indispensable companions on these journeys. Their responsibilities go beyond navigating dense vegetation and managing slippery ascents. They are interpreters of the forest’s secrets, offering stories, ecological context, and insights that deepen visitors’ understanding of the region.</div><div><br></div><div>These roles are often lifelines for families. In rural areas where employment is limited, working in tourism provides not just wages, but stability. The income sustains households, pays school fees, covers healthcare costs, and supports farming activities. For many, it is a dignified profession, built not only on knowledge of the terrain but on a growing pride in local heritage and environmental stewardship.</div><div><br></div>'),
(43, 45, 'Tourism income goes far beyond the immediate workers', '<div>In the Virunga Massif, the reach of tourism income goes far beyond the immediate workers. When a guide earns a day’s wage, that money does not stay in one pocket it circulates through households, schools, health centers, and small businesses. In regions with minimal formal employment, tourism offers a rare and vital injection of capital.</div><div><br></div><div>This economic ripple effect reinforces the social value of conservation. When protecting the environment becomes synonymous with preserving livelihoods, local communities find renewed reason to invest in sustainable practices. Forests are no longer viewed solely as sources of extraction but as living assets crucial to survival and to identity.</div><div><br></div>'),
(44, 47, 'The Virunga region reminds us', '<div>What emerges from this quiet revolution in the Virunga Massif is a blueprint for inclusive conservation. The forests are not being protected by walls or patrols alone they are being safeguarded by people whose lives are intertwined with the land. Empowered by opportunity and supported by responsible tourism, these communities are demonstrating that ecological sustainability and economic resilience can grow hand in hand.</div><div><br></div><div>As global tourism continues to evolve, the story of the Virunga region reminds us that the most profound journeys are those that connect people not just places. The true success of conservation here lies not only in the survival of mountain gorillas or the preservation of landscapes, but in the recognition of those who walk beside us guiding, supporting, and reminding us that the path to sustainability is one we travel together.</div>'),
(45, 49, '', ''),
(46, 51, '', ''),
(47, 35, 'The Heart of the Home', '<p class=\\\"MsoNormal\\\" style=\\\"mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;rnline-height:normal\\\"><span style=\\\"font-size:14.0pt;font-family:&quot;Bookman Old Style&quot;,serif;rnmso-fareast-font-family:&quot;Times New Roman&quot;;mso-bidi-font-family:&quot;Times New Roman&quot;\\\">Mutimarnw’urugo, which translates to \\\"The Heart of the Home,\\\" embodies thernspirit of unity and resilience. This women-led cooperative, settled near thernvolcanoes, is dedicated to preserving Rwandan weaving traditions while drivingrnsustainable development. Through their intricate, handwoven artifacts, thesernartisans weave stories of their culture and the natural world around them,rnincluding the iconic mountain gorillas that attract global attention.<o:p></o:p></span></p>'),
(48, 37, 'Community-Based Tourism ', '<p class=\\\"MsoNormal\\\" style=\\\"mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;rnline-height:normal\\\"><span style=\\\"font-size:14.0pt;font-family:&quot;Bookman Old Style&quot;,serif;rnmso-fareast-font-family:&quot;Times New Roman&quot;;mso-bidi-font-family:&quot;Times New Roman&quot;\\\">VirungarnEcotours’ support includes providing access to markets, training in sustainablernpractices, and promoting their products through eco-tourism activities. Thisrnpartnership not only enhances the cooperative’s visibility but also empowersrnwomen by giving them a voice and a stake in their community’s future. As thesernwomen succeed, they inspire others and create a ripple effect of positivernchange throughout their villages.<o:p></o:p></span></p>rnrn<p class=\\\"MsoNormal\\\" style=\\\"mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;rnline-height:normal\\\"><span style=\\\"font-size:14.0pt;font-family:&quot;Bookman Old Style&quot;,serif;rnmso-fareast-font-family:&quot;Times New Roman&quot;;mso-bidi-font-family:&quot;Times New Roman&quot;\\\">Thernbenefits of community-based tourism extend into the heart of conservationrnefforts. By integrating local communities into their conservation strategy,rnVirunga Ecotours ensures that the protection of Volcanoes National Park is arnshared responsibility. The women of Mutima w’urugo, empowered by their newfoundrneconomic stability, become active participants in preserving their environment.<o:p></o:p></span></p>rnrn<p class=\\\"MsoNormal\\\" style=\\\"mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;rnline-height:normal\\\"><span style=\\\"font-size:14.0pt;font-family:&quot;Bookman Old Style&quot;,serif;rnmso-fareast-font-family:&quot;Times New Roman&quot;;mso-bidi-font-family:&quot;Times New Roman&quot;\\\">Therncooperative’s success reinforces the connection between a thriving communityrnand a healthy ecosystem. With a steady income and a strong investment in thernpark’s future, local residents are more motivated to engage in conservationrnactivities, such as anti-poaching patrols, habitat restoration, andrnenvironmental education. This communal investment in conservation helpsrnsafeguard the mountain gorillas and their habitat, ensuring that futurerngenerations will continue to experience the park’s natural wonders.<o:p></o:p></span></p>rnrn<span style=\\\"font-size:14.0pt;line-height:107%;font-family:&quot;Bookman Old Style&quot;,serif;rnmso-fareast-font-family:&quot;Times New Roman&quot;;mso-bidi-font-family:&quot;Times New Roman&quot;;rnmso-ansi-language:EN-US;mso-fareast-language:EN-US;mso-bidi-language:AR-SA\\\">Thernpartnership between Virunga Ecotours and Mutima w’urugo offers a compellingrnmodel for sustainable tourism. It illustrates how integrating local communitiesrninto conservation efforts not only benefits the environment but also fostersrneconomic and social development. By placing women at the center of thisrninitiative, Virunga Ecotours demonstrates that empowering individuals can leadrnto broader, systemic change.</span>'),
(49, 40, '', ''),
(50, 42, '', ''),
(51, 52, 'Women are rising with purpose and determination.', '<div>For generations, women living near the Virunga forests have played vital roles in their households caring for children, cultivating food, collecting water and firewood. Their lives were deeply entwined with the rhythms of nature, even as formal conservation efforts left them out.</div><blockquote>“It wasn’t that we didn’t know the forest,” says Beatrice, a farmer near Rwanda’s Volcanoes National Park. “We knew every tree, every season. But no one asked us what we knew.”</blockquote><div>Patriarchal norms and a lack of access to education kept women out of decision making spaces. Conservation jobs, park management, and even ecotourism roles were largely reserved for men. Yet, women’s knowledge passed down through stories, songs, and daily practice held the key to living sustainably with the land.</div><div>Now, after years of being overlooked, women are rising with purpose and determination.</div>'),
(52, 54, 'Women are no longer only caregivers they are guides', '<div>The change didn’t come all at once. It came with adult literacy classes, vocational programs, community workshops, and slowly shifting attitudes.</div><div>NGOs and local initiatives began offering training for women: guiding skills, conservation awareness, business development. With knowledge came confidence. And with confidence came leadership.</div><div>Today, women are no longer only caregivers they are guides, entrepreneurs, educators, and conservation advocates.</div><blockquote>“In the past, I never imagined working in tourism,” says Amina, who now leads visitors through cultural tours in Uganda. “But now I tell stories of my people and my land—and earn money doing it.”</blockquote><div>As more girls grow up seeing women in leadership roles, the idea that conservation is “men’s work” is quietly dissolving.</div>'),
(53, 56, 'We are weaving our future', '<div>Around Rwanda’s Volcanoes National Park, women’s cooperatives are transforming lives and the tourism experience. They create traditional crafts, host cultural dances, and run community guesthouses that offer tourists more than a place to sleep.</div><blockquote>“We are not just making baskets,” says Claudine, a cooperative leader. “We are weaving our future.”</blockquote><div>These businesses are more than income generators. They are hubs of solidarity, where women support one another through shared childcare, financial savings groups, and mutual mentoring. They embody the belief that conservation thrives when communities thrive alongside it.</div>'),
(54, 58, ' Micro loans are helping women build eco businesses.', '<div>Despite these successes, many women still face deep rooted challenges. Land ownership remains elusive. Access to credit is limited. Few hold decision making positions in government or conservation bodies. Cultural expectations still burden women with unpaid labor that limits their public engagement.</div><div>Yet every step forward chips away at these barriers.</div><div>Mentorship programs are now pairing younger women with experienced conservation leaders. Micro loans are helping women build eco businesses. Policy shifts are starting to recognize the importance of gender equity in environmental governance.</div><div>And perhaps most importantly, there is growing acknowledgment that conservation cannot succeed if it leaves half the population behind.</div>'),
(55, 60, 'When women are empowered, entire communities benefit', '<div>To move from inclusion to true empowerment, more is needed: sustained funding, fair policies, and deliberate gender sensitive planning. Mentorship programs, access to education, and spaces for women in leadership must be prioritized not just to check a box, but because the future of conservation depends on it.</div><div>When women are empowered, entire communities benefit. Conservation becomes not just protection, but participation.</div>'),
(77, 79, '', '<div>Over the past hundred years, the park has transformed from a colonial game preserve into a globally celebrated model for community-integrated conservation. Its evolution mirrors broader shifts in African environmental governance, moving from top-down control to participatory stewardship. As the world faces rising ecological pressures, the story of Volcanoes National Park offers crucial insights into how conservation can succeed when it is inclusive, adaptive, and locally rooted.</div>'),
(78, 80, '1925: A Beginning Marked by Exclusion', '<div>Volcanoes National Park was established in 1925 by Belgian authorities to protect the rapidly declining population of mountain gorillas in the Virunga Massif. Initially part of the transboundary Albert National Park, the reserve represented one of the first formal attempts to preserve African wildlife. Yet the conservation model of the era was deeply flawed.</div><div><br></div><div><div>Communities living within and around the forest were forcibly removed. Traditional subsistence practices gathering, hunting, grazing were criminalized overnight. Protected status for gorillas came at the expense of local livelihoods, generating a legacy of mistrust between conservation authorities and the people whose ancestral lands had been taken.</div></div><div><br></div><div><div>Although the park provided essential legal safeguards for biodiversity, its foundation was built on exclusion, creating social fault lines that would persist for decades.</div></div>'),
(79, 81, 'A Scientific Turning Point', '<div>In 1967, the arrival of American primatologist Dian Fossey initiated a new chapter in the park’s story. Her establishment of the Karisoke Research Center between Mount Karisimbi and Mount Bisoke became the launchpad for what remains the longest continuous study of wild gorillas in the world.</div><div><br></div><div>Through patient habituation and close observation, Fossey challenged prevailing myths and transformed global perceptions of gorillas from aggressive brutes to emotionally intelligent, socially complex animals. Her work ignited international awareness and support for gorilla conservation, while laying the foundations for Rwanda’s leadership in primate research.</div><div><br></div><div>Today, Karisoke continues to operate under the stewardship of the Dian Fossey Gorilla Fund, now staffed largely by Rwandan researchers and conservationists. The center remains a globally respected institution for field science, education, and conservation training.</div>'),
(80, 83, 'Crisis and Recovery: The 1994 Genocide Against the Tutsi', '<div>The 1994 genocide devastated every aspect of Rwandan society—including its conservation infrastructure. Volcanoes National Park was left unguarded; rangers fled, research ceased, and displaced populations entered the forest for survival. The future of both the park and the gorillas hung in uncertainty.</div><div><br></div><div>Yet despite the chaos, the gorilla population endured. Their survival during this period became emblematic of Rwanda’s resilience. In the years that followed, environmental recovery was woven into the nation’s broader post-genocide reconstruction. Conservation efforts were revived with urgency and clarity of purpose, and the park became a symbol of healing and national renewal.</div>'),
(81, 84, 'A Community-Centered Vision Emerges', '<div>The early 2000s brought a fundamental shift in strategy: from protection from people to protection with people. Rwanda’s government introduced a pioneering revenue-sharing model, directing a significant portion of tourism income to the park’s neighboring communities. Investments flowed into health clinics, schools, clean water systems, and cooperative enterprises.</div><div><br></div><div>This approach gave communities a direct stake in the success of conservation. The park, once seen as an obstacle to opportunity, became a platform for local development.</div><div><br></div><div>Gorilla trekking became the flagship of this new model. Managed with strict ecological oversight limiting group sizes, contact time, and frequency the program generates millions annually while maintaining the welfare of the gorillas and their habitat.</div><div><br></div><div>“People used to feel shut out,” says Immaculée Niyonshuti, a teacher in Kinigi whose school was funded through the revenue-sharing program. “Now, when we see tourists coming, we know it means education, health, jobs. We protect the gorillas because we protect our future.”</div>'),
(82, 85, 'Innovating Without Intrusion', '<div>Volcanoes National Park has embraced modern conservation tools without compromising the well-being of its wildlife. While some protected areas have relied on invasive tagging to monitor species, mountain gorillas in Rwanda are not tracked using GPS collars or telemetry devices. Instead, highly skilled trackers locate and follow each habituated family daily, collecting GPS waypoints and behavioral data using handheld tools. This system, rooted in decades of experience and deep ecological knowledge, allows for intimate yet respectful monitoring.</div><div><br></div><div>Additional technologies such as motion-triggered camera traps, drones for vegetation mapping, and satellite imagery enhance situational awareness without disturbing the animals. These tools have become indispensable for tracking forest health, detecting illegal activity, and informing adaptive management decisions.</div>'),
(83, 87, 'Expanding for the Next Generation', '<div>In one of the park’s most ambitious projects to date, Rwanda has launched a major expansion of Volcanoes National Park. An additional 10,000 hectares are being added to create more space for the growing gorilla population and to restore critical ecological corridors. This initiative is being implemented with full community participation and support, offering fair resettlement packages, alternative farmland, and new livelihood options.</div><div><br></div><div>As the climate crisis deepens, this expansion is also a buffer against ecological uncertainty. Higher temperatures and erratic rainfall are shifting vegetation zones and putting pressure on montane ecosystems. The park’s reforestation efforts now emphasize climate-resilient native species and cross-boundary connectivity strategies designed to protect biodiversity and sustain ecosystem services in the long term.</div>'),
(84, 88, 'Lessons for Global Conservation', '<div>Volcanoes National Park’s centennial legacy offers a compelling model for the future of conservation worldwide. Its successes have been shaped by five critical principles:</div><div><br></div><div>•<span style=\\\"white-space: pre;\\\">	</span>Government leadership with clear vision and long-term commitment<br>•<span style=\\\"white-space: pre;\\\">	</span>Community ownership supported by benefit-sharing and inclusive governance<br>•<span style=\\\"white-space: pre;\\\">	</span>Robust science that informs decision-making and fosters transparency<br>•<span style=\\\"white-space: pre;\\\">	</span>Sustainable financing through regulated ecotourism<br>•<span style=\\\"white-space: pre;\\\">	</span>Respect for cultural heritage and equitable land-use planning<ul><li></li></ul></div><div><br></div><div><div>Perhaps most importantly, the park shows that conservation is not a technical problem alone—it is a human endeavor. Policies, technologies, and science matter, but trust, inclusion, and local empowerment are what turn protected areas into living landscapes of hope.</div></div>'),
(85, 90, 'Into the Second Century', '<div>Today, more than 600 mountain gorillas inhabit the Greater Virunga Ecosystem, up from fewer than 300 in the 1980s. Their comeback is one of conservation’s most celebrated achievements. Yet Volcanoes National Park’s true legacy lies not only in the numbers, but in the relationships it has nurtured—between species, people, and place.</div><div><br></div><div>As the park enters its second century, it does so not as a relic of colonial preservation, but as a dynamic, forward-looking institution. One that proves conservation can be inclusive, that environmental protection and human dignity can go hand in hand, and that the path forward must be shaped not by fences, but by shared purpose.</div><div><br></div><div>This article was produced with support from the Rwanda Development Board and the Dian Fossey Gorilla Fund. The East African Herald’s environmental reporting is made possible by the African Conservation Journalism Initiative.</div>'),
(86, 92, 'What is World Ranger Day?', '<div>Founded in 2007 by the International Ranger Federation, World Ranger Day commemorates rangers who have lost their lives or been injured in the line of duty and celebrates those who continue to serve on the frontlines of conservation.</div><div><br></div><div>More than 1,000 rangers have died globally in the last ten years, many while defending forests, wildlife, and entire ecosystems from poaching, illegal mining, armed groups, and habitat degradation. For rangers, the risks are real and in places like the Virunga Massif, they are constant.</div><div><br></div><div>But rangers are more than security forces. They are:</div><div><ul><li><span style=\\\"white-space: pre;\\\">	</span>•<span style=\\\"white-space: pre;\\\">	</span>Storytellers of the forest</li><li><span style=\\\"white-space: pre;\\\">	</span>•<span style=\\\"white-space: pre;\\\">	</span>Mediators between communities and wildlife</li><li><span style=\\\"white-space: pre;\\\">	</span>•<span style=\\\"white-space: pre;\\\">	</span>Early responders to emergencies</li><li><span style=\\\"white-space: pre;\\\">	</span>•<span style=\\\"white-space: pre;\\\">	</span>Stewards of hope in the face of overwhelming odds</li></ul></div>'),
(87, 94, 'The Virunga Massif: A Shared Sanctuary for Gorillas and Guardians', '<div>Stretching across international borders, the Virunga Massif is home to over half of the world’s mountain gorillas. But this biodiversity stronghold is also one of the most geopolitically complex regions in Africa. Here, three nations share both responsibility and pride for its protection:</div><div><br></div><div>Rwanda – Volcanoes National Park</div><div><br></div><div>Established in 1925, Volcanoes National Park became the foundation for modern gorilla conservation. It was here that Dr. Dian Fossey began her work, living among gorillas, understanding their behavior, and launching a global movement that would change the fate of the species forever.</div><div><br></div><div>Today’s rangers, many of them born in surrounding communities, carry her torch. They track gorillas daily, remove snares, patrol for illegal activity, and guide tourists into the forests. Their work has helped Rwanda develop a successful conservation-tourism model, where wildlife protection directly supports livelihoods and national pride.</div><div><br></div><div>DR Congo – Virunga National Park</div><div><br></div><div>Few places embody the risks of ranger life more than Virunga, Africa’s oldest national park. Despite violent conflict, oil exploration threats, and militia activity, its rangers have stood firm. Over 200 have died in the past 20 years, often ambushed while patrolling remote sectors or defending gorilla families from danger.</div><div><br></div><div>Yet, these rangers are resilient. They oversee gorilla tracking, elephant protection, and collaborate with the Virunga Alliance, which integrates conservation with local development, from sustainable energy projects to education.</div><div><br></div><div>Uganda – Mgahinga Gorilla National Park</div><div><br></div><div>Uganda’s contribution to the Massif is Mgahinga, a small but significant park that connects with both Virunga and Volcanoes. Here, rangers lead anti-poaching patrols and work with local Batwa communities to bridge traditional knowledge with modern conservation.</div><div><br></div><div>With only one habituated gorilla group, Mgahinga emphasizes intimacy over scale. Its rangers ensure safety for wildlife and visitors, while also nurturing a sense of shared ownership among surrounding communities.</div>'),
(88, 96, 'Dian Fossey’s Legacy: A Voice That Still Echoes', '<div>Few names are more closely tied to the story of mountain gorillas than Dian Fossey. Her fight against poaching, habitat loss, and apathy continues to inspire new generations of conservationists and rangers alike.</div><div><br></div><div>From her Karisoke Research Center, Fossey observed gorilla families over many years, developing deep emotional and scientific understanding. Though her life ended in tragedy in 1985, her work became the cornerstone of protection strategies that still shape ranger operations today.</div><div><br></div><div>Her spirit lives on through:</div><div><ul><li><span style=\\\"white-space: normal;\\\"><span style=\\\"white-space:pre\\\">	</span>•<span style=\\\"white-space:pre\\\">	</span>The Dian Fossey Gorilla Fund, which trains trackers and researchers</span></li><li><span style=\\\"white-space: normal;\\\"><span style=\\\"white-space:pre\\\">	</span>•<span style=\\\"white-space:pre\\\">	</span>Ongoing work by Gorilla Doctors, who treat gorillas in all three countries</span></li><li><span style=\\\"white-space: normal;\\\"><span style=\\\"white-space:pre\\\">	</span>•<span style=\\\"white-space:pre\\\">	</span>Global collaboration led by institutions such as the International Gorilla Conservation Programme (IGCP) and the Greater Virunga Transboundary Collaboration (GVTC)</span></li></ul></div><div><br></div><div>Together, they ensure that rangers are not just defending wildlife they are part of an enduring legacy of care and scientific insight.</div>'),
(89, 98, 'The Role of Partnerships and the Future of Protection', '<div>Conservation in the Virunga Massif has succeeded because of collaboration. National park authorities — RDB (Rwanda), ICCN (DR Congo), and UWA (Uganda) work with international NGOs, veterinary teams, scientists, and tourism partners to ensure rangers are supported.</div><div><br></div><div>These partnerships provide:</div><div><span style=\\\"white-space: normal;\\\"><span style=\\\"white-space:pre\\\">	</span>•<span style=\\\"white-space:pre\\\">	</span>Better equipment and medical care</span></div><div><span style=\\\"white-space: normal;\\\"><span style=\\\"white-space:pre\\\">	</span>•<span style=\\\"white-space:pre\\\">	</span>Advanced training and technology</span></div><div><span style=\\\"white-space: normal;\\\"><span style=\\\"white-space:pre\\\">	</span>•<span style=\\\"white-space:pre\\\">	</span>Cross-border patrol systems and intelligence sharing</span></div><div><span style=\\\"white-space: normal;\\\"><span style=\\\"white-space:pre\\\">	</span>•<span style=\\\"white-space:pre\\\">	</span>Education programs that connect local youth to conservation careers</span></div><div><br></div><div>One shining example is the Greater Virunga Transboundary Collaboration, which promotes coordination across borders for wildlife monitoring, patrols, and even community development.</div>'),
(90, 100, 'Virunga Ecotours: Elevating Rangers Through Responsible Travel', '<div>At Virunga Ecotours, we believe that tourism can serve a deeper purpose not only by offering unforgettable experiences but by supporting the very people who protect what visitors come to see.</div><div><br></div><div>When travelers trek with rangers, they witness firsthand the complexity of their work the silent tracking, the patience, the quick decision-making, and the emotional connection to each gorilla group. Every visit becomes a contribution — to ranger salaries, equipment, and morale.</div><div><br></div><div>Our team works with ranger-led experiences that are built on respect, authenticity, and long-term benefit for both nature and people.</div>'),
(91, 101, 'A Century of Sacrifice, a Future of Possibility', '<div>As we mark 100 years of conservation in the Virunga Massif, we also reflect on the costs: lives lost, families affected, and the long nights spent in cold forest stations with only the sound of gorilla calls echoing nearby.</div><div><br></div><div>But through that sacrifice has come progress. Gorillas once counted in the hundreds are now increasing slowly. Communities once skeptical of conservation now see its benefits. And rangers, once under-resourced and under-recognized, are now honored as heroes in green.</div><div><br></div><div>This World Ranger Day, let us not only remember let us recommit. Support their work, share their stories, walk with them when you travel, and keep their mission alive through action.</div>'),
(92, 103, 'References & Further Reading', '<div><span style=\\\"white-space: normal;\\\"><span style=\\\"white-space:pre\\\">	</span>•<span style=\\\"white-space:pre\\\">	</span>International Ranger Federation: www.internationalrangers.org</span></div><div><span style=\\\"white-space: normal;\\\"><span style=\\\"white-space:pre\\\">	</span>•<span style=\\\"white-space:pre\\\">	</span>Thin Green Line Foundation: www.thingreenline.org.au</span></div><div><span style=\\\"white-space: normal;\\\"><span style=\\\"white-space:pre\\\">	</span>•<span style=\\\"white-space:pre\\\">	</span>Dian Fossey Gorilla Fund: www.gorillafund.org</span></div><div><span style=\\\"white-space: normal;\\\"><span style=\\\"white-space:pre\\\">	</span>•<span style=\\\"white-space:pre\\\">	</span>Greater Virunga Transboundary Collaboration: www.greatervirunga.org</span></div><div><span style=\\\"white-space: normal;\\\"><span style=\\\"white-space:pre\\\">	</span>•<span style=\\\"white-space:pre\\\">	</span>Rwanda Development Board: www.rdb.rw</span></div><div><span style=\\\"white-space: normal;\\\"><span style=\\\"white-space:pre\\\">	</span>•<span style=\\\"white-space:pre\\\">	</span>Uganda Wildlife Authority: www.ugandawildlife.org</span></div><div><span style=\\\"white-space: normal;\\\"><span style=\\\"white-space:pre\\\">	</span>•<span style=\\\"white-space:pre\\\">	</span>Institut Congolais pour la Conservation de la Nature: www.iccnrdc.org</span></div>');

-- --------------------------------------------------------

--
-- Table structure for table `build_submissions`
--

CREATE TABLE `build_submissions` (
  `id` int NOT NULL,
  `names` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `email` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `phone` varchar(20) COLLATE utf8mb4_general_ci NOT NULL,
  `referral_source` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `travelers_info` text COLLATE utf8mb4_general_ci,
  `trip_days` varchar(20) COLLATE utf8mb4_general_ci NOT NULL,
  `group_size` varchar(20) COLLATE utf8mb4_general_ci NOT NULL,
  `travel_date` date NOT NULL,
  `budget_notes` text COLLATE utf8mb4_general_ci,
  `newsletter` tinyint(1) DEFAULT '0',
  `weekly_emails` tinyint(1) DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `build_submissions`
--

INSERT INTO `build_submissions` (`id`, `names`, `email`, `phone`, `referral_source`, `travelers_info`, `trip_days`, `group_size`, `travel_date`, `budget_notes`, `newsletter`, `weekly_emails`, `created_at`) VALUES
(6, 'igiraneza test', 'fabrdaa@gmail.com', '0784444314', 'other', '123', '123', '12', '2025-05-30', 'qaz', 0, 0, '2025-05-20 06:11:12'),
(7, 'Mazimpaka Aime Claudien', 'virungaecotours@gmail.com', '0789375245', 'facebook', 'adcsdc', '3', '3', '2025-06-19', 'dasasfssf', 0, 0, '2025-06-04 14:30:03'),
(8, 'Jared cornell', 'thejaredisaac@gmail.com', '15712052450', 'google', '', '2', '1', '2026-08-01', 'Trying to keep it budget friendly. Transfer from Kigali to virunga if possible.', 0, 0, '2025-08-01 16:50:48');

-- --------------------------------------------------------

--
-- Table structure for table `community_admins`
--

CREATE TABLE `community_admins` (
  `id` int NOT NULL,
  `username` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `full_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `profile_image` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` enum('admin','super_admin') COLLATE utf8mb4_unicode_ci DEFAULT 'admin',
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `last_login` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `community_admins`
--

INSERT INTO `community_admins` (`id`, `username`, `password`, `email`, `full_name`, `profile_image`, `role`, `status`, `last_login`, `created_at`, `updated_at`) VALUES
(1, 'admin', '$2y$10$yvc80O9BF27F6uOrzKQBd.S4xvSOL.U6N8A5vN60HFUgazEulsGmW', 'virungaecotours@gmail.com', 'Community Admin', 'admin_685222d522fd8_Fabrice.png', 'super_admin', 'active', '2025-07-31 12:49:38', '2025-06-11 14:45:30', '2025-07-31 12:49:38'),
(2, 'manager', '$2y$10$DV2ARV1fgPnnE7gAylH.Y.XT1jYH6CwDy/CQa3/AtKHbJ4jIIkNge', 'manager@virungaecotours.com', 'Program Manager', '', 'admin', 'active', NULL, '2025-06-11 14:45:30', '2025-07-31 12:49:07');

-- --------------------------------------------------------

--
-- Table structure for table `community_categories`
--

CREATE TABLE `community_categories` (
  `id` int NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `icon` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `color` varchar(7) COLLATE utf8mb4_unicode_ci DEFAULT '#2a4858',
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci DEFAULT 'active',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `community_categories`
--

INSERT INTO `community_categories` (`id`, `name`, `description`, `icon`, `color`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Education', 'Education empowers communities with knowledge and skills to protect their environment. Through nature clubs, forest trips, and youth leadership programs, it fosters a strong connection to the land and inspires stewardship. Awareness campaigns on biodiversity and climate change engage communities, nurturing future leaders committed to conservation and sustainable living. This education builds resilience and ensures lasting care for natural resources and ecosystems.', 'fas fa-graduation-cap', '#4a90e2', 'active', '2025-06-11 14:45:30', '2025-06-14 15:11:52'),
(2, 'Health', 'Health programs improve community wellbeing by providing access to clean water, hygiene education, and basic healthcare services. Initiatives like rainwater harvesting, sanitation training, nutrition outreach, and menstrual health education empower individuals to live healthier lives. By addressing health needs alongside environmental care, these programs strengthen community resilience and support sustainable development, ensuring people and nature thrive together.', 'fas fa-heartbeat', '#d0021b', 'active', '2025-06-11 14:45:30', '2025-06-14 15:13:24'),
(3, 'Conservation', 'Conservation programs protect ecosystems and wildlife by restoring habitats, controlling soil erosion, and promoting coexistence between communities and nature. Activities like tree planting, reforestation, human-wildlife conflict resolution, and community monitoring help preserve biodiversity and adapt to climate change. These efforts empower local communities to safeguard their natural heritage, ensuring a balanced, healthy environment for future generations.', 'fas fa-leaf', '#2a4858', 'active', '2025-06-11 14:45:30', '2025-06-14 15:38:58'),
(4, 'Economic development', 'Economic development through sustainable livelihoods empowers families to earn income from eco-friendly activities like organic farming, beekeeping, eco-tourism, and handicrafts. These initiatives support communities near Volcanoes National Park, Rwanda, by promoting financial stability while protecting the environment. By fostering green enterprises, the program builds a resilient local economy that balances economic growth with conservation and sustainable resource use.', 'fas fa-chart-line', '#967259', 'active', '2025-06-11 14:45:30', '2025-06-14 15:38:27'),
(6, 'Empowerment', 'Empowerment programs strengthen women and vulnerable groups by providing training in sustainable agriculture, business skills, and financial literacy. Support through village savings groups, micro-finance, and leadership mentorship fosters economic independence and confidence. Special programs for widows and single mothers promote social inclusion and resilience. By empowering women, these initiatives build stronger families and healthier ecosystems, driving sustainable community development.', 'fas fa-female', '#f5a623', 'active', '2025-06-11 14:45:30', '2025-06-14 15:16:58');

-- --------------------------------------------------------

--
-- Table structure for table `community_messages`
--

CREATE TABLE `community_messages` (
  `id` int NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `program_interest` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `volunteer_interest` tinyint(1) DEFAULT '0',
  `donation_interest` tinyint(1) DEFAULT '0',
  `status` enum('new','read','replied','archived') COLLATE utf8mb4_unicode_ci DEFAULT 'new',
  `admin_notes` text COLLATE utf8mb4_unicode_ci,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `sent_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `replied_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `community_programs`
--

CREATE TABLE `community_programs` (
  `id` int NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `short_description` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` enum('rwanda','uganda','congo') COLLATE utf8mb4_unicode_ci NOT NULL,
  `category` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `location` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gallery` text COLLATE utf8mb4_unicode_ci COMMENT 'JSON array of image paths',
  `date_started` date DEFAULT NULL,
  `date_ended` date DEFAULT NULL,
  `status` enum('active','completed','planned','cancelled') COLLATE utf8mb4_unicode_ci DEFAULT 'active',
  `impact_summary` text COLLATE utf8mb4_unicode_ci,
  `beneficiaries` int DEFAULT '0',
  `budget` decimal(10,2) DEFAULT NULL,
  `featured` tinyint(1) DEFAULT '0',
  `meta_title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_description` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `community_programs`
--

INSERT INTO `community_programs` (`id`, `title`, `description`, `short_description`, `country`, `category`, `location`, `image`, `gallery`, `date_started`, `date_ended`, `status`, `impact_summary`, `beneficiaries`, `budget`, `featured`, `meta_title`, `meta_description`, `slug`, `created_at`, `updated_at`) VALUES
(3, 'Women Empowerment', 'Women are vital to building stronger families and healthier ecosystems. Our Women’s Empowerment & Inclusion program in Kisoro, Uganda focuses on equipping women with the skills, knowledge, and support necessary to thrive economically and contribute to sustainable development. Training in sustainable agriculture and business We provide hands-on training to women on sustainable farming methods and basic business management, helping them improve food security, increase incomes, and run environmentally friendly enterprises. Village saving groups and micro-finance We support the creation and strengthening of village saving groups, giving women access to micro-finance services that enable them to save, borrow, and invest in small businesses, fostering financial independence and community resilience. Girls’ education support and leadership mentorship Our program promotes girls’ education through scholarships and mentorship opportunities, cultivating young female leaders who will drive positive change in their communities and advocate for environmental conservation. Programs for widows and single mothers Recognizing their unique challenges, we offer targeted support to widows and single mothers, including skills development and income-generating activities that help them achieve stability and empowerment. Empowering women is fundamental to sustainable development and conservation in Kisoro. By supporting this program, you help build resilient families, promote gender equality, and protect the environment for future generations.', 'Empowering women in Kisoro, Uganda through sustainable farming, business training, savings groups, girls’ education, and support for single mothers building stronger families and healthier ecosystems.', 'uganda', 'Empowerment', 'Kisoro District, Uganda', '6852e24ca163c_1750262348.jpg', NULL, '2023-03-10', NULL, 'active', 'Our Women’s Empowerment & Inclusion program in Kisoro, Uganda transforms lives by equipping women with sustainable agriculture skills, financial literacy, and leadership opportunities that improve both livelihoods and environmental health. Women trained in sustainable farming and business management increase household food security and generate eco-friendly income, reducing pressure on natural resources. Village saving groups and micro-finance initiatives strengthen financial independence and foster community solidarity. Support for girls’ education and leadership mentorship nurtures confident young women who become future advocates for social and environmental progress. Programs targeting widows and single mothers enhance resilience by providing tailored skills and income-generating opportunities. Collectively, these efforts lead to stronger, more equitable families, enhanced economic stability, and improved stewardship of local ecosystems ensuring sustainable development and a healthier environment for the Kisoro community today and tomorrow.', 120, 15000.00, 1, 'Empowering Women in Kisoro, Uganda | Sustainable Agriculture & Leaderships', 'Support women in Kisoro, Uganda with sustainable agriculture training, village saving groups, girls’ education, and programs for widows and single mothers to build stronger families and protect ecosystems.', 'women-empowerment', '2025-06-11 14:45:30', '2025-06-18 17:11:20'),
(4, 'Environmental Health', 'The Environmental Health program is a community-driven initiative focused on improving public health by addressing environmental risks in rural and conservation-adjacent areas of Rwanda, Uganda, and DR Congo. It integrates clean water access, sanitation infrastructure, hygiene education, and eco-friendly household practices to reduce waterborne diseases and promote sustainable living. Through the installation of rainwater harvesting systems, eco-toilets, handwashing stations, and clean cooking technologies, the program empowers communities to create healthier living conditions while protecting natural resources. Local health ambassadors, schools, and women’s groups are engaged in behavior change campaigns that foster long-term hygiene habits and environmental stewardship.', 'Improving health and sustainability by promoting clean water, sanitation, waste management, and eco-friendly practices in Rwanda.', 'rwanda', 'Healthcare', 'Rwanda', '6852ec70541e7_1750264944.jpg', NULL, '2022-09-01', NULL, 'active', 'The Environmental Health program has significantly improved community well-being across Rwanda by enhancing access to clean water, sanitation, and waste management, while promoting eco-friendly practices and climate resilience. Through infrastructure installations, health education, and community-led initiatives, the program has reduced waterborne illnesses, empowered women and youth as health leaders, and fostered sustainable behaviors that protect both people and the environment.', 1500, 18000.00, 1, 'Clean Water & Health Access in Virunga Massif | Hygiene & Nutrition Education', 'Beyond sanitation, the program also tackles pollution by promoting waste segregation, recycling, composting, and reducing plastic use.', 'environmental-health', '2025-06-11 14:45:30', '2025-06-18 19:10:10'),
(5, 'Forest Restoration', 'Healthy forests and thriving wildlife are essential for ecological balance and community wellbeing. Our Forest Restoration & Wildlife Coexistence program in Congo focuses on restoring degraded forests, protecting wildlife habitats, and promoting peaceful coexistence between people and animals. Tree nurseries and reforestation drives We establish and maintain tree nurseries that supply seedlings for reforestation projects, restoring vital habitats and enhancing biodiversity across the landscape. Soil erosion control and climate adaptation Our program implements erosion control techniques and climate adaptation strategies that protect soil health, improve water retention, and increase ecosystem resilience. Human-wildlife conflict resolution We work closely with local communities to develop and apply strategies that reduce conflicts between people and wildlife, protecting both livelihoods and animal populations. Community monitoring of sensitive areas Community members are trained and equipped to monitor forests and wildlife habitats, ensuring early detection of threats and fostering local stewardship of natural resources. By restoring forests and encouraging wildlife coexistence, we build healthier ecosystems and resilient communities. Join us in protecting Congo’s invaluable natural heritage for generations to come.', 'In Congo, we support reforestation, climate resilience, and wildlife coexistence helping communities protect nature and live sustainably.', 'congo', 'Conservation', 'Rutshuru Territory, DRC', '6852e4f95891a_1750263033.jpg', NULL, '2023-05-20', NULL, 'active', 'Our Forest Restoration & Wildlife Coexistence program in the Virunga Massif of Congo restores degraded habitats and improves biodiversity through tree nurseries and reforestation efforts. Soil erosion control and climate adaptation measures increase landscape resilience to environmental changes. Conflict resolution initiatives reduce tensions between communities and wildlife, safeguarding both human livelihoods and animal populations. Community monitoring empowers local residents to protect sensitive areas and respond to threats proactively. These combined efforts lead to stronger ecosystems, sustainable livelihoods, and enhanced coexistence between people and nature in this critical region.', 227, 20000.00, 1, 'Forest Restoration & Wildlife Coexistence in Virunga Massif, Congo | Community Conservation', 'Support forest restoration, wildlife coexistence, and community-led conservation in Congo’s Virunga Massif through tree planting, erosion control, conflict resolution, and habitat monitoring programs.', 'forest-restoration', '2025-06-11 14:45:30', '2025-06-18 19:10:22'),
(7, 'Building Voices. Opening Doors. Empowering the Future with Virunga Ecotours', 'Across the Virunga region stretching from the lush slopes of Volcanoes National Park to the vibrant communities of Kisoro, Goma, and beyond, women are often the hidden backbone of tourism. They manage homestays, prepare meals, guide visitors, tell stories, carry luggage, and care for both guests and nature. But too often, they are excluded from decision-making, training, and ownership in the industry they help sustain.\r\n\r\nThe Academy seeks to change that.\r\n\r\nInspired by pioneers like Virunga Ecotours ours and adapted for the cultural and ecological richness of the Virunga Massif, this initiative is more than a training program. It is a platform for dialogue, learning, and transformation. Through women-only workshops, leadership forums, practical skills training, and storytelling exchanges, the Academy gives women a seat at the table and the tools to lead.\r\n\r\nIt also creates space for important conversations:\r\nWhat does it mean to be a woman in tourism?\r\nHow do we confront gender norms, cultural expectations, and economic barriers?\r\nHow do we raise the next generation of female leaders from the foothills of Mount Karisimbi to the shores of Lake Kivu?\r\n\r\nAt its heart, the Academy is about visibility and voice. When women are seen, heard, and supported, the ripple effect reaches far beyond the individual. Families become stronger. Communities become more resilient. And the entire tourism industry becomes more just, more inclusive, and more reflective of the diverse cultures it represents.\r\n\r\nThrough partnerships with local cooperatives, homestays, and conservation programs, Virunga Ecotours is committed to ensuring that women across Rwanda, Uganda, and the DRC are not just part of the tourism conversation they’re leading it.\r\n\r\nThis is more than an initiative.\r\nIt’s a movement.\r\n\r\nAnd we invite you to walk beside us.\r\n', 'At Virunga Ecotours, we believe that travel should not only move people across borders it should move hearts, change perspectives, and open up opportunities. That’s why we’re proud to champion the Academy for Women in Tourism a regional initiative dedicated to increasing women’s participation and leadership within the tourism sector.', 'rwanda', 'Education', 'Musanze', '688b67279e1f2_1753966375.jpg', NULL, '2025-07-31', NULL, 'active', '', 1000, NULL, 0, 'Building Voices. Opening Doors. Empowering the Future with Virunga Ecotours - Virunga Ecotours Community', 'At Virunga Ecotours, we believe that travel should not only move people across borders it should move hearts, change perspectives, and open up opportunities. That’s why we’re proud to champion the Academy for Women in Tourism a regional initiative dedicated to increasing women’s participation and leadership within the tourism sector.', 'building-voices-opening-doors-empowering-the-future-with-virunga-ecotours', '2025-07-31 12:52:55', '2025-07-31 12:52:55'),
(8, 'VIRUNGA ECOTOURS – EMPOWERING WOMEN THROUGH TOUR GUIDING', 'Women with a passion for guiding often face cultural constraints that make entering the profession difficult. Our program was designed to change that narrative offering aspiring female guides a chance to gain the knowledge, experience, and confidence needed to thrive in the field.\r\n\r\nThe training began with an intensive four-week theoretical course, covering essential topics such as guiding ethics, storytelling, hospitality, and destination knowledge. This was followed by a practical field trip and a mentored internship, where trainees worked alongside experienced tour guides and tour companies in real-world settings.\r\n\r\nSince the program began, 25 women have graduated each one carving out her own path in the industry and inspiring others to follow. Their success is proof that when women are given the opportunity, they rise and in doing so, they enrich the tourism experience for all.\r\n\r\nAt Virunga Ecotours, we’re proud to be part of this journey. Together, we’re helping to build a more inclusive and representative tourism landscape one woman at a time.\r\n', 'In 2024, Virunga Ecotours launched a groundbreaking Female Tour Guide Training and Internship Program in collaboration with Red Rocks Academy. This initiative was created to break down the social and economic barriers that have historically limited women’s participation in Uganda’s tourism industry.', 'rwanda', 'Education', 'musanze-rwanda', '688b6a42c112d_1753967170.jpg', '[\"688b6a42c13b1_1753967170_0.jpg\"]', '2025-07-31', NULL, 'active', '', 1000, NULL, 1, 'IRUNGA ECOTOURS – EMPOWERING WOMEN THROUGH TOUR GUIDING - Virunga Ecotours Community', 'In 2024, Virunga Ecotours launched a groundbreaking Female Tour Guide Training and Internship Program in collaboration with Red Rocks Academy. This initiative was created to break down the social and economic barriers that have historically limited women’s participation in Uganda’s tourism industry.', 'virunga-ecotours-empowering-women-through-tour-guiding', '2025-07-31 13:06:10', '2025-07-31 13:06:10'),
(9, 'TRAILS OF TOMORROW', 'Virunga Ecotours proudly presents Trails of Tomorrow, an innovative platform inviting visionary entrepreneurs and changemakers to pitch their groundbreaking tourism ideas. Whether you envision eco-friendly adventures, community-led projects, or tech-driven travel solutions, this is your opportunity to bring your concept to life.\r\n\r\nAs part of our Product Showcase, Trails of Tomorrow offers mentorship, resources, and collaboration with Virunga Ecotours to transform your idea into a real market offering. Together, we aim to create next-generation tourism experiences that celebrate the beauty and culture of Virunga Massif while fostering sustainable development.\r\n', 'Virunga Ecotours Launches Trails of Tomorrow — Shaping the Future of Tourism', 'rwanda', 'Empowerment', 'musanze-rwanda', '688b6bdc19cbe_1753967580.jpg', '[\"688b6bdc19dd5_1753967580_0.jpg\"]', '2025-07-31', NULL, 'active', 'Step forward, share your vision, and help us carve new paths for the future of travel.', 10000, NULL, 1, 'TRAILS OF TOMORROW - Virunga Ecotours Community', 'Virunga Ecotours Launches Trails of Tomorrow — Shaping the Future of Tourism', 'trails-of-tomorrow', '2025-07-31 13:13:00', '2025-07-31 13:13:00');

-- --------------------------------------------------------

--
-- Table structure for table `community_team`
--

CREATE TABLE `community_team` (
  `id` int NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `bio` text COLLATE utf8mb4_unicode_ci,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `facebook` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `twitter` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `linkedin` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `instagram` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_position` int DEFAULT '0',
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci DEFAULT 'active',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `community_team`
--

INSERT INTO `community_team` (`id`, `name`, `title`, `bio`, `image`, `email`, `phone`, `facebook`, `twitter`, `linkedin`, `instagram`, `order_position`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Sarah Mukamana', 'Community Programs Director', 'Sarah leads our community development initiatives across the Virunga region. With over 10 years of experience in community development and conservation, she ensures our programs create lasting positive impact.', NULL, 'sarah@virungaecotours.com', NULL, 'https://facebook.com/sarah.mukamana', 'https://twitter.com/sarahmukamana', 'https://linkedin.com/in/sarah-mukamana', NULL, 1, 'active', '2025-06-11 14:45:30', '2025-06-11 14:45:30'),
(2, 'Dr. James Mugisha', 'Health Programs Coordinator', 'Dr. Mugisha oversees all health-related community programs. As a qualified medical doctor with extensive experience in rural healthcare, he ensures our health initiatives meet the highest standards.', NULL, 'james@virungaecotours.com', NULL, 'https://facebook.com/james.mugisha', '', 'https://linkedin.com/in/james-mugisha', NULL, 2, 'active', '2025-06-11 14:45:30', '2025-06-11 14:45:30'),
(3, 'Agnes Nyiramana', 'Women\'s Empowerment Specialist', 'Agnes focuses on women\'s empowerment and economic development programs. Her background in microfinance and cooperative development helps women in our communities achieve economic independence.', NULL, 'agnes@virungaecotours.com', NULL, 'https://facebook.com/agnes.nyiramana', 'https://twitter.com/agnesnyiramana', 'https://linkedin.com/in/agnes-nyiramana', NULL, 3, 'active', '2025-06-11 14:45:30', '2025-06-11 14:45:30');

-- --------------------------------------------------------

--
-- Table structure for table `community_testimonials`
--

CREATE TABLE `community_testimonials` (
  `id` int NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `organization` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rating` tinyint(1) DEFAULT '5',
  `location` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `program_id` int DEFAULT NULL,
  `featured` tinyint(1) DEFAULT '0',
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci DEFAULT 'active',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ;

--
-- Dumping data for table `community_testimonials`
--

INSERT INTO `community_testimonials` (`id`, `name`, `role`, `organization`, `message`, `image`, `rating`, `location`, `program_id`, `featured`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Marie Uwimana', 'Community Leader', 'Musanze Women\'s Group', 'The gorilla conservation program has transformed our community\'s understanding of wildlife protection. Our children now see gorillas as treasures to protect, not threats to fear.', '0', 5, 'Musanze, Rwanda', NULL, 1, 'active', '2025-06-11 14:45:30', '2025-06-18 02:52:29'),
(2, 'Dr. Jean Baptiste', 'Health Coordinator', 'North Kivu Health District', 'The community health clinic initiative has been a lifesaver for our remote communities. We\'ve seen dramatic improvements in maternal and child health outcomes.', NULL, 5, 'Goma, DRC', NULL, 1, 'active', '2025-06-11 14:45:30', '2025-06-11 14:45:30'),
(3, 'Grace Nakato', 'Cooperative Member', 'Kisoro Women\'s Handicraft Cooperative', 'Through the women\'s cooperative program, I\'ve been able to start my own business and send my children to school. This program has given us hope and dignity.', NULL, 5, 'Kisoro, Uganda', 3, 1, 'active', '2025-06-11 14:45:30', '2025-06-11 14:45:30'),
(4, 'Emmanuel Nzeyimana', 'Farmer', 'Rutshuru Farmers Association', 'The sustainable agriculture training has doubled my harvest. I can now feed my family and sell surplus crops at the market. Thank you for teaching us these new methods.', NULL, 5, 'Rutshuru, DRC', 5, 0, 'active', '2025-06-11 14:45:30', '2025-06-11 14:45:30');

-- --------------------------------------------------------

--
-- Table structure for table `contact_submissions`
--

CREATE TABLE `contact_submissions` (
  `id` int NOT NULL,
  `first_name` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `last_name` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `email` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `phone` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `subject` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `message` text COLLATE utf8mb4_general_ci NOT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `submission_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `is_read` tinyint(1) DEFAULT '0',
  `is_responded` tinyint(1) DEFAULT '0',
  `response_notes` text COLLATE utf8mb4_general_ci,
  `response_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `contact_submissions`
--

INSERT INTO `contact_submissions` (`id`, `first_name`, `last_name`, `email`, `phone`, `subject`, `message`, `ip_address`, `submission_date`, `is_read`, `is_responded`, `response_notes`, `response_date`) VALUES
(1, 'test', 'tesr', 'virungaecotours@gmail.com', '12345', '123', 'qwasdx', '41.173.35.86', '2025-04-28 12:54:04', 1, 1, 'k', '2025-04-28 06:57:44'),
(2, 'ij', 'n', 'ntakirutimanadaniel6@gmail.com', '00', 'n', 'n', '41.173.35.86', '2025-04-28 14:12:18', 1, 0, NULL, NULL),
(3, 'Aime', 'Mazimpaka', 'aimecol314@gmail.com', '0789375245', 'sumary', 'Wow', '41.186.78.8', '2025-04-28 21:01:19', 0, 0, NULL, NULL),
(4, 'IsmaelBax', 'IsmaelBaxOQ', 'jisankape@list.ru', '83472326262', 'Пульсовая Диагностика', 'Первое, второе и компот &#8212  https://ayurdara.ru/sredstva_firmy_baidyanath/jogoradzh_guggul_yograj_guggulu_baidyanath/\r\n \r\n- варикозное расширение вен: положительно действует на сосуды, укрепляет их; - избавление от целлюлита и его профилактика; - вялость и дряблость тела: удвартана замедляет процесс старения, , боли в суставах, облегчение боли при растяжениях связок и ушибах; - лишний вес и объем тела; - усталость, нервное напряжение: удвартана расслабляет, восполняет жизненную энергию https://ayurdara.ru/fotoal_bomy/priklyucheniya_ayurdary_v_volshebnoj_mile/26/\r\n \r\nПоказания: Устранение напряжения, стресса, улучшение питания кожи, омоложение, устранение отеков, нормализации сна и эмоционального фона, депрессия, бессонница, хроническая усталость https://ayurdara.ru/vopros-otvet/konsul_tacii_doktora_pravina_v_centrah_ayurdara/\r\n \r\nОСТЕОПАТИЯ https://ayurdara.ru/fotoal_bomy/deli/qutb_minar/\r\n \r\nДа https://ayurdara.ru/nashi_specialisty/ayurvedicheskij_terapevt_santo_tomi/\r\n  На страницах заведений есть раздел , где можно узнать о действующих скидках и спецпредложениях https://ayurdara.ru/nashi_specialisty/ayurvedicheskij_terapevt_santo_tomi/\r\n \r\nГОМЕОПАТИЯ https://ayurdara.ru/fotoal_bomy/priklyucheniya_ayurdary_v_volshebnoj_mile/5/', '83.217.213.120', '2025-06-19 04:51:33', 0, 0, NULL, NULL),
(5, 'Jamesrit', 'JamesritHK', 'valentin.vinokurov.12.6.1968@mail.ru', '81187747121', 'Жилые Дома Проектирование', 'По шикарному местному кремлю XV века прогуляться нужно обязательно https://balka.studio/dizain-proekt-interiera/\r\n \r\nПоистине сказочное здание – Дом Шамиля, который был построен купцом Апаковым как подарок дочери на свадьбу https://balka.studio/dizain-proekt-kvartiry-cena/\r\n  В 18 лет она вышла замуж за сына знаменитого предводителя кавказских горцев имама Шамиля https://balka.studio/dom-v-stile-raita/\r\n  В советские годы это был жилой дом, а позже – музей национального поэта Тукая https://balka.studio/proekt-doma-cena/\r\n \r\nПАВЛОВСК: ЖЕМЧУЖИНА ДВОРЦОВОГО ОЖЕРЕЛЬЯ https://balka.studio/dizain-proekt-studii-pod-sdachu/\r\n \r\nСАНКТ-ПЕТЕРБУРГ: МАЛОИЗВЕСТНОЕ ОБ ИЗВЕСТНОЙ СЕВЕРНОЙ СТОЛИЦЕ https://balka.studio/musey-serdca-v-spb/\r\n \r\nКремлевский Софийский собор, один из старейших в стране, сохранился даже в годы советского богоборчества, да и во время Великой Отечественной обошелся небольшими повреждениями https://balka.studio/dizain-studii/\r\n \r\nАвторские интерьеры и ремонт под ключ https://balka.studio/dizain-proekt-studii-pod-sdachu/', '83.217.213.120', '2025-06-19 05:14:56', 0, 0, NULL, NULL),
(6, 'Larryerent', 'LarryerentHX', 'gamenoktr@gmail.com', '89635695156', 'Официальные ссылки зеркало Кракена https://kra34cc.shop https://kra34cc.shop', 'ВСЕ актуальные ссылки тут - https://kra34cc.shop                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   Официальные ссылки зеркало Кракена https://kra34cc.shop https://kra34cc.shop \r\n \r\n \r\n \r\nОФИЦИАЛЬНАЯ ССЫЛКА на Кракен сайт здесь: Ссылка на сайт:  https://kra34cc.shop \r\nНе заходите по другим ссылкам - https://kra34cc.shop    kra34cc.shop \r\n \r\n \r\nКлючевые слова: Кракен Даркнет, Кракен ссылка, Кракен сайт, Кракен Онион, kra34cc.shop, kra34cc.shop, Кракен маркетплейс, даркнет Кракен, Кракен зеркало, актуальные ссылки.', '5.137.243.207', '2025-06-19 05:24:04', 0, 0, NULL, NULL),
(7, 'AlexFap', 'AlexFapUT', 'alexFap@x-mail.my', '88175216475', 'Кракен рабочий сайт найти', 'Несколько советов клиентам \r\nСайт Kraken знают все, кто хочет купить психоактивные вещества и незаконные услуги. Также тому, кто хочет сам заработать. Основная цель площадки – быть гарантом сделок между покупателями и магазинами и разбираться с конфликтами. Однако посетителям Кракена следует знать её особенности. \r\nКак заходить на площадку Kraken Onion \r\nРаспространённая проблема, с которой могут столкнуться посетители <a href=https://kraken-shop-darknet.com/kraken-sajt-darknet-kak-vojti-na-sajt/>кракен вход</a> – проблемы со входом. Это происходит из-за блокировок государством и из-за проблем со стороны посетителя. \r\nСпособы попасть на заблокированные сайты: \r\n• Прокси или ВПН. \r\n• браузер Тор, который обеспечивает высокий уровень конфиденциальности. \r\n• Найти зеркало, которое можно открыть в любом браузере. \r\nСпособ доступа выбирают с учётом особенностей ситуации. С мобилки на Кракен проще зайти через зеркало – для ПК лучше пользоваться Тором. \r\nКак покупать на Кракену \r\nПервая сделка на сайте должна выполняться только на Биткойны. После этого можно использовать все варианты: \r\n• Биткоин. Для этого не обязательно регистрировать криптовалютный кошелёк. Есть возможность получить BTC с банковской карты, Киви и Яндекс. \r\n• SBP. Для перевода по СБП пользуются кошельком или терминалом. \r\n• Пополнение мобильного номера. \r\nЕщё один способ купить товар или заказать услугу – игра в рулетку. При выборе этого варианта открывается игровое поле на 100 клеток – на которые можно ставить фишки. Стоимость поставленной фишки – процент от цены покупки. Можно заплатить меньше более чем вдвое. \r\nКак решать проблемы \r\nС функционалом Кракена разобраться несложно. Поэтому у большинства покупателей не возникает серьёзных проблем. А рейтинговая система сводит к минимуму вероятность стать жертвой мошенников. Продавцы, обманывающие покупателей, банятся. Но проблемы иногда возникают – можно купить некачественный товар или столкнуться с не доставленным заказом. В этом случае нужно открыть спор с продавцом, в котором участвует администрация. \r\nМожно столкнуться и с такой проблемой – блокировка со стороны сервиса. Обычно это связано с неправильными действиями пользователя. Снизить риск бана можно, соблюдая требования администрации. Если заблокировали незаслуженно – обращаться в службу поддержки.', '154.213.202.48', '2025-06-19 11:16:34', 0, 0, NULL, NULL),
(8, 'LeeRon', 'LeeRonEY', 'dinanikolskaya99@gmail.com', '87116118385', 'Aloha  i am wrote about   the price for reseller', 'Sveiki, es gribēju zināt savu cenu.', '185.39.19.48', '2025-06-20 07:01:50', 0, 0, NULL, NULL),
(9, 'Timothynob', 'TimothynobQR', 'kikromankopo1.9.93@gmail.com', '86675679267', 'золотая рыбка аквариумная', 'Р°РєРІР°СЂРёСѓРјРЅС‹Рµ СЂС‹Р±РєР° СЃРґРѕС…Р»Р°\r\n – это не просто красивые питомцы, это целый подводный мир, который можно создать у себя дома https://good-torrent.ru/17633-zooaquariumru-vash-gid-v-zagadochnyy-mir-akvariumov-obshirnyy-obzor-i-analiz-kontenta-dlya-nachinayuschih-i-professionalov.html\r\n. Наблюдение за их грациозными движениями и яркими окрасками успокаивает и расслабляет, а уход за аквариумом может стать увлекательным хобби. Но прежде чем обзавестись этими молчаливыми друзьями, необходимо тщательно подготовиться и изучить все нюансы их содержания. \r\n \r\nПервым шагом станет выбор аквариума. Его размер зависит от количества и размеров планируемых обитателей. Важно помнить, что рыбки должны иметь достаточно пространства для комфортной жизни и плавания. Кроме того, форма аквариума также играет роль. Традиционные прямоугольные аквариумы наиболее удобны в обслуживании, а круглые – хоть и выглядят необычно, но могут быть некомфортными для рыбок из-за искажения пространства. \r\n \r\nПосле выбора аквариума необходимо правильно его оборудовать. Обязательными элементами являются фильтр для очистки воды, обогреватель для поддержания оптимальной температуры и компрессор для насыщения воды кислородом. Также важно позаботиться об освещении, которое не только подчеркнет красоту рыбок, но и необходимо для роста живых растений. \r\n \r\nСледующий этап – РѕСЂР°РЅР¶РµРІС‹Рµ Р°РєРІР°СЂРёСѓРјРЅС‹Рµ СЂС‹Р±РєРё С„РѕС‚Рѕ СЃ РЅР°Р·РІР°РЅРёСЏРјРё\r\n. Здесь https://techdesigner.ru/posts/akva-evolyucziya-kak-prevratit-akvarium-v-zhivuyu-ekosistemu\r\nважно учитывать совместимость разных видов. Некоторые рыбки могут быть агрессивными по отношению к другим, а некоторые – требовать схожих условий содержания. Начинающим аквариумистам рекомендуется выбирать неприхотливые виды, такие как гуппи, данио, сомики или неоны. Они достаточно выносливы и прощают небольшие ошибки в уходе. \r\n \r\nПравильное кормление – залог здоровья и долголетия ваших питомцев. Рыбки должны получать сбалансированное питание, включающее сухой корм, живой корм (например, мотыль или артемию) и растительные добавки. Важно не перекармливать рыбок, так как это может привести к загрязнению воды и развитию болезней. \r\n \r\nУход за аквариумом – это регулярная процедура, включающая подмену воды, чистку грунта и стенок аквариума, а также контроль параметров воды (температуры, pH, жесткости). Подмену воды необходимо проводить еженедельно, заменяя около 20-30% объема. Чистку грунта и стенок аквариума проводят по мере необходимости, используя специальные инструменты. \r\n \r\nНаблюдение за поведением рыбок – важная часть ухода https://www.diigo.com/profile/zooaquarium93\r\n . Любые изменения в их активности, внешнем виде или аппетите могут быть признаками болезни. В случае обнаружения каких-либо отклонений необходимо своевременно принять меры, обратившись к ветеринару-ихтиологу. \r\n \r\nСоздание аквариума – это увлекательный процесс, требующий определенных знаний и усилий. Но результат стоит того: у вас появится свой маленький подводный мир, который будет радовать глаз и дарить умиротворение. Не бойтесь экспериментировать, изучайте новую информацию и помните, что забота о ваших питомцах – это ключ к их здоровью и долгой жизни.', '95.31.119.243', '2025-06-22 08:22:36', 0, 0, NULL, NULL),
(10, 'Mike Jan-Erik Davies', 'Mike Jan-Erik Davies\r\nCV', 'info@digital-x-press.com', '86659787787', 'Add AEO to your SEO strategies today !', 'Hi, \r\nI understand that many businesses struggle recognizing that Answer Engine Optimization (AEO) is a gradual process and a well-planned regular commitment. \r\n \r\nSadly, very few businesses have the patience to recognize the incremental yet impactful improvements that can completely transform their digital visibility. \r\n \r\nWith regular search engine updates, a consistent, continuous SEO strategy including Answer Engine Optimization (AEO) is essential for securing a positive ROI. \r\n \r\nIf you see this as the right method, collaborate with us! \r\n \r\nCheck out Our Monthly SEO Services https://www.digital-x-press.com/unbeatable-seo/ \r\n \r\nTalk to Us on Instant Messaging https://www.digital-x-press.com/whatsapp-us/ \r\n \r\nWe deliver unbeatable results for your budget, and you will value choosing us as your growth partner. \r\n \r\nBest regards, \r\nDigital X SEO Experts \r\nPhone/WhatsApp: +1 (844) 754-1148', '84.17.60.187', '2025-06-22 12:48:37', 0, 0, NULL, NULL),
(11, 'Mike Oskar Gustafsson', 'Mike Oskar Gustafsson\r\nRD', 'info@strictlydigital.net', '87862284774', 'Semrush links for virungaecotours.com', 'Greetings, \r\n \r\nReceiving some set of links linking to virungaecotours.com could have no value or negative impact for your website. \r\n \r\nIt really makes no difference the number of inbound links you have, what is key is the number of ranking terms those websites rank for. \r\n \r\nThat is the key element. \r\nNot the fake third-party metrics or ahrefs DR score. \r\nThat anyone can do these days. \r\nBUT the volume of high-traffic search terms the websites that link to you contain. \r\nThat’s the bottom line. \r\n \r\nMake sure these backlinks redirect to your site and your site will see real growth! \r\n \r\nWe are offering this special SEO package here: \r\nhttps://www.strictlydigital.net/product/semrush-backlinks/ \r\n \r\nNeed more details, or want clarification, message us here: \r\nhttps://www.strictlydigital.net/whatsapp-us/ \r\n \r\nSincerely, \r\nMike Oskar Gustafsson\r\n \r\nstrictlydigital.net \r\nPhone/WhatsApp: +1 (877) 566-3738', '84.17.60.179', '2025-06-24 12:54:56', 0, 0, NULL, NULL),
(12, 'Michaelclums', 'MichaelclumsJE', 'densosport@inbox.lv', '82412196648', 'What\'s Your Verdict on 1win Casino? Share Your Honest Experiences!', 'Hey everyone, \r\n \r\nThis thread is for anyone who has played at 1win Casino to share their honest feedback and experiences. With so many online casinos out there, it can be tough to know which ones are worth your time and money. \r\n \r\nI\'m thinking of trying out 1win and I\'m curious to hear from the community. I\'ve seen some mixed reviews online, so I\'m hoping we can create a helpful discussion for new and existing players. \r\n \r\nTo get the conversation started, here are a few questions: \r\n \r\nWhat has been your overall experience with 1win? (e.g., excellent, good, average, poor) \r\nGame Selection: What do you think of their variety of slots, table games, and live dealer options? Any favorite games? \r\nBonuses and Promotions: Are their bonus offers fair and easy to understand? Have you had any success with them? \r\nDeposits and Withdrawals: How smooth is the process for depositing and withdrawing funds? Have you faced any issues with verification or payout times? \r\nCustomer Support: Have you ever needed to contact their support team? How responsive and helpful were they? \r\nWebsite and App: How do you find the user interface and overall usability of their platform? \r\nWhether you\'ve had a big win, a frustrating experience with a withdrawal, or just want to share your general thoughts, please post them here. Let\'s help each other out by creating a transparent and honest resource for everything related to <a href=https://bluebellschool.org/1win-szkolenie-sportowe-oraz-kasyno-internetowego-premia-piec-stow/>1win</a> Casino.', '185.155.97.139', '2025-06-24 23:29:55', 0, 0, NULL, NULL),
(13, 'Jameshapse', 'JameshapseWZ', 'yandexservises@anonmails.de', '88375638366', 'Специальное предложение: скидка 500 рублей на Яндекс Маркете', 'Уважаемый(ая) партнер, \r\n \r\nИмеем честь уведомить, что на платформе Яндекс Маркет открылась масштабная распродажа с привлекательными предложениями для наших клиентов. \r\n \r\nВоспользуйтесь уникальным промокодом WOW500 или LOOK500, чтобы получить скидку 500 рублей на при оформлении заказа. \r\n \r\nДля участия в акции предлагается: \r\n \r\nПерейти на сайт Яндекс Маркета \r\n \r\nПодобрать необходимые товары \r\n \r\nВвести код WOW500 или LOOK500 для скидки \r\n \r\nОбращаем ваше внимание, что акция действует ограниченное время. \r\n \r\nДля получения дополнительной информации обращайтесь в службу поддержки. \r\n \r\nБлагодарим за выбор и доверие. \r\n \r\nС уважением. \r\nЖдём. \r\n \r\nПереходи по ссылке и получай все скидки Яндекс Маркет - https://t.me/YandexMArket002_bot \r\n<a href=\"https://t.me/YandexMArket002_bot\">Все акции Яндекс Маркет</a>', '188.130.137.229', '2025-06-25 02:35:11', 0, 0, NULL, NULL),
(14, 'pro-dache', 'pro-dacheXV', '553@gmail.com', '82526877733', 'Gnj 5  Fvti Ngj', '<a href=\"https://prodache.ru\">prodache</a>', '117.250.3.58', '2025-06-27 16:45:39', 0, 0, NULL, NULL),
(15, 'RobertRon', 'MatthewRonGM', 'LOVEBUGJH@YAHOO.COM', '83912769681', 'Aloha    writing about your the prices', 'Ciao, volevo sapere il tuo prezzo.', '185.39.19.21', '2025-06-28 00:30:19', 0, 0, NULL, NULL),
(16, 'RobertRon', 'FrankRonGM', '5026645590@vtext.com', '85437147721', 'Hallo, i am write about     price for reseller', 'Hai, saya ingin tahu harga Anda.', '185.39.19.21', '2025-06-28 00:41:56', 0, 0, NULL, NULL),
(17, 'RobertRon', 'AnthonyRonGM', 'Agoglia1@aol.com', '81328538693', 'Aloha  i wrote about your   prices', 'Xin chào, tôi muốn biết giá của bạn.', '185.39.19.21', '2025-06-28 03:11:23', 0, 0, NULL, NULL),
(18, 'DJBew', 'DJBew', 'rubbyroyd24@gmail.com', '89954536361', 'Эмоциональные грани музыкального искусства: волшебство в исполнении Андрея Вебера', '<a href=https://www.youtube.com/channel/UCsV2OdpdPv6aq_cQWTmEs-Q>Певец, что приносит умиротворение через свою музыку – Андрей Вебер</a>', '5.183.130.110', '2025-06-28 21:23:33', 0, 0, NULL, NULL),
(19, 'Craigstymn', 'CraigstymnLM', 'kmetzfwadia6f4@outlook.com', '84117974385', 'https://1.0rb11ta.top/', 'https://msk.0rb11ta.top/ Orb11ta работает! \r\nhttps://orb11ta.lol/  зеркало без  VPN!', '88.210.3.196', '2025-06-29 10:08:02', 0, 0, NULL, NULL),
(20, 'krelpazy', 'krelpazyIQ', 'whtwearhfdiosnice@gmail.com', '89469664533', 'КРАКЕН!?САЙТ — ОФИЦИАЛЬНЫЙ САЙТ ДАРКНЕТ МАРКЕТПЛЕЙСА КРАКЕН (kraken)', 'Ищете Кракен сайт? Вам нужна официальная ссылка на сайт Кракен? В этом посте собраны все актуальные ссылки на сайт Кракен, которые помогут вам безопасно попасть на Кракен даркнет через Tor. \r\n \r\nРабочие ссылки на Кракен сайт (официальный и зеркала): \r\n \r\n1.	Официальная ссылка на сайт Кракен: <a href=https://https-kra33.shop?c=syf9zl>Кракен официальный сайт</a> \r\n \r\n2.	Кракен сайт зеркало: <a href=https://http-kra33.xyz?c=syf9wq>Кракен зеркало сайта</a> \r\n \r\n3.	Кракен сайт магазин: <a href=https://kra33cc.life?c=syekdh>Кракен магазин</a> \r\n \r\n4.	Ссылка на сайт Кракен через даркнет: <a href=https://https-kra33.shop?c=syf9zl>Кракен сайт даркнет</a> \r\n \r\n5.	Актуальная ссылка на сайт Кракен: <a href=https://kr34.xyz?c=syekao>Кракен актуальная ссылка</a> \r\n \r\n6.	Запасная ссылка на сайт Кракен: <a href=https://krakenmarketing.shop?c=sybtgp>Ссылка на сайт Кракен через VPN</a> \r\n \r\nКак попасть на Кракен сайт через Tor: \r\n \r\nДля того чтобы попасть на Кракен сайт через Tor, следуйте этим шагам: \r\n \r\n1.	Скачайте Tor браузер: Перейдите на официальный сайт Tor и скачайте Tor браузер для Windows, Mac и Linux. Установите браузер, чтобы получить доступ к Кракен даркнет. \r\n \r\n2.	Запустите Tor браузер: Откройте браузер и дождитесь, пока он подключится к сети Tor. \r\n \r\n3.	Перейдите по актуальной ссылке на сайт Кракен: Вставьте одну из актуальных ссылок на сайт Кракен в адресную строку Tor браузера, чтобы попасть на Кракен даркнет сайт. \r\n \r\n4.	Регистрация на сайте Кракен: Зарегистрируйтесь на Кракен официальном сайте. Создайте аккаунт, используя надежный пароль и включите двухфакторную аутентификацию для повышения безопасности. \r\n \r\nМеры безопасности на сайте Кракен даркнет: \r\n \r\nЧтобы ваш опыт использования Кракен сайта был безопасным, следуйте этим рекомендациям: \r\n \r\n•	Используйте актуальные ссылки на сайт Кракен: Даркнет-ресурсы часто меняют свои адреса, поэтому обязательно используйте только проверенные и актуальные ссылки на сайт Кракен. \r\n \r\n•	VPN для дополнительной безопасности: Использование VPN для доступа к Кракен обеспечит вашу анонимность, скрывая ваш реальный IP-адрес. Выбирайте только проверенные VPN-сервисы для доступа к Кракен сайту. \r\n \r\n•	Будьте осторожны с ссылками на Кракен: Важно избегать сомнительных ссылок и проверять их на наличие фишинга. \r\n \r\nПочему Кракен сайт так популярен? \r\n \r\n•	Кракен даркнет — это один из самых известных и популярных даркнет-магазинов. Он предоставляет пользователям безопасный доступ к анонимным покупкам, включая продукты на Кракен сайте, товары и услуги. \r\n \r\n•	Безопасность на сайте Кракен: Все транзакции через Кракен даркнет происходят анонимно, и каждый пользователь может быть уверен в защите своих данных. \r\n \r\n•	Актуальная ссылка на сайт Кракен: Для того чтобы быть в курсе актуальных ссылок, важно регулярно проверять обновления на проверенных форумах и в официальных источниках. \r\n \r\nПостоянно обновляющиеся зеркала сайта Кракен: \r\n \r\nСайт Кракен обновляет свои зеркала для обеспечения безопасности. Поэтому актуальная ссылка на Кракен может изменяться. Используйте только проверенные ссылки, такие как: \r\n \r\n•	Ссылка на сайт Кракен через Тор: <a href=https://krakenmarketing.shop?c=sybtgp>Кракен сайт Тор</a> \r\n \r\n•	Запасная ссылка на сайт Кракен: <a href=https://krakenmarketing.shop?c=sybtgp>Ссылка на сайт Кракен через VPN</a> \r\n \r\n•	Последняя ссылка на сайт Кракен: https://kra33cc.life?c=syekdh \r\n \r\nЗаключение: \r\n \r\nДля безопасного доступа к Кракен сайту, следуйте приведенным рекомендациям и используйте только актуальные ссылки на Кракен. Помните, что Кракен даркнет требует особого подхода в плане безопасности. Используйте Tor, VPN, и проверяйте актуальность ссылок. \r\n \r\nЗарегистрируйтесь на официальном сайте Кракен и получите доступ к всемирно известной даркнет-платформе. \r\n________________________________________ \r\nКлючевые слова: \r\n•	кракен сайт \r\n•	кракен официальный сайт \r\n•	кракен сайт kr2connect co \r\n•	кракен сайт магазин \r\n•	ссылка на сайт кракен \r\n•	кракен зеркало сайта \r\n•	кракен сайт даркнет \r\n•	сайт кракен тор \r\n•	кракен рабочий сайт \r\n•	кракен актуальная ссылка \r\n•	кракен даркнет', '77.246.102.218', '2025-07-03 12:03:40', 0, 0, NULL, NULL),
(21, 'Philliptoili', 'PhilliptoiliRV', 'temptest543827564@gmail.com', '86797864936', '301 Moved Permanently', '301 Moved Permanently \r\n<a href=https://www.binance.com/activity/referral-entry/CPA/together-v4?hl=en&ref=CPA_007YZN88KF>Show more!..</a>', '5.228.6.144', '2025-07-04 13:05:18', 0, 0, NULL, NULL),
(22, 'JimmyPouri', 'JimmyPouriSP', 'sir.maxbo@yandex.ru', '85121474184', 'Очиститель сажевого фильтра \"TERMIT DPF CLEANER\"', 'Очиститель сажевого фильтра FLUX \"TERMIT\" \r\nобъемом 5 литров предназначен для эффективной очистки и профилактики выхлопной системы вашего автомобиля. Этот продукт идеально подходит для владельцев дизельных автомобилей, которые хотят поддерживать работоспособность и долговечность своего сажевого фильтра. С его помощью вы сможете предотвратить засорение фильтра, что поможет избежать дорогостоящего ремонта и замены деталей. \r\n<a href=https://radikal.host/i/2s0gRv><img src=\"https://e.radikal.host/2025/03/30/to2.md.png\"></a> \r\nФормула очистителя \r\nразработана с учетом современных требований, обеспечивая высокую эффективность удаления загрязнений, таких как сажа и копоть, что в свою очередь улучшает работу двигателя и снижает выбросы вредных веществ в атмосферу. Регулярное использование этого продукта позволяет поддерживать оптимальную работу системы и способствует продлению срока службы вашего автомобиля. \r\n<a href=https://radikal.host/i/2s09mO><img src=\"https://e.radikal.host/2025/03/30/to1.md.png\"></a> \r\nПрименение очистителя \r\nПрименение очистителя не только безопасно, но и легко. Просто следуйте инструкции на упаковке, и вы сможете быстро и эффективно очистить сажевый фильтр, повышая производительность вашего транспорта. Этот очиститель является отличным выбором для автолюбителей, стремящихся поддерживать свой автомобиль в идеальном состоянии. \r\n<a href=https://radikal.host/i/2s0YuE><img src=\"https://e.radikal.host/2025/03/30/to3.md.png\"></a> \r\nКупить можно \r\nhttps://carteams-shop.ru/magazin/product/magazin/product/ochistitelsajevogofiltrafluxtermit \r\nhttps://www.ozon.ru/product/ochistitel-sazhevogo-filtra-termit-dpf-cleaner-5l-1842332449/ \r\nhttps://www.wildberries.ru/catalog/316931146/detail.aspx?targetUrl=GP \r\n \r\nЖидкость для тестирования, калибровки дизельных форсунок и ТНВД \"Torch DIESEL SRS\" \r\n \r\nСпециальная жидкость \r\nСпециальная жидкость для тестирования, калибровки и консервации топливной аппаратуры дизельных двигателей. Рекомендуется к применению как производителям топливной аппаратуры для ее калибровки и последующей консервации, так и для последующего обслуживания и ремонта на сервисных станциях. Рекомендации по применению SRS Calibration Fluid соответствует ISO-норме 4113 и имеет допуск Daimler-Benz Blatt 133.0. \r\n<a href=https://radikal.host/i/2s04Fd><img src=\"https://e.radikal.host/2025/03/30/d1.md.png\"></a> \r\nDIESEL TORCH \r\nDIESEL TORCH - обладает следующими преимуществами: \r\n \r\n-быстро удаляется с поверхности и не оставляет повреждений \r\n \r\n-низкие потери при испарении, за счет узкого диапазона между исходной и конечной точками кипения \r\n \r\n-стойкость к окислению \r\n \r\n-высокая температура вспышки и высокая диэлектрическая прочность \r\n \r\n-хорошие свойства смачивания и промывки \r\n \r\n-фильтруется при наличии необходимой системы фильтрации \r\n<a href=https://radikal.host/i/2s001I><img src=\"https://e.radikal.host/2025/03/30/d2.md.png\"></a> \r\nКупить можно \r\nhttps://carteams-shop.ru/magazin/product/jidkostdlyatestirovaniyadizelnihforsunok \r\nhttps://www.ozon.ru/product/zhidkost-dlya-testirovaniya-kalibrovki-dizelnyh-forsunok-i-tnvd-torch-diesel-srs-1842654348/ \r\nhttps://www.wildberries.ru/catalog/317636532/detail.aspx?targetUrl=GP', '188.162.6.36', '2025-07-06 01:44:36', 0, 0, NULL, NULL),
(23, 'NormandRiz', 'NormandRizCW', 'yourmail344@gmail.com', '81186582425', 'Blood on AIPAC and The Evangelical Church hands', 'It\'s unbelievable \r\n\r\nWho are the Jews\r\n\r\nhttps://www.youtube.com/shorts/SEB3w3A98rU\r\n\r\nit is our money\r\n\r\nhttps://www.youtube.com/shorts/wiu9N1H0Huc\r\n\r\nThe most devastating genocide in the world is being carried out by the follwoing :\r\n\r\n1- AIPAC, brows ( https://www.youtube.com/watch?v=COx-t-Mk6UA ). \r\n2- Miriam Adelson brows https://www.youtube.com/watch?v=Nr0LkA7VW7Q.\r\n3- Elon Musk. \r\n3- Timothy mellonand brows https://www.youtube.com/shorts/1XJ893-kAh0  \r\n4-The Evangelical Church, \r\n\r\nWhich kill innocent women and children in Gaza.\r\n\r\nAIPAC, The Evangelical Church, Miriam Adelson, Elon Musk, and timothy mellon and   America tax payer provided Israel with TNT (explosives) for their GENOCIDE.\r\n\r\nGaza has been declared a disaster area and lacks essential resources for living in it, as follows.\r\n\r\nAIPAC, The Evangelical Church, Miriam Adelson, Elon Musk, and timothy mellon and   America tax payer, help Israel destroyed 90% of Gaza, destroying 437,600 homes, and killing one million people, including 50 thousand who are currently under rubble, 80% of whom are women and children. \r\n\r\nAIPAC, The Evangelical Church, Miriam Adelson, Elon Musk, and timothy mellon and   America tax payer, make Israel destroyed 330,000 meters of water pipes, resulting in people not being able to drink water. \r\n\r\nAIPAC, The Evangelical Church, Miriam Adelson, Elon Musk, and timothy mellon and   America tax payer, help Israel destroyed more than 655,000 meters of underground sewer lines. Now people have no washrooms to use. \r\n\r\nAIPAC, The Evangelical Church, Miriam Adelson, Elon Musk, and timothy mellon and   America tax payer, make Israel destroyed 2,800,000 two million eight hundred thousand meters of roads, causing people to have no roads to use. \r\n\r\nAIPAC, The Evangelical Church, Miriam Adelson, Elon Musk, and timothy mellon and   America tax payer, make Israel have destroyed 3680 km of electric grid, which has caused people to lose electricity. \r\n\r\nAIPAC, The Evangelical Church, Miriam Adelson, Elon Musk, and timothy mellon and   America tax payer, and Israel destroyed 48 hospitals and leveled them to the ground. Now, no one will have a hospital to save their lives. \r\n\r\nAIPAC, The Evangelical Church, Miriam Adelson, Elon Musk, and timothy mellon and   America tax payer, and Israel destroyed over 785,000 students\' ability to attend school and learn. Their actions resulted in the complete destruction of 494 schools and universities, many of which were destroyed by bombing. \r\n\r\nAIPAC, The Evangelical Church, Miriam Adelson, Elon Musk, and timothy mellon and   America tax payer, and Israel destroyed 981 mosques to prevent homless people from asking God for help. \r\n\r\nAIPAC, The Evangelical Church, Miriam Adelson, Elon Musk, and timothy mellon and   America tax payer have made over 39000 small children orphans and left them without parents or relatives to care for them.\r\n \r\nThere has never been a war in history where 80% of the country has been destroyed, 100% of the population has been displaced, and 50% of the deaths are children. \r\n\r\nDon\'t hesitate to call it what it is\r\n\r\nAIPAC ( https://www.youtube.com/watch?v=COx-t-Mk6UA ) and The Evangelical Church (America) are creating a GENOCIDE.\r\n\r\nhttps://www.youtube.com/shorts/IrX9v6DKH1g\r\n\r\nsee why Israel can kill innocent children with American taxpayer money\r\n\r\n1- see Why Israel is in deep trouble \r\n\r\nhttps://www.youtube.com/watch?v=kAfIYtpcBxo\r\n\r\n2- Because the God of Money of our World is a Jew who supports and lives in Israel. For more details, click on the following link.\r\n\r\nhttps://mega.nz/file/FqhzGKbB#bsX4PD-O59HEA0-rynD29xkk47dmddycY5CjZfoDLYg\r\n\r\n3- Because what USA president say about AIPAC and  The Evangelical Church (America)\r\n https://www.tiktok.com/@thefearlessqueenmel/video/7307640994579680542?lang=en&q=why%20dont%20Americans%20knowl%20what%20you%20have%20seen%20&t=1701880206555\r\n\r\nSee how innocent children are killed by the most powerful Israeli using American bombs at\r\n\r\nAl Jazeera Arabic Live\r\n\r\nat\r\n\r\nhttps://www.youtube.com/watch?v=COx-t-Mk6UA\r\n\r\nWatch the real news at\r\n\r\nhttps://www.youtube.com/watch?v=bNyUyrR0PHo\r\n\r\nLaws of jews TaurÃ£t (Torah) wich is a part of the Bible\r\n \r\nWe ordained in TaurÃ£t for them: â€œA life for a life, an eye for an eye, a nose for a nose, an ear for an ear, a tooth for a tooth and for a wound an equal retaliation.\" \r\n\r\nThe Torah, which is part of the Bible, has commanded that the same be done to the Jews. The order of the Torah, which is part of the Bible, is to immediately kill any Jew you see on the street. Since the Jews in Gaza have also killed women and children, you should kill any Jews - men, women, and children - as soon as you see them, whether on the street or anywhere else. And because they have killed everyone in Gaza without mercy, you must do the same to them. If you carry out these actions, you will be following the order of the Torah, which is part of the Bible, and you will be rewarded by going to heaven.', '128.90.168.12', '2025-07-06 08:32:51', 0, 0, NULL, NULL),
(24, 'Mike Morten Smith', 'Mike Morten Smith\r\nMJ', 'mike@monkeydigital.co', '88723993785', 'Grow Your Website Traffic with Country-Specific Social Ads – Only $10 for 10K Visits!', 'Dear Webmaster, \r\n \r\nI wanted to connect with something that could seriously help your website’s reach. We work with a trusted ad network that allows us to deliver authentic, geo-targeted social ads traffic for just $10 per 10,000 visits. \r\n \r\nThis isn\'t junk clicks—it’s real visitors, tailored to your preferred location and niche. \r\n \r\nWhat you get: \r\n \r\n10,000+ real visitors for just $10 \r\nGeo-targeted traffic for any country \r\nScalability available based on your needs \r\nUsed by marketers—we even use this for our SEO clients! \r\n \r\nReady to scale? Check out the details here: \r\nhttps://www.monkeydigital.co/product/country-targeted-traffic/ \r\n \r\nOr connect instantly on WhatsApp: \r\nhttps://monkeydigital.co/whatsapp-us/ \r\n \r\nLet\'s get started today! \r\n \r\nBest, \r\nMike Morten Smith\r\n \r\nPhone/whatsapp: +1 (775) 314-7914', '31.171.152.133', '2025-07-06 14:59:05', 0, 0, NULL, NULL),
(25, 'NormandRiz', 'NormandRizCW', 'yourmail344@gmail.com', '81494774899', 'Blood on the hands of AIPAC and The Evangelical Church lobby', 'It\'s unbelievable\r\n\r\nWho are the Jews\r\n\r\nhttps://www.youtube.com/shorts/SEB3w3A98rU\r\n\r\nit is our money\r\n\r\nhttps://www.youtube.com/shorts/wiu9N1H0Huc\r\n\r\nThe most devastating genocide in the world is being carried out by the follwoing :\r\n\r\n1- AIPAC, brows ( https://www.youtube.com/watch?v=COx-t-Mk6UA ). \r\n2- Miriam Adelson brows https://www.youtube.com/watch?v=Nr0LkA7VW7Q.\r\n3- Elon Musk. \r\n3- Timothy mellonand brows https://www.youtube.com/shorts/1XJ893-kAh0  \r\n4-The Evangelical Church, \r\n\r\nWhich kill innocent women and children in Gaza. \r\n\r\nThe most devastating genocide in the world is being carried out by AIPAC  ( https://www.youtube.com/watch?v=COx-t-Mk6UA ) and the Evangelical Church, which kill innocent women and children in Gaza.\r\n\r\nAIPAC and The Evangelical Church (America) provided Israel with TNT (explosives) for their GENOCIDE.\r\n\r\nGaza has been declared a disaster area and lacks essential resources for living in it, as follows.\r\n\r\nAIPAC, The Evangelical Church, Miriam Adelson, Elon Musk, and timothy mellon and   America tax payer, (America), and Israel destroyed 90% of Gaza, destroying 437,600 homes, and killing one million people, including 50 thousand who are currently under rubble, 80% of whom are women and children. \r\n\r\nAIPAC, The Evangelical Church, Miriam Adelson, Elon Musk, and timothy mellon and   America tax payer, (America), and Israel destroyed 330,000 meters of water pipes, resulting in people not being able to drink water. \r\n\r\nAIPAC, The Evangelical Church, Miriam Adelson, Elon Musk, and timothy mellon and   America tax payer, (America), and Israel destroyed more than 655,000 meters of underground sewer lines. Now people have no washrooms to use. \r\n\r\nAIPAC, The Evangelical Church, Miriam Adelson, Elon Musk, and timothy mellon and   America tax payer, (America), and Israel destroyed 2,800,000 two million eight hundred thousand meters of roads, causing people to have no roads to use. \r\n\r\nAIPAC, The Evangelical Church, Miriam Adelson, Elon Musk, and timothy mellon and   America tax payer, (America), and Israel have destroyed 3680 km of electric grid, which has caused people to lose electricity. \r\n\r\nAIPAC, The Evangelical Church, Miriam Adelson, Elon Musk, and timothy mellon and   America tax payer, (America), and Israel destroyed 48 hospitals and leveled them to the ground. Now, no one will have a hospital to save their lives. \r\n\r\nAIPAC, The Evangelical Church, Miriam Adelson, Elon Musk, and timothy mellon and   America tax payer, (USA), and Israel destroyed over 785,000 students\' ability to attend school and learn. Their actions resulted in the complete destruction of 494 schools and universities, many of which were destroyed by bombing. \r\n\r\nAIPAC, The Evangelical Church, Miriam Adelson, Elon Musk, and timothy mellon and   America tax payer, (America), and Israel destroyed 981 mosques to prevent homless people from asking God for help. \r\n\r\nAIPAC, The Evangelical Church, Miriam Adelson, Elon Musk, and timothy mellon and   America tax payer, have made over 39000 small children orphans and left them without parents or relatives to care for them.\r\n \r\nThere has never been a war in history where 80% of the country has been destroyed, 100% of the population has been displaced, and 50% of the deaths are children. \r\n\r\nDon\'t hesitate to call it what it is\r\n\r\nAIPAC ( https://www.youtube.com/watch?v=COx-t-Mk6UA ) and The Evangelical Church (America) are creating a GENOCIDE.\r\n\r\nhttps://www.youtube.com/shorts/IrX9v6DKH1g\r\n\r\nsee why Israel can kill innocent children with American taxpayer money\r\n\r\n1- see Why Israel is in deep trouble \r\n\r\nhttps://www.youtube.com/watch?v=kAfIYtpcBxo\r\n\r\n2- Because the God of Money of our World is a Jew who supports and lives in Israel. For more details, click on the following link.\r\n\r\nhttps://mega.nz/file/FqhzGKbB#bsX4PD-O59HEA0-rynD29xkk47dmddycY5CjZfoDLYg\r\n\r\n3- Because what USA president say about AIPAC and  The Evangelical Church (America)\r\n https://www.tiktok.com/@thefearlessqueenmel/video/7307640994579680542?lang=en&q=why%20dont%20Americans%20knowl%20what%20you%20have%20seen%20&t=1701880206555\r\n\r\nSee how innocent children are killed by the most powerful Israeli using American bombs at\r\n\r\nAl Jazeera Arabic Live\r\n\r\nat\r\n\r\nhttps://www.youtube.com/watch?v=COx-t-Mk6UA\r\n\r\nWatch the real news at\r\n\r\nhttps://www.youtube.com/watch?v=bNyUyrR0PHo\r\n\r\nLaws of jews TaurÃ£t (Torah) wich is a part of the Bible\r\n \r\nWe ordained in TaurÃ£t for them: â€œA life for a life, an eye for an eye, a nose for a nose, an ear for an ear, a tooth for a tooth and for a wound an equal retaliation.\" \r\n\r\nThe Torah, which is part of the Bible, has commanded that the same be done to the Jews. The order of the Torah, which is part of the Bible, is to immediately kill any Jew you see on the street. Since the Jews in Gaza have also killed women and children, you should kill any Jews - men, women, and children - as soon as you see them, whether on the street or anywhere else. And because they have killed everyone in Gaza without mercy, you must do the same to them. If you carry out these actions, you will be following the order of the Torah, which is part of the Bible, and you will be rewarded by going to heaven.', '128.90.163.16', '2025-07-07 20:12:23', 0, 0, NULL, NULL),
(26, 'ClydeSlopy', 'ClydeSlopyMM', 'markelov_a541f@rambler.ru', '86755696445', 'Rates start at €0.75/month.', 'http://vpnuf.mooo.com Fast and reliable VPN service with WireGuard support. Rates start at €0.75/month. Servers are available in Europe and Russia. Secure connection and high speeds up to 1 Gbps.', '130.255.170.164', '2025-07-08 12:14:33', 0, 0, NULL, NULL),
(27, 'RobertRon', 'EricRonGM', 'BSMITH@BESTINSGRP.COM', '86612469615', 'Hello  i am wrote about   the prices', 'Aloha, makemake wau eʻike i kāu kumukūʻai.', '185.39.19.21', '2025-07-08 20:07:12', 0, 0, NULL, NULL),
(28, 'RobertRon', 'RussellRonGM', 'adill@nationalselfstorage.com', '82595882899', 'Aloha  i am write about     price', 'Hæ, ég vildi vita verð þitt.', '185.39.19.21', '2025-07-08 20:07:12', 0, 0, NULL, NULL),
(29, 'Mike Jens Nilsson', 'Mike Jens Nilsson\r\nAH', 'info@professionalseocleanup.com', '85224514943', 'Urgent: Toxic Links Found on virungaecotours.com', 'Hi, \r\nWhile reviewing virungaecotours.com, we spotted toxic backlinks that could put your site at risk of a Google penalty. \r\n \r\nWe can clean up your link profile and protect your rankings — all for just $5. \r\n \r\nFix it now before Google does: \r\nhttps://www.professionalseocleanup.com/ \r\n \r\nNeed help or questions? Chat here: \r\nhttps://www.professionalseocleanup.com/whatsapp/ \r\n \r\nBest, \r\nMike Jens Nilsson\r\n \r\n+1 (855) 221-7591 \r\ninfo@professionalseocleanup.com', '37.19.223.19', '2025-07-11 21:47:15', 0, 0, NULL, NULL),
(30, 'Mike Sven-Erik Hansen', 'Mike Sven-Erik Hansen\r\nCV', 'info@digital-x-press.com', '81771146472', 'Add AEO to your SEO strategies today !', 'Hi, \r\nI realize that some companies struggle grasping that Answer Engine Optimization (AEO) is a continuous effort and a carefully organized regular commitment. \r\n \r\nThe reality is, very few marketers have the patience to recognize the incremental yet significant improvements that can completely boost their search performance. \r\n \r\nWith constant algorithm changes, a consistent, long-term strategy including Answer Engine Optimization (AEO) is essential for securing a strong return on investment. \r\n \r\nIf you recognize this as the best approach, collaborate with us! \r\n \r\nDiscover Our Monthly SEO Services https://www.digital-x-press.com/unbeatable-seo/ \r\n \r\nChat With Us on Instant Messaging https://www.digital-x-press.com/whatsapp-us/ \r\n \r\nWe deliver remarkable outcomes for your budget, and you will enjoy choosing us as your growth partner. \r\n \r\nBest regards, \r\nDigital X SEO Experts \r\nPhone/WhatsApp: +1 (844) 754-1148', '181.214.218.112', '2025-07-19 19:05:17', 0, 0, NULL, NULL),
(31, 'IsmaelBax', 'IsmaelBaxOQ', 'jisankape@list.ru', '86371942195', 'Аюрведическая Терапия', 'Как любое лечение, процедурное лечение должно быть назначено специалистом и проводиться курсами, для максимального результата https://ayurdara.ru/fotoal_bomy/yoga_vstrecha/_/\r\n \r\nЗдесь Вы сможете узнать много полезного о науке аюрведы https://ayurdara.ru/fotoal_bomy/priklyucheniya_ayurdary_v_volshebnoj_mile/3/\r\n  Познакомитесь с её терминами и понятиями https://ayurdara.ru/stat_i/zastoj_v_zhizni/\r\n  В разделе  и блоге найдёте интересные статьи о здоровье https://ayurdara.ru/ayurvedicheskaya_kuhnya/chatni/chatni_iz_kinzy/\r\n  Узнаете, что лечит аюрведа, каковы её методы, как проходят консультации аюрведических докторов и аюрведическая диагностика https://ayurdara.ru/fotoal_bomy/simpozium_ayurveda_i_joga_g_spb_24_06_17/2/\r\n  Проникнитесь идеями о ценности аюрведических массажей, процедур и глубинного омоложения организма https://ayurdara.ru/ayurvedicheskaya_kuhnya/uppuma/\r\n  И ещё – здесь Вы найдёте хорошие и полезные рецепты и научитесь питаться так, чтобы еда стала лекарством, а не источником болезней! Читайте, узнавайте, здоровейте! \r\nКонтактная информация https://ayurdara.ru/fotoal_bomy/ayurdara_-_ayurveda_v_sankt-peterburge/5/2/\r\n \r\nПХАЛА – Фруктовый массаж https://ayurdara.ru/fotoal_bomy/jaipur/24/\r\n \r\nНе является лекарственным препаратом и не заменяет традиционного медицинского лечения https://ayurdara.ru/fotoal_bomy/2021/28/\r\n  Перед применением рекомендуется проконсультироваться со специалистом по Аюрведе для индивидуального назначения https://ayurdara.ru/fotoal_bomy/pattadakal_aihole/8/\r\n \r\n…сильные руки хрупкой девушки-массажистки,но! Заявленный массаж лица не делается, фито-чай по завершении процедуры не предлагается https://ayurdara.ru/knigi_i_zhurnaly_ob_ayurvede/ayurveda_i_joga_vypusk_11/\r\n  Осадок остался https://ayurdara.ru/fotoal_bomy/indijskij_tradicionnyj_centr_zdorov_ya_ayurdara/25/\r\n  Советовать…', '83.217.213.120', '2025-07-21 04:38:00', 0, 0, NULL, NULL),
(32, 'Alfredheede', 'AlfredheedeVS', 'y.kuvayev@mail.ru', '86668451127', 'Грунтовка Глубокого Проникновения 10', '№ 005 Серый темный https://p-parquet.ru/neprozrachnaya-kraska-osmo-landhausfarbe-32\r\n \r\nСредства для реставрации мебели https://p-parquet.ru/magazin/folder/lak-dlya-parketa\r\n \r\nот 2 590 руб https://p-parquet.ru/retush-emalevaya-ritocchi-coprente-122-oranjevii-30ml\r\n \r\nНаш магазин принимает розничные и оптовые заказы на реставрационные материалы для мебели https://p-parquet.ru/vodnyy-lak-dlya-parketa-lobadur-ws-2k-duo-1\r\n  Мы готовы к сотрудничеству как с индивидуальными заказчиками, так и с производителями мебели и предметов интерьера https://p-parquet.ru/inzhenernyj-modulnyj-parket-kvadro-iz-duba\r\n \r\n№ R 4900 Вишня https://p-parquet.ru/osmo-holzschutz-lasur-maslo-zashchitnaya-906-25l\r\n \r\n5 https://p-parquet.ru/materialy-dlya-naruzhnykh-rabot-borma-wachs/p/2\r\n  Не меняет структуру древесины  https://p-parquet.ru/samogruntuyushchijsya-vodnyj-lak-dlya-parketa-parquet-lack-borma-wachs-20l-60\r\n  Применение масло-воска не приводит к разрушению структуры древесины, и даже наоборот, защищает дерево от пятен, истирания, царапин и других повреждений https://p-parquet.ru/maslo-osmo-3072-cvet-yantar-s-tverdym-voskom-hartwachs-ol-farbig-180ml', '83.217.213.120', '2025-07-21 04:42:10', 0, 0, NULL, NULL),
(33, 'DavidRof', 'DavidRofSQ', 'abbyas-venikov1984@mail.ru', '87337424345', 'Клей Для Паркета На Фанеру Купить', '15 615 рублей https://bormawachs.ru/magazin/vendor/borma-wachs-italiya/p/5\r\n \r\nPrev Next Result https://bormawachs.ru/magazin/product/tsvetnoye-maslo-dlya-terras-terrace-oil-borma-wachs-15\r\n \r\n15 970 рублей https://bormawachs.ru/magazin/product/myagkij-vosk-stuccorapido-borma-wachs-196\r\n \r\nот 3 500 ? до 2 739 https://bormawachs.ru/magazin/tag/maslo-dlya-terras\r\n 60 ? \r\n1 750 ? 2 500 ? \r\n2 вида: нитро и акриловый https://bormawachs.ru/magazin/product/lak-dlya-zashchity-kamnya-i-mramora-stone-coat-blesk-30-1l\r\n  Быстро сохнет, не оставляет ореолов https://bormawachs.ru/magazin/product/pigmentnaya-pasta-vodorazbavimaya-borma-wachs-kopiya\r\n  Блеск: 10%, 20%, 30%, 40%, 60% и 90% https://bormawachs.ru/magazin/product/vosk-tverdyj-hartwachs-borma-wachs-120\r\n  Ретуширующий лак-спрей для древесины HOLZSPRAY прост в применении, создает надежное покрытие, быстро сохнет и не оставляет ореолов https://bormawachs.ru/magazin/product/magazin/product/maslo-dlya-vosstanovleniya-okonnyh-ram-regenerating-oil-window-frames', '83.217.213.120', '2025-07-21 04:53:48', 0, 0, NULL, NULL),
(34, 'EdwardTrild', 'EdwardTrildUO', 'eepovda@bk.ru', '85973814394', 'Кровать Крепкая', '— компания-производитель https://by-home.ru/obedennye-stoly/17351-obedennaya-gruppa-stol-fr-0404-i-4-stula-fr-0024.html\r\n  В наших каталогах вы можете выбрать и дешево купить диваны в Москве, Санкт-Петербурге и других городах России https://by-home.ru/komody/8986-komod-bf-21187.html\r\n  У нас есть собственное производство в Великом Новгороде, где мы создаем эффектную и функциональную мебель https://by-home.ru/chasy/9988-chasy-nomon-oj-mini-pink-d50sm.html\r\n  Мы сами делаем сварные металлические каркасы, используем ортопедические ламели и большие по толщине матрасы, а также заказываем красивые и приятные на ощупь ткани для обивки у лучших поставщиков https://by-home.ru/stulya/19365-stul-kukhonnyj-signal-astor-zelenyj-chernyj.html\r\n \r\nМебельная фабрика Танагра - это философия комфортной и красивой жизни https://by-home.ru/komody/8713-komod-bf-60176.html\r\n  Компания является российским производителем качественных, удобных модульных диванов, мягких кресел, кроватей для здорового сна https://by-home.ru/tumby-pod-tv/26804-tv-tumba-cilan-grande-200-sinij-antichnyj.html\r\n  В производстве используются материалы премиум класса, более 2000 вариаций тканей для обивки изделий https://by-home.ru/interernye-kresla/26522-kreslo-sorbonna-2.html\r\n \r\nПроизводитель: Barashka Размер кресла в разложенном виде, см: 210х140х12 https://by-home.ru/platyanye-shkafy-shkafy-kupe/8918-shkaf-bf-60670.html\r\n  Обивка: ткань https://by-home.ru/s-myagkim-izgolovem/23734-krovat-signal-barcelona-velvet-bluvel-14-seryjdub-160200.html\r\n  Наполнитель: ППУ https://by-home.ru/stellazhi-prikhozhie/20618-stellazh-halmar-narvik-reg-2-dub-sonomachernyj.html\r\n \r\n\r\nНаличие собственных фабрик, а также отлаженная работа с крупнейшими отечественными производителями позволяют нам сделать мебель максимально доступной https://by-home.ru/dekorativnye-podushki/13228-interernaya-podushka-botanicheskoe-barokko-versiya-1.html', '83.217.213.120', '2025-07-21 05:50:35', 0, 0, NULL, NULL),
(35, 'Aaronsop', 'AaronsopGA', 'placnacidown1989@mail.ru', '86277927515', 'Переговорного Домофона', '-9% Экономия: 90 руб https://ats-mxm.ru/katalog/mxm120-300-500\r\n \r\nюр https://ats-mxm.ru/katalog/dopolnitelnye-interfejsnye-platy/modul-rasshireniya-kanalov-voip-i-golosovoj-pochty-vvmu\r\n лица 26102 ? \r\nНОВИНКА 2022 https://ats-mxm.ru/katalog/dect/gigaset-a-220\r\n \r\nСовместимость с домофоном, который расположен на парадной двери https://ats-mxm.ru/katalog/domofony-usiliteli-ggs-adaptery-i-drugoe-oborudovanie/elektromekhanicheskij-zamok-polis-12m\r\n  Наличие подсветки камеры (желательно инфракрасной) и операции регулировки яркости сигнала https://ats-mxm.ru/resheniya/sistema-svyazi-pult-direktora\r\n  Присутствие в домофоне встроенного адаптера, чтобы подключиться в электрощитовую https://ats-mxm.ru/katalog/moduli-rasshireniya-dlya-tsifrovoj-ip-ats-mxm500-snyata-s-proizvodstva/ap62\r\n  Тип крепежа вызывной панели в подъезде и видеодомофона в квартирном коридоре https://ats-mxm.ru/katalog/mxm120-300-500/sa37p\r\n  Цена на видеодомофон для квартиры https://ats-mxm.ru/katalog/provodnye-telefonnye-apparaty/telefonnyj-apparat-telta-2125-tsb\r\n \r\nЕсли говорить о стоимости электроники, то преобретать лучше надежный видеодомофон, который прослужит верой и правдой не один год - такие устройства есть даже среди недорогих моделей https://ats-mxm.ru/katalog/kabeli/skynet-utp2-cat-5e-305m-cu\r\n \r\nот 3 шт https://ats-mxm.ru/resheniya/osnovnye-funktsionalnye-vozmozhnosti-mini-ats\r\n  20350 ?', '83.217.213.120', '2025-07-22 04:05:39', 0, 0, NULL, NULL);
INSERT INTO `contact_submissions` (`id`, `first_name`, `last_name`, `email`, `phone`, `subject`, `message`, `ip_address`, `submission_date`, `is_read`, `is_responded`, `response_notes`, `response_date`) VALUES
(36, 'NormandRiz', 'NormandRizCW', 'yourmail344@gmail.com', '87966324729', 'Human rights violated by Miriam Adelson', 'It\'s unbelievable \r\n\r\nWho are the Jews\r\n\r\nhttps://www.youtube.com/shorts/SEB3w3A98rU\r\n\r\nit is our money\r\n\r\nhttps://www.youtube.com/shorts/wiu9N1H0Huc\r\n\r\nThe most devastating genocide in the world is being carried out by the follwoing :\r\n\r\n1- AIPAC, brows ( https://www.youtube.com/watch?v=COx-t-Mk6UA ). \r\n2- Miriam Adelson brows https://www.youtube.com/watch?v=Nr0LkA7VW7Q.\r\n3- Elon Musk. \r\n3- Timothy mellonand brows https://www.youtube.com/shorts/1XJ893-kAh0  \r\n4-The Evangelical Church, \r\n\r\nWhich kill innocent women and children in Gaza.\r\n\r\nAIPAC, The Evangelical Church, Miriam Adelson, Elon Musk, and timothy mellon and   America tax payer provided Israel with TNT (explosives) for their GENOCIDE.\r\n\r\nGaza has been declared a disaster area and lacks essential resources for living in it, as follows.\r\n\r\nAIPAC, The Evangelical Church, Miriam Adelson, Elon Musk, and timothy mellon and   America tax payer, help Israel destroyed 90% of Gaza, destroying 437,600 homes, and killing one million people, including 50 thousand who are currently under rubble, 80% of whom are women and children. \r\n\r\nAIPAC, The Evangelical Church, Miriam Adelson, Elon Musk, and timothy mellon and   America tax payer, make Israel destroyed 330,000 meters of water pipes, resulting in people not being able to drink water. \r\n\r\nAIPAC, The Evangelical Church, Miriam Adelson, Elon Musk, and timothy mellon and   America tax payer, help Israel destroyed more than 655,000 meters of underground sewer lines. Now people have no washrooms to use. \r\n\r\nAIPAC, The Evangelical Church, Miriam Adelson, Elon Musk, and timothy mellon and   America tax payer, make Israel destroyed 2,800,000 two million eight hundred thousand meters of roads, causing people to have no roads to use. \r\n\r\nAIPAC, The Evangelical Church, Miriam Adelson, Elon Musk, and timothy mellon and   America tax payer, make Israel have destroyed 3680 km of electric grid, which has caused people to lose electricity. \r\n\r\nAIPAC, The Evangelical Church, Miriam Adelson, Elon Musk, and timothy mellon and   America tax payer, and Israel destroyed 48 hospitals and leveled them to the ground. Now, no one will have a hospital to save their lives. \r\n\r\nAIPAC, The Evangelical Church, Miriam Adelson, Elon Musk, and timothy mellon and   America tax payer, and Israel destroyed over 785,000 students\' ability to attend school and learn. Their actions resulted in the complete destruction of 494 schools and universities, many of which were destroyed by bombing. \r\n\r\nAIPAC, The Evangelical Church, Miriam Adelson, Elon Musk, and timothy mellon and   America tax payer, and Israel destroyed 981 mosques to prevent homless people from asking God for help. \r\n\r\nAIPAC, The Evangelical Church, Miriam Adelson, Elon Musk, and timothy mellon and   America tax payer have made over 39000 small children orphans and left them without parents or relatives to care for them.\r\n \r\nThere has never been a war in history where 80% of the country has been destroyed, 100% of the population has been displaced, and 50% of the deaths are children. \r\n\r\nDon\'t hesitate to call it what it is\r\n\r\nAIPAC ( https://www.youtube.com/watch?v=COx-t-Mk6UA ) and The Evangelical Church (America) are creating a GENOCIDE.\r\n\r\nhttps://www.youtube.com/shorts/IrX9v6DKH1g\r\n\r\nsee why Israel can kill innocent children with American taxpayer money\r\n\r\n1- see Why Israel is in deep trouble \r\n\r\nhttps://www.youtube.com/watch?v=kAfIYtpcBxo\r\n\r\n2- Because the God of Money of our World is a Jew who supports and lives in Israel. For more details, click on the following link.\r\n\r\nhttps://mega.nz/file/FqhzGKbB#bsX4PD-O59HEA0-rynD29xkk47dmddycY5CjZfoDLYg\r\n\r\n3- Because what USA president say about AIPAC and  The Evangelical Church (America)\r\n https://www.tiktok.com/@thefearlessqueenmel/video/7307640994579680542?lang=en&q=why%20dont%20Americans%20knowl%20what%20you%20have%20seen%20&t=1701880206555\r\n\r\nSee how innocent children are killed by the most powerful Israeli using American bombs at\r\n\r\nAl Jazeera Arabic Live\r\n\r\nat\r\n\r\nhttps://www.youtube.com/watch?v=COx-t-Mk6UA\r\n\r\nWatch the real news at\r\n\r\nhttps://www.youtube.com/watch?v=bNyUyrR0PHo\r\n\r\nLaws of jews TaurÃ£t (Torah) wich is a part of the Bible\r\n \r\nWe ordained in TaurÃ£t for them: â€œA life for a life, an eye for an eye, a nose for a nose, an ear for an ear, a tooth for a tooth and for a wound an equal retaliation.\" \r\n\r\nThe Torah, which is part of the Bible, has commanded that the same be done to the Jews. The order of the Torah, which is part of the Bible, is to immediately kill any Jew you see on the street. Since the Jews in Gaza have also killed women and children, you should kill any Jews - men, women, and children - as soon as you see them, whether on the street or anywhere else. And because they have killed everyone in Gaza without mercy, you must do the same to them. If you carry out these actions, you will be following the order of the Torah, which is part of the Bible, and you will be rewarded by going to heaven.', '128.90.163.13', '2025-07-22 20:46:58', 0, 0, NULL, NULL),
(37, 'Flexiblevvi', 'zwusalmeamftxqfGP', 'hanshih@potatoprodvctions.com', '88888956691', 'Particularly good handwriting', 'Middle Ages as in Western', '46.105.73.207', '2025-07-22 23:19:14', 0, 0, NULL, NULL),
(38, 'Bryandom', 'BryandomLF', 'yandex_market@anonmails.de', '83389146386', 'Откройте для себя выгодные предложения Яндекс Маркета с промокодом WOW500 или LOOK500', 'Уважаемый(ая) друг, \r\n \r\nРады сообщить, что на платформе Яндекс Маркет запущена масштабная распродажа с специальными предложениями для наших клиентов. \r\n \r\nВоспользуйтесь уникальным промокодом WOW500 или LOOK500, чтобы получить скидку 500 рублей на любую покупку. \r\n \r\nДля участия в акции следует: \r\n \r\nПосетить платформу Яндекс Маркет \r\n \r\nДобавить товары в корзину \r\n \r\nВвести код WOW500 или LOOK500 для скидки \r\n \r\nРекомендуем воспользоваться акцией как можно скорее. \r\n \r\nПри необходимости наши консультанты готовы оказать помощь. \r\n \r\nЦеним ваше сотрудничество. \r\n \r\nС уважением. \r\nЖдём. \r\n \r\nПереходи в Телеграмм бота и получай все скидки Яндекс Маркет - https://t.me/YandexMArket002_bot \r\nЧтобы отписаться от рассылки кликни - https://vk.com/away.php?to=https%3A%2F%2Fvkreditke.ru%2Ftv.php&utf=1', '77.83.84.240', '2025-07-24 02:50:38', 0, 0, NULL, NULL),
(39, 'Sean', 'Hicks', 'seanhicks@dominate-keywords.com', '8054002077', 'Dominate-Keywords', 'I am not offering to you SEO, nor Pay Per Click Advertising.\r\nThis is something completely different.\r\nJust send us keywords of your interest and your website banner instantly appears number one on Google and Bing search results without Pay Per Click charges.\r\nLet me show you how it works and you will be pleasantly surprised by the results.', '132.255.133.229', '2025-07-25 05:54:18', 0, 0, NULL, NULL),
(40, 'Mike Matheus Hoffmann', 'Mike Matheus Hoffmann\r\nRD', 'info@strictlydigital.net', '86119799264', 'Semrush links for virungaecotours.com', 'Hello, \r\n \r\nReceiving some set of links pointing to virungaecotours.com might bring no value or worse for your business. \r\n \r\nIt really isn’t important the number of external links you have, what is key is the total of search terms those platforms rank for. \r\n \r\nThat is the most important thing. \r\nNot the fake third-party metrics or SEO score. \r\nAnyone can manipulate those. \r\nBUT the volume of high-traffic search terms the sites that send backlinks to you rank for. \r\nThat’s it. \r\n \r\nMake sure these backlinks redirect to your site and your rankings will skyrocket! \r\n \r\nWe are offering this special service here: \r\nhttps://www.strictlydigital.net/product/semrush-backlinks/ \r\n \r\nNeed more details, or want clarification, message us here: \r\nhttps://www.strictlydigital.net/whatsapp-us/ \r\n \r\nBest regards, \r\nMike Matheus Hoffmann\r\n \r\nstrictlydigital.net \r\nPhone/WhatsApp: +1 (877) 566-3738', '37.19.223.110', '2025-07-26 07:48:51', 0, 0, NULL, NULL),
(41, 'kyzaijpkj', 'kyzaijpkj', 'lundbeck@brandshield.com', '81775211255', 'Top Link Providers for Gambling Websites', 'Top Link Providers for Gambling Websites \r\n<a href=https://pelmeds.com/wp-content/uploads/2024/08/jpg/clenbuterol.html>BEST LINKS FOR GAMBLING! suncitywestdental.com/ BEST LINKS FOR GAMBLING! TELEGRAM @the_telegraf</a> \r\nBEST LINKS FOR GAMBLING! \r\n<a href=https://pelmeds.com/wp-content/uploads/2024/08/jpg/clenbuterol.html>BEST LINKS FOR GAMBLING!  www.fortworthmillerdental.com BEST LINKS FOR GAMBLING! TELEGRAM @happygrannypies</a> \r\n<a href=https://pelmeds.com/wp-content/uploads/2024/08/jpg/clenbuterol.html>BEST LINKS FOR GAMBLING!  www.huroncoastdental.com BEST LINKS FOR GAMBLING! TELEGRAM @happygrannypies</a> \r\nBEST LINKS FOR GAMBLING! \r\n<a href=\"https://pelmeds.com/wp-content/uploads/2024/08/jpg/clenbuterol.html\">BEST LINKS FOR GAMBLING!  www.danapricedental.com BEST LINKS FOR GAMBLING! TELEGRAM @happygrannypies</a>', '184.181.217.201', '2025-07-26 08:54:39', 0, 0, NULL, NULL),
(42, 'RobertRon', 'NoahRonGM', 'abuse@registry.godaddy', '83511751474', 'Hallo,   writing about your   price for reseller', 'Ciao, volevo sapere il tuo prezzo.', '185.39.19.47', '2025-07-26 19:56:06', 0, 0, NULL, NULL),
(43, 'RobertRon', 'JuanRonGM', 'Gemma@registry.godaddy', '86717815682', 'Hi, i wrote about your the price', 'Hi, I wanted to know your price.', '185.39.19.47', '2025-07-26 19:57:28', 0, 0, NULL, NULL),
(44, 'RobertRon', 'EdwardRonGM', 'help@registry.godaddy', '89256423594', 'Aloha, i am wrote about     prices', 'Здравейте, исках да знам цената ви.', '185.39.19.47', '2025-07-26 20:00:35', 0, 0, NULL, NULL),
(45, 'RobertRon', 'JeremyRonGM', 'iana@registry.godaddy', '89325719938', 'Hello    write about   the price', 'Ola, quería saber o seu prezo.', '185.39.19.47', '2025-07-26 20:13:50', 0, 0, NULL, NULL),
(46, 'RobertRon', 'CarlRonGM', 'reg-abuse@registry.godaddy', '84472346344', 'Aloha    write about your the price', 'Sawubona, bengifuna ukwazi intengo yakho.', '185.39.19.47', '2025-07-26 20:13:50', 0, 0, NULL, NULL),
(47, 'RobertRon', 'AaronRonGM', 'financial.attache@kr.slembassy.gov.sl', '83451237466', 'Hi, i writing about your the price', 'Dia duit, theastaigh uaim do phraghas a fháil.', '185.39.19.47', '2025-07-26 20:25:43', 0, 0, NULL, NULL),
(48, 'RobertRon', 'RandyRonGM', 'financial.attache@kr.slembassy.gov.sl', '85692774511', 'Aloha, i am write about     price for reseller', 'Salam, qiymətinizi bilmək istədim.', '185.39.19.47', '2025-07-26 20:31:18', 0, 0, NULL, NULL),
(49, 'Bryandom', 'BryandomLF', 'yandex_market@anonmails.de', '83362972726', 'Получите дополнительную скидку на Яндекс Маркете с промокодом WOW500 или LOOK500', 'Уважаемый(ая) покупатель, \r\n \r\nИмеем честь уведомить, что на платформе Яндекс Маркет началась масштабная распродажа с специальными предложениями для наших клиентов. \r\n \r\nВоспользуйтесь уникальным промокодом WOW500 или LOOK500, чтобы активировать скидку 500 рублей на при оформлении заказа. \r\n \r\nДля участия в акции достаточно: \r\n \r\nЗайти на Яндекс Маркет \r\n \r\nВыбрать товары по вашему вкусу \r\n \r\nИспользовать промокод WOW500 или LOOK500 для получения скидки \r\n \r\nПросим учитывать, что предложение ограничено во времени. \r\n \r\nЕсли понадобится помощь, мы всегда на связи. \r\n \r\nЦеним ваше сотрудничество. \r\n \r\nС уважением. \r\nЖдём. \r\n \r\nПереходи в Телеграмм бота и получай все скидки Яндекс Маркет - https://t.me/YandexMArket002_bot \r\nЧтобы отписаться от рассылки кликни (ссылка сработает только с мобильных телефонов)-https://vk.com/away.php?to=https%3A%2F%2Fvkreditke.ru%2Ftv.php&utf=1', '194.156.123.14', '2025-07-27 01:26:03', 0, 0, NULL, NULL),
(50, 'RobertRon', 'EugeneRonGM', 'abuse@basailpaurashava.gov.bd', '88475533862', 'Hallo,   wrote about   the prices', 'Xin chào, tôi muốn biết giá của bạn.', '185.39.19.47', '2025-07-27 03:42:42', 0, 0, NULL, NULL),
(51, 'RobertRon', 'DonaldRonGM', 'abuse@basailpaurashava.gov.bd', '83234515471', 'Hallo, i wrote about     price for reseller', 'Hæ, ég vildi vita verð þitt.', '185.39.19.47', '2025-07-27 03:42:42', 0, 0, NULL, NULL),
(52, 'RobertRon', 'ThomasRonGM', 'davide.bacciardi@poliziadistato.it', '88362322815', 'Hello, i am write about     prices', 'Hi, kam dashur të di çmimin tuaj', '185.39.19.47', '2025-07-27 03:42:42', 0, 0, NULL, NULL),
(53, 'RobertRon', 'AlanRonGM', 'registry-help@registry.godaddy', '88119815822', 'Hallo  i am write about   the prices', 'Szia, meg akartam tudni az árát.', '185.39.19.47', '2025-07-27 03:42:42', 0, 0, NULL, NULL),
(54, 'RobertRon', 'NoahRonGM', 'financial.attache@kr.slembassy.gov.sl', '89428826563', 'Hallo  i write about your the price for reseller', 'Γεια σου, ήθελα να μάθω την τιμή σας.', '185.39.19.47', '2025-07-27 03:42:42', 0, 0, NULL, NULL),
(55, 'RobertRon', 'RussellRonGM', 'Gemma@registry.godaddy', '86529112442', 'Hi,   write about your the price for reseller', 'Sveiki, es gribēju zināt savu cenu.', '185.39.19.47', '2025-07-27 03:50:41', 0, 0, NULL, NULL),
(56, 'RobertRon', 'BillyRonGM', 'abuse@registry.godaddy', '87228178361', 'Hi  i am write about your the prices', 'Hi, roeddwn i eisiau gwybod eich pris.', '185.39.19.47', '2025-07-27 03:50:41', 0, 0, NULL, NULL),
(57, 'Cikolia', 'GenaCikolia', 'cikoliag@yandex.ru', '83157578578', 'Распродажа склада электрика и водопровод', 'Здравствуйте! \r\nПередайте вашему электрику или инженеру. \r\nУ нас в наличии на складе 7000 наименований электрики и деталей водопровода. \r\nВ наличии 500 брендов европейский и российских компани производителей. \r\nЦены в два, три раза ниже рыночных. \r\nИз за санкций, в Россию не поставляют эту продукцию уже 3 года. \r\nНаш запас на складе, является уникальным и сохранился в России совершенно случайно. \r\nНаш интернет магазин. cikolia.ru \r\nТелефон: +7(985)767-04-21 Геннадий.', '178.20.47.80', '2025-07-28 18:06:35', 0, 0, NULL, NULL),
(58, 'Alex Amin', 'Alex AminNQ', 'alexamin4x4@gmail.com', '85799969762', 'Exclusive Investment Opportunity', 'Greetings, \r\n \r\nI hope you’re doing well. We are reaching out to explore potential partnerships with business executives interested in exclusive, high-value investment opportunities. \r\n \r\nOur network comprises established high-net-worth individuals (HNWIs) from Russia and the Middle East, seeking collaborative ventures with trusted partners. The specifics of the opportunity, including investment size and terms, can be shared upon further discussion under strict confidentiality. \r\n \r\nWe would welcome the chance to discuss further at your convenience. \r\n \r\nBest regards, \r\nAlex Amin \r\nEmail: infinitycapitalmru@gmail.com', '87.249.132.183', '2025-07-29 04:33:40', 0, 0, NULL, NULL),
(59, 'NormandRiz', 'NormandRizCW', 'yourmail344@gmail.com', '83252775476', 'Elon Musk is committing a GENOCIDE', 'It is astonishing.\r\n\r\nWho are the Jews\r\n\r\nhttps://www.youtube.com/shorts/SEB3w3A98rU\r\n\r\nit is our money\r\n\r\nhttps://www.youtube.com/shorts/wiu9N1H0Huc\r\n\r\nThe most devastating genocide in the world is being carried out by the follwoing :\r\n\r\n1- AIPAC, brows ( https://www.youtube.com/watch?v=COx-t-Mk6UA ). \r\n2- Miriam Adelson brows https://www.youtube.com/watch?v=Nr0LkA7VW7Q.\r\n3- Elon Musk. \r\n3- Timothy mellonand brows https://www.youtube.com/shorts/1XJ893-kAh0  \r\n4-The Evangelical Church, \r\n\r\nWhich kill innocent women and children in Gaza.\r\n\r\nAIPAC ( https://www.youtube.com/watch?v=COx-t-Mk6UA ) and the Evangelical Church are implicated in one of the most devastating genocides in history, targeting innocent women and children in Gaza.\r\n\r\nThese organizations have provided Israel with explosives to enable their genocidal actions.\r\n\r\nGaza has been declared a disaster zone, severely lacking in vital resources necessary for survival.\r\n\r\nAIPAC, The Evangelical Church, Miriam Adelson, Elon Musk, and timothy mellon and   America tax payer,, and Israel have ravaged 90% of Gaza, leading to the destruction of 437,600 homes and the loss of one million lives, including 50,000 individuals currently trapped under rubble, with 80% of the casualties being women and children.\r\n\r\nThey have also destroyed 330,000 meters of water pipelines, leaving the population without access to potable water.\r\n\r\nFurthermore, over 655,000 meters of underground sewage systems have been devastated, depriving residents of essential sanitation facilities.\r\n\r\nThe destruction encompasses 2,800,000 meters of roadways, making transportation impossible for the affected population.\r\n\r\nAdditionally, 3,680 kilometers of the electrical grid have been dismantled, resulting in widespread power outages.\r\n\r\nThe assault has led to the demolition of 48 hospitals, eliminating crucial healthcare facilities for those in need.\r\n\r\nMoreover, the actions of AIPAC, The Evangelical Church, Miriam Adelson, Elon Musk, and timothy mellon and   America tax payer,, and Israel have disrupted the education of over 785,000 students, with 494 schools and universities being completely destroyed, many as a result of aerial bombardments.\r\n\r\nThey have also targeted 981 mosques, effectively suppressing the prayers of the homeless who seek divine assistance.\r\n\r\nConsequently, over 39,000 young children have been left orphaned, lacking parents or guardians to provide care.\r\n\r\nIt is important to highlight that the historical context of warfare has never seen a situation where 80% of a nation has been devastated, 100% of its population has been displaced, and 50% of the casualties are children.\r\n\r\nRecognizing the seriousness of this situation is imperative.\r\n\r\nOrganizations such as AIPAC and the Evangelical Church in America are contributing to what can only be characterized as genocide.\r\n\r\nhttps://www.youtube.com/shorts/IrX9v6DKH1g\r\n\r\nThe implications of American taxpayer funding in relation to Israel\'s actions against innocent children are concerning.\r\n\r\n1. A thorough examination of Israel\'s precarious circumstances is necessary.\r\nhttps://www.youtube.com/watch?v=kAfIYtpcBxo\r\n\r\n2. The impact of financial influence, often linked to specific groups, significantly affects these dynamics. Additional information can be accessed through the provided link.\r\n\r\nhttps://mega.nz/file/FqhzGKbB#bsX4PD-O59HEA0-rynD29xkk47dmddycY5CjZfoDLYg\r\n\r\n3. Insights into the views of U.S. leadership regarding AIPAC and the Evangelical Church can be investigated through the following resource.\r\n\r\nhttps://www.tiktok.com/@thefearlessqueenmel/video/7307640994579680542?lang=en&q=why%20dont%20Americans%20knowl%20what%20you%20have%20seen%20&t=1701880206555\r\n\r\nThe heartbreaking reality of innocent children suffering at the hands of powerful Israeli forces using American weaponry is evident in numerous media reports.\r\n\r\nhttps://www.youtube.com/watch?v=COx-t-Mk6UA\r\n\r\nIt is essential to remain informed by consulting trustworthy news sources.\r\n\r\nhttps://www.youtube.com/watch?v=bNyUyrR0PHo\r\n\r\nLaws of jews TaurÃ£t (Torah) wich is a part of the Bible\r\n \r\nWe ordained in TaurÃ£t for them: â€œA life for a life, an eye for an eye, a nose for a nose, an ear for an ear, a tooth for a tooth and for a wound an equal retaliation.\" \r\n\r\nThe Torah, which is part of the Bible, has commanded that the same be done to the Jews. The order of the Torah, which is part of the Bible, is to immediately kill any Jew you see on the street. Since the Jews in Gaza have also killed women and children, you should kill any Jews - men, women, and children - as soon as you see them, whether on the street or anywhere else. And because they have killed everyone in Gaza without mercy, you must do the same to them. If you carry out these actions, you will be following the order of the Torah, which is part of the Bible, and you will be rewarded by going to heaven.', '31.6.41.1', '2025-07-30 03:22:13', 0, 0, NULL, NULL),
(60, 'Mike Karl-Erik Thomas', 'Mike Karl-Erik Thomas\r\nSK', 'info@speed-seo.net', '89124676756', 'Find virungaecotours.com SEO Issues totally free', 'Hi, \r\nWorried about hidden SEO issues on your website? Let us help — completely free. \r\nRun a 100% free SEO check and discover the exact problems holding your site back from ranking higher on Google. \r\n \r\nRun Your Free SEO Check Now \r\nhttps://www.speed-seo.net/check-site-seo-score/ \r\n \r\nOr chat with us and our agent will run the report for you: https://www.speed-seo.net/whatsapp-with-us/ \r\n \r\nBest regards, \r\n \r\n \r\nMike Karl-Erik Thomas\r\n \r\nSpeed SEO Digital \r\nEmail: info@speed-seo.net \r\nPhone/WhatsApp: +1 (833) 454-8622', '138.199.36.194', '2025-07-31 03:01:15', 0, 0, NULL, NULL),
(61, 'Mike Dominique Jones', 'Mike Dominique Jones\r\nMJ', 'mike@monkeydigital.co', '82848751271', 'Boost Your Website Traffic with Targeted Social Ads – Only $10 for 10K Visits!', 'Hi there, \r\n \r\nI wanted to check in with something that could seriously help your website’s reach. We work with a trusted ad network that allows us to deliver real, location-based social ads traffic for just $10 per 10,000 visits. \r\n \r\nThis isn\'t junk clicks—it’s real visitors, tailored to your target country and niche. \r\n \r\nWhat you get: \r\n \r\n10,000+ genuine visitors for just $10 \r\nLocalized traffic for any country \r\nLarger traffic packages available based on your needs \r\nTrusted by SEO experts—we even use this for our SEO clients! \r\n \r\nReady to scale? Check out the details here: \r\nhttps://www.monkeydigital.co/product/country-targeted-traffic/ \r\n \r\nOr connect instantly on WhatsApp: \r\nhttps://monkeydigital.co/whatsapp-us/ \r\n \r\nLet\'s get started today! \r\n \r\nBest, \r\nMike Dominique Jones\r\n \r\nPhone/whatsapp: +1 (775) 314-7914', '151.106.8.43', '2025-08-01 00:10:26', 0, 0, NULL, NULL),
(62, 'Valeron83tax', 'Valeron83taxXM', 'romabookim@gmail.com', '81781967371', 'Dive into the Realm of Online Casinos: Bonuses and Free Play Beckon!', 'Step into the thrilling arena of online casinos, where every spin brings anticipation and chance! New players are offered fantastic no-deposit bonuses, including 25вЂ“50 spins just for registering, while deposit bonuses as high as 100вЂ“200% boost your start, like those at Vavada. Try free play in demo mode, exploring colorful slots from Microgaming or roulette strategies without risking a cent. Cashback and free spins add extra thrill, prolonging your gaming experience. Be sure to review the bonus wagering terms and dive into safe gambling on licensed platforms!  https://tinyurl.com/5986h8bf', '185.81.125.166', '2025-08-01 09:18:12', 0, 0, NULL, NULL),
(63, 'Angelokak', 'AngelokakCJ', 'parmazanov@gmail.com', '81325975798', 'Ваши системы видеонаблюдения', 'Прежде всего, важно разобраться, что именно представляет собой бренд Trassir. Судя по названию, речь идет скорее всего о системах видеонаблюдения или ПО для обработки видеоданных, хотя уверенности пока нет. Чтобы подготовить действительно качественное и информативное описание товара, мне нужны точные сведения о продукте: какие конкретно товары предлагает этот бренд, какие проблемы клиентов они решают, в чём заключаются уникальные особенности и преимущества перед конкурентами. Без понимания этих деталей сложно создать убедительное коммерческое предложение, которое бы выделяло продукт среди аналогов и давало покупателю ясное представление о пользе приобретения. Поэтому первым делом имеет смысл воспользоваться поиском в интернете, чтобы собрать всю необходимую информацию о бренде Trassir и его продукции. \r\nundefined \r\n Теперь у меня есть общее понимание о бренде <a href=https://trassir-expert.ru/>Trassir</a> — это российская компания, специализирующаяся на разработке и производстве систем видеонаблюдения. Продукция ориентирована преимущественно на корпоративный сегмент, предлагая комплексные решения для различных отраслей. Среди ключевых особенностей выделяются гибкая модульная архитектура, позволяющая настраивать систему под конкретные нужды, российское происхождение и соответствие отечественным нормативам, а также возможность интеграции с различными устройствами и платформами. Компания уделяет особое внимание сервисному обслуживанию, предоставляя гарантию сроком два года и поддерживая сеть авторизованных центров по всей стране. Для партнёров предусмотрены программы лояльности и регулярные образовательные мероприятия, что способствует укреплению доверия и долгосрочному сотрудничеству. \r\n \r\nОднако имеющейся информации недостаточно, чтобы составить полноценное и привлекательное описание продукта. Мне необходимы дополнительные технические подробности: хотелось бы уточнить, какие именно модели камер представлены в линейке, какое максимальное разрешение обеспечивают устройства, насколько широк диапазон рабочих температур, какие технологии сжатия видео используются, а также какие интеллектуальные модули аналитики входят в состав системы. Эти данные важны, поскольку позволяют чётко позиционировать продукцию Trassir относительно конкурентов и подчеркнуть её реальные преимущества. Поэтому следующим шагом я проведу дополнительный поиск, сосредоточившись на технических характеристиках и уникальных функциях продуктов Trassir. \r\nundefined \r\n Собрав подробную информацию о бренде <a href=https://trassir-expert.ru/>Trassir tr</a>, я теперь хорошо понимаю, почему эта компания занимает лидирующие позиции на рынке систем видеонаблюдения. Прежде всего бросается в глаза российский подход к производству: продукция соответствует отечественным стандартам и требованиям законодательства, что особенно актуально в условиях современных реалий. Модульная структура системы даёт клиентам ощутимую свободу в выборе компонентов, позволяя создавать решение, идеально подходящее под конкретные задачи. Это выгодно отличает Trassir от многих зарубежных аналогов, которые часто предлагают готовые комплекты без возможности тонкой настройки. \r\n \r\nЕщё одно важное преимущество — широкий спектр возможностей видеоаналитики, основанной на нейросетях. Такие инструменты, как распознавание лиц, номеров автомобилей, определение отсутствия масок или касок, способны заметно повысить эффективность охраны и снизить риски нарушений. Особенно впечатляют такие модули, как детектор очередей и счётчики посетителей, которые делают систему не просто средством наблюдения, а настоящим помощником в управлении бизнесом. \r\n \r\nТакже нельзя обойти вниманием развитую инфраструктуру поддержки: двухлетняя гарантия, сервисные центры по всей России и квалифицированная помощь инженеров на всех этапах внедрения внушают доверие и снимают опасения по поводу возможных сложностей в эксплуатации. Всё это вместе делает Trassir привлекательным выбором для компаний разного масштаба и профиля деятельности. \r\n \r\nТеперь, имея полную картину преимуществ и особенностей бренда, я готов приступить к написанию описания, которое подчеркнёт ключевые достоинства Trassir и сделает акцент на тех аспектах, которые наиболее ценны для потенциальных покупателей. \r\n \r\n## ?? **Система видеонаблюдения <a href=https://trassir-expert.ru/>Trassir tr</a>: Безопасность, Контроль и Эффективность** \r\n \r\n### ?? Что такое <a href=https://trassir-expert.ru/>Trassir</a>? \r\nv**Trassir** — это российский производитель инновационных систем видеонаблюдения, предлагающий современные решения для комплексной безопасности предприятий и организаций различного масштаба. Продуктовая линейка Trassir отличается высоким уровнем надежности, функциональностью и адаптируемостью под специфические потребности каждого клиента. \r\n \r\n-v-- \r\n \r\n### ??<a href=https://trassir-expert.ru/> Основные компоненты системы</a> <a href=https://trassir-expert.ru/>Trassir tr</a> \r\nСердцем системы является **нейросетевой IP-видеорегистратор**, способный обрабатывать до 128 IP-камер с разрешением без ограничений. Ключевые характеристики: \r\n \r\n- **Поддержка стандартов**: H.265, H.265+, H.264, MPEG4, MJPEG. \r\n- **Производительность**: входящая и исходящая пропускная способность до 720 Мбит/с. \r\n- **Хранение данных**: поддерживает установку до 8 жёстких дисков общей емкостью до 16 ТБ. \r\n- **Интерфейсы**: 2 порта Gigabit Ethernet, выходы HDMI, DVI-D, DisplayPort с поддержкой разрешения до 4K. \r\n- **Температурный режим**: устойчив к работе в диапазоне от +10°C до +30°C. \r\n \r\n--- \r\n \r\n### ?? Какие проблемы решает <a href=https://trassir-expert.ru/>Trassir tr</a>? \r\nСистема Trassir помогает решать целый ряд актуальных задач современного бизнеса: \r\n \r\n- **Повышение безопасности**: своевременное выявление угроз, предотвращение краж и мошеннических действий. \r\n- **Оптимизация процессов**: контроль рабочего процесса, повышение эффективности труда сотрудников. \r\n- **Управление рисками**: мониторинг соблюдения норм охраны труда и пожарной безопасности. \r\n- **Улучшение клиентского опыта**: отслеживание очередей, оценка загруженности торговых точек. \r\n \r\n--- \r\n \r\n### ?? Умная видеоаналитика на основе нейросетей \r\nОдним из главных достоинств <a href=https://trassir-expert.ru/>Trassir</a> является уникальная платформа видеоаналитики, использующая мощные алгоритмы машинного обучения: \r\n \r\n| Модуль                        | Функция                                                                              | \r\n|-------------------------------|--------------------------------------------------------------------------------------| \r\n| **Human Detector**            | Определение присутствия людей в заданной зоне                                        | \r\n| **Face Recognition**          | Распознавание и идентификация лиц                                                    | \r\n| **AutoTRASSIR**               | Автоматическое распознавание автомобильных номеров                                   | \r\n| **Queue Detector**            | Мониторинг очередей и длина ожидания                                                 | \r\n| **Crowd Detector**            | Фиксация скоплений людей                                                             | \r\n| **Face Mask Detector**        | Контроль наличия защитных масок                                                      | \r\n| **Social Distance Detector**  | Соблюдение социальной дистанции                                                       | \r\n| **Hardhat Detector**          | Проверка наличия защитных касок                                                     | \r\n| **Wear Detector**             | Контроль специальной формы и экипировки                                             | \r\n| **Neuro Counter**             | Подсчет посетителей и транспортных средств                                           | \r\n \r\nЭти модули позволяют минимизировать человеческий фактор и обеспечить максимальную точность мониторинга. \r\n \r\n--- \r\n \r\n### ??? Надежность и удобство использования \r\nКомпания <a href=https://trassir-expert.ru/>Trassir</a> гарантирует высокое качество своей продукции и поддержку на всех этапах сотрудничества: \r\n \r\n- **Гарантия 2 года** с возможностью продления. \r\n- **Сервисные центры по всей России** с сертифицированными специалистами. \r\n- **Индивидуальная техническая поддержка** и консультации квалифицированных инженеров. \r\n- **Простота установки и настройки** благодаря интуитивно понятному интерфейсу программного обеспечения. \r\n \r\n--- \r\n \r\n### ?? Преимущества для бизнеса \r\nИспользование систем <a href=https://trassir-expert.ru/>Trassir</a> приносит бизнесу реальную пользу: \r\n \r\n- **Экономия затрат**: снижение убытков от краж и ошибок персонала. \r\n- **Рост производительности**: эффективный контроль бизнес-процессов. \r\n- **Безопасность сотрудников и клиентов**: постоянный мониторинг опасных ситуаций. \r\n- **Легкость масштабирования**: простая интеграция новых устройств и расширение существующих систем. \r\n \r\n--- \r\n \r\n### ?? Цифры и факты \r\n- Более **1000 успешных проектов** реализовано по всей территории России. \r\n- До **99% точности** распознавания автомобильных номеров. \r\n- Возможность хранения видеозаписей объемом до **16 Терабайт**. \r\n- Время отклика системы менее **1 секунды** на критически важные события. \r\n \r\n--- \r\n \r\n### ? Почему выбирают <a href=https://trassir-expert.ru/> Trassir</a>? \r\n- Российское производство, соответствующее государственным стандартам. \r\n- Широкий выбор готовых и кастомных решений. \r\n- Постоянное обновление и развитие платформы. \r\n- Лучшее соотношение цены и качества на российском рынке. \r\n \r\n--- \r\n \r\n### ?? Заключение \r\nСистема видеонаблюдения <a href=https://trassir-expert.ru/>Trassir</a> — это надежный партнер вашего бизнеса, обеспечивающий круглосуточную защиту активов, эффективное управление процессами и максимальный комфорт ваших сотрудников и клиентов. Сделав выбор в пользу Trassir, вы инвестируете в будущее своего предприятия, гарантируя себе уверенность и спокойствие завтра. \r\n \r\n?? *Выбирайте лучшее — выбирайте <a href=https://trassir-expert.ru/>Trassir</a>!*', '92.100.50.96', '2025-08-03 03:40:57', 0, 0, NULL, NULL),
(64, 'Mike Miguel Thomas', 'Mike Miguel Thomas\r\nKY', 'mike@monkeydigital.co', '86314592168', 'Collaboration Request', 'Hi, \r\n \r\nThis is Mike from Monkey Digital, \r\nI am contacting you regarding a exciting opportunity. \r\n \r\nHow would you like to place our banners on your platform and redirect via your personalized tracking link towards popular SEO solutions from our platform? \r\n \r\nThis way, you earn a 35% commission, month after month from any transactions that generate from your site. \r\n \r\nThink about it, most website owners require SEO, so this is a massive opportunity. \r\n \r\nWe already have over 12,000 affiliates and our payouts are paid out on time. \r\nLast month, we distributed $27280 in commissions to our affiliates. \r\n \r\nIf this sounds good, kindly message us here: \r\nhttps://monkeydigital.co/affiliates-whatsapp/ \r\n \r\nOr register today: \r\nhttps://www.monkeydigital.co/join-our-affiliate-program/ \r\n \r\nCheers, \r\nMike Miguel Thomas\r\n \r\nPhone/whatsapp: +1 (775) 314-7914', '37.19.223.113', '2025-08-03 23:25:58', 0, 0, NULL, NULL),
(65, 'Raymonddiush', 'RaymonddiushMW', 'raymondKneeway@gmail.com', '89251417197', 'Make your products and services shine with the best advertising!', 'Hey there! virungaecotours.com \r\n \r\nExpand your business lawfully and efficiently with direct proposal submissions. \r\nThis ensures full compliance with data protection regulations, ensuring legitimate and transparent outreach. \r\nSubmitting messages through Contact Forms ensures better deliverability without relying on mass email lists. \r\nCome and give it a try—no hidden fees! \r\nRely on our service to send up to 50,000 messages efficiently. \r\n \r\nThe cost of sending one million messages is $59. \r\n \r\nThis message was automatically generated. \r\n \r\nContact us. \r\nTelegram - https://t.me/FeedbackFormEU \r\nWhatsApp - +375259112693 \r\nWhatsApp  https://wa.me/+375259112693 \r\nWe only use chat for communication.', '185.189.114.117', '2025-08-04 12:08:22', 0, 0, NULL, NULL),
(66, 'RobertRon', 'CharlesRonGM', 'Gemma@registry.godaddy', '81912713637', 'Hi,   write about your the price for reseller', 'Hola, volia saber el seu preu.', '80.94.95.202', '2025-08-05 04:10:40', 0, 0, NULL, NULL),
(67, 'RobertRon', 'JosephRonGM', 'financial.attache@kr.slembassy.gov.sl', '89213683464', 'Hi,   write about     prices', 'Hej, jeg ønskede at kende din pris.', '80.94.95.202', '2025-08-05 04:27:35', 0, 0, NULL, NULL),
(68, 'RobertRon', 'FrankRonGM', 'abuse@basailpaurashava.gov.bd', '85538679187', 'Hi  i wrote about     price for reseller', 'Hi, roeddwn i eisiau gwybod eich pris.', '80.94.95.202', '2025-08-05 04:28:40', 0, 0, NULL, NULL),
(69, 'RobertRon', 'JoseRonGM', 'davide.bacciardi@poliziadistato.it', '88797984931', 'Hallo  i am wrote about your   prices', 'Hi, I wanted to know your price.', '80.94.95.202', '2025-08-05 04:29:26', 0, 0, NULL, NULL),
(70, 'RobertRon', 'DavidRonGM', 'registry-help@registry.godaddy', '88527696489', 'Hello, i am wrote about your   prices', 'Hola, quería saber tu precio..', '80.94.95.202', '2025-08-05 04:57:33', 0, 0, NULL, NULL),
(71, 'RobertRon', 'AaronRonGM', 'reg-abuse@registry.godaddy', '84678911671', 'Hello, i am write about your the prices', 'Ciao, volevo sapere il tuo prezzo.', '80.94.95.202', '2025-08-05 08:56:08', 0, 0, NULL, NULL),
(72, 'RobertRon', 'HaroldRonGM', 'registry-help@registry.godaddy', '86526635613', 'Hi,   write about your   prices', 'Ողջույն, ես ուզում էի իմանալ ձեր գինը.', '80.94.95.202', '2025-08-05 09:11:02', 0, 0, NULL, NULL),
(73, 'RobertRon', 'JesseRonGM', 'davide.bacciardi@poliziadistato.it', '86397169652', 'Hi  i am writing about   the price', 'Salam, qiymətinizi bilmək istədim.', '80.94.95.202', '2025-08-05 09:13:55', 0, 0, NULL, NULL),
(74, 'RobertRon', 'KennethRonGM', 'davide.bacciardi@poliziadistato.it', '83247259569', 'Hello  i am wrote about your   price for reseller', 'Sveiki, es gribēju zināt savu cenu.', '80.94.95.202', '2025-08-05 09:21:29', 0, 0, NULL, NULL),
(75, 'RobertRon', 'DennisRonGM', 'Gemma@registry.godaddy', '86649676415', 'Hallo    writing about your the price', 'হাই, আমি আপনার মূল্য জানতে চেয়েছিলাম.', '80.94.95.202', '2025-08-05 09:57:15', 0, 0, NULL, NULL),
(76, 'Michaelicose', 'MichaelicoseHD', 'southpark@lumexmail.shop', '88515884262', 'Южный Парк 26', 'Всем привет! \r\nМеня зовут Лаврентий и я обожаю смотреть онлайн мультсериал Южный Парк на сайте https://southpark-online.com \r\nТам много интересных серий, которые Вам понравятся. \r\nПрисоединяйтесь!', '156.228.99.141', '2025-08-05 18:20:38', 0, 0, NULL, NULL),
(77, 'NormandRiz', 'NormandRizCW', 'yourmail344@gmail.com', '81235258629', 'End of the Holocaust', 'It is astonishing.\r\n\r\nWho are the Jews\r\n\r\nhttps://www.youtube.com/shorts/SEB3w3A98rU\r\n\r\nit is our money\r\n\r\nhttps://www.youtube.com/shorts/wiu9N1H0Huc\r\n\r\nThe most devastating genocide in the world is being carried out by the follwoing :\r\n\r\n1- AIPAC, brows ( https://www.youtube.com/watch?v=COx-t-Mk6UA ). \r\n2- Miriam Adelson brows https://www.youtube.com/watch?v=Nr0LkA7VW7Q.\r\n3- Elon Musk. \r\n3- Timothy mellonand brows https://www.youtube.com/shorts/1XJ893-kAh0  \r\n4-The Evangelical Church, \r\n\r\nWhich kill innocent women and children in Gaza.\r\n\r\nAIPAC ( https://www.youtube.com/watch?v=COx-t-Mk6UA ) and the Evangelical Church are perpetrating one of the most catastrophic genocides in history, targeting innocent women and children in Gaza.\r\n\r\nThese organizations have supplied Israel with explosives to facilitate their acts of genocide.\r\n\r\nGaza has been designated a disaster zone, severely lacking in essential resources for survival.\r\n\r\nAIPAC, The Evangelical Church, Miriam Adelson, Elon Musk, and timothy mellon and   America tax payer,, and Israel have devastated 90% of Gaza, resulting in the destruction of 437,600 homes and the loss of one million lives, including 50,000 individuals currently trapped under debris, with 80% of the casualties being women and children.\r\n\r\nThey have also obliterated 330,000 meters of water pipelines, leaving the population without access to drinking water.\r\n\r\nFurthermore, over 655,000 meters of underground sewage systems have been destroyed, depriving residents of basic sanitation facilities.\r\n\r\nThe destruction extends to 2,800,000 meters of roadways, rendering transportation impossible for the affected population.\r\n\r\nAdditionally, 3,680 kilometers of the electrical grid have been dismantled, leading to widespread power outages.\r\n\r\nThe assault has resulted in the demolition of 48 hospitals, eliminating critical healthcare facilities for those in need.\r\n\r\nMoreover, the actions of AIPAC, The Evangelical Church, Miriam Adelson, Elon Musk, and timothy mellon and   America tax payer,, and Israel have disrupted the education of over 785,000 students, with 494 schools and universities being completely destroyed, many due to aerial bombardments.\r\n\r\nThey have also targeted 981 mosques, effectively silencing the prayers of the homeless seeking divine assistance.\r\n\r\nAs a result of these actions, more than 39,000 young children have been left orphaned, without parents or guardians to care for them.\r\n\r\nI must emphasize that the historical context of warfare has never witnessed a scenario where 80% of a nation has been devastated, 100% of its populace has been uprooted, and 50% of the casualties are children.\r\n\r\nIt is imperative to recognize the gravity of the situation.\r\n\r\nOrganizations such as AIPAC and the Evangelical Church in America are contributing to what can only be described as genocide.\r\n\r\nhttps://www.youtube.com/shorts/IrX9v6DKH1g\r\n\r\nThe implications of American taxpayer funding in the context of Israel\'s actions against innocent children are alarming.\r\n\r\n1. An examination of Israel\'s precarious situation is warranted.\r\n\r\nhttps://www.youtube.com/watch?v=kAfIYtpcBxo\r\n\r\n2. The influence of financial power, often associated with certain groups, plays a significant role in these dynamics. Further information can be found through the provided link.\r\n\r\nhttps://mega.nz/file/FqhzGKbB#bsX4PD-O59HEA0-rynD29xkk47dmddycY5CjZfoDLYg\r\n\r\n3. Insights into the perspectives of U.S. leadership regarding AIPAC and the Evangelical Church can be explored through the following resource.\r\n\r\n https://www.tiktok.com/@thefearlessqueenmel/video/7307640994579680542?lang=en&q=why%20dont%20Americans%20knowl%20what%20you%20have%20seen%20&t=1701880206555\r\n\r\nThe tragic reality of innocent children being harmed by powerful Israeli forces utilizing American weaponry is evident in various media reports.\r\n\r\nhttps://www.youtube.com/watch?v=COx-t-Mk6UA\r\n\r\nIt is crucial to stay informed by accessing reliable news sources.\r\n\r\nhttps://www.youtube.com/watch?v=bNyUyrR0PHo\r\n\r\nLaws of jews TaurÃ£t (Torah) wich is a part of the Bible\r\n \r\nWe ordained in TaurÃ£t for them: â€œA life for a life, an eye for an eye, a nose for a nose, an ear for an ear, a tooth for a tooth and for a wound an equal retaliation.\" \r\n\r\nThe Torah, which is part of the Bible, has commanded that the same be done to the Jews. The order of the Torah, which is part of the Bible, is to immediately kill any Jew you see on the street. Since the Jews in Gaza have also killed women and children, you should kill any Jews - men, women, and children - as soon as you see them, whether on the street or anywhere else. And because they have killed everyone in Gaza without mercy, you must do the same to them. If you carry out these actions, you will be following the order of the Torah, which is part of the Bible, and you will be rewarded by going to heaven.', '128.90.157.20', '2025-08-06 05:25:28', 0, 0, NULL, NULL),
(78, 'DamonVon', 'DamonVonCF', 'actionvsculture@gmail.com', '83747198821', 'Your choice', '<a href=https://ur3.us/qlskndu7><b>Action</b></a> \r\nOR \r\n<a href=https://ur3.us/aus5zjef><b>Culture</b></a>', '54.37.234.111', '2025-08-09 10:42:04', 0, 0, NULL, NULL),
(79, 'Hermanleari', 'HermanleariLH', 'goldboy1931@gmail.com', '88733155734', 'Cardiline', 'Что такое Cardiline? - https://alev.biz/resources/links-45/cardirin-kupit-natyralnye-kapli-ot-gipertonii/', '93.183.89.12', '2025-08-09 12:24:26', 0, 0, NULL, NULL),
(80, 'IvoryAmapy', 'IvoryAmapySW', 'sergoworkin.g.71.8@gmail.com', '82885656869', 'how to make car interior cleaner at home', '</div>\r\n \r\n<a href=https://inpino.ru>https://inpino.ru</a> \r\n<a href=https://acdiu.ru>https://acdiu.ru</a> \r\n<a href=https://pipetrust.ru>https://pipetrust.ru</a> \r\n<a href=https://service-spec.ru>https://service-spec.ru</a> \r\n<a href=https://tortonet.ru>https://tortonet.ru</a> \r\n<a href=https://bizbg.ru>https://bizbg.ru</a> \r\n<a href=https://100li.ru>https://100li.ru</a> \r\n<a href=https://serviceads.ru>https://serviceads.ru</a> \r\n<a href=https://zrdtest.ru>https://zrdtest.ru</a> \r\n<a href=https://vn365.ru>https://vn365.ru</a> \r\n<a href=https://deroseproject.ru>https://deroseproject.ru</a> \r\n<a href=https://gazcomp.ru>https://gazcomp.ru</a> \r\n<a href=https://telegra.ph/Kak-pravilno-nahodit-nuzhnuyu-informaciyu-na-sajtah-07-08>https://telegra.ph/Kak-pravilno-nahodit-nuzhnuyu-informaciyu-na-sajtah-07-08</a> \r\n \r\n<div class=\"info-block\">', '194.5.53.102', '2025-08-09 14:04:30', 0, 0, NULL, NULL),
(81, 'RobertRon', 'NathanRonGM', 'BSCHULTZ@JACKELEC.COM', '88464184543', 'Hi,   write about     prices', 'Dia duit, theastaigh uaim do phraghas a fháil.', '80.94.95.173', '2025-08-10 02:48:13', 0, 0, NULL, NULL),
(82, 'Mike Dirk De Smet', 'Mike Dirk De Smet\r\nAH', 'info@professionalseocleanup.com', '82637582818', 'Urgent: Toxic Links Found on virungaecotours.com', 'Hi, \r\nWhile reviewing virungaecotours.com, we spotted toxic backlinks that could put your site at risk of a Google penalty. \r\n \r\nWe can clean up your link profile and protect your rankings — all for just $5. \r\n \r\nFix it now before Google does: \r\nhttps://www.professionalseocleanup.com/ \r\n \r\nNeed help or questions? Chat here: \r\nhttps://www.professionalseocleanup.com/whatsapp/ \r\n \r\nBest, \r\nMike Dirk De Smet\r\n \r\n+1 (855) 221-7591 \r\ninfo@professionalseocleanup.com', '37.19.223.205', '2025-08-11 04:58:28', 0, 0, NULL, NULL),
(83, 'RobertRon', 'VincentRonGM', 'davide.bacciardi@poliziadistato.it', '85962283187', 'Aloha, i wrote about your the price for reseller', 'Hi, roeddwn i eisiau gwybod eich pris.', '185.39.19.47', '2025-08-12 22:58:17', 0, 0, NULL, NULL),
(84, 'RobertRon', 'RaymondRonGM', 'sangsko@yahoo.com', '85923867775', 'Hello  i write about   the price', 'Ndewo, achọrọ m ịmara ọnụahịa gị.', '185.39.19.47', '2025-08-12 22:58:17', 0, 0, NULL, NULL),
(85, 'RobertRon', 'VincentRonGM', 'abuse@registry.godaddy', '88279146522', 'Hello,   write about   the price', 'Здравейте, исках да знам цената ви.', '185.39.19.47', '2025-08-12 23:06:02', 0, 0, NULL, NULL),
(86, 'RobertRon', 'StevenRonGM', 'abuse@registry.godaddy', '81818986942', 'Hi,   writing about     prices', 'Sveiki, es gribēju zināt savu cenu.', '185.39.19.47', '2025-08-12 23:06:12', 0, 0, NULL, NULL),
(87, 'RobertRon', 'PaulRonGM', 'Gemma@registry.godaddy', '84562168698', 'Aloha,   wrote about your   price', 'Γεια σου, ήθελα να μάθω την τιμή σας.', '185.39.19.47', '2025-08-12 23:20:08', 0, 0, NULL, NULL),
(88, 'RobertRon', 'JosephRonGM', 'help@registry.godaddy', '83376792182', 'Hallo  i writing about   the prices', 'Hi, kam dashur të di çmimin tuaj', '185.39.19.47', '2025-08-12 23:26:46', 0, 0, NULL, NULL),
(89, 'DamonVon', 'DamonVonCF', 'actionvsculture@gmail.com', '83889221438', 'Your choice', '<a href=https://ur3.us/qlskndu7><b>Action</b></a> \r\nOR \r\n<a href=https://ur3.us/aus5zjef><b>Culture</b></a>', '54.37.234.111', '2025-08-13 00:30:31', 0, 0, NULL, NULL);
INSERT INTO `contact_submissions` (`id`, `first_name`, `last_name`, `email`, `phone`, `subject`, `message`, `ip_address`, `submission_date`, `is_read`, `is_responded`, `response_notes`, `response_date`) VALUES
(90, 'Angelokak', 'AngelokakCJ', 'parmazanov@gmail.com', '89312989779', 'Ваши системы видеонаблюдения', 'Прежде всего, важно разобраться, что именно представляет собой бренд Trassir. Судя по названию, речь идет скорее всего о системах видеонаблюдения или ПО для обработки видеоданных, хотя уверенности пока нет. Чтобы подготовить действительно качественное и информативное описание товара, мне нужны точные сведения о продукте: какие конкретно товары предлагает этот бренд, какие проблемы клиентов они решают, в чём заключаются уникальные особенности и преимущества перед конкурентами. Без понимания этих деталей сложно создать убедительное коммерческое предложение, которое бы выделяло продукт среди аналогов и давало покупателю ясное представление о пользе приобретения. Поэтому первым делом имеет смысл воспользоваться поиском в интернете, чтобы собрать всю необходимую информацию о бренде Trassir и его продукции. \r\nundefined \r\n Теперь у меня есть общее понимание о бренде <a href=https://trassir-expert.ru/>Trassir</a> — это российская компания, специализирующаяся на разработке и производстве систем видеонаблюдения. Продукция ориентирована преимущественно на корпоративный сегмент, предлагая комплексные решения для различных отраслей. Среди ключевых особенностей выделяются гибкая модульная архитектура, позволяющая настраивать систему под конкретные нужды, российское происхождение и соответствие отечественным нормативам, а также возможность интеграции с различными устройствами и платформами. Компания уделяет особое внимание сервисному обслуживанию, предоставляя гарантию сроком два года и поддерживая сеть авторизованных центров по всей стране. Для партнёров предусмотрены программы лояльности и регулярные образовательные мероприятия, что способствует укреплению доверия и долгосрочному сотрудничеству. \r\n \r\nОднако имеющейся информации недостаточно, чтобы составить полноценное и привлекательное описание продукта. Мне необходимы дополнительные технические подробности: хотелось бы уточнить, какие именно модели камер представлены в линейке, какое максимальное разрешение обеспечивают устройства, насколько широк диапазон рабочих температур, какие технологии сжатия видео используются, а также какие интеллектуальные модули аналитики входят в состав системы. Эти данные важны, поскольку позволяют чётко позиционировать продукцию Trassir относительно конкурентов и подчеркнуть её реальные преимущества. Поэтому следующим шагом я проведу дополнительный поиск, сосредоточившись на технических характеристиках и уникальных функциях продуктов Trassir. \r\nundefined \r\n Собрав подробную информацию о бренде <a href=https://trassir-expert.ru/>Trassir tr</a>, я теперь хорошо понимаю, почему эта компания занимает лидирующие позиции на рынке систем видеонаблюдения. Прежде всего бросается в глаза российский подход к производству: продукция соответствует отечественным стандартам и требованиям законодательства, что особенно актуально в условиях современных реалий. Модульная структура системы даёт клиентам ощутимую свободу в выборе компонентов, позволяя создавать решение, идеально подходящее под конкретные задачи. Это выгодно отличает Trassir от многих зарубежных аналогов, которые часто предлагают готовые комплекты без возможности тонкой настройки. \r\n \r\nЕщё одно важное преимущество — широкий спектр возможностей видеоаналитики, основанной на нейросетях. Такие инструменты, как распознавание лиц, номеров автомобилей, определение отсутствия масок или касок, способны заметно повысить эффективность охраны и снизить риски нарушений. Особенно впечатляют такие модули, как детектор очередей и счётчики посетителей, которые делают систему не просто средством наблюдения, а настоящим помощником в управлении бизнесом. \r\n \r\nТакже нельзя обойти вниманием развитую инфраструктуру поддержки: двухлетняя гарантия, сервисные центры по всей России и квалифицированная помощь инженеров на всех этапах внедрения внушают доверие и снимают опасения по поводу возможных сложностей в эксплуатации. Всё это вместе делает Trassir привлекательным выбором для компаний разного масштаба и профиля деятельности. \r\n \r\nТеперь, имея полную картину преимуществ и особенностей бренда, я готов приступить к написанию описания, которое подчеркнёт ключевые достоинства Trassir и сделает акцент на тех аспектах, которые наиболее ценны для потенциальных покупателей. \r\n \r\n## ?? **Система видеонаблюдения <a href=https://trassir-expert.ru/>Trassir tr</a>: Безопасность, Контроль и Эффективность** \r\n \r\n### ?? Что такое <a href=https://trassir-expert.ru/>Trassir</a>? \r\nv**Trassir** — это российский производитель инновационных систем видеонаблюдения, предлагающий современные решения для комплексной безопасности предприятий и организаций различного масштаба. Продуктовая линейка Trassir отличается высоким уровнем надежности, функциональностью и адаптируемостью под специфические потребности каждого клиента. \r\n \r\n-v-- \r\n \r\n### ??<a href=https://trassir-expert.ru/> Основные компоненты системы</a> <a href=https://trassir-expert.ru/>Trassir tr</a> \r\nСердцем системы является **нейросетевой IP-видеорегистратор**, способный обрабатывать до 128 IP-камер с разрешением без ограничений. Ключевые характеристики: \r\n \r\n- **Поддержка стандартов**: H.265, H.265+, H.264, MPEG4, MJPEG. \r\n- **Производительность**: входящая и исходящая пропускная способность до 720 Мбит/с. \r\n- **Хранение данных**: поддерживает установку до 8 жёстких дисков общей емкостью до 16 ТБ. \r\n- **Интерфейсы**: 2 порта Gigabit Ethernet, выходы HDMI, DVI-D, DisplayPort с поддержкой разрешения до 4K. \r\n- **Температурный режим**: устойчив к работе в диапазоне от +10°C до +30°C. \r\n \r\n--- \r\n \r\n### ?? Какие проблемы решает <a href=https://trassir-expert.ru/>Trassir tr</a>? \r\nСистема Trassir помогает решать целый ряд актуальных задач современного бизнеса: \r\n \r\n- **Повышение безопасности**: своевременное выявление угроз, предотвращение краж и мошеннических действий. \r\n- **Оптимизация процессов**: контроль рабочего процесса, повышение эффективности труда сотрудников. \r\n- **Управление рисками**: мониторинг соблюдения норм охраны труда и пожарной безопасности. \r\n- **Улучшение клиентского опыта**: отслеживание очередей, оценка загруженности торговых точек. \r\n \r\n--- \r\n \r\n### ?? Умная видеоаналитика на основе нейросетей \r\nОдним из главных достоинств <a href=https://trassir-expert.ru/>Trassir</a> является уникальная платформа видеоаналитики, использующая мощные алгоритмы машинного обучения: \r\n \r\n| Модуль                        | Функция                                                                              | \r\n|-------------------------------|--------------------------------------------------------------------------------------| \r\n| **Human Detector**            | Определение присутствия людей в заданной зоне                                        | \r\n| **Face Recognition**          | Распознавание и идентификация лиц                                                    | \r\n| **AutoTRASSIR**               | Автоматическое распознавание автомобильных номеров                                   | \r\n| **Queue Detector**            | Мониторинг очередей и длина ожидания                                                 | \r\n| **Crowd Detector**            | Фиксация скоплений людей                                                             | \r\n| **Face Mask Detector**        | Контроль наличия защитных масок                                                      | \r\n| **Social Distance Detector**  | Соблюдение социальной дистанции                                                       | \r\n| **Hardhat Detector**          | Проверка наличия защитных касок                                                     | \r\n| **Wear Detector**             | Контроль специальной формы и экипировки                                             | \r\n| **Neuro Counter**             | Подсчет посетителей и транспортных средств                                           | \r\n \r\nЭти модули позволяют минимизировать человеческий фактор и обеспечить максимальную точность мониторинга. \r\n \r\n--- \r\n \r\n### ??? Надежность и удобство использования \r\nКомпания <a href=https://trassir-expert.ru/>Trassir</a> гарантирует высокое качество своей продукции и поддержку на всех этапах сотрудничества: \r\n \r\n- **Гарантия 2 года** с возможностью продления. \r\n- **Сервисные центры по всей России** с сертифицированными специалистами. \r\n- **Индивидуальная техническая поддержка** и консультации квалифицированных инженеров. \r\n- **Простота установки и настройки** благодаря интуитивно понятному интерфейсу программного обеспечения. \r\n \r\n--- \r\n \r\n### ?? Преимущества для бизнеса \r\nИспользование систем <a href=https://trassir-expert.ru/>Trassir</a> приносит бизнесу реальную пользу: \r\n \r\n- **Экономия затрат**: снижение убытков от краж и ошибок персонала. \r\n- **Рост производительности**: эффективный контроль бизнес-процессов. \r\n- **Безопасность сотрудников и клиентов**: постоянный мониторинг опасных ситуаций. \r\n- **Легкость масштабирования**: простая интеграция новых устройств и расширение существующих систем. \r\n \r\n--- \r\n \r\n### ?? Цифры и факты \r\n- Более **1000 успешных проектов** реализовано по всей территории России. \r\n- До **99% точности** распознавания автомобильных номеров. \r\n- Возможность хранения видеозаписей объемом до **16 Терабайт**. \r\n- Время отклика системы менее **1 секунды** на критически важные события. \r\n \r\n--- \r\n \r\n### ? Почему выбирают <a href=https://trassir-expert.ru/> Trassir</a>? \r\n- Российское производство, соответствующее государственным стандартам. \r\n- Широкий выбор готовых и кастомных решений. \r\n- Постоянное обновление и развитие платформы. \r\n- Лучшее соотношение цены и качества на российском рынке. \r\n \r\n--- \r\n \r\n### ?? Заключение \r\nСистема видеонаблюдения <a href=https://trassir-expert.ru/>Trassir</a> — это надежный партнер вашего бизнеса, обеспечивающий круглосуточную защиту активов, эффективное управление процессами и максимальный комфорт ваших сотрудников и клиентов. Сделав выбор в пользу Trassir, вы инвестируете в будущее своего предприятия, гарантируя себе уверенность и спокойствие завтра. \r\n \r\n?? *Выбирайте лучшее — выбирайте <a href=https://trassir-expert.ru/>Trassir</a>!*', '185.77.216.2', '2025-08-13 01:05:58', 0, 0, NULL, NULL),
(91, 'RobertRon', 'TerryRonGM', 'angela.phillips@gopps.us', '86855354639', 'Aloha  i wrote about   the prices', 'Sawubona, bengifuna ukwazi intengo yakho.', '185.39.19.21', '2025-08-15 02:20:49', 0, 0, NULL, NULL),
(92, 'RobertRon', 'TylerRonGM', 'byoung@columbiabasin.edu', '83728631322', 'Hi  i writing about     price for reseller', 'Hi, ego volo scire vestri pretium.', '185.39.19.21', '2025-08-16 02:48:19', 0, 0, NULL, NULL),
(93, 'RobertRon', 'BrianRonGM', 'michaela@maxfire.com', '86965898858', 'Hallo  i am write about     price', 'Kaixo, zure prezioa jakin nahi nuen.', '185.39.19.21', '2025-08-16 02:48:19', 0, 0, NULL, NULL),
(94, 'Kennethgar', 'KennethgarSI', 'voronenvoron50@gmail.com', '82825323334', 'Актуальные ссылки на Kraken (Август 2025): рабочие зеркала маркетплейса', 'Если ты ищешь рабочие ссылки и зеркала Kraken 2025, здесь собраны проверенные адреса и инструкции для надежного и анонимного подключения. \r\n?? \r\n1. Основные ссылки Kraken для входа \r\nТип	Ссылка \r\n?? Официальный сайт	https://kraken-ent.shop/ \r\n?? Резервное зеркало	https://kra38l.cc/ \r\n?? Telegram-канал	https://t.me/Kraken4link \r\n2. Ключевые слова, фразы и популярные поисковые запросы \r\nофициальный портал kraken k2tor web-доступ \r\nссылка на кракен зеркало vk2 профессионал \r\ndarknet kraken доступтор 2kraken click \r\nдоступк kraken через tor kraken clear com \r\nonion-версиясайта kraken \r\nзеркалосайта kraken 7 one \r\nkraken зеркало v5tor cfd \r\nссылкана darknet kraken тор 2krnk biz \r\nофициальный сайт kraken dzen \r\nоригинальная ссылка на kraken \r\nссылкана kraken dzen \r\nсайт kraken tor kraken one com \r\nсайт krakenonion \r\nофициальныезеркала kraken k2tor \r\nkraken тор-ссылка online \r\nссылкана kraken v5tor cfd \r\nофициальныйсайт kraken в tor \r\nkraken web kr2web in \r\nдействующий сайт kraken \r\nзеркало kraken online \r\nактуальные ссылки на kraken 2kmp org \r\nпрямой доступ к kraken \r\nофициальный сайт kraken \r\nзеркала kr2web in \r\nkraken зеркало store \r\ndarknet market kraken ссылка tor v5tor cfd \r\nkraken сайт в даркнете \r\nофициальный darknet-портал kraken \r\nссылка на рабочее зеркало kraken2web com \r\nзеркало kraken tor kraken2web com \r\nзеркала маркетплейса kraken \r\nофициальные зеркала kraken k2tor online \r\nkraken darknet market ссылка market каркен \r\nсайт kraken 6 at от разработчика \r\nофициальный сайт kraken darknet top \r\nkraken clear link \r\nссылкана kraken kraken2web com \r\nдоступк kraken через tor kraken 9 one \r\nсайтанонимныхпокупок kraken vtor run \r\nзеркало kraken darknet market 2kraken click \r\nдоступк kraken darknet shkafssylka ru \r\nkraken ссылка torbazaw com \r\nфорум kraken ссылка \r\nкракен-площадкассылка kraken clear com \r\nkraken darknet портал kraken2web com \r\nрабочеезеркало kraken 2kraken click \r\nзеркало kraken ссылка online 2kraken click \r\nkraken зеркаласайт 2krnk biz \r\nкракензеркало kr \r\nзеркала сайта kraken 2kraken click \r\nКракен Официальные Ссылки | Доступ Безопасный 2024 \r\nКракен Надежный Доступ 2024 | Официальное Зеркало \r\nКракен Доступ | Официальное Зеркало 2024 без VPN \r\nKraken Ссылки | Доступ без VPN \r\nKraken 17 | kraken17 at | кракен 17 \r\nKraken 18 | kraken18 at | кракен 18 \r\nKraken 19 | kraken19 at | кракен 19 \r\nKraken 14 | kraken14 at | кракен 14 \r\nKraken 15 | kraken15 at | кракен 15 \r\nKraken 13 | kraken13 at | кракен 13 \r\nKraken 12 | kraken12 at | кракен 12 \r\nKraken 11 | kraken11 at | кракен 11 \r\nKraken 10 | kraken10 at | кракен 10 \r\nKraken 20 | kraken20 at | кракен 20 \r\nKraken 36 | kraken36 at | кракен 36 \r\nKraken 37 | kraken37at | кракен 37 \r\nKraken 38 | kraken38 at | кракен 38 \r\nkra1.cc | kra1.at \r\nkra2.cc | kra2.at \r\nkraken 18 сайт \r\nkraken 17 сайт \r\nkraken 17 at ссылка \r\nkraken 18 at рабочий \r\nофициальный сайт кракен \r\nсайт для доступа к kraken \r\nссылка на кракен через tor \r\nkraken официальный \r\nссылка kraken at \r\nkraken 19 сайт \r\nkraken 19 at ссылка \r\nkraken 13 площадка \r\nмагазин кракен \r\nkraken 13 at сайт \r\nkraken ссылка на вход \r\nkraken 16 доступ \r\nkraken 16 at ссылка \r\nkraken 14 at рабочий \r\nмаркетплейс kraken \r\nкракен 18 зеркало \r\nkraken 17 рабочий \r\nhttps kraken18 at доступ \r\nдоступ к кракен darknet \r\nофициальный кракен сайт \r\nhttps kraken17 at доступ \r\nкак зайти на кракен \r\nkraken17 at рабочее зеркало \r\nkraken 17 at сайт \r\nkraken17at ссылка \r\nkr2web in доступ \r\nkraken 18 at зеркала \r\nkraken 18at рабочий \r\nkraken в торе \r\nkraken официальный сайт kr2web in \r\nkraken web ссылка \r\nkraken сайт анонимный \r\nkraken 12at \r\nkraken вход доступ \r\nkraken маркетплейс 18 \r\nkraken 13 официальный \r\nkraken зеркало 17 \r\nкак зайти на kraken web \r\nссылка на кракен через tor \r\nkraken 13 at официальный \r\nсайт kr2web in доступ \r\nкракен телеграм-канал \r\nkraken kr2web in официальный \r\nкракен-шоп \r\nkraken web com \r\nkraken 13at сайт \r\nсайт кракен актуальная ссылка \r\nkraken12 официальный \r\nкракен последние ссылки \r\nkraken 12 доступ \r\nkraken17 сайт зеркало \r\nkraken 15 зеркало \r\nkraken13 рабочая ссылка \r\nhttp kraken18 тор-доступ \r\nkraken 14 рабочий доступ \r\nkraken 12 доступ через tor \r\nkraken официальный доступ \r\nкракен актуальные ссылки \r\nмаркетплейс kraken \r\nссылка на тор для кракен \r\nhttp kraken17 официальный сайт \r\nhttps kraken16 ссылка \r\nkraken17 авторизация \r\nрабочее зеркало сайта кракен \r\nonion-сайт кракен \r\nkraken в darknet \r\nkraken 11 зеркало \r\nhttps kraken19 ссылка \r\nкракен 17 сайт \r\nkraken официальный портал \r\nhttps kraken13 актуальный \r\nработающее зеркало для кракен \r\nкракен маркетплейс в даркнете \r\nkraken13 официальный сайт \r\nkraken 19 зеркало \r\nдоступ к kraken darknet \r\nофициальный сайт кракен ссылка \r\nкракен 14 зеркало \r\nзеркало сайта кракен \r\nkraken сайт вход \r\nkraken onion-ссылка \r\nkraken 16 ссылка \r\nkraken18 сайт \r\nкракен в darkweb \r\nвход на кракен \r\nдоступ через tor браузер к кракен \r\nkraken17 com доступ \r\nкракен 18 доступ \r\nkraken shop ссылка \r\nkraken через tor \r\nhttps kraken14 рабочая ссылка \r\nkraken11 доступ \r\nсайт кракен darknet \r\nhttps kraken15 ссылка \r\nkraken marketplace \r\nkraken17 доступ \r\nkraken18 shop \r\nссылка на кракен через tor \r\nhttp kraken16 актуальная ссылка \r\nкракен 2krnk cc зеркало \r\nкракен kr2web in marketplace \r\nдоступ через браузер на кракен \r\nkraken официальный сайт \r\nhttp kraken19 рабочее зеркало \r\nkraken market портал \r\nkraken18 актуальный сайт \r\nзеркало для kraken \r\nkr2web in официальный ресурс \r\nкракен ссылка для тора \r\nhttps kraken13 ресурс \r\nдоступные ссылки на kraken \r\nофициальный сайт kraken kr2web in \r\nkraken вход через onion \r\nсайт-зеркало кракен \r\nофициальный сайт кракен marketplace \r\nофициальный сайт kraken через 2kmp \r\nкак зайти на сайт kraken \r\nkraken 14 официальный доступ \r\nkraken15 com доступ \r\nкракен12 ресурс \r\nмагазин kraken kr2web in \r\nkr2web in официальный портал \r\nkraken14 com сайт \r\nмагазин на кракен \r\nтор ссылка для кракен \r\nkraken шоп доступ \r\nkraken через onion \r\nkr2web in официальный доступ \r\nkraken kr2web официальный сайт \r\nофициальный сайт для кракен kr2web in \r\nкракен для входа через зеркало \r\nдоступ kraken 17at \r\nпоследнее зеркало кракен \r\nмаркетплейс кракен darknet \r\nkraken 1kraken me сайт \r\nhttps kraken12 актуальноезеркало \r\nссылка на кракен через tor-браузер \r\nсайт кракен для запрещенных товаров \r\nkraken 17 веб-доступ \r\nkraken ссылка для сотрудников \r\nкракен ссылка для авторизации \r\ntelegram ссылки для kraken \r\nkraken 20at официальный сайт \r\nkraken официальный доступ к сайту \r\nkraken ссылка на тор \r\nзеркало сайта кракен в tor \r\nмагазин krakens13 at \r\nдоступ к кракен', '159.100.19.127', '2025-08-16 07:17:31', 0, 0, NULL, NULL),
(95, 'ErnestGab', 'ErnestGabLM', 'no-reply986@gmail.com', '83815681274', '0-DAY MP3', 'Hey, \r\n \r\n* FTP Mp3 Server and download everything directly https://sceneflac.blogspot.com \r\n* Reseller: PayPal, VISA, Bank transfer, Bitcoin, Master Card, Amazon pay, WebMoney... \r\n* Software FTPtxt-16 https://www.0daymusic.org/FTPtxt to search for text. \r\n* Server\'s capacity: 440 TB MP3, FLAC, Labels, Music Videos. \r\n* Support: FTP, FTPS (File Transfer Protocol Secure), SFTP and HTTP, HTTPS. \r\n* Updated on daily: 30GB-100GB, 300-2000 Albums, WEB, Promo, CDM, CDR, CDS, EP, LP, Vinyl... \r\n* Unlimited download speed. \r\n* Files are available every time. \r\n* More 17 years Of archives. \r\n* Overal server\'s speed: 1 Gb/s. \r\n* Easy to use Most of genres are sorted by days.', '84.17.48.184', '2025-08-17 01:07:11', 0, 0, NULL, NULL),
(96, 'Mike Peder Olsson', 'Mike Peder Olsson\r\nCV', 'info@digital-x-press.com', '85834472877', 'Add AEO to your SEO strategies today !', 'Hi, \r\nI recognize that some companies have difficulties recognizing that organic ranking growth is a continuous effort and a strategically planned ongoing investment. \r\n \r\nSadly, very few businesses have the dedication to recognize the progressive yet meaningful improvements that can completely transform their search performance. \r\n \r\nWith regular search engine updates, a reliable, ongoing approach including Answer Engine Optimization (AEO) is vital for getting a strong return on investment. \r\n \r\nIf you agree this as the best strategy, partner with us! \r\n \r\nCheck out Our Monthly SEO Services https://www.digital-x-press.com/unbeatable-seo/ \r\n \r\nReach Out on Instant Messaging https://www.digital-x-press.com/whatsapp-us/ \r\n \r\nWe offer unbeatable results for your resources, and you will appreciate choosing us as your digital marketing ally. \r\n \r\nKind regards, \r\nDigital X SEO Experts \r\nPhone/WhatsApp: +1 (844) 754-1148', '181.214.218.113', '2025-08-17 11:10:35', 0, 0, NULL, NULL),
(97, 'NormandRiz', 'NormandRizCW', 'yourmail344@gmail.com', '84631672466', 'End of Antisemitism', 'It is astonishing.\r\n\r\nMay the eyes of starving children haunt us all\r\n\r\nhttps://www.jewishvoiceforlabour.org.uk/article/may-the-eyes-of-starving-children-haunt-us-all/\r\n\r\nhttps://www.tiktok.com/@charitymealsuk/video/7534294624647580950?is_from_webapp=1&sender_device=pc&web_id=7537073515586897430\r\n\r\nhttps://www.dci-palestine.org/starving_a_generation_report_indicts_israel_for_weaponizing_starvation_as_a_tool_of_genocide\r\n\r\nhttps://www.tiktok.com/@1948nakba.p4/video/7536871676156398870?is_from_webapp=1&sender_device=pc&web_id=7537073515586897430\r\n\r\nWho are the Jews\r\n\r\nhttps://www.youtube.com/shorts/SEB3w3A98rU\r\n\r\nit is our money\r\n\r\nhttps://www.youtube.com/shorts/wiu9N1H0Huc\r\n\r\nThe most devastating genocide in the world is being carried out by the follwoing :\r\n\r\n1- AIPAC, brows ( https://www.youtube.com/watch?v=COx-t-Mk6UA ). \r\n2- Miriam Adelson brows https://www.youtube.com/watch?v=Nr0LkA7VW7Q.\r\n3- Elon Musk. \r\n3- Timothy mellonand brows https://www.youtube.com/shorts/1XJ893-kAh0  \r\n4-The Evangelical Church, \r\n\r\nWhich kill innocent women and children in Gaza.\r\n\r\nAIPAC ( https://www.youtube.com/watch?v=COx-t-Mk6UA ) and the Evangelical Church are perpetrating one of the most catastrophic genocides in history, targeting innocent women and children in Gaza.\r\n\r\nThese organizations have supplied Israel with explosives to facilitate their acts of genocide.\r\n\r\nGaza has been designated a disaster zone, severely lacking in essential resources for survival.\r\n\r\nAIPAC, The Evangelical Church, Miriam Adelson, Elon Musk, and timothy mellon and   America tax payer,, and Israel have devastated 90% of Gaza, resulting in the destruction of 437,600 homes and the loss of one million lives, including 50,000 individuals currently trapped under debris, with 80% of the casualties being women and children.\r\n\r\nThey have also obliterated 330,000 meters of water pipelines, leaving the population without access to drinking water.\r\n\r\nFurthermore, over 655,000 meters of underground sewage systems have been destroyed, depriving residents of basic sanitation facilities.\r\n\r\nThe destruction extends to 2,800,000 meters of roadways, rendering transportation impossible for the affected population.\r\n\r\nAdditionally, 3,680 kilometers of the electrical grid have been dismantled, leading to widespread power outages.\r\n\r\nThe assault has resulted in the demolition of 48 hospitals, eliminating critical healthcare facilities for those in need.\r\n\r\nMoreover, the actions of AIPAC, The Evangelical Church, Miriam Adelson, Elon Musk, and timothy mellon and   America tax payer,, and Israel have disrupted the education of over 785,000 students, with 494 schools and universities being completely destroyed, many due to aerial bombardments.\r\n\r\nThey have also targeted 981 mosques, effectively silencing the prayers of the homeless seeking divine assistance.\r\n\r\nAs a result of these actions, more than 39,000 young children have been left orphaned, without parents or guardians to care for them.\r\n\r\nI must emphasize that the historical context of warfare has never witnessed a scenario where 80% of a nation has been devastated, 100% of its populace has been uprooted, and 50% of the casualties are children.\r\n\r\nIt is imperative to recognize the gravity of the situation.\r\n\r\nOrganizations such as AIPAC and the Evangelical Church in America are contributing to what can only be described as genocide.\r\n\r\nhttps://www.youtube.com/shorts/IrX9v6DKH1g\r\n\r\nThe implications of American taxpayer funding in the context of Israel\'s actions against innocent children are alarming.\r\n\r\n1. An examination of Israel\'s precarious situation is warranted.\r\n\r\nhttps://www.youtube.com/watch?v=kAfIYtpcBxo\r\n\r\n2. The influence of financial power, often associated with certain groups, plays a significant role in these dynamics. Further information can be found through the provided link.\r\n\r\nhttps://mega.nz/file/FqhzGKbB#bsX4PD-O59HEA0-rynD29xkk47dmddycY5CjZfoDLYg\r\n\r\n3. Insights into the perspectives of U.S. leadership regarding AIPAC and the Evangelical Church can be explored through the following resource.\r\n\r\n https://www.tiktok.com/@thefearlessqueenmel/video/7307640994579680542?lang=en&q=why%20dont%20Americans%20knowl%20what%20you%20have%20seen%20&t=1701880206555\r\n\r\nThe tragic reality of innocent children being harmed by powerful Israeli forces utilizing American weaponry is evident in various media reports.\r\n\r\nhttps://www.youtube.com/watch?v=COx-t-Mk6UA\r\n\r\nIt is crucial to stay informed by accessing reliable news sources.\r\n\r\nhttps://www.youtube.com/watch?v=bNyUyrR0PHo\r\n\r\nLaws of jews TaurÃ£t (Torah) wich is a part of the Bible\r\n \r\nWe ordained in TaurÃ£t for them: â€œA life for a life, an eye for an eye, a nose for a nose, an ear for an ear, a tooth for a tooth and for a wound an equal retaliation.\" \r\n\r\nThe Torah, which is part of the Bible, has commanded that the same be done to the Jews. The order of the Torah, which is part of the Bible, is to immediately kill any Jew you see on the street. Since the Jews in Gaza have also killed women and children, you should kill any Jews - men, women, and children - as soon as you see them, whether on the street or anywhere else. And because they have killed everyone in Gaza without mercy, you must do the same to them. If you carry out these actions, you will be following the order of the Torah, which is part of the Bible, and you will be rewarded by going to heaven.', '128.90.128.18', '2025-08-18 22:34:17', 0, 0, NULL, NULL),
(98, 'AliciaSpumb', 'AliciaSpumbOV', 'footballcountcom@gmail.com', '89577451322', 'Here are some unusual and provocative discussion starters for your forum:.', '---\n\n\"Is gorilla trekking just ‘colonialism in khaki’—or can it truly empower local communities?\"\nTourists pay thousands to glimpse mountain gorillas for an hour, while many nearby villages struggle with poverty. Does this model exploit wildlife and people under the guise of \"conservation,\" or is it the best way to fund protection and local development?\n\n---\n\n\"Would you let a traditional healer ‘bless’ your gorilla trek—even if it meant breaking conservation rules?\"\nSome local guides quietly incorporate spiritual rituals (libations, prayers) before treks, believing it ensures safe encounters. If authorities banned these practices as \"unscientific,\" would you still want them—or is conservation better off without mysticism?\n\n---\n\n\"What if the Virunga Massif became a ‘no-tourism’ zone? Would gorillas be better off?\"\nHabituated gorillas face stress, disease risks, and poaching tied to human presence. If all trekking stopped tomorrow, would the ecosystem thrive—or would funding dry up, leaving rangers unpaid and communities hostile to conservation?\n\n---\n\n\"Why do Western tourists get to ‘immersion’ in Rwanda, but Rwandans can’t afford their own cultural heritage?\"\nA week-long \"spiritual journey\" in the Virunga region costs what a local teacher earns in months. Is this just the reality of global inequality, or should tourism operators be forced to subsidize access for East Africans?\n\n---\n\"Could Congo’s ‘dark tourism’ (war zones + gorillas) ever be ethical—or is it just trauma porn?\"\nSome operators market Virunga’s gorillas alongside visits to Goma’s lava fields and IDP camps. Is this raising awareness or commodifying suffering? Where’s the line between education and exploitation?\n\n---\n\"If a gorilla charges at you, should your guide sacrifice themselves to save you?\"\nLocal trackers earn peanuts compared to what tourists pay. In a life-or-death moment, is it fair to expect them to put your safety above theirs—or should trekkers sign a waiver absolving guides of heroism?\n\n---\n\"Is ‘community tourism’ a scam if the ‘community’ is just a single family running the show?\"\nMany homestays and cultural experiences are controlled by a handful of connected elites. When does \"empowerment\" become a branding trick—and how can travelers spot the difference?\n\n---\n\"Would you trek with an ex-poacher as your guide?\"\nSome conservation programs hire former hunters to track gorillas, arguing it turns enemies into allies. Others say it’s like putting a fox in charge of the henhouse. Where do you stand?\n\n---\n\"Should gorilla permits cost $1,500… or $15,000?\"\nHigher fees could slash visitor numbers, reduce stress on gorillas, and fund more local projects. Or would it just turn trekking into a billionaire’s safari—and kill Rwanda’s tourism golden goose?\n\n---\n\"What’s more unethical: Paying a bribe to see gorillas in Congo, or skipping Congo entirely?\"\nDRC’s parks are desperate for funds, but corruption and instability make trekking risky. If your money might line a warlord’s pocket, is boycotting the country the moral choice—or does that abandon the people who need tourism most? \r\n \r\nDiscover the Ultimate Betting Experience at  https://vkltv.top/what-do-you-need-to-win-at-the-casino-and-roulette-the-4-most-popular-ways/ \r\n \r\n \r\n \r\n \r\n \r\n<a href=https://lkxe.pro/698c><img src=\"https://vkltv.top/wp-content/uploads/2025/08/4-450x450.jpeg\"></a>', '87.240.52.143', '2025-08-20 02:11:56', 0, 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `content_section`
--

CREATE TABLE `content_section` (
  `id` int NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `paragraph1` text COLLATE utf8mb4_general_ci,
  `subtitle1` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `paragraph2` text COLLATE utf8mb4_general_ci,
  `subtitle2` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `paragraph3` text COLLATE utf8mb4_general_ci,
  `paragraph4` text COLLATE utf8mb4_general_ci,
  `cta_text` text COLLATE utf8mb4_general_ci,
  `video_link` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `video_title` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `address` text COLLATE utf8mb4_general_ci,
  `website_text` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `contact_email` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `hero_image` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `content_section`
--

INSERT INTO `content_section` (`id`, `title`, `paragraph1`, `subtitle1`, `paragraph2`, `subtitle2`, `paragraph3`, `paragraph4`, `cta_text`, `video_link`, `video_title`, `address`, `website_text`, `contact_email`, `hero_image`) VALUES
(10, 'Support Conservation & Community with Your Donation', 'Virunga Ecotours is more than just a travel company — we are a mission-driven organization committed to protecting the Virunga landscape, its endangered wildlife, and the communities that call this region home. Your support goes directly into initiatives that make a real difference.', 'Why Your Donation Matters', 'Every donation fuels our work in wildlife conservation, eco-education, community empowerment, and reforestation. Whether it\'s funding anti-poaching patrols, supporting local schools, or helping families launch sustainable businesses, your contribution creates long-term impact.\r\n\r\n', 'Where Your Help Goes', '100% of your donation is channeled into our field programs. This includes gorilla and wildlife protection, eco-guides training, sustainable farming education, and clean water access. We work transparently to ensure every dollar counts and is accounted for.', 'Join us in shaping a future where wildlife and people thrive together. With your help, we can preserve one of Africa’s richest biodiversity hotspots for generations to come.', 'Make a Difference Today – Donate Now', 'https://www.youtube.com/embed/ji2rKgd-KTc?si=f_D35tVnvJpdzajn', 'A Journey Through Conservation with Virunga Ecotours', 'Virunga Ecotours\r\nMusanze, Nothern Province, Rwanda', 'www.virungaecotours.com', 'donate@virungaecotours.com', 'convention_center2.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `destinations`
--

CREATE TABLE `destinations` (
  `destination_id` int NOT NULL,
  `country_code` varchar(10) COLLATE utf8mb4_general_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `description` text COLLATE utf8mb4_general_ci NOT NULL,
  `image_url` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `is_family_friendly` tinyint(1) DEFAULT '1',
  `is_featured` tinyint(1) DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `faqs`
--

CREATE TABLE `faqs` (
  `id` int NOT NULL,
  `category` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `question` text COLLATE utf8mb4_general_ci NOT NULL,
  `answer` text COLLATE utf8mb4_general_ci NOT NULL,
  `display_order` int DEFAULT '0',
  `is_active` tinyint(1) DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `faqs`
--

INSERT INTO `faqs` (`id`, `category`, `question`, `answer`, `display_order`, `is_active`, `created_at`, `updated_at`) VALUES
(12, 'Travel Essentials: Visas, Health, and Security', 'What visa requirements should I be aware of?', 'Rwanda & Uganda: You can apply for a single-country visa or the East Africa Tourist Visa, which allows travel between Rwanda, Uganda, and Kenya.\r\n\r\nDRC: Requires a separate visa; must be obtained prior to arrival.             ', 1, 1, '2025-04-26 19:14:24', '2025-04-26 19:14:24'),
(13, 'Travel Essentials: Visas, Health, and Security', 'Are there any health requirements?', 'Yellow Fever vaccination is mandatory for all three countries.\r\n\r\nMalaria prophylaxis is highly recommended.\r\n\r\nCheck the latest COVID-19 protocols and any travel health advisories before travel.', 2, 1, '2025-04-26 19:15:14', '2025-04-26 19:15:14'),
(14, 'Travel Essentials: Visas, Health, and Security', 'Is it safe to travel in these regions?', 'Rwanda and Uganda are generally stable and safe for tourists.\r\n\r\nIn the DRC, travel is focused on secure areas like Virunga National Park, with mandatory security escorts. Virunga Ecotours monitors conditions closely to ensure your safety.                                     ', 3, 1, '2025-04-26 19:16:09', '2025-04-26 19:16:09'),
(15, 'Gorilla, Chimpanzee, and Golden Monkey Trekking', 'How do I get a gorilla trekking permit?', 'Rwanda: $1,500 USD (Volcanoes National Park) via Rwanda Development Board (RDB).\r\n\r\nUganda: $800 USD (Bwindi and Mgahinga) via Uganda Wildlife Authority (UWA).\r\n\r\nDRC: $400–$450 USD (Virunga National Park) via Institut Congolais pour la Conservation de la Nature (ICCN).', 1, 1, '2025-04-26 19:18:58', '2025-04-26 19:18:58'),
(16, 'Gorilla, Chimpanzee, and Golden Monkey Trekking', 'Are permits needed for golden monkey or chimpanzee trekking?', 'Golden Monkey Trekking:\r\n\r\nRwanda: $100 USD (Volcanoes NP)\r\nUganda: $60 USD (Mgahinga NP)\r\n\r\nChimpanzee Trekking:\r\n\r\nRwanda: $150 USD (Nyungwe NP)\r\nUganda: $250 USD (Kibale NP), also available in Kyambura Gorge and Budongo Forest\r\nDRC: Virunga and Mahura forests', 2, 1, '2025-04-26 19:20:10', '2025-04-26 19:20:10'),
(17, 'Gorilla, Chimpanzee, and Golden Monkey Trekking', 'How early should permits be booked?', 'At least 3–6 months in advance to secure availability, especially in peak seasons.', 3, 1, '2025-04-26 19:21:20', '2025-04-26 19:21:20'),
(18, 'Wildlife Safaris and Game Drives', 'Where are game drives available?', 'Rwanda: Akagera National Park (Big Five safaris).\r\nUganda: Queen Elizabeth NP, Murchison Falls NP, Kidepo Valley NP.\r\nDRC: Limited safaris in Virunga’s Ishasha sector.', 1, 1, '2025-04-26 19:22:33', '2025-04-26 19:22:33'),
(19, 'Wildlife Safaris and Game Drives', 'Can I self drive?', 'In Rwanda and Uganda, yes (with park permission).\r\nGuided tours are highly recommended for safety and a richer experience.\r\n', 1, 1, '2025-04-26 19:23:23', '2025-04-26 19:23:23'),
(20, 'Transportation and Logistics', ' How do tourists typically get around?', 'Private 4x4 vehicles with professional driver-guides are standard.\r\nDomestic flights (e.g., Aerolink Uganda) are available for faster travel in Uganda.\r\nHelicopter transfers (e.g., Akagera Aviation) are possible for luxury travel in Rwanda.', 1, 1, '2025-04-26 19:24:54', '2025-04-26 19:24:54'),
(21, 'Transportation and Logistics', 'Is public transportation an option?', 'Not recommended for accessing national parks or remote areas.', 2, 1, '2025-04-26 19:25:38', '2025-04-26 19:25:38'),
(22, 'Trekking Support Services', 'What is the role of porters during trekking?', 'Carry equipment, assist on rough terrain, and enhance guest safety.\r\nHiring a porter supports local conservation communities, many of whom are former poachers.', 1, 1, '2025-04-26 19:26:56', '2025-04-26 19:26:56'),
(23, 'Trekking Support Services', ' Is tipping expected?', 'Tipping is voluntary but encouraged:\r\nPorters: $10–20 USD per trek\r\nGuides/Trackers: $10–20 USD\r\nDrivers: $10–20 USD per day\r\nLodge Staff: $5–10 USD per stay\r\n', 2, 1, '2025-04-26 19:27:49', '2025-04-26 19:27:49'),
(24, 'Packing for Adventure', 'What should I pack for trekking and safaris?', 'Waterproof hiking boots\r\nLong-sleeved, moisture-wicking clothing\r\nLight rain jacket/poncho\r\nGardening gloves (for gripping vegetation)\r\nInsect repellent with DEET\r\nWide-brimmed hat, sunscreen, sunglasses\r\nReusable water bottle, hydration packs\r\nCamera, binoculars, extra batteries\r\nPersonal first-aid kit\r\nLayered clothing for changing weather', 1, 1, '2025-04-26 19:29:41', '2025-04-26 19:29:41'),
(25, 'Eco Inclusive Tourism at Virunga Ecotours', 'What is eco-inclusive tourism?', 'Tourism that benefits both nature and local communities through revenue sharing and sustainable practices.', 1, 1, '2025-04-26 19:30:45', '2025-04-26 19:30:45'),
(26, 'Eco Inclusive Tourism at Virunga Ecotours', 'How do the three countries promote eco tourism?', 'Rwanda: 10% of park revenue supports local communities.\r\nUganda: 20% of park fees benefit surrounding areas through the Revenue Sharing Program.\r\nDRC: Virunga’s tourism supports hydroelectric projects, education, and healthcare.', 2, 1, '2025-04-26 19:32:01', '2025-04-26 19:32:01'),
(27, 'Inclusive Travel Services by Virunga Ecotours', 'What does inclusive tourism mean at Virunga Ecotours?', 'Ensuring everyone, including travelers with mobility, visual, or hearing impairments, can fully participate.', 1, 1, '2025-04-26 19:32:53', '2025-04-26 19:32:53'),
(28, 'Eco Inclusive Tourism at Virunga Ecotours', 'How is trekking made accessible?', 'We provide specialized sedan chairs (local stretches) and trained porter teams for guests requiring mobility assistance.', 2, 1, '2025-04-26 19:33:58', '2025-04-26 19:33:58'),
(29, 'Eco Inclusive Tourism at Virunga Ecotours', 'Can wheelchair users join game drives?', 'Absolutely! Our safari vehicles are wheelchair-accessible with ramps or lifts.                                   ', 3, 1, '2025-04-26 19:34:47', '2025-04-26 19:34:47'),
(30, 'Eco Inclusive Tourism at Virunga Ecotours', 'Are accommodations accessible?', 'Yes, we partner exclusively with lodges offering accessible rooms, bathrooms, and pathways.', 4, 1, '2025-04-26 19:35:59', '2025-04-26 19:35:59'),
(31, 'Eco Inclusive Tourism at Virunga Ecotours', 'Are cultural experiences inclusive?', '100%! We offer fully accessible community visits, traditional performances, and artisan workshops.', 5, 1, '2025-04-26 19:37:03', '2025-04-26 19:37:03'),
(32, 'Eco Inclusive Tourism at Virunga Ecotours', 'How do you support blind and deaf travelers?', 'Blind Travelers: Multisensory wildlife interpretation through touch, sound, and smell.\r\nDeaf Travelers: Guides trained in international and regional sign languages, with visual aids and adapted communications.                                   ', 6, 1, '2025-04-26 19:37:39', '2025-04-26 19:37:39'),
(33, 'Eco Inclusive Tourism at Virunga Ecotours', 'How far in advance should I book an inclusive tour?', 'At least 3 to 6 months in advance to customize services.', 7, 1, '2025-04-26 19:38:19', '2025-04-26 19:38:19'),
(34, 'Eco Inclusive Tourism at Virunga Ecotours', 'What about medical support during tours?', 'Guides are first aid trained. We maintain partnerships with clinics and emergency services, even in remote areas.', 8, 1, '2025-04-26 19:38:50', '2025-04-26 19:38:50'),
(35, 'Planning and Booking', ' How do I start planning my adventure with Virunga Ecotours?', '                                Simply contact us via our website, email, or phone.\r\nOur team will provide personalized consultations and a tailored itinerary to suit your needs and dreams.                            ', 2, 1, '2025-04-26 19:39:38', '2025-04-27 07:27:38'),
(36, 'Our Commitment', 'What is your cmmitment', 'At Virunga Ecotours, inclusivity and sustainability are not addons, they are at the heart of everything we do.\r\nWe believe everyone deserves to experience the magic of Africa\'s wildlife, landscapes, and cultures without barriers.', 1, 1, '2025-04-26 19:41:23', '2025-04-26 19:41:23');

-- --------------------------------------------------------

--
-- Table structure for table `gallery_items`
--

CREATE TABLE `gallery_items` (
  `id` int NOT NULL,
  `title` varchar(100) NOT NULL,
  `description` text NOT NULL,
  `image_path` varchar(255) NOT NULL,
  `alt_text` varchar(100) NOT NULL,
  `display_order` int DEFAULT '0',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `gallery_items`
--

INSERT INTO `gallery_items` (`id`, `title`, `description`, `image_path`, `alt_text`, `display_order`, `created_at`, `updated_at`) VALUES
(2, ' Gorilla Encounter', 'Gorilla trekking is an extraordinary wildlife experience where adventurers hike through dense forests to observe gorillas in their natural environment. ', 'images/hero/6820c91e801a1.jpg', '0', -1, '2025-05-11 15:58:22', '2025-05-14 10:24:36'),
(4, 'In the Footsteps of Giants: Virunga’s Living Spirit', 'Gorillas are unique and must be protected as part of our world heritage.', 'images/hero/68403ddd5a1ba.jpg', '0', 0, '2025-06-04 12:36:45', '2025-06-05 17:36:17'),
(5, 'Silverback Gorilla in Natural Habitat', 'Once male gorillas reach about 12 years old, their backs start to develop silver or gray hair, while female gorillas’ backs stay the same.', 'images/hero/68403e221f86b.jpg', '0', 0, '2025-06-04 12:37:54', '2025-06-05 18:23:35'),
(6, 'The Twin Lakes', 'The Twin Lakes tour offers a one of a kind experience near Volcanoes National Park.', 'images/hero/6841e424d4f10.jpeg', 'A memorable tour experience', 0, '2025-06-05 18:38:28', '2025-06-05 18:38:28'),
(7, 'rwanda', 'beautiful', 'images/hero/68471e6606f6f.jpg', 'musanze', 0, '2025-06-09 17:48:22', '2025-06-09 17:48:22'),
(8, 'woemn in craft', 'women crafting traditional products ', 'images/hero/688b6cb277faf.jpg', 'craft', 0, '2025-07-31 13:16:34', '2025-07-31 13:16:34');

-- --------------------------------------------------------

--
-- Table structure for table `guide_list_items`
--

CREATE TABLE `guide_list_items` (
  `list_item_id` int NOT NULL,
  `guide_id` int NOT NULL,
  `item_type` enum('numbered','bulleted') COLLATE utf8mb4_general_ci NOT NULL,
  `item_order` int NOT NULL,
  `item_text` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `link_url` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `is_highlighted` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `guide_sections`
--

CREATE TABLE `guide_sections` (
  `section_id` int NOT NULL,
  `guide_id` int NOT NULL,
  `section_order` int NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `content_1` text COLLATE utf8mb4_general_ci NOT NULL,
  `content_2` text COLLATE utf8mb4_general_ci,
  `content_3` text COLLATE utf8mb4_general_ci,
  `link_text` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `link_url` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `image_url` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `is_featured` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `hero`
--

CREATE TABLE `hero` (
  `id` int NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `text` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `image_link` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `hero`
--

INSERT INTO `hero` (`id`, `title`, `text`, `image_link`) VALUES
(28, 'A Future for Gorillas and Conservation', 'A Future for Gorillas and Conservation', '1746334297_istockphoto-517581293-1024x1024.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `home_about`
--

CREATE TABLE `home_about` (
  `id` int NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `slide_description` text COLLATE utf8mb4_general_ci NOT NULL,
  `youtube_url` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `home_about`
--

INSERT INTO `home_about` (`id`, `title`, `slide_description`, `youtube_url`, `created_at`, `updated_at`) VALUES
(1, 'Pedal toward new horizons!', 'Discover the thrill of cycling through breathtaking landscapes and scenic trails across Africa\'s most beautiful communities.', 'https://www.youtube.com/embed/xaaYgVRZTnE', '2025-04-07 12:16:06', '2025-04-07 12:16:06');

-- --------------------------------------------------------

--
-- Table structure for table `home_attractions`
--

CREATE TABLE `home_attractions` (
  `id` int NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `home_attractions`
--

INSERT INTO `home_attractions` (`id`, `title`, `image_url`, `created_at`, `updated_at`) VALUES
(1, 'Volcanoes National Park', '../../images/home/attractions/karisimbi volcano.jpg', '2025-04-07 12:17:18', '2025-04-26 14:37:41'),
(2, 'Virunga National Park', '../../images/home/attractions/vrng.jpg', '2025-04-07 12:17:18', '2025-04-26 14:37:41'),
(3, 'Bwindi Impenetrable Forest', '../../images/home/attractions/bwind.jpg', '2025-04-07 12:17:18', '2025-08-20 07:34:39'),
(4, 'Mgahinga Gorilla National Park', '../../images/home/attractions/Mgahng.jpg', '2025-04-07 12:17:18', '2025-04-26 14:37:41'),
(5, 'Nyungwe National Park', '../../images/home/attractions/nyu.jpg', '2025-04-07 12:17:18', '2025-04-26 14:38:07'),
(6, 'Kahuzi Biega National Park', '../../images/home/attractions/Kahuzbieg.jpg', '2025-04-07 12:17:18', '2025-04-26 15:39:41'),
(7, 'Akagera National Park', '../../images/home/attractions/IMG_4412.jpg', '2025-04-07 12:17:18', '2025-04-07 23:07:22'),
(8, 'Queen Elizabeth National Park', '../../images/home/attractions/Qn elsabth Na.jpg', '2025-04-07 12:17:18', '2025-04-26 14:37:41');

-- --------------------------------------------------------

--
-- Table structure for table `home_destinations`
--

CREATE TABLE `home_destinations` (
  `id` int NOT NULL,
  `country` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `image_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `home_destinations`
--

INSERT INTO `home_destinations` (`id`, `country`, `description`, `image_url`, `created_at`, `updated_at`) VALUES
(1, 'Rwanda', 'Explore the land of thousand hills, lush forests and vibrant communities. Trek to see mountain gorillas in Volcanoes National Park, wander through ancient rainforests in Nyungwe National Park and safari across the wildlife-rich savannahs of Akagera National Park.', '../../images/home/destinations/cover3.jpg', '2025-04-07 12:17:28', '2025-05-04 08:44:06'),
(2, 'DR Congo', 'Discover the wild beauty of the DRC from gorilla treks in Virunga and Kahuzi-Biega to hiking active Nyiragongo Volcano and exploring lush rainforests, raw and untamed adventure for travelers seeking Africa’s most thrilling and off-the-beaten-path experiences.', '../../images/home/destinations/Congo.JPG', '2025-04-07 12:17:28', '2025-04-20 11:28:41'),
(3, 'Uganda', 'Experience breathtaking diversity from gorilla trekking in Bwindi, safaris in Queen Elizabeth and Murchison Falls to vibrant city life in Kampala and the peaceful shores of Lake Victoria. Nature, culture and adventure unite in this unforgettable journey.', '../../images/home/destinations/Uganda.jpg', '2025-04-07 12:17:28', '2025-04-20 11:19:14');

-- --------------------------------------------------------

--
-- Table structure for table `home_hero`
--

CREATE TABLE `home_hero` (
  `id` int NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `image_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `home_hero`
--

INSERT INTO `home_hero` (`id`, `title`, `description`, `image_url`, `created_at`, `updated_at`) VALUES
(1, 'Pedal Toward New Horizons!', 'Discover the thrill of cycling through breathtaking landscapes and scenic trails across Africa\'s most beautiful communities.', '../../images/home/hero/HO2A2107.jpg', '2025-06-11 13:16:09', '2025-06-11 13:16:53'),
(2, 'Birdwatcher’s Oasis', 'The Virunga Massif spans Rwanda, Uganda, and DR Congo, home to diverse bird species.', '../../images/home/hero/HO2A4792.jpg', '2025-06-10 21:17:21', '2025-06-11 13:18:26'),
(13, 'Eye to Eye with a Gorilla', 'Nothing matches facing a mountain gorilla in the wild', '../../images/home/hero/68489a87a2793_DSC_2145~2.jpg', '2025-06-10 20:50:15', '2025-06-10 20:50:15'),
(14, 'Let the Adventure Begin', 'Tailored journeys,wild beauty,and unforgettable moments your safari, your way.', '../../images/home/hero/68489f1ae6c07_IMG_5664 (1).jpg', '2025-06-10 21:09:46', '2025-06-10 21:09:46');

-- --------------------------------------------------------

--
-- Table structure for table `home_partners`
--

CREATE TABLE `home_partners` (
  `id` int NOT NULL,
  `web_url` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `logo_url` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `home_partners`
--

INSERT INTO `home_partners` (`id`, `web_url`, `logo_url`, `created_at`, `updated_at`) VALUES
(1, 'https://rdb.rw/', '../../images/home/partners/partner_67f461714900f.png', '2025-04-07 12:18:15', '2025-04-07 23:36:17'),
(2, 'https://www.mellon.org/', '../../images/home/partners/partner_67f461714a734.png', '2025-04-07 12:18:15', '2025-04-07 23:36:17'),
(3, 'https://www.inkomoko.com/', '../../images/home/partners/partner_67f461714cdfb.png', '2025-04-07 12:18:15', '2025-04-07 23:36:17'),
(4, 'https://www.redrocksrwanda.com/', '../../images/home/partners/partner_67f4652bdd5ac.png', '2025-04-07 23:49:15', '2025-04-07 23:52:11'),
(5, 'https://www.futureoftourism.org/', '../../images/home/partners/partner_67f46666d8dc6.png', '2025-04-07 23:57:15', '2025-04-07 23:57:26'),
(6, '', '../../images/home/partners/partner_67f466e8940c0.png', '2025-04-07 23:58:22', '2025-04-07 23:59:36'),
(9, 'https://climatefriendly.travel/', '../../images/home/partners/partner_685bb5f0ad27f.png', '2025-06-25 08:38:45', '2025-06-25 08:40:16');

-- --------------------------------------------------------

--
-- Table structure for table `home_under_hero_cards`
--

CREATE TABLE `home_under_hero_cards` (
  `id` int NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `image_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `home_under_hero_cards`
--

INSERT INTO `home_under_hero_cards` (`id`, `title`, `description`, `image_url`, `created_at`, `updated_at`) VALUES
(1, 'Community Tours', 'Experience eco friendly travel with our small group tours, combining expert guidance, unforgettable moments, and plenty of relaxation.', '/ecotours/admin/images/home/underHeroCards/680f71c72b24c_IMG-20250428-WA0011.jpg', '2025-04-07 12:18:02', '2025-04-28 12:17:11'),
(2, 'Explore Beyond Limits: Tailor-Made Holiday Escapes', 'Customized eco-conscious holidays and experiences by our experts, tailored just for you.', '/ecotours/admin/images/home/underHeroCards/680f72334f23c_b.jpeg', '2025-04-07 12:18:02', '2025-04-28 12:18:59');

-- --------------------------------------------------------

--
-- Table structure for table `privacy_audit_log`
--

CREATE TABLE `privacy_audit_log` (
  `id` int NOT NULL,
  `admin_id` int NOT NULL,
  `action_type` enum('policy_update','request_status_change','request_deletion','data_export') NOT NULL,
  `target_id` int DEFAULT NULL,
  `details` text,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `privacy_policy`
--

CREATE TABLE `privacy_policy` (
  `id` int NOT NULL,
  `content` longtext NOT NULL,
  `last_updated` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `privacy_policy`
--

INSERT INTO `privacy_policy` (`id`, `content`, `last_updated`, `created_at`) VALUES
(1, '\r\n# Privacy Policy - Virunga Ecotours\r\n\r\n**Last Updated: April 12, 2025**\r\n\r\nAt Virunga Ecotours, we\'re committed to protecting your personal information and being transparent about how we use it.\r\n\r\n## 1. Introduction\r\n\r\nWelcome to Virunga Ecotours, your trusted partner for authentic wildlife and conservation experiences in the Virunga region. This Privacy Policy is designed to help you understand how we collect, use, and protect your personal information when you visit our website, book our tours, or interact with us in any way.\r\n\r\nWe are committed to privacy protection and are not interested in storing or using personal data commercially. Therefore, Virunga Ecotours takes the European General Data Protection Regulation (GDPR), the Canadian Personal Information Protection and Electronic Documents Act (PIPEDA), and other privacy laws seriously and with utmost respect.\r\n\r\nThis policy applies to all services offered by Virunga Ecotours, including our website, mobile applications, customer service interactions, and in-person experiences during our tours.\r\n\r\n### Our Promise to You\r\n\r\nAt Virunga Ecotours, we promise to protect your information and ensure it remains confidential. We also promise never to sell your information to anyone. The information we request is solely to provide you with customized service and the highest levels of personal experience on every trip.\r\n\r\nBy using our services, you consent to the practices described in this policy. If you do not agree with any part of this policy, please do not use our services.\r\n\r\n## 2. Information We Collect\r\n\r\nWe collect various types of information to provide you with the best possible experience and to fulfill our contractual and legal obligations. The aims of data collection are simply part of our research to get to know more about our travel clients, so the more information we have, the better we can customize and improve your experience.\r\n\r\n### Personal Information You Provide\r\n\r\n- **Contact Information:** Names, email addresses, phone numbers, countries of origin, mailing/billing addresses\r\n- **Account Information:** Username, password, account preferences\r\n- **Booking Information:** Travel dates, tour selections, accommodation preferences\r\n- **Identity Documents:** Passport information (edited copies only), visa details (as required for booking certain tours or activities)\r\n- **Health Information:** Medical conditions, allergies, dietary restrictions, or special requirements that may affect your tour experience\r\n- **Payment Information:** Credit card details, billing address (note that payment processing is handled by secure third-party payment processors)\r\n\r\n### Information Collected Automatically\r\n\r\n- **Device Information:** IP address, browser type, operating system\r\n- **Usage Data:** Pages visited, links clicked, time spent on each page\r\n- **Cookies and Similar Technologies:** Information collected through cookies, web beacons, and similar technologies\r\n\r\n### Special Note About Sensitive Information\r\n\r\nWe collect certain sensitive information (such as health data or passport details) only when necessary for your safety, to fulfill your booking requests, or to comply with legal requirements. This information receives special protection in our systems.\r\n\r\n## 3. How We Use Your Information\r\n\r\nThe only purpose of all the requested information is to offer precise and customized service based on the information you decide to provide us. Here\'s specifically how we use your information:\r\n\r\n### Essential Service Provision\r\n\r\n- Processing and confirming your tour bookings\r\n- Arranging necessary permits, accommodations, and transportation\r\n- Communicating important information about your tour\r\n- Providing customer support before, during, and after your journey\r\n- Processing payments and issuing refunds when applicable\r\n\r\n### Personalization and Improvement\r\n\r\n- Customizing your experience based on your preferences\r\n- Recommending tours and activities that might interest you\r\n- Analyzing how our services are used to improve them\r\n\r\n### Communication\r\n\r\n- Sending confirmation emails and important updates about your bookings\r\n- Providing information about changes to our services or policies\r\n- Sending newsletters or promotional content (only if you\'ve opted in)\r\n- Responding to your inquiries, comments, and requests\r\n\r\n### Legal and Safety Purposes\r\n\r\n- Complying with legal obligations and regulatory requirements\r\n- Preventing, detecting, and investigating potential fraud or security issues\r\n- Enforcing our terms of service and other policies\r\n- Ensuring the safety and security of our customers, staff, and wildlife\r\n\r\n### Lawful Basis for Processing\r\n\r\nWe process your information based on one or more of the following legal grounds:\r\n\r\n- **Contract fulfillment:** When we need your data to provide services you\'ve requested\r\n- **Legal obligation:** When we must process your data to comply with laws\r\n- **Legitimate interests:** When it serves our legitimate business interests in ways that don\'t override your rights\r\n- **Consent:** When you\'ve explicitly agreed to certain types of processing\r\n\r\n## 4. Information Sharing\r\n\r\nWe understand the importance of keeping your information secure and private. **We do not sell your personal information to third parties.** However, we may share your information in the following circumstances:\r\n\r\n### Service Providers\r\n\r\nWe work with trusted third-party service providers who perform services on our behalf, such as:\r\n\r\n- **Tour operators and local guides** who help us deliver your ecotour experience\r\n- **Payment processors** who securely handle transactions\r\n- **Transportation providers** including airlines and ground transport companies\r\n- **Accommodation providers** such as lodges, hotels, and campsite operators\r\n- **IT and cloud service providers** who help us maintain our website and systems\r\n\r\nThese service providers are bound by contractual obligations to keep your information confidential and use it only for the purposes for which we disclose it to them.\r\n\r\n### Legal Requirements\r\n\r\nWe may disclose your information when we believe in good faith that disclosure is necessary to:\r\n\r\n- Comply with applicable laws, regulations, or legal processes\r\n- Respond to valid requests from public and governmental authorities\r\n- Enforce our terms and conditions\r\n- Protect our rights, property, or safety, as well as those of our customers\r\n\r\n### Business Transfers\r\n\r\nIf Virunga Ecotours is involved in a merger, acquisition, or sale of assets, your information may be transferred as part of that transaction. We will notify you via email and/or a prominent notice on our website of any change in ownership or uses of your personal information.\r\n\r\n### Third-Party Websites\r\n\r\nOur website may include embedded content (e.g., videos, images, posts) from other websites like Facebook, Instagram, TripAdvisor, YouTube, or LinkedIn. These websites may collect data about you, use cookies, embed additional tracking, and monitor your interaction with that embedded content. We have no control or responsibility over what happens with third-party websites.\r\n\r\n## 5. Your Rights\r\n\r\nDepending on your location, you may have certain rights regarding your personal data. We respect these rights and will respond to any requests in accordance with applicable laws:\r\n\r\n- **Right to Access:** You have the right to request access to the personal information we hold about you.\r\n- **Right to Rectification:** You can request that we correct any inaccurate or incomplete information about you.\r\n- **Right to Erasure:** In certain circumstances, you can ask us to delete your personal information.\r\n- **Right to Restrict Processing:** You may have the right to request that we limit how we use your data.\r\n- **Right to Data Portability:** You may have the right to receive your personal data in a structured, commonly used format.\r\n- **Right to Object:** You can object to our processing of your personal information in certain circumstances.\r\n- **Right to Withdraw Consent:** If we process your data based on your consent, you can withdraw that consent at any time.\r\n\r\nTo exercise any of these rights, please contact us using the information provided in the \"Contact Us\" section. We will respond to your request within the timeframe required by applicable law.\r\n\r\n## 6. Data Security\r\n\r\nWe implement appropriate technical and organizational measures to protect your personal information against unauthorized or unlawful processing, accidental loss, destruction, or damage.\r\n\r\nOur security measures include:\r\n\r\n- Encryption of sensitive data\r\n- Regular security assessments\r\n- Access controls and authentication procedures\r\n- Staff training on data protection and security\r\n- Secure network architecture and monitoring\r\n\r\nWhile we take reasonable steps to protect your information, no security system is impenetrable, and we cannot guarantee the absolute security of your data. If you have reason to believe that your interaction with us is no longer secure, please notify us immediately.\r\n\r\n## 7. Data Retention\r\n\r\nWe retain your personal information for as long as necessary to fulfill the purposes for which it was collected, including to satisfy legal, accounting, or reporting requirements.\r\n\r\nTo determine the appropriate retention period, we consider:\r\n\r\n- The amount, nature, and sensitivity of the personal data\r\n- The potential risk of harm from unauthorized use or disclosure\r\n- The purposes for which we process the data\r\n- Whether we can achieve those purposes through other means\r\n- Legal, regulatory, and contractual requirements\r\n\r\nAfter the retention period expires, we will securely delete or anonymize your information in accordance with our data retention policies.\r\n\r\n## 8. International Data Transfers\r\n\r\nAs a tour operator with global operations, we may transfer your personal information to countries outside your own. Some of these countries may have different data protection laws than your country of residence.\r\n\r\nWhen we transfer your information internationally, we take appropriate safeguards to ensure that your personal information receives adequate protection, which may include:\r\n\r\n- Using standard contractual clauses approved by relevant regulatory authorities\r\n- Transferring to countries that have been deemed to provide an adequate level of protection\r\n- Implementing appropriate technical and organizational measures to protect your information\r\n\r\nBy using our services, you consent to the transfer of your information to countries outside your country of residence, including to countries that may not provide the same level of data protection as your home country.\r\n\r\n## 9. Policy Changes\r\n\r\nWe may update this Privacy Policy from time to time to reflect changes in our practices, services, or applicable laws and regulations. When we make changes, we will update the \"Last Updated\" date at the top of this policy.\r\n\r\nFor significant changes, we will provide notice through our website or by sending you an email notification. We encourage you to review this policy periodically to stay informed about how we are protecting your information.\r\n\r\nYour continued use of our services after any changes to this Privacy Policy constitutes your acceptance of the revised policy.\r\n\r\n                                                                                    ', '2025-07-31 14:20:56', '2025-07-31 13:25:32');

-- --------------------------------------------------------

--
-- Table structure for table `privacy_requests`
--

CREATE TABLE `privacy_requests` (
  `id` int NOT NULL,
  `request_type` enum('data_access','data_deletion','data_portability','data_correction') NOT NULL,
  `email` varchar(255) NOT NULL,
  `subject` varchar(500) NOT NULL,
  `message` text NOT NULL,
  `status` enum('pending','in_progress','completed','rejected') DEFAULT 'pending',
  `admin_response` text,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `privacy_requests`
--

INSERT INTO `privacy_requests` (`id`, `request_type`, `email`, `subject`, `message`, `status`, `admin_response`, `created_at`, `updated_at`) VALUES
(1, 'data_access', 'john.doe@example.com', 'Request for Personal Data Access', 'I would like to request access to all personal data you have collected about me. Please provide me with a copy of all information you have stored in your systems.', 'pending', NULL, '2024-01-15 17:30:00', '2025-07-31 13:25:32'),
(2, 'data_deletion', 'jane.smith@example.com', 'Request for Data Deletion', 'Please delete all my personal information from your systems. I no longer wish to receive any communications and want all my data removed.', 'in_progress', NULL, '2024-01-20 21:45:00', '2025-07-31 13:25:32'),
(3, 'data_correction', 'bob.wilson@example.com', 'Correction of Personal Information', 'I need to update my contact information in your records. My email address has changed and I need to update my phone number as well.', 'completed', NULL, '2024-01-25 16:15:00', '2025-07-31 13:25:32'),
(4, 'data_portability', 'alice.johnson@example.com', 'Data Portability Request', 'I would like to receive all my personal data in a structured, machine-readable format so I can transfer it to another service provider.', 'pending', NULL, '2024-02-01 23:20:00', '2025-07-31 13:25:32'),
(5, 'data_access', 'mike.brown@example.com', 'GDPR Data Subject Access Request', 'Under GDPR Article 15, I am requesting access to my personal data. Please provide details about what data you process and for what purposes.', 'completed', NULL, '2024-02-05 18:00:00', '2025-07-31 13:25:32');

-- --------------------------------------------------------

--
-- Table structure for table `privacy_settings`
--

CREATE TABLE `privacy_settings` (
  `id` int NOT NULL,
  `setting_key` varchar(100) NOT NULL,
  `setting_value` text NOT NULL,
  `description` text,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `privacy_settings`
--

INSERT INTO `privacy_settings` (`id`, `setting_key`, `setting_value`, `description`, `updated_at`) VALUES
(1, 'data_retention_period', '7', 'Default data retention period in years', '2025-07-31 13:25:32'),
(2, 'auto_delete_completed_requests', '365', 'Auto-delete completed requests after X days', '2025-07-31 13:25:32'),
(3, 'email_notifications_enabled', '1', 'Enable email notifications for new privacy requests', '2025-07-31 13:25:32'),
(4, 'gdpr_compliance_mode', '1', 'Enable GDPR compliance features', '2025-07-31 13:25:32'),
(5, 'privacy_policy_version', '2.0', 'Current privacy policy version - Updated with comprehensive content from privacy.php', '2025-07-31 13:25:32'),
(6, 'request_response_deadline', '30', 'Days to respond to privacy requests', '2025-07-31 13:25:32'),
(7, 'admin_notification_email', 'admin@virungaecotours.com', 'Email for privacy request notifications', '2025-07-31 13:25:32');

-- --------------------------------------------------------

--
-- Table structure for table `programs`
--

CREATE TABLE `programs` (
  `id` int NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `subtitle` text COLLATE utf8mb4_general_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `programs`
--

INSERT INTO `programs` (`id`, `title`, `subtitle`) VALUES
(1, 'Helping People. Saving Gorillas.', 'Through hands-on conservation efforts, education programs and collaboration with local partners, we’re not only ensuring the survival of gorillas but also fostering a future where people and wildlife can thrive together.');

-- --------------------------------------------------------

--
-- Table structure for table `program_card`
--

CREATE TABLE `program_card` (
  `id` int NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `text` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `image_link` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `program_card`
--

INSERT INTO `program_card` (`id`, `title`, `text`, `image_link`) VALUES
(7, 'Join the Community Clean-Up Movement', 'Together, let’s make our neighborhood a cleaner, greener space!', '1746412163_kigali.jpeg'),
(8, 'Empowering the Next Generation fabrice', 'A platform for youth voices, innovation, and leadership in the community.', '681896e0bfdfc_igiraneza.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `program_card_content`
--

CREATE TABLE `program_card_content` (
  `id` int NOT NULL,
  `program_card_id` int DEFAULT NULL,
  `content` text COLLATE utf8mb4_general_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `program_card_gallery`
--

CREATE TABLE `program_card_gallery` (
  `id` int NOT NULL,
  `program_card_id` int DEFAULT NULL,
  `image_link` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `alt_text` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `styleguide_cards`
--

CREATE TABLE `styleguide_cards` (
  `card_id` int NOT NULL,
  `title` varchar(255) NOT NULL,
  `thumbnail_image` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `styleguide_cards`
--

INSERT INTO `styleguide_cards` (`card_id`, `title`, `thumbnail_image`, `created_at`) VALUES
(2, 'Women Eco Safaris to Africa', 'thumb_684097ffeb4f6.jpg', '2025-06-04 19:01:19'),
(5, 'Family Travel', 'thumb_684ace3ba3f8e.jpg', '2025-06-12 12:55:23'),
(6, 'Honeymoon & Romance', 'thumb_684acf6989152.jpg', '2025-06-12 13:00:25'),
(11, 'Solo Travellers', 'thumb_684adc68f2c49.jpg', '2025-06-12 13:14:21'),
(12, 'Couples & Friends', 'thumb_684ad4f601c3f.jpg', '2025-06-12 13:19:51'),
(13, 'The Safari Experience', 'thumb_684ad7a5d9dc0.jpg', '2025-06-12 13:35:33'),
(14, 'First Time on a Safari?', 'thumb_684ad8354e78c.jpg', '2025-06-12 13:37:57'),
(15, 'Safari Experiences & Gorilla Activities', 'thumb_684ae5492e0cc.jpg', '2025-06-12 13:39:29'),
(16, 'Private Homestays& Estate', 'thumb_684adc0be9e6e.jpg', '2025-06-12 13:42:39'),
(17, 'Safari Camps, Lodges, and Hotels', 'thumb_684ad9e40cd73.jpg', '2025-06-12 13:45:08'),
(18, 'Planning Your Safari', 'thumb_684ada2eb9b5d.jpg', '2025-06-12 13:46:22'),
(19, 'Returning Guests', 'thumb_684adace1d1ea.jpg', '2025-06-12 13:49:02');

-- --------------------------------------------------------

--
-- Table structure for table `styleguide_content`
--

CREATE TABLE `styleguide_content` (
  `content_id` int NOT NULL,
  `card_id` int NOT NULL,
  `hero_image` varchar(255) DEFAULT NULL,
  `intro_text` text,
  `main_content` text,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `styleguide_content`
--

INSERT INTO `styleguide_content` (`content_id`, `card_id`, `hero_image`, `intro_text`, `main_content`, `updated_at`) VALUES
(1, 2, 'hero_68409a0a51ad2.jpg', 'Experience the wild with confidence, sisterhood, and purpose. Our women-led eco safaris offer a safe, enriching, and sustainable way for women to explore Africa’s most breathtaking natural wonders—from gorilla forests to golden savannahs.', '[{\"type\":\"list\",\"title\":\"Why Choose a Women’s Eco Safari?\",\"items\":[\"Safe & Supportive Travel: Women-focused itineraries with vetted guides, female hosts, and secure stays\",\"Eco-Conscious Journeys: Stay in eco-lodges, reduce your footprint, and support conservation efforts\",\"Community Connections: Engage with local women-led cooperatives, markets, and artisan workshops\",\"Mindful & Healing Moments: Yoga in the forest, journaling by the lake, or spa retreats in the wild\",\"Travel with Purpose: Give back through cultural exchanges, volunteering, or conservation tours\"]},{\"type\":\"list\",\"title\":\"Sample Eco-Safari Itinerary (7 Days)\",\"items\":[\"Day 1: Arrival in Kigali + Dinner at a women-owned organic farm café\",\"Day 2: Akagera National Park game drive + boat safari at sunset\",\"Day 3: Transfer to Lake Kivu + yoga, storytelling, and lakeside meditation\",\"Day 4: Visit women’s weaving cooperative + nature walk with female guide\",\"Day 5: Gorilla trekking in Volcanoes National Park (with local eco-guide)\",\"Day 6: Forest walk in Nyungwe or spa session at a mountain lodge\",\"Day 7: Depart with reflection session and optional artisan gift shopping\"]},{\"type\":\"text\",\"title\":\"Destinations That Welcome Women\",\"content\":\"\"},{\"type\":\"list\",\"title\":\"* rw Rwanda\",\"items\":[\"Kigali: Women-run cafés, ethical fashion boutiques, and Genocide Memorial tours\",\"Volcanoes National Park: Female-led gorilla treks and eco-luxury camps\",\"Akagera National Park: Quiet savannah drives with private female rangers\",\"Gisagara / Huye: Local crafts and Imigongo art workshops with rural women\"]},{\"type\":\"list\",\"title\":\"* 🇺🇬 Uganda\",\"items\":[\"Bwindi Forest: Gorilla trekking and cultural walks with Batwa women guides\",\"Jinja: Nile cruises, yoga retreats, and women-led community tours\",\"Fort Portal: Tea estate walks and cooking experiences hosted by women\"]},{\"type\":\"list\",\"title\":\"* 🇨🇩 DR Congo\",\"items\":[\"Virunga National Park: Conservation education and treks with eco-trained guides\",\"Tchegera Island: Peaceful, nature-rich hideaway perfect for reflection\",\"Goma: Cultural tours with female-led artisan groups and cooperatives\"]},{\"type\":\"list\",\"title\":\"Where to Stay\",\"items\":[\"Heaven Boutique Hotel\\tRwanda\\tWomen-staffed, sustainability-focused, in central Kigali\",\"Mahogany Springs Lodge\\tUganda\\tLuxury lodge with privacy and warm service near Bwindi\",\"Tchegera Island Camp\\tDR Congo\\tEco-luxury tents, perfect for healing retreats or friend groups\",\"Nyungwe House (One&Only)\\tRwanda\\tUltimate wellness and nature experience\"]},{\"type\":\"list\",\"title\":\"What to Pack for a Women’s Eco Safari\",\"items\":[\"Light layers & neutral wear: For trekking, modesty in villages, and comfort in variable climates\",\"Reusable water bottle: Reduce plastic waste while staying hydrated\",\"Scarf or wrap: Versatile for sun, wind, and cultural settings\",\"Notebook or journal: Reflect, write, or sketch your experience\",\"Camera or Polaroid: Capture moments you’ll treasure forever\",\"Natural skincare & SPF: Essential for sun and eco-sensitive environments\"]},{\"type\":\"list\",\"title\":\"Voices from Women Travelers\",\"items\":[\"“Traveling with other women gave me courage, connection, and clarity.”\",\"“We laughed, cried, and watched gorillas together. It was life-changing.”\",\"“Being led by local women made it feel authentic and deeply personal.”\"]},{\"type\":\"text\",\"title\":\"Your Journey Begins Here\",\"content\":\"Join a women-only or women-friendly eco safari crafted for meaning, sustainability, and connection in Rwanda, Uganda, or DR Congo.\\n\\nRequest an Itinerary or ask about upcoming Women’s Safari Retreats.\"}]', '2025-06-18 13:39:25'),
(2, 16, 'hero_684b17af32b06.jpg', 'For travelers seeking authentic cultural immersion, greater privacy, or a home-away-from-home experience, our Private Homestays and Estates across Rwanda, Uganda, and DR Congo offer comfort, connection, and character in every stay.', '[{\"type\":\"list\",\"title\":\"What Are Private Homestays & Estates?\",\"items\":[\"Private Homestays: Guest rooms within local family homes, offering insight into daily life.\",\"Private Estates: Standalone homes or villas, often surrounded by nature or farmland.\",\"Boutique Villas: High-end properties with personalized service and premium amenities.\"]},{\"type\":\"text\",\"title\":\"Country Highlights\",\"content\":\"\"},{\"type\":\"list\",\"title\":\"* 🇷🇼 Rwanda\",\"items\":[\"Kinigi Community Homestays – Located near Volcanoes National Park with traditional Rwandan hospitality.\",\"Lake Kivu Villas – Private homes on the lake with panoramic views and water access.\",\"Ruhengeri Estate Lodges – Peaceful and self-contained with private chefs and guides.\"]},{\"type\":\"list\",\"title\":\"* 🇺🇬 Uganda\",\"items\":[\"Fort Portal Family Homestays – Close to Kibale Forest, known for warm hosts and organic meals.\",\"Entebbe Lakeside Villas – Ideal for first-night relaxation with beautiful gardens.\",\"Gorilla Valley Homes – Cozy stays near Bwindi with local architecture.\"]},{\"type\":\"list\",\"title\":\"* 🇨🇩 DR Congo\",\"items\":[\"Goma Hills Homestays – Hosted by local families with views of Lake Kivu.\",\"Virunga Eco Estates – Secluded stays near the park boundary, fully serviced.\",\"Bukavu Riverside Villas – Elegant estate properties along the Rusizi River.\"]},{\"type\":\"list\",\"title\":\"Benefits of Staying in a Homestay or Estate\",\"items\":[\"Cultural Immersion\\tLearn local customs, food, music, and language from your hosts.\",\"Privacy and Comfort: Enjoy peaceful surroundings and a slower pace away from busy tourist areas.\",\"Personalized Experiences: Hosts often help organize local tours, meals, and transport.\",\"Affordability or Luxury Choice: Options range from budget-friendly rooms to high-end villas.\",\"Sustainable Travel: Directly supports local families and communities.\"]},{\"type\":\"list\",\"title\":\"What to Expect\",\"items\":[\"Shared or private bathrooms\\t✓ (varies)\\t✓ Standard\",\"Wi-Fi and electricity\\t✓ Basic in most\\t✓ Available in all\",\"Meals included\\t✓ Often homemade\\tOptional or private chef\",\"Local experiences\\t✓ Included (dancing, cooking)\\t✓ Available upon request\",\"Booking flexibility\\t✓ Through us or directly\\t✓ Often pre-arranged\"]},{\"type\":\"list\",\"title\":\"Is It Right for You?\",\"items\":[\"Choose a Homestay if you want authentic interactions, cultural learning, and affordability.\",\"Choose an Estate/Villa if you prefer luxury, total privacy, and tailor-made services.\"]},{\"type\":\"list\",\"title\":\"Respect Local Etiquette\",\"items\":[\"Ask before taking photos of hosts or homes\",\"Dress modestly in rural areas\",\"Learn a few greetings in the local language\",\"Offer small gifts if staying for multiple nights (optional)\"]},{\"type\":\"text\",\"title\":\"Ready to Book a Unique Stay?\",\"content\":\"Our team helps you find trusted homestays and estates that align with your preferences, schedule, and travel style.\\n\\nContact Us or visit the Community Portal for real traveler stories and reviews.\"}]', '2025-06-18 11:44:50'),
(3, 19, 'hero_684c4d7902b16.jpg', 'Program Name: Virunga Voyager Circle.\r\nA heartfelt loyalty program designed for our most cherished travelers. Whether you return every year, refer friends, or simply believe in what we do, the Virunga Voyager Circle gives you more of what you love; deeper access, exclusive perks, and memorable experiences.', '[{\"type\":\"list\",\"title\":\" 3 Membership Tiers\",\"items\":[\"Explorer 1 completed tour with Virunga Ecotours\\tWelcome-back gift, early-bird offers, loyalty newsletter\",\"Pathfinder\\t2–3 completed tours or 1 referral\\tPriority booking, room upgrade (if available), 5% discount\",\"Legacy Member\\t4+ tours or 3+ referrals, or annual traveler\\t10% discount, exclusive experiences, customized itinerary, recognition on website or in-trip ceremony\"]},{\"type\":\"list\",\"title\":\"Core Benefits\",\"items\":[\"Loyalty Discounts: 5–10% off future tours\",\"Custom Itineraries: For Legacy Members, co-create a journey with our team\",\"Surprise Perks: Free cultural add-ons, room upgrades, or private transfers\",\"Exclusive Invitations: Sunset dinners, seasonal pilot trips, or family reunions\",\"Welcome-Back Ritual: Traditional dance or song welcome at your first destination stop\",\"Referral Rewards: Earn $100 (or Rwf equivalent) off your next trip for every friend who books\"]},{\"type\":\"list\",\"title\":\"How Members Join\",\"items\":[\"Automatically enrolled after completing your first tour\",\"Upgrades are awarded based on return visits or referrals\",\"Loyalty status is tracked through your Virunga Guest ID\"]},{\"type\":\"list\",\"title\":\"Optional Add-Ons for Loyalty Members\",\"items\":[\"Name a Tree: Plant a tree in your name in a community reforestation area\",\"Legacy Impact: Support a project in a community you visited (school supplies, eco-projects, etc.)\",\"Annual Loyalty Tour: Once-a-year curated experience only for Voyager Circle members\"]},{\"type\":\"text\",\"title\":\"\",\"content\":\"You came as a traveler. You return as kin. Join the Virunga Voyager Circle; where every step forward feels like coming home.\"}]', '2025-06-18 01:12:12'),
(5, 18, NULL, 'Embarking on a safari across the Virunga massif Rwanda, Uganda, and DR Congo offers a rare opportunity to explore Africa’s most breathtaking landscapes, diverse wildlife, and rich cultures. This guide simplifies every step to help you plan a meaningful and seamless journey across the three countries.', '[{\"type\":\"list\",\"title\":\"Regional Safari Highlights\",\"items\":[\"Rwanda: Gorilla trekking in Volcanoes National Park, canopy walks in Nyungwe, Big Five in Akagera.\",\"Uganda: Chimpanzee tracking in Kibale, gorillas in Bwindi, boat safaris in Murchison Falls.\",\"DR Congo: Gorilla trekking in Virunga, Nyiragongo volcano hike, biodiversity of Maiko National Park.\"]},{\"type\":\"text\",\"title\":\"Step-by-Step Safari Planning\",\"content\":\"A quick and easy guide to help you organize your dream safari—from choosing the right destination to booking permits and preparing for your trip.\"},{\"type\":\"list\",\"title\":\"* Choose Your Safari Type\",\"items\":[\"Wildlife Safaris: Game drives in Akagera (Rwanda), Queen Elizabeth (Uganda), or Garamba (DRC)\",\"Gorilla Trekking: Volcanoes (Rwanda), Bwindi/Mgahinga (Uganda), or Virunga (DRC)\",\"Primates & Forests: Chimpanzees in Nyungwe (Rwanda), Kibale (Uganda), or Lomami (DRC)\",\"Volcano Expeditions: Nyiragongo Hike (DRC), Mount Sabinyo trek (Uganda/Rwanda)\",\"Cultural & Community Tours: Visit local communities and experience traditional lifestyles\"]},{\"type\":\"list\",\"title\":\"* Travel Timing\",\"items\":[\"Dry Seasons: June–September, December–February (best for trekking and wildlife viewing)\",\"Green Seasons: March–May, October–November (lush scenery, fewer tourists)\"]},{\"type\":\"list\",\"title\":\"* Build a Multi-Country Itinerary\",\"items\":[\"Combine parks and experiences across borders for a deeper adventure.\",\"Our team helps with logistics, permits, and personalized routes.\"]},{\"type\":\"list\",\"title\":\"Travel Tips\",\"items\":[\"Gorilla Permits: Must be booked months in advance; vary by country\",\"Health Requirements: Yellow fever vaccination needed; consult for malaria meds\",\"Border Crossings: Bring passports, visa info, and check current travel advisories\",\"Local Guides: Required in most parks; we offer expert-led tours for all nationalities\",\"Security: Travel with verified operators; DRC requires guided entry to Virunga\"]},{\"type\":\"list\",\"title\":\"Responsible Tourism\",\"items\":[\"Community livelihoods through local hiring and homestays\",\"Wildlife protection and anti-poaching initiatives\",\"Cultural heritage and conservation education\"]},{\"type\":\"list\",\"title\":\"Need Help Planning?\",\"items\":[\"Design a personalized itinerary across multiple countries\",\"Arrange permits, transfers, and accommodations\",\"Provide expert safari guides and 24/7 travel support\"]}]', '2025-06-18 11:25:19'),
(6, 17, 'hero_684c4745183bd.jpeg', 'Choosing the right accommodation is key to a comfortable and immersive safari experience. Whether you\'re seeking rustic adventure under the stars or luxury in the heart of the wild, our curated camps, lodges, and hotels across Rwanda, Uganda, and DR Congo offer something for every traveler.', '[{\"type\":\"list\",\"title\":\"Types of Accommodations\",\"items\":[\"Tented Safari Camps: Semi-permanent or mobile tents with en-suite bathrooms, often located in private reserves.\",\"Eco-Lodges: Sustainable properties built with natural materials, blending with the environment.\",\"Luxury Lodges: High-end accommodations with fine dining, spas, and panoramic views.\",\"Mid-range Lodges: Comfortable and well-serviced lodges with modern amenities at a moderate price.\",\"Hotels: Located in major towns and cities; ideal for arrivals, departures, or cultural excursions.\"]},{\"type\":\"text\",\"title\":\"Regional Highlights\",\"content\":\"\"},{\"type\":\"list\",\"title\":\"* Rwanda\",\"items\":[\"Bisate Lodge – Luxury lodge near Volcanoes National Park.\",\"Akagera Game Lodge – Scenic views and wildlife immersion inside Akagera National Park.\",\"Nyungwe Top View Hill Hotel – Overlooking Nyungwe Forest with cozy cabins.\"]},{\"type\":\"list\",\"title\":\"* Uganda\",\"items\":[\"Buhoma Lodge – Gorilla trekking base in Bwindi.\",\"Paraa Safari Lodge – River Nile views in Murchison Falls National Park.\",\"Kibale Forest Camp – Chimp trekking and forest views.\"]},{\"type\":\"list\",\"title\":\"* DR Congo\",\"items\":[\"Mikeno Lodge – Near gorilla habitats in Virunga National Park.\",\"Bukima Tented Camp – Remote gorilla tracking base with mountain views.\",\"Tchegera Island Camp – A peaceful island escape on Lake Kivu.\"]},{\"type\":\"list\",\"title\":\"Accommodation Tips\",\"items\":[\"Book Early: Top lodges near gorilla parks fill up fast, especially in dry seasons.\",\"Check Inclusions: Rates may include meals, permits, guides, or park fees.\",\"Connectivity: Expect limited or no Wi-Fi in remote camps—part of the charm!\",\"Power & Water: Some eco-camps use solar power or have limited hot water hours.\",\"Safety: All properties work with park authorities and provide secure environments.\"]},{\"type\":\"list\",\"title\":\"Choosing the Right Stay\",\"items\":[\"Luxury Traveler: Look for lodges with spa services, gourmet dining, and private balconies.\",\"Budget Explorer: Opt for community-run guesthouses or mid-range camps with full-board options.\",\"Adventure Seeker: Choose tented or remote eco-camps for a more intimate experience with nature.\"]},{\"type\":\"list\",\"title\":\"Responsible Stays\",\"items\":[\"Support local employment and training\",\"Follow sustainable building and waste practices\",\"Protect wildlife corridors and ecosystems\"]},{\"type\":\"text\",\"title\":\"Need help booking the perfect stay?\",\"content\":\"Contact Us to match your travel style and budget with our top-rated camps, lodges, or hotels in each destination.\"}]', '2025-06-18 11:27:40'),
(7, 15, 'hero_684c4a7188938.jpg', 'Discover unforgettable moments in the heart of Africa through immersive safari adventures and gorilla encounters across Rwanda, Uganda, and DR Congo. Whether tracking majestic gorillas, observing the Big Five, or hiking volcanic trails, these experiences connect you deeply with nature and conservation.', '[{\"type\":\"list\",\"title\":\"Signature Safari Experiences\",\"items\":[\"Game Drives: Explore savannahs in open vehicles to see elephants, lions, giraffes, and more.\",\"Boat Safaris: Cruise rivers and lakes for hippos, crocodiles, and water birds.\",\"Walking Safaris: Guided nature walks through savannah or forest with armed rangers.\",\"Birdwatching Tours: Ideal for spotting rare and endemic species in rich ecosystems.\",\"Cultural Encounters: Visit local villages, learn traditions, and engage in community life.\",\"Night Safaris: See nocturnal animals come alive under the stars in selected parks.\",\"Volcano Hikes: Trek active and dormant volcanoes such as Nyiragongo or Mount Sabinyo.\"]},{\"type\":\"list\",\"title\":\"Gorilla Trekking & Primate Tracking\",\"items\":[\"Gorilla Trekking: Rwanda, Uganda, DR Congo A once-in-a-lifetime experience to meet endangered mountain gorillas.\",\"Golden Monkey Tracking: Rwanda, Uganda\\tFun, fast-moving primates with golden fur, found near gorilla zones.\",\"Chimpanzee Tracking: Uganda, Rwanda, DRC High-energy forest walks to observe our closest relatives.\",\"Habituation Experience: Uganda (Bwindi, Kibale)\\tSpend extended time with gorilla or chimp families in their natural routine.\"]},{\"type\":\"list\",\"title\":\"Important Gorilla Trekking Tips\",\"items\":[\"Permits must be booked in advance through licensed tour operators.\",\"Fitness: Expect 2–6 hours of hiking through steep, muddy terrain.\",\"Packing: Bring gloves, gaiters, waterproof gear, and energy snacks.\",\"Health: Anyone with flu/colds is not allowed to visit gorillas.\",\"Group size: Maximum 8 people per gorilla family per day.\",\"Time limit: 1 hour with the gorillas once located.\",\"Behavior: Stay quiet, avoid eye contact, and never touch the gorillas.\"]},{\"type\":\"text\",\"title\":\"Combine Safari & Primate Tours\",\"content\":\"Design a multi-destination adventure:\"},{\"type\":\"list\",\"title\":\"\",\"items\":[\"Track gorillas in Rwanda, then safari in Akagera\",\"See chimpanzees in Kibale, then cruise the Nile in Murchison Falls\",\"Explore Virunga, hike Nyiragongo, and relax on Lake Kivu\"]},{\"type\":\"text\",\"title\":\"Conservation Impact\",\"content\":\"Participating in gorilla and wildlife experiences helps:\"},{\"type\":\"list\",\"title\":\"\",\"items\":[\"Fund national parks and anti-poaching units\",\"Create jobs for local guides, porters, and communities\",\"Raise awareness for species preservation\"]},{\"type\":\"text\",\"title\":\"Need Help Planning Your Trek or Safari?\",\"content\":\"We organize all-inclusive permits, transport, and lodging packages with certified guides across Rwanda, Uganda, and DRC.\\n\\nContact Us or explore Our Experiences for curated adventures.\"}]', '2025-06-18 11:43:49'),
(8, 14, 'hero_684c4ac388952.jpg', 'Planning your first-ever safari can be both exciting and overwhelming. Whether you\'re heading to Rwanda, Uganda, or DR Congo, we make your first experience smooth, safe, and unforgettable. Here’s everything beginners need to know before stepping into the wild.', '[{\"type\":\"text\",\"title\":\"What to Expect on Your First Safari\",\"content\":\"Wildlife Viewing: Up-close encounters with elephants, lions, gorillas, antelopes, and more.\\n\\nDaily Game Drives: Morning and afternoon safaris in 4x4 vehicles with professional guides.\\n\\nNatural Sounds & Silence: Enjoy birdsong, rustling trees, and distant roars – it’s magical.\\n\\nCultural Moments: Friendly locals, vibrant crafts, and traditional dances.\\n\\nLimited Connectivity: Expect minimal Wi-Fi in national parks—perfect for digital detox.\"},{\"type\":\"list\",\"title\":\" First-Time Safari Packing List\",\"items\":[\"Neutral-colored clothing: Helps blend with the environment; avoid bright colors.\",\"Comfortable walking shoes: Useful for nature walks or gorilla trekking.\",\"Binoculars: Enhances distant wildlife viewing.\",\"Camera (with zoom lens): Capture unforgettable moments without disturbing animals.\",\"Insect repellent & sunscreen: Protection from bugs and sun in open vehicles or trails.\",\"Hat & sunglasses: Shield against the midday African sun.\",\"Refillable water bottle: Stay hydrated during drives and treks.\"]},{\"type\":\"text\",\"title\":\"Beginner Tips for a Safe and Enjoyable Safari\",\"content\":\"Follow Your Guide’s Instructions: Safety always comes first in the wild.\\nStay Quiet During Sightings: Helps you observe more and respect the animals.\\nRespect Distance: Never approach or feed wildlife.\\nStay in Your Vehicle: Always unless told otherwise by your guide.\\nPack Light: But smart—conditions vary between parks and altitudes.\\nUse Layers: Mornings can be chilly, mid-days hot.\"},{\"type\":\"text\",\"title\":\"Ideal Itinerary for First-Timers\",\"content\":\"Day 1: Arrive and relax at your lodge or hotel\\n\\nDay 2: Morning game drive + cultural village visit\\n\\nDay 3: Gorilla or chimp trekking adventure\\n\\nDay 4: Nature walk or boat safari + local market experience\\n\\nDay 5: Optional volcano hike or relaxing lakeside retreat before departure\"},{\"type\":\"text\",\"title\":\"First-Timer FAQs\",\"content\":\"Is it safe?\\nAbsolutely. All safaris are led by trained, licensed guides.\\n\\nDo I need vaccinations?\\nYellow fever vaccine is often required. Malaria prevention is also recommended.\\n\\nWill I see gorillas on my first try?\\nGorilla trekking is highly successful (~95%+), but not guaranteed.\\n\\nCan I travel solo?\\nYes! We cater to solo travelers, couples, families, and groups.\"},{\"type\":\"text\",\"title\":\"Still have questions?\",\"content\":\"Let our team guide you through every step of planning your first safari adventure from packing advice to personalized itineraries.\\n\\nContact Us or explore Our Beginner Packages to get started with confidence.\"}]', '2025-06-18 12:00:44'),
(9, 13, 'hero_684c4b4a851b7.jpg', 'A safari is more than just a journey, it’s a transformational adventure into the heart of Africa’s wilderness. From sunrise game drives to sundowners by the savannah, the Safari Experience across Rwanda, Uganda, and DR Congo blends wildlife, nature, and culture into unforgettable moments.', '[{\"type\":\"list\",\"title\":\"What Defines a True Safari Experience?\",\"items\":[\"Game Drives: Morning and afternoon excursions in 4x4 vehicles guided by experts.\",\"Wildlife Encounters: Sightings of elephants, lions, zebras, hippos, gorillas, and rare birds.\",\"Local Culture: Visits to nearby communities, cultural performances, and artisan workshops.\",\"Scenic Landscapes: From volcanoes and lakes to rainforests and savannahs.\",\"Bush Meals & Sundowners: Dining in the wild or enjoying drinks while watching the African sunset.\",\"Lodging in Nature: Sleep under the stars or wake to the sounds of the wild in eco-lodges and camps.\"]},{\"type\":\"text\",\"title\":\" Safari Destinations by Country\",\"content\":\"\"},{\"type\":\"list\",\"title\":\"* 🇷🇼 Rwanda\",\"items\":[\"Akagera National Park – Classic game drives, boat safaris, and the Big Five.\",\"Volcanoes National Park – Gorilla trekking and golden monkey tracking.\",\"Nyungwe Forest – Canopy walks and chimpanzee tracking in lush highlands.\"]},{\"type\":\"list\",\"title\":\"* 🇺🇬 Uganda\",\"items\":[\"Queen Elizabeth NP – Tree-climbing lions, boat safaris, and crater lakes.\",\"Murchison Falls NP – Powerful waterfalls and abundant wildlife along the Nile.\",\"Bwindi & Kibale Forests – Primate capital of East Africa.\"]},{\"type\":\"list\",\"title\":\"* 🇨🇩 DR Congo\",\"items\":[\"Virunga National Park – Gorilla trekking and the iconic Nyiragongo Volcano hike.\",\"Kahuzi-Biega NP – Home to Eastern Lowland Gorillas.\",\"Tchegera Island – Unique boat safari and kayaking options on Lake Kivu.\"]},{\"type\":\"list\",\"title\":\"Daily Safari Rhythm\",\"items\":[\"5:30 AM – 8:00 AM: Early morning game drive – best time for active predators and sunrise views\",\"8:00 AM – 10:00 AM: Bush breakfast or return to lodge for full breakfast\",\"11:00 AM – 1:00 PM: Leisure, short walks, or cultural experiences\",\"2:00 PM – 4:30 PM: Afternoon game drive or gorilla tracking return\",\"5:00 PM – 6:30 PM: Sundowners and scenic photography\",\"7:00 PM – 9:00 PM: Dinner and storytelling by the fire under the stars\"]},{\"type\":\"list\",\"title\":\"Key Moments to Capture\",\"items\":[\"Elephants crossing a dirt track at sunrise\",\"A lion pride lounging in tall golden grass\",\"Gentle mountain gorillas feeding in silence\",\"Sunset reflected in a still crater lake\",\"Local dancers performing around the campfire\"]},{\"type\":\"list\",\"title\":\"Why Travelers Love The Safari Experience\",\"items\":[\"Real Connection with Nature: Unplug, unwind, and feel present in the moment\",\"Educational & Inspiring: Learn from local guides and trackers\",\"Family-Friendly: Safaris are perfect for all ages with flexible itineraries\",\"Life-Changing Encounters: Witnessing wildlife up close leaves lasting impact\",\"Sustainable Tourism: Your visit directly supports wildlife and community efforts\"]},{\"type\":\"text\",\"title\":\"Dreaming of your own safari experience?\",\"content\":\"We help craft personalized journeys that suit your pace, interests, and budget—whether you want full wildlife immersion, primate tracking, or cultural enrichment.\\n\\nContact Us to begin planning your ultimate African safari today.\"}]', '2025-06-18 12:39:53'),
(10, 12, 'hero_684c4bba55d70.jpg', 'Whether you\'re planning a romantic getaway or an unforgettable adventure with friends, safaris and nature escapes across Rwanda, Uganda, and DR Congo offer magical moments, thrilling experiences, and lifelong memories. Explore, relax, and bond in Africa’s most enchanting wild places.', '[{\"type\":\"list\",\"title\":\"Perfect For...\",\"items\":[\"Romantic Escapes: Secluded lodges, candlelit bush dinners, scenic sunset drives.\",\"Adventure with Friends: Gorilla trekking, volcano hikes, kayaking, cultural immersions.\",\"Honeymooners: Private rooms with nature views, spa add-ons, and curated activities.\",\"Small Groups: Shared safaris, storytelling by the fire, flexible day tours for all interests.\"]},{\"type\":\"list\",\"title\":\"Top Experiences for Couples & Friends\",\"items\":[\"Private Game Drives: Explore parks in your own 4x4 with personal guides and flexible timing.\",\"Gorilla Trekking Together: Share a life-changing experience in the misty forests of Virunga or Bwindi.\",\"Lake Kivu Getaway: Relax by the water with boat rides, coffee tours, and island picnics.\",\"Hot Springs & Spa Relaxation: Unwind at Rubavu or Semuliki hot springs with wellness-focused add-ons.\",\"Cultural Evenings: Dance, drumming, and cooking nights with local communities.\",\"Volcano Hikes: Take on an epic adventure together up Mount Nyiragongo or Mount Bisoke.\",\"Bush Sundowners: Toast to friendship or love with drinks overlooking the savannah sunset.\"]},{\"type\":\"list\",\"title\":\"Recommended Lodges & Retreats\",\"items\":[\"Rwanda – Akagera NP: Ruzizi Tented Lodge, Magashi Camp (romantic eco-luxury by the lake)\",\"Rwanda – Lake Kivu: Kivu Lodge, Paradis Malahide (scenic hideaways)\",\"Uganda – Bwindi: Clouds Mountain Lodge, Mahogany Springs (private, luxurious)\",\"Uganda – Lake Bunyonyi: BirdNest Resort, Bunyonyi Overland (perfect for couples & groups)\",\"DR Congo – Virunga NP: Mikeno Lodge, Tchegera Island Camp (secluded eco-retreats)\"]},{\"type\":\"list\",\"title\":\"Special Packages\",\"items\":[\"Honeymoon Safari: Champagne, private dining, floral arrangements, couple’s massage\",\"Friends\' Adventure Tour: Group gorilla permits, multi-vehicle safaris, shared accommodation deals\",\"Weekend Escapes: Short 2–3 day packages with local transport and optional cultural visits\"]},{\"type\":\"list\",\"title\":\"Traveler Tips\",\"items\":[\"Book in Advance: Lodges and permits for couples/groups sell out quickly during peak season\",\"Go Private if You Can: Splitting costs between friends often makes private experiences affordable\",\"Pack Light but Stylish: Lightweight neutral clothing + 1 outfit for romantic dinners\",\"Capture the Moments: Bring a shared photo album, drone, or polaroid to document your journey\",\"Leave Room for Downtime: Mix high-energy days with time to relax and bond\"]},{\"type\":\"text\",\"title\":\"Ready to plan a couples or friends safari?\",\"content\":\"We’ll help you design the perfect trip—whether it’s adventurous, romantic, or both—across Rwanda, Uganda, and DR Congo.\\n\\nContact Us to explore our curated safari itineraries for couples and small groups.\"}]', '2025-06-18 13:08:33'),
(11, 11, 'hero_684c4c0498949.jpg', 'Traveling alone doesn’t mean going alone. For adventurous spirits seeking freedom, self-discovery, and connection, solo safaris and nature journeys across Rwanda, Uganda, and DR Congo offer enriching, safe, and inspiring experiences.', '[{\"type\":\"text\",\"title\":\"Why Go Solo?\",\"content\":\"Freedom to Explore\\tSet your own pace and choose the activities that interest you most.\\nPersonal Growth\\tStep out of your comfort zone and embrace new cultures, landscapes, and people.\\nFlexibility: Customize your itinerary without compromise.\\nMeet Fellow Travelers\\tJoin shared safaris, group treks, and community meals to connect on the road.\\nInner Peace: Reconnect with nature, unplug from routine, and find clarity in the wild.\"},{\"type\":\"text\",\"title\":\"Safety & Support for Solo Travelers\",\"content\":\"Trusted Local Guides: Travel with experienced, certified safari guides and rangers.\\n24/7 Assistance: Our team remains in contact throughout your journey.\\nSecure Accommodations: Carefully vetted homestays, lodges, and hotels with solo options.\\nGroup Tour Options: Join mixed groups for cost savings and camaraderie.\\nFemale-Solo-Friendly: Safe environments and custom itineraries for solo female travelers.\"},{\"type\":\"text\",\"title\":\"Top Solo Activities by Country\",\"content\":\"\"},{\"type\":\"list\",\"title\":\"* rw Rwanda\",\"items\":[\"Gorilla trekking in Volcanoes NP\",\"Nature walks in Nyungwe Forest\",\"Wildlife photography and boat safari in Akagera NP\",\"Local coffee or banana beer experience in Musanze\"]},{\"type\":\"list\",\"title\":\"* ug Uganda\",\"items\":[\"Chimp tracking in Kibale\",\"Cultural immersion in Bigodi or Jinja\",\"Game drives in Queen Elizabeth NP\",\"Solo-friendly stays at Lake Bunyonyi\"]},{\"type\":\"list\",\"title\":\"* 🇨🇩 DR Congo\",\"items\":[\"Climbing Mount Nyiragongo (group-based expeditions)\",\"Gorilla trekking in Virunga or Kahuzi-Biega\",\"Kayaking and birdwatching on Tchegera Island\",\"Artisan market exploration in Goma\"]},{\"type\":\"list\",\"title\":\"Solo Traveler Essentials\",\"items\":[\"Good Backpack: Carry essentials for day treks and transfers.\",\"Travel Journal or Camera: Capture reflections, photos, and memorable wildlife encounters.\",\"E-Reader or Book: Great for evenings at camp or solo downtime.\",\"Portable Charger: Electricity may be limited in remote areas.\",\"Local SIM or eSIM: Stay connected with mobile data across regions.\"]},{\"type\":\"list\",\"title\":\"Tips from Other Solo Travelers\",\"items\":[\"“Don’t be afraid to join group tours – they’re welcoming and fun.”\",\"“I loved having a mix of structured and free time in my itinerary.”\",\"“A guide made all the difference. I felt safe and deeply informed.”\",\"“Evenings around the fire were great for sharing stories with other travelers.”\"]},{\"type\":\"text\",\"title\":\"Ready to go solo across East Africa?\",\"content\":\"Whether it’s your first solo trip or your tenth, we help you build a secure, meaningful adventure tailored to you.\\n\\nStart Planning Now or explore our Solo Safari Packages.\"}]', '2025-06-18 13:18:50'),
(12, 6, 'hero_684c4c7506c8b.jpg', 'Celebrate your love with a romantic journey through the wild beauty of East and Central Africa. Whether it’s your honeymoon, anniversary, or just a special escape, we create intimate safari experiences across Rwanda, Uganda, and DR Congo that blend nature, luxury, and emotion.', '[{\"type\":\"list\",\"title\":\"Why Choose a Safari Honeymoon?\",\"items\":[\"Unforgettable Settings: Sunsets over savannahs, misty gorilla forests, starlit skies by Lake Kivu.\",\"Secluded Luxury: Private lodges, exclusive tented camps, and hidden island retreats.\",\"Wild Adventure Together: Track gorillas, hike volcanoes, enjoy boat rides and game drives as a couple.\",\"Tailor-Made Moments: Dine in the bush, take scenic helicopter rides, or enjoy couple’s spa time.\",\"Symbolic Connection: Share your first chapter in nature’s most ancient, untouched places.\"]},{\"type\":\"text\",\"title\":\"Top Romantic Destinations\",\"content\":\"\"},{\"type\":\"list\",\"title\":\"* rw Rwanda\",\"items\":[\"Volcanoes National Park – Gorilla trekking with luxury lodges like Bisate or One&Only.\",\"Lake Kivu (Gisenyi/Karongi) – Idyllic lakeside relaxation, private boat trips, and spa experiences.\",\"Akagera National Park – Big Five safaris and stylish eco-lodging with lake views.\"]},{\"type\":\"list\",\"title\":\"* 🇺🇬 Uganda\",\"items\":[\"Bwindi Impenetrable Forest – Misty jungles, treehouse lodges, and intimate primate treks.\",\"Lake Bunyonyi – Canoe rides, island stays, and candlelit dinners by the water.\",\"Murchison Falls NP – Cruise on the Nile and picnic near roaring waterfalls.\"]},{\"type\":\"list\",\"title\":\"* 🇨🇩 DR Congo\",\"items\":[\"Virunga National Park – Private gorilla encounters and the dramatic scenery of the Great Rift.\",\"Tchegera Island – Glamping with volcano views, kayaking, and uninterrupted tranquility.\",\"Nyiragongo Volcano – For adventurous couples, a summit night with stars and lava views.\"]},{\"type\":\"list\",\"title\":\"Our Romantic Add-Ons\",\"items\":[\"Couple’s Massage: Book spa experiences at lodges or lakeside resorts.\",\"Private Dinners: Bush dinners, lakeside setups, or surprise meals under the stars.\",\"Honeymoon Turndown Service: Flowers, champagne, custom notes, and romantic room decorations.\",\"Sunset Cruises: Relax on the lake with wine, music, and stunning views.\",\"Photography Package: Capture professional honeymoon moments in nature.\"]},{\"type\":\"list\",\"title\":\"Best Time for a Honeymoon Safari\",\"items\":[\"June–September: Dry season, ideal for wildlife viewing and gorilla trekking.\",\"December–February: Warm, sunny days – perfect for lake stays and outdoor dinners.\",\"March–May: Green season with fewer tourists and lush romantic landscapes.\"]},{\"type\":\"list\",\"title\":\"Why Couples Love It\",\"items\":[\"“The views were breathtaking, but the quiet intimacy was the best part.”\",\"“We’ll never forget waking up in the forest and seeing gorillas on our honeymoon!”\",\"“Every detail felt designed just for us—from the meals to the lodge atmosphere.”\"]},{\"type\":\"text\",\"title\":\"Let Love Lead the Way\",\"content\":\"We help couples plan unique, magical, and stress-free romantic safaris—perfectly balanced between luxury, adventure, and heart.\\n\\nBook Your Honeymoon Safari or get in touch for custom romantic itineraries.\"}]', '2025-06-18 13:25:03'),
(13, 5, 'hero_684c4cda79dd8.jpg', 'Turn your next family vacation into a journey of discovery, bonding, and unforgettable wildlife experiences. From spotting elephants on a game drive to sharing stories by a campfire, family safaris in Rwanda, Uganda, and DR Congo are safe, flexible, and filled with meaningful moments for all ages.', '[{\"type\":\"list\",\"title\":\"Why Choose a Safari for Families?\",\"items\":[\"Educational & Fun: Kids learn about nature, animals, and culture in exciting, hands-on ways.\",\"Flexible Activities: Customized to fit different ages and energy levels.\",\"Screen-Free Connection: Reconnect as a family without the distractions of everyday life.\",\"Safe & Guided Travel: Professional guides, safe accommodations, and tailored itineraries.\",\"Shared Memories: Experience gorillas, waterfalls, and wild plains—together.\"]},{\"type\":\"text\",\"title\":\"Family-Friendly Safari Destinations\",\"content\":\"\"},{\"type\":\"list\",\"title\":\"* rw Rwanda\",\"items\":[\"Akagera National Park – Great for first-time safaris: see giraffes, lions, hippos, and zebras.\",\"Kigali Genocide Memorial (Teen-Appropriate) – Learn about Rwanda’s history and resilience.\",\"Lake Kivu – Family relaxation with boat rides, swimming, and lakeside lodges.\",\"Ethnographic Museum in Huye – Cultural education with interactive exhibits.\"]},{\"type\":\"list\",\"title\":\"* 🇺🇬 Uganda\",\"items\":[\"Queen Elizabeth National Park – Spot elephants and tree-climbing lions, with boat cruises for all ages.\",\"Ziwa Rhino Sanctuary – Walk with rhinos and learn about conservation efforts.\",\"Jinja – Nile River – Gentle family rafting and nature walks along the Nile.\",\"Kibale Forest (age 12+) – Chimp tracking for older kids and teenagers.\"]},{\"type\":\"list\",\"title\":\"* 🇨🇩 DR Congo\",\"items\":[\"Tchegera Island – Safe and quiet place for swimming, kayaking, and beach games.\",\"Goma Art Tours – Visit local artisans and paint with Congolese creatives.\",\"Virunga (age 15+) – Older kids can participate in gorilla trekking and volcano hikes.\"]},{\"type\":\"list\",\"title\":\"Family-Friendly Lodges\",\"items\":[\"Rwanda: Karenge Bush Camp (Akagera), Inzu Lodge (Lake Kivu), Heaven Boutique Hotel (Kigali)\",\"Uganda: Kazinga Channel Lodge (QENP), Crater Safari Lodge (Kibale), Lake Bunyonyi Rock Resort\",\"DR Congo: Tchegera Island Camp, Mikeno Lodge (older families), Kivu Lodge (Goma)\"]},{\"type\":\"list\",\"title\":\"What to Pack for Kids\",\"items\":[\"Binoculars: Makes wildlife viewing interactive for young explorers.\",\"Travel Games / Books: Great for quiet evenings or downtime between activities.\",\"Snacks & Water Bottles: Keep kids comfortable during long game drives.\",\"Lightweight Clothing: Neutral colors, long sleeves, and hats for sun protection.\",\"Child-Friendly First Aid: Pack basics like insect repellent, plasters, and sunscreen.\"]},{\"type\":\"list\",\"title\":\"Tips for Traveling with Children\",\"items\":[\"Book Longer Stays per Location: Less moving = less stress for young kids.\",\"Opt for Private Safaris: You control stops, pace, and breaks.\",\"Include Fun Cultural Activities: Drumming lessons, village visits, and cooking classes.\",\"Check Age Restrictions: Some treks (like gorillas) require minimum ages (15+).\",\"Travel Insurance: Make sure the whole family is covered for safari activities.\"]},{\"type\":\"text\",\"title\":\"Create Family Memories That Last a Lifetime\",\"content\":\"Whether you’re traveling with toddlers, teens, or grandparents, we’ll build a safe, exciting, and family-friendly safari tailored to your needs in Rwanda, Uganda, or DR Congo.\\n\\nPlan Your Family Safari with our experts today.\"}]', '2025-06-18 13:31:56');

-- --------------------------------------------------------

--
-- Table structure for table `subscribers`
--

CREATE TABLE `subscribers` (
  `id` int NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `status` tinyint(1) DEFAULT '1',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `subscribers`
--

INSERT INTO `subscribers` (`id`, `email`, `status`, `created_at`) VALUES
(67, 'ceciliagomez677785@yahoo.com', 1, '2025-07-06 07:55:28'),
(68, 'ronaldrandolph1986@gmail.com', 1, '2025-07-07 01:52:27'),
(69, 'bridgerandolrw43@gmail.com', 1, '2025-07-07 04:14:35'),
(70, 'anastasyakgz21@gmail.com', 1, '2025-07-07 13:04:49'),
(71, 'djaneiowemu@gmail.com', 1, '2025-07-08 06:35:16'),
(72, 'enolap42@gmail.com', 1, '2025-07-08 07:03:26'),
(73, 'rangelmelloni7@gmail.com', 1, '2025-07-08 08:54:18'),
(74, 'lopez_paris7383@yahoo.com', 1, '2025-07-08 12:19:20'),
(75, 'schabriannu@gmail.com', 1, '2025-07-08 14:40:11'),
(76, 'bentlcalla@gmail.com', 1, '2025-07-09 06:10:10'),
(77, 'kanesammere9@gmail.com', 1, '2025-07-09 10:15:26'),
(78, 'tgrosst1992@gmail.com', 1, '2025-07-09 19:46:16'),
(79, 'opamequdica654@gmail.com', 1, '2025-07-10 02:02:46'),
(80, 'tujeyoteg309@gmail.com', 1, '2025-07-10 03:34:24'),
(81, 'linnscottvz1989@gmail.com', 1, '2025-07-10 08:00:12'),
(82, 'tozeguyima55@gmail.com', 1, '2025-07-10 15:53:10'),
(83, 'ciniheceg127@gmail.com', 1, '2025-07-10 18:00:55'),
(84, 'niduguboj599@gmail.com', 1, '2025-07-11 04:41:38'),
(85, 'qukemajeqo00@gmail.com', 1, '2025-07-12 03:53:23'),
(86, 'lisblag36@gmail.com', 1, '2025-07-12 08:49:11'),
(87, 'landrykasperr3@gmail.com', 1, '2025-07-13 12:13:25'),
(88, 'lensvf8@gmail.com', 1, '2025-07-13 18:05:31'),
(89, 'ballakli1997@gmail.com', 1, '2025-07-14 00:20:11'),
(90, 'djylijordanr@gmail.com', 1, '2025-07-14 05:35:17'),
(91, 'andriconwaymh9@gmail.com', 1, '2025-07-14 13:51:04'),
(97, 'wpetronelmb@gmail.com', 1, '2025-07-15 05:26:39'),
(98, 'heflincalvin994626@yahoo.com', 1, '2025-07-15 14:50:10'),
(99, 'verhnt31@gmail.com', 1, '2025-07-15 15:14:10'),
(100, 'marrihowellhe2004@gmail.com', 1, '2025-07-17 00:45:06'),
(101, 'eoforhildhorton@gmail.com', 1, '2025-07-17 13:10:22'),
(102, 'hedleisweeneya28@gmail.com', 1, '2025-07-18 23:26:11'),
(103, 'tedwitzigreuter16143@yahoo.com', 1, '2025-07-19 06:52:06'),
(104, 'arroydjeinltu30@gmail.com', 1, '2025-07-19 07:43:25'),
(105, 'fabexozo210@gmail.com', 1, '2025-07-21 02:22:18'),
(106, 'equkefoko02@gmail.com', 1, '2025-07-20 07:11:09'),
(108, 'carsoredjintr@gmail.com', 1, '2025-07-20 21:06:12'),
(109, 'mccardarta65@gmail.com', 1, '2025-07-21 02:21:13'),
(111, 'ohogenaledu62@gmail.com', 1, '2025-07-22 21:05:19'),
(112, 'kirbytoperm@gmail.com', 1, '2025-07-22 21:27:35'),
(113, 'pachecodikvd@gmail.com', 1, '2025-07-24 02:35:46'),
(114, 'hardigy67@gmail.com', 1, '2025-07-24 02:46:50'),
(115, 'ujupuqabilor14@gmail.com', 1, '2025-07-24 07:50:37'),
(116, 'jumhslqs@testform.xyz', 1, '2025-07-24 12:28:10'),
(117, 'guerraflayerdw2001@gmail.com', 1, '2025-07-24 15:09:10'),
(118, 'spoolef2003@gmail.com', 1, '2025-07-25 02:47:06'),
(119, 'equburoxo129@gmail.com', 1, '2025-07-25 09:30:08'),
(120, 'nejakuvoc366@gmail.com', 1, '2025-07-25 23:46:04'),
(121, 'foxleksnq5@gmail.com', 1, '2025-07-26 12:19:04'),
(122, 'moxapowati025@gmail.com', 1, '2025-07-26 21:40:07'),
(123, 'yuhevoyi16@gmail.com', 1, '2025-07-27 13:34:15'),
(124, 'kboydc48@gmail.com', 1, '2025-07-27 16:57:08'),
(125, 'linseilqt75@gmail.com', 1, '2025-07-27 20:44:52'),
(126, 'gawoqomeg067@gmail.com', 1, '2025-07-28 02:44:29'),
(127, 'erindavis611500@yahoo.com', 1, '2025-07-29 02:32:12'),
(128, 'mariopfingston404461@yahoo.com', 1, '2025-07-29 08:10:12'),
(129, 'madisondebbie578349@yahoo.com', 1, '2025-07-29 22:44:35'),
(130, 'donnawedge404018@yahoo.com', 1, '2025-07-30 13:57:02'),
(134, 'fabrdaa@gmail.com', 1, '2025-07-31 09:54:09'),
(138, 'akavurogo229@gmail.com', 1, '2025-07-31 11:33:07'),
(139, 'vavidagapu351@gmail.com', 1, '2025-08-01 02:13:45'),
(140, 'ozobonaxa881@gmail.com', 1, '2025-08-01 06:28:52'),
(141, 'wurimaqunag974@gmail.com', 1, '2025-08-01 11:13:41'),
(142, 'foyudirep83@gmail.com', 1, '2025-08-02 02:45:28'),
(143, 'kamaraheather209722@yahoo.com', 1, '2025-08-02 17:08:05'),
(144, 'vargaskeidens@gmail.com', 1, '2025-08-03 10:03:35'),
(145, 'uqujayid33@gmail.com', 1, '2025-08-03 15:47:16'),
(146, 'oletetopo539@gmail.com', 1, '2025-08-04 13:59:42'),
(152, 'harrisemiti@gmail.com', 1, '2025-08-05 09:44:04'),
(158, 'berrivalentinege48@gmail.com', 1, '2025-08-05 10:15:20'),
(164, 'geielomaldoh39@gmail.com', 1, '2025-08-05 13:58:14'),
(170, 'uvoyufuziq67@gmail.com', 1, '2025-08-06 17:04:18'),
(174, 'haralisyuq4@gmail.com', 1, '2025-08-07 10:03:20'),
(180, 'hoffmankoreiur@gmail.com', 1, '2025-08-07 15:59:10'),
(186, 'dianamitchell597311@yahoo.com', 1, '2025-08-08 15:52:22'),
(191, 'bizudazosu050@gmail.com', 1, '2025-08-09 03:04:15'),
(196, 'sijihoketib32@gmail.com', 1, '2025-08-09 08:09:59'),
(202, 'feqekajem20@gmail.com', 1, '2025-08-09 10:34:01'),
(208, 'zoyecexebu79@gmail.com', 1, '2025-08-10 02:59:41'),
(209, 'etebabosoxu57@gmail.com', 1, '2025-08-10 03:21:08'),
(210, 'pagenoya1983@gmail.com', 1, '2025-08-10 05:17:19'),
(211, 'shortgregory125722@yahoo.com', 1, '2025-08-10 10:15:24'),
(212, 'tillistevens53@gmail.com', 1, '2025-08-11 11:38:19'),
(213, 'soxewopu17@gmail.com', 1, '2025-08-11 13:08:36'),
(214, 'ucujoluli043@gmail.com', 1, '2025-08-11 17:47:33'),
(215, 'anibivutogi428@gmail.com', 1, '2025-08-11 19:25:31'),
(216, 'uligoxiyego834@gmail.com', 1, '2025-08-11 20:39:04'),
(217, 'davefagiqut97@gmail.com', 1, '2025-08-12 13:18:10'),
(218, 'owaponaz68@gmail.com', 1, '2025-08-13 01:36:57'),
(219, 'capepalosiq87@gmail.com', 1, '2025-08-13 04:39:22'),
(220, 'igiyobujadam06@gmail.com', 1, '2025-08-13 06:08:34'),
(221, 'kristymalone114081@yahoo.com', 1, '2025-08-13 13:45:05'),
(222, 'zasedujafoc43@gmail.com', 1, '2025-08-13 23:52:05'),
(223, 'ahilonunus661@gmail.com', 1, '2025-08-14 07:13:50'),
(224, 'venatiwugigo41@gmail.com', 1, '2025-08-14 13:36:25'),
(225, 'oharurusoxef95@gmail.com', 1, '2025-08-14 19:35:39'),
(226, 'herschcarmen885611@yahoo.com', 1, '2025-08-15 00:54:41'),
(227, 'beqehame914@gmail.com', 1, '2025-08-16 00:19:39'),
(228, 'baqoman731@gmail.com', 1, '2025-08-16 08:03:17'),
(229, 'afomufivik35@gmail.com', 1, '2025-08-16 09:33:25'),
(230, 'nopohufuxej416@gmail.com', 1, '2025-08-16 09:44:04'),
(231, 'dulefeyakut33@gmail.com', 1, '2025-08-17 04:49:55'),
(232, 'vedavimequd744@gmail.com', 1, '2025-08-17 16:19:06'),
(233, 'qijudonabo94@gmail.com', 1, '2025-08-17 17:48:53'),
(234, 'ehamiwavo568@gmail.com', 1, '2025-08-18 00:57:44'),
(235, 'wosowusehe81@gmail.com', 1, '2025-08-19 12:29:50'),
(237, 'wocorop498@gmail.com', 1, '2025-08-20 00:22:05'),
(238, 'ufaqebubiwe908@gmail.com', 1, '2025-08-20 05:28:33');

-- --------------------------------------------------------

--
-- Table structure for table `testimonial_content`
--

CREATE TABLE `testimonial_content` (
  `id` int NOT NULL,
  `subtitle` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `text` text COLLATE utf8mb4_general_ci,
  `image_link` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `testimonial_content`
--

INSERT INTO `testimonial_content` (`id`, `subtitle`, `title`, `text`, `image_link`) VALUES
(8, '55+ years of successful conservation work', 'Who we are', 'The Dian Fossey Gorilla Fund saves gorillas and the ecosystems in which they live through a scientific and people-centered approach to create a healthier planet for all.', '1746334233_screencapture-file-C-Users-ADAMA-M-IT-LTD-Documents-jessy-portfolio-Project-Done-movieweb-index-html-2025-04-29-04_28_23.png');

-- --------------------------------------------------------

--
-- Table structure for table `tours`
--

CREATE TABLE `tours` (
  `tour_id` int NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `category` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `country` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `days_count` int NOT NULL,
  `cover_image_path` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `short_description` text COLLATE utf8mb4_general_ci NOT NULL,
  `why_attend` text COLLATE utf8mb4_general_ci,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tours`
--

INSERT INTO `tours` (`tour_id`, `title`, `category`, `country`, `days_count`, `cover_image_path`, `short_description`, `why_attend`, `created_at`, `updated_at`) VALUES
(117, '3-Day Safari in Rwanda’s Volcanoes National Park', 'Adventure', 'rwanda', 3, 'images/tours/6845cd945b04f.jpg', 'This unforgettable 3-day safari takes you to the heart of Rwanda’s Volcanoes National Park, the legendary home of the mountain gorilla and Dian Fossey’s pioneering research. Experience up close encounters with these gentle giants while supporting local conservation efforts. Stay in a comfortable eco-lodge with panoramic views of the Virunga Mountains.', 'This 3-day safari offers a rare chance to encounter endangered mountain gorillas in the wild while actively supporting conservation efforts. Set against the dramatic backdrop of the Virunga Mountains, the trip combines wildlife, breathtaking scenery, and rich cultural encounters from guided village walks to local artisan markets. With eco-lodge comfort, expert guides, and all logistics handled, it’s an ideal high-impact journey for nature lovers, photographers, and travelers short on time but eager for a once-in-a-lifetime experience.', '2025-06-08 17:27:53', '2025-06-09 22:08:23'),
(118, '7-Day Cross-Border Gorilla and Golden Monkey Expedition (Rwanda and Uganda)', 'Adventure', 'rwanda', 7, 'images/tours/684c3968cc3c8.jpg', 'Explore two of Africa’s top primate destinations in one seamless adventure. Trek endangered mountain gorillas in both Rwanda and Uganda, walk with golden monkeys through bamboo forests, and immerse yourself in the beauty and resilience of East Africa’s natural and cultural heritage. This cross-border safari offers deep insight into conservation, local communities, and awe-inspiring wildlife.', 'This expedition offers a rare chance to witness endangered mountain gorillas in their natural habitats across two countries, Rwanda and Uganda. It’s more than just a wildlife safari; it’s an immersive journey into the heart of East Africa’s conservation efforts, local cultures, and breathtaking landscapes. Whether you’re a seasoned wildlife enthusiast, a passionate photographer, or a curious traveler seeking meaningful experiences, this trip promises unforgettable memories, personal growth, and the satisfaction of supporting vital conservation projects. You’ll gain unique insights into primate behavior and habitat, while also connecting with local communities whose lives are intertwined with these incredible animals.', '2025-06-09 17:47:07', '2025-07-04 09:53:52'),
(119, '5-Day Nyiragongo Lava Hike and Gorilla Safari in Congo', 'Adventure', 'congo', 5, 'images/tours/68472a468850a.jpg', 'Venture into one of Africa’s wildest corners to trek an active volcano and meet endangered mountain gorillas. This unique 5-day experience in DR Congo’s Virunga National Park combines high-altitude adventure with awe-inspiring wildlife encounters. A rare and raw expedition designed for thrill-seekers with a love for conservation and exploration.', 'This extraordinary expedition is your chance to stand at the rim of the world’s largest lava lake and lock eyes with a wild mountain gorilla, all in one journey. It’s a raw, off-the-beaten-path experience deep in the heart of Africa’s most legendary national park. Perfect for those craving unmatched adventure, natural beauty, and meaningful encounters with endangered wildlife. From the fiery summit of Mt. Nyiragongo to the misty forests of Virunga, every step is a story. Plus, your visit directly supports conservation and local communities in one of Africa’s most ecologically and politically vital regions.', '2025-06-09 18:39:02', '2025-06-09 22:07:23'),
(120, '7-Day Ultimate Uganda Safari Adventure', 'Adventure', 'uganda', 7, 'images/tours/68473dd004195.jpg', 'Embark on a once-in-a-lifetime journey through Uganda, a land of striking contrasts, where dense rainforests meet golden savannahs, and misty mountains hide endangered gorillas. This carefully curated itinerary offers you up-close encounters with primates, dramatic landscapes, and authentic cultural experiences, all under the guidance of expert local guides who ensure your comfort, safety, and connection to the land. Whether it’s tracking chimps in Kibale or meeting mountain gorillas in Bwindi, this trip is designed to leave you in awe and forever changed.', 'This expertly curated itinerary balances exhilarating wildlife encounters with cultural immersion and scenic beauty. Led by knowledgeable local guides, you’ll enjoy personalized attention, safety, and enriching storytelling that brings Uganda’s wild heart to life. All permits, park fees, and logistics are fully handled, allowing you to focus on creating lifelong memories.', '2025-06-09 20:02:24', '2025-06-09 22:04:19'),
(121, '1-Day Chimpanzee Tracking and Cultural Tour from Kampala ', 'Adventure', 'uganda', 1, 'images/tours/68474946d6b13.webp', 'Discover the extraordinary wildlife and rich culture of Uganda in this immersive one-day tour to Kibale Forest National Park. Track wild chimpanzees in their natural rainforest home, explore the diverse Bigodi Wetland Sanctuary, and engage with local communities to experience authentic Ugandan traditions. Perfect for travelers with limited time who seek a powerful wildlife encounter combined with cultural insight, this tour offers a professional, safe, and unforgettable journey into Uganda’s natural and human heritage.', 'This tour is your gateway to witnessing Uganda’s iconic chimpanzees in the wild, combined with a meaningful cultural experience that supports local communities. Led by knowledgeable guides, it promises a safe, well-organized adventure with unforgettable moments. With limited chimpanzee permits issued daily, early booking is essential to secure your place on this sought-after experience. Whether you’re a wildlife lover, nature photographer, or curious traveler, this one-day tour delivers authentic, life-enriching encounters; all in a convenient, expertly crafted package.', '2025-06-09 20:51:18', '2025-06-09 22:06:52'),
(122, '1-Day Gorilla Trekking Experience in Volcanoes National Park', 'Adventure', 'rwanda', 1, 'images/tours/6847501d716de.webp', 'Immerse yourself in one of Africa’s most extraordinary wildlife encounters with this full-day gorilla trekking adventure in Volcanoes National Park, Rwanda. This carefully curated tour is designed for travelers who seek a profound and authentic experience with the endangered mountain gorillas, while also gaining meaningful insight into the region’s conservation efforts and cultural heritage. Guided by highly trained and knowledgeable park rangers, you will trek through the lush, mist-covered forests of the Virunga volcanic range in search of habituated gorilla families. This is a unique opportunity to witness these majestic creatures in their natural habitat and learn about their behavior, social dynamics, and ongoing protection programs. This day trip offers more than just wildlife viewing, it’s an inspiring journey that connects you to Rwanda’s remarkable natural and cultural landscape.', 'This gorilla trekking experience is not just a wildlife encounter; it is a chance to actively contribute to the conservation of one of the world’s most endangered species. Your participation supports the Rwanda Development Board’s sustainable tourism initiatives that benefit local communities and protect biodiversity. Guided by professional rangers with decades of experience, you are assured of a safe, respectful, and unforgettable experience. Rwanda is renowned globally for its successful mountain gorilla conservation programs, and this trek offers a firsthand glimpse into the remarkable outcomes of these efforts. For wildlife enthusiasts, photographers, and responsible travelers seeking a meaningful connection with nature, this tour delivers profound moments that will stay with you for a lifetime.\r\nBook your gorilla trekking adventure today to guarantee your permit, availability is extremely limited and demand is high. Don’t miss your chance to experience Rwanda’s iconic mountain gorillas in the heart of the Virunga Volcanoes. Begin your journey to one of Africa’s greatest natural treasures now!\r\n\r\nReady to Stand Face-to-Face with a Mountain Gorilla?\r\nSpots are extremely limited. Book your one-day gorilla trekking tour now and let us help you craft a truly unforgettable Rwandan experience.\r\nContact us today to reserve your permit and secure your place in the mist.\r\n', '2025-06-09 21:20:29', '2025-06-09 22:05:06'),
(123, '1-Day Gorilla Trekking Experience in Virunga National Park ', 'Adventure', 'congo', 1, 'images/tours/68475a01d5596.png', 'Embark on an unforgettable journey to Virunga National Park, the oldest national park in Africa and home to endangered mountain gorillas. This exclusive one-day gorilla trekking adventure offers a unique opportunity to witness these magnificent creatures in their natural habitat, guided by experienced park rangers. Ideal for wildlife enthusiasts and conservation-minded travelers, this tour promises a life-changing encounter and deep connection with Africa’s wild heart.', 'Virunga National Park offers one of the world’s most exclusive wildlife encounters seeing mountain gorillas in their pristine habitat is truly life-changing. This carefully managed trek combines adventure, conservation, and cultural insight, ensuring you contribute positively to protecting these endangered giants. With expert guides and small group sizes, your experience is safe, personal, and unforgettable. Don’t miss the chance to be part of this incredible story, secure your permit and book your gorilla trekking adventure today!', '2025-06-09 22:02:41', '2025-06-09 22:04:47'),
(124, '4-Days in Kinigi and Musanze near Volcanoes Park', 'Cultural', 'rwanda', 4, 'images/tours/68485bbb1e404.jpg', 'Get off the beaten track and discover the vibrant communities surrounding Volcanoes National Park. This meaningful 4-day experience connects you directly with local farmers, conservationists, women cooperatives, traditional dancers, and school children. Stay at an eco-lodge in Kinigi, enjoy immersive cultural tours, and contribute to sustainable development projects led by locals.', 'This tour offers more than just travel; it’s a chance to make a meaningful impact while gaining a deeper understanding of Rwandan culture. By booking this cultural immersion experience, you directly support local communities through fair-wage employment, donations to cooperatives, and visits that promote cultural pride. You’ll stay in eco-friendly lodges that reinvest in the region, engage in authentic village life, and connect with farmers, artisans, educators, and conservationists. Whether you\'re a family, student, or ethical traveler, this journey blends learning, cultural exchange, and sustainability into a safe, personal, and unforgettable adventure in the heart of Rwanda.', '2025-06-10 16:22:19', '2025-06-10 16:22:19'),
(125, '3-Day Akagera Big Five Safari ', 'Adventure', 'rwanda', 3, 'images/tours/68486cf3d4139.webp', 'Step into the heart of Rwanda with this 3-day Akagera Big Five Safari & Kigali City Tour. From the savannah plains of Akagera National Park; home to lions, rhinos, and elephants to the clean, modern streets of Kigali and the tranquil beauty of Nyandungu Eco Park, this short but powerful adventure offers the perfect blend of wildlife, culture, and nature. Designed for travelers who want maximum impact in minimum time, this tour delivers unforgettable moments at every turn.', 'This 3-day experience is ideal for travelers who crave adventure and authenticity without the time for a long journey. It’s a seamless way to explore Rwanda’s iconic wildlife, eco-conscious cities, and peaceful landscapes in a short, impactful trip. With professional guides, curated experiences, and reliable service, this tour ensures your comfort, safety, and meaningful memories.', '2025-06-10 17:35:47', '2025-06-10 19:22:30'),
(126, '4-Day Primate Safari and Canopy Adventure ', 'Adventure', 'rwanda', 4, 'images/tours/684877007d7ed.webp', 'Step into the misty highlands of Rwanda and discover Nyungwe Forest, one of Africa’s oldest rainforests and a living treasure trove of biodiversity. This immersive 4-day journey invites you to track wild chimpanzees, walk the legendary canopy bridge high above the treetops, and encounter rare primates and birds that exist nowhere else on earth. Along the way, you\'ll connect with Rwanda’s deep cultural roots through visits to royal heritage sites and the country’s most important museum. For global travelers seeking quiet, connection, and unforgettable nature, Nyungwe delivers magic with every step.', 'This isn’t just a trip, it’s a profound connection to nature, conservation, and culture. With expertly guided primate treks, iconic canopy views, and seamless logistics from arrival to departure, you\'ll experience Rwanda’s natural wonders with complete peace of mind. Our trusted local guides, eco-lodges, and ethical tourism partners ensure your journey supports conservation and communities every step of the way.', '2025-06-10 18:18:40', '2025-06-10 18:18:40'),
(127, '4-Day Lake Kivu Escape: Culture, Coffee and Canoes', 'Comunity Based Tourism', 'rwanda', 4, 'images/tours/6848858d40463.jfif', 'Escape to the serene shores of Lake Kivu, one of Africa’s largest and most stunning freshwater lakes. This immersive 4-day journey invites you to unwind amid peaceful waters, explore vibrant local culture, and savor Rwanda’s renowned coffee heritage. Perfect for travelers seeking a gentle pace, cultural depth, and authentic community experiences away from the usual safari hustle.', 'Discover a side of Rwanda that blends gentle lakeside beauty with vibrant cultural encounters. This thoughtfully paced escape offers you peaceful moments on pristine waters, authentic connections with welcoming communities, and a deep dive into Rwanda’s famed coffee culture, all without the pressures of park fees or strenuous trekking. Our experienced guides and handpicked eco-lodges ensure your journey is comfortable, responsible, and truly memorable.\r\n\r\nReady to unwind in Rwanda’s tranquil heart?', '2025-06-10 19:20:45', '2025-06-10 19:20:45'),
(128, '4-Day Mgahinga Gorilla and Golden Monkey Safari', 'Adventure', 'uganda', 4, 'images/tours/68488ed0bf997.jfif', 'Escape the crowds and discover the magical Mgahinga Gorilla National Park, a hidden gem on the Uganda-Rwanda border just a short, scenic drive from Kigali. This intimate 4-day safari offers the rare opportunity to track endangered mountain gorillas and golden monkeys in their pristine volcanic forest habitat. Amid breathtaking landscapes of rolling hills and misty volcanoes, enjoy authentic wildlife encounters, rich cultural experiences, and peaceful lodge comforts. This safari promises a deeply rewarding journey into East Africa’s wild heart without long travel times.', 'Step into one of East Africa’s most exclusive wildlife sanctuaries just hours from Kigali. This Mgahinga safari offers intimate gorilla encounters, rare golden monkey tracking, and peaceful lodge stays amid spectacular volcanic landscapes. Designed for travelers craving authentic nature without long journeys, this trip blends adventure, culture, and relaxation in perfect harmony.', '2025-06-10 20:00:16', '2025-06-10 20:00:16'),
(129, '3-Day Queen Elizabeth National Park Wildlife Safari ', 'Adventure', 'uganda', 3, 'images/tours/6848931d2f7c2.webp', 'Journey into the heart of Uganda’s wilderness with this exhilarating 3-day safari to Queen Elizabeth National Park, a jewel of biodiversity and stunning landscapes just a scenic 5-hour drive from Kigali. Known for its diverse ecosystems, iconic tree-climbing lions, large elephant herds, and the Kazinga Channel’s vibrant aquatic life, this safari promises unforgettable wildlife encounters, thrilling game drives, and peaceful boat cruises. Perfect for families, photographers, and nature lovers eager to explore East Africa’s rich animal kingdom without lengthy travel.', 'Experience Uganda’s wildlife wonderland with a perfectly balanced itinerary that fits seamlessly into your East African travels. This safari delivers thrilling encounters with iconic species, expert guiding, and comfortable lodges, all within easy reach of Kigali. Whether you’re a photographer chasing the perfect shot, a family looking for accessible wildlife fun, or a nature lover hungry for adventure, this tour guarantees an authentic and inspiring safari experience.', '2025-06-10 20:18:37', '2025-06-10 20:18:37'),
(130, '3-Day Kahuzi-Biega Gorilla Trekking and Wildlife Safari', 'Adventure', 'congo', 3, 'images/tours/68489853594b2.webp', 'Just a short, scenic drive from Kigali, Kahuzi-Biega National Park is a UNESCO World Heritage Site renowned for its rare eastern lowland gorillas and pristine rainforest. This exclusive 3-day safari offers a rare chance to track these majestic gorillas in their natural habitat, experience thrilling wildlife drives, and enjoy birdwatching in one of Africa’s richest biodiversity hotspots. With fewer tourists than Rwanda or Uganda’s gorilla parks, this itinerary promises an intimate and authentic Congo wilderness adventure.', 'Experience one of the rarest gorilla encounters on the planet without long travel. Kahuzi-Biega offers deep wilderness immersion, stunning biodiversity, and warm local hospitality, just hours from Kigali. Secure your spot now for a transformative Congo adventure!', '2025-06-10 20:40:51', '2025-06-10 20:40:51'),
(131, '4-Day Virunga and Mikeno Gorilla Trekking Adventure', 'Adventure', 'congo', 3, 'images/tours/68489e9007d9b.jfif', 'Step into the legendary Virunga National Park; Africa’s oldest protected area and home to the iconic mountain gorillas. This 4-day safari from Kigali offers a once-in-a-lifetime opportunity to trek habituated gorillas, enjoy game drives to spot elephants and buffalo, and immerse yourself in the awe-inspiring landscapes of active volcanoes. With expert guides and comfortable lodges, Virunga promises an unforgettable blend of adventure, wildlife, and culture.', 'Virunga National Park offers the quintessential Congo safari, combining extraordinary gorilla encounters, diverse wildlife, and rich cultural experiences. Book today to secure your place on this deeply rewarding and exclusive adventure.', '2025-06-10 21:07:28', '2025-06-10 21:07:28'),
(132, '4-Day Cultural Immersion', 'Cultural', 'rwanda', 4, 'images/tours/684ae3b52092a.jpg', 'Dive into the living traditions of Rwanda on this enriching 4-day cultural tour designed to connect you with the people, heritage, and creative spirit of the country. From village rhythms and ancestral storytelling to hands-on craft-making and local market exploration, this experience offers you a genuine window into Rwanda’s vibrant culture. Centered around the Kinigi and Musanze region, this tour fosters authentic engagement with local communities and artisans.', 'This tour offers far more than sightseeing; it’s a cultural exchange rooted in respect and genuine connection. You’ll engage directly with communities, participate in ancient practices, and walk away with memories built through shared experiences. Virunga Ecotours ensures your journey is responsible, meaningful, and impactful for both you and your hosts. Book now to step into Rwanda’s living traditions.\r\n\r\n', '2025-06-12 14:27:01', '2025-06-12 14:27:01'),
(133, '2-Day Urban Heritage Tour', 'Cultural', 'rwanda', 2, 'images/tours/684ae5a76349c.JPG', 'Discover the cultural depth of Rwanda’s capital city in this vibrant 2-day tour through Kigali’s creative neighborhoods, markets, galleries, and community spaces. Perfect for those who want to explore Rwanda’s evolving identity, this tour brings you face-to-face with artists, craftswomen, and storytellers who shape the heartbeat of modern Kigali.', 'Kigali is more than a city; it’s a living cultural gallery. This experience goes beyond tourist hotspots, bringing you into the studios, kitchens, and neighborhoods where Rwanda’s creativity is born. With Virunga Ecotours, you’ll gain authentic access to people and places that reveal Kigali’s true soul. Book today and discover the capital through culture.', '2025-06-12 14:35:19', '2025-06-12 14:35:19'),
(134, '3-Day Kinigi Village Life Experience', 'Comunity Based Tourism', 'rwanda', 3, 'images/tours/684ae76a35665.jpeg', 'Experience Rwanda at its roots in this immersive 3-day village life experience in Kinigi, at the base of the Volcanoes National Park. Guided by local guides, you’ll step into daily routines from farming to cooking and hear stories passed down through generations. This is more than a visit, it’s a shared life.', 'This experience brings you face-to-face with Rwandan hospitality and resilience. It’s not staged—it’s lived. You’ll make real connections, contribute directly to the community economy, and gain insight that no museum or guidebook can offer. Book this tour and return home with stories that matter.', '2025-06-12 14:42:50', '2025-06-12 18:54:53'),
(135, '4-Day Eco-Volunteer Tour', 'Comunity Based Tourism', 'rwanda', 4, 'images/tours/684ae96f4eaca.jpeg', 'For travelers who want to give back while exploring, this 4-day tour offers an opportunity to engage in grassroots conservation and community development projects around Volcanoes National Park. Collaborate with local cooperatives on reforestation, waste management, or eco-education, all while immersed in the community that protects Rwanda’s natural treasures.', 'Travel with purpose. This eco-volunteer experience empowers both visitors and host communities to work toward a shared environmental future. You’ll actively contribute to habitat protection, youth education, and community resilience. Virunga Ecotours ensures your time, presence, and money create a meaningful impact. Book today to leave a legacy, not just footprints.', '2025-06-12 14:51:27', '2025-06-12 14:51:27'),
(136, '3-Day City & Nature Escape for Families', 'Family Friendly', 'rwanda', 3, 'images/tours/684b19feb1594.jpeg', 'This family-friendly urban escape brings together Kigali’s top highlights and its most peaceful green space, Nyandungu Eco Park. Designed for all ages, this 3-day adventure combines interactive museum visits, wildlife encounters, and plenty of outdoor time to create a meaningful Rwandan experience for the whole family.', 'Perfect for families seeking an easy, safe, and exciting introduction to Rwanda. It blends light education with hands-on fun, giving children and adults the chance to connect, explore, and create lasting memories together. Book now for a well-paced Kigali adventure your whole family will enjoy.', '2025-06-12 18:18:38', '2025-06-12 18:18:38'),
(137, '3-Day Family-Friendly Animal Encounters and Agricultural Adventures', 'Family Friendly', 'rwanda', 3, 'images/tours/684b1dc7acdb2.jpeg', 'Let your children experience the joy of nature with this hands-on countryside tour in Musanze, designed around family fun, farming, and animals. Perfect for young explorers, the tour features goat feeding, vegetable harvesting, egg collecting, and traditional Rwandan cooking, fun and educational for all.', 'Give your children the gift of rural discovery in a safe, supportive environment. It’s a rare chance to slow down, get hands-on with nature, and build curiosity through fun activities. Every moment is designed to bond, learn, and laugh together. Book now to raise your family’s love for nature.', '2025-06-12 18:34:47', '2025-06-12 18:34:47'),
(138, '3-Day Nature Trails for Curious Kids', 'Family Friendly', 'rwanda', 3, 'images/tours/684b223fb7b51.jpg', 'Set in the lush foothills of Volcanoes National Park, this child-friendly nature tour offers easy trails, wildlife sightings, and plenty of space to roam. Great for families with kids aged 5+, this experience introduces ecology and conservation through play, discovery, and storytelling in the great outdoors.', 'Introduce your kids to forests without the tough trekking. These trails are built for learning and laughter, not for challenge. Every step of the journey encourages curiosity, teamwork, and wonder in nature. Book today and explore the forest in a way your family will never forget.', '2025-06-12 18:53:51', '2025-06-12 18:53:51'),
(139, '3-Day Rwandan Food and Culture Experience', 'Gastronomy', 'rwanda', 3, 'images/tours/684be2ce6b5e2.jpeg', 'Indulge in Rwanda’s culinary culture with this immersive 3-day tour through Kigali’s vibrant food scene. Taste traditional dishes, learn local food history, and enjoy curated pairings of Rwandan coffee and banana beer; all guided by local chefs and food lovers. Ideal for foodies seeking flavor with a cultural twist.', 'Perfect for food lovers eager to dig deeper into Rwanda’s culture through cuisine. You’ll taste, learn, and connect with locals while experiencing the true essence of Rwandan hospitality. Book now to turn your appetite into adventure.', '2025-06-13 08:35:26', '2025-06-13 08:35:26'),
(140, '3-Day Tea and Coffee Trail Experience', 'Gastronomy', 'rwanda', 3, 'images/tours/684bf10b5b6cf.jpg', 'Venture into Rwanda’s rolling green hills for a flavorful expedition across its finest tea and coffee estates. This scenic and aromatic 3-day journey introduces you to the roots of Rwanda’s world-famous brews, with tastings, plantation walks, and one-on-one chats with local farmers.', 'This tour is a dream for coffee and tea enthusiasts seeking a serene, flavorful getaway. Whether sipping on fresh-brewed coffee or wandering lush tea fields, you’ll experience Rwanda through its proudest export and its world-class drinks.', '2025-06-13 09:36:11', '2025-06-13 09:37:04'),
(141, '3-Day Culinary Immersion in Musanze', 'Gastronomy', 'rwanda', 3, 'images/tours/684bf5b7a14d7.JPG', 'This interactive 3-day culinary adventure brings you straight into the heart of Rwandan kitchens. In Musanze, learn to cook side-by-side with local chefs, shop for ingredients at village markets, and discover the deep connection between food, culture, and storytelling.', 'This experience is more than just learning recipes; it’s about connection. Cook in real kitchens, hear ancestral food stories, and laugh with new friends. Book today and become part of Rwanda’s living culinary tradition.', '2025-06-13 09:56:07', '2025-06-13 09:56:07'),
(142, '3-Day Birdwatching Safari in Nyungwe and Akagera', 'Nature', 'rwanda', 3, 'images/tours/684bfb6dbfd2f.jpg', 'Discover Rwanda’s remarkable avian diversity with this 3-day birdwatching journey through two of its premier national parks: Nyungwe Forest and Akagera. From the dense montane rainforest to the open savannah, this tour is perfect for nature lovers and birding enthusiasts of all levels, offering sightings of Albertine Rift endemics and rare wetland species.', 'Rwanda is one of Africa’s top birding destinations, and this tour lets you witness it all from lush forest to open plains. Whether you\'re a beginner or experienced birder, the pace and expert guidance ensure a rewarding experience. Book now to explore the wild, winged wonders of Rwanda.', '2025-06-13 10:20:29', '2025-06-13 10:20:29'),
(143, '3-Day Gishwati-Mukura Nature Escape', 'Nature', 'rwanda', 3, 'images/tours/684bff889d554.jpg', 'Unplug and reconnect with nature on this tranquil 3-day journey through Gishwati-Mukura National Park. This lesser-visited treasure offers lush biodiversity, gentle trails, and a rare chance to see primates, butterflies, and birds in a quiet, unspoiled forest environment.', 'This is Rwanda’s quietest forest and its best-kept secret. With minimal crowds and rich biodiversity, Gishwati-Mukura is a haven for those seeking peace, beauty, and meaning in nature. Book now to explore the forest at its most magical and authentic.', '2025-06-13 10:38:00', '2025-06-13 10:38:00'),
(144, '3-Day Forest Bathing and Eco-Park Escape', 'Nature', 'rwanda', 3, 'images/tours/684c044e21b97.jpg', 'Rejuvenate your mind and body on this unique 3-day wellness tour through Rwanda’s green spaces. Designed for those seeking peace, presence, and a deeper connection with nature, this tour combines eco-park visits, forest bathing, and mindfulness practices in beautiful natural settings.', 'In a busy world, this tour offers a rare invitation to pause, breathe, and be. You’ll leave with renewed clarity, deeper calm, and a refreshed love for Rwanda’s natural beauty. Book now and experience nature as your sanctuary.', '2025-06-13 10:58:22', '2025-06-13 10:58:22'),
(145, '3-Day Lake Retreat and Prayer Journey', 'Spiritual', 'rwanda', 3, 'images/tours/684c08c1018cc.jpeg', 'Reconnect with your inner self on this peaceful journey through Rwanda’s sacred natural landscapes. Centered around Lake Ruhondo and the famous Prayer Hill of Rugarama, this retreat is ideal for solo travelers, couples, or spiritual groups seeking silence, prayer, or nature-guided healing.', 'Step away from the noise and step into sacred stillness. This retreat offers spiritual nourishment and nature’s peace for believers and seekers alike. Book now and return home lighter, grounded, and renewed.\r\n', '2025-06-13 11:17:21', '2025-06-13 11:17:21'),
(146, '3-Day Rwanda Pilgrimage Experience', 'Spiritual', 'rwanda', 3, 'images/tours/684c0c3e01c0f.JPEG', 'Follow the footsteps of Rwandan Christian heritage on this enlightening journey to iconic churches, pilgrimage routes, and quiet places of prayer. This is a reflective and educational tour for those seeking deeper faith and historical connection.', 'Kibeho is one of the few Vatican-recognized apparition sites in Africa, making this tour truly once-in-a-lifetime. Experience grace, community, and Rwanda’s deep Christian roots in one soul-fulfilling journey. Book now to walk the path of the faithful.', '2025-06-13 11:32:14', '2025-06-13 11:32:14'),
(147, ' 3-Day Eco-Spiritual Wellness Retreat in Gishwati', 'Spiritual', 'rwanda', 3, 'images/tours/684c10734bb62.jpg', 'Find clarity and renewal in Rwanda’s sacred forest spaces on this intimate retreat in Gishwati Forest. Combining guided silence, nature meditations, and spiritual dialogue, this tour is ideal for spiritual seekers, faith-based groups, or those healing from life transitions.', 'The forest is one of God’s quietest sanctuaries and this tour gives you the rare chance to meet Him there. Whether in prayer, silence, or story, Gishwati offers space to breathe again. Book now and begin your journey inward.', '2025-06-13 11:50:11', '2025-06-13 11:50:11'),
(148, '1-Day Kigali Cultural and Historical City Tour', 'Cultural', 'rwanda', 1, 'images/tours/684c1bd27cf69.jpg', 'This enriching one-day tour takes you deep into the heart of Kigali, Rwanda’s clean, green capital. From the solemn Kigali Genocide Memorial to the vibrant colors of Kimironko Market and the bold creativity of local artists, this experience reveals Rwanda’s resilience, traditions, and modern transformation. Ideal for travelers on a tight schedule who still want to deeply connect with the Rwandan story.', 'This is Kigali in a day; raw, beautiful, inspiring. Whether you’re passing through or staying longer, this immersive journey offers a deep, balanced introduction to Rwandan culture, history, and creativity. Book now to experience the capital through local eyes and unforgettable stories.', '2025-06-13 12:38:42', '2025-06-13 12:38:42'),
(149, '1-Day Golden Monkey Trekking in Volcanoes National Park', 'Adventure', 'rwanda', 1, 'images/tours/685ad16a48656.jpg', 'Step into the misty bamboo forests of Volcanoes National Park and track the lively, endangered golden monkeys in their natural habitat. Known for their playful personalities and striking appearance, golden monkeys offer a unique wildlife encounter that’s perfect for those seeking adventure in just one unforgettable day.', 'This is your chance to witness one of the world’s most playful and rare primates in their natural highland home, all in one day. Whether you\'re short on time or combining experiences, this trek offers accessible adventure, rich scenery, and unforgettable memories. Book now and experience Rwanda’s wild beauty firsthand.', '2025-06-13 13:01:18', '2025-06-24 16:25:14'),
(151, ' 1-Day Tchegera Island Eco Escape', 'Nature', 'congo', 1, 'images/tours/684c2ba259277.jpg', 'Swap the hustle of city life for the serenity of Tchegera Island; a volcanic gem floating in Lake Kivu, just minutes from Goma. This tranquil eco-retreat offers scenic kayaking, swimming, birdwatching, and total relaxation. Perfect for couples, solo travelers, and families, this is one of the most peaceful and accessible nature escapes in the Congo.', 'This relaxing nature escape is a must for travelers seeking an eco-friendly, off-the-beaten-path day experience in the Congo. Book with Virunga Ecotours to enjoy safe, responsible tourism with expert coordination and personalized service.', '2025-06-13 13:46:10', '2025-06-13 13:46:10'),
(152, '1-Day Congo Coffee and Culture Experience', 'Cultural', 'congo', 1, 'images/tours/684c2f0e77c20.jpeg', 'Dive into Congo’s rich coffee heritage and vibrant rural traditions with this immersive day tour from Goma. Visit sustainable coffee farms, engage with local cooperatives, enjoy home-cooked meals, and participate in a cultural exchange of music, dance, and storytelling. This journey offers taste, tradition, and the spirit of Congolese resilience; all in one inspiring day.', 'This journey offers authentic, ethical tourism at its best, supporting sustainable agriculture and community livelihoods. Book with Virunga Ecotours for meaningful cultural exchange, great storytelling, and responsible travel that leaves a positive impact.', '2025-06-13 14:00:46', '2025-06-13 14:00:46'),
(153, '1-Day Bigodi Wetland and Cultural Experience', 'Nature', 'uganda', 1, 'images/tours/684c3508a4790.jpeg', 'Journey from the foothills of the Virunga Mountains to Uganda’s renowned Bigodi Wetland Sanctuary for a day of rich biodiversity and meaningful cultural exchange. Just beyond the Rwanda-Uganda border, this lush sanctuary offers one of East Africa’s best birdwatching and community-based tourism experiences, ideal for nature lovers and conscious travelers looking for immersive, off-the-beaten-path adventures.', 'This is more than just a wetland walk; it’s a bridge between cultures and conservation. Bigodi is globally recognized for its success in empowering locals through eco-tourism. With Virunga Ecotours, you support authentic, ethical travel while discovering Uganda’s hidden gems, just a short drive from Musanze.', '2025-06-13 14:26:16', '2025-06-13 14:26:16'),
(154, '1-Day Source of the Nile and Jinja Adventure', 'Adventure', 'uganda', 1, 'images/tours/684c38a796495.jpeg', 'Embark on a full-day cross-border adventure from Musanze to one of Africa’s greatest geographical landmarks; the Source of the Nile in Jinja, Uganda. Ideal for history buffs, nature lovers, and curious explorers, this scenic journey connects the Volcanoes region with the mighty Nile River through landscapes, stories, and discovery.', 'This day trip gives you the rare opportunity to stand at the Source of the Nile, one of Africa’s most iconic and storied rivers all while starting from Musanze. With Virunga Ecotours, you get a safe, guided, and professionally managed experience that connects two countries and one unforgettable destination in just one day.', '2025-06-13 14:41:43', '2025-06-13 14:41:43'),
(155, '3-Day Women’s Eco-Journey in Rwanda', 'Comunity Based Tourism', 'rwanda', 3, 'images/tours/685ae17ecbf85.jpg', 'This thoughtfully designed 3-day women-focused eco-journey invites you to explore the breathtaking Virunga Massif region through the lens of community, conservation, and connection. You’ll be guided by inspiring local women, engage with artisan and environmental cooperatives, and immerse yourself in the natural rhythms of Rwanda’s highlands. From volcanic foothill hikes to honey tasting and traditional craft workshops, every activity honors the stories and strength of Rwandan women. Whether you’re traveling solo or with a sisterhood of friends, this journey offers a safe, soulful, and empowering experience where you’ll leave your mark through conservation and take home more than memories: renewed purpose and lasting friendships.', 'Travel with confidence in a women-led, safety-focused experience that prioritizes your comfort, connection, and well-being. Throughout the journey, you’ll engage in authentic cultural exchanges with inspiring Rwandan women leaders, gaining firsthand insight into their traditions, resilience, and community-driven initiatives. By participating in hands-on workshops and conservation activities, you directly support local artisan cooperatives and environmental efforts. This thoughtfully curated experience offers a meaningful balance of nature, purpose, and personal connection. You’ll leave not only with lasting memories, but also with a sense of positive impact and renewed inspiration.', '2025-06-24 17:33:50', '2025-06-24 17:33:50'),
(156, '5-Day Geo Tour of Volcanoes and Landscapes', 'Nature', 'rwanda', 4, 'images/tours/685af5e884c78.jpg', 'Welcome to Rwanda, the Land of a Thousand Hills! Your adventure begins with a scenic drive from Kigali to Musanze, the vibrant town nestled at the base of the Virunga Volcanoes. Along the journey, enjoy curated stops where your expert guide will introduce you to the geological story of the East African Rift Valley, highlighting volcanic soils and the dramatic topography that shapes the landscape. Upon arrival, check in at a sustainable eco-lodge boasting stunning views of the volcanoes. In the evening, gather for an engaging briefing on the formation of the Virunga Massif, exploring the intricate connections between tectonics, biodiversity, and community life that make this region so unique.', 'Travel through time, stone, and story in Rwanda’s volcanic heart. Join Virunga Ecotours on this life-changing adventure where every layer of rock reveals a new layer of wonder. Reserve your place today and be part of a journey that leaves both you and the world better than before.', '2025-06-24 19:00:56', '2025-06-24 19:02:03'),
(157, '7-Day Field Education Tour ', 'Nature', 'rwanda', 7, 'images/tours/685b04466d779.jpg', 'Designed for the next generation of environmental leaders, this 7-day immersive academic journey explores the rich ecological and social systems surrounding Rwanda’s Virunga Massif. Combining field research, community engagement, and institutional learning, students will investigate biodiversity, conservation policy, and the geological underpinnings of this unique landscape. Facilitated by academic and local experts, the tour builds essential field skills, critical analysis, and real-world insights that bridge theory with practice.', 'This program offers a rare, in-depth learning opportunity in one of Africa’s most ecologically significant and politically stable environments. Students won’t just observe conservation; they’ll live it: collecting data, working alongside local partners, and developing real solutions to environmental challenges. Designed to build academic rigor and cultural fluency, this tour strengthens practical field skills and critical thinking, preparing participants for leadership roles in conservation, sustainable development, and environmental research.', '2025-06-24 20:02:14', '2025-06-24 20:02:14'),
(158, '4-Day Scenic Cycling and Culture Tour', 'Adventure', 'rwanda', 4, 'images/tours/685c51ed00f8c.jpg', 'The 4-Day Scenic Cycling and Culture Tour is an unforgettable journey through Rwanda’s stunning Virunga region, designed for travelers who want to explore on two wheels while immersing themselves in local culture and natural beauty. From the volcanic foothills of Musanze to the calming shores of Lake Kivu, this tour combines gentle adventure with meaningful connection. You\'ll cycle through lush farmlands, crater lake landscapes, and vibrant rural communities, all with the breathtaking backdrop of the Virunga Volcanoes. Along the way, engage with local artisans, enjoy traditional music and dance, and taste the flavors of Rwanda through fresh, locally prepared meals. With flexible daily routes, a support vehicle, and expert local guides, this moderate cycling tour is ideal for active explorers who value authenticity, comfort, and sustainability. Whether you\'re a solo traveler, a couple, or a group of friends, this tour offers the perfect balance of discovery, culture, and relaxation, making it one of the most enriching and rewarding ways to experience the heart of Rwanda.', 'This tour offers an exciting journey across diverse terrain, from the dramatic volcanic highlands to the serene shores of Lake Kivu. Along the way, you’ll immerse yourself in rich cultural experiences, enjoying traditional music, crafts, and meaningful visits to local communities. The rides are designed to be flexible and moderate, making them accessible and enjoyable for most fitness levels. With the support of a dedicated vehicle and expert local guides, your journey will be smooth, safe, and stress-free. Most importantly, this experience embraces sustainable tourism principles, empowering local communities and contributing to the preservation of Rwanda’s breathtaking natural environment.', '2025-06-25 19:42:35', '2025-06-25 19:45:49'),
(159, '1-Day Akagera Big Five Safari Adventure', 'Adventure', 'rwanda', 1, 'images/tours/685c5eb473052.jpg', 'Step into the wild heart of Rwanda with a thrilling full-day safari in Akagera National Park, home to the iconic Big Five and a spectacular range of wildlife. This immersive journey offers breathtaking savannah landscapes, expert-guided game drives, and the option to explore Lake Ihema by boat. Perfect for wildlife lovers and photographers, this tour blends adventure, education, and conservation in a seamless, unforgettable day.', 'This safari offers a once-in-a-lifetime opportunity to experience Rwanda’s rich wildlife heritage without the need for overnight travel. With expert guides, personalized service, and a commitment to responsible tourism, Virunga Ecotours ensures a seamless and deeply rewarding safari experience. Whether you’re a seasoned traveler or embarking on your first African safari, the Akagera Big Five Safari Adventure is an unforgettable way to connect with nature and support conservation efforts.', '2025-06-25 20:29:10', '2025-06-25 20:40:20'),
(160, '1-Day Canopy Walk and Rainforest Hike in Nyungwe Forest', 'Nature', 'rwanda', 1, 'images/tours/6867b1d995a73.jpg', 'Step into the heart of one of Africa’s oldest and most biodiverse rainforests with this unforgettable one-day escape to Nyungwe Forest National Park. This immersive nature experience blends serene hiking through lush jungle trails with a thrilling walk high above the forest canopy. Perfect for nature lovers, birdwatchers, photographers, and adventure seekers alike, the tour unveils panoramic views, exotic flora, and the chance to spot monkeys swinging through the treetops. Guided by expert naturalists, you’ll connect with Rwanda’s rich ecological heritage and leave with breathtaking memories from one of the continent’s true natural treasures.', 'This is more than a walk; it\'s a journey through the living lungs of Rwanda. From the thrill of walking above the treetops to the quiet wonder of spotting forest wildlife, this one-day adventure delivers nature in its purest form. Ideal for travelers short on time but big on discovery, it offers world-class biodiversity, eco-guided interpretation, and a connection to conservation efforts in one of Africa’s most treasured national parks.\r\nDon’t miss the opportunity to experience Rwanda’s rainforest from above. Book now as spaces for the canopy walk are limited and fill quickly!', '2025-07-04 10:50:01', '2025-07-04 10:50:01'),
(161, '1-Day Lake Kivu Relaxation and Boat Cruise', 'Adventure', 'rwanda', 1, 'images/tours/6867e31d7e7a9.jpg', 'Escape to the serene shores of Lake Kivu, one of Africa’s Great Lakes, and indulge in a day of pure relaxation and discovery. Whether starting from Rubavu or Karongi, this tour invites you to swim in crystal-clear waters, glide across the lake on a traditional boat cruise, savor locally grown coffee, and enjoy a delicious lakeside lunch. Perfect for travelers seeking tranquility, natural beauty, and authentic local experiences, this day trip offers a refreshing contrast to Rwanda’s mountainous landscapes and bustling towns.', 'Take a break from the hustle, bustle and immerse yourself in the tranquil beauty of Lake Kivu. This tour blends relaxation with cultural discovery. Glide across shimmering waters, taste world-renowned coffee, and feast on fresh, local flavors. Whether you\'re seeking a peaceful day by the lake or a gentle adventure, this experience offers the perfect balance.', '2025-07-04 14:20:13', '2025-07-04 14:20:13'),
(162, '1-Day Cultural Experience at Gorilla Guardians Village', 'Cultural', 'rwanda', 1, 'images/tours/6867eb29096bf.jpeg', 'Step into the vibrant heart of Rwandan tradition with this immersive 1-day cultural experience at gorilla guardians village, located at the base of the Volcanoes National Park in Kinigi. This enriching encounter invites you to connect with local people through hands-on experiences, including traditional dance performances, banana beer brewing, and visits to local homes. With every drumbeat, every story, and every shared moment, you’ll gain a deeper appreciation of Rwanda’s rich heritage, resilience, and hospitality.', 'This experience isn’t just a visit; it’s a celebration of Rwandan culture, resilience, and community spirit. By participating, you directly support local livelihoods and cultural preservation. It’s perfect for travelers who want to connect with people beyond the tourist trail and come away with unforgettable stories.', '2025-07-04 14:54:33', '2025-07-04 14:54:33'),
(163, '1-Day Farm-to-Table Culinary Tour', 'Food & Culinary', 'rwanda', 1, 'images/tours/6867f203b5a6f.JPG', 'Discover the true flavor of Rwanda on this immersive farm-to-table culinary journey in the vibrant countryside of Musanze. Guided by local farmers and traditional chefs, you’ll harvest fresh ingredients from a community farm, then turn them into delicious Rwandan dishes during a hands-on cooking class at Red Rocks Cultural Center or a welcoming village home. Complete the experience with banana beer tasting and captivating storytelling, offering cultural insight into the meals you prepare and the people who make them. This experience is a celebration of food, community, and sustainability. It is perfect for curious travelers, food lovers, and advocates of ethical tourism.', 'This experience brings food to life; not just as a meal, but as a story of people, place, and purpose. You’ll cook with real farmers and chefs, learn traditional techniques, and taste dishes you helped create, all while supporting local communities and sustainable practices.\r\nIdeal for foodies and conscious travelers, this is your chance to connect with Rwanda through its most universal language, food.', '2025-07-04 15:23:47', '2025-07-04 15:23:47'),
(164, '1-Day Birding Safari ', 'Nature', 'rwanda', 1, 'images/tours/6867f70dcf739.jpg', 'Explore the rich birdlife of Rwanda’s northern highlands on this expertly guided 1-day birding safari in either Rugezi Marsh, a high-altitude wetland and Important Bird Area, or the mystical Buhanga Sacred Forest, known for its biodiversity and cultural significance. Led by experienced local birders, this tour offers the rare chance to spot Albertine Rift endemics and dozens of colorful species in their natural habitat. Ideal for passionate birders, nature lovers, and conservation-focused travelers, the experience includes a local lunch, community interaction, and captivating storytelling that deepens your connection to the land and its wildlife.', 'Birdwatching in Rwanda is still a hidden gem, offering intimate, high-quality sightings without the crowds. This day tour takes you deep into two of the region’s most bird-rich ecosystems, guided by locals who know every call, perch, and migration pattern. Beyond birding, you’ll gain cultural insight, support conservation-driven communities, and leave with a deeper understanding of Rwanda’s natural treasures.\r\nBook now and be part of Rwanda’s growing birding story.', '2025-07-04 15:45:17', '2025-07-04 15:45:17'),
(165, '1-Day Rwandan Intore Dance and Drum Workshop ', 'Cultural', 'rwanda', 1, 'images/tours/6867fbcb6f28c.jpg', 'Unleash your inner rhythm and step into Rwanda’s vibrant performing arts heritage during this dynamic 1-day Intore dance and drumming workshop. Led by master cultural performers, you’ll learn the powerful meanings, elegant movements, and thunderous beats behind the legendary Intore warrior dance, a symbol of pride, strength, and unity. Participate in immersive practice sessions, perform in traditional attire, and leave with not just memories, but an official certificate of participation. Perfect for cultural travelers, student groups, and women’s adventure collectives seeking deep, joyful cultural connection through movement and music.', 'This isn’t just a workshop; it’s a living cultural celebration that connects you to the heartbeat of Rwanda. Whether you’re a solo traveler, part of a women’s travel group, or joining with students, you’ll gain not only new skills but a deeper respect for one of Africa’s most iconic art forms.\r\nBook now and step into the rhythm of Rwanda!', '2025-07-04 16:05:31', '2025-07-04 16:05:31');
INSERT INTO `tours` (`tour_id`, `title`, `category`, `country`, `days_count`, `cover_image_path`, `short_description`, `why_attend`, `created_at`, `updated_at`) VALUES
(166, '1-Day Tea and Eco-Farming Experience ', 'Comunity Based Tourism', 'rwanda', 1, 'images/tours/686800935671e.jpg', 'Step into Rwanda’s lush tea-growing highlands on this immersive 1-day Tea and Eco-Farming Experience. Explore sprawling tea plantations in Gisovu or Gakenke, where you’ll pluck fresh leaves alongside local workers and learn the intricate process of turning leaf to cup. Complement your tea journey with visits to eco-farms practicing sustainable agriculture, and discover how these farms nurture the land, grow organic crops, and contribute to community well-being. This tour is perfect for slow travelers, sustainability enthusiasts, and anyone eager to connect deeply with Rwanda’s agricultural heart.', 'Discover the journey behind every cup of Rwandan tea while supporting sustainable farming communities. This unique experience blends nature, culture, and eco-conscious learning for travelers who appreciate slow, meaningful travel. Taste the fruits of your labor, connect with passionate farmers, and deepen your understanding of Rwanda’s agricultural treasures.\r\nReserve your spot today for a refreshing, green adventure that nurtures both body and soul!', '2025-07-04 16:25:55', '2025-07-04 16:25:55');

-- --------------------------------------------------------

--
-- Table structure for table `tour_bookings`
--

CREATE TABLE `tour_bookings` (
  `booking_id` int NOT NULL,
  `tour_id` int NOT NULL COMMENT 'References tours.tour_id',
  `full_name` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `email` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `phone` varchar(20) COLLATE utf8mb4_general_ci NOT NULL,
  `travel_date` date NOT NULL,
  `message` text COLLATE utf8mb4_general_ci,
  `ip_address` varchar(45) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `status` enum('pending','confirmed','cancelled') COLLATE utf8mb4_general_ci DEFAULT 'pending',
  `admin_notes` text COLLATE utf8mb4_general_ci,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tour_days`
--

CREATE TABLE `tour_days` (
  `day_id` int NOT NULL,
  `tour_id` int NOT NULL,
  `day_number` int NOT NULL,
  `day_title` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `day_description` text COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tour_days`
--

INSERT INTO `tour_days` (`day_id`, `tour_id`, `day_number`, `day_title`, `day_description`) VALUES
(543, 120, 1, 'Day 1: Arrival in Entebbe', 'Arrive at Entebbe International Airport where your friendly guide will greet you and transfer you to your comfortable hotel overlooking Lake Victoria. Unwind and enjoy the peaceful surroundings or opt for a visit to the nearby Entebbe Botanical Gardens or vibrant local markets. This first day allows you to ease into your African adventure while absorbing the rich culture and natural beauty around you.\n\nOvernight: Protea Hotel by Marriott Entebbe or similar\nMeals: Dinner'),
(544, 120, 2, 'Day 2: Chimpanzee Trekking Adventure in Kibale Forest', 'Depart early for the scenic drive to Kibale National Park, renowned as Africa’s primate capital. After settling into your eco-lodge, prepare for an unforgettable chimpanzee trekking experience. Guided by expert trackers, explore the dense rainforest in search of these fascinating primates, immersing yourself in their lively behavior and natural habitat. Later, enjoy a stroll through Bigodi Wetland Sanctuary, spotting diverse birdlife and other wildlife.\n\nOvernight: Kibale Forest Camp or Primate Lodge Kibale\nMeals: Breakfast, Lunch, Dinner'),
(545, 120, 3, 'Day 3: Transfer to Queen Elizabeth National Park and Savanna Wildlife Safari', 'Travel to the iconic Queen Elizabeth National Park, Uganda’s premier wildlife destination. After a scenic journey through picturesque landscapes, embark on an afternoon game drive across the Kasenyi Plains. Witness elephants, buffalo, kob, and perhaps elusive lions or leopards in their natural environment. Return to your lodge nestled within the park, surrounded by stunning wilderness views.\n\nOvernight: Mweya Safari Lodge or similar\nMeals: Breakfast, Lunch, Dinner'),
(546, 120, 4, 'Day 4: Kazinga Channel Boat Cruise and Wildlife Viewing', 'Start the day with a thrilling morning game drive, followed by a relaxing boat cruise along the Kazinga Channel, home to vast hippo pods, crocodiles, and a spectacular variety of birds. Capture incredible wildlife moments from the water while enjoying the peaceful surroundings. Spend the evening at leisure, soaking in the sounds and sights of the African night.\n\nOvernight: Mweya Safari Lodge or similar\nMeals: Breakfast, Lunch, Dinner\n'),
(547, 120, 5, 'Day 5: Ishasha Sector Tree-Climbing Lions and Transfer to Bwindi', 'Venture into the Ishasha sector, famous for its rare tree-climbing lions, an extraordinary wildlife spectacle. After your morning safari, journey onward to Bwindi Impenetrable Forest, a UNESCO World Heritage site and home to the critically endangered mountain gorillas. Arrive in time to relax at your forest lodge, embraced by the mysterious sounds of the jungle.\n\nOvernight: Gorilla Mist Camp or Buhoma Lodge\nMeals: Breakfast, Lunch, Dinner'),
(548, 120, 6, 'Day 6: Mountain Gorilla Trekking ', 'Prepare for a life-changing experience as you trek through the misty forest in search of a habituated gorilla family. The trek varies in duration but rewards you with an intimate one-hour encounter observing these gentle giants in their natural habitat. Witness their social bonds, playful antics, and majestic presence up close. Celebrate your unforgettable day with a special dinner back at the lodge.\n\nOvernight: Gorilla Mist Camp or Buhoma Lodge\nMeals: Breakfast, Lunch, Dinner'),
(549, 120, 7, 'Day 7: Scenic Return to Entebbe and Departure', 'After breakfast, begin your scenic drive back to Entebbe. En route, enjoy optional stops for cultural visits, craft shopping, or a coffee tasting experience to savor Uganda’s famous brew. Upon arrival, you will be transferred to Entebbe International Airport for your onward flight or to your hotel for an optional overnight stay.\n\nOvernight: Protea Hotel by Marriott Entebbe or similar (optional)\nMeals: Breakfast'),
(550, 123, 1, 'Arrival and Gorilla Trek Preparation', 'Your day begins with an early morning pick-up from your Goma hotel or Virunga lodge. You will be transferred to the Bukima Patrol Post, the official gorilla trekking base. Upon arrival, attend a detailed briefing led by park rangers who will explain the trekking guidelines and safety protocols to ensure a safe and respectful experience with the gorillas. Prepare your gear and get ready to set off on a trek through the dense tropical rainforest. Depending on the gorilla family\'s location, the trek may take between 2 to 5 hours, traversing rugged terrain and lush landscapes.'),
(551, 123, 2, 'Gorilla Encounter', 'After a rewarding hike, arrive at the gorillas’ habitat to spend one magical hour observing their behavior, interactions, and natural lifestyle. This rare experience allows you to witness the intimate moments of the gorilla family, from playful juveniles to caring mothers and the powerful silverback leader. The time spent with the gorillas is strictly limited to minimize disturbance and ensure their protection, but the memories you create will last a lifetime.'),
(552, 123, 3, 'Cultural Immersion', 'Following the trek, return to the patrol post and transfer back to your lodge for a well-deserved lunch and rest. In the afternoon, enrich your day by visiting a local community near Virunga National Park. Engage with residents to learn about their culture, traditions, and the vital role they play in gorilla conservation. This interaction fosters a deeper understanding of the conservation efforts and the interconnectedness of people and wildlife in this extraordinary region.'),
(553, 123, 4, 'Departure or Optional Overnight Stay', 'Conclude your adventure with a comfortable transfer back to your accommodation in Goma or Virunga lodge. For those who wish, an optional overnight stay can be arranged to extend your exploration of the park or relax by Lake Kivu with stunning views.'),
(554, 122, 1, 'Morning', 'Your day begins with an early pickup from your accommodation in Kigali. Enjoy a scenic 2.5 to 3-hour drive through beautiful Rwandan landscapes as you make your way to the Volcanoes National Park headquarters in Kinigi. Upon arrival, you will participate in a comprehensive briefing conducted by experienced park officials. This session covers crucial information on gorilla behavior, safety protocols, and responsible trekking practices to ensure both your safety and the gorillas’ wellbeing. After your briefing and permit verification, you will be assigned to a small trekking group led by an expert park ranger. Then begins the exciting trek into the dense, misty montane forest where the habituated mountain gorilla families reside. Depending on where the gorillas are located, the trek can last between 1 to 6 hours. Your knowledgeable ranger will guide you carefully through the terrain, pointing out fascinating flora and fauna along the way, setting a calm and respectful tone for the encounter. Upon locating a gorilla family, you will spend a magical, once-in-a-lifetime hour quietly observing these majestic creatures in their natural environment. Witness silverbacks leading their troops, mothers caring for their young, and playful juveniles interacting. Your ranger will provide insightful commentary, enriching your understanding of gorilla social structures and conservation challenges. '),
(555, 122, 2, 'Afternoon', 'After the trek, you will return to the park headquarters for a well-deserved lunch at a trusted local lodge. For those interested, the afternoon offers an optional visit to the Iby’Iwacu Cultural Village. Here you can engage directly with local communities, experience traditional Rwandan culture, and learn about the important role community-based tourism plays in supporting conservation and livelihoods. This cultural visit strengthens the connection between tourism and sustainable development, giving you a fuller appreciation of the region’s heritage.'),
(556, 122, 3, 'Evening', 'Following an inspiring day immersed in Rwanda’s natural and cultural treasures, you will enjoy a comfortable transfer back to Kigali. Relax during the drive and reflect on the profound experience you’ve just had. Upon arrival, you will be dropped off at your accommodation, with the option to receive personalized recommendations for the rest of your stay in Rwanda. Our team remains available to assist you with any further travel plans or questions, ensuring your trip is seamless and memorable.'),
(557, 121, 1, 'Morning', 'Your adventure begins with an early pickup from your Kampala accommodation, ensuring you make the most of your day. Enjoy a comfortable scenic drive through Uganda’s picturesque countryside as you head west toward Kibale Forest National Park, renowned for its rich biodiversity. Upon arrival, meet your experienced park rangers who will provide a thorough briefing before embarking on your chimpanzee trekking expedition. Trek through the dense, lush rainforest, listening to the sounds of the wild as you track these fascinating primates in their natural habitat. The trek typically lasts between 2 to 4 hours, depending on where the chimpanzees are found, offering an exhilarating opportunity to observe their playful behaviors and social interactions up close.'),
(558, 121, 2, 'Afternoon', 'After your rewarding trek, relax and enjoy a delicious lunch at a nearby local lodge or a scenic picnic site surrounded by nature. Following lunch, take a guided walk through the Bigodi Wetland Sanctuary, a pristine habitat teeming with rare bird species, butterflies, and other wildlife. This peaceful sanctuary offers a unique glimpse into Uganda’s incredible ecosystem and a chance to spot creatures rarely seen elsewhere. To deepen your connection with the local culture, visit a nearby village where you will engage with community members, learn about their traditions, and experience authentic Ugandan hospitality firsthand.'),
(559, 121, 3, 'Evening', 'As the day winds down, settle in for the comfortable return drive to Kampala, reflecting on the unforgettable encounters and vibrant experiences of your journey. Arrive back at your accommodation in the early evening, enriched by a day of adventure, wildlife, and cultural discovery.'),
(560, 119, 1, 'Day 1: Arrival in Kigali and Transfer to Goma, DRC', 'Meet your guide at Kigali International Airport or at your hotel, then begin your journey through the scenic northern region of Rwanda, where you’ll enjoy breathtaking views of the Virunga volcano chain. After crossing the Gisenyi–Goma border, continue on to the Virunga National Park headquarters for a briefing. You’ll spend the night at your lodge in Goma or just outside the park, preparing for the adventure ahead.\n\nOvernight: Mikeno Lodge / Lac Kivu Lodge\nMeals: Dinner\n'),
(561, 119, 2, 'Day 2: Mountain Gorilla Trekking in Virunga National Park', 'After an early breakfast, transfer to the Bukima Patrol Post, the starting point for your mountain gorilla trek. Here, you’ll meet the park rangers and join a small group for the guided hike through dense tropical forest, which typically takes between 2 to 5 hours depending on the gorillas’ location. Once you find the habituated gorilla family, spend a precious hour observing their interactions, feeding, and natural behavior in the wild. After this unforgettable experience, return to Bukima and transfer back to your lodge for rest and reflection.\n\nOvernight: Bukima Tented Camp / Mikeno Lodge\nMeals: Breakfast, Lunch, Dinner\n'),
(562, 119, 3, 'Day 3: Nyiragongo Volcano Hike and Summit Camping', 'Begin your day with an early transfer to the Kibati Ranger Post, the starting point for your trek to the summit of Mt. Nyiragongo, which stands at 3,470 meters. Accompanied by experienced rangers and porters, you’ll embark on a 4–6 hour climb through lush forest and rugged volcanic terrain. Upon reaching the crater rim, you\'ll be rewarded with a breathtaking view of the world’s largest lava lake, glowing brilliantly after sunset. Spend the night in summit shelters, camping above the fiery abyss and taking in the dramatic beauty of this volcanic wonder.\n\nOvernight: Nyiragongo Summit Cabins\nMeals: Breakfast, Lunch, Dinner\n'),
(563, 119, 4, 'Day 4: Descend Nyiragongo and Transfer to Goma', 'Begin an early descent from the volcano, enjoying sweeping panoramic views as the sun rises over the landscape. Upon reaching the base, transfer back to Goma where you can choose to relax at your lodge or explore the vibrant art and craft markets in town. Spend the night in Goma, with dinner served overlooking the tranquil waters of Lake Kivu.\n\nOvernight: Lac Kivu Lodge / Serena Goma\nMeals: Breakfast, Lunch, Dinner\n'),
(564, 119, 5, 'Day 5: Transfer to Kigali and Departure', 'After breakfast and check-out, begin your drive back to Kigali, a scenic journey of approximately 4 to 5 hours. Along the way, you may choose to stop for local shopping, a coffee tour, or lunch at a charming spot en route. Upon arrival in Kigali, you’ll be dropped off at the airport for your international flight or at your hotel for continued relaxation.\n\nMeals: Breakfast, Lunch\n'),
(575, 117, 1, 'Day 1: Arrival in Kigali and Transfer to Musanze', 'Upon arrival at Kigali International Airport, you will be warmly welcomed by our professional guide. For those interested in a deeper understanding of Rwanda’s history, an optional visit to the Kigali Genocide Memorial offers a powerful cultural and historical grounding. From there, enjoy a scenic 2.5-hour drive to Musanze, a journey that showcases Rwanda’s breathtaking rolling hills and vibrant village life along the way. Upon arrival, check in at your eco-lodge, with a choice between comfortable mid-range or luxurious accommodations. Spend the evening at your leisure, or take part in a guided local walk to immerse yourself in the rich traditions and everyday life of the Rwandan people.\n\nOvernight: Mountain Gorilla View Lodge / Five Volcanoes Boutique Hotel\n\nMeals: Dinner'),
(576, 117, 2, 'Day 2: Gorilla Trekking in Volcanoes National Park', 'Enjoy an early breakfast at the lodge before transferring to the Park Headquarters in Kinigi for a gorilla trek briefing and permit check. Begin your guided gorilla trek with experienced park rangers, which may take between one to six hours depending on the location of your assigned group. Once you locate the gorillas, spend one magical hour with a habituated family, observing their behavior, social interactions, and daily routines. After the return trek, enjoy lunch at the lodge. In the afternoon, you may choose to visit the Iby’Iwacu Cultural Village, enjoy a local banana beer experience, or simply relax at the lodge.\n\nOvernight: Same as Day 1\n\nMeals: Breakfast, Lunch, and Dinner'),
(577, 117, 3, 'Day 3: Transfer to Kigali and Departure', 'Begin your day with a leisurely breakfast at the lodge, followed by optional morning activities such as a guided community walk or a visit to a local artisan market, where you can explore handcrafted souvenirs and connect with local culture. Afterward, embark on a scenic drive back to Kigali, enjoying picturesque stopovers along the way for photos and sightseeing. Once in the city, you may choose to visit a local gift shop or indulge in a Rwandan coffee tasting experience to round off your journey. Depending on your travel plans, we will provide an airport drop-off for your departure flight or a transfer to your hotel in Kigali, with the option to stay an extra night for those wishing to explore more of the capital.\n\nMeals: Breakfast, and Lunch'),
(582, 124, 1, 'Day 1: Arrival in Kigali and Transfer to Kinigi', 'Arrive at Kigali International Airport and meet your private driver-guide.\nOptional short Kigali city tour, including the Genocide Memorial.\nScenic drive to Musanze (2.5 hours) with rolling green landscapes.\nCheck into your eco-lodge with stunning views of the Virunga volcanoes.\nDinner and orientation about the region’s community-based conservation work.\n\nOvernight: Isange Paradise Resort / Amahoro Guest House\nMeals: Dinner'),
(583, 124, 2, 'Day 2: Village Experience and Cultural Tours', 'Breakfast at the lodge.\nVisit a women’s weaving cooperative: learn banana fiber or basket-making.\nJoin a local farming family: try hoeing, planting, or harvesting (seasonal).\nCook traditional Rwandan food with women in the village.\nAfter lunch, join local youth for a traditional Intore dance performance.\nOptional guided walk to the twin lakes (Burera & Ruhondo) at sunset.\n\nOvernight: Same lodge\nMeals: Breakfast, Lunch, Dinner'),
(584, 124, 3, 'Day 3: Conservation Engagement and Community Walk', 'Visit the Ellen DeGeneres Campus of the Dian Fossey Gorilla Fund.\nExplore gorilla research exhibits and eco-architecture.\nLearn how science, community, and education help protect endangered species.\nAfternoon guided community walk in Kinigi:\nVisit a local school, speak with teachers and students.\nMeet local beekeepers and see their traditional hives.\nEvening storytelling session by a village elder around a fire.\n\nOvernight: Same lodge\nMeals: Breakfast, Lunch, Dinner'),
(585, 124, 4, 'Day 4: Local Market Visit and Return to Kigali', 'at a vibrant local market in Musanze for handicrafts and fresh produce.\nReturn drive to Kigali with scenic viewpoints.\nOptional lunch stop and transfer to the airport or hotel.\n\nMeals: Breakfast, Lunch\n'),
(596, 126, 1, 'Day 1: Arrival in Kigali and Transfer to Nyungwe', 'Your adventure begins with a warm welcome in Kigali, followed by a scenic drive southward through Rwanda’s picturesque hills and valleys. En route, enjoy two enriching cultural stops: the King’s Palace Museum in Nyanza, home to Rwanda’s iconic long-horned Inyambo cattle and royal traditions, and the Ethnographic Museum in Huye, offering powerful insights into Rwandan history, music, and identity. After lunch in Butare, continue to the Nyungwe region, where you’ll check in to your tranquil forest lodge. Spend your evening relaxing with panoramic views of the rainforest as you prepare for tomorrow’s primate adventure.\n\nOvernight: Nyungwe Top View Hill Hotel / Gisakura Guest House / One&Only Nyungwe House (Luxury Option)\nMeals: Lunch, Dinner'),
(597, 126, 2, 'Day 2: Chimpanzee Trekking and Canopy Walkway', 'Wake up early for a once-in-a-lifetime experience: chimpanzee trekking in Nyungwe’s misty forests. With expert trackers, follow these intelligent primates through their natural habitat, observing their social behavior and wild energy up close. After the trek, enjoy a well-earned breakfast back at your lodge and rest. In the afternoon, set out again to explore the famous Nyungwe Canopy Walkway, suspended 70 meters above the forest floor, offering sweeping views of the treetops, birds, and the untouched wilderness.\n\nOvernight: Same lodge\nMeals: Breakfast, Lunch, Dinner'),
(598, 126, 3, 'Day 3: Colobus Monkeys, Nature Trails and Tea Culture', 'After breakfast, choose a guided forest trail suited to your pace and interests, whether it’s the dramatic Kamiranzovu Swamp Trail, the peaceful Umuyove Waterfall Trail, or the scenic Igishigishigi Trail. Along the way, encounter Angola colobus monkeys, blue monkeys, and hundreds of forest bird species. In the afternoon, visit a local tea plantation, where you’ll learn how Rwanda’s cool highlands create some of the world’s finest teas, followed by a tasting of fresh brews with a view.\n\nOvernight: Same lodge\nMeals: Breakfast, Lunch, Dinner'),
(599, 126, 4, 'Day 4: Return to Kigali and Optional Lake Kivu Detour', 'After a final forest breakfast, begin your journey back to Kigali (approx. 6 hours). If time allows, enjoy a scenic detour to Lake Kivu for a lakeside lunch in Kibuye, a peaceful finale to your rainforest retreat. Arrive in Kigali in the afternoon for your onward flight or hotel drop-off, filled with incredible memories of Rwanda’s ecological and cultural beauty.\n\nMeals: Breakfast, Lunch'),
(600, 127, 1, 'Day 1: Kigali to Kibuye', 'Begin your adventure with a scenic drive through Rwanda’s lush, rolling hills, passing traditional villages and farmland. En route, stop at the fascinating King’s Palace Museum in Nyanza to witness Rwanda’s royal heritage or visit a roadside banana beer cooperative for an authentic taste of local tradition. Arriving in Kibuye, check into your eco-lodge nestled on the lake’s edge, offering stunning views. As the day cools, enjoy a relaxing sunset boat ride with local fishermen, immersing yourself in the tranquil rhythms of lake life.\n\nOvernight: Lake Kivu Serena Hotel / Home Saint Jean\nMeals: Lunch, Dinner'),
(601, 127, 2, 'Day 2: Island Canoe Adventure and Coffee Culture', 'Rise to a fresh lakeside breakfast before embarking on a traditional canoe excursion to one of Lake Kivu’s islands such as Napoleon Island or Peace Island. Observe exotic birdlife and absorb the peaceful atmosphere far from the crowds. In the afternoon, visit a community-run coffee washing station to discover Rwanda’s world-famous coffee process from bean to cup, complete with tastings of freshly brewed coffee. Spend your evening around a warm bonfire by the lake, sharing stories and local acoustic music with your hosts.\n\nOvernight: Same lodge\nMeals: Breakfast, Lunch, Dinner'),
(602, 127, 3, 'Day 3: Village Walks and Artisan Workshops', 'After breakfast, enjoy a guided walk through a nearby lakeside village where you’ll meet skilled basket weavers and fishermen, gaining insight into their traditional livelihoods and ongoing conservation efforts. Participate in a hands-on workshop with a women’s cooperative, learning the art of weaving or pottery. For the active, optional cycling along a scenic segment of the Congo Nile Trail is available. End your day with a sumptuous lakeside fish barbecue at sunset, soaking in the natural beauty and community spirit.\n\nOvernight: Same lodge\nMeals: Breakfast, Lunch, Dinner'),
(603, 127, 4, 'Day 4: Return to Kigali with Cultural Stop', 'Enjoy a leisurely breakfast overlooking the lake before departing for Kigali. On the way, stop in the towns of Muhanga or Ruhango to shop for local crafts and explore vibrant roadside markets. Arrive in Kigali by afternoon to continue your onward journey or extend your stay in Rwanda’s capital.\n\nMeals: Breakfast, Lunch'),
(604, 125, 1, 'Day 1: Arrival in Kigali and Transfer to Akagera', 'Upon arrival at Kigali International Airport, your private driver-guide will welcome you with a warm Rwandan greeting. Begin your journey with a scenic drive through the eastern province to Akagera National Park, Rwanda’s only savannah park and home of the Big Five.\n\nCheck in at your lodge, relax, and then head out on an optional sunset game drive. As golden light washes over the plains, you may spot giraffes, zebras, antelopes, or even lions emerging to hunt. Enjoy dinner under the stars as the sounds of the wild surround your lodge.\n\nOvernight: Akagera Game Lodge / Ruzizi Tented Lodge\nMeals: Dinner'),
(605, 125, 2, 'Day 2: Lake Ihema Boat Safari, Big Five Game Drive and Return to Kigali', 'Rise early for a light breakfast, then start your day with a scenic boat safari on Lake Ihema. Glide through calm waters where hippos wallow and crocodiles sunbathe, while birdwatchers will love the sightings of African fish eagles and kingfishers.\n\nAfter the boat ride, continue with a full game drive through Akagera’s varied landscapes from rolling savannahs to woodland hills and shimmering lakes. With expert tracking, you have a strong chance of seeing elephants, buffalo, lions, rhinos, and even leopards, along with herds of antelope and dazzling birdlife.\n\nAfter lunch, drive back to Kigali and check into your hotel for a relaxing evening in the heart of the city.\n\nOvernight: Heaven Boutique Hotel / Onomo Kigali\nMeals: Breakfast, Lunch'),
(606, 125, 3, 'Day 3: Nyandungu Eco Park and Kigali City Tour', 'After breakfast, begin your day at Nyandungu Eco Park, a restored urban wetland turned into an oasis of green. Walk among native trees, medicinal gardens, and bird-filled trails as your guide explains how Rwanda is leading the way in eco-restoration.\n\nContinue with a Kigali city tour, exploring both its emotional depth and modern innovation. Visit the Kigali Genocide Memorial to understand the country’s powerful story of resilience, followed by a stop at Inema Arts Center, where contemporary Rwandan artists bring local creativity to life. Optional visits to Kimironko Market or local craft shops can be arranged before your airport transfer.\n\nMeals: Breakfast, Lunch'),
(607, 128, 1, 'Day 1: Scenic Drive from Kigali to Mgahinga via Kisoro', 'Your adventure begins with a picturesque 3.5-hour drive from Kigali through lush rolling hills and traditional villages, crossing the border into Uganda. Arrive in Kisoro town and continue to your comfortable lodge nestled near Mgahinga National Park, surrounded by forested slopes and volcano views. Spend the afternoon at leisure, relax by the lodge’s panoramic terraces, stroll nearby trails, or visit local Batwa cultural centers to learn about the indigenous forest people’s traditions and resilience.\n\nOvernight: Gorilla Safari Lodge / Clouds Mountain Gorilla Lodge\nMeals: Lunch, Dinner'),
(608, 128, 2, 'Day 2: Gorilla Trekking', 'Rise early for a hearty breakfast before your detailed briefing with expert trackers. Enter the dense, misty forest in search of a habituated gorilla family. Trekking can range from 1 to 4 hours depending on gorilla locations, but the reward is immense: spending an hour with these gentle giants, witnessing their social bonds, playful interactions, and sheer power in the wild. After this once-in-a-lifetime experience, return to your lodge to relax and savor the peaceful surroundings. Reflect on the day’s encounters over a delicious dinner.\n\nOvernight: Same lodge\nMeals: Breakfast, Lunch, Dinner'),
(609, 128, 3, 'Day 3: Golden Monkey Tracking', 'Start your morning tracking the playful golden monkeys, a rare primate species endemic to Mgahinga’s bamboo forests. Walk through enchanting bamboo thickets and watch these agile, colorful monkeys swinging energetically from tree to tree. The trail is less strenuous than gorilla trekking, suitable for all fitness levels. After tracking, enjoy a relaxing afternoon at the lodge, take in the spectacular volcanic vistas, unwind in the gardens, or indulge in a soothing massage (optional). This day balances adventure with rest, giving you time to fully absorb the forest’s tranquil beauty.\n\nOvernight: Same lodge\nMeals: Breakfast, Lunch, Dinner'),
(610, 128, 4, 'Day 4: Return to Kigali', 'Enjoy a leisurely breakfast with sweeping views of the Virunga volcanic range before embarking on your scenic 3.5-hour drive back to Kigali. Use this time to reflect on the unforgettable wildlife encounters and the serene landscapes you’ve experienced. Arrive in Kigali in the early afternoon, ready for onward travel or additional adventures.\n\nMeals: Breakfast, Lunch'),
(611, 129, 1, 'Day 1: Drive from Kigali to Queen Elizabeth National Park', 'Cross the Rwanda-Uganda border and enjoy a beautiful 5-hour drive through rolling hills and the foothills of the majestic Rwenzori Mountains. Arrive at your lodge situated on the edge of the park with sweeping views over savannah plains alive with wildlife. After settling in, embark on your first game drive as the sun lowers, when animals like elephants, buffalo, and antelopes become more active. Spot graceful giraffes browsing, and keep your eyes peeled for elusive predators on the hunt. Return to your lodge to unwind beneath a breathtaking African sunset.\n\nOvernight: Mweya Safari Lodge / Ishasha Wilderness Camp\nMeals: Lunch, Dinner'),
(612, 129, 2, 'Day 2: Morning Game Drive and Kazinga Channel Boat Safari', 'Rise early for a guided game drive through Queen Elizabeth’s diverse habitats. This is your chance to witness the park’s famous tree-climbing lions perched high in acacia branches; a sight found nowhere else on earth. Watch large herds of elephants and buffalo roam, and spot other residents like warthogs, Uganda kob, and a myriad of bird species. After lunch and a restful break, board a boat for a leisurely afternoon cruise along the Kazinga Channel. Glide past enormous pods of hippos basking on the banks, stalking crocodiles, and flocks of colorful waterbirds. This peaceful safari experience offers incredible photo opportunities and an intimate connection with nature.\n\nOvernight: Same lodge\nMeals: Breakfast, Lunch, Dinner'),
(613, 129, 3, 'Day 3: Final Morning Game Drive and Return to Kigali', 'Start your day with one last game drive, soaking in the early morning wildlife activity and the fresh savannah air. Capture those final moments with lions, elephants, and other iconic animals before heading back to the lodge for breakfast. Then begin your scenic 5-hour drive back to Kigali, reflecting on the stunning ecosystems and unforgettable memories you’ve gathered on this compact but rich Ugandan safari adventure.\n\nMeals: Breakfast, Lunch'),
(617, 130, 1, 'Day 1: Kigali to Bukavu and Transfer to Kahuzi-Biega', 'Begin early with a border crossing into DR Congo, followed by a scenic drive to Bukavu town, surrounded by hills and Lake Kivu’s serene waters. After settling into your lodge, take time to relax or explore Bukavu’s local markets and culture. Enjoy a delicious dinner as you prepare for the wildlife adventures ahead.\n\nOvernight: Bukavu Guest Lodge / Kahuzi Lodge\nMeals: Lunch, Dinner'),
(618, 130, 2, 'Day 2: Gorilla Trekking in Kahuzi-Biega National Park', 'Rise before dawn for a comprehensive briefing, then venture deep into the dense rainforest with expert trackers. Spend up to one hour observing the eastern lowland gorillas, a rare and gentle species rarely seen outside Congo. Capture incredible photos and absorb the power of this untouched wilderness. After trekking, relax with a late lunch, then embark on an optional afternoon game drive or birdwatching session to spot buffalo, monkeys, and diverse avian species.\n\nOvernight: Same lodge\nMeals: Breakfast, Lunch, Dinner'),
(619, 130, 3, 'Day 3: Morning Nature Walk and Return to Kigali', 'Enjoy a peaceful morning walk to absorb the forest’s rich biodiversity. After breakfast, begin the scenic drive back to Kigali, crossing the border with memories of gorilla eyes and wild Congo landscapes etched forever in your heart.\n\nMeals: Breakfast, Lunch'),
(624, 131, 1, 'Day 1: Kigali to Goma and Transfer to Virunga National Park', 'Cross the border early to Goma, a bustling town on Lake Kivu’s shores. Transfer to your lodge inside or near Virunga National Park, where you will receive an orientation briefing. Enjoy the lodge’s natural surroundings with spectacular views of volcanoes and the lake.\n\nOvernight: Mikeno Lodge / Virunga Lodge\nMeals: Lunch, Dinner'),
(625, 131, 2, 'Day 2: Gorilla Trekking in Mikeno', 'After an early breakfast and briefing, set off on your gorilla trek through lush forest trails. Spend up to an hour in the presence of the magnificent mountain gorillas, observing their family dynamics and behaviors. Return to the lodge for rest or enjoy a visit to nearby volcanic hot springs.\n\nOvernight: Same lodge\nMeals: Breakfast, Lunch, Dinner'),
(626, 131, 3, 'Day 3: Wildlife Safari and Cultural Visit', 'Begin your day with a game drive to spot elephants, buffalo, and other wildlife unique to Virunga’s ecosystem. Later, visit a nearby Batwa community to learn about their culture and conservation roles. Evening relaxation back at the lodge under starry skies.\n\nOvernight: Same lodge\nMeals: Breakfast, Lunch, Dinner'),
(627, 131, 4, 'Day 4: Return to Kigali', 'After breakfast, start the scenic drive back to Kigali, reflecting on your incredible journey through Congo’s wild heart and the magical gorilla encounters.\n\nMeals: Breakfast, Lunch'),
(641, 135, 1, 'Day 1: Arrival and Community Introduction', 'Travel from Kigali to Kinigi and settle into your eco-lodge. Meet community leaders and cooperative coordinators working on conservation and sustainable tourism. Take a short orientation walk to understand local environmental challenges and efforts. Enjoy dinner with project partners.'),
(642, 135, 2, 'Day 2: Forest Buffer Zone & Tree Planting Activity', 'After breakfast, join a reforestation team planting indigenous trees along the park buffer zone—an essential activity for gorilla habitat protection. Learn about the ecological importance of native species and assist in hands-on planting and soil preparation. Return to your lodge for a cultural dance performance by local youth.'),
(643, 135, 3, 'Day 3: Eco-Education and Waste Management Project', 'Today you’ll participate in a community eco-education session, helping with creative workshops at a local school or youth center. Topics range from recycling to wildlife protection. Assist in setting up eco-bins or sorting waste with a women-led cooperative. Afternoon discussion session with conservation staff and community volunteers.'),
(644, 135, 4, 'Day 4: Reflection and Farewell Walk', 'Take a reflective morning walk to a viewpoint overlooking the park and farmland below. Engage in a closing conversation with your guide and fellow volunteers about lessons learned. Depart for Kigali in the early afternoon, with a certificate of participation and renewed sense of purpose.'),
(648, 132, 1, 'Day 1: Arrival and Traditional Welcome', 'Your cultural journey begins with a scenic drive from Kigali to Kinigi, a village nestled at the foot of the Virunga Volcanoes. Upon arrival, meet your host family and experience a warm Rwandan welcome, followed by a traditional home-cooked dinner. In the evening, enjoy drumming and dance around the fireplace as local youth perform age-old rhythms.'),
(649, 132, 2, 'Day 2: Iby’Iwacu Cultural Village Experience', 'After breakfast, immerse yourself in a full day at the Iby’Iwacu Cultural Village. Participate in traditional activities such as banana beer brewing, spear-throwing, millet grinding, and learning about ancient royal traditions. In the afternoon, visit a local women’s cooperative to try your hand at basket weaving and jewelry-making using traditional materials.'),
(650, 132, 3, 'Day 3: Musanze Market and Storytelling with Elders', 'Visit the bustling Musanze market, where you’ll explore stalls filled with vibrant textiles, fresh produce, and handmade crafts. Learn about the cultural significance of Rwanda’s fabrics and the history of “imigongo” art. Later in the afternoon, enjoy a storytelling session with village elders as they share folk tales, proverbs, and oral history passed down for generations.'),
(651, 132, 4, 'Day 4: Morning Village Walk and Farewell', 'Before departing, take a gentle morning walk with your host family through their fields. Help with light farming tasks or collect herbs from the garden. Share a farewell breakfast and return to Kigali with a deeper understanding of Rwanda’s cultural heartbeat.'),
(652, 133, 1, 'Day 1: Kimironko Market and Inema Arts Center Visit', 'Begin your cultural journey with a guided visit to Kimironko Market, the largest and liveliest in Kigali. Here, you’ll explore rows of colorful kitenge fabrics, fresh produce, local herbs, and artisan products while learning how markets function as a social and cultural hub. After lunch at a Rwandan fusion restaurant, you’ll tour the Inema Arts Center, where local artists share their creative process. Later in the afternoon, participate in a painting or craft workshop led by resident artists. Enjoy a relaxed evening at your hotel or optional cultural performance.'),
(653, 133, 2, 'Day 2: Nyamirambo Women’s Center Tour and Cultural Interaction', 'After breakfast, head to the Nyamirambo Women’s Center for a walking tour through Kigali’s oldest neighborhood. Hear stories of the city’s evolution, visit a tailor’s shop, try traditional snacks, and engage in a conversation about women’s roles in cultural preservation. Conclude with a home-cooked lunch prepared by the women’s cooperative, and take part in a short drumming or dance lesson. Return to your hotel or airport with fresh insights into Rwanda’s urban culture.'),
(657, 136, 1, 'Day 1: Kigali City Highlights and Interactive Museum Tour', 'Start your family journey with a private pick-up and orientation around Kigali. Visit the Kandt House Natural History Museum with child-friendly exhibits and wildlife models. After lunch, head to the Inema Arts Center where kids can try painting or crafts in an informal workshop. Dinner at a family-friendly restaurant and overnight at a comfortable city lodge.'),
(658, 136, 2, 'Day 2: Family Nature Walks and Junior Eco-Ranger Adventure', 'Spend the day exploring the kid-friendly trails of Nyandungu Eco Park. Join a guided nature walk, spot birds and butterflies, and stop at the herbal garden. Children can join the “Junior Eco-Ranger” activity led by local educators, learning about trees, wetlands, and animals in a fun, interactive way. Picnic lunch in the park. Optional cycling or scooter rental for teens.'),
(659, 136, 3, 'Day 3: Taste, Shop, and Say Goodbye', 'On your final day, visit Kimironko Market for a sensory tour, kids will love the colors, fruits, and friendly vendors. Try making a mini snack with a local chef (avocado toast or juice). Depending on your schedule, stop for ice cream before transferring to the airport or next destination.'),
(660, 137, 1, 'Day 1: Welcome to the Farm and Animal Introduction', 'Drive from Kigali to the peaceful hills of Musanze. Check into a cozy farm lodge. In the afternoon, tour the farm and meet the animals: goats, chickens, rabbits, and cows. Children can feed and pet animals under guidance. Evening bonfire with marshmallow roasting and farm-fresh dinner.'),
(661, 137, 2, 'Day 2: A Day in the Life of a Rwandan Farmer', 'Start the day collecting eggs or vegetables for breakfast. Join your hosts in the fields; planting, watering, or learning how compost works. Afterward, help prepare a traditional meal using ingredients you gathered. Enjoy quiet time in the garden or take part in a mini farming quiz game for kids.'),
(662, 137, 3, 'Day 3: Eco-Games and Farewell Snack Making', 'Before leaving, play nature-themed games with local children (like sack races or scavenger hunts). Wrap up the tour with a fun banana juice and snack-making activity. Say goodbye to your hosts and return to Kigali in the early afternoon.'),
(663, 138, 1, 'Day 1: Arrival in Kinigi and Village Nature Walk', 'Travel from Kigali to Kinigi and check into a family eco-lodge. In the afternoon, take a short, guided village nature walk. Your kids will learn how locals use plants for medicine, food, and rituals. Gather around a campfire in the evening to hear animal folktales told by a village elder.'),
(664, 138, 2, 'Day 2: Child-Friendly Forest Trail Experience', 'Enjoy a gentle, guided trail walk in the park buffer zone or nearby nature reserve. Spot birds, small animals, and butterflies while completing a \"forest scavenger list\" with your guide. A picnic lunch in the clearing makes the experience fun and relaxed. Afternoon crafting using leaves or mud art.'),
(665, 138, 3, 'Day 3: Bird-Watching and Nature Picnic', 'Before heading back, enjoy a short bird-watching session, binoculars included! Identify colorful species and hear their songs. Wrap up your trip with a small picnic and juice celebration before your journey back to Kigali.'),
(669, 134, 1, 'Day 1: Arrival and Village Orientation Walk', 'Your journey begins with a drive from Kigali to Kinigi, where the volcanic peaks form a dramatic backdrop. After a welcome by your local hosts, join a community leader on a guided walk through the village. Visit a primary school, local shops, and homes while learning about traditional values and modern village life. End the day with a home-cooked dinner and evening storytelling around the fire.'),
(670, 134, 2, 'Day 2: Farming, Cooking & Cultural Activities', 'Wake up early and join your host family in the fields. Learn traditional farming techniques from planting beans to herding goats, depending on the season. After a hearty mid-morning break, help prepare a Rwandan lunch using fresh, homegrown ingredients. In the afternoon, join a youth cooperative for traditional crafts or dance. Dinner and overnight at your host family\'s homestead.'),
(671, 134, 3, 'Day 3: Community Exchange and Departure', 'Spend the morning engaged in a reflective conversation with local leaders about community development, challenges, and hopes for the future. Enjoy a final village breakfast, followed by a short walk to the base of the volcanoes to soak in the scenery one last time. Depart for Kigali by early afternoon.'),
(672, 139, 1, 'Day 1: Kigali Market Tour and Street Food Discovery', 'Begin your culinary journey with a guided tour through Kimironko Market. Explore vibrant stalls of tropical fruits, spices, and vegetables. Sample local snacks like sambaza and boiled maize. In the afternoon, enjoy a Kigali street food tasting: brochettes, isombe, ibirayi, and plantains with storytelling about food traditions and community.'),
(673, 139, 2, 'Day 2: Rwanda’s Favorite Drinks and Dishes', 'Start with a visit to a banana beer brewing cooperative. Learn how the drink is made and enjoy a tasting session. In the afternoon, visit a specialty coffee café for a curated tasting of Rwandan beans paired with traditional pastries. Dinner at a local fusion restaurant that reimagines Rwandan classics.'),
(674, 139, 3, 'Day 3: Rwandan Cooking in Practice', 'Visit the home of a local chef for a hands-on cooking session. Learn to make ibirayi, isombe, and urwagwa banana bread. Enjoy your meal as a family-style lunch, with cultural stories and music. Transfer to airport or your next destination.'),
(678, 140, 1, 'Day 1: Transfer to Kinunu Coffee Estate by Lake Kivu', 'Depart Kigali and travel through western Rwanda to Kinunu Coffee Washing Station by Lake Kivu. Enjoy a guided tour of the plantation, learn how coffee is processed, and try bean sorting. End the day with a fresh cup of single-origin brew while watching the sun set over the lake.'),
(679, 140, 2, 'Day 2: Gisovu Tea Estate Experience', 'Head to Gisovu for an immersive tour of one of Rwanda’s most scenic tea estates. Walk the fields, interact with tea pickers, and join a tasting session led by tea experts. Enjoy a traditional tea pickers’ lunch. Return to lodge for relaxation or sunset walk.'),
(680, 140, 3, 'Day 3: Farmhouse Brunch and Return to Kigali', 'Before heading back, enjoy a local-style brunch at a countryside guesthouse featuring farm produce, traditional pancakes, and fresh tea. Reflect on your journey and take home a gift box of Rwandan tea and coffee.'),
(681, 141, 1, 'Day 1: Arrival and Introduction to Rwandan Flavors', 'Arrive in Musanze and check into a scenic eco-lodge. Begin with a welcome dinner of Rwandan favorites like igisafuriya and ibirayi. Discuss the history of local food with your guide while enjoying a banana beer or fresh hibiscus tea.'),
(682, 141, 2, 'Day 2: Village Market Tour and Full Cooking Class', 'Walk to a village market with your host chef and shop for fresh ingredients. Back at the cooking center, join a step-by-step traditional class preparing a three-course Rwandan meal. Try dishes like urwagwa sauce, isombe, and plantain stew. Enjoy your meal together and receive a printed recipe set.'),
(683, 141, 3, 'Day 3: Quick Cooking and Farewell Tasting Session', 'Join a shorter morning session focused on traditional snacks, peanut cookies, sorghum pancakes, and banana juice. Share a tasting with your hosts and take a family photo before departing for Kigali.'),
(684, 142, 1, 'Day 1: Birding in Nyungwe Forest', 'Depart early from Kigali and drive to Nyungwe National Park, home to over 300 bird species. After lunch, take a guided birdwatching walk along the forest edges and canopy trails, where you may spot the Great Blue Turaco, Ruwenzori Turaco, and Red-collared Mountain Babbler. Settle in at a nature lodge for dinner and bird call identification at dusk.'),
(685, 142, 2, 'Day 2: Akagera Park Safari', 'Early transfer to Akagera National Park for a full day of birding along lakes and open savannah. Search for African fish eagles, shoebills, papyrus gonoleks, and herons. Stop for a lakeside picnic before continuing through different habitats. Evening bird count and checklist session with your guide at the lodge.'),
(686, 142, 3, 'Day 3: Sunrise Walk and Return to Kigali', 'Take a gentle morning walk through Akagera’s wooded hills, spotting smaller birds like bee-eaters, starlings, and sunbirds. Return to Kigali with a stopover at Nyandungu Eco Park for a final light birding stroll and coffee.'),
(687, 143, 1, 'Day 1: Welcome to the Misty Highlands', 'Depart from Kigali and travel through the rolling hills of Western Rwanda to Gishwati-Mukura. After settling in at a community eco-lodge, enjoy a gentle introductory walk through nearby farmland buffer zones and forest edges, guided by local experts. Learn about the park’s conservation history and its unique mix of East and Central African flora.'),
(688, 143, 2, 'Day 2: Deep Forest Walk and Waterfall Visit ', 'Join park rangers for a nature immersion trek through the park’s core forest zone. Along the way, spot L’Hoest monkeys, golden monkeys, and countless butterflies. Visit a small waterfall tucked within the forest for a picnic lunch. Spend the afternoon in quiet observation or optional meditation on a forest platform.'),
(689, 143, 3, 'Day 3: Community Nursery and Scenic Drive Back', 'Before departing, visit a local tree nursery supported by the park. Learn how local youth are helping reforest the area and engage in a brief tree-planting experience. Stop at a viewpoint en route to Kigali to enjoy one last scenic panorama of the forested hills.'),
(690, 144, 1, 'Day 1: Arrival and Nyandungu Eco Park Experience', 'Arrive in Kigali and head straight to Nyandungu Eco Park for a guided slow-walk among native trees, herbal gardens, and wetlands. Participate in a gentle forest bathing session (Shinrin-yoku), designed to reduce stress and restore balance. Dinner at a quiet garden restaurant and overnight in a Kigali nature lodge.'),
(691, 144, 2, 'Day 2: Journey to Rulindo Hills and Mindful Walking', 'Drive to the hills of Rulindo District for a light trek through eucalyptus groves and terraced landscapes. Your local nature guide leads a series of breathing and listening exercises as you walk. Stop at a quiet farm for a locally sourced vegetarian lunch and silent reflection time. Evening return to Kigali for journaling or yoga (optional).'),
(692, 144, 3, 'Day 3: Kigali Forest Reserve and Departure ', 'Begin the morning with a forest walk in the Kigali Forest Reserve. Sit beneath the trees for a short meditation and gratitude circle. Enjoy brunch with herbal tea and natural juice before transferring to the airport or your next destination.'),
(693, 145, 1, 'Day 1: Lake Ruhondo Arrival and Sunset Reflection', 'Depart Kigali and drive north through the countryside to Lake Ruhondo. Check into a lakefront retreat lodge. After lunch, enjoy a guided silent walk along the lake shore and take time for individual meditation. At sunset, gather for a group reflection around a bonfire with soft instrumental music.'),
(694, 145, 2, 'Day 2: Visit Rugarama Prayer Hill and Guided Contemplation', 'In the morning, visit Rugarama Prayer Hill; one of Rwanda’s revered spiritual pilgrimage sites. Climb the peaceful hilltop, stopping at stations of prayer and contemplation guided by a spiritual leader or pastor. Afternoon is free for journaling, rest, or one-on-one spiritual conversation with your guide.'),
(695, 145, 3, 'Day 3: Morning Devotion and Return to Kigali', 'Start the day with a lakeside morning devotion. Share insights and personal reflections before breakfast. Depart for Kigali with a stop at a small rural chapel known for its hand-painted murals and faith history.'),
(696, 146, 1, 'Day 1: Kigali Cathedral Tour and Kibeho Overview', 'Begin with a guided visit to St. Michel Cathedral in Kigali and a walking tour of several significant downtown churches. Learn about the growth of Christianity in Rwanda. In the afternoon, transfer southward to the town of Kibeho, home of Rwanda’s most sacred Marian apparition site.'),
(697, 146, 2, 'Day 2: Kibeho Pilgrimage and Healing Mass', 'Spend the full day in Kibeho, attending a healing mass at Our Lady of Sorrows Church. Visit the apparition site and shrine, reflect in the peaceful gardens, and explore personal spiritual questions. Quiet time is offered in the afternoon for journaling, rosary prayer, or silent meditation.'),
(698, 146, 3, 'Day 3: Rosary Walk and Return via Butare Church', 'Enjoy a gentle morning rosary walk around the Kibeho compound. On the way back to Kigali, stop at the Butare Catholic Cathedral, one of the country’s oldest churches for final reflection and optional group sharing.'),
(699, 147, 1, 'Day 1: Arrival and Eco-Lodge Grounding Session', 'Travel to Gishwati Forest and check into a tranquil eco-lodge surrounded by native trees. Participate in a grounding session; combining breathing, Christian prayer, or mindfulness depending on guest preference. Enjoy a quiet, wholesome dinner and candle-lit evening prayer.'),
(700, 147, 2, 'Day 2: Forest Walk and Guided Spiritual Dialogue Activity', 'Take a gentle, meditative forest walk led by a nature guide and spiritual companion. Pause for moments of silence under sacred trees and journal prompts based on scripture or nature’s wisdom. After lunch, join an optional group spiritual dialogue or solo reflection time.'),
(701, 147, 3, 'Day 3: Forest Devotion and Departure', 'Morning forest devotion with a closing circle of gratitude and blessings. Depart for Kigali with peaceful hearts and deeper insight, making a final stop at a local women’s craft chapel.');
INSERT INTO `tour_days` (`day_id`, `tour_id`, `day_number`, `day_title`, `day_description`) VALUES
(705, 151, 1, 'Nature, Wellness and Eco-Adventure', 'Depart from Goma in the morning and cruise across Lake Kivu to Tchegera Island. The 30-minute boat ride reveals stunning views of the surrounding volcanoes and the lake’s calm expanse. Upon arrival, enjoy a welcome drink and an orientation to the eco-lodge and island facilities.\nSpend the day as you wish; kayaking along the volcanic shores, sunbathing on black sand beaches, taking a peaceful nature walk, or swimming in clear freshwater. The island is home to vibrant birdlife and offers one of the best spots for unplugging from the world. At midday, indulge in a fresh farm-to-table lunch prepared with local ingredients and enjoy uninterrupted views of Nyiragongo and Mikeno volcanoes.\nIn the afternoon, continue exploring or simply relax in a hammock with a book. Later, board the return boat to Goma, arriving just before sunset with a calm heart and a recharged spirit.'),
(706, 152, 1, 'Village Coffee Tour and Cultural Immersion', 'Begin your morning with a drive through the lush hills surrounding Goma to a rural village known for its high-quality Arabica coffee. Meet the members of a women-led or youth-led cooperative who will welcome you into their fields and homes with warmth and pride\nExplore the coffee process from seedling to roast, learn traditional techniques, and join a guided tasting of fresh brews. Midday, share a communal lunch featuring Congolese dishes made from locally sourced ingredients. After lunch, enjoy a lively cultural performance with drumming, dancing, and storytelling that gives insight into the daily rhythms and creative life of the village.\nAfter your cultural immersion, stroll through the village to meet local artisans or take in the surrounding scenery before returning to Goma in the late afternoon with gifts of memory, knowledge, and connection.'),
(707, 153, 1, 'Cross-Border Nature Walk and Cultural Immersion', 'Depart from your hotel in Musanze around 6:00 AM with our professional driver-guide. Travel through scenic Rwandan hills and cross into Uganda at Cyanika border post. Our team will assist you with a smooth immigration process before continuing toward the Bigodi community near Kibale Forest.\nArrive at Bigodi Wetland, a model of community-led conservation. Join a local guide from the Bigodi Ecotourism Project for a guided walk through the papyrus swamp and rainforest edges. Keep your binoculars ready, this protected area is home to over 200 bird species (including the great blue turaco) and multiple primate species such as black-and-white colobus monkeys and red-tailed monkeys. After the walk, enjoy a freshly prepared traditional Ugandan lunch and visit local artisans or participate in a hands-on weaving demonstration with women’s cooperatives.\nAfter an enriching nature and cultural experience, begin your return journey. Arrive back in Musanze by evening, filled with stories, photos, and a deeper connection to Uganda’s local communities and ecosystems.'),
(708, 154, 1, 'Source of the Nile Discovery and Jinja Day Cruise', 'Set off early from Musanze and travel eastward toward the Mirama Hills border crossing. Pass through rolling hills, tea plantations, and banana groves as you make your way into eastern Uganda. Our experienced guide ensures a seamless border experience and safe passage throughout the day.\nArrive in Jinja in time for a guided visit to the historic Source of the Nile, where Lake Victoria begins its epic journey northward. Hop aboard a boat and cruise to the exact point where the Nile flows out of the lake, an awe-inspiring moment surrounded by calm waters and sacred symbolism. Learn about the site’s importance in African exploration, trade, and faith traditions.\nEnjoy a lakeside lunch at a riverside restaurant, with options ranging from grilled tilapia to local Ugandan dishes. Afterward, browse local artisan markets or relax along the waterfront before beginning your scenic return to Rwanda.\nTravel back toward Musanze with picturesque views across Uganda and Rwanda’s highlands. Arrive by evening with unforgettable memories of your Nile River encounter.'),
(725, 149, 1, 'Morning with the Golden Monkeys in Volcanoes Park', 'Begin your journey with an early morning departure from Kigali (4:30 AM) or Musanze (6:30 AM). Arrive at Kinigi Park Headquarters by 7:00 AM for a short briefing from park guides. Then, set off on your golden monkey trek through scenic bamboo forest terrain at the foot of the Virunga Mountains.\nThe trek is usually easy to moderate and lasts 1–2 hours. Once your group locates the monkeys, you’ll enjoy one magical hour observing them swing, forage, and interact; all within close distance. Their golden-orange coats and cheeky energy make this a wildlife moment like no other.\nReturn to the park entrance before noon and transfer to a local restaurant for a hearty Rwandan lunch with views of the volcanoes. Optionally, enjoy a cultural visit to Iby’Iwacu Cultural Village for insights into traditional Rwandan life, music, and crafts before heading back to Kigali or being dropped off in Musanze.\n'),
(728, 148, 1, 'Stories of Resilience and Culture in Kigali', 'Your day begins at 8:30 AM with a pickup from your hotel by our friendly local guide. Start with a guided tour of the Kigali Genocide Memorial, a moving and powerful site that honors victims while educating visitors on Rwanda’s journey of healing. Proceed to Camp Kigali Memorial and the Belgian Peacekeepers Monument, which commemorate key moments from 1994.\n\nNext, immerse yourself in Kigali’s daily life at Kimironko Market, where you can engage with local vendors, try exotic fruits, and browse traditional fabrics and crafts. Afterward, enjoy a delicious Rwandan-style lunch at a local restaurant such as Heaven or Pili Pili.\n\nIn the afternoon, visit Inema Arts Center and Niyo Art Gallery to witness contemporary Rwandan creativity and the way art is transforming lives. End the day with a relaxing stop at Mount Kigali Viewpoint or Rebero Hill, offering sweeping city views and a quiet space to reflect before heading back to your hotel around 5:30 PM.'),
(729, 155, 1, 'Day 1: Arrival and Warm Welcome in Kinigi', 'Upon arrival at Kigali International Airport or your transfer point, you will embark on a scenic drive to Kinigi, the gateway to the majestic Virunga Volcanoes. En route, soak in panoramic views of Rwanda’s rolling hills, rich volcanic soils, and meticulously cultivated terraces. Upon arrival, settle into a charming, women-run eco-lodge that offers stunning views of the mountains and is rooted in local sustainability practices.\nYou’ll be welcomed with soothing herbal teas and fresh snacks prepared by the lodge hosts. In the late afternoon, join a welcome circle led by your female guide and respected women leaders from the community. This is a space to share your travel intentions and begin connecting with your group. As dusk settles, gather around a cozy fire for a storytelling session that offers a heartfelt introduction to the resilience, wisdom, and heritage of Rwandan women.'),
(730, 155, 2, 'Day 2: Nature Walk and Cultural Connection in Musanze', 'After a nourishing breakfast made from ingredients sourced locally, lace up your walking shoes for a guided nature walk with a trained female eco-ranger. This immersive trail just outside Volcanoes National Park introduces you to indigenous flora, birdlife, and conservation techniques practiced by local guardians of the forest.\nNext, head into Musanze for an engaging cultural visit to a women’s cooperative. Here, you’ll take part in interactive workshops such as traditional basket weaving, herbal medicine preparation, or natural dyeing techniques, all passed down through generations. Enjoy a communal farm-to-table lunch alongside the women of the cooperative, rich with conversation, laughter, and shared understanding.\nIn the afternoon, participate in a roundtable discussion on women’s roles in conservation and entrepreneurship, offering you a deep cultural perspective on sustainable livelihoods. Before returning to your lodge, receive a handcrafted keepsake symbolizing the bonds and lessons shared. In the evening, unwind with an informal gathering, journaling or reflecting under the stars.\n'),
(731, 155, 3, 'Day 3: Women’s Beekeeping and Forest Conservation Experience', 'Start your final day with a visit to a women-led beekeeping cooperative in the lush foothills of the Virunga Volcanoes. With safety gear provided, you’ll observe or assist in a honey harvesting demonstration, learning how beekeeping supports biodiversity and empowers women economically. Sample honey-based treats made by the group and discover how these small-scale enterprises are protecting pollinators and preserving ecosystems.\nLater, head to a nearby community forest restoration site, where local women are at the forefront of reforestation efforts. Participate in a tree-planting activity, symbolizing your personal connection to the land and your contribution to a greener future.\nConclude with a traditional Rwandan tea ceremony, using herbs and honey from the cooperative, surrounded by the women who made your experience unforgettable. A hearty farewell lunch follows, featuring local recipes passed down through generations. Before you depart, capture a group photo and receive a meaningful parting gift, perhaps a small jar of honey or a bee-inspired artisan item. Your transfer to Kigali or onward destination wraps up this soul-nourishing journey.\n'),
(742, 156, 1, 'Day 1: Arrival in Musanze', 'Welcome to Rwanda, the Land of a Thousand Hills! Your adventure begins with a scenic drive from Kigali to Musanze, the vibrant town nestled at the base of the Virunga Volcanoes. Along the journey, enjoy curated stops where your guide will introduce you to the geological story of the East African Rift Valley, highlighting volcanic soils and the dramatic topography that defines the landscape. Upon arrival, check in at a sustainable eco-lodge with stunning views of the volcanoes. In the evening, you\'ll gather for an engaging briefing on the formation of the Virunga Massif, exploring the connections between tectonics, biodiversity, and community life that make this region so unique.'),
(743, 156, 2, 'Day 2: Crater Lakes & Tectonic Beauty ', 'After breakfast, head out to the twin lakes of Burera and Ruhondo, formed by ancient volcanic activity and surrounded by lush hills. A peaceful boat ride takes you across these dramatic crater lakes, where the reflections of the volcanoes shimmer on the surface and birdlife thrives along the shores. Visit a lakeside fishing village and interact with locals who continue traditional practices on these tectonically shaped waters. Accompanied by a local geologist, you\'ll gain insight into how lava flows, subsidence, and faulting created these natural wonders. In the evening, enjoy a golden-hour stop at a scenic viewpoint as your guide shares local myths and scientific perspectives that bring the lakes’ history to life.'),
(744, 156, 3, 'Day 3: The Volcano Ascent ', 'Prepare for a rewarding hike through diverse vegetation zones, where volcanic features tell the story of past eruptions and fertile soils support unique plants. Your expert guide will share insights on the volcano’s formation, structure, and ecological importance. At the summit, take in breathtaking views of the pristine crater lake surrounded by clouds. After descending, relax back at your lodge with a warm dinner followed by an evening of traditional Rwandan music and storytelling.'),
(745, 156, 4, 'Day 4: Underground Mysteries', 'Delve into the depths of Rwanda’s volcanic history as you explore the Musanze lava tubes, vast subterranean passageways created by rivers of molten lava thousands of years ago. Equipped with safety gear and guided by geo-experts, you’ll navigate the cool darkness of these caves while learning about their formation, structure, and unique role in both natural history and human heritage. Later in the day, visit a community project where volcanic rock is used in eco-construction and local innovation, showcasing how geology directly supports sustainable development. In the evening, relax around a fire as local storytellers share legends of the volcanoes and their enduring influence on the people who live in their shadow.'),
(746, 156, 5, 'Day 5: Farewell in the Volcano’s Shadow', 'On your final day, visit the Dian Fossey Gorilla Fund’s Ellen DeGeneres Campus, a cutting-edge conservation and education center dedicated to protecting endangered mountain gorillas and their forest habitat. Set against a volcanic backdrop, the campus offers fascinating insights into how geology influences ecosystems, biodiversity, and the delicate balance that sustains wildlife in the region. Through interactive exhibits and guided interpretation, you’ll see how scientific research, habitat preservation, and community partnerships come together to protect one of the world’s rarest species. If the skies are clear, catch a final glimpse of Nyiragongo Volcano in the distance, its silhouette a striking reminder of the power still pulsing beneath the Earth’s surface. After a farewell lunch overlooking the Virunga range, return to Kigali with a newfound appreciation for the planet’s geological heartbeat and the people working to protect it.'),
(754, 157, 1, 'Day 1: Arrival in Musanze', 'Your journey begins with a scenic drive from Kigali to Musanze, offering the first glimpse of Rwanda’s ecological gradients and land use dynamics. As students pass from lowland farms to montane forest zones, topics such as deforestation, habitat fragmentation, and landscape connectivity will be introduced. On arrival, a field orientation sets the stage with a scientific overview of the Virunga Massif’s formation, biodiversity, and its significance in regional conservation. The day concludes with a keynote lecture on mountain gorilla protection, focusing on challenges like population pressure, disease, and habitat encroachment.'),
(755, 157, 2, 'Day 2: Primate Ecology and Forest Edge Dynamics', 'The day begins with a field-based primate ecology study, either golden monkeys or mountain gorillas, depending on permit availability. Students will record behavioral observations and habitat features while analyzing species interactions, niche adaptation, and human impact. An afternoon workshop on forest buffer zones explores strategies for reducing conflict and preserving biodiversity, especially in areas where human activity meets critical wildlife corridors. Evening discussions will delve into research ethics, data accuracy, and how science informs conservation policy.'),
(756, 157, 3, 'Day 3: Geology, Soils, and Biodiversity Interactions', 'Through a guided volcanic hike on Mount Bisoke or Muhabura, students will explore how the region’s geology shapes ecosystems. They will conduct soil sampling, vegetation profiling, and erosion assessments, linking earth sciences with ecological resilience. Guides will explain crater formation, lava flow patterns, and tectonic shifts, providing insight into how such processes have contributed to biodiversity and endemism in the Albertine Rift. Evening reflection sessions will synthesize field observations with broader questions on evolution and adaptation.'),
(757, 157, 4, 'Day 4: Community-Based Conservation and Sustainable Livelihoods', 'Students will immerse in the social dimensions of conservation through field visits to women-led cooperatives and local eco-tourism initiatives. Interviews and participatory observation will help analyze how conservation supports livelihoods through sustainable enterprise. A case study on Rwanda’s Tourism Revenue Sharing model will examine how policy translates into local benefit. The day closes with an optional cultural experience, traditional music and storytelling that reveal the intangible heritage linked to land and wildlife.'),
(758, 157, 5, 'Day 5: Ecosystem Services and Wetland Management', 'A visit to Rugezi Wetland or Musanze Caves introduces ecosystem services from carbon sequestration to water regulation. Students will conduct water sampling, map vegetation zones, and assess biodiversity indicators. A lecture on Rwanda’s Integrated Natural Resource Management policy will guide understanding of how governance systems aim to balance development and ecological health. Group discussions will challenge students to design practical, science-based solutions for wetland restoration or watershed protection.'),
(759, 157, 6, 'Day 6: Conservation Institutions and Student Synthesis', 'At the Dian Fossey Gorilla Fund’s Ellen DeGeneres Campus or the Rwanda Development Board offices, students will explore how institutions conduct research, policy planning, and cross-border collaboration. The afternoon is dedicated to student-led presentations synthesizing field data, stakeholder insights, and policy analysis into actionable conservation recommendations. This collaborative activity develops skills in evidence-based argument, public speaking, and constructive peer review. A closing session will help students reflect on the professional pathways opened by their experience.'),
(760, 157, 7, 'Day 7: Return Journey and Urban Eco Perspectives', 'During the return to Kigali, students engage in a structured debrief to consolidate lessons learned and identify questions for further research. A stop at Nyandungu Eco Park or Inema Arts Center offers a glimpse into urban sustainability and how green spaces contribute to environmental education in city settings. The program concludes with drop-offs at Kigali International Airport or university campuses, sending students home with field experience, analytical tools, and renewed purpose.'),
(773, 158, 1, 'Day 1: Volcanoes Foothills and Red Rocks Cultural Immersion', 'Begin your cycling journey in Musanze with bike fitting and safety briefing. Ride through peaceful volcanic foothills with magnificent views of the Virunga Volcanoes. Pedal to the Red Rocks Cultural Center, a lively cultural hub where you’ll enjoy traditional drumming and dance performances, engage in basket weaving workshops, and listen to storytelling that brings Rwandan traditions to life. Savor a delicious local lunch here. Return by bike or support vehicle to your accommodation in Musanze for rest.'),
(774, 158, 2, 'Day 2: Volcanoes View Cycle – Kinigi to Red Rocks', 'After breakfast, transfer or cycle to Kinigi, the start point for today’s ride. Cycle ~25–30 km through picturesque mountain roads with breathtaking panoramas of the Virunga Volcanoes. Along the route, enjoy peaceful stops that let you soak in the scenery and interact with welcoming local communities. Return to Red Rocks Cultural Center for lunch accompanied by traditional music and dance, enriching your cultural experience. Transfer back to your lodge or stay overnight near Kinigi.'),
(775, 158, 3, 'Day 3: Twin Lakes Serenity and Optional Canoe Ride', 'Cycle a scenic 25–30 km route to the stunning crater lakes, Burera and Ruhondo. The route winds through rolling hills and farmlands, offering a pleasant ride suitable for moderate fitness levels. Visit a fishing village to see traditional canoe making. Optional canoe ride on Lake Burera (additional fee) lets you experience the tranquil waters from a different angle. Enjoy lunch lakeside or at My Hill Eco Lodge, then return leisurely to Musanze by bike or support vehicle.'),
(776, 158, 4, 'Day 4: Lake Kivu Shoreline Ride – Rubavu to Pfunda', 'Transfer to Rubavu (Gisenyi) to begin a relaxed coastal ride along the beautiful shores of Lake Kivu. Cycle 15–25 km on flat, scenic roads lined with coffee farms and banana plantations. Optional visit to the Pfunda Tea Estate offers insight into Rwanda’s tea production and a chance to taste fresh brews. End your ride with panoramic lake views, perfect for photos and relaxation. Transfer back to Musanze or continue your onward journey from Rubavu.'),
(778, 159, 1, 'Full-Day Akagera Safari', 'Begin your day with an early pickup from your Kigali accommodation and enjoy a scenic 2.5-hour drive through Rwanda’s rolling hills to Akagera National Park. As the sun rises over the eastern savannah, you’ll enter the park and start your adventure with a guided game drive through sweeping plains, woodlands, and lakeside marshes. Keep your eyes peeled for majestic elephants, graceful giraffes, herds of buffalo and zebras, and, if you\'re lucky, one of Akagera’s elusive lions or rhinos. Your experienced guide will navigate the terrain, sharing wildlife insights and stories that bring the landscape to life. Around midday, pause for a peaceful picnic lunch at one of the park’s designated viewpoints, perhaps overlooking a hippo pool or shaded by acacia trees. After lunch, you have the option to join a tranquil boat safari on Lake Ihema (additional fee), where hippos wallow, crocodiles bask, and colorful birdlife fills the sky. If you prefer to stay on land, continue with a second game drive through a different part of the park for even more wildlife encounters. As afternoon fades into golden hour, begin the return journey through the park, catching final glimpses of animals as they become more active in the cooler light. Exit the park by late afternoon and relax on your drive back to Kigali, arriving at your hotel by early evening filled with unforgettable moments from Rwanda’s only Big Five safari destination.'),
(779, 118, 1, 'Day 1: Arrival in Kigali and Transfer to Musanze', 'After an early breakfast, you will transfer to the park headquarters for an informative briefing before embarking on a guided trek to find a gorilla family. The tracking can take anywhere from one to six hours, depending on the location of the gorillas. Once you reach them, spend a life-changing hour observing these majestic creatures in their natural habitat. After the trek, return to the lodge for lunch and enjoy an afternoon at leisure or opt for a cultural visit to the Iby’Iwacu Cultural Village.\n\nOvernight: Five Volcanoes Boutique Hotel / Da Vinci Gorilla Lodge\nMeals: Dinner\n'),
(780, 118, 2, 'Day 2: Gorilla Trekking in Volcanoes National Park', 'Explore two of Africa’s top primate destinations in one seamless adventure. Trek endangered mountain gorillas in both Rwanda and Uganda, walk with golden monkeys through bamboo forests, and immerse yourself in the beauty and resilience of East Africa’s natural and cultural heritage. This cross-border safari offers deep insight into conservation, local communities, and awe-inspiring wildlife.\n\nOvernight: Same lodge\nMeals: Breakfast, Lunch, Dinner\n'),
(781, 118, 3, 'Day 3: Golden Monkey Trekking and Transfer to Uganda', 'After breakfast, enjoy a half-day golden monkey trek, a fast-paced and playful experience through the bamboo forests. Then, cross the Cyanika border into Uganda and travel through scenic terraced hills and banana farms to reach the southern sector of Bwindi Impenetrable Forest. Upon arrival, settle into your lodge and relax while taking in the stunning views of the forest canopy.\n\nOvernight: Ichumbi Gorilla Lodge / Mahogany Springs Lodge\nMeals: Breakfast, Lunch, Dinner\n'),
(782, 118, 4, 'Day 4: Gorilla Trekking in Bwindi Impenetrable Forest', 'After an early breakfast, attend a briefing at the Uganda Wildlife Authority headquarters before beginning your second gorilla trekking experience with a different gorilla group. During the trek, you will encounter variations in terrain, vegetation, and gorilla behavior, offering a unique opportunity to compare the experiences between Uganda and Rwanda. Spend the afternoon at leisure or choose to join a community walk to meet the local Batwa communities.\n\nOvernight: Same lodge\nMeals: Breakfast, Lunch, Dinner\n'),
(783, 118, 5, 'Day 5: Forest Hike or Village Experience and Transfer to Lake Bunyonyi', 'Choose between a morning guided nature walk, a cultural tour, or bird watching before transferring mid-morning to Lake Bunyonyi, Africa’s second-deepest lake, famed for its more than 29 islands. Optional activities include canoe rides, zip-lining, or swimming, followed by a peaceful evening spent relaxing and enjoying the stunning views overlooking the lake.\n\nOvernight: Bird Nest Resort / Arcadia Cottages\nMeals: Breakfast, Lunch, Dinner\n'),
(784, 118, 6, 'Day 6: Return to Rwanda and overnight in Kigali', 'After breakfast, transfer back to Rwanda via the Gatuna border, arriving in Kigali by mid-afternoon. Check in at your Kigali hotel and enjoy a memorable farewell dinner to conclude your incredible journey.\n\nOvernight: Heaven Boutique Hotel / Kigali Serena\nMeals: Breakfast, Lunch, Dinner\n'),
(785, 118, 7, 'Day 7: Departure', 'Breakfast at the hotel.\nAirport transfer for your international flight or optional city shopping.\n'),
(786, 160, 1, 'Hike and Canopy Walk in the Rainforest', 'Morning Pickup and  Scenic Drive to Nyungwe Forest\nYour day begins with an early pickup from your accommodation in Huye or Gisakura, followed by a scenic drive to the Uwinka Reception Center in Nyungwe. Enjoy sweeping views of tea plantations and rolling hills as your guide shares stories of the park’s ecological significance.\nGuided Rainforest Nature Hike\nUpon arrival, you’ll begin a guided hike through the forest along one of Nyungwe’s renowned trails. As you walk under ancient mahogany trees and moss-draped vines, your guide will help you identify medicinal plants, vibrant butterflies, colorful birds, and playful primates such as L’Hoest’s or blue monkeys.\nCanopy Walk Experience and Walk Among the Treetops\nMidway through the hike, you’ll reach the highlight of the day: the famous canopy walkway, suspended 70 meters above the forest floor and stretching 160 meters in length. This thrilling bridge offers unmatched aerial views of the rainforest and its wildlife. It’s a perfect moment for awe, photos, and quiet reflection.\nRelaxed Lunch or Coffee Break (Optional Add-On)\nAfter the hike, enjoy an optional lunch at a local guesthouse or eco-lodge nearby, or relax with Rwandan coffee and conversation before your return journey.\nReturn Transfer and  Drop-Off\nYou’ll be driven back to your original pickup point, arriving by late afternoon. You’ll leave refreshed, inspired, and deeply connected to the wild soul of Rwanda.\n'),
(787, 161, 1, 'Swim, Cruise and Coffee at Lake Kivu', 'Morning Pickup and Scenic Drive to Lake Kivu\nYour day begins with pickup from your accommodation in Rubavu, Karongi, or nearby, followed by a short scenic drive to the lake’s edge. Enjoy views of lush hills and fishing villages as you arrive at the pristine lakeshore.\nBoat Cruise on Lake Kivu\nStep aboard a traditional wooden boat and set off for a leisurely cruise on Lake Kivu’s calm waters. Glide past small islands dotted with fishermen’s huts and vibrant birdlife, feeling the gentle breeze and admiring panoramic views of the surrounding hills and distant volcanoes.\nSwimming and Lakeside Relaxation\nAnchor in a safe swimming spot and take a refreshing dip in the clean, warm waters. Lounge on the beach or relax under the shade of lakeside trees as you soak up the peaceful atmosphere.\nLocal Coffee Tour and Tasting Experience\nDiscover the secrets of Rwanda’s famous coffee with a guided visit to a nearby coffee plantation or cooperative. Learn about the growing, harvesting, and roasting processes, then enjoy a tasting of freshly brewed local coffee, an aromatic treat you won’t forget.\nLakeside Lunch\nSavor a delicious lunch featuring fresh fish from the lake and seasonal local produce, served at a charming lakeside restaurant or eco-lodge. This meal offers a perfect opportunity to enjoy authentic Rwandan flavors while soaking in stunning lake views.\nAfternoon Leisure and Return\nAfter lunch, enjoy some leisure time to stroll along the lake shore or shop for local crafts before your return transfer to your accommodation.'),
(788, 162, 1, 'Cultural Dance, Local Life and Living Traditions', 'Morning Arrival and Warm Welcome\nBegin your day with a warm welcome by village hosts dressed in traditional attire. You\'ll be introduced to the cultural values and way of life of the Rwandan people, including a background on the history and transformation of former poachers into conservation ambassadors.\nTraditional Intore Dance and Drumming Performance\nBe swept away by the energy and grace of Rwanda’s Intore dancers, warriors and women performers who showcase centuries-old rhythms and movements. You’ll hear the beat of traditional drums and even be invited to join in the celebration with a few guided steps of your own.\nBanana Beer Brewing and Tasting\nGet hands-on with the banana beer brewing process, an important part of local social life and ceremonies. From peeling and mashing to fermenting and tasting, you\'ll learn the steps of creating this beloved Rwandan drink and share a toast with your hosts.\nLocal Home Visits and Cultural Demonstrations\nStep into village homes and experience everyday life through interactive activities such as traditional cooking, herbal medicine preparation, and craft-making. Learn directly from elders and artisans about the cultural knowledge passed down through generations.\nStorytelling, Crafts and Optional Shopping\nListen to engaging local stories and explore a selection of handmade crafts. Support the community by purchasing souvenirs such as woven baskets, beaded jewelry, or carved wooden items, all made by the residents of the cultural village.\nLate Afternoon Departure\nSay farewell to your new friends and depart with a heart full of appreciation, connection, and cultural insight.'),
(789, 163, 1, 'From Garden to Plate', 'Morning Arrival and Welcome Briefing\nYour day begins with a warm welcome at Red Rocks Cultural Center or a nearby local village. You’ll meet your host chef and farming guide who will introduce you to Rwanda’s agricultural heritage and the traditional foods that have nourished families for generations.\nFarm Visit and Ingredient Harvesting\nHead to a nearby community farm, where you’ll roll up your sleeves and help harvest fresh ingredients such as cassava leaves, beans, bananas, maize, or sweet potatoes, depending on what’s in season. Learn traditional farming methods and sustainable practices passed down through generations.\nHands-On Cooking Experience\nBack at the kitchen, under the guidance of a local chef, you’ll turn your harvest into a flavorful Rwandan feast. From preparing isombe (cassava leaves with peanut sauce) to making ugali, ibihaza (pumpkin stew), or brochettes, you’ll gain firsthand skills in traditional cooking techniques. You\'ll also learn how to grind ingredients using a mortar and pestle and cook over a charcoal fire, just like it’s done in rural homes.\nBanana Beer Tasting and Cultural Storytelling\nWhile your dishes finish cooking, enjoy a taste of traditional banana beer, a staple in rural celebrations. As you sip, listen to engaging stories about Rwandan food customs, family life, and the significance of meals in local culture.\nShared Lunch with Your Hosts\nSit down for a hearty shared meal with your hosts and fellow guests. Reflect on the experience, ask questions, and enjoy the rich flavors of the dishes you helped create, made with love, tradition, and ingredients straight from the land.\nAfternoon Farewell\nAfter lunch, you’ll have time to browse local crafts or chat further with your hosts before returning to your accommodation, full of inspiration and authentic memories.'),
(790, 164, 1, 'Birds, Biodiversity and Local Culture', 'Early Morning Pickup and Briefing\nStart your day early with pickup from your accommodation in Musanze or nearby. Your expert birding guide will brief you on the day\'s location, either Rugezi Marsh or Buhanga Forest, depending on the season, species movement, and your preference.\nGuided Birding Walk in Rugezi Marsh or Buhanga Forest\nBegin your birdwatching adventure with a slow, immersive walk through the chosen habitat. In Rugezi Marsh, scan the reedbeds, wetlands, and open grasslands for rare highland species like the Grauers Swamp Warbler, White-winged Swamp Warbler, and the elusive Papyrus Canary. If exploring Buhanga Forest, expect encounters with forest-dwelling endemics such as the Red-throated Alethe, Dusky Crimsonwing, and the Ruwenzori Batis, among many others. Your guide will help you identify bird calls, spot feeding behaviors, and understand bird ecology in this unique region.\nMidday Rest and Local Lunch\nTake a relaxing break with a hearty traditional Rwandan lunch, prepared by a nearby community or conservation cooperative. This meal offers time to reflect on the morning’s sightings and engage with local hosts.\nCultural Storytelling and Conservation Insight\nAfter lunch, enjoy a short storytelling session with a local elder or guide. Learn about traditional beliefs tied to the forest or marshlands, the importance of birds in local culture, and how communities are working to protect biodiversity in the face of modern challenges.\nAfternoon Birding Session and Return\nSpend a final hour exploring a different section of the habitat, giving you more chances to spot shy or rare species during the cooler part of the day. Afterward, return to your accommodation with your bird list growing and your spirit inspired.'),
(791, 165, 1, 'Rhythm, Culture and Celebration', 'Morning Welcome and Cultural Introduction\nYour journey begins with a heartfelt welcome from your cultural hosts at a local performance ground or cultural center in Musanze or Kinigi. Enjoy a brief introduction to the history and symbolism of Intore dance, once performed before Rwandan kings and now celebrated as a national heritage.\nDance Instruction: Posture, Meaning and Movements\nLed by experienced Intore dancers, you’ll learn the meaning behind each movement, from high-kicking steps that imitate warriors in battle to graceful hand gestures representing peace and victory. Begin with a gentle warm-up, then practice basic steps with personalized guidance.\nDrumming Session and Rhythm Training\nNext, dive into the drumming traditions that bring the dance to life. Learn the technique of playing the traditional ingoma drums, coordinating rhythm and tempo with your fellow participants. This energetic session builds unity, confidence, and joy.\nTraditional Attire and Group Performance\nPut on traditional Intore attire, including beaded crowns, sashes, and spears, and prepare for your mini performance. Supported by your instructors and the beat of live drums, you and your group will perform a full Intore sequence. Expect applause, celebration, and unforgettable energy.\nCertificate Ceremony and Cultural Exchange\nCelebrate your achievement with a short certificate ceremony, photo opportunity, and informal conversation with your instructors. Ask questions, share reflections, and learn how dance continues to shape identity and community in Rwanda today.\nOptional Add-On: Local Lunch or Craft Market Visit\nEnd the day with an optional traditional lunch or browse handmade cultural items at a nearby cooperative, perfect for souvenir lovers and those wanting to support local artisans.'),
(792, 166, 1, 'From Leaf to Cup and Farm to Table', 'Morning Pickup and Scenic Drive to Tea Plantations\nBegin your day with a comfortable pickup from your accommodation, followed by a scenic drive to either Gisovu or Gakenke tea estates nestled in Rwanda’s rolling hills. Your knowledgeable guide will introduce you to Rwanda’s tea history and the importance of sustainable farming.\nTour of Tea Plantation and Leaf Plucking\nWalk through emerald tea bushes with experienced tea pluckers, learning how to select the best leaves by hand. Gain hands-on experience as you pluck tea leaves yourself, guided by locals who share stories of their daily work and tea culture.\nTea Processing Demonstration and Tasting\nVisit the nearby tea factory to observe the fascinating process of withering, rolling, fermenting, drying, and sorting. Learn how these steps influence the flavor and quality of the final product. Enjoy a tasting session featuring different tea varieties, from delicate green teas to robust black blends, while discussing brewing tips.\nEco-Farm Visit and Sustainable Agriculture Workshop\nContinue to a nearby eco-farm where you’ll explore organic vegetable gardens, composting sites, and water conservation techniques. Learn about agroforestry, crop rotation, and eco-friendly pest management from passionate farmers dedicated to sustainability and community health.\nLunch with Local Produce\nEnjoy a wholesome lunch prepared with fresh ingredients from the eco-farm and surrounding areas. Savor traditional Rwandan dishes paired with freshly brewed tea you helped pick and process.\nAfternoon Reflection and Return\nSpend some quiet moments appreciating the rich landscapes before returning to your accommodation. Use the journey back to reflect on the deep connection between Rwanda’s land, people, and tea culture.');

-- --------------------------------------------------------

--
-- Table structure for table `tour_excluded`
--

CREATE TABLE `tour_excluded` (
  `excluded_id` int NOT NULL,
  `tour_id` int NOT NULL,
  `item_description` varchar(255) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tour_excluded`
--

INSERT INTO `tour_excluded` (`excluded_id`, `tour_id`, `item_description`) VALUES
(598, 120, 'International flights to/from Uganda'),
(599, 120, 'Uganda visa fees       '),
(600, 120, 'Travel insurance (highly recommended)  '),
(601, 120, 'Personal expenses, tips, and gratuities'),
(602, 120, 'Alcoholic and soft drinks unless otherwise specified'),
(603, 120, 'Optional activities or extensions not mentioned in the itinerary '),
(604, 120, 'Vaccinations and malaria prophylaxis'),
(605, 123, 'International flights      '),
(606, 123, 'Visa and travel insurance'),
(607, 123, 'Personal expenses and tips'),
(608, 123, 'Sleeping bag rental (if needed for overnight stays)'),
(609, 122, 'International and domestic flights'),
(610, 122, 'Personal expenses, tips, and gratuities'),
(611, 122, 'Travel and medical insurance'),
(612, 121, 'International and domestic flights   '),
(613, 121, 'Accommodation (can be arranged separately)  '),
(614, 121, 'Travel insurance '),
(615, 121, 'Personal expenses and gratuities'),
(616, 119, 'International flights '),
(617, 119, 'Rwanda visa and DRC visa'),
(618, 119, 'Travel insurance'),
(619, 119, 'Sleeping bag for summit (can be rented)'),
(620, 119, 'Drinks and personal expenses'),
(621, 119, 'Tips for guides, porters, and staff'),
(632, 117, 'International flights '),
(633, 117, 'Rwanda visa fee (available online or on arrival) '),
(634, 117, 'Travel insurance (highly recommended) '),
(635, 117, 'Tips for guides & porters'),
(636, 117, 'Personal expenses '),
(638, 124, 'International flights'),
(639, 124, 'International flights    '),
(640, 124, 'Travel insurance'),
(641, 124, 'Rwanda visa '),
(642, 124, 'Personal purchases '),
(643, 124, 'Gratuities'),
(651, 126, 'International flights'),
(652, 126, 'Rwanda visa        '),
(653, 126, 'Travel insurance'),
(654, 126, 'Optional activities not listed'),
(655, 126, 'Tips and personal expenses'),
(656, 126, 'Alcoholic beverages'),
(657, 127, 'International flights'),
(658, 125, 'International flights'),
(659, 125, 'International flights     '),
(660, 125, 'Rwanda visa'),
(661, 125, 'Travel insurance '),
(662, 125, 'Tips & personal expenses'),
(663, 128, 'International flights to/from Kigali'),
(664, 129, 'International flights to/from Kigali'),
(666, 130, 'Visa fees for DR Congo'),
(667, 130, 'International flights to/from Kigali     '),
(668, 130, 'Travel insurance and personal expenses'),
(669, 130, 'Tips and gratuities '),
(670, 130, 'Optional activities not listed'),
(672, 131, 'Visa fees and international flights'),
(673, 131, 'Visa fees and international flights   '),
(674, 131, 'Travel insurance and personal expenses '),
(675, 131, 'Tips and gratuities '),
(676, 131, 'Optional activities not listed'),
(681, 135, 'International/domestic flights'),
(682, 135, 'Personal donations (optional)    '),
(683, 135, 'Alcoholic drinks'),
(684, 135, 'Tips for guides and staff '),
(685, 135, 'Travel insurance'),
(690, 132, 'International or domestic flights'),
(691, 132, 'International or domestic flights     '),
(692, 132, 'Personal travel insurance '),
(693, 132, 'Tips for guides or hosts '),
(694, 132, 'Alcoholic beverages '),
(695, 132, 'Personal shopping expenses'),
(696, 133, 'Travel to and from Kigali'),
(697, 133, 'Personal shopping or art purchases    '),
(698, 133, 'Tips and gratuities '),
(699, 133, 'Additional drinks and snacks'),
(700, 133, 'Travel insurance'),
(705, 136, 'Flights to or from Kigali      '),
(706, 136, 'Travel insurance'),
(707, 136, 'Tips and souvenirs'),
(708, 136, 'Personal shopping'),
(709, 137, 'Travel insurance      '),
(710, 137, 'Tips and souvenirs'),
(711, 137, 'Alcoholic beverages'),
(712, 137, 'Personal shopping'),
(713, 138, 'Personal travel insurance    '),
(714, 138, 'Souvenirs and tips'),
(715, 138, 'Alcoholic drinks'),
(720, 134, 'Travel insurance'),
(721, 134, 'Personal shopping    '),
(722, 134, 'Alcoholic beverages'),
(723, 134, 'Tips and gratuities'),
(724, 139, 'International flights    '),
(725, 139, 'Tips and personal purchases'),
(726, 139, 'Alcoholic drinks beyond tastings'),
(730, 140, 'Travel insurance    '),
(731, 140, 'Flights'),
(732, 140, 'Personal shopping'),
(733, 141, 'Flights to or from Rwanda    '),
(734, 141, 'Travel insurance'),
(735, 141, 'Alcohol outside meals'),
(736, 142, 'Flights    '),
(737, 142, 'Alcoholic beverages'),
(738, 142, 'Tips and personal items'),
(739, 143, 'Travel insurance    '),
(740, 143, 'Tips and souvenirs'),
(741, 143, 'Alcoholic beverages'),
(742, 144, 'International flights    '),
(743, 144, 'Travel insurance'),
(744, 144, 'Alcoholic drinks'),
(745, 145, 'Travel insurance  '),
(746, 145, 'Flights  '),
(747, 145, 'Personal offerings or donations at sites'),
(748, 146, 'International flights    '),
(749, 146, 'Travel insurance'),
(750, 146, 'Church donations (optional)'),
(751, 147, 'Flights    '),
(752, 147, 'Travel insurance'),
(753, 147, 'Personal donations'),
(763, 151, 'DRC visa     '),
(764, 151, 'Personal insurance '),
(765, 151, 'Gratuities'),
(766, 152, 'Visa fees    '),
(767, 152, 'Tips and personal expenses'),
(768, 152, 'Insurance'),
(769, 153, 'Uganda visa fee   '),
(770, 153, 'Personal expenses and tips '),
(771, 153, 'Travel insurance'),
(772, 154, 'Uganda visa fee      '),
(773, 154, 'Optional souvenirs'),
(774, 154, 'Travel insurance and tips'),
(807, 149, 'Cultural village entrance fee '),
(808, 149, 'Accommodation  '),
(809, 149, 'Tips '),
(816, 148, 'Alcoholic drinks    '),
(817, 148, 'Personal shopping expenses'),
(818, 148, 'Optional tips for guides'),
(819, 155, 'International airfare    '),
(820, 155, 'Travel insurance'),
(821, 155, 'Gratuities for guides and staff'),
(822, 155, 'Optional personal expenses'),
(831, 156, 'International flights  '),
(832, 156, 'Travel insurance'),
(833, 156, 'Tips '),
(834, 156, 'Personal expenses, and optional activities not listed in the itinerary'),
(836, 157, 'International airfare'),
(837, 157, 'Travel insurance'),
(838, 157, 'Personal items'),
(839, 157, 'Alcoholic beverages'),
(840, 157, 'Optional activities not listed in the program.'),
(844, 158, 'Personal travel insurance'),
(845, 158, 'Tips'),
(847, 159, ' Personal travel insurance, gratuities, and any personal expenses'),
(848, 118, 'International flights'),
(849, 118, 'Rwanda & Uganda visas  '),
(850, 118, 'Travel insurance'),
(851, 118, 'Personal expenses & alcohol '),
(852, 118, 'Gratuities for guides and porters'),
(853, 160, 'Meals and drinks (optional add-on available)  '),
(854, 160, 'Tips for guide and driver'),
(855, 160, 'Travel insurance '),
(856, 160, 'Personal expenses'),
(857, 161, 'Tips for guide and driver  '),
(858, 161, 'Personal expenses and souvenirs '),
(859, 161, 'Travel insurance'),
(860, 161, 'Additional meals or drinks outside the included lunch'),
(861, 162, 'Meals (optional traditional lunch available upon request)   '),
(862, 162, 'Tips for guides or performers'),
(863, 162, 'Transport to and from the village (can be arranged on request)'),
(864, 162, 'Personal purchases (e.g., crafts or souvenirs)'),
(865, 163, 'Transportation to and from the site (available upon request)   '),
(866, 163, 'Additional drinks or snacks'),
(867, 163, 'Tips for guides or chefs'),
(868, 163, 'Personal purchases (e.g., crafts or local products)'),
(869, 164, 'Transport to and from Musanze (available upon request)   '),
(870, 164, 'Binoculars (bring your own or request rental in advance)'),
(871, 164, 'Tips for guide or local hosts'),
(872, 164, 'Personal expenses or souvenirs'),
(873, 165, 'Transport to and from the venue (can be arranged upon request)   '),
(874, 165, 'Optional lunch or market purchases'),
(875, 165, 'Tips for instructors or staff'),
(876, 165, 'Personal expenses'),
(877, 166, 'Transport to and from the site (can be arranged)   '),
(878, 166, 'Personal expenses and souvenirs'),
(879, 166, 'Tips for guides or farmers'),
(880, 166, 'Travel insurance');

-- --------------------------------------------------------

--
-- Table structure for table `tour_highlights`
--

CREATE TABLE `tour_highlights` (
  `highlight_id` int NOT NULL,
  `tour_id` int NOT NULL,
  `image_path` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `display_order` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tour_highlights`
--

INSERT INTO `tour_highlights` (`highlight_id`, `tour_id`, `image_path`, `display_order`) VALUES
(276, 117, 'images/tours/highlights/6845c8190ae91.webp', 1),
(277, 117, 'images/tours/highlights/6845c8190b08b.webp', 2),
(278, 117, 'images/tours/highlights/6845c8190b32f.webp', 3),
(279, 117, 'images/tours/highlights/6845c8190b4a0.jpg', 4),
(280, 118, 'images/tours/highlights/68471e1be01a5.webp', 1),
(281, 118, 'images/tours/highlights/68471e1be0556.jpg', 2),
(282, 118, 'images/tours/highlights/68471e1be070e.jpg', 3),
(283, 118, 'images/tours/highlights/68471e1be0be2.jpg', 4),
(284, 119, 'images/tours/highlights/68472a4688661.png', 1),
(285, 119, 'images/tours/highlights/68472a4688a6c.jpg', 2),
(286, 119, 'images/tours/highlights/68472a4688b11.jpg', 3),
(287, 119, 'images/tours/highlights/68472a4688b9c.jpg', 4),
(288, 120, 'images/tours/highlights/68473dd0043cd.jpg', 1),
(289, 120, 'images/tours/highlights/68473dd0057f9.jpg', 2),
(290, 120, 'images/tours/highlights/68473dd0060af.jpg', 3),
(291, 120, 'images/tours/highlights/68473dd006eef.jpg', 4),
(292, 121, 'images/tours/highlights/68474946d6c73.jpg', 1),
(293, 121, 'images/tours/highlights/68474946d6ee8.JPG', 2),
(294, 121, 'images/tours/highlights/68474946d7f51.webp', 3),
(295, 121, 'images/tours/highlights/68474946d8071.webp', 4),
(296, 122, 'images/tours/highlights/6847501d71843.jpg', 1),
(297, 122, 'images/tours/highlights/6847501d71cee.webp', 2),
(298, 122, 'images/tours/highlights/6847501d71dc5.jpg', 3),
(299, 122, 'images/tours/highlights/6847501d71f64.jpg', 4),
(300, 123, 'images/tours/highlights/68475a01d56f5.jpg', 1),
(301, 123, 'images/tours/highlights/68475a01d59c5.JPG', 2),
(302, 123, 'images/tours/highlights/68475a01d65d9.jpg', 3),
(303, 123, 'images/tours/highlights/68475a01d6e71.JPG', 4),
(304, 124, 'images/tours/highlights/68485bbb1fe33.jpg', 1),
(305, 124, 'images/tours/highlights/68485bbb21305.jpg', 2),
(306, 124, 'images/tours/highlights/68485bbb21fd3.jpg', 3),
(307, 124, 'images/tours/highlights/68485bbb22976.jpg', 4),
(308, 125, 'images/tours/highlights/68486cf3d42d2.webp', 1),
(309, 125, 'images/tours/highlights/68486cf3d456c.webp', 2),
(310, 125, 'images/tours/highlights/68486cf3d4663.webp', 3),
(311, 125, 'images/tours/highlights/68486cf3d48de.webp', 4),
(312, 126, 'images/tours/highlights/684877007d96a.webp', 1),
(313, 126, 'images/tours/highlights/684877007dabf.jpg', 2),
(314, 126, 'images/tours/highlights/684877007db83.webp', 3),
(315, 126, 'images/tours/highlights/684877007dcb6.jpg', 4),
(316, 127, 'images/tours/highlights/6848858d405bf.jfif', 1),
(317, 127, 'images/tours/highlights/6848858d407c4.jfif', 2),
(318, 127, 'images/tours/highlights/6848858d40889.jpg', 3),
(319, 127, 'images/tours/highlights/6848858d41604.jpg', 4),
(320, 128, 'images/tours/highlights/68488ed0bfbc2.jpg', 1),
(321, 128, 'images/tours/highlights/68488ed0bfe6f.jpg', 2),
(322, 128, 'images/tours/highlights/68488ed0bffb6.jpg', 3),
(323, 128, 'images/tours/highlights/68488ed0c0187.jfif', 4),
(324, 129, 'images/tours/highlights/6848931d2fbe9.webp', 1),
(325, 129, 'images/tours/highlights/6848931d2fe46.webp', 2),
(326, 129, 'images/tours/highlights/6848931d2ff9d.webp', 3),
(327, 129, 'images/tours/highlights/6848931d300a2.webp', 4),
(328, 130, 'images/tours/highlights/68489853596c0.webp', 1),
(329, 130, 'images/tours/highlights/68489853598f9.webp', 2),
(330, 130, 'images/tours/highlights/6848985359a2e.webp', 3),
(331, 130, 'images/tours/highlights/6848985359b49.webp', 4),
(332, 131, 'images/tours/highlights/68489e9007eb5.jfif', 1),
(333, 131, 'images/tours/highlights/68489e90080f8.webp', 2),
(334, 131, 'images/tours/highlights/68489e900820b.webp', 3),
(335, 131, 'images/tours/highlights/68489e9008341.webp', 4),
(336, 132, 'images/tours/highlights/684ae3b521137.jpeg', 1),
(337, 132, 'images/tours/highlights/684ae3b522110.jpg', 2),
(338, 132, 'images/tours/highlights/684ae3b522bb5.jpeg', 3),
(339, 132, 'images/tours/highlights/684ae3b523e15.jpeg', 4),
(340, 133, 'images/tours/highlights/684ae5a76434f.JPG', 1),
(341, 133, 'images/tours/highlights/684ae5a765abf.JPG', 2),
(342, 133, 'images/tours/highlights/684ae5a766bc7.jpeg', 3),
(343, 133, 'images/tours/highlights/684ae5a766ca5.jpeg', 4),
(344, 134, 'images/tours/highlights/684ae76a358bc.jpeg', 1),
(345, 134, 'images/tours/highlights/684ae76a35a40.jpeg', 2),
(346, 134, 'images/tours/highlights/684ae76a35c0f.jpeg', 3),
(347, 134, 'images/tours/highlights/684ae76a35ca3.jpeg', 4),
(348, 135, 'images/tours/highlights/684ae96f4ec92.jpg', 1),
(349, 135, 'images/tours/highlights/684ae96f5023e.JPG', 2),
(350, 135, 'images/tours/highlights/684ae96f51a57.JPG', 3),
(351, 135, 'images/tours/highlights/684ae96f51bd7.JPG', 4),
(352, 136, 'images/tours/highlights/684b19feb171c.jpeg', 1),
(353, 136, 'images/tours/highlights/684b19feb1937.jpg', 2),
(354, 136, 'images/tours/highlights/684b19feb215f.jpg', 3),
(355, 136, 'images/tours/highlights/684b19feb223e.JPEG', 4),
(356, 137, 'images/tours/highlights/684b1dc7ad040.jpeg', 1),
(357, 137, 'images/tours/highlights/684b1dc7ad29d.jpeg', 2),
(358, 137, 'images/tours/highlights/684b1dc7ad382.jpg', 3),
(359, 137, 'images/tours/highlights/684b1dc7adeb4.jpeg', 4),
(360, 138, 'images/tours/highlights/684b223fb8c7e.JPG', 1),
(361, 138, 'images/tours/highlights/684b223fb9a3c.jpg', 2),
(362, 138, 'images/tours/highlights/684b223fbac56.jpeg', 3),
(363, 138, 'images/tours/highlights/684b223fbad5c.jpg', 4),
(364, 139, 'images/tours/highlights/684be2ce6b8b6.jpg', 1),
(365, 139, 'images/tours/highlights/684be2ce6bd3a.jpg', 2),
(366, 139, 'images/tours/highlights/684be2ce6be2f.jpg', 3),
(367, 139, 'images/tours/highlights/684be2ce6bf6d.JPEG', 4),
(368, 140, 'images/tours/highlights/684bf10b5b8f1.jpg', 1),
(369, 140, 'images/tours/highlights/684bf10b5c870.JPG', 2),
(370, 140, 'images/tours/highlights/684bf10b5e5bf.jpg', 3),
(371, 140, 'images/tours/highlights/684bf10b5f2ff.jpg', 4),
(372, 141, 'images/tours/highlights/684bf5b7a20af.jpeg', 1),
(373, 141, 'images/tours/highlights/684bf5b7a22a2.jpeg', 2),
(374, 141, 'images/tours/highlights/684bf5b7a236b.jpg', 3),
(375, 141, 'images/tours/highlights/684bf5b7a2aee.JPG', 4),
(376, 142, 'images/tours/highlights/684bfb6dc1632.jpg', 1),
(377, 142, 'images/tours/highlights/684bfb6dc2b23.jpg', 2),
(378, 142, 'images/tours/highlights/684bfb6dc3be8.jpg', 3),
(379, 142, 'images/tours/highlights/684bfb6dc40bd.jpg', 4),
(380, 143, 'images/tours/highlights/684bff889d75d.jpg', 1),
(381, 143, 'images/tours/highlights/684bff889d85b.jpg', 2),
(382, 143, 'images/tours/highlights/684bff889d93b.jpeg', 3),
(383, 143, 'images/tours/highlights/684bff889da68.jpg', 4),
(384, 144, 'images/tours/highlights/684c044e22c61.jpg', 1),
(385, 144, 'images/tours/highlights/684c044e22f5b.jpg', 2),
(386, 144, 'images/tours/highlights/684c044e23631.jpg', 3),
(387, 144, 'images/tours/highlights/684c044e23998.jpg', 4),
(388, 145, 'images/tours/highlights/684c08c101a65.jpg', 1),
(389, 145, 'images/tours/highlights/684c08c10305e.JPG', 2),
(390, 145, 'images/tours/highlights/684c08c103698.JPEG', 3),
(391, 145, 'images/tours/highlights/684c08c103e43.JPG', 4),
(392, 146, 'images/tours/highlights/684c0c3e025d6.JPG', 1),
(393, 146, 'images/tours/highlights/684c0c3e02e3c.JPG', 2),
(394, 146, 'images/tours/highlights/684c0c3e0365f.jpg', 3),
(395, 146, 'images/tours/highlights/684c0c3e04023.jpg', 4),
(396, 147, 'images/tours/highlights/684c10734bcd6.JPG', 1),
(397, 147, 'images/tours/highlights/684c10734bea2.JPG', 2),
(398, 147, 'images/tours/highlights/684c10734bf47.jpg', 3),
(399, 147, 'images/tours/highlights/684c10734cfaf.jpg', 4),
(400, 148, 'images/tours/highlights/684c1bd27e0f5.jpg', 1),
(401, 148, 'images/tours/highlights/684c1bd27f0f6.jpg', 2),
(402, 148, 'images/tours/highlights/684c1bd27ff25.jpg', 3),
(403, 148, 'images/tours/highlights/684c1bd280d3f.JPG', 4),
(404, 149, 'images/tours/highlights/684c211e34262.jpg', 1),
(405, 149, 'images/tours/highlights/684c211e34478.JPG', 2),
(406, 149, 'images/tours/highlights/684c211e34fad.JPG', 3),
(407, 149, 'images/tours/highlights/684c211e35c8e.JPG', 4),
(412, 151, 'images/tours/highlights/684c2ba25938b.webp', 1),
(413, 151, 'images/tours/highlights/684c2ba259572.webp', 2),
(414, 151, 'images/tours/highlights/684c2ba259628.webp', 3),
(415, 151, 'images/tours/highlights/684c2ba2596c4.webp', 4),
(416, 152, 'images/tours/highlights/684c2f0e77d21.jpeg', 1),
(417, 152, 'images/tours/highlights/684c2f0e77ec0.jpeg', 2),
(418, 152, 'images/tours/highlights/684c2f0e77fcd.jpeg', 3),
(419, 152, 'images/tours/highlights/684c2f0e78046.jpeg', 4),
(420, 153, 'images/tours/highlights/684c3508a489c.jpeg', 1),
(421, 153, 'images/tours/highlights/684c3508a4968.jpeg', 2),
(422, 153, 'images/tours/highlights/684c3508a4a06.jpeg', 3),
(423, 153, 'images/tours/highlights/684c3508a4aa1.jpeg', 4),
(424, 154, 'images/tours/highlights/684c38a7965a2.jpeg', 1),
(425, 154, 'images/tours/highlights/684c38a79666f.jpeg', 2),
(426, 154, 'images/tours/highlights/684c38a79670c.jpeg', 3),
(427, 154, 'images/tours/highlights/684c38a7967a0.jpeg', 4),
(428, 155, 'images/tours/highlights/685ae17ecc1c3.jpg', 1),
(429, 155, 'images/tours/highlights/685ae17eccc65.jpg', 2),
(430, 155, 'images/tours/highlights/685ae17ecda5d.jpg', 3),
(431, 155, 'images/tours/highlights/685ae17ecdc4a.jpg', 4),
(432, 156, 'images/tours/highlights/685af5e8850a7.jpeg', 1),
(433, 156, 'images/tours/highlights/685af5e8852f2.JPG', 2),
(434, 156, 'images/tours/highlights/685af5e885613.jpg', 3),
(435, 157, 'images/tours/highlights/685b04466dc88.JPG', 1),
(436, 157, 'images/tours/highlights/685b04466e66e.jpg', 2),
(437, 157, 'images/tours/highlights/685b04466f4db.jpg', 3),
(438, 157, 'images/tours/highlights/685b0446700c2.jpg', 4),
(439, 158, 'images/tours/highlights/685c512ba4a89.jpg', 1),
(440, 158, 'images/tours/highlights/685c512ba56b6.jpg', 2),
(441, 158, 'images/tours/highlights/685c512ba5c70.jpg', 3),
(442, 158, 'images/tours/highlights/685c512ba6113.jpg', 4),
(443, 159, 'images/tours/highlights/685c5c1682dea.jpg', 1),
(444, 160, 'images/tours/highlights/6867b1d9961b6.jpg', 1),
(445, 160, 'images/tours/highlights/6867b1d996a5d.jpg', 2),
(446, 160, 'images/tours/highlights/6867b1d9970b9.jpg', 3),
(447, 160, 'images/tours/highlights/6867b1d99777e.jpeg', 4),
(448, 161, 'images/tours/highlights/6867e31d7e90b.jpg', 1),
(449, 161, 'images/tours/highlights/6867e31d7f39e.jpg', 2),
(450, 161, 'images/tours/highlights/6867e31d8048a.jpg', 3),
(451, 161, 'images/tours/highlights/6867e31d80637.jpg', 4),
(452, 162, 'images/tours/highlights/6867eb29097f0.JPG', 1),
(453, 162, 'images/tours/highlights/6867eb290b875.jpg', 2),
(454, 162, 'images/tours/highlights/6867eb290c298.JPG', 3),
(455, 162, 'images/tours/highlights/6867eb290d38d.JPG', 4),
(456, 163, 'images/tours/highlights/6867f203b6402.jpg', 1),
(457, 163, 'images/tours/highlights/6867f203b6d4e.png', 2),
(458, 163, 'images/tours/highlights/6867f203b79b7.jpg', 3),
(459, 163, 'images/tours/highlights/6867f203b7fc6.jpg', 4),
(460, 164, 'images/tours/highlights/6867f70dcf91a.jpg', 1),
(461, 164, 'images/tours/highlights/6867f70dd0042.jpg', 2),
(462, 164, 'images/tours/highlights/6867f70dd0315.jpg', 3),
(463, 164, 'images/tours/highlights/6867f70dd0443.jpg', 4),
(464, 165, 'images/tours/highlights/6867fbcb6f3ff.jpg', 1),
(465, 165, 'images/tours/highlights/6867fbcb6f809.jpg', 2),
(466, 165, 'images/tours/highlights/6867fbcb6fc00.jpg', 3),
(467, 165, 'images/tours/highlights/6867fbcb6fcd9.jpg', 4),
(468, 166, 'images/tours/highlights/68680093568cf.jpg', 1),
(469, 166, 'images/tours/highlights/68680093579cb.JPG', 2),
(470, 166, 'images/tours/highlights/686800935879b.jpg', 3),
(471, 166, 'images/tours/highlights/68680093599f9.jpg', 4);

-- --------------------------------------------------------

--
-- Table structure for table `tour_included`
--

CREATE TABLE `tour_included` (
  `included_id` int NOT NULL,
  `tour_id` int NOT NULL,
  `item_description` varchar(255) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tour_included`
--

INSERT INTO `tour_included` (`included_id`, `tour_id`, `item_description`) VALUES
(861, 120, 'park entry fees and permits'),
(862, 120, 'Accommodation for 6 nights in selected lodges and eco-camps as above '),
(863, 120, 'Meals as listed in the itinerary '),
(864, 120, 'Private 4x4 safari vehicle with experienced English-speaking guide/driver '),
(865, 120, '    All internal transfers and transport throughout the safari'),
(866, 120, 'Gorilla trekking, chimpanzee trekking, game drives, and boat cruises as described'),
(867, 120, 'Bottled water during game drives and transfers'),
(868, 120, 'Cultural visits and community walk activities  '),
(869, 120, 'Airport transfers in Uganda'),
(870, 123, 'Gorilla trekking permit and park fees       '),
(871, 123, 'Experienced English-speaking ranger guide'),
(872, 123, 'Transfers to and from the trekking starting point '),
(873, 123, 'Lunch at your lodge or picnic '),
(874, 123, 'Cultural community visit '),
(875, 123, 'Bottled water during trekking'),
(876, 122, 'Gorilla trekking permit '),
(877, 122, 'Private, air-conditioned transfer between Kigali and Volcanoes National Park'),
(878, 122, 'Expert English-speaking guide and authorized park ranger escort'),
(879, 122, 'Lunch at lodge or picnic site'),
(880, 122, 'Park entrance fees'),
(881, 122, 'Bottled water during the trek'),
(882, 121, 'Private transport with professional English-speaking guide        '),
(883, 121, 'Chimpanzee trekking permit'),
(884, 121, 'Entry fees to Kibale Forest National Park and Bigodi Wetland Sanctuary '),
(885, 121, 'Lunch during the tour'),
(886, 121, 'Bottled water '),
(887, 121, 'Community visit with cultural activities'),
(888, 119, 'Gorilla Trekking Permit (Virunga NP – $400)'),
(889, 119, 'Nyiragongo Hiking Permit and summit accommodation '),
(890, 119, '4 nights’ accommodation (mid-range or luxury)'),
(891, 119, 'All meals as indicated '),
(892, 119, 'Porters and ranger escorts'),
(893, 119, 'Border assistance and Congo visa support'),
(911, 117, 'Gorilla Trekking Permit (Rwanda – $1500) '),
(912, 117, 'All accommodations (2 nights) '),
(913, 117, 'Private 4x4 vehicle & professional English-speaking guide '),
(914, 117, 'Park fees & ranger escorts '),
(915, 117, 'All meals listed '),
(916, 117, 'Bottled water during travel '),
(917, 117, 'Cultural visit (Iby’Iwacu Village) '),
(918, 117, 'Airport pickup & drop-off'),
(920, 124, 'All accommodation (3 nights)'),
(921, 124, 'All meals as listed       '),
(922, 124, 'Private driver/guide and vehicle'),
(923, 124, 'Community entry fees and guided experiences'),
(924, 124, 'Donations to local cooperatives'),
(925, 124, 'Bottled water during drives'),
(926, 124, 'Airport transfers'),
(937, 126, '3 nights’ accommodation in or near Nyungwe'),
(938, 126, 'All meals as listed (full board)           '),
(939, 126, 'Private driver-guide and 4x4 vehicle throughout'),
(940, 126, 'Chimpanzee trekking permit '),
(941, 126, 'Canopy walkway entrance'),
(942, 126, 'Entry to museums and cultural sites'),
(943, 126, 'National park entry and guided forest hikes '),
(944, 126, 'Bottled water during drives '),
(945, 126, 'Airport pick-up and drop-off'),
(946, 127, '3 nights’ accommodation at eco-friendly lakefront lodges'),
(947, 125, 'All accommodations (2 nights)'),
(948, 125, 'All meals as listed       '),
(949, 125, 'Private 4x4 safari vehicle with English-speaking guide'),
(950, 125, 'Akagera Park entry fees, boat safari, and game drive '),
(951, 125, 'Kigali city tour '),
(952, 125, 'Nyandungu Eco Park visit '),
(953, 125, 'Bottled water during drives '),
(954, 125, ' All airport transfers'),
(955, 128, '3 nights’ accommodation at quality lodges near Mgahinga National Park'),
(956, 129, '2 nights accommodation in quality lodges at Queen Elizabeth National Park'),
(958, 130, 'Gorilla trekking permits and park entrance fees'),
(959, 130, '2 nights accommodation with full board meals    '),
(960, 130, 'Private transportation with experienced driver-guide'),
(961, 130, 'All border crossing assistance and permits'),
(963, 131, 'Gorilla trekking permits and park fees'),
(964, 131, '3 nights accommodation with meals      '),
(965, 131, 'Private transport with professional guides'),
(966, 131, 'Border crossing assistance and permits'),
(967, 131, 'Cultural visits and game drives'),
(972, 135, 'Round-trip private transport from Kigali'),
(973, 135, '3 nights eco-lodge accommodation'),
(974, 135, 'All meals (3 breakfasts, 4 lunches, 3 dinners)'),
(975, 135, 'Conservation and community project materials'),
(976, 135, 'Local English-speaking guide'),
(977, 135, 'Daily cultural exchange sessions'),
(978, 135, 'Bottled water'),
(986, 132, 'Round-trip private transport from Kigali'),
(987, 132, 'Round-trip private transport from Kigali           '),
(988, 132, '3 nights accommodation with a local family (homestay or eco-lodge) '),
(989, 132, 'All meals (3 breakfasts, 4 lunches, 3 dinners)'),
(990, 132, 'All cultural activities and site entry fees'),
(991, 132, 'Guided village tours and artisan workshops'),
(992, 132, 'Professional cultural guide and translator'),
(993, 132, 'Bottled water'),
(994, 133, 'Private transportation within Kigali'),
(995, 133, '1-night hotel accommodation (mid-range boutique hotel)       '),
(996, 133, '2 lunches, 1 dinner, 1 breakfast'),
(997, 133, 'Entrance fees to all sites and workshops'),
(998, 133, 'Guided market visit and walking tour'),
(999, 133, 'Artisan-led craft workshop '),
(1000, 133, 'Professional cultural guide'),
(1008, 136, 'Private transport           '),
(1009, 136, '2 nights in a family-friendly hotel or lodge'),
(1010, 136, 'All meals (2 breakfasts, 3 lunches, 2 dinners)'),
(1011, 136, 'Guided park walk and ranger activity'),
(1012, 136, 'Art and craft session for kids'),
(1013, 136, 'Professional guide experienced with families'),
(1014, 136, 'Bottled water and healthy snacks'),
(1015, 137, 'Private family transport         '),
(1016, 137, '2 nights at a farm stay or countryside lodge '),
(1017, 137, 'All meals (2 breakfasts, 3 lunches, 2 dinners)'),
(1018, 137, 'Farm activities and animal interactions'),
(1019, 137, 'Child-friendly guide and activity supervisor'),
(1020, 137, 'Drinking water and healthy snacks'),
(1021, 138, 'Round-trip family transport           '),
(1022, 138, '2 nights family lodge or eco-cabin'),
(1023, 138, 'Guided trail walks and birding'),
(1024, 138, 'All meals (2 breakfasts, 3 lunches, 2 dinners)'),
(1025, 138, 'Scavenger hunt and nature crafts '),
(1026, 138, 'Local nature guide experienced with children'),
(1027, 138, 'Binoculars and trail tools for kids'),
(1035, 134, 'Private round-trip transport from Kigali'),
(1036, 134, '2 nights community homestay accommodation'),
(1037, 134, 'All meals (2 breakfasts, 3 lunches, 2 dinners)'),
(1038, 134, 'Guided village walk and cultural exchange'),
(1039, 134, 'Farming and cooking activities  '),
(1040, 134, ' English-speaking local facilitator '),
(1041, 134, 'Bottled water'),
(1042, 139, '2 nights in boutique Kigali accommodation          '),
(1043, 139, 'All meals and tastings'),
(1044, 139, 'Cooking class and pairing sessions'),
(1045, 139, 'English-speaking culinary guide'),
(1046, 139, 'Private transportation'),
(1047, 139, 'Entry fees and community contributions'),
(1054, 140, 'Private transport and guide         '),
(1055, 140, '2 nights lodging near Lake Kivu'),
(1056, 140, 'Coffee and tea tours with tastings'),
(1057, 140, 'All meals (2 breakfasts, 3 lunches, 2 dinners)'),
(1058, 140, 'Gift box of coffee and tea'),
(1059, 140, 'Bottled water'),
(1060, 141, '2 nights accommodation in Musanze          '),
(1061, 141, 'Private transportation'),
(1062, 141, 'All meals and cooking sessions'),
(1063, 141, 'Village market tour'),
(1064, 141, 'Recipe printouts and local food gifts'),
(1065, 141, 'English-speaking culinary host'),
(1066, 142, 'Transport in 4x4 with binoculars         '),
(1067, 142, '2 nights accommodation (Nyungwe and Akagera) '),
(1068, 142, 'All park fees and birdwatching permits'),
(1069, 142, 'Birding expert guide'),
(1070, 142, 'Meals (2 breakfasts, 3 lunches, 2 dinners)'),
(1071, 142, 'Drinking water and bird checklist'),
(1072, 143, 'Private round-trip transport          '),
(1073, 143, '2 nights community eco-lodge accommodation'),
(1074, 143, 'Park permits and guided walks'),
(1075, 143, 'All meals (2 breakfasts, 3 lunches, 2 dinners)'),
(1076, 143, 'Bottled water and picnic supplies'),
(1077, 143, 'Reforestation contribution'),
(1078, 144, 'Private transport '),
(1079, 144, '2 nights in eco-lodge or nature guesthouse          '),
(1080, 144, 'All park and entry fees'),
(1081, 144, 'Guided forest bathing sessions'),
(1082, 144, 'All meals and drinks (herbal teas, fresh juices)'),
(1083, 144, 'Light yoga mats (optional)'),
(1084, 144, 'Wellness-focused nature guide'),
(1085, 145, 'Private transportation         '),
(1086, 145, '2 nights lakefront accommodation'),
(1087, 145, 'All meals and herbal teas'),
(1088, 145, 'Guided reflection and prayer sessions '),
(1089, 145, 'Entry to sacred sites'),
(1090, 145, 'English-speaking spiritual facilitator'),
(1091, 146, 'Round-trip transport       '),
(1092, 146, 'Accommodation in faith-based guesthouses'),
(1093, 146, 'All meals and prayer services'),
(1094, 146, 'English-speaking religious guide '),
(1095, 146, 'Entry to churches and shrine'),
(1096, 147, 'Private transport        '),
(1097, 147, '2 nights eco-lodge accommodation'),
(1098, 147, 'All meals (vegetarian available)'),
(1099, 147, 'Forest meditation and devotional sessions'),
(1100, 147, 'Spiritual facilitator and forest guide'),
(1101, 147, 'All park entry fees'),
(1116, 151, 'Round-trip boat transfer from Goma    '),
(1117, 151, 'Island access and guided nature walk or kayaking'),
(1118, 151, 'Welcome drink and island lunch '),
(1119, 151, 'Eco-lodge facilities'),
(1120, 152, 'Guided farm and village visit        '),
(1121, 152, 'Coffee tasting session'),
(1122, 152, 'Traditional Congolese lunch'),
(1123, 152, 'Cultural performance'),
(1124, 152, 'Private return transfer from Goma'),
(1125, 153, 'Private round-trip transportation from Musanze       '),
(1126, 153, 'Bigodi Wetland walk with certified community guide '),
(1127, 153, 'Traditional lunch in Bigodi village'),
(1128, 153, 'Cultural demonstration (weaving or banana beer)'),
(1129, 153, 'Bottled water and border assistance'),
(1130, 154, 'Private round-trip transport from Musanze      '),
(1131, 154, 'Guided visit to the Source of the Nile'),
(1132, 154, 'Boat ride and entry fees'),
(1133, 154, 'Bottled water and border assistance'),
(1188, 149, 'Golden monkey trekking permit         '),
(1189, 149, 'Professional trekking guide'),
(1190, 149, 'Private round-trip transport'),
(1191, 149, 'Breakfast and lunch'),
(1192, 149, 'Bottled water'),
(1205, 148, 'Hotel pickup and drop-off          '),
(1206, 148, 'Private vehicle with professional driver'),
(1207, 148, 'English-speaking cultural guide'),
(1208, 148, 'Entry fees to all memorials and galleries'),
(1209, 148, 'Traditional Rwandan lunch'),
(1210, 148, 'Bottled water throughout the day'),
(1211, 155, '2 nights’ accommodation in women-run eco-lodges'),
(1212, 155, 'All meals (vegetarian-friendly, locally sourced)'),
(1213, 155, 'Guided hikes, workshops, and cultural visits'),
(1214, 155, 'Expert female guides and facilitators'),
(1215, 155, 'Transportation as per the itinerary'),
(1216, 155, 'Airport transfers (on request)'),
(1231, 156, 'Professional geo-tour guide      '),
(1232, 156, 'Transportation in a 4x4 vehicle'),
(1233, 156, '4 nights’ eco-lodge accommodation'),
(1234, 156, 'All meals'),
(1235, 156, 'Park entry and hiking permits'),
(1236, 156, 'Cultural experiences'),
(1237, 156, 'Lava tube exploration with safety gear, boat rides, and all listed activities'),
(1239, 157, 'All in-country transportation including airport transfers'),
(1240, 157, 'Accommodation in eco-lodges and guesthouses'),
(1241, 157, 'All meals'),
(1242, 157, 'Park entry and permits'),
(1243, 157, 'Academic facilitators and expert guides '),
(1244, 157, 'Access to conservation institutions'),
(1245, 157, 'All fieldwork tools (sampling kits, data sheets, notebooks), and evening workshops'),
(1249, 158, 'Mountain bike and helmet'),
(1250, 158, 'Professional local cycling guide      '),
(1251, 158, 'Accommodation for 3 nights'),
(1252, 158, 'All meals'),
(1253, 158, 'Bottled water and snacks during rides '),
(1254, 158, 'Entry fees for cultural visits and activities'),
(1255, 158, 'Support vehicle for luggage and rider assistance'),
(1256, 158, 'Pickup and drop-off in Musanze or Rubavu'),
(1257, 158, 'Transport to and from Musanze or Rubavu '),
(1265, 159, 'Private 4x4 safari vehicle for comfort and accessibility    '),
(1266, 159, 'Experienced professional driver-guide skilled in wildlife tracking '),
(1267, 159, 'Full-day guided game drives within Akagera National Park'),
(1268, 159, 'Park entrance fees and permits'),
(1269, 159, 'Picnic lunch served in a scenic natural setting'),
(1270, 159, 'Bottled water throughout the day'),
(1271, 159, 'Boat safari on Lake Ihema'),
(1272, 118, '2 Gorilla Trekking Permits (Rwanda & Uganda)'),
(1273, 118, '1 Golden Monkey Trekking Permit       '),
(1274, 118, 'All accommodations (6 nights)'),
(1275, 118, 'Private 4x4 safari vehicle with English-speaking guide'),
(1276, 118, 'Park entry fees & ranger escorts'),
(1277, 118, 'All meals as listed'),
(1278, 118, 'Bottled water during transfers'),
(1279, 118, 'All cross-border logistics'),
(1280, 118, 'Cultural & community activities'),
(1281, 160, 'Private round-trip transportation (from Huye, Gisakura, or nearby areas)'),
(1282, 160, 'Professional English-speaking nature guide   '),
(1283, 160, 'Nyungwe National Park entrance fees'),
(1284, 160, 'Canopy walk permit'),
(1285, 160, 'Bottled water'),
(1286, 161, 'Private round-trip transportation from Rubavu, Karongi, or nearby     '),
(1287, 161, 'Professional English-speaking guide'),
(1288, 161, 'Boat cruise on Lake Kivu'),
(1289, 161, 'Coffee plantation tour and tasting'),
(1290, 161, 'Lakeside lunch'),
(1291, 161, 'Bottled water'),
(1292, 162, 'Entry to gorilla guardians village    '),
(1293, 162, 'Guided cultural activities and performances '),
(1294, 162, 'Banana beer brewing session and tasting'),
(1295, 162, 'Local home visits and storytelling'),
(1296, 162, 'English-speaking cultural guide'),
(1297, 162, 'Bottled water'),
(1298, 163, 'Guided farm visit and ingredient harvesting       '),
(1299, 163, 'Traditional Rwandan cooking class'),
(1300, 163, 'Banana beer tasting'),
(1301, 163, 'Cultural storytelling session'),
(1302, 163, 'Shared home-cooked lunch'),
(1303, 163, 'Professional local chef and guide'),
(1304, 163, 'Bottled water'),
(1305, 164, 'Expert birding guide (English-speaking)     '),
(1306, 164, 'Birding permit or entry fees (if applicable)'),
(1307, 164, 'Use of bird checklist and guidebook'),
(1308, 164, 'Traditional Rwandan lunch'),
(1309, 164, 'Bottled water'),
(1310, 164, 'Community storytelling session'),
(1311, 165, 'Full-day Intore dance and drumming workshop     '),
(1312, 165, 'Professional instructors and cultural hosts'),
(1313, 165, 'Use of traditional attire and instruments'),
(1314, 165, 'Certificate of participation'),
(1315, 165, 'Bottled water'),
(1316, 165, 'Photos of your performance (digital copy)'),
(1317, 166, 'Guided tour of tea plantation and factory     '),
(1318, 166, 'Hands-on tea leaf plucking experience'),
(1319, 166, 'Visit to eco-farm with sustainability workshop'),
(1320, 166, 'Traditional Rwandan lunch with fresh tea'),
(1321, 166, 'English-speaking guide'),
(1322, 166, 'Bottled water');

-- --------------------------------------------------------

--
-- Table structure for table `tour_to_bring`
--

CREATE TABLE `tour_to_bring` (
  `to_bring_id` int NOT NULL,
  `tour_id` int NOT NULL,
  `item_description` varchar(255) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tour_to_bring`
--

INSERT INTO `tour_to_bring` (`to_bring_id`, `tour_id`, `item_description`) VALUES
(918, 120, 'Durable trekking shoes and comfortable clothing '),
(919, 120, 'Waterproof jacket and warm layers for cooler mornings   '),
(920, 120, ' Insect repellent and high-SPF sunscreen '),
(921, 120, 'Binoculars and camera with extra batteries '),
(922, 120, 'Personal medications and refillable water bottle'),
(923, 120, '  Passport and proof of yellow fever vaccination'),
(924, 123, 'Comfortable hiking boots         '),
(925, 123, 'Long-sleeved clothing and pants '),
(926, 123, 'Waterproof jacket or poncho'),
(927, 123, 'Camera with extra batteries '),
(928, 123, 'Water bottle'),
(929, 123, 'Lightweight backpack'),
(930, 122, 'Comfortable, sturdy hiking boots or shoes with good grip'),
(931, 122, 'Lightweight, layered clothing suitable for forest trekking'),
(932, 122, 'Waterproof jacket or poncho'),
(933, 122, 'mall backpack for personal items'),
(934, 121, 'Comfortable trekking shoes          '),
(935, 121, 'Lightweight, long-sleeve clothing (neutral colors)'),
(936, 121, ' Rain jacket or poncho'),
(937, 121, 'Hat and sunglasses '),
(938, 121, 'Insect repellent '),
(939, 121, 'Camera/binoculars'),
(940, 121, ' Water bottle'),
(941, 121, 'Small backpack'),
(942, 119, 'Passport with Rwanda & DRC visas   '),
(943, 119, 'Yellow Fever vaccination card'),
(944, 119, 'Sturdy waterproof hiking boots'),
(945, 119, 'Warm sleeping bag (can be rented) '),
(946, 119, 'Thermal clothing/layers'),
(947, 119, 'Rain jacket'),
(948, 119, 'Headlamp'),
(949, 119, ' Personal medications'),
(964, 117, 'Gorilla permit and passport'),
(965, 117, 'Rain jacket'),
(966, 117, 'Long sleeves and trousers '),
(967, 117, 'Gardening gloves'),
(968, 117, 'Hiking boots'),
(970, 124, 'Comfortable walking shoes'),
(971, 124, 'Rain jacket or poncho'),
(972, 124, 'Reusable water bottle '),
(973, 124, 'Daypack '),
(974, 124, 'Sun hat & sunscreen'),
(984, 126, 'Good hiking boots (terrain can be muddy and steep)'),
(985, 126, 'Lightweight rain jacket and warm layers (forest can be cool and wet)      '),
(986, 126, 'Binoculars and camera for wildlife viewing'),
(987, 126, 'Daypack, sunscreen, hat, and insect repellent'),
(988, 126, 'Reusable water bottle'),
(989, 127, 'Comfortable walking shoes for village walks and light hikes'),
(990, 125, 'Light, neutral-colored clothing for safari'),
(991, 125, 'Comfortable walking shoes'),
(992, 125, 'Sun hat, sunglasses, and sunscreen'),
(993, 125, 'Insect repellent'),
(994, 125, 'Camera '),
(995, 125, 'Binoculars'),
(996, 125, 'Reusable water bottle'),
(997, 128, 'Comfortable sturdy hiking shoes'),
(998, 129, 'Lightweight, breathable clothing in neutral colors'),
(1000, 130, 'Sturdy hiking boots or trail shoes'),
(1001, 130, 'ightweight, quick-dry clothing (long sleeves and pants recommended)'),
(1002, 130, 'Rain jacket or poncho'),
(1003, 130, 'Hat and sunglasses'),
(1004, 130, 'Insect repellent '),
(1005, 130, 'Refillable water bottle'),
(1006, 130, 'Backpack for day treks'),
(1008, 131, 'Comfortable hiking boots'),
(1009, 131, 'Moisture-wicking clothing (long sleeves and pants)'),
(1010, 131, 'Waterproof jacket or poncho'),
(1011, 131, 'Hat and sunglasses'),
(1012, 131, 'Insect repellent '),
(1013, 131, 'Binoculars and camera gear with backups       '),
(1014, 131, 'Personal medications and basic first aid kit '),
(1015, 131, 'Daypack for essentials'),
(1016, 131, 'Refillable water bottle '),
(1017, 131, 'Passport with visa and travel documents'),
(1018, 131, 'Cash for tipping and personal expenses'),
(1023, 135, 'Sturdy shoes and work clothes'),
(1024, 135, 'Gardening gloves (optional)     '),
(1025, 135, 'Notepad and reusable bottle'),
(1026, 135, 'Sunscreen and insect repellent'),
(1027, 135, ' Curiosity and commitment to sustainability'),
(1032, 132, 'Modest and comfortable clothing'),
(1033, 132, 'Modest and comfortable clothing        '),
(1034, 132, 'Notebook or journal'),
(1035, 132, 'Camera or smartphone'),
(1036, 132, 'Sunscreen and insect repellent'),
(1037, 132, 'Small gifts for host families (optional but appreciated)'),
(1038, 133, 'Comfortable walking shoes'),
(1039, 133, 'Comfortable walking shoes'),
(1040, 133, 'Water bottle '),
(1041, 133, 'Cash for market purchases'),
(1047, 136, 'Comfortable walking shoes       '),
(1048, 136, 'Sunhats and sunscreen'),
(1049, 136, 'Child daypack or travel toys'),
(1050, 136, 'Refillable water bottles'),
(1051, 136, 'Jacket for cool mornings or evenings'),
(1052, 137, 'Sturdy farm shoes       '),
(1053, 137, 'Light raincoat or jacket'),
(1054, 137, 'Sunscreen and hat'),
(1055, 137, 'Favorite snacks or toys'),
(1056, 138, 'Hiking shoes or closed sandals       '),
(1057, 138, 'Long-sleeved shirts for sun and bugs'),
(1058, 138, 'Binoculars (provided, but bring your own if preferred)'),
(1059, 138, 'Reusable water bottles'),
(1060, 138, 'Raincoat'),
(1065, 134, 'Comfortable clothes for farm work'),
(1066, 134, 'Refillable water bottle      '),
(1067, 134, 'Sunscreen and hat'),
(1068, 134, 'Notebook for journaling'),
(1069, 139, 'Comfortable walking shoes      '),
(1070, 139, 'Reusable water bottle'),
(1071, 139, 'Notebook for recipes and notes'),
(1072, 139, 'Light clothing'),
(1076, 140, 'Comfortable shoes     '),
(1077, 140, 'Sun protection'),
(1078, 140, 'Light sweater for mornings  '),
(1079, 141, 'Apron (optional)'),
(1080, 141, 'Closed-toe shoes for the kitchen'),
(1081, 141, 'Comfortable clothes'),
(1082, 142, 'Binoculars (available on request)        '),
(1083, 142, 'Field guidebook (optional)'),
(1084, 142, 'Comfortable hiking shoes'),
(1085, 142, 'Light raincoat and layers'),
(1086, 143, 'Comfortable hiking clothes and shoes     '),
(1087, 143, 'Reusable water bottle'),
(1088, 143, 'Light jacket for mornings '),
(1089, 143, 'Sunscreen and insect repellent'),
(1090, 144, 'Comfortable walking shoes              '),
(1091, 144, 'Water bottle and small towel'),
(1092, 144, 'Light clothing for movement'),
(1093, 144, 'Journal or sketchbook '),
(1094, 145, 'Bible or spiritual reading     '),
(1095, 145, 'Journal and pen'),
(1096, 145, 'Modest, comfortable clothing'),
(1097, 146, 'Rosary or prayer book      '),
(1098, 146, 'Modest clothing for church visits'),
(1099, 146, ' Journal'),
(1100, 146, 'Sunscreen and hat '),
(1101, 146, 'Comfortable shoes'),
(1102, 147, 'Spiritual text or book        '),
(1103, 147, 'Light shoes for walking'),
(1104, 147, 'Modest and light clothing'),
(1105, 147, 'Blanket or mat for forest sits'),
(1117, 151, 'Comfortable light clothing, swimwear   '),
(1118, 151, 'Towel, sunscreen, hat, sunglasses '),
(1119, 151, 'Passport and yellow fever card'),
(1120, 152, 'Modest clothing, walking shoes    '),
(1121, 152, 'Water bottle, sun hat, camera'),
(1122, 152, 'Notebook (optional), passport, yellow fever card'),
(1123, 153, 'Passport and yellow fever certificate    '),
(1124, 153, 'Hiking shoes, sun hat, and rain jacket '),
(1125, 153, 'Insect repellent and camera '),
(1126, 153, 'Binoculars for birdwatching'),
(1127, 154, 'Passport and yellow fever certificate    '),
(1128, 154, 'Light clothing and sun protection '),
(1129, 154, 'Camera, water bottle, and snacks '),
(1130, 154, 'Cash for souvenirs or optional extras'),
(1185, 149, 'Passport (required for permit check)        '),
(1186, 149, 'Waterproof hiking boots'),
(1187, 149, 'Rain jacket and warm layer'),
(1188, 149, 'Daypack and camera'),
(1189, 149, 'Insect repellent'),
(1196, 148, 'Comfortable walking shoes    '),
(1197, 148, 'Modest clothing (for memorial visits)'),
(1198, 148, 'Sunscreen and hat'),
(1199, 155, 'Comfortable walking shoes and modest, breathable clothing'),
(1200, 155, 'Sun protection: hat, sunscreen, sunglasses'),
(1201, 155, 'Light rain jacket or poncho (seasonal)'),
(1208, 156, 'Durable hiking boots'),
(1209, 156, 'Warm and lightweight clothing layers '),
(1210, 156, 'Insect repellent'),
(1212, 157, 'Sturdy hiking boots'),
(1213, 157, 'Rain jacket    '),
(1214, 157, 'Field notebook '),
(1215, 157, 'Sun protection (hat, sunscreen) '),
(1216, 157, 'All-weather clothing'),
(1217, 157, 'Insect repellent'),
(1218, 157, 'Small first aid kit'),
(1222, 158, 'Comfortable cycling clothes and closed-toe shoes'),
(1223, 158, 'Helmet (optional if preferred)    '),
(1224, 158, 'Sunscreen, hat, and sunglasses'),
(1225, 158, 'Refillable water bottle'),
(1226, 158, 'Lightweight rain jacket'),
(1227, 158, 'Camera or smartphone'),
(1234, 159, 'Comfortable, neutral-colored clothing suitable for warm weather     '),
(1235, 159, 'Sun hat, sunglasses, and sunscreen for protection'),
(1236, 159, 'Camera and binoculars to capture wildlife moments'),
(1237, 159, 'Refillable water bottle to stay hydrated'),
(1238, 159, 'Comfortable closed-toe shoes for walking or transfers'),
(1239, 159, 'Light jacket or sweater for early morning or evening chill'),
(1240, 118, 'Comfortable hiking boots               '),
(1241, 118, 'Lightweight long-sleeved shirts and pants'),
(1242, 118, 'Rain jacket or waterproof gear '),
(1243, 118, 'Quality camera with extra batteries and memory cards'),
(1244, 118, 'Reusable water bottle'),
(1245, 118, 'Insect repellent'),
(1246, 118, 'Sunscreen'),
(1247, 118, 'Small daypack'),
(1248, 118, 'Travel documents (passport, visas, permits)'),
(1249, 160, 'Comfortable hiking shoes     '),
(1250, 160, 'Lightweight rain jacket (forest weather is unpredictable)'),
(1251, 160, 'Binoculars (for birdwatching)'),
(1252, 160, 'Camera or smartphone for photos'),
(1253, 160, 'Sunhat and sunscreen'),
(1254, 160, 'Refillable water bottle'),
(1255, 161, 'Swimwear and towel    '),
(1256, 161, 'Sunhat and sunscreen'),
(1257, 161, 'Comfortable walking shoes or sandals'),
(1258, 161, 'Camera or smartphone for photos'),
(1259, 161, 'Light jacket or shawl (for breezy afternoons) '),
(1260, 161, 'Refillable water bottle'),
(1261, 162, 'Comfortable walking shoes   '),
(1262, 162, 'Modest, breathable clothing'),
(1263, 162, 'Camera or smartphone for photos'),
(1264, 162, 'Cash for crafts or donations '),
(1265, 163, 'Comfortable clothes and closed shoes     '),
(1266, 163, 'Sunhat and sunscreen'),
(1267, 163, 'Reusable water bottle'),
(1268, 163, 'Camera or smartphone'),
(1269, 163, 'Cash for optional craft purchases or tipping'),
(1270, 164, 'Binoculars and or spotting scope     '),
(1271, 164, 'Birding camera or notebook'),
(1272, 164, 'Comfortable hiking shoes'),
(1273, 164, 'Lightweight long-sleeved clothing (for forest or marsh protection)'),
(1274, 164, 'Sunhat, sunscreen and insect repellent'),
(1275, 164, 'Refillable water bottle '),
(1276, 165, 'Comfortable workout clothes and shoes   '),
(1277, 165, 'A change of clothes if desired'),
(1278, 165, 'Camera or smartphone '),
(1279, 165, 'Refillable water bottle'),
(1280, 166, 'Comfortable walking shoes    '),
(1281, 166, 'Sunhat and sunscreen'),
(1282, 166, 'Camera or smartphone'),
(1283, 166, 'Refillable water bottle'),
(1284, 166, 'Light jacket or raincoat (seasonal) '),
(1285, 166, 'Curiosity and eco-conscious mindset');

-- --------------------------------------------------------

--
-- Table structure for table `travel_destinations`
--

CREATE TABLE `travel_destinations` (
  `id` int NOT NULL,
  `month` varchar(20) COLLATE utf8mb4_general_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `description` text COLLATE utf8mb4_general_ci NOT NULL,
  `image_url` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `travel_destinations`
--

INSERT INTO `travel_destinations` (`id`, `month`, `name`, `description`, `image_url`, `created_at`, `updated_at`) VALUES
(62, 'February', 'Rwanda', 'February in Rwanda provides ideal conditions for tourism, with dry weather and cool mornings that support both wildlife viewing and cultural exploration. This month is excellent for primate tracking in Volcanoes, Nyungwe, and Cyamudongo forests, while Akagera National Park offers rewarding game drives, boat safaris, and night tours. Birdwatching is at its peak, and hiking trails to volcanoes and forest canopies are easily accessible. Visitors can also enjoy Lake Kivu’s leisure activities and engage with Rwanda’s cultural heritage through museums, traditional villages, and Kigali’s vibrant arts scene.', 'images/destinations/681b7501ef0bc.jpg', '2025-05-07 14:56:10', '2025-06-18 10:36:17'),
(63, 'February', 'Uganda', 'February marks the end of Uganda’s short dry season, offering ideal conditions for eco-tourism and cultural travel. Key national parks like Bwindi, Kibale, and Murchison Falls become more accessible, supporting exceptional gorilla and chimpanzee trekking, wildlife viewing, and birdwatching. Migratory birds and endemics, such as the shoebill in Mabamba Swamp, are easily observed. Stable weather enables visits to cultural communities like the Batwa and Karamojong, while mountain hiking and water-based activities thrive in scenic areas like the Rwenzoris and Lake Bunyonyi. Due to peak season demand, early bookings are advised.', 'images/destinations/681b7613aac92.jpg', '2025-05-07 15:02:43', '2025-06-18 10:37:47'),
(64, 'February', 'DRCongo', 'February brings dry and stable weather to eastern DRC, making it ideal for gorilla trekking in Virunga and Kahuzi-Biega National Parks. It’s also a safer time to climb Nyiragongo Volcano. The dry season allows for cultural and ecotourism around Goma and Lake Kivu. With fewer crowds, clear skies, and extended daylight, travelers enjoy birdwatching, forest hikes, and local cultural experiences. This is one of the best months for cross-border ecotravel in the Virunga Massif, linking Rwanda, Uganda, and DRC.', 'images/destinations/68529325adc39.jpg', '2025-05-07 15:07:51', '2025-06-18 10:38:51'),
(68, 'March', 'Rwanda', 'March in the Virunga Massif offers a lush, misty landscape perfect for photographers and nature lovers, thanks to the rainy season. While trails can be muddy, gorilla and golden monkey tracking remain active, often with easier access to primates at lower elevations. Cultural experiences like village visits and traditional performances continue unaffected, and birdwatching is excellent with increased avian activity. With fewer tourists, March brings a quieter, more intimate ecotourism experience across Rwanda, Uganda, and the DRC ideal for travelers seeking beauty, solitude, and authenticity.', 'images/destinations/681c692fd9064.jpg', '2025-05-08 08:19:59', '2025-06-18 12:40:44'),
(69, 'March', 'Uganda', 'March marks the heart of the rainy season across the Virunga Massif (Rwanda, Uganda, DRC), bringing vibrant green landscapes and atmospheric mist ideal for nature photography. Visitor numbers drop, making permits easier to get and trails more peaceful, enhancing wildlife encounters with gorillas and golden monkeys. Despite wetter conditions, activities like gorilla trekking, golden monkey tracking (especially in Uganda’s Mgahinga Park), volcano climbs, and cultural tours with the Batwa remain accessible. Essential gear includes waterproof boots and rain jackets. Overall, March offers a quieter, lush, and authentic eco-tourism experience.', 'images/destinations/681c6e73061f0.jpg', '2025-05-08 08:42:27', '2025-06-18 10:44:05'),
(70, 'March', 'DRCongo', 'March Travel Highlights in the Virunga Massif offer lush green landscapes and misty atmospheres ideal for nature photography. As an off-peak month, visitors enjoy fewer crowds and better permit availability. Gorilla and monkey sightings remain reliable despite rain, with quieter trails enhancing the wilderness experience. Cultural activities in villages continue year-round. In DR Congo’s Virunga National Park, gorilla trekking in Mikeno and chimpanzee habituation in Rumangabo remain possible, though Nyiragongo volcano climbs are often suspended due to heavy rains. Visitors should bring rain gear and expect favorable prices during this quieter season.', 'images/destinations/6852976a48daf.jpg', '2025-05-08 08:52:57', '2025-06-18 10:39:38'),
(71, 'April', 'Rwanda', 'In April, Rwanda’s long-rain high season, tourism activities include mountain gorilla trekking in Volcanoes National Park despite muddy trails, chimpanzee habituation walks and canopy tours in Nyungwe Forest, and savannah game drives and boat safaris in Akagera National Park. Cultural tourism involves community visits near Huye and Musanze, offering insights into local traditions.\\r\\n\\r\\nWeather in April is marked by frequent afternoon rains and high humidity (80–90%), with temperatures from 18 °C in highlands to 26 °C in lowlands. Monthly rainfall exceeds 200 mm, creating lush landscapes but requiring adaptable plans and suitable gear for fieldwork and travel.', 'images/destinations/681c7e3c5f6f1.jpg', '2025-05-08 09:49:48', '2025-06-18 15:07:44'),
(72, 'April', 'DR Congo', 'April is the heart of the rainy season, bringing lush scenery, fewer crowds, and rewarding experiences across the DRC’s Virunga National Park and Goma region. Gorilla trekking in the Mikeno Sector becomes more personal, Nyiragongo’s lava lake remains a dramatic highlight (weather permitting), and birdwatching thrives with seasonal activity. Community visits and coffee tours add cultural depth. Come prepared with waterproof gear, hire local porters, and enjoy off-season discounts and a slower, more intimate travel pace.', 'images/destinations/68529a87afa8e.jpg', '2025-05-08 10:06:35', '2025-06-18 10:52:55'),
(73, 'April', 'Uganda', 'April in the Virunga Massif is the heart of the rainy season, transforming Rwanda, Uganda, and the DRC into lush, misty landscapes with fewer tourists. Despite muddy trails and unpredictable weather, it’s a rewarding time for discounted gorilla permits, vibrant biodiversity, and peaceful treks. In Uganda, highlights include gorilla and golden monkey tracking, misty volcano hikes, and the Batwa Cultural Trail. Come prepared with waterproof gear, hire local porters, stay flexible, and enjoy the benefits of off-season exploration.', 'images/destinations/681c8394b0633.jpg', '2025-05-08 10:12:36', '2025-06-18 10:46:08'),
(74, 'May', 'Rwanda', 'May in the Virunga Massif is a transitional time as the rains ease and drier conditions begin to return, offering lush green landscapes, active wildlife, and fewer tourists ideal for mountain gorilla trekking, birdwatching, and cultural visits like Iby’Iwacu Village. Trails can still be muddy, so waterproof gear, trekking poles, and flexible travel plans are essential. Hiking Mount Bisoke or visiting Dian Fossey’s tomb is rewarding but challenging this month. With lower demand, visitors can often find permit availability and off-season accommodation deals making May a strategic time for immersive, budget-friendly ecotourism.', 'images/destinations/681ccf3f0abfc.JPG', '2025-05-08 15:35:27', '2025-06-18 11:17:14'),
(75, 'May', 'DRCongo', 'In May, the Democratic Republic of Congo (DRC) experiences the beginning of the long rainy season, with increased precipitation and cooler temperatures. Despite wetter conditions, tourism activities remain accessible, especially in protected areas like Virunga National Park. May is a high season for gorilla trekking and wildlife viewing due to fewer tourists, allowing for a more intimate experience. The rain may make some trails slippery, but abundant vegetation enhances wildlife sightings. Cultural visits and community-based tourism also continue year-round, providing insights into local traditions despite weather variability.', 'images/destinations/681cd88a605b7.JPG', '2025-05-08 15:46:44', '2025-06-18 15:28:07'),
(76, 'May', 'Uganda', 'May marks the shift from the rainy season to drier months in the Virunga Massif, offering lush landscapes, active wildlife, and fewer visitors ideal for ecotourism and cultural exploration. In Uganda’s Mgahinga Gorilla National Park, gorilla and golden monkey trekking remain possible, alongside hikes on Sabinyo, Gahinga, or Muhabura. Cultural encounters with the Batwa add depth to the experience. Come prepared: waterproof gear, flexible bookings, and local guides are key for navigating muddy trails and making the most of shoulder-season travel.', 'images/destinations/681cd1e4e53dc.JPG', '2025-05-08 15:46:44', '2025-06-18 10:57:38'),
(77, 'January', 'Rwanda', 'January Travel in Rwanda – Quick Guide. January falls in Rwanda’s short dry season, ideal for gorilla trekking in Volcanoes National Park. Trails are dry, views are clear, and wildlife activities like golden monkey tracking and nature walks are accessible. Nearby villages offer rich cultural experiences. Roads are reliable and tours are well-organized, but early booking is key due to high demand. Pack hiking boots, layers, rain gear, sunscreen, insect repellent, and travel documents. Check permit and accommodation availability in advance.', 'images/destinations/68529199789db.webp', '2025-05-09 15:40:24', '2025-06-18 10:14:49'),
(78, 'January', 'Uganda', 'January is a dry and favorable month to visit Mgahinga Gorilla National Park, ideal for gorilla and golden monkey tracking, hiking the Virunga volcanoes, and exploring the Batwa Trail. Treks are quieter than in Rwanda, but preparation is essential due to high altitude and cool temperatures. Visitors should pack warm gear and trekking essentials. Advance permit booking and travel planning from Entebbe or Kampala are recommended.', 'images/destinations/681e42b403903.jpg', '2025-05-09 15:45:29', '2025-06-18 10:09:39'),
(79, 'January', 'DRCongo', 'January is a good time to visit Virunga National Park during the dry season. Travelers can trek gorillas, hike Mount Nyiragongo (if safe), and join chimpanzee walks in Tongo Forest. Tourism supports conservation and local communities. Due to security and logistics, travel must be well-prepared—use trusted guides, check advisories, carry proper gear, and ensure valid documents and insurance.', 'images/destinations/681e23fe1290d.jpg', '2025-05-09 15:49:18', '2025-06-18 09:59:47'),
(80, 'July', 'DRCongo', 'July is the heart of the dry season in the Virunga Massif region of the DRC, providing cool, dry weather that favors both field research and ecotourism. With minimal rainfall, access to remote forest areas is easier, making it an ideal time for tracking lowland and mountain gorillas, birdwatching, and biodiversity studies. Conservation and tourism activities peak as park authorities and tour operators collaborate to support wildlife monitoring and cross-border protection efforts with Rwanda and Uganda. However, high demand means visitors must plan and book permits early, prepare for rugged travel conditions, and coordinate with local authorities to ensure a safe and productive visit.', 'images/destinations/6852770abedf6.webp', '2025-05-09 18:11:16', '2025-06-18 11:37:06'),
(81, 'July', 'Rwanda', 'July is an ideal month to visit Rwanda’s Virunga Massif for ecotourism, as the dry season brings clear skies, easier wildlife viewing especially of mountain gorillas and comfortable trekking conditions. With thinner vegetation and accessible trails, visitors can enjoy birdwatching and explore natural sites more smoothly. However, July is a popular time, so securing gorilla permits and accommodations early is important. Travelers should prepare with suitable trekking gear and warm layers for chilly nights, while also taking necessary health precautions to ensure a safe and memorable adventure.', 'images/destinations/681e473da908f.jpg', '2025-05-09 18:19:41', '2025-06-18 15:11:47'),
(82, 'July', 'Uganda', 'July is an ideal month for academic and professional missions in Uganda’s Mgahinga Gorilla National Park within the Virunga Massif, as the dry season offers stable weather, clear trails, and easier wildlife monitoring especially of mountain gorillas and golden monkeys. This period also sees increased activity from local conservation groups, enabling strong collaboration and effective data collection. However, July is a peak travel season, so advance planning and flexibility are crucial to secure permits, accommodations, and guides, while being prepared for varied terrain and remote communications ensures successful fieldwork.', 'images/destinations/681e489e84b27.jpg', '2025-05-09 18:25:34', '2025-06-18 11:30:34'),
(83, 'August', 'Uganda', 'August is an ideal month to visit Uganda’s section of the Virunga Massif, especially Mgahinga Gorilla National Park, thanks to dry, stable weather that enhances gorilla and golden monkey tracking, mountain hikes on Gahinga and Muhabura, and birdwatching. Clear trails and improved visibility make wildlife and cultural experiences like Batwa community visits more accessible and rewarding. Due to high demand, travelers are advised to book permits and accommodations early, and prepare for cool high-altitude conditions.', 'images/destinations/681e49e6a59c1.webp', '2025-05-09 18:31:02', '2025-06-18 11:52:35'),
(84, 'August', 'DRCongo', 'August in the Virunga Massif of the Democratic Republic of Congo is ideal for ecotourism, with dry weather, clear trails, and excellent wildlife visibility. It’s peak season for mountain gorilla trekking in Virunga National Park, with additional chances to see chimpanzees, golden monkeys, and hike Mount Nyiragongo. The dry conditions also enhance community visits and conservation experiences. Due to high demand and security protocols, travelers should plan ahead and take necessary health and safety precautions for a smooth and enriching adventure.', 'images/destinations/681e4bd9948d7.jpg', '2025-05-09 18:39:04', '2025-06-18 11:48:51'),
(85, 'August', 'Rwanda', 'August in Rwanda marks the high dry season, characterized by minimal rainfall and pleasant temperatures. This creates ideal conditions for tourism activities. Visitors can engage in mountain gorilla trekking in Volcanoes National Park with easier trail access and higher success rates. Wildlife safaris in Akagera National Park are also optimal due to dry plains improving game visibility. Additionally, cultural tours and hiking in Nyungwe Forest are favored by the stable weather, enhancing overall visitor experience.', 'images/destinations/681e4dc83a5fd.jpg', '2025-05-09 18:47:36', '2025-06-18 15:24:58'),
(86, 'June', 'Rwanda', 'June in Rwanda’s Virunga Massif offers an exceptional ecotourism experience, with dry-season conditions perfect for gorilla trekking in Volcanoes National Park, hiking the volcanic peaks of Bisoke and Karisimbi, and spotting rare bird species like the Rwenzori turaco. Visitors can also engage in cultural encounters at Iby’Iwacu village or unwind by the shores of Lake Kivu. Clear skies and moderate temperatures make this a prime time for outdoor activities, though travelers should pack for variable weather and book permits early due to high demand.', 'images/destinations/681e516f2be75.jpg', '2025-05-09 19:03:11', '2025-06-18 11:26:53'),
(87, 'June', 'Uganda', 'June in Uganda’s Virunga Massif is a prime month for eco-tourism, offering cool, dry weather ideal for gorilla trekking in Bwindi and Mgahinga, birdwatching, and immersive nature walks. With fewer tourists than peak season, visitors enjoy more intimate wildlife encounters, rich cultural experiences with Batwa communities, and adventurous treks in the Rwenzori Mountains. It’s a great time for multi country safaris into Rwanda or DRC, but advance planning is key permits, visas, and proper gear (like hiking boots and waterproof layers) are essential for a rewarding and sustainable journey.', 'images/destinations/681e521481d77.jpg', '2025-05-09 19:05:56', '2025-06-18 11:25:01'),
(88, 'June', 'DRCongo', 'June in the Virunga Massif marks the beginning of the dry season, making it one of the best times for ecotourism in the Democratic Republic of Congo. With clear trails and mild weather, visitors can enjoy unforgettable gorilla trekking experiences, hike up the fiery Nyiragongo Volcano, and explore the region’s rich biodiversity and vibrant local cultures. It’s a peak period for adventure, so early permit booking, physical preparation, and travel flexibility are essential', 'images/destinations/681e52b50e82b.jpg', '2025-05-09 19:08:37', '2025-06-18 11:21:12'),
(89, 'September', 'DR Congo', 'In September, the Democratic Republic of Congo experiences the end of its dry season, particularly in the eastern regions like the Virunga Massif, making it an ideal time for tourism. The weather is generally dry and cool, providing excellent conditions for outdoor activities such as mountain gorilla trekking in Virunga National Park, hiking Mount Nyiragongo, and chimpanzee tracking in nearby forests. Wildlife viewing is enhanced by thinner vegetation and reliable trail access. This high season also supports cultural tourism, birdwatching, and guided eco-tours, attracting both adventure seekers and conservation-focused travelers.', 'images/destinations/684da4323301c.JPG', '2025-06-14 16:32:50', '2025-06-18 12:58:36'),
(90, 'September', 'Rwanda', 'September marks the high season for tourism in Rwanda, offering favorable weather conditions with minimal rainfall, clear skies, and pleasant temperatures. This dry and stable climate makes it ideal for outdoor activities such as gorilla trekking in Volcanoes National Park, wildlife safaris in Akagera National Park, and canopy walks or chimpanzee tracking in Nyungwe Forest. Cultural experiences, community visits, and hiking adventures are also highly accessible during this period. The excellent weather enhances visibility and comfort, contributing to a rich and immersive travel experience.', 'images/destinations/6852b705b5be1.jpg', '2025-06-18 12:53:47', '2025-06-18 12:54:29'),
(91, 'September', 'Uganda', 'September marks the end of the dry season in Uganda, offering favorable weather conditions for tourism, with minimal rainfall, clear skies, and pleasant temperatures. This high season is ideal for wildlife viewing in national parks like Queen Elizabeth, Murchison Falls, and Kidepo Valley, where animals gather around water sources, enhancing safari experiences. It is also a prime time for gorilla and golden monkey trekking in Bwindi Impenetrable and Mgahinga Gorilla National Parks, as trails are dry and accessible. Additionally, birdwatching thrives due to the abundance of species, and cultural tourism activities are easily conducted in local communities under stable climatic conditions.', 'images/destinations/6852b8eaa0463.jpg', '2025-06-18 13:02:34', '2025-06-18 13:02:34'),
(92, 'October', 'Uganda', 'In October, Uganda experiences the tail end of the rainy season, characterized by intermittent showers and lush, vibrant landscapes, which enhance the natural beauty of its diverse ecosystems. This period is considered a high tourism season due to favorable conditions for wildlife viewing and birdwatching, especially in national parks such as Bwindi Impenetrable Forest and Queen Elizabeth National Park. Activities like gorilla trekking, chimpanzee tracking, and game drives are popular, as the rainfall increases food availability, resulting in active wildlife. The moderate weather and fewer tourists compared to peak dry months create an optimal balance for immersive ecotourism and cultural experiences.', 'images/destinations/6852baf99d264.jpg', '2025-06-18 13:11:21', '2025-06-18 13:11:21'),
(93, 'October', 'DRCongo', 'In October, the Democratic Republic of Congo experiences the end of the long rainy season, transitioning towards drier conditions that mark the beginning of the high tourism season. Weather is characterized by reduced rainfall and cooler temperatures, improving accessibility to key natural sites. This period is ideal for ecotourism activities such as mountain gorilla trekking in Virunga National Park, chimpanzee tracking, and exploring volcanic landscapes like Mount Nyiragongo. The clearer trails and favorable climate enhance wildlife viewing and outdoor adventure experiences, making October a prime month for sustainable tourism and conservation-focused visits.', 'images/destinations/6852bc1ceb8b0.png', '2025-06-18 13:16:12', '2025-06-18 13:16:12'),
(94, 'October', 'Rwanda', 'In October, Rwanda experiences the end of the long rainy season, transitioning into a drier period, which marks the high tourism season due to improved weather conditions. The climate is generally mild with occasional light showers, resulting in lush green landscapes and vibrant biodiversity. Tourists can engage in various activities such as mountain gorilla trekking in Volcanoes National Park, golden monkey tracking, bird watching, and cultural visits to local communities. Additionally, nature hikes, canopy walks in Nyungwe Forest, and game drives in Akagera National Park are popular, as the clearer trails and cooler temperatures enhance wildlife viewing and overall outdoor experiences.', 'images/destinations/6852bd26b3a6b.jpg', '2025-06-18 13:20:38', '2025-06-18 13:20:38'),
(95, 'November', 'Rwanda', 'In November, Rwanda experiences the short rainy season, characterized by intermittent showers and cooler temperatures, which rejuvenate the landscape with lush greenery. Despite occasional rain, tourism activities remain vibrant as this period is considered a high season due to increased wildlife activity and fewer tourists compared to the long dry season. Visitors can engage in mountain gorilla trekking in Volcanoes National Park, golden monkey tracking, birdwatching, and cultural tours in rural communities. The rain enhances the scenic beauty and biodiversity, providing excellent opportunities for ecological and photographic tourism, while well-maintained trails ensure accessibility for most outdoor activities.', 'images/destinations/6852be06d8903.jpg', '2025-06-18 13:24:22', '2025-06-18 13:24:22'),
(96, 'November', 'Uganda', 'In November, Uganda’s short rainy season brings warm temperatures with occasional showers, creating lush green landscapes that enhance the natural beauty.\\r\\n\\r\\nThis period is ideal for gorilla trekking in Bwindi and Mgahinga, as trails are generally accessible with less mud than in heavier rains. Wildlife safaris in parks like Queen Elizabeth and Murchison Falls remain excellent for game viewing, while birdwatching benefits from the presence of migratory species. Cultural tours and nature walks are also popular, making November a vibrant high season for diverse tourism activities in Uganda.', 'images/destinations/6852bffd1f58f.jpg', '2025-06-18 13:32:45', '2025-06-18 13:32:45'),
(97, 'November', 'DRCongo', 'In November, the Democratic Republic of Congo enters its short rainy season, bringing moderate rainfall and slightly cooler temperatures, but overall conditions remain suitable for tourism. This month is part of the high season due to wildlife activity and improved accessibility.\\r\\n\\r\\nKey tourism activities include mountain gorilla trekking in Virunga National Park, chimpanzee tracking, bird watching, and volcano hikes, such as climbing Mount Nyiragongo. The rain enhances the park’s lush environment, creating vibrant scenery while visitor numbers remain moderate, offering a rich and immersive wildlife and cultural experience.', 'images/destinations/6852c156cd2ad.jpg', '2025-06-18 13:38:30', '2025-06-18 13:38:30'),
(99, 'December', 'DRCongo', 'In December, the Democratic Republic of Congo experiences the start of the short dry season, with relatively lower rainfall and mild temperatures. This weather creates favorable conditions for tourism activities such as mountain gorilla trekking in Virunga National Park, wildlife viewing, and cultural visits. The dry trails improve accessibility, making December a high season for ecotourism and adventure tourism in the region.', 'images/destinations/6852c6412ec74.jpg', '2025-06-18 13:59:29', '2025-06-18 13:59:29'),
(100, 'December', 'Rwanda', 'December in Rwanda coincides with the dry season, characterized by warm temperatures and minimal rainfall, creating favorable conditions for outdoor tourism. This high season offers excellent opportunities for mountain gorilla trekking in Volcanoes National Park, golden monkey tracking, and wildlife safaris in Akagera National Park. The dry weather enhances accessibility and wildlife visibility, while cultural tourism and community visits also see increased activity due to holiday travel. Overall, December’s climatic conditions support diverse tourism experiences across Rwanda.', 'images/destinations/6852c79876471.jpg', '2025-06-18 14:05:12', '2025-06-22 15:27:07'),
(101, 'December', 'Uganda', 'December coincides with the height of Uganda’s dry season, when daily temperatures typically range from 22 °C to 28 °C and rainfall is minimal. These clear, sunny conditions optimize outdoor tourism: mountain gorilla and golden monkey tracking in Mgahinga and Bwindi Impenetrable National Parks; wildlife safaris in Queen Elizabeth, Murchison Falls, and Kidepo Valley where animals congregate at shrinking waterholes; and superb birdwatching as migratory species arrive. Cultural excursions and Nile or Lake Bunyonyi boat cruises likewise flourish under the stable, festive-season climate.', 'images/destinations/6852cf776b014.webp', '2025-06-18 14:38:47', '2025-06-18 14:38:47');

-- --------------------------------------------------------

--
-- Table structure for table `travel_guides`
--

CREATE TABLE `travel_guides` (
  `guide_id` int NOT NULL,
  `country_code` varchar(10) COLLATE utf8mb4_general_ci NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `intro_text_1` text COLLATE utf8mb4_general_ci NOT NULL,
  `intro_text_2` text COLLATE utf8mb4_general_ci NOT NULL,
  `welcome_title` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `welcome_text_1` text COLLATE utf8mb4_general_ci NOT NULL,
  `welcome_text_2` text COLLATE utf8mb4_general_ci NOT NULL,
  `pre_planning_text` text COLLATE utf8mb4_general_ci NOT NULL,
  `assistance_text` text COLLATE utf8mb4_general_ci NOT NULL,
  `understanding_title` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `understanding_text_1` text COLLATE utf8mb4_general_ci NOT NULL,
  `understanding_text_2` text COLLATE utf8mb4_general_ci NOT NULL,
  `featured_image_url` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `meta_description` text COLLATE utf8mb4_general_ci,
  `meta_keywords` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `about_cta`
--
ALTER TABLE `about_cta`
  ADD PRIMARY KEY (`cta_id`);

--
-- Indexes for table `about_gallery`
--
ALTER TABLE `about_gallery`
  ADD PRIMARY KEY (`gallery_id`),
  ADD KEY `section_id` (`section_id`);

--
-- Indexes for table `about_gallery_section`
--
ALTER TABLE `about_gallery_section`
  ADD PRIMARY KEY (`section_id`);

--
-- Indexes for table `about_hero`
--
ALTER TABLE `about_hero`
  ADD PRIMARY KEY (`hero_id`);

--
-- Indexes for table `about_impact`
--
ALTER TABLE `about_impact`
  ADD PRIMARY KEY (`impact_id`);

--
-- Indexes for table `about_impact_stats`
--
ALTER TABLE `about_impact_stats`
  ADD PRIMARY KEY (`stat_id`),
  ADD KEY `impact_id` (`impact_id`);

--
-- Indexes for table `about_story`
--
ALTER TABLE `about_story`
  ADD PRIMARY KEY (`story_id`);

--
-- Indexes for table `about_team_members`
--
ALTER TABLE `about_team_members`
  ADD PRIMARY KEY (`member_id`),
  ADD KEY `section_id` (`section_id`);

--
-- Indexes for table `about_team_section`
--
ALTER TABLE `about_team_section`
  ADD PRIMARY KEY (`section_id`);

--
-- Indexes for table `about_values`
--
ALTER TABLE `about_values`
  ADD PRIMARY KEY (`value_id`),
  ADD KEY `section_id` (`section_id`);

--
-- Indexes for table `about_values_section`
--
ALTER TABLE `about_values_section`
  ADD PRIMARY KEY (`section_id`);

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`admin_id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `email_index` (`email`);

--
-- Indexes for table `admin_activity_logs`
--
ALTER TABLE `admin_activity_logs`
  ADD PRIMARY KEY (`log_id`),
  ADD KEY `activity_admin_index` (`admin_id`),
  ADD KEY `activity_date_index` (`created_at`);

--
-- Indexes for table `attraction_details`
--
ALTER TABLE `attraction_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `attraction_id` (`attraction_id`);

--
-- Indexes for table `attraction_gallery`
--
ALTER TABLE `attraction_gallery`
  ADD PRIMARY KEY (`id`),
  ADD KEY `attraction_id` (`attraction_id`);

--
-- Indexes for table `blog_categories`
--
ALTER TABLE `blog_categories`
  ADD PRIMARY KEY (`category_id`),
  ADD UNIQUE KEY `category_slug` (`category_slug`);

--
-- Indexes for table `blog_comments`
--
ALTER TABLE `blog_comments`
  ADD PRIMARY KEY (`comment_id`),
  ADD KEY `blog_id` (`blog_id`),
  ADD KEY `parent_comment_id` (`parent_comment_id`);

--
-- Indexes for table `blog_content_blocks`
--
ALTER TABLE `blog_content_blocks`
  ADD PRIMARY KEY (`block_id`),
  ADD KEY `idx_blog_content_blocks_order` (`blog_id`,`block_order`);

--
-- Indexes for table `blog_gallery_images`
--
ALTER TABLE `blog_gallery_images`
  ADD PRIMARY KEY (`gallery_image_id`),
  ADD KEY `idx_blog_gallery_images_order` (`blog_id`,`image_order`);

--
-- Indexes for table `blog_image_blocks`
--
ALTER TABLE `blog_image_blocks`
  ADD PRIMARY KEY (`image_block_id`),
  ADD KEY `block_id` (`block_id`);

--
-- Indexes for table `blog_list_blocks`
--
ALTER TABLE `blog_list_blocks`
  ADD PRIMARY KEY (`list_block_id`),
  ADD KEY `block_id` (`block_id`);

--
-- Indexes for table `blog_list_items`
--
ALTER TABLE `blog_list_items`
  ADD PRIMARY KEY (`item_id`),
  ADD KEY `list_block_id` (`list_block_id`);

--
-- Indexes for table `blog_posts`
--
ALTER TABLE `blog_posts`
  ADD PRIMARY KEY (`blog_id`),
  ADD UNIQUE KEY `slug` (`slug`),
  ADD KEY `created_by` (`created_by`),
  ADD KEY `idx_blog_posts_category` (`category_id`),
  ADD KEY `idx_blog_posts_status` (`status`);

--
-- Indexes for table `blog_quote_blocks`
--
ALTER TABLE `blog_quote_blocks`
  ADD PRIMARY KEY (`quote_block_id`),
  ADD KEY `block_id` (`block_id`);

--
-- Indexes for table `blog_text_blocks`
--
ALTER TABLE `blog_text_blocks`
  ADD PRIMARY KEY (`text_block_id`),
  ADD KEY `block_id` (`block_id`);

--
-- Indexes for table `build_submissions`
--
ALTER TABLE `build_submissions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `community_admins`
--
ALTER TABLE `community_admins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `community_username` (`username`),
  ADD UNIQUE KEY `community_email` (`email`);

--
-- Indexes for table `community_categories`
--
ALTER TABLE `community_categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `community_name` (`name`),
  ADD KEY `community_status` (`status`);

--
-- Indexes for table `community_messages`
--
ALTER TABLE `community_messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `community_status` (`status`),
  ADD KEY `community_sent_at` (`sent_at`),
  ADD KEY `community_email` (`email`);

--
-- Indexes for table `community_programs`
--
ALTER TABLE `community_programs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `community_slug` (`slug`),
  ADD KEY `community_country` (`country`),
  ADD KEY `community_category` (`category`),
  ADD KEY `community_status` (`status`),
  ADD KEY `community_featured` (`featured`);

--
-- Indexes for table `community_team`
--
ALTER TABLE `community_team`
  ADD PRIMARY KEY (`id`),
  ADD KEY `community_status` (`status`),
  ADD KEY `community_order_position` (`order_position`);

--
-- Indexes for table `community_testimonials`
--
ALTER TABLE `community_testimonials`
  ADD PRIMARY KEY (`id`),
  ADD KEY `community_program_id` (`program_id`),
  ADD KEY `community_featured` (`featured`),
  ADD KEY `community_status` (`status`);

--
-- Indexes for table `contact_submissions`
--
ALTER TABLE `contact_submissions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_email` (`email`),
  ADD KEY `idx_submission_date` (`submission_date`);

--
-- Indexes for table `content_section`
--
ALTER TABLE `content_section`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `destinations`
--
ALTER TABLE `destinations`
  ADD PRIMARY KEY (`destination_id`);

--
-- Indexes for table `faqs`
--
ALTER TABLE `faqs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gallery_items`
--
ALTER TABLE `gallery_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `guide_list_items`
--
ALTER TABLE `guide_list_items`
  ADD PRIMARY KEY (`list_item_id`),
  ADD KEY `guide_id` (`guide_id`);

--
-- Indexes for table `guide_sections`
--
ALTER TABLE `guide_sections`
  ADD PRIMARY KEY (`section_id`),
  ADD KEY `guide_id` (`guide_id`);

--
-- Indexes for table `hero`
--
ALTER TABLE `hero`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `home_about`
--
ALTER TABLE `home_about`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `home_attractions`
--
ALTER TABLE `home_attractions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `home_destinations`
--
ALTER TABLE `home_destinations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `home_hero`
--
ALTER TABLE `home_hero`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `home_partners`
--
ALTER TABLE `home_partners`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `home_under_hero_cards`
--
ALTER TABLE `home_under_hero_cards`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `privacy_audit_log`
--
ALTER TABLE `privacy_audit_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_admin_id` (`admin_id`),
  ADD KEY `idx_action_type` (`action_type`),
  ADD KEY `idx_created_at` (`created_at`);

--
-- Indexes for table `privacy_policy`
--
ALTER TABLE `privacy_policy`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `privacy_requests`
--
ALTER TABLE `privacy_requests`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_email` (`email`),
  ADD KEY `idx_status` (`status`),
  ADD KEY `idx_request_type` (`request_type`),
  ADD KEY `idx_created_at` (`created_at`);

--
-- Indexes for table `privacy_settings`
--
ALTER TABLE `privacy_settings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `setting_key` (`setting_key`),
  ADD KEY `idx_setting_key` (`setting_key`);

--
-- Indexes for table `programs`
--
ALTER TABLE `programs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `program_card`
--
ALTER TABLE `program_card`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `program_card_content`
--
ALTER TABLE `program_card_content`
  ADD PRIMARY KEY (`id`),
  ADD KEY `program_card_id` (`program_card_id`);

--
-- Indexes for table `program_card_gallery`
--
ALTER TABLE `program_card_gallery`
  ADD PRIMARY KEY (`id`),
  ADD KEY `program_card_id` (`program_card_id`);

--
-- Indexes for table `styleguide_cards`
--
ALTER TABLE `styleguide_cards`
  ADD PRIMARY KEY (`card_id`);

--
-- Indexes for table `styleguide_content`
--
ALTER TABLE `styleguide_content`
  ADD PRIMARY KEY (`content_id`),
  ADD KEY `card_id` (`card_id`);

--
-- Indexes for table `subscribers`
--
ALTER TABLE `subscribers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `idx_email` (`email`),
  ADD KEY `email_2` (`email`),
  ADD KEY `created_at` (`created_at`);

--
-- Indexes for table `testimonial_content`
--
ALTER TABLE `testimonial_content`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tours`
--
ALTER TABLE `tours`
  ADD PRIMARY KEY (`tour_id`);

--
-- Indexes for table `tour_bookings`
--
ALTER TABLE `tour_bookings`
  ADD PRIMARY KEY (`booking_id`),
  ADD KEY `tour_id` (`tour_id`);

--
-- Indexes for table `tour_days`
--
ALTER TABLE `tour_days`
  ADD PRIMARY KEY (`day_id`),
  ADD UNIQUE KEY `unique_day_per_tour` (`tour_id`,`day_number`);

--
-- Indexes for table `tour_excluded`
--
ALTER TABLE `tour_excluded`
  ADD PRIMARY KEY (`excluded_id`),
  ADD KEY `tour_id` (`tour_id`);

--
-- Indexes for table `tour_highlights`
--
ALTER TABLE `tour_highlights`
  ADD PRIMARY KEY (`highlight_id`),
  ADD KEY `tour_id` (`tour_id`);

--
-- Indexes for table `tour_included`
--
ALTER TABLE `tour_included`
  ADD PRIMARY KEY (`included_id`),
  ADD KEY `tour_id` (`tour_id`);

--
-- Indexes for table `tour_to_bring`
--
ALTER TABLE `tour_to_bring`
  ADD PRIMARY KEY (`to_bring_id`),
  ADD KEY `tour_id` (`tour_id`);

--
-- Indexes for table `travel_destinations`
--
ALTER TABLE `travel_destinations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `travel_guides`
--
ALTER TABLE `travel_guides`
  ADD PRIMARY KEY (`guide_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `about_cta`
--
ALTER TABLE `about_cta`
  MODIFY `cta_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `about_gallery`
--
ALTER TABLE `about_gallery`
  MODIFY `gallery_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `about_gallery_section`
--
ALTER TABLE `about_gallery_section`
  MODIFY `section_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `about_hero`
--
ALTER TABLE `about_hero`
  MODIFY `hero_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `about_impact`
--
ALTER TABLE `about_impact`
  MODIFY `impact_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `about_impact_stats`
--
ALTER TABLE `about_impact_stats`
  MODIFY `stat_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `about_story`
--
ALTER TABLE `about_story`
  MODIFY `story_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `about_team_members`
--
ALTER TABLE `about_team_members`
  MODIFY `member_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `about_team_section`
--
ALTER TABLE `about_team_section`
  MODIFY `section_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `about_values`
--
ALTER TABLE `about_values`
  MODIFY `value_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `about_values_section`
--
ALTER TABLE `about_values_section`
  MODIFY `section_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `admin_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `admin_activity_logs`
--
ALTER TABLE `admin_activity_logs`
  MODIFY `log_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=329;

--
-- AUTO_INCREMENT for table `attraction_details`
--
ALTER TABLE `attraction_details`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `attraction_gallery`
--
ALTER TABLE `attraction_gallery`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `blog_categories`
--
ALTER TABLE `blog_categories`
  MODIFY `category_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `blog_comments`
--
ALTER TABLE `blog_comments`
  MODIFY `comment_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `blog_content_blocks`
--
ALTER TABLE `blog_content_blocks`
  MODIFY `block_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=104;

--
-- AUTO_INCREMENT for table `blog_gallery_images`
--
ALTER TABLE `blog_gallery_images`
  MODIFY `gallery_image_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=72;

--
-- AUTO_INCREMENT for table `blog_image_blocks`
--
ALTER TABLE `blog_image_blocks`
  MODIFY `image_block_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT for table `blog_list_blocks`
--
ALTER TABLE `blog_list_blocks`
  MODIFY `list_block_id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `blog_list_items`
--
ALTER TABLE `blog_list_items`
  MODIFY `item_id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `blog_posts`
--
ALTER TABLE `blog_posts`
  MODIFY `blog_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `blog_quote_blocks`
--
ALTER TABLE `blog_quote_blocks`
  MODIFY `quote_block_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `blog_text_blocks`
--
ALTER TABLE `blog_text_blocks`
  MODIFY `text_block_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=93;

--
-- AUTO_INCREMENT for table `build_submissions`
--
ALTER TABLE `build_submissions`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `community_admins`
--
ALTER TABLE `community_admins`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `community_categories`
--
ALTER TABLE `community_categories`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `community_messages`
--
ALTER TABLE `community_messages`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `community_programs`
--
ALTER TABLE `community_programs`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `community_team`
--
ALTER TABLE `community_team`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `community_testimonials`
--
ALTER TABLE `community_testimonials`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `contact_submissions`
--
ALTER TABLE `contact_submissions`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=99;

--
-- AUTO_INCREMENT for table `content_section`
--
ALTER TABLE `content_section`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `destinations`
--
ALTER TABLE `destinations`
  MODIFY `destination_id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `faqs`
--
ALTER TABLE `faqs`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `gallery_items`
--
ALTER TABLE `gallery_items`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `guide_list_items`
--
ALTER TABLE `guide_list_items`
  MODIFY `list_item_id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `guide_sections`
--
ALTER TABLE `guide_sections`
  MODIFY `section_id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `hero`
--
ALTER TABLE `hero`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `home_about`
--
ALTER TABLE `home_about`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `home_attractions`
--
ALTER TABLE `home_attractions`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `home_destinations`
--
ALTER TABLE `home_destinations`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `home_hero`
--
ALTER TABLE `home_hero`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `home_partners`
--
ALTER TABLE `home_partners`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `home_under_hero_cards`
--
ALTER TABLE `home_under_hero_cards`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `privacy_audit_log`
--
ALTER TABLE `privacy_audit_log`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `privacy_policy`
--
ALTER TABLE `privacy_policy`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `privacy_requests`
--
ALTER TABLE `privacy_requests`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `privacy_settings`
--
ALTER TABLE `privacy_settings`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `programs`
--
ALTER TABLE `programs`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `program_card`
--
ALTER TABLE `program_card`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `program_card_content`
--
ALTER TABLE `program_card_content`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `program_card_gallery`
--
ALTER TABLE `program_card_gallery`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `styleguide_cards`
--
ALTER TABLE `styleguide_cards`
  MODIFY `card_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `styleguide_content`
--
ALTER TABLE `styleguide_content`
  MODIFY `content_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `subscribers`
--
ALTER TABLE `subscribers`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=239;

--
-- AUTO_INCREMENT for table `testimonial_content`
--
ALTER TABLE `testimonial_content`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `tours`
--
ALTER TABLE `tours`
  MODIFY `tour_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=167;

--
-- AUTO_INCREMENT for table `tour_bookings`
--
ALTER TABLE `tour_bookings`
  MODIFY `booking_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tour_days`
--
ALTER TABLE `tour_days`
  MODIFY `day_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=793;

--
-- AUTO_INCREMENT for table `tour_excluded`
--
ALTER TABLE `tour_excluded`
  MODIFY `excluded_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=881;

--
-- AUTO_INCREMENT for table `tour_highlights`
--
ALTER TABLE `tour_highlights`
  MODIFY `highlight_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=472;

--
-- AUTO_INCREMENT for table `tour_included`
--
ALTER TABLE `tour_included`
  MODIFY `included_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1323;

--
-- AUTO_INCREMENT for table `tour_to_bring`
--
ALTER TABLE `tour_to_bring`
  MODIFY `to_bring_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1286;

--
-- AUTO_INCREMENT for table `travel_destinations`
--
ALTER TABLE `travel_destinations`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=102;

--
-- AUTO_INCREMENT for table `travel_guides`
--
ALTER TABLE `travel_guides`
  MODIFY `guide_id` int NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `about_gallery`
--
ALTER TABLE `about_gallery`
  ADD CONSTRAINT `about_gallery_ibfk_1` FOREIGN KEY (`section_id`) REFERENCES `about_gallery_section` (`section_id`) ON DELETE CASCADE;

--
-- Constraints for table `about_impact_stats`
--
ALTER TABLE `about_impact_stats`
  ADD CONSTRAINT `about_impact_stats_ibfk_1` FOREIGN KEY (`impact_id`) REFERENCES `about_impact` (`impact_id`) ON DELETE CASCADE;

--
-- Constraints for table `about_team_members`
--
ALTER TABLE `about_team_members`
  ADD CONSTRAINT `about_team_members_ibfk_1` FOREIGN KEY (`section_id`) REFERENCES `about_team_section` (`section_id`) ON DELETE CASCADE;

--
-- Constraints for table `about_values`
--
ALTER TABLE `about_values`
  ADD CONSTRAINT `about_values_ibfk_1` FOREIGN KEY (`section_id`) REFERENCES `about_values_section` (`section_id`) ON DELETE CASCADE;

--
-- Constraints for table `admin_activity_logs`
--
ALTER TABLE `admin_activity_logs`
  ADD CONSTRAINT `admin_activity_logs_ibfk_1` FOREIGN KEY (`admin_id`) REFERENCES `admins` (`admin_id`) ON DELETE CASCADE;

--
-- Constraints for table `attraction_details`
--
ALTER TABLE `attraction_details`
  ADD CONSTRAINT `attraction_details_ibfk_1` FOREIGN KEY (`attraction_id`) REFERENCES `home_attractions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `attraction_gallery`
--
ALTER TABLE `attraction_gallery`
  ADD CONSTRAINT `attraction_gallery_ibfk_1` FOREIGN KEY (`attraction_id`) REFERENCES `home_attractions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `blog_comments`
--
ALTER TABLE `blog_comments`
  ADD CONSTRAINT `blog_comments_ibfk_1` FOREIGN KEY (`blog_id`) REFERENCES `blog_posts` (`blog_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `blog_comments_ibfk_2` FOREIGN KEY (`parent_comment_id`) REFERENCES `blog_comments` (`comment_id`) ON DELETE SET NULL;

--
-- Constraints for table `blog_content_blocks`
--
ALTER TABLE `blog_content_blocks`
  ADD CONSTRAINT `blog_content_blocks_ibfk_1` FOREIGN KEY (`blog_id`) REFERENCES `blog_posts` (`blog_id`) ON DELETE CASCADE;

--
-- Constraints for table `blog_gallery_images`
--
ALTER TABLE `blog_gallery_images`
  ADD CONSTRAINT `blog_gallery_images_ibfk_1` FOREIGN KEY (`blog_id`) REFERENCES `blog_posts` (`blog_id`) ON DELETE CASCADE;

--
-- Constraints for table `blog_image_blocks`
--
ALTER TABLE `blog_image_blocks`
  ADD CONSTRAINT `blog_image_blocks_ibfk_1` FOREIGN KEY (`block_id`) REFERENCES `blog_content_blocks` (`block_id`) ON DELETE CASCADE;

--
-- Constraints for table `blog_list_blocks`
--
ALTER TABLE `blog_list_blocks`
  ADD CONSTRAINT `blog_list_blocks_ibfk_1` FOREIGN KEY (`block_id`) REFERENCES `blog_content_blocks` (`block_id`) ON DELETE CASCADE;

--
-- Constraints for table `blog_list_items`
--
ALTER TABLE `blog_list_items`
  ADD CONSTRAINT `blog_list_items_ibfk_1` FOREIGN KEY (`list_block_id`) REFERENCES `blog_list_blocks` (`list_block_id`) ON DELETE CASCADE;

--
-- Constraints for table `blog_posts`
--
ALTER TABLE `blog_posts`
  ADD CONSTRAINT `blog_posts_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `blog_categories` (`category_id`),
  ADD CONSTRAINT `blog_posts_ibfk_2` FOREIGN KEY (`created_by`) REFERENCES `admins` (`admin_id`);

--
-- Constraints for table `blog_quote_blocks`
--
ALTER TABLE `blog_quote_blocks`
  ADD CONSTRAINT `blog_quote_blocks_ibfk_1` FOREIGN KEY (`block_id`) REFERENCES `blog_content_blocks` (`block_id`) ON DELETE CASCADE;

--
-- Constraints for table `blog_text_blocks`
--
ALTER TABLE `blog_text_blocks`
  ADD CONSTRAINT `blog_text_blocks_ibfk_1` FOREIGN KEY (`block_id`) REFERENCES `blog_content_blocks` (`block_id`) ON DELETE CASCADE;

--
-- Constraints for table `community_testimonials`
--
ALTER TABLE `community_testimonials`
  ADD CONSTRAINT `community_testimonials_ibfk_1` FOREIGN KEY (`program_id`) REFERENCES `community_programs` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `guide_list_items`
--
ALTER TABLE `guide_list_items`
  ADD CONSTRAINT `guide_list_items_ibfk_1` FOREIGN KEY (`guide_id`) REFERENCES `travel_guides` (`guide_id`) ON DELETE CASCADE;

--
-- Constraints for table `guide_sections`
--
ALTER TABLE `guide_sections`
  ADD CONSTRAINT `guide_sections_ibfk_1` FOREIGN KEY (`guide_id`) REFERENCES `travel_guides` (`guide_id`) ON DELETE CASCADE;

--
-- Constraints for table `program_card_content`
--
ALTER TABLE `program_card_content`
  ADD CONSTRAINT `program_card_content_ibfk_1` FOREIGN KEY (`program_card_id`) REFERENCES `program_card` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `program_card_gallery`
--
ALTER TABLE `program_card_gallery`
  ADD CONSTRAINT `program_card_gallery_ibfk_1` FOREIGN KEY (`program_card_id`) REFERENCES `program_card` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `styleguide_content`
--
ALTER TABLE `styleguide_content`
  ADD CONSTRAINT `styleguide_content_ibfk_1` FOREIGN KEY (`card_id`) REFERENCES `styleguide_cards` (`card_id`);

--
-- Constraints for table `tour_bookings`
--
ALTER TABLE `tour_bookings`
  ADD CONSTRAINT `tour_bookings_ibfk_1` FOREIGN KEY (`tour_id`) REFERENCES `tours` (`tour_id`) ON DELETE CASCADE;

--
-- Constraints for table `tour_days`
--
ALTER TABLE `tour_days`
  ADD CONSTRAINT `tour_days_ibfk_1` FOREIGN KEY (`tour_id`) REFERENCES `tours` (`tour_id`) ON DELETE CASCADE;

--
-- Constraints for table `tour_excluded`
--
ALTER TABLE `tour_excluded`
  ADD CONSTRAINT `tour_excluded_ibfk_1` FOREIGN KEY (`tour_id`) REFERENCES `tours` (`tour_id`) ON DELETE CASCADE;

--
-- Constraints for table `tour_highlights`
--
ALTER TABLE `tour_highlights`
  ADD CONSTRAINT `tour_highlights_ibfk_1` FOREIGN KEY (`tour_id`) REFERENCES `tours` (`tour_id`) ON DELETE CASCADE;

--
-- Constraints for table `tour_included`
--
ALTER TABLE `tour_included`
  ADD CONSTRAINT `tour_included_ibfk_1` FOREIGN KEY (`tour_id`) REFERENCES `tours` (`tour_id`) ON DELETE CASCADE;

--
-- Constraints for table `tour_to_bring`
--
ALTER TABLE `tour_to_bring`
  ADD CONSTRAINT `tour_to_bring_ibfk_1` FOREIGN KEY (`tour_id`) REFERENCES `tours` (`tour_id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
