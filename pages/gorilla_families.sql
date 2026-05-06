-- ============================================
-- Gorilla Families Database Schema
-- ============================================
-- This table stores all gorilla family information
-- Data is fetched dynamically on the frontend
-- ============================================

-- Drop table if exists
DROP TABLE IF EXISTS gorilla_families;

-- ============================================
-- Table: gorilla_families
-- ============================================
CREATE TABLE gorilla_families (
    family_id INT AUTO_INCREMENT PRIMARY KEY,
    family_name VARCHAR(100) NOT NULL UNIQUE,
    country VARCHAR(50) NOT NULL,
    region VARCHAR(100),
    silverback_name VARCHAR(100),
    family_size VARCHAR(50),
    description LONGTEXT,
    characteristics TEXT,
    history TEXT,
    special_features TEXT,
    image_url VARCHAR(500),
    is_habituated TINYINT(1) DEFAULT 1,
    is_active TINYINT(1) DEFAULT 1,
    sort_order INT DEFAULT 0,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    INDEX idx_country (country),
    INDEX idx_active (is_active),
    INDEX idx_sort (sort_order)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ============================================
-- INSERT DATA: Rwanda Gorilla Families
-- ============================================

-- Tourism Families (Habituated)
INSERT INTO gorilla_families (family_name, country, region, silverback_name, family_size, description, characteristics, history, special_features, is_habituated, is_active, sort_order) VALUES

('Susa A (Kurira)', 'Rwanda', 'Volcanoes National Park', 'Unknown', '30-40 members', 'The largest group, famous for twin births and featured in "Gorillas in the Mist". This is currently the second largest group of Mountain Gorillas in the park. It boasts 35 individuals, four of whom are silverbacks. Studied by Dian Fossey, this group is quite famous. It lives on the slopes of mountain Karisimbi.', 'Largest Group, Famous, Twin Births', 'Studied by Dian Fossey, rare twin gorilla babies were born in this group — not once, but twice! It first happened on May 19, 2004, when 12-year-old Nyabitondore gave birth to twins, one male and one female. Then, on May 27, 2011, another old female, Ruvumu, produced two twins, male and female.', 'Rare twin births, Dian Fossey legacy', 1, 1, 1),

('Karisimbi (Susa B)', 'Rwanda', 'Volcanoes National Park', 'Unknown', '~15 members', 'Split from Susa A; high-altitude group living on mountain slopes. A majestic group that roams higher altitudes, carrying with it the legacy of the great Karisimbi volcano.', 'High Altitude, Split Group', 'Division of the legendary Susa lineage, ensuring that its story lives on through new generations.', 'High altitude habitat', 1, 1, 2),

('Sabyinyo', 'Rwanda', 'Volcanoes National Park', 'Guhonda', '~12 members', 'Led by Guhonda, Rwanda\'s largest silverback, known for his gentle nature. High on the slopes of Mount Sabyinyo, a mountain whose name means "the old man\'s teeth", lives one of Volcanoes National Park\'s most celebrated gorilla families.', 'Largest Silverback, Gentle, Intimate', 'Led by the legendary Guhonda, the largest silverback ever recorded in the Virunga Massif. After his passing, leadership passed to Gihishamwotsi.', 'Closest encounters, photogenic', 1, 1, 3),

('Agashya (Group 13)', 'Rwanda', 'Volcanoes National Park', 'Agashya', '25-30 members', 'Moves to high slopes when threatened, known for protective behavior. The name Agashya means "something special", given in recognition of his ability to lead such a big group. After Agashya came into power, he raised the number of group members to 27 with 9 females in only eight years.', 'High Altitude, Protective, Large Group', 'Contrary to popular belief, group thirteen has more than 13 individuals. The name comes from being the 13th established group ever found, as was customary back in those days.', 'Dynamic leadership, rapid growth', 1, 1, 4),

('Amahoro', 'Rwanda', 'Volcanoes National Park', 'Unknown', '17-20 members', 'Known for their peaceful temperament - "Amahoro" means "peace" in Kinyarwanda. The Amahoro group became available to the public in 2000, and it was the largest mountain gorilla family at the time. The Amahoro silverback is very relaxed and approachable.', 'Peaceful, Calm, Playful', 'A legacy of peace, the Amahoro family has touched hearts with their calm, playful, and approachable nature since 2000.', 'Friendly and approachable', 1, 1, 5),

('Umubano', 'Rwanda', 'Volcanoes National Park', 'Charles', '~13 members', 'Split from Amahoro, led by Charles, known for harmony. The story of the Umubano family is one of courage, independence, and ambition. Charles broke away and founded a new dynasty—the Umubano Group.', 'Split Group, Harmony, Independent', 'A young and ambitious silverback, Charles has been successful in maintaining his group and gaining more females in a short time. Umubano means "living together in harmony" in Kinyarwanda.', 'Born from independence and courage', 1, 1, 6),

('Bwenge', 'Rwanda', 'Volcanoes National Park', 'Unknown', '~11 members', 'Appeared in Gorillas in the Mist, known for their resilience. This lineage produced notable families including Kuryama, Bwenge, Sigasira, and the famous Titus group.', 'Famous, Resilient', 'Part of the Beetsme Lineage, one of the most influential bloodlines in Karisoke research.', 'Movie fame, resilience', 1, 1, 7),

('Ugenda', 'Rwanda', 'Volcanoes National Park', 'Unknown', '~11 members', 'Highly mobile group - "Ugenda" means "on the move". Originated as Group 5 after splitting from Amahoro. Today, its legacy continues through groups such as Ntambara, Ugenda, and Urugamba.', 'Mobile, Active', 'Part of the Shinda Lineage, one of the most influential bloodlines in Karisoke research.', 'Highly mobile territory', 1, 1, 8),

('Kwitonda', 'Rwanda', 'Volcanoes National Park', 'Kwitonda', '~23 members', 'Migrated from DRC, known for their wide-ranging territory. An immigrant family of mountain gorillas that settled in the park some 12 years ago, but keeps crossing the border every chance it gets. The Kwitonda Group are a bashful bunch of border bandits.', 'Migrant, Wide-ranging, Border Crossers', 'Brought over from the Democratic Republic of Congo in 2005, when there were 16 members in the group. Today, the group has grown tremendously to 23 individuals.', 'Free travelers across borders', 1, 1, 9),

('Hirwa', 'Rwanda', 'Volcanoes National Park', 'Munyinya', '~18 members', 'The "lucky" family, known for successful twin births and strong bonds. The Hirwa family\'s journey is one of destiny, harmony, and resilience. Their name, Hirwa, means "the lucky one" in Kinyarwanda.', 'Lucky, Twins, Peaceful', 'In June 2011, the world celebrated when Hirwa welcomed a miracle: the birth of rare twin gorillas. Twins are almost unheard of in the mountain gorilla world.', 'Rare twin births, miraculous survival', 1, 1, 10),

('Isimbi', 'Rwanda', 'Volcanoes National Park', 'Unknown', '~16 members', 'Split from Karisimbi, known for their peaceful nature. Known for its youthful energy and playful spirit, representing rebirth and renewal.', 'Peaceful, Split Group, Youthful', 'Division of the legendary Susa lineage, carrying the DNA of the legendary Susa family.', 'Youthful energy and playfulness', 1, 1, 11),

('Igisha', 'Rwanda', 'Volcanoes National Park', 'Igisha', '26-34 members', 'Strong, energetic, newer large family with dynamic leadership. A strong group led by Silverback Igisha, embodying authority and determination.', 'Large Group, Energetic, Dynamic', 'Division of the legendary Susa lineage, ensuring that its story lives on through new generations.', 'Dynamic leadership, large size', 1, 1, 12);

-- ============================================
-- INSERT DATA: Uganda Gorilla Families
-- ============================================

INSERT INTO gorilla_families (family_name, country, region, silverback_name, family_size, description, characteristics, history, special_features, is_habituated, is_active, sort_order) VALUES

('Mubare', 'Uganda', 'Bwindi - Buhoma Sector', 'Unknown', '~9 members', 'The oldest habituated group (1993), pioneers of gorilla tourism in Bwindi. The first habituated group in Bwindi Impenetrable National Park.', 'First Habituated, Historic, Pioneers', 'Habituated in 1993, making them the oldest habituated group in Bwindi and pioneers of gorilla tourism in Uganda.', 'Historic significance, tourism pioneers', 1, 1, 13),

('Habinyanja', 'Uganda', 'Bwindi - Buhoma Sector', 'Unknown', '~17 members', 'Historic family that split to form Rushegura, known for their stability. A historic family that split to form Rushegura.', 'Stable, Parent Group', 'One of the earliest habituated families in Bwindi, known for their stability and successful group dynamics.', 'Parent group legacy', 1, 1, 14),

('Rushegura', 'Uganda', 'Bwindi - Buhoma Sector', 'Unknown', '~20 members', 'Calm, accessible group split from Habinyanja. A calm, accessible group split from Habinyanja.', 'Calm, Accessible, Split Group', 'Split from Habinyanja, this group has maintained calm and accessible behavior for visitors.', 'Calm and accessible', 1, 1, 15),

('Katwe', 'Uganda', 'Bwindi - Buhoma Sector', 'Unknown', '~9 members', 'Newer, small family in the Buhoma sector. A newer, small family in the Buhoma sector.', 'Small Group, Newer', 'One of the newer habituated families in Bwindi.', 'Newer family', 1, 1, 16),

('Bitukura', 'Uganda', 'Bwindi - Ruhija Sector', 'Unknown', '~14 members', 'Habituated in record time, known for quick adaptation. Habituated in record time, known for quick adaptation.', 'Quick Adaptation, Record Time', 'One of the fastest habituated groups in Bwindi, showing remarkable adaptation to human presence.', 'Quick adaptation', 1, 1, 17),

('Oruzogo', 'Uganda', 'Bwindi - Ruhija Sector', 'Unknown', '17-25 members', 'Known for playful juveniles and active behavior. Known for playful juveniles and active behavior.', 'Playful, Active', 'A family known for their energetic and playful nature, especially among juveniles.', 'Playful juveniles', 1, 1, 18),

('Kyaguliro', 'Uganda', 'Bwindi - Ruhija Sector', 'Unknown', '10-15 members', 'Research-focused family with historic significance. Research-focused family with historic significance.', 'Research, Historic', 'A family that has been central to gorilla research efforts in Bwindi.', 'Research significance', 1, 1, 19),

('Mukiza', 'Uganda', 'Bwindi - Ruhija Sector', 'Unknown', '~10 members', 'Split from Kyaguliro, smaller independent group. Split from Kyaguliro, smaller independent group.', 'Split Group, Independent', 'A smaller group that split from Kyaguliro, now independent.', 'Independent split', 1, 1, 20),

('Nshongi', 'Uganda', 'Bwindi - Rushaga Sector', 'Unknown', '~25 members', 'Once 36 members, split into several new families over time. Once 36 members, split into several new families over time.', 'Large Group, Parent Family', 'One of the largest families in Bwindi, known for producing multiple split groups.', 'Large parent family', 1, 1, 21),

('Mishaya', 'Uganda', 'Bwindi - Rushaga Sector', 'Unknown', '~12 members', 'Known for aggressive male leadership and strong dynamics. Known for aggressive male leadership and strong dynamics.', 'Strong Leadership, Dynamic', 'A family with strong and dynamic leadership characteristics.', 'Strong dynamics', 1, 1, 22),

('Kahungye', 'Uganda', 'Bwindi - Rushaga Sector', 'Unknown', '14-18 members', 'Produced Busingye split, stable family group. Produced Busingye split, stable family group.', 'Stable, Parent Group', 'A stable family that has produced successful splits.', 'Stable family', 1, 1, 23),

('Bweza', 'Uganda', 'Bwindi - Rushaga Sector', 'Unknown', '9-11 members', 'Formed from Nshongi/Mishaya splits. Formed from Nshongi/Mishaya splits.', 'Split Group, Medium Size', 'A medium-sized group formed from larger family splits.', 'Split group', 1, 1, 24),

('Busingye', 'Uganda', 'Bwindi - Rushaga Sector', 'Unknown', '~9 members', 'Assertive offshoot from Kahungye family. Assertive offshoot from Kahungye family.', 'Assertive, Offshoot', 'An assertive group that split from Kahungye.', 'Assertive leadership', 1, 1, 25),

('Rwigi', 'Uganda', 'Bwindi - Rushaga Sector', 'Unknown', '~7 members', 'Small new split group, compact family. Small new split group, compact family.', 'Small Group, New Split', 'A small, newly formed split group.', 'Compact family', 1, 1, 26),

('Tindatine', 'Uganda', 'Bwindi - Rushaga Sector', 'Unknown', '~8 members', 'Compact, newer family in Rushaga sector. Compact, newer family in Rushaga sector.', 'Compact, Newer', 'A newer, compact family in the Rushaga sector.', 'Newer family', 1, 1, 27),

('Nkuringo', 'Uganda', 'Bwindi - Nkuringo Sector', 'Unknown', '~18 members', 'Steep trekking routes, near communities, challenging access. Steep trekking routes, near communities, challenging access.', 'Steep Terrain, Community Near', 'A family with challenging terrain and proximity to local communities.', 'Challenging terrain', 1, 1, 28),

('Bushaho', 'Uganda', 'Bwindi - Nkuringo Sector', 'Unknown', '~8 members', 'Split from Nkuringo, smaller mountain group. Split from Nkuringo, smaller mountain group.', 'Split Group, Mountain', 'A smaller group that split from Nkuringo.', 'Mountain habitat', 1, 1, 29),

('Christmas', 'Uganda', 'Bwindi - Nkuringo Sector', 'Unknown', '7-9 members', 'Named for leader born on Christmas Day. Named for leader born on Christmas Day.', 'Special Name, Small Group', 'A uniquely named family with special significance.', 'Unique naming', 1, 1, 30),

('Posho', 'Uganda', 'Bwindi - Nkuringo Sector', 'Unknown', '15-19 members', 'Larger new family in Nkuringo sector. Larger new family in Nkuringo sector.', 'Large Group, New Family', 'A larger, newer family in the Nkuringo sector.', 'Newer large family', 1, 1, 31),

('Nyakagezi', 'Uganda', 'Mgahinga Gorilla National Park', 'Unknown', '~10 members', 'Only Mgahinga group, once migratory but now stable. Only Mgahinga group, once migratory but now stable.', 'Only Group, Now Stable', 'The only habituated gorilla family in Mgahinga, once migratory but now stable.', 'Unique to Mgahinga', 1, 1, 32);

-- ============================================
-- INSERT DATA: DRC Gorilla Families
-- ============================================

INSERT INTO gorilla_families (family_name, country, region, silverback_name, family_size, description, characteristics, history, special_features, is_habituated, is_active, sort_order) VALUES

('Bageni', 'DRC', 'Virunga National Park', 'Unknown', '~26 members', 'The largest DRC group with multiple silverbacks and frequent rivalries. The largest DRC group with multiple silverbacks and frequent rivalries.', 'Largest in DRC, Multiple Silverbacks', 'The largest habituated group in Virunga National Park with complex social dynamics.', 'Largest group, multiple leaders', 1, 1, 33),

('Kabirizi', 'DRC', 'Virunga National Park', 'Unknown', '~19 members', 'Famous for trekking experiences but faces leadership challenges. Famous for trekking experiences but faces leadership challenges.', 'Popular, Dynamic', 'A popular family known for trekking experiences and dynamic social structure.', 'Popular for trekking', 1, 1, 34),

('Humba', 'DRC', 'Virunga National Park', 'Unknown', '~9 members', 'Peaceful family that split from Rugendo group. Peaceful family that split from Rugendo group.', 'Peaceful, Split Group', 'A peaceful group that split from the Rugendo family.', 'Peaceful nature', 1, 1, 35),

('Rugendo', 'DRC', 'Virunga National Park', 'Unknown', '~11 members', 'Historic "mother group" with significant heritage. Historic "mother group" with significant heritage.', 'Historic, Mother Group', 'A historic family that has produced several split groups.', 'Historic significance', 1, 1, 36),

('Mapuwa', 'DRC', 'Virunga National Park', 'Unknown', '~25 members', 'Competitive group with shifting membership dynamics. Competitive group with shifting membership dynamics.', 'Competitive, Dynamic', 'A large, competitive family with dynamic social structure.', 'Dynamic membership', 1, 1, 37),

('Lulengo', 'DRC', 'Virunga National Park', 'Unknown', '~11 members', 'Stable, smaller family with consistent behavior. Stable, smaller family with consistent behavior.', 'Stable, Consistent', 'A stable family known for consistent behavior patterns.', 'Stable behavior', 1, 1, 38),

('Munyaga', 'DRC', 'Virunga National Park', 'Unknown', '~9 members', 'Known for nurturing mothers but has experienced infant losses. Known for nurturing mothers but has experienced infant losses.', 'Nurturing, Challenges', 'A family known for maternal care but facing conservation challenges.', 'Nurturing mothers', 1, 1, 39),

('Nyakamwe', 'DRC', 'Virunga National Park', 'Unknown', '12-15 members', 'Peaceful and stable family with consistent group dynamics. Peaceful and stable family with consistent group dynamics.', 'Peaceful, Stable', 'A peaceful and stable family with consistent social dynamics.', 'Stable and peaceful', 1, 1, 40);

-- ============================================
-- Indexes for better query performance
-- ============================================
CREATE INDEX idx_family_country_active ON gorilla_families(country, is_active);
CREATE INDEX idx_family_name ON gorilla_families(family_name);

