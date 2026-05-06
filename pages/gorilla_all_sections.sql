-- ============================================
-- GORILLA PAGE - ALL SECTIONS MASTER SQL
-- ============================================
-- This file contains all tables and data for:
-- 1. Hero Section
-- 2. Intro Section
-- 3. History Section
-- 4. Habitat Section
-- 5. Discounts Section
-- 6. Conservation Section
-- ============================================

-- ============================================
-- 1. HERO SECTION
-- ============================================

CREATE TABLE IF NOT EXISTS gorilla_hero_section (
    hero_id INT AUTO_INCREMENT PRIMARY KEY,
    section_name VARCHAR(100) NOT NULL DEFAULT 'hero-section',
    title VARCHAR(255) NOT NULL,
    subtitle TEXT NOT NULL,
    background_image_url VARCHAR(500),
    is_active TINYINT(1) DEFAULT 1,
    sort_order INT DEFAULT 0,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO gorilla_hero_section (section_name, title, subtitle, background_image_url, is_active, sort_order) VALUES
('hero-section', 'Mountain Gorillas of the Virunga Massif', 'Discover the incredible world of mountain gorillas across Rwanda, Uganda, and DRC. Meet 62+ gorilla families, learn their stories, and join the conservation journey that saved them from extinction.', '../images/gorilla/hero2.jpg', 1, 0);

-- ============================================
-- 2. INTRO SECTION
-- ============================================

CREATE TABLE IF NOT EXISTS gorilla_intro_section (
    intro_id INT AUTO_INCREMENT PRIMARY KEY,
    section_name VARCHAR(100) NOT NULL DEFAULT 'intro-section',
    title VARCHAR(255) NOT NULL,
    description LONGTEXT NOT NULL,
    image_url VARCHAR(500),
    image_caption VARCHAR(255),
    is_active TINYINT(1) DEFAULT 1,
    sort_order INT DEFAULT 0,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS gorilla_intro_highlights (
    highlight_id INT AUTO_INCREMENT PRIMARY KEY,
    intro_id INT NOT NULL,
    icon_class VARCHAR(100) NOT NULL,
    highlight_text VARCHAR(255) NOT NULL,
    sort_order INT DEFAULT 0,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (intro_id) REFERENCES gorilla_intro_section(intro_id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO gorilla_intro_section (section_name, title, description, image_url, image_caption, is_active, sort_order) VALUES
('intro-section', 'Our Closest Living Relatives', 'Mountain gorillas share 98% of their DNA with humans, making them our closest relatives both genetically and socially. These magnificent apes live in only two regions on Earth, and their story is one of remarkable conservation success.', '../images/gorilla/under.jpg', 'Mountain gorilla kids playing', 1, 0);

SET @intro_id = LAST_INSERT_ID();

INSERT INTO gorilla_intro_highlights (intro_id, icon_class, highlight_text, sort_order) VALUES
(@intro_id, 'fas fa-dna', 'Genetically closest to humans after chimpanzees', 0),
(@intro_id, 'fas fa-mountain', 'Live at 2,200-4,300m elevation', 1),
(@intro_id, 'fas fa-leaf', 'Consume up to 30kg of vegetation daily', 2),
(@intro_id, 'fas fa-users', 'Live in families led by silverback males', 3);

-- ============================================
-- 3. HISTORY SECTION
-- ============================================

CREATE TABLE IF NOT EXISTS gorilla_history_section (
    history_id INT AUTO_INCREMENT PRIMARY KEY,
    section_name VARCHAR(100) NOT NULL DEFAULT 'history-section',
    title VARCHAR(255) NOT NULL,
    subtitle VARCHAR(255),
    is_active TINYINT(1) DEFAULT 1,
    sort_order INT DEFAULT 0,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS gorilla_timeline_items (
    timeline_id INT AUTO_INCREMENT PRIMARY KEY,
    history_id INT NOT NULL,
    year VARCHAR(50) NOT NULL,
    event_title VARCHAR(255) NOT NULL,
    event_description LONGTEXT NOT NULL,
    sort_order INT DEFAULT 0,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (history_id) REFERENCES gorilla_history_section(history_id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO gorilla_history_section (section_name, title, subtitle, is_active, sort_order) VALUES
('history-section', 'Discovery & Conservation History', 'From scientific discovery to conservation triumph - the remarkable journey of mountain gorilla protection', 1, 0);

SET @history_id = LAST_INSERT_ID();

INSERT INTO gorilla_timeline_items (history_id, year, event_title, event_description, sort_order) VALUES
(@history_id, '1902', 'Scientific Discovery', 'German Captain Robert von Beringe first scientifically described mountain gorillas in Rwanda\'s Virunga mountains.', 0),
(@history_id, '1925', 'First National Park', 'Volcanoes National Park created as Africa\'s first national park, specifically to protect gorillas.', 1),
(@history_id, '1960s', 'Dian Fossey\'s Research', 'Dr. Dian Fossey established Karisoke Research Center, studying and protecting gorillas for nearly two decades.', 2),
(@history_id, '1980s', 'Critical Point', 'Population dropped to fewer than 250 individuals due to poaching and habitat loss.', 3),
(@history_id, 'Today', 'Conservation Success', 'Population has grown to over 1,000 individuals thanks to dedicated conservation efforts and tourism.', 4);

-- ============================================
-- 4. HABITAT SECTION
-- ============================================

CREATE TABLE IF NOT EXISTS gorilla_habitat_section (
    habitat_id INT AUTO_INCREMENT PRIMARY KEY,
    section_name VARCHAR(100) NOT NULL DEFAULT 'habitat-section',
    title VARCHAR(255) NOT NULL,
    subtitle VARCHAR(255),
    is_active TINYINT(1) DEFAULT 1,
    sort_order INT DEFAULT 0,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS gorilla_habitat_cards (
    card_id INT AUTO_INCREMENT PRIMARY KEY,
    habitat_id INT NOT NULL,
    card_title VARCHAR(255) NOT NULL,
    card_subtitle VARCHAR(255),
    card_description LONGTEXT NOT NULL,
    image_url VARCHAR(500),
    overlay_title VARCHAR(255),
    gorilla_population VARCHAR(100),
    stat1_icon VARCHAR(100),
    stat1_text VARCHAR(255),
    stat2_icon VARCHAR(100),
    stat2_text VARCHAR(255),
    sort_order INT DEFAULT 0,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (habitat_id) REFERENCES gorilla_habitat_section(habitat_id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS gorilla_habitat_locations (
    location_id INT AUTO_INCREMENT PRIMARY KEY,
    card_id INT NOT NULL,
    country VARCHAR(100) NOT NULL,
    park_name VARCHAR(255) NOT NULL,
    sort_order INT DEFAULT 0,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (card_id) REFERENCES gorilla_habitat_cards(card_id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO gorilla_habitat_section (section_name, title, subtitle, is_active, sort_order) VALUES
('habitat-section', 'Where Mountain Gorillas Live', 'Mountain gorillas exist in only two regions on Earth, making them one of the world\'s most endangered species', 1, 0);

SET @habitat_id = LAST_INSERT_ID();

INSERT INTO gorilla_habitat_cards (habitat_id, card_title, card_subtitle, card_description, image_url, overlay_title, gorilla_population, stat1_icon, stat1_text, stat2_icon, stat2_text, sort_order) VALUES
(@habitat_id, 'The Virunga Massif', 'Transboundary Conservation Area', 'A transboundary conservation area spanning three countries:', '../images/gorillas/virunga-massif.jpg', 'Virunga Massif', '~400 gorillas', 'fas fa-users', '~400 gorillas', 'fas fa-mountain', '8 volcanoes', 0),
(@habitat_id, 'Bwindi-Mgahinga Ecosystem', 'Ancient Montane Forest', 'Ancient montane forest ecosystem:', '../images/gorillas/bwindi.jpg', 'Bwindi-Mgahinga', '~600 gorillas', 'fas fa-users', '~600 gorillas', 'fas fa-tree', 'Ancient forest', 1);

SET @card_id_1 = LAST_INSERT_ID() - 1;
SET @card_id_2 = LAST_INSERT_ID();

INSERT INTO gorilla_habitat_locations (card_id, country, park_name, sort_order) VALUES
(@card_id_1, 'Rwanda', 'Volcanoes National Park', 0),
(@card_id_1, 'Uganda', 'Mgahinga Gorilla National Park', 1),
(@card_id_1, 'DRC', 'Virunga National Park', 2),
(@card_id_2, 'Uganda', 'Bwindi Impenetrable National Park', 0),
(@card_id_2, 'DRC', 'Sarambwe Reserve (connected)', 1);

-- ============================================
-- 5. CONSERVATION SECTION
-- ============================================

CREATE TABLE IF NOT EXISTS gorilla_conservation_section (
    conservation_id INT AUTO_INCREMENT PRIMARY KEY,
    section_name VARCHAR(100) NOT NULL DEFAULT 'conservation-section',
    title VARCHAR(255) NOT NULL,
    description LONGTEXT NOT NULL,
    is_active TINYINT(1) DEFAULT 1,
    sort_order INT DEFAULT 0,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS gorilla_conservation_benefits (
    benefit_id INT AUTO_INCREMENT PRIMARY KEY,
    conservation_id INT NOT NULL,
    icon_class VARCHAR(100) NOT NULL,
    benefit_title VARCHAR(255) NOT NULL,
    benefit_description VARCHAR(255),
    sort_order INT DEFAULT 0,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (conservation_id) REFERENCES gorilla_conservation_section(conservation_id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS gorilla_conservation_stats (
    stat_id INT AUTO_INCREMENT PRIMARY KEY,
    conservation_id INT NOT NULL,
    stat_number VARCHAR(100) NOT NULL,
    stat_label VARCHAR(255) NOT NULL,
    is_success TINYINT(1) DEFAULT 0,
    sort_order INT DEFAULT 0,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (conservation_id) REFERENCES gorilla_conservation_section(conservation_id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO gorilla_conservation_section (section_name, title, description, is_active, sort_order) VALUES
('conservation-section', 'Conservation Success Through Tourism', 'Tourism is the backbone of gorilla conservation, providing crucial funding and community benefits that ensure the survival of these magnificent creatures.', 1, 0);

SET @conservation_id = LAST_INSERT_ID();

INSERT INTO gorilla_conservation_benefits (conservation_id, icon_class, benefit_title, benefit_description, sort_order) VALUES
(@conservation_id, 'fas fa-shield-alt', 'Protection', 'Ranger salaries and anti-poaching patrols', 0),
(@conservation_id, 'fas fa-stethoscope', 'Healthcare', 'Veterinary care and health monitoring', 1),
(@conservation_id, 'fas fa-school', 'Communities', 'Schools, clinics, and water systems', 2),
(@conservation_id, 'fas fa-coins', 'Revenue Sharing', 'Direct benefits to local villages', 3);

INSERT INTO gorilla_conservation_stats (conservation_id, stat_number, stat_label, is_success, sort_order) VALUES
(@conservation_id, '250', 'Population in 1980s', 0, 0),
(@conservation_id, '1,000+', 'Population Today', 1, 1);

-- ============================================
-- SUMMARY
-- ============================================
-- Total Tables Created: 13
-- 1. gorilla_hero_section
-- 2. gorilla_intro_section
-- 3. gorilla_intro_highlights
-- 4. gorilla_history_section
-- 5. gorilla_timeline_items
-- 6. gorilla_habitat_section
-- 7. gorilla_habitat_cards
-- 8. gorilla_habitat_locations
-- 9. gorilla_conservation_section
-- 10. gorilla_conservation_benefits
-- 11. gorilla_conservation_stats
-- 12. gorilla_discounts_section (separate file)
-- 13. gorilla_discount_cards (separate file)
-- ============================================

