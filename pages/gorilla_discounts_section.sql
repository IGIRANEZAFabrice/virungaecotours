-- ============================================
-- GORILLA PAGE - DISCOUNTS SECTION TABLE & DATA
-- ============================================

-- Create Discounts Section Table
CREATE TABLE IF NOT EXISTS gorilla_discounts_section (
    discount_id INT AUTO_INCREMENT PRIMARY KEY,
    section_name VARCHAR(100) NOT NULL DEFAULT 'discounts-section',
    title VARCHAR(255) NOT NULL,
    subtitle VARCHAR(255),
    is_active TINYINT(1) DEFAULT 1,
    sort_order INT DEFAULT 0,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Create Discount Cards Table
CREATE TABLE IF NOT EXISTS gorilla_discount_cards (
    card_id INT AUTO_INCREMENT PRIMARY KEY,
    discount_id INT NOT NULL,
    card_type VARCHAR(50) NOT NULL, -- 'discount', 'service', 'fee', 'notice'
    icon_class VARCHAR(100),
    title VARCHAR(255) NOT NULL,
    badge_text VARCHAR(100),
    content LONGTEXT,
    sort_order INT DEFAULT 0,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (discount_id) REFERENCES gorilla_discounts_section(discount_id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Create Discount Details Table
CREATE TABLE IF NOT EXISTS gorilla_discount_details (
    detail_id INT AUTO_INCREMENT PRIMARY KEY,
    card_id INT NOT NULL,
    detail_type VARCHAR(50), -- 'heading', 'paragraph', 'list_item', 'price_comparison'
    detail_content LONGTEXT,
    sort_order INT DEFAULT 0,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (card_id) REFERENCES gorilla_discount_cards(card_id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Insert Discounts Section
INSERT INTO gorilla_discounts_section (section_name, title, subtitle, is_active, sort_order) VALUES
(
    'discounts-section',
    'Gorilla Trekking Discounts & Special Offers',
    'Discover exclusive discounts and special pricing for gorilla trekking experiences across the Virunga Massif',
    1,
    0
);

-- Get the discount_id
SET @discount_id = LAST_INSERT_ID();

-- Insert Low Season Discount Card
INSERT INTO gorilla_discount_cards (discount_id, card_type, icon_class, title, badge_text, content, sort_order) VALUES
(@discount_id, 'discount', 'fas fa-cloud-rain', 'Low Season Discounts', 'Up to 50% Off', 'Low season typically falls during March-May and October-November when weather is wetter and trails are muddier, but wildlife viewing remains excellent.', 0);

SET @card_id_1 = LAST_INSERT_ID();

-- Insert Low Season Details
INSERT INTO gorilla_discount_details (card_id, detail_type, detail_content, sort_order) VALUES
(@card_id_1, 'heading', 'What is Low Season?', 0),
(@card_id_1, 'paragraph', 'Low season typically falls during March-May and October-November when weather is wetter and trails are muddier, but wildlife viewing remains excellent.', 1),
(@card_id_1, 'heading', 'DRC Virunga National Park Example:', 2),
(@card_id_1, 'price_comparison', 'Regular Season: $400 → Low Season: $200', 3),
(@card_id_1, 'heading', 'Conditions & Requirements:', 4),
(@card_id_1, 'list_item', 'Must travel during designated low-season periods', 5),
(@card_id_1, 'list_item', 'Permits must be booked in advance', 6),
(@card_id_1, 'list_item', 'Limited availability (64 permits daily in Virunga NP)', 7),
(@card_id_1, 'list_item', 'Weather preparation required (rain gear, proper boots)', 8);

-- Insert Conference Delegate Discount Card
INSERT INTO gorilla_discount_cards (discount_id, card_type, icon_class, title, badge_text, content, sort_order) VALUES
(@discount_id, 'discount', 'fas fa-users', 'RDB Conference Delegate Discount', '15% Off', 'Rwanda Development Board offers exclusive discounts for registered conference (MICE) delegates who trek before or after their event.', 1);

SET @card_id_2 = LAST_INSERT_ID();

-- Insert Conference Details
INSERT INTO gorilla_discount_details (card_id, detail_type, detail_content, sort_order) VALUES
(@card_id_2, 'heading', 'Special Offer for Conference Delegates', 0),
(@card_id_2, 'paragraph', 'Rwanda Development Board offers exclusive discounts for registered conference (MICE) delegates who trek before or after their event.', 1),
(@card_id_2, 'price_comparison', 'Standard Price: $1,500 → Conference Rate: $1,275', 2),
(@card_id_2, 'heading', 'How to Apply:', 3),
(@card_id_2, 'list_item', 'Visit RDB booking portal → Conference Discount section', 4),
(@card_id_2, 'list_item', 'Select activity, date, and number of permits', 5),
(@card_id_2, 'list_item', 'Upload conference registration proof', 6),
(@card_id_2, 'list_item', 'Submit and complete online payment', 7),
(@card_id_2, 'heading', 'Eligibility Requirements:', 8),
(@card_id_2, 'list_item', 'Proof of official conference delegate status', 9),
(@card_id_2, 'list_item', 'Trek dates before or after conference', 10),
(@card_id_2, 'list_item', 'Application via RDB portal (not at park gates)', 11),
(@card_id_2, 'list_item', 'Processing time as shown on portal', 12);

-- ============================================
-- NOTES:
-- ============================================
-- gorilla_discounts_section table:
--   - discount_id: Unique identifier
--   - section_name: Section identifier (discounts-section)
--   - title: Main heading
--   - subtitle: Section subtitle
--   - is_active: Display flag
--   - sort_order: Display order
--
-- gorilla_discount_cards table:
--   - card_id: Unique identifier
--   - discount_id: Foreign key to discounts section
--   - card_type: Type of card (discount, service, fee, notice)
--   - icon_class: FontAwesome icon class
--   - title: Card title
--   - badge_text: Badge text (e.g., "Up to 50% Off")
--   - content: Card content
--   - sort_order: Display order
--
-- gorilla_discount_details table:
--   - detail_id: Unique identifier
--   - card_id: Foreign key to discount card
--   - detail_type: Type of detail (heading, paragraph, list_item, price_comparison)
--   - detail_content: Detail content
--   - sort_order: Display order

