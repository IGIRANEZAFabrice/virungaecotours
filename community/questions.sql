-- ============================================
-- Community Tourism Page Database Schema
-- Simplified with minimal tables
-- ============================================

-- Drop tables if they exist
DROP TABLE IF EXISTS `question_qa`;
DROP TABLE IF EXISTS `question_sections`;
DROP TABLE IF EXISTS `question_hero`;

-- Table 1: Hero & Intro Content
CREATE TABLE `question_hero` (
  `id` INT(11) PRIMARY KEY AUTO_INCREMENT,
  `hero_title` VARCHAR(255) NOT NULL,
  `hero_subtitle` VARCHAR(255) NOT NULL,
  `hero_description` TEXT NOT NULL,
  `hero_image` VARCHAR(255) DEFAULT NULL,
  `intro_title` VARCHAR(255) NOT NULL,
  `intro_text` TEXT NOT NULL,
  `updated_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Table 2: Sections (for Table of Contents)
CREATE TABLE `question_sections` (
  `id` INT(11) PRIMARY KEY AUTO_INCREMENT,
  `section_id` VARCHAR(50) NOT NULL UNIQUE,
  `icon_class` VARCHAR(100) NOT NULL,
  `title` VARCHAR(255) NOT NULL,
  `description` TEXT NOT NULL,
  `section_title` VARCHAR(255) NOT NULL,
  `section_description` TEXT NOT NULL,
  `display_order` INT(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Table 3: Questions & Answers
CREATE TABLE `question_qa` (
  `id` INT(11) PRIMARY KEY AUTO_INCREMENT,
  `section_id` VARCHAR(50) NOT NULL,
  `question_number` INT(11) NOT NULL,
  `question` TEXT NOT NULL,
  `answer` TEXT NOT NULL,
  `display_order` INT(11) NOT NULL,
  FOREIGN KEY (`section_id`) REFERENCES `question_sections`(`section_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ============================================
-- INSERT STATEMENTS
-- ============================================

-- Insert Hero & Intro Content
INSERT INTO `question_hero` (`hero_title`, `hero_subtitle`, `hero_description`, `hero_image`, `intro_title`, `intro_text`) VALUES
('Community-Based & Regenerative Tourism', 
 'A Professional Guide by Virunga Ecotours', 
 'Discover how tourism can benefit local communities, preserve culture, and restore natural ecosystems through our comprehensive guide to ethical and regenerative travel.',
 '../images/community-hero-bg.jpg',
 'Introduction',
 'Virunga Ecotours specializes in tourism that benefits local communities, preserves culture, and restores natural ecosystems. Our community-based tourism (CBT) and regenerative travel programs are designed to create meaningful experiences for travelers while delivering tangible benefits to host communities and the environment.');

-- Insert Sections
INSERT INTO `question_sections` (`section_id`, `icon_class`, `title`, `description`, `section_title`, `section_description`, `display_order`) VALUES
('section-1', 'fas fa-users', 'Understanding CBT', 'Learn the fundamentals of community-based tourism', 'Section 1: Understanding Community-Based Tourism (CBT)', 'Learn the fundamentals of community-led tourism and how it benefits local communities.', 1),
('section-2', 'fas fa-leaf', 'Regenerative Principles', 'Discover how tourism can restore ecosystems', 'Section 2: Regenerative Tourism Principles', 'Discover how tourism can actively restore ecosystems and strengthen communities.', 2),
('section-3', 'fas fa-heart', 'Ethical Travel', 'Guidelines for responsible and respectful tourism', 'Section 3: Ethical & Responsible Travel', 'Guidelines for respectful and responsible tourism practices.', 3),
('section-4', 'fas fa-handshake', 'Visitor Engagement', 'How to create meaningful travel experiences', 'Section 4: Visitor Engagement & Experience', 'Creating meaningful and transformative travel experiences.', 4),
('section-5', 'fas fa-chart-line', 'Measuring Impact', 'Tracking social and environmental outcomes', 'Section 5: Measuring and Communicating Impact', 'How we track and communicate the outcomes of our tourism programs.', 5),
('section-6', 'fas fa-globe', 'Broader Benefits', 'The wider impact of community-based tourism', 'Section 6: The Broader Benefits of CBT & Regenerative Tourism', 'Understanding the wide-reaching impact of community-based tourism.', 6),
('section-7', 'fas fa-compass', 'Best Practices', 'Guidelines and recommendations for travelers', 'Section 7: Best Practices for Travelers', 'Guidelines and recommendations for responsible and meaningful travel.', 7),
('section-8', 'fas fa-star', 'Long-Term Vision', 'Transformative travel and future goals', 'Section 8: Long-Term Vision and Transformative Travel', 'Our vision for the future of community-based and regenerative tourism.', 8);

-- Insert Questions for Section 1
INSERT INTO `question_qa` (`section_id`, `question_number`, `question`, `answer`, `display_order`) VALUES
('section-1', 1, 'What is CBT?', 'Community-based tourism is led, managed, and owned by local communities, ensuring economic, social, and cultural benefits remain local while preserving heritage and nature.', 1),
('section-1', 2, 'How does Virunga Ecotours implement CBT?', 'Through partnerships with homestays, Red Rocks Initiatives, indigenous guides, and artisan cooperatives, ensuring communities lead decisions and receive direct benefits.', 2),
('section-1', 3, 'How can travelers ensure their trip benefits local communities?', 'Book locally-owned accommodations, hire resident guides, and support community-led experiences.', 3),
('section-1', 4, 'How does CBT support cultural preservation?', 'Communities share traditions, crafts, and culinary practices on their terms, reinforcing cultural identity.', 4),
('section-1', 5, 'Can CBT contribute to gender equity?', 'Yes. Women participate as guides, homestay hosts, and cooperative leaders, gaining income, skills, and leadership opportunities.', 5),
('section-1', 6, 'How does CBT address local poverty?', 'By providing direct income, creating education and healthcare opportunities, and reducing dependence on external aid.', 6);

-- Insert Questions for Section 2
INSERT INTO `question_qa` (`section_id`, `question_number`, `question`, `answer`, `display_order`) VALUES
('section-2', 7, 'How is regenerative tourism different from sustainable tourism?', 'Sustainable tourism minimizes harm, while regenerative tourism actively restores ecosystems, strengthens cultural integrity, and improves livelihoods.', 1),
('section-2', 8, 'How does Virunga Ecotours measure community and environmental impact?', 'Through social assessments, employment metrics, visitor feedback, and ecological monitoring, ensuring transparency and accountability.', 2),
('section-2', 9, 'What role do youth play in CBT?', 'Youth are trained as guides, performers, and hospitality staff, ensuring skill transfer, employment, and cultural continuity.', 3),
('section-2', 10, 'How does tourism support biodiversity?', 'Revenue funds conservation initiatives, provides alternatives to poaching or deforestation, and increases environmental awareness.', 4),
('section-2', 11, 'Can tourism regenerate degraded landscapes?', 'Yes. Projects such as reforestation, eco-agriculture, and habitat restoration have measurable ecological benefits.', 5);

-- Insert Questions for Section 3
INSERT INTO `question_qa` (`section_id`, `question_number`, `question`, `answer`, `display_order`) VALUES
('section-3', 12, 'How can travelers avoid cultural exploitation?', 'Participate only in community-led experiences, respect consent, avoid commodifying rituals, and prioritize learning over entertainment.', 1),
('section-3', 13, 'How are profits shared in CBT models?', 'Profits are reinvested locally and distributed among community members, cooperatives, and development projects.', 2),
('section-3', 14, 'How does Virunga Ecotours support artisans?', 'By sourcing crafts directly, providing training, and integrating sales into visitor experiences.', 3),
('section-3', 15, 'How can regenerative tourism influence visitor behavior beyond the trip?', 'Through immersive, respectful experiences, visitors develop environmental awareness and cultural appreciation that persist long-term.', 4);

-- Insert Questions for Section 4
INSERT INTO `question_qa` (`section_id`, `question_number`, `question`, `answer`, `display_order`) VALUES
('section-4', 16, 'How is visitor experience enhanced through CBT?', 'Hands-on participation in cooking, farming, crafts, and storytelling deepens understanding and connection with local life.', 1),
('section-4', 17, 'How does Virunga Ecotours integrate local food experiences?', 'Visitors participate in farm-to-table activities, learn traditional recipes, and support local agriculture.', 2),
('section-4', 18, 'How are training programs structured for hosts?', 'Training covers hospitality, language, environmental stewardship, financial management, and guest relations.', 3),
('section-4', 19, 'How does CBT foster long-term resilience?', 'By diversifying income, strengthening cultural identity, engaging youth, and promoting sustainable practices.', 4),
('section-4', 20, 'Can visitors participate in measurable conservation actions?', 'Yes. Activities include tree planting, wildlife monitoring, habitat restoration, and eco-agriculture projects.', 5);

-- Insert Questions for Section 5
INSERT INTO `question_qa` (`section_id`, `question_number`, `question`, `answer`, `display_order`) VALUES
('section-5', 21, 'How is social impact measured?', 'Through surveys, participatory assessments, employment data, and community feedback.', 1),
('section-5', 22, 'Are there metrics for ecological regeneration?', 'Yes. Tree growth, biodiversity indicators, and reduced environmental degradation are tracked alongside social indicators.', 2),
('section-5', 23, 'How is visitor feedback incorporated?', 'Through surveys, interviews, and community discussions, informing experience improvement and decision-making.', 3),
('section-5', 24, 'How does regenerative tourism address climate adaptation?', 'By promoting agroforestry, sustainable land use, and eco-friendly practices that enhance community resilience.', 4),
('section-5', 25, 'How does Virunga Ecotours ensure transparency?', 'Through annual reports, third-party audits, community consultations, and clear communication of outcomes.', 5);

-- Insert Questions for Section 6
INSERT INTO `question_qa` (`section_id`, `question_number`, `question`, `answer`, `display_order`) VALUES
('section-6', 26, 'How can CBT improve public health?', 'Tourism revenue funds clean water, clinics, and nutrition initiatives while supporting health education.', 1),
('section-6', 27, 'How does CBT affect local governance?', 'It strengthens community institutions by involving them in decision-making and resource management.', 2),
('section-6', 28, 'Are there risks of over-tourism?', 'Potentially. Virunga Ecotours manages visitor numbers, promotes off-peak travel, and emphasizes low-impact itineraries.', 3),
('section-6', 29, 'How does regenerative tourism align with nature\'s principles?', 'By prioritizing adaptation, resilience, and ecosystem health, creating thriving human and natural communities.', 4),
('section-6', 30, 'Can CBT reduce migration pressures?', 'Yes. By providing meaningful local employment, youth are less likely to migrate for work.', 5);

-- Insert Questions for Section 7
INSERT INTO `question_qa` (`section_id`, `question_number`, `question`, `answer`, `display_order`) VALUES
('section-7', 31, 'How should travelers prepare for CBT experiences?', 'Research local customs, learn basic language phrases, pack appropriately, and approach with openness and respect.', 1),
('section-7', 32, 'What should travelers expect from homestays?', 'Simple accommodations, authentic meals, family interaction, and opportunities to participate in daily activities.', 2),
('section-7', 33, 'How can travelers support local economies beyond tourism?', 'Purchase local crafts, support community projects, and maintain connections through fair trade partnerships.', 3),
('section-7', 34, 'What role does storytelling play in CBT?', 'Storytelling preserves oral traditions, educates visitors, and creates emotional connections between cultures.', 4);

-- Insert Questions for Section 8
INSERT INTO `question_qa` (`section_id`, `question_number`, `question`, `answer`, `display_order`) VALUES
('section-8', 35, 'What is Virunga Ecotours\' long-term vision?', 'To create a model where tourism actively regenerates ecosystems, strengthens communities, and transforms both visitors and hosts.', 1),
('section-8', 36, 'How can CBT scale without losing authenticity?', 'Through careful planning, community ownership, visitor limits, and maintaining cultural integrity in all experiences.', 2),
('section-8', 37, 'What makes travel truly transformative?', 'Deep cultural exchange, meaningful participation, personal reflection, and lasting connections that inspire positive change.', 3),
('section-8', 38, 'How does regenerative tourism contribute to global sustainability?', 'By demonstrating that tourism can be a force for positive change, inspiring replication and policy support worldwide.', 4);