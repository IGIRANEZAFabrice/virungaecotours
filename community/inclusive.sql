-- ============================================
-- Inclusive Community-Based Tourism Database Schema
-- ============================================

-- Drop tables if they exist
DROP TABLE IF EXISTS `inclusive_cta`;
DROP TABLE IF EXISTS `inclusive_stats`;
DROP TABLE IF EXISTS `approach_cards`;
DROP TABLE IF EXISTS `inclusive_page`;

-- ============================================
-- Table 1: Main Page Content
-- ============================================
CREATE TABLE `inclusive_page` (
  `id` INT(11) PRIMARY KEY AUTO_INCREMENT,
  `hero_title` VARCHAR(255) NOT NULL DEFAULT 'Inclusive Community-Based Tourism',
  `hero_subtitle` VARCHAR(255) NOT NULL DEFAULT 'Empowering Persons with Disabilities in Rural Areas',
  `hero_image` VARCHAR(255) DEFAULT NULL,
  `intro_text` TEXT DEFAULT NULL,
  `updated_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ============================================
-- Table 2: Approach Cards (with images)
-- ============================================
CREATE TABLE `approach_cards` (
  `id` INT(11) PRIMARY KEY AUTO_INCREMENT,
  `page_id` INT(11) NOT NULL,
  `number` INT(11) NOT NULL,
  `image` VARCHAR(255) DEFAULT NULL,
  `title` VARCHAR(255) NOT NULL,
  `description` TEXT NOT NULL,
  `updated_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  FOREIGN KEY (`page_id`) REFERENCES `inclusive_page`(`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ============================================
-- Table 3: Statistics
-- ============================================
CREATE TABLE `inclusive_stats` (
  `id` INT(11) PRIMARY KEY AUTO_INCREMENT,
  `page_id` INT(11) NOT NULL,
  `stat_number` VARCHAR(50) NOT NULL,
  `stat_label` VARCHAR(255) NOT NULL,
  `updated_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  FOREIGN KEY (`page_id`) REFERENCES `inclusive_page`(`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ============================================
-- Table 4: Call to Action
-- ============================================
CREATE TABLE `inclusive_cta` (
  `id` INT(11) PRIMARY KEY AUTO_INCREMENT,
  `page_id` INT(11) NOT NULL,
  `title` VARCHAR(255) NOT NULL,
  `text` TEXT NOT NULL,
  `button_text` VARCHAR(100) DEFAULT 'Get Involved Today',
  `button_link` VARCHAR(255) DEFAULT '#',
  `updated_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  FOREIGN KEY (`page_id`) REFERENCES `inclusive_page`(`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ============================================
-- INSERT SAMPLE DATA
-- ============================================

-- Insert main page
INSERT INTO `inclusive_page` (
  `hero_title`,
  `hero_subtitle`,
  `hero_image`,
  `intro_text`
) VALUES (
  'Inclusive Community-Based Tourism',
  'Empowering Persons with Disabilities in Rural Areas',
  'assets/images/inclusive-hero.jpg',
  'Our inclusive tourism initiatives ensure that persons with disabilities can fully participate in and benefit from community-based tourism experiences. We are committed to creating accessible, welcoming, and empowering opportunities for all.'
);

-- Insert approach cards
INSERT INTO `approach_cards` (
  `page_id`,
  `number`,
  `image`,
  `title`,
  `description`
) VALUES
(1, 1, 'assets/images/inclusive-card-1.jpg', 'Accessibility First', 'We design all tourism experiences with accessibility at the core, ensuring physical, sensory, and cognitive accessibility.'),
(1, 2, 'assets/images/inclusive-card-2.jpg', 'Community Empowerment', 'Local persons with disabilities are trained and employed as guides and tourism professionals.'),
(1, 3, 'assets/images/inclusive-card-3.jpg', 'Adaptive Activities', 'We offer modified tourism activities that allow everyone to participate fully and enjoy nature.'),
(1, 4, 'assets/images/inclusive-card-4.jpg', 'Inclusive Partnerships', 'We work with disability organizations and accessibility experts to ensure best practices.');

-- Insert statistics
INSERT INTO `inclusive_stats` (
  `page_id`,
  `stat_number`,
  `stat_label`
) VALUES
(1, '500+', 'Persons with Disabilities Served'),
(1, '25+', 'Accessible Tourism Sites'),
(1, '150+', 'Local Guides Trained'),
(1, '95%', 'Visitor Satisfaction Rate');

-- Insert CTA
INSERT INTO `inclusive_cta` (
  `page_id`,
  `title`,
  `text`,
  `button_text`,
  `button_link`
) VALUES (
  1,
  'Join Our Inclusive Tourism Movement',
  'Help us create more accessible tourism experiences. Whether you are a visitor, partner, or supporter, there are many ways to get involved.',
  'Get Involved Today',
  '#contact'
);