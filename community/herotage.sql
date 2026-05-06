-- ============================================
-- Heritage Page Database Schema
-- Farm and Cultural Tourism Page
-- ============================================

-- Drop tables if they exist
DROP TABLE IF EXISTS `heritage_activities`;
DROP TABLE IF EXISTS `heritage_impacts`;
DROP TABLE IF EXISTS `heritage_benefits`;
DROP TABLE IF EXISTS `heritage_sections`;
DROP TABLE IF EXISTS `heritage_page`;

-- Table 1: Hero & Introduction Content
CREATE TABLE `heritage_page` (
  `id` INT(11) PRIMARY KEY AUTO_INCREMENT,
  `hero_title` VARCHAR(255) NOT NULL DEFAULT 'From Fields and Culture to Futures',
  `hero_subtitle` VARCHAR(255) NOT NULL DEFAULT 'Tourism as a Catalyst for Community Development',
  `hero_description` TEXT NOT NULL,
  `hero_image` VARCHAR(255) DEFAULT NULL,
  `intro_title` VARCHAR(255) NOT NULL DEFAULT 'Tourism as a Catalyst for Transformation',
  `intro_lead` TEXT NOT NULL,
  `intro_text` TEXT NOT NULL,
  `intro_image` VARCHAR(255) DEFAULT NULL,
  `intro_caption` TEXT DEFAULT NULL,
  `updated_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Table 2: Main Sections (Farm Tourism & Cultural Tourism) - STATIC TITLES
CREATE TABLE `heritage_sections` (
  `id` INT(11) PRIMARY KEY AUTO_INCREMENT,
  `section_id` VARCHAR(50) NOT NULL UNIQUE,
  `section_description` TEXT NOT NULL,
  `benefits_title` VARCHAR(255) NOT NULL,
  `display_order` INT(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Table 3: Benefits Cards
CREATE TABLE `heritage_benefits` (
  `id` INT(11) PRIMARY KEY AUTO_INCREMENT,
  `section_id` VARCHAR(50) NOT NULL,
  `benefit_title` VARCHAR(255) NOT NULL,
  `benefit_description` TEXT NOT NULL,
  `display_order` INT(11) NOT NULL,
  FOREIGN KEY (`section_id`) REFERENCES `heritage_sections`(`section_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Table 4: Activities
CREATE TABLE `heritage_activities` (
  `id` INT(11) PRIMARY KEY AUTO_INCREMENT,
  `icon_class` VARCHAR(100) NOT NULL,
  `activity_title` VARCHAR(255) NOT NULL,
  `activity_description` TEXT NOT NULL,
  `display_order` INT(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Table 5: Impact Table Rows
CREATE TABLE `heritage_impacts` (
  `id` INT(11) PRIMARY KEY AUTO_INCREMENT,
  `level_name` VARCHAR(100) NOT NULL,
  `icon_class` VARCHAR(100) NOT NULL,
  `impact_description` TEXT NOT NULL,
  `display_order` INT(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `heritage_page` (`hero_title`, `hero_subtitle`, `hero_description`, `hero_image`, `intro_title`, `intro_lead`, `intro_text`, `intro_image`, `intro_caption`) VALUES
('From Fields and Culture to Futures',
 'Tourism as a Catalyst for Community Development',
 'Discover how farm and cultural tourism transform communities, creating sustainable income while preserving heritage and supporting conservation efforts across the Virunga region.',
 'assets/images/heritage-hero.jpg',
 'Tourism as a Catalyst for Transformation',
 'In the heart of the Virunga region, tourism serves as more than just an economic activity—it becomes a powerful force for community empowerment, cultural preservation, and sustainable development.',
 'Through farm and cultural tourism, local communities transform their traditional practices into engaging visitor experiences, creating multiple income streams while maintaining their authentic way of life. This approach ensures that tourism benefits reach every level of society, from individual farmers and artists to entire nations.',
 'assets/images/heritage-intro.jpg',
 'Local communities engaging visitors in traditional farming and cultural practices');

-- Insert Main Sections (STATIC TITLES - NOT EDITABLE)
INSERT INTO `heritage_sections` (`section_id`, `section_description`, `benefits_title`, `display_order`) VALUES
('farm-tourism',
 'Farmers engaging in tourism create opportunities where agriculture becomes not only a means of food production but also a platform for visitor experiences. Farm tours, hands-on harvesting, cooking lessons, and agro-product sales transform farms into destinations of learning and leisure. This serves as a stress buster for visitors who reconnect with nature while providing a powerful income generation tool for individuals, communities, states, and even nations.',
 'Income Generation Benefits',
 1),
('cultural-tourism',
 'Cultural artists—musicians, dancers, storytellers, painters, and craftspeople—transform cultural heritage into engaging visitor experiences. Performances, workshops, festivals, and exhibitions offer travelers a chance to connect deeply with local traditions. For artists, this becomes both a source of pride and a source of livelihood.',
 'Cultural Tourism Impact',
 2);

-- Insert Benefits for Farm Tourism
INSERT INTO `heritage_benefits` (`section_id`, `benefit_title`, `benefit_description`, `display_order`) VALUES
('farm-tourism', 'Communities', 'Creates local employment (guides, cooks, artisans), sustains traditional farming practices, and strengthens rural economies.', 1),
('farm-tourism', 'Conservation', 'Encourages eco-friendly farming, biodiversity protection, and reduced land abandonment.', 2),
('farm-tourism', 'States and Countries', 'Expands rural tourism economies, increases tax revenues, diversifies GDP, and improves global image through sustainable rural tourism.', 3);

-- Insert Benefits for Cultural Tourism
INSERT INTO `heritage_benefits` (`section_id`, `benefit_title`, `benefit_description`, `display_order`) VALUES
('cultural-tourism', 'Communities', 'Funds community events, sustains traditional knowledge, empowers youth and women, and preserves languages and folklore.', 1),
('cultural-tourism', 'Conservation of Culture', 'Protects intangible heritage from erosion, ensuring traditions remain vibrant and relevant.', 2),
('cultural-tourism', 'States and Countries', 'Boosts national identity, enhances cultural diplomacy, and diversifies tourism beyond wildlife and landscapes.', 3),
('cultural-tourism', 'Society at Large', 'Promotes intercultural dialogue, tolerance, and creativity, fostering peace and social cohesion.', 4);

-- Insert Activities
INSERT INTO `heritage_activities` (`icon_class`, `activity_title`, `activity_description`, `display_order`) VALUES
('fas fa-walking', 'Farm Tours & Demonstrations', 'Guided farm tours, animal care demonstrations, and organic food tasting experiences.', 1),
('fas fa-utensils', 'Traditional Cooking Classes', 'Learn authentic recipes using fresh local produce and traditional cooking methods.', 2),
('fas fa-store', 'Artisan Craft Markets', 'Local craft markets and souvenir sales featuring handmade traditional items.', 3),
('fas fa-music', 'Music & Dance Performances', 'Traditional music and dance performances showcasing local cultural heritage.', 4),
('fas fa-fire', 'Storytelling Evenings', 'Traditional storytelling sessions around firesides sharing local folklore and history.', 5),
('fas fa-calendar-alt', 'Cultural Festivals', 'Seasonal cultural festivals showcasing local heritage, traditions, and community celebrations.', 6),
('fas fa-graduation-cap', 'Educational Workshops', 'Educational workshops designed for schools and international visitors to learn about local culture.', 7);

-- Insert Impact Table Data
INSERT INTO `heritage_impacts` (`level_name`, `icon_class`, `impact_description`, `display_order`) VALUES
('Individuals', 'fas fa-user', 'Provides alternative livelihoods, reduces poverty, enhances skills, and increases wellbeing.', 1),
('Communities', 'fas fa-users', 'Strengthens local economies, funds schools and healthcare, preserves traditions, and creates jobs.', 2),
('Conservation', 'fas fa-leaf', 'Supports sustainable farming, biodiversity protection, and safeguarding of cultural heritage.', 3),
('States', 'fas fa-landmark', 'Generates tax revenue, diversifies rural economy, reduces rural-urban migration, and supports tourism policy.', 4),
('Countries', 'fas fa-globe', 'Enhances GDP contribution, strengthens global reputation, attracts foreign investment, and boosts national branding.', 5),
('Society', 'fas fa-handshake', 'Promotes social cohesion, intercultural exchange, environmental awareness, and shared identity.', 6);