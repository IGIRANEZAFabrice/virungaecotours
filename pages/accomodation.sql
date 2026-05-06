-- ============================================
-- Virunga Volcanoes Accommodation Database
-- ============================================
--
-- IMPORTANT: Hero Images Storage
-- ============================================
-- Hero images are uploaded to: /images/accommodation/
-- The database stores ONLY the image URL path
-- Hero content (heading, subheading) is HARDCODED in frontend
--
-- Directory structure:
-- /images/accommodation/
--   ├── .htaccess (security file)
--   ├── index.php (prevents directory listing)
--   └── [uploaded hero images]
--
-- File upload requirements:
-- - Supported formats: JPG, PNG, GIF, WebP
-- - Maximum file size: 5MB
-- - Files are automatically renamed with timestamp and unique ID
-- - Old files are deleted when hero images are removed
--
-- Frontend: /pages/accomodation.php
-- - Fetches latest image_url from database
-- - Uses hardcoded hero heading and subheading
-- - Displays hero section with background image
--
-- ============================================

-- Drop tables if they exist (for clean installation)
DROP TABLE IF EXISTS accommodation_amenities;
DROP TABLE IF EXISTS amenities;
DROP TABLE IF EXISTS accommodation_hero_images;
DROP TABLE IF EXISTS accommodations;
DROP TABLE IF EXISTS accommodation_tiers;
DROP TABLE IF EXISTS market_segments;

