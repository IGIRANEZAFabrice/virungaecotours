CREATE TABLE `community_hero` (
  `id` INT PRIMARY KEY AUTO_INCREMENT,
  `title` VARCHAR(255) NOT NULL,
  `description` TEXT DEFAULT NULL,
  `image_url` VARCHAR(255) DEFAULT NULL,
  `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  `updated_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Insert initial community hero carousel slides data
INSERT INTO `community_hero` (`title`, `description`, `image_url`) VALUES
('Building Stronger Communities', 'Empowering local communities across Rwanda, DRC Congo, and Uganda through sustainable development, conservation, and education programs.', 'community/hero/HO2A2742.jpg'),
('Community Impact', 'Creating lasting positive change through community-based tourism and sustainable development initiatives.', 'community/hero/HO2A3286.jpg'),
('Sustainable Development', 'Working together to build a thriving future for communities and wildlife in the Virunga region.', 'community/hero/HO2A3397.jpg');

