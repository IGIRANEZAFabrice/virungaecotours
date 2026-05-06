-- ============================================
-- GORILLA PAGE - HISTORY SECTION TABLE & DATA
-- ============================================

-- Create History Section Table
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

-- Create Timeline Items Table
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

-- Insert History Section
INSERT INTO gorilla_history_section (section_name, title, subtitle, is_active, sort_order) VALUES
(
    'history-section',
    'Discovery & Conservation History',
    'From scientific discovery to conservation triumph - the remarkable journey of mountain gorilla protection',
    1,
    0
);

-- Get the history_id for inserting timeline items
SET @history_id = LAST_INSERT_ID();

-- Insert Timeline Items
INSERT INTO gorilla_timeline_items (history_id, year, event_title, event_description, sort_order) VALUES
(@history_id, '1902', 'Scientific Discovery', 'German Captain Robert von Beringe first scientifically described mountain gorillas in Rwanda\'s Virunga mountains.', 0),
(@history_id, '1925', 'First National Park', 'Volcanoes National Park created as Africa\'s first national park, specifically to protect gorillas.', 1),
(@history_id, '1960s', 'Dian Fossey\'s Research', 'Dr. Dian Fossey established Karisoke Research Center, studying and protecting gorillas for nearly two decades.', 2),
(@history_id, '1980s', 'Critical Point', 'Population dropped to fewer than 250 individuals due to poaching and habitat loss.', 3),
(@history_id, 'Today', 'Conservation Success', 'Population has grown to over 1,000 individuals thanks to dedicated conservation efforts and tourism.', 4);

-- ============================================
-- NOTES:
-- ============================================
-- gorilla_history_section table:
--   - history_id: Unique identifier
--   - section_name: Section identifier (history-section)
--   - title: Main heading
--   - subtitle: Section subtitle
--   - is_active: Display flag
--   - sort_order: Display order
--
-- gorilla_timeline_items table:
--   - timeline_id: Unique identifier
--   - history_id: Foreign key to history section
--   - year: Timeline year/period
--   - event_title: Event title
--   - event_description: Event description
--   - sort_order: Display order (chronological)

