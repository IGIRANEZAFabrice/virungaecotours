-- ============================================
-- Philanthropy Page Database Schema
-- Community Impact & Philanthropy Page
-- ============================================

-- Drop tables if they exist
DROP TABLE IF EXISTS `philanthropy_partnerships`;
DROP TABLE IF EXISTS `philanthropy_stories`;
DROP TABLE IF EXISTS `philanthropy_engagement`;
DROP TABLE IF EXISTS `philanthropy_focus_items`;
DROP TABLE IF EXISTS `philanthropy_focus_areas`;
DROP TABLE IF EXISTS `philanthropy_regenerative`;
DROP TABLE IF EXISTS `philanthropy_approach`;
DROP TABLE IF EXISTS `philanthropy_hero`;

-- Table 1: Hero Section with Stats
CREATE TABLE `philanthropy_hero` (
  `id` INT(11) PRIMARY KEY AUTO_INCREMENT,
  `hero_title` VARCHAR(255) NOT NULL,
  `hero_subtitle` VARCHAR(255) NOT NULL,
  `hero_description` TEXT NOT NULL,
  `hero_image` VARCHAR(255) DEFAULT NULL,
  `stat1_number` VARCHAR(50) NOT NULL,
  `stat1_label` VARCHAR(100) NOT NULL,
  `stat2_number` VARCHAR(50) NOT NULL,
  `stat2_label` VARCHAR(100) NOT NULL,
  `stat3_number` VARCHAR(50) NOT NULL,
  `stat3_label` VARCHAR(100) NOT NULL,
  `updated_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Table 2: Our Approach Section
CREATE TABLE `philanthropy_approach` (
  `id` INT(11) PRIMARY KEY AUTO_INCREMENT,
  `section_title` VARCHAR(255) NOT NULL,
  `section_description` TEXT NOT NULL,
  `card_title` VARCHAR(255) NOT NULL,
  `card_icon` VARCHAR(100) NOT NULL,
  `card_description` TEXT NOT NULL,
  `display_order` INT(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Table 3: Regenerative Tourism Cards
CREATE TABLE `philanthropy_regenerative` (
  `id` INT(11) PRIMARY KEY AUTO_INCREMENT,
  `section_title` VARCHAR(255) NOT NULL,
  `section_description` TEXT NOT NULL,
  `card_title` VARCHAR(255) NOT NULL,
  `card_icon` VARCHAR(100) NOT NULL,
  `card_description` TEXT NOT NULL,
  `display_order` INT(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Table 4: Focus Areas (Main Categories)
CREATE TABLE `philanthropy_focus_areas` (
  `id` INT(11) PRIMARY KEY AUTO_INCREMENT,
  `focus_id` VARCHAR(50) NOT NULL UNIQUE,
  `focus_title` VARCHAR(255) NOT NULL,
  `focus_icon` VARCHAR(100) NOT NULL,
  `focus_description` TEXT NOT NULL,
  `focus_image` VARCHAR(255) DEFAULT NULL,
  `display_order` INT(11) NOT NULL,
  `updated_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Table 5: Focus Area Items (Bullet Points)
CREATE TABLE `philanthropy_focus_items` (
  `id` INT(11) PRIMARY KEY AUTO_INCREMENT,
  `focus_id` VARCHAR(50) NOT NULL,
  `item_title` VARCHAR(255) NOT NULL,
  `item_description` TEXT NOT NULL,
  `display_order` INT(11) NOT NULL,
  FOREIGN KEY (`focus_id`) REFERENCES `philanthropy_focus_areas`(`focus_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Table 6: Visitor Engagement Activities
CREATE TABLE `philanthropy_engagement` (
  `id` INT(11) PRIMARY KEY AUTO_INCREMENT,
  `engagement_title` VARCHAR(255) NOT NULL,
  `engagement_icon` VARCHAR(100) NOT NULL,
  `engagement_description` TEXT NOT NULL,
  `display_order` INT(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Table 7: Impact Stories
CREATE TABLE `philanthropy_stories` (
  `id` INT(11) PRIMARY KEY AUTO_INCREMENT,
  `story_title` VARCHAR(255) NOT NULL,
  `story_excerpt` TEXT NOT NULL,
  `story_image` VARCHAR(255) DEFAULT NULL,
  `story_link` VARCHAR(255) DEFAULT '#',
  `display_order` INT(11) NOT NULL,
  `updated_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Table 8: Partnership Opportunities
CREATE TABLE `philanthropy_partnerships` (
  `id` INT(11) PRIMARY KEY AUTO_INCREMENT,
  `partnership_title` VARCHAR(255) NOT NULL,
  `partnership_icon` VARCHAR(100) NOT NULL,
  `partnership_description` TEXT NOT NULL,
  `partnership_link` VARCHAR(255) DEFAULT '#',
  `display_order` INT(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ============================================
-- INSERT STATEMENTS
-- ============================================

-- Insert Hero Section with Stats
INSERT INTO `philanthropy_hero` (`hero_title`, `hero_subtitle`, `hero_description`, `hero_image`, `stat1_number`, `stat1_label`, `stat2_number`, `stat2_label`, `stat3_number`, `stat3_label`) VALUES
('Philanthropy & Community Impact',
 'Creating Lasting Change Through Strategic Partnerships',
 'Virunga Ecotours specializes in tourism that benefits local communities, preserves culture, and restores natural ecosystems. Our community-based tourism (CBT) and regenerative travel programs create meaningful experiences for travelers while delivering tangible benefits to host communities and the environment.',
 'assets/images/philanthropy-hero.jpg',
 '500+', 'Students Supported',
 '15', 'Community Projects',
 '1000+', 'Lives Impacted');

-- Insert Approach Section Header (stored once, reused)
INSERT INTO `philanthropy_approach` (`section_title`, `section_description`, `card_title`, `card_icon`, `card_description`, `display_order`) VALUES
('Our Community-Based Tourism Approach',
 'Community-based tourism is led, managed, and owned by local communities, ensuring economic, social, and cultural benefits remain local while preserving heritage and nature. We implement CBT through partnerships with homestays, Red Rocks Initiatives, indigenous guides, and artisan cooperatives.',
 'Economic Benefits',
 'fas fa-coins',
 'CBT provides employment opportunities, revenue generation, local procurement of goods and services, and limits funds that leave the community. It diversifies economic activities beyond farming, reducing risk in years when climate change produces low or no yield.',
 1),
('Our Community-Based Tourism Approach',
 'Community-based tourism is led, managed, and owned by local communities, ensuring economic, social, and cultural benefits remain local while preserving heritage and nature. We implement CBT through partnerships with homestays, Red Rocks Initiatives, indigenous guides, and artisan cooperatives.',
 'Shared Value Distribution',
 'fas fa-handshake',
 'Within CBT, there is distribution of benefits to all households. Though not all families host homestays, some act as guides or provide meals. Even those not directly involved benefit from the agreed use of the community fund.',
 2),
('Our Community-Based Tourism Approach',
 'Community-based tourism is led, managed, and owned by local communities, ensuring economic, social, and cultural benefits remain local while preserving heritage and nature. We implement CBT through partnerships with homestays, Red Rocks Initiatives, indigenous guides, and artisan cooperatives.',
 'Social Development',
 'fas fa-users',
 'CBT provides skills-training, opportunities for community infrastructure development (power, roads, sanitation, water), health benefits, and promotes more equitable community structure. Association with foreign travelers raises confidence and pride.',
 3),
('Our Community-Based Tourism Approach',
 'Community-based tourism is led, managed, and owned by local communities, ensuring economic, social, and cultural benefits remain local while preserving heritage and nature. We implement CBT through partnerships with homestays, Red Rocks Initiatives, indigenous guides, and artisan cooperatives.',
 'Female Empowerment',
 'fas fa-female',
 'One of the greatest outcomes is the empowerment of women in the community, as they are often largely responsible for the management and generation of the experience and therefore income.',
 4);

-- Insert Regenerative Tourism Section
INSERT INTO `philanthropy_regenerative` (`section_title`, `section_description`, `card_title`, `card_icon`, `card_description`, `display_order`) VALUES
('Regenerative Tourism Principles',
 'While sustainable tourism minimizes harm, regenerative tourism actively restores ecosystems, strengthens cultural integrity, and improves livelihoods. We measure impact through social assessments, employment metrics, visitor feedback, and ecological monitoring.',
 'Ecosystem Restoration',
 'fas fa-seedling',
 'Tourism revenue funds conservation initiatives, provides alternatives to poaching or deforestation, and increases environmental awareness. Projects include reforestation, eco-agriculture, and habitat restoration with measurable ecological benefits.',
 1),
('Regenerative Tourism Principles',
 'While sustainable tourism minimizes harm, regenerative tourism actively restores ecosystems, strengthens cultural integrity, and improves livelihoods. We measure impact through social assessments, employment metrics, visitor feedback, and ecological monitoring.',
 'Youth Engagement',
 'fas fa-graduation-cap',
 'Youth are trained as guides, performers, and hospitality staff, ensuring skill transfer, employment, and cultural continuity. This prevents young people from leaving for larger cities by providing meaningful local employment opportunities.',
 2),
('Regenerative Tourism Principles',
 'While sustainable tourism minimizes harm, regenerative tourism actively restores ecosystems, strengthens cultural integrity, and improves livelihoods. We measure impact through social assessments, employment metrics, visitor feedback, and ecological monitoring.',
 'Environmental Conservation',
 'fas fa-leaf',
 'Conservation of the environment, awareness and wildlife protection are great benefits of CBT. Tourism supports biodiversity through funding conservation initiatives and creating alternatives to environmentally harmful activities.',
 3),
('Regenerative Tourism Principles',
 'While sustainable tourism minimizes harm, regenerative tourism actively restores ecosystems, strengthens cultural integrity, and improves livelihoods. We measure impact through social assessments, employment metrics, visitor feedback, and ecological monitoring.',
 'Cultural Preservation',
 'fas fa-monument',
 'CBT prevents cultural erosion by providing employment opportunities locally, allowing communities to share traditions, crafts, and culinary practices on their terms, reinforcing cultural identity and heritage preservation.',
 4);

-- Insert Focus Areas
INSERT INTO `philanthropy_focus_areas` (`focus_id`, `focus_title`, `focus_icon`, `focus_description`, `focus_image`, `display_order`) VALUES
('education',
 'Education & Skills Development',
 'fas fa-graduation-cap',
 'CBT affects local education quality by funding school infrastructure, teacher training, and scholarships, improving access and learning outcomes. Training programs cover hospitality, language, environmental stewardship, financial management, and guest relations.',
 'assets/images/education-impact.jpg',
 1),
('healthcare',
 'Healthcare & Public Health',
 'fas fa-heart',
 'CBT improves public health as tourism revenue funds clean water, clinics, and nutrition initiatives while supporting health education. Health benefits include water and waste management education, improving community well-being.',
 'assets/images/healthcare-impact.jpg',
 2),
('environment',
 'Environmental Conservation & Regeneration',
 'fas fa-leaf',
 'Tourism influences local wildlife conservation by providing alternative livelihoods and funding for protection initiatives, incentivizing habitat preservation. Regenerative tourism supports ecological restoration through measurable projects.',
 'assets/images/conservation-impact.jpg',
 3),
('economic',
 'Economic Empowerment & Local Entrepreneurship',
 'fas fa-coins',
 'CBT supports local entrepreneurship by integrating artisans, farmers, and service providers into tourism supply chains, ensuring sustainable income. We source crafts directly, provide training, and integrate sales into visitor experiences.',
 'assets/images/economic-impact.jpg',
 4);

-- Insert Focus Area Items for Education
INSERT INTO `philanthropy_focus_items` (`focus_id`, `item_title`, `item_description`, `display_order`) VALUES
('education', 'School Infrastructure', 'Revenue funds school infrastructure, teacher training, and scholarships', 1),
('education', 'Youth Training', 'Youth are trained as guides, performers, and hospitality staff for skill transfer and employment', 2),
('education', 'Hospitality Training', 'Training covers hospitality, language, environmental stewardship, and financial management', 3),
('education', 'Cultural Education', 'Hands-on participation in cooking, farming, crafts, and storytelling deepens understanding', 4),
('education', 'Language Programs', 'English and French language classes enhance communication with visitors', 5),
('education', 'Conservation Education', 'Environmental awareness and wildlife protection education programs', 6);

-- Insert Focus Area Items for Healthcare
INSERT INTO `philanthropy_focus_items` (`focus_id`, `item_title`, `item_description`, `display_order`) VALUES
('healthcare', 'Clean Water Access', 'Tourism revenue funds clean water projects and watershed protection', 1),
('healthcare', 'Health Clinics', 'Funding for local clinics, equipment, and medical supplies', 2),
('healthcare', 'Nutrition Programs', 'Supporting nutrition initiatives and food security projects', 3),
('healthcare', 'Health Education', 'Water and waste management education for disease prevention', 4),
('healthcare', 'Sanitation Infrastructure', 'Community infrastructure development including sanitation systems', 5),
('healthcare', 'Medical Outreach', 'Mobile health services reaching remote community areas', 6);

-- Insert Focus Area Items for Environment
INSERT INTO `philanthropy_focus_items` (`focus_id`, `item_title`, `item_description`, `display_order`) VALUES
('environment', 'Reforestation Projects', 'Tree planting, forest restoration, and soil regeneration initiatives', 1),
('environment', 'Wildlife Protection', 'Funding for anti-poaching efforts and wildlife monitoring programs', 2),
('environment', 'Habitat Restoration', 'Creating wildlife corridors and restoring degraded landscapes', 3),
('environment', 'Sustainable Agriculture', 'Promoting agroforestry and eco-friendly farming practices', 4),
('environment', 'Conservation Education', 'Environmental awareness programs for communities and visitors', 5),
('environment', 'Climate Adaptation', 'Promoting sustainable land use and eco-friendly practices for resilience', 6);

-- Insert Focus Area Items for Economic
INSERT INTO `philanthropy_focus_items` (`focus_id`, `item_title`, `item_description`, `display_order`) VALUES
('economic', 'Artisan Support', 'Sourcing crafts directly, providing training, and integrating sales into visitor experiences', 1),
('economic', 'Cooperative Development', 'Supporting farmer and artisan cooperatives for collective economic strength', 2),
('economic', 'Tourism Training', 'Preparing locals for careers in hospitality, guiding, and tourism services', 3),
('economic', 'Market Access', 'Connecting local producers with fair trade markets and tourism supply chains', 4),
('economic', 'Women\'s Leadership', 'Leadership roles in homestays, cooperatives, and training programs', 5),
('economic', 'Financial Management', 'Training in financial management and business development skills', 6);

-- Insert Visitor Engagement Activities
INSERT INTO `philanthropy_engagement` (`engagement_title`, `engagement_icon`, `engagement_description`, `display_order`) VALUES
('Farm-to-Table Experiences',
 'fas fa-utensils',
 'Visitors participate in farm-to-table activities, learn traditional recipes, and support local agriculture. This integration of local food experiences connects travelers directly with community livelihoods.',
 1),
('Homestay Experiences',
 'fas fa-home',
 'Visitors live with families, participate in daily life, learn traditional skills, and support equitable income distribution. Homestays differ from traditional lodging by offering authentic cultural immersion.',
 2),
('Conservation Participation',
 'fas fa-tree',
 'Visitors participate in measurable conservation actions including tree planting, wildlife monitoring, habitat restoration, and eco-agriculture projects, creating direct positive environmental impact.',
 3),
('Cultural Exchange',
 'fas fa-music',
 'Cultural exchange is structured through storytelling, music, dance, and cooking experiences led by community members, fostering mutual learning and preserving oral traditions.',
 4);

-- Insert Impact Stories
INSERT INTO `philanthropy_stories` (`story_title`, `story_excerpt`, `story_image`, `story_link`, `display_order`) VALUES
('From Village to University',
 'Marie\'s journey from a rural village to becoming the first in her family to attend university, supported by our scholarship program.',
 'assets/images/story-education.jpg',
 '#',
 1),
('Saving Lives Through Clean Water',
 'How a community-led water project reduced waterborne diseases by 80% and transformed daily life for 500 families.',
 'assets/images/story-health.jpg',
 '#',
 2),
('Protecting Gorillas, Empowering Communities',
 'Former poachers become conservation champions through our community-based conservation program.',
 'assets/images/story-conservation.jpg',
 '#',
 3);

-- Insert Partnership Opportunities
INSERT INTO `philanthropy_partnerships` (`partnership_title`, `partnership_icon`, `partnership_description`, `partnership_link`, `display_order`) VALUES
('Individual Donors',
 'fas fa-user-friends',
 'Make a direct impact through one-time donations or monthly giving programs. Every contribution, no matter the size, makes a difference.',
 '#donate',
 1),
('Corporate Partners',
 'fas fa-building',
 'Align your business with meaningful social impact through corporate social responsibility partnerships and employee engagement programs.',
 '#corporate',
 2),
('Educational Institutions',
 'fas fa-graduation-cap',
 'Collaborate on research, student exchange programs, and educational initiatives that benefit both academic institutions and local communities.',
 '#education',
 3),
('NGO Collaborations',
 'fas fa-hands-helping',
 'Work together with other non-profit organizations to maximize impact and avoid duplication of efforts in community development.',
 '#ngo',
 4);