-- ============================================
-- GORILLA PAGE - INTRO SECTION TABLE & DATA
-- ============================================

-- Create Intro Section Table
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

-- Create Intro Highlights Table
CREATE TABLE IF NOT EXISTS gorilla_intro_highlights (
    highlight_id INT AUTO_INCREMENT PRIMARY KEY,
    intro_id INT NOT NULL,
    icon_class VARCHAR(100) NOT NULL,
    highlight_text VARCHAR(255) NOT NULL,
    sort_order INT DEFAULT 0,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (intro_id) REFERENCES gorilla_intro_section(intro_id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Insert Intro Section Content
INSERT INTO gorilla_intro_section (section_name, title, description, image_url, image_caption, is_active, sort_order) VALUES
(
    'intro-section',
    'Our Closest Living Relatives',
    'Mountain gorillas share 98% of their DNA with humans, making them our closest relatives both genetically and socially. These magnificent apes live in only two regions on Earth, and their story is one of remarkable conservation success.',
    '../images/gorilla/under.jpg',
    'Mountain gorilla kids playing',
    1,
    0
);

-- Get the intro_id for inserting highlights
SET @intro_id = LAST_INSERT_ID();

-- Insert Intro Highlights
INSERT INTO gorilla_intro_highlights (intro_id, icon_class, highlight_text, sort_order) VALUES
(@intro_id, 'fas fa-dna', 'Genetically closest to humans after chimpanzees', 0),
(@intro_id, 'fas fa-mountain', 'Live at 2,200-4,300m elevation', 1),
(@intro_id, 'fas fa-leaf', 'Consume up to 30kg of vegetation daily', 2),
(@intro_id, 'fas fa-users', 'Live in families led by silverback males', 3);

-- ============================================
-- NOTES:
-- ============================================
-- gorilla_intro_section table:
--   - intro_id: Unique identifier
--   - section_name: Section identifier (intro-section)
--   - title: Main heading
--   - description: Main description text
--   - image_url: Section image path
--   - image_caption: Image caption text
--   - is_active: Display flag
--   - sort_order: Display order
--
-- gorilla_intro_highlights table:
--   - highlight_id: Unique identifier
--   - intro_id: Foreign key to intro section
--   - icon_class: FontAwesome icon class
--   - highlight_text: Highlight text
--   - sort_order: Display order

