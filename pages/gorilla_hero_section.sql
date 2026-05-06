-- ============================================
-- GORILLA PAGE - HERO SECTION TABLE & DATA
-- ============================================

-- Create Hero Section Table
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

-- Insert Hero Section Content
INSERT INTO gorilla_hero_section (section_name, title, subtitle, background_image_url, is_active, sort_order) VALUES
(
    'hero-section',
    'Mountain Gorillas of the Virunga Massif',
    'Discover the incredible world of mountain gorillas across Rwanda, Uganda, and DRC. Meet 62+ gorilla families, learn their stories, and join the conservation journey that saved them from extinction.',
    '../images/gorilla/hero2.jpg',
    1,
    0
);

-- ============================================
-- NOTES:
-- ============================================
-- This table stores the hero section content
-- Fields:
--   - hero_id: Unique identifier
--   - section_name: Section identifier (hero-section)
--   - title: Main heading
--   - subtitle: Subheading/description
--   - background_image_url: Hero background image path
--   - is_active: Display flag (1 = show, 0 = hide)
--   - sort_order: Display order
--   - created_at: Creation timestamp
--   - updated_at: Last update timestamp