-- ============================================
-- Table: accommodation_tiers
-- ============================================
CREATE TABLE accommodation_tiers (
    tier_id INT AUTO_INCREMENT PRIMARY KEY,
    tier_name VARCHAR(50) NOT NULL UNIQUE,
    tier_label VARCHAR(50) NOT NULL,
    tier_description TEXT,
    badge_color VARCHAR(20),
    sort_order INT DEFAULT 0,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ============================================
-- Table: accommodations
-- ============================================
CREATE TABLE accommodations (
    accommodation_id INT AUTO_INCREMENT PRIMARY KEY,
    tier_id INT NOT NULL,
    name VARCHAR(255) NOT NULL,
    slug VARCHAR(255) UNIQUE,
    location VARCHAR(255),
    price_min DECIMAL(10, 2),
    price_max DECIMAL(10, 2),
    price_display VARCHAR(100),
    price_unit VARCHAR(50) DEFAULT 'per night',
    currency VARCHAR(10) DEFAULT 'USD',
    short_description TEXT,
    full_description TEXT,
    accommodation_type VARCHAR(50),
    includes TEXT,
    guest_capacity INT,
    image_url VARCHAR(500),
    booking_url VARCHAR(500),
    phone VARCHAR(50),
    email VARCHAR(100),
    is_active TINYINT(1) DEFAULT 1,
    featured TINYINT(1) DEFAULT 0,
    sort_order INT DEFAULT 0,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (tier_id) REFERENCES accommodation_tiers(tier_id) ON DELETE CASCADE,
    INDEX idx_tier (tier_id),
    INDEX idx_active (is_active),
    INDEX idx_featured (featured)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ============================================
-- Table: accommodation_hero_images
-- ============================================
-- SIMPLIFIED: Only stores image_url
-- Hero content (heading, subheading) is hardcoded in frontend
-- ============================================
CREATE TABLE accommodation_hero_images (
    hero_id INT AUTO_INCREMENT PRIMARY KEY,
    image_url VARCHAR(500) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    INDEX idx_created (created_at)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ============================================
-- Table: market_segments
-- ============================================
CREATE TABLE market_segments (
    segment_id INT AUTO_INCREMENT PRIMARY KEY,
    segment_name VARCHAR(100) NOT NULL,
    segment_title VARCHAR(255) NOT NULL,
    description TEXT,
    target_regions TEXT,
    typical_accommodations TEXT,
    sort_order INT DEFAULT 0,
    is_active TINYINT(1) DEFAULT 1,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ============================================
-- Table: amenities
-- ============================================
CREATE TABLE amenities (
    amenity_id INT AUTO_INCREMENT PRIMARY KEY,
    amenity_name VARCHAR(100) NOT NULL UNIQUE,
    amenity_icon VARCHAR(50),
    category VARCHAR(50),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ============================================
-- Table: accommodation_amenities (junction table)
-- ============================================
CREATE TABLE accommodation_amenities (
    accommodation_id INT,
    amenity_id INT,
    PRIMARY KEY (accommodation_id, amenity_id),
    FOREIGN KEY (accommodation_id) REFERENCES accommodations(accommodation_id) ON DELETE CASCADE,
    FOREIGN KEY (amenity_id) REFERENCES amenities(amenity_id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ============================================
-- INSERT DATA: accommodation_tiers
-- ============================================
INSERT INTO accommodation_tiers (tier_name, tier_label, tier_description, badge_color, sort_order) VALUES
('budget', 'Budget', 'Affordable homestays and guesthouses offering authentic local experiences with essential comforts', '#a68c69', 1),
('mid-range', 'Mid-Range', 'Boutique lodges and villas providing enhanced comfort, good meals, and arranged activities', '#a04e1b', 2),
('luxury', 'Luxury', 'Ultra-luxury eco-lodges with private villas, all-inclusive packages, and exclusive conservation experiences', '#016905', 3);

-- ============================================
-- INSERT DATA: accommodations
-- ============================================

-- Budget Accommodations
INSERT INTO accommodations (tier_id, name, slug, location, price_min, price_max, price_display, price_unit, short_description, full_description, accommodation_type, includes, is_active, featured, sort_order) VALUES
(1, 'Virunga Homestay', 'virunga-homestay', 'Musanze / Kinigi', 20.00, 90.00, '$20–90 / night', 'per night', 
'Family-run homestay offering cultural stays with local meals. Basic rooms start at $20–40, with private rooms available.', 
'Family-run homestay near Musanze/Kinigi offering authentic cultural stays with local meals. Basic rooms range from $20–40, with private rooms at higher rates. Perfect for independent travelers and volunteers seeking genuine community connection and authentic Rwandan hospitality.', 
'Homestay', 'Local meals, cultural experiences, basic amenities, community interaction', 1, 1, 1),

(1, 'Hotel Muhabura', 'hotel-muhabura', 'Musanze', 60.00, 100.00, '$60–100 / night', 'per night',
'Traditional guesthouse close to town and park access. Simple double/twin rooms with reliable amenities.', 
'Traditional guesthouse conveniently located close to Musanze town and park access points. Offers simple double/twin rooms with reliable amenities—a trusted budget option for gorilla trekkers looking for comfort and convenience without luxury pricing.', 
'Guesthouse', 'Double/twin rooms, basic breakfast, close to town', 1, 0, 2),

(1, 'Amahoro Guest House', 'amahoro-guest-house', 'Ruhengeri / Musanze', 50.00, 70.00, '$50–70 / night', 'per night',
'Local guesthouse with basic B&B comforts, conveniently located near town and park transfer meeting points.', 
'Local guesthouse offering basic B&B comforts in the heart of Ruhengeri/Musanze. Conveniently positioned near town center and park transfer meeting points, making it ideal for budget-conscious travelers who value location and simplicity.', 
'Guesthouse', 'Bed & breakfast, basic comforts, convenient location', 1, 0, 3);

-- Mid-Range Accommodations
INSERT INTO accommodations (tier_id, name, slug, location, price_min, price_max, price_display, price_unit, short_description, full_description, accommodation_type, includes, is_active, featured, sort_order) VALUES
(2, 'Amakoro Songa Lodge', 'amakoro-songa-lodge', 'Near Volcanoes NP', 160.00, 2100.00, '$160–2,100 / night', 'per night',
'Upscale boutique lodge close to Volcanoes National Park. Offers excellent meals and arranged transfers/activities.', 
'Upscale boutique lodge positioned close to Volcanoes National Park entrance. Features excellent cuisine, arranged transfers, and organized activities. Rates vary by room type, package inclusions, and season. Perfect for travelers seeking enhanced comfort with authentic mountain lodge atmosphere.', 
'Boutique Lodge', 'Quality meals, arranged transfers, activities, boutique experience', 1, 1, 1),

(2, 'The Bishop\'s House', 'the-bishops-house', 'Musanze / Ruhengeri', 200.00, 400.00, 'Mid-range seasonal', 'per night',
'All-inclusive-style property offering comfortable accommodations. Conference and group-friendly.', 
'All-inclusive-style property in Musanze/Ruhengeri offering comfortable accommodations with flexible amenities. Particularly well-suited for conferences and group bookings. Seasonal rates vary—check for specific dates and group packages.', 
'Hotel', 'All-inclusive meals, conference facilities, group-friendly', 1, 0, 2),

(2, 'Farmhouse Rwanda', 'farmhouse-rwanda', 'Foothills / Private Villa', 150.00, 600.00, '$150–600+ / night', 'per night',
'Working farm and boutique villa with stunning volcano views. Private chef options available.', 
'Working farm and boutique villa offering spectacular volcano views and farm-to-table experiences. Available as entire-house rental or individual suites with private chef options. Popular choice for families and groups seeking privacy, authenticity, and flexible dining arrangements.', 
'Villa / Farm Stay', 'Volcano views, private chef option, farm experience, flexible configurations', 1, 1, 3);

-- Luxury Accommodations
INSERT INTO accommodations (tier_id, name, slug, location, price_min, price_max, price_display, price_unit, short_description, full_description, accommodation_type, includes, is_active, featured, sort_order) VALUES
(3, 'Bisate Lodge', 'bisate-lodge', 'Wilderness Area', 1400.00, 3600.00, '$1,400–3,600+ / person/night', 'per person/night',
'Eco-luxury mountain lodge with private villas and immersive conservation focus. Premium all-inclusive pricing.', 
'Eco-luxury mountain lodge featuring private villas with breathtaking views and immersive conservation-focused experiences. Premium all-inclusive pricing covers exclusive guiding, gourmet meals, and comprehensive activities. Designed for discerning travelers committed to conservation and unparalleled luxury.', 
'Eco-Lodge', 'All-inclusive, private villas, exclusive guiding, conservation programs, gourmet dining', 1, 1, 1),

(3, 'One&Only Gorilla\'s Nest', 'oneonly-gorillas-nest', 'Luxury Resort', 1150.00, 4000.00, '$1,150–4,000+ / night', 'per night',
'New ultra-luxury resort offering private lodges with high-touch service. Targets top-tier gorilla travelers.', 
'New ultra-luxury resort destination offering private lodges with exceptional high-touch service and world-class amenities. Targets top-tier gorilla travelers seeking the ultimate combination of adventure and opulence. Features spa facilities, curated experiences, and personalized itineraries.', 
'Luxury Resort', 'Private lodges, spa, personalized service, curated experiences, premium amenities', 1, 1, 2),

(3, 'Singita Kwitonda Lodge', 'singita-kwitonda-lodge', 'Exclusive Conservation Area', 1500.00, 3000.00, '$1,500–3,000+ / person/night', 'per person/night',
'Very exclusive conservation-centered luxury lodge with limited suites. Premium private experiences.', 
'Very exclusive conservation-centered luxury lodge with strictly limited suites ensuring ultimate privacy and personalized attention. Suite and exclusive-use pricing available. Combines world-renowned Singita hospitality with Rwanda\'s extraordinary gorilla trekking opportunities and conservation initiatives.', 
'Luxury Lodge', 'Limited suites, exclusive-use options, conservation focus, premium private experiences', 1, 1, 3),

(3, 'Virunga Lodge', 'virunga-lodge', 'Volcano Ridge', 2000.00, 3500.00, '$2,000+ / person/night', 'per person/night',
'Established higher-end lodge on the volcano ridge with excellent volcano views. All-inclusive seasonal rates.', 
'Established higher-end lodge perched on the volcano ridge offering panoramic volcano views and exceptional wildlife observation opportunities. All-inclusive seasonal rates include packaged excursions, gourmet meals, premium beverages, and expert-led activities. A trusted name in Rwanda luxury safari lodging.', 
'Luxury Lodge', 'All-inclusive, packaged excursions, volcano views, gourmet dining, premium service', 1, 1, 4);

-- ============================================
-- INSERT DATA: market_segments
-- ============================================
INSERT INTO market_segments (segment_name, segment_title, description, target_regions, typical_accommodations, sort_order, is_active) VALUES
('luxury-travelers', 'Luxury Travelers & Conservation Tourists', 
'High-spend visitors booking all-inclusive packages centered on gorilla trekking. They typically choose ultra-luxury lodges with comprehensive conservation programs and exclusive experiences.', 
'Europe, North America, China, Australasia', 
'Bisate Lodge, Singita Kwitonda, One&Only Gorilla\'s Nest, Virunga Lodge', 1, 1),

('mid-range-tourists', 'Mid-Range Tourists & Small Groups', 
'Travelers seeking comfort without ultra-luxury pricing. They prefer boutique lodges and villas offering quality service, good meals, and organized activities at moderate price points.', 
'Europe, Regional East African markets, Independent tour groups', 
'Amakoro Songa Lodge, Farmhouse Rwanda, The Bishop\'s House', 2, 1),

('budget-travelers', 'Budget & Independent Travelers', 
'Backpackers, volunteers, and value-minded couples or families seeking authentic cultural experiences through homestays, guesthouses, and local accommodations that directly support communities.', 
'Global backpackers, Volunteers, Value-conscious families', 
'Virunga Homestay, Hotel Muhabura, Amahoro Guest House', 3, 1);

-- ============================================
-- INSERT DATA: amenities
-- ============================================
INSERT INTO amenities (amenity_name, amenity_icon, category) VALUES
('WiFi', 'wifi', 'connectivity'),
('Restaurant', 'restaurant', 'dining'),
('Private Chef', 'chef', 'dining'),
('Transfers Included', 'car', 'transport'),
('Airport Pickup', 'plane', 'transport'),
('Guided Tours', 'guide', 'activities'),
('Conservation Programs', 'leaf', 'activities'),
('Spa Services', 'spa', 'wellness'),
('Hot Water', 'water', 'basic'),
('En-suite Bathroom', 'bathroom', 'basic'),
('Private Villa', 'home', 'accommodation'),
('All-Inclusive', 'check', 'package'),
('Cultural Experiences', 'culture', 'activities'),
('Volcano Views', 'mountain', 'location'),
('Conference Facilities', 'meeting', 'business'),
('Family Friendly', 'family', 'guest-type'),
('Laundry Service', 'laundry', 'services'),
('Bar/Lounge', 'bar', 'dining');

-- ============================================
-- Link amenities to accommodations
-- ============================================

-- Virunga Homestay amenities
INSERT INTO accommodation_amenities (accommodation_id, amenity_id) VALUES
(1, 9),  -- Hot Water
(1, 2),  -- Restaurant (local meals)
(1, 13); -- Cultural Experiences

-- Hotel Muhabura amenities
INSERT INTO accommodation_amenities (accommodation_id, amenity_id) VALUES
(2, 1),  -- WiFi
(2, 9),  -- Hot Water
(2, 10), -- En-suite Bathroom
(2, 2);  -- Restaurant

-- Amahoro Guest House amenities
INSERT INTO accommodation_amenities (accommodation_id, amenity_id) VALUES
(3, 9),  -- Hot Water
(3, 2),  -- Restaurant
(3, 4);  -- Transfers Included

-- Amakoro Songa Lodge amenities
INSERT INTO accommodation_amenities (accommodation_id, amenity_id) VALUES
(4, 1),  -- WiFi
(4, 2),  -- Restaurant
(4, 4),  -- Transfers Included
(4, 6),  -- Guided Tours
(4, 14), -- Volcano Views
(4, 17); -- Laundry Service

-- The Bishop's House amenities
INSERT INTO accommodation_amenities (accommodation_id, amenity_id) VALUES
(5, 1),  -- WiFi
(5, 12), -- All-Inclusive
(5, 15), -- Conference Facilities
(5, 16), -- Family Friendly
(5, 2);  -- Restaurant

-- Farmhouse Rwanda amenities
INSERT INTO accommodation_amenities (accommodation_id, amenity_id) VALUES
(6, 1),  -- WiFi
(6, 3),  -- Private Chef
(6, 11), -- Private Villa
(6, 14), -- Volcano Views
(6, 16); -- Family Friendly

-- Bisate Lodge amenities
INSERT INTO accommodation_amenities (accommodation_id, amenity_id) VALUES
(7, 1),  -- WiFi
(7, 11), -- Private Villa
(7, 12), -- All-Inclusive
(7, 6),  -- Guided Tours
(7, 7),  -- Conservation Programs
(7, 14), -- Volcano Views
(7, 17), -- Laundry Service
(7, 18); -- Bar/Lounge

-- One&Only Gorilla's Nest amenities
INSERT INTO accommodation_amenities (accommodation_id, amenity_id) VALUES
(8, 1),  -- WiFi
(8, 11), -- Private Villa
(8, 8),  -- Spa Services
(8, 12), -- All-Inclusive
(8, 6),  -- Guided Tours
(8, 5),  -- Airport Pickup
(8, 17), -- Laundry Service
(8, 18); -- Bar/Lounge

-- Singita Kwitonda Lodge amenities
INSERT INTO accommodation_amenities (accommodation_id, amenity_id) VALUES
(9, 1),  -- WiFi
(9, 11), -- Private Villa
(9, 12), -- All-Inclusive
(9, 7),  -- Conservation Programs
(9, 6),  -- Guided Tours
(9, 8),  -- Spa Services
(9, 14), -- Volcano Views
(9, 17); -- Laundry Service

-- Virunga Lodge amenities
INSERT INTO accommodation_amenities (accommodation_id, amenity_id) VALUES
(10, 1),  -- WiFi
(10, 12), -- All-Inclusive
(10, 6),  -- Guided Tours
(10, 14), -- Volcano Views
(10, 18), -- Bar/Lounge
(10, 17), -- Laundry Service
(10, 2);  -- Restaurant
