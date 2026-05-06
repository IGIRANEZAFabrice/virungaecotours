-- ============================================
-- GORILLA PAGE - CONSERVATION SECTION TABLE & DATA
-- ============================================

-- Create Conservation Section Table
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

-- Create Conservation Benefits Table
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

-- Create Conservation Statistics Table
CREATE TABLE IF NOT EXISTS gorilla_conservation_stats (
    stat_id INT AUTO_INCREMENT PRIMARY KEY,
    conservation_id INT NOT NULL,
    stat_number VARCHAR(100) NOT NULL,
    stat_label VARCHAR(255) NOT NULL,
    is_success TINYINT(1) DEFAULT 0, -- 1 for success/current, 0 for past
    sort_order INT DEFAULT 0,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (conservation_id) REFERENCES gorilla_conservation_section(conservation_id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Insert Conservation Section
INSERT INTO gorilla_conservation_section (section_name, title, description, is_active, sort_order) VALUES
(
    'conservation-section',
    'Conservation Success Through Tourism',
    'Tourism is the backbone of gorilla conservation, providing crucial funding and community benefits that ensure the survival of these magnificent creatures.',
    1,
    0
);

-- Get the conservation_id
SET @conservation_id = LAST_INSERT_ID();

-- Insert Conservation Benefits
INSERT INTO gorilla_conservation_benefits (conservation_id, icon_class, benefit_title, benefit_description, sort_order) VALUES
(@conservation_id, 'fas fa-shield-alt', 'Protection', 'Ranger salaries and anti-poaching patrols', 0),
(@conservation_id, 'fas fa-stethoscope', 'Healthcare', 'Veterinary care and health monitoring', 1),
(@conservation_id, 'fas fa-school', 'Communities', 'Schools, clinics, and water systems', 2),
(@conservation_id, 'fas fa-coins', 'Revenue Sharing', 'Direct benefits to local villages', 3);

-- Insert Conservation Statistics
INSERT INTO gorilla_conservation_stats (conservation_id, stat_number, stat_label, is_success, sort_order) VALUES
(@conservation_id, '250', 'Population in 1980s', 0, 0),
(@conservation_id, '1,000+', 'Population Today', 1, 1);

-- ============================================
-- NOTES:
-- ============================================
-- gorilla_conservation_section table:
--   - conservation_id: Unique identifier
--   - section_name: Section identifier (conservation-section)
--   - title: Main heading
--   - description: Main description
--   - is_active: Display flag
--   - sort_order: Display order
--
-- gorilla_conservation_benefits table:
--   - benefit_id: Unique identifier
--   - conservation_id: Foreign key to conservation section
--   - icon_class: FontAwesome icon class
--   - benefit_title: Benefit title
--   - benefit_description: Benefit description
--   - sort_order: Display order
--
-- gorilla_conservation_stats table:
--   - stat_id: Unique identifier
--   - conservation_id: Foreign key to conservation section
--   - stat_number: Statistic number/value
--   - stat_label: Statistic label
--   - is_success: Flag for success/current stats (1) vs past stats (0)
--   - sort_order: Display order

