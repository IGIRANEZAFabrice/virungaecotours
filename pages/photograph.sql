-- ============================================
-- PHOTOGRAPH PAGE DATABASE SCHEMA
-- Kids for Life Photography Training Program
-- ============================================

-- ============================================
-- HERO SECTION TABLE
-- ============================================
CREATE TABLE IF NOT EXISTS `photograph_page` (
  `id` INT(11) PRIMARY KEY AUTO_INCREMENT,
  `hero_title` VARCHAR(255) NOT NULL DEFAULT 'Kids for Life',
  `hero_subtitle` VARCHAR(255) NOT NULL DEFAULT 'Photography Training for Conservation',
  `hero_description` TEXT NOT NULL DEFAULT 'Inspiring young minds to connect with nature through the art of photography',
  `hero_image` VARCHAR(255) DEFAULT NULL,
  `updated_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ============================================
-- OVERVIEW SECTION TABLE
-- ============================================
CREATE TABLE IF NOT EXISTS `photograph_overview` (
  `id` INT(11) PRIMARY KEY AUTO_INCREMENT,
  `overview_title` VARCHAR(255) NOT NULL DEFAULT 'Program Overview',
  `overview_intro` TEXT NOT NULL,
  `overview_description` TEXT NOT NULL,
  `updated_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ============================================
-- WHY IMPORTANT SECTION TABLE
-- ============================================
CREATE TABLE IF NOT EXISTS `photograph_why_important` (
  `id` INT(11) PRIMARY KEY AUTO_INCREMENT,
  `why_important_title` VARCHAR(255) NOT NULL DEFAULT 'Why This Training is Important',
  `updated_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ============================================
-- WHY IMPORTANT ITEMS TABLE
-- ============================================
CREATE TABLE IF NOT EXISTS `photograph_why_important_items` (
  `id` INT(11) PRIMARY KEY AUTO_INCREMENT,
  `item_order` INT(11) NOT NULL,
  `item_title` VARCHAR(255) NOT NULL,
  `item_description` TEXT NOT NULL,
  `item_icon` VARCHAR(50) NOT NULL DEFAULT 'fas fa-star',
  `updated_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ============================================
-- EXPECTATIONS SECTION TABLE
-- ============================================
CREATE TABLE IF NOT EXISTS `photograph_expectations` (
  `id` INT(11) PRIMARY KEY AUTO_INCREMENT,
  `expectations_title` VARCHAR(255) NOT NULL DEFAULT 'What Kids Can Expect After the Training',
  `expectations_image` VARCHAR(255) DEFAULT NULL,
  `expectations_image_caption` VARCHAR(255) DEFAULT 'Young photographers in action',
  `updated_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ============================================
-- EXPECTATIONS ITEMS TABLE
-- ============================================
CREATE TABLE IF NOT EXISTS `photograph_expectations_items` (
  `id` INT(11) PRIMARY KEY AUTO_INCREMENT,
  `item_order` INT(11) NOT NULL,
  `item_title` VARCHAR(255) NOT NULL,
  `item_description` TEXT NOT NULL,
  `item_icon` VARCHAR(50) NOT NULL DEFAULT 'fas fa-star',
  `updated_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ============================================
-- PROGRAM TABLE SECTION TABLE
-- ============================================
CREATE TABLE IF NOT EXISTS `photograph_table_section` (
  `id` INT(11) PRIMARY KEY AUTO_INCREMENT,
  `table_title` VARCHAR(255) NOT NULL DEFAULT 'Strong Educative Program Structure',
  `table_intro` TEXT NOT NULL DEFAULT 'A comprehensive breakdown of our training components and their educational value',
  `updated_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ============================================
-- PROGRAM TABLE ROWS TABLE
-- ============================================
CREATE TABLE IF NOT EXISTS `photograph_table_rows` (
  `id` INT(11) PRIMARY KEY AUTO_INCREMENT,
  `row_order` INT(11) NOT NULL,
  `component_name` VARCHAR(255) NOT NULL,
  `component_icon` VARCHAR(50) NOT NULL DEFAULT 'fas fa-star',
  `component_description` TEXT NOT NULL,
  `educational_value` TEXT NOT NULL,
  `updated_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ============================================
-- INSERT STATEMENTS
-- ============================================

-- Insert Hero & Introduction Content
INSERT INTO `photograph_page` (`id`, `hero_title`, `hero_subtitle`, `hero_description`, `hero_image`) VALUES
(1, 'Kids for Life', 'Photography Training for Conservation', 'Inspiring young minds to connect with nature through the art of photography', NULL);

-- Insert Overview Content
INSERT INTO `photograph_overview` (`id`, `overview_title`, `overview_intro`, `overview_description`) VALUES
(1, 'Program Overview', 'The Kids for Life Photography Training is an immersive educational program designed to inspire young people to connect deeply with nature and conservation through the art of photography. Organized by Virunga Ecotours, this training combines classroom learning with hands-on field tours around the breathtaking Virunga Massif.', 'Children will not only learn photography skills but also discover the importance of protecting wildlife, landscapes, and local cultural heritage.');

-- Insert Why Important Section
INSERT INTO `photograph_why_important` (`id`, `why_important_title`) VALUES
(1, 'Why This Training is Important');

-- Insert Why Important Items
INSERT INTO `photograph_why_important_items` (`id`, `item_order`, `item_title`, `item_description`, `item_icon`) VALUES
(1, 1, 'Conservation Awareness', 'Photography becomes a powerful tool for storytelling. Children learn how images can raise awareness and inspire people to protect nature.', 'fas fa-leaf'),
(2, 2, 'Creative Expression', 'It gives kids an avenue to express their creativity while engaging with real-world conservation issues.', 'fas fa-palette'),
(3, 3, 'Youth Empowerment', 'Early exposure to conservation builds pride, responsibility, and leadership among children in local communities.', 'fas fa-users'),
(4, 4, 'Connection to Community', 'Kids see firsthand how their environment is tied to local livelihoods, tourism, and global interest.', 'fas fa-heart');

-- Insert Expectations Content
INSERT INTO `photograph_expectations` (`id`, `expectations_title`, `expectations_image`, `expectations_image_caption`) VALUES
(1, 'What Kids Can Expect After the Training', '../images/photo/down.png', 'Young photographers in action');

-- Insert Expectations Items
INSERT INTO `photograph_expectations_items` (`id`, `item_order`, `item_title`, `item_description`, `item_icon`) VALUES
(1, 1, 'Technical Skills', 'Understanding camera basics, lighting, framing, and nature photography techniques.', 'fas fa-camera-retro'),
(2, 2, 'Storytelling Power', 'Learning how to tell conservation stories through pictures.', 'fas fa-book-open'),
(3, 3, 'Field Experience', 'Guided tours in forests, villages, and landscapes of the Virunga Massif to practice photography in real-life settings.', 'fas fa-mountain'),
(4, 4, 'Confidence & Leadership', 'Building the confidence to share their images and conservation messages in schools, communities, and online platforms.', 'fas fa-medal'),
(5, 5, 'Ambassadors for Conservation', 'Graduates of the training become "Kids for Life Ambassadors," using photography to inspire peers and families.', 'fas fa-star');

-- Insert Program Table Section
INSERT INTO `photograph_table_section` (`id`, `table_title`, `table_intro`) VALUES
(1, 'Strong Educative Program Structure', 'A comprehensive breakdown of our training components and their educational value');

-- Insert Program Table Rows
INSERT INTO `photograph_table_rows` (`id`, `row_order`, `component_name`, `component_icon`, `component_description`, `educational_value`) VALUES
(1, 1, 'Introduction to Photography', 'fas fa-camera', 'Basics of camera use, mobile photography, and framing', 'Builds technical and creative confidence'),
(2, 2, 'Conservation Concepts', 'fas fa-seedling', 'Interactive sessions on wildlife, forests, and cultural heritage', 'Connects photography to real-world conservation'),
(3, 3, 'Field Tours in Virunga Massif', 'fas fa-hiking', 'Guided walks and village visits with photography practice', 'Hands-on experience, observing and documenting nature'),
(4, 4, 'Storytelling with Photos', 'fas fa-images', 'Teaching kids how to create visual stories about nature', 'Strengthens communication and advocacy skills'),
(5, 5, 'Community Connection', 'fas fa-handshake', 'Interaction with local guides, elders, and ecotourism activities', 'Instills pride in culture and responsibility toward environment'),
(6, 6, 'Photo Exhibitions', 'fas fa-trophy', 'Showcasing kids\' work in community spaces or online', 'Encourages public speaking, confidence, and recognition'),
(7, 7, 'Certification & Ambassadorship', 'fas fa-certificate', 'Kids become "Kids for Life Ambassadors"', 'Inspires lifelong conservation leadership');

