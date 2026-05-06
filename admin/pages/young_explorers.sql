-- Young Explorers Section Database Schema
-- Simplified schema with only essential fields

DROP TABLE IF EXISTS `young_explorers`;

CREATE TABLE IF NOT EXISTS `young_explorers` (
  `id` INT(11) PRIMARY KEY AUTO_INCREMENT,
  `section_description` TEXT NOT NULL,
  `image_url` VARCHAR(255) DEFAULT NULL,
  `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  `updated_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Insert default data
INSERT INTO `young_explorers` (`section_description`, `image_url`) VALUES
(
  'Virunga Ecotours bridges the gap created by age restrictions in Volcanoes National Park by offering safe, engaging, and educational opportunities for children under 13 and 15 years old. While parents explore the gorillas and golden monkeys, kids embark on tailored programs that spark creativity, build cultural awareness, and inspire curiosity about nature.\n\nThese experiences ensure that family travel is inclusive, meaningful, and enriching for every member. Children are not only entertained but also guided through structured activities that combine fun with learning—ranging from games and arts to conservation-inspired discovery. Parents enjoy their park adventures with peace of mind, knowing their children are equally immersed in purposeful exploration.',
  ''
);