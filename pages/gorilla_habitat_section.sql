-- ============================================
-- GORILLA PAGE - HABITAT SECTION TABLE & DATA
-- ============================================

-- Create Habitat Section Table
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

-- Create Habitat Cards Table
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

-- Create Habitat Locations Table
CREATE TABLE IF NOT EXISTS gorilla_habitat_locations (
    location_id INT AUTO_INCREMENT PRIMARY KEY,
    card_id INT NOT NULL,
    country VARCHAR(100) NOT NULL,
    park_name VARCHAR(255) NOT NULL,
    sort_order INT DEFAULT 0,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (card_id) REFERENCES gorilla_habitat_cards(card_id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Insert Habitat Section
INSERT INTO gorilla_habitat_section (section_name, title, subtitle, is_active, sort_order) VALUES
(
    'habitat-section',
    'Where Mountain Gorillas Live',
    'Mountain gorillas exist in only two regions on Earth, making them one of the world\'s most endangered species',
    1,
    0
);

-- Get the habitat_id
SET @habitat_id = LAST_INSERT_ID();

-- Insert Virunga Massif Card
INSERT INTO gorilla_habitat_cards (habitat_id, card_title, card_subtitle, card_description, image_url, overlay_title, gorilla_population, stat1_icon, stat1_text, stat2_icon, stat2_text, sort_order) VALUES
(@habitat_id, 'The Virunga Massif', 'Transboundary Conservation Area', 'A transboundary conservation area spanning three countries:', '../images/gorillas/virunga-massif.jpg', 'Virunga Massif', '~400 gorillas', 'fas fa-users', '~400 gorillas', 'fas fa-mountain', '8 volcanoes', 0);

SET @card_id_1 = LAST_INSERT_ID();

-- Insert Virunga Locations
INSERT INTO gorilla_habitat_locations (card_id, country, park_name, sort_order) VALUES
(@card_id_1, 'Rwanda', 'Volcanoes National Park', 0),
(@card_id_1, 'Uganda', 'Mgahinga Gorilla National Park', 1),
(@card_id_1, 'DRC', 'Virunga National Park', 2);

-- Insert Bwindi-Mgahinga Card
INSERT INTO gorilla_habitat_cards (habitat_id, card_title, card_subtitle, card_description, image_url, overlay_title, gorilla_population, stat1_icon, stat1_text, stat2_icon, stat2_text, sort_order) VALUES
(@habitat_id, 'Bwindi-Mgahinga Ecosystem', 'Ancient Montane Forest', 'Ancient montane forest ecosystem:', '../images/gorillas/bwindi.jpg', 'Bwindi-Mgahinga', '~600 gorillas', 'fas fa-users', '~600 gorillas', 'fas fa-tree', 'Ancient forest', 1);

SET @card_id_2 = LAST_INSERT_ID();

-- Insert Bwindi Locations
INSERT INTO gorilla_habitat_locations (card_id, country, park_name, sort_order) VALUES
(@card_id_2, 'Uganda', 'Bwindi Impenetrable National Park', 0),
(@card_id_2, 'DRC', 'Sarambwe Reserve (connected)', 1);

-- ============================================
-- NOTES:
-- ============================================
-- gorilla_habitat_section table:
--   - habitat_id: Unique identifier
--   - section_name: Section identifier (habitat-section)
--   - title: Main heading
--   - subtitle: Section subtitle
--   - is_active: Display flag
--   - sort_order: Display order
--
-- gorilla_habitat_cards table:
--   - card_id: Unique identifier
--   - habitat_id: Foreign key to habitat section
--   - card_title: Card title
--   - card_subtitle: Card subtitle
--   - card_description: Card description
--   - image_url: Card image path
--   - overlay_title: Image overlay title
--   - gorilla_population: Population info
--   - stat1_icon, stat1_text: First statistic
--   - stat2_icon, stat2_text: Second statistic
--   - sort_order: Display order
--
-- gorilla_habitat_locations table:
--   - location_id: Unique identifier
--   - card_id: Foreign key to habitat card
--   - country: Country name
--   - park_name: Park/reserve name
--   - sort_order: Display order

