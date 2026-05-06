-- Complaints Page Database Schema
-- Created for Virunga Ecotours Common Complaints & Solutions Page

-- Main page content table
CREATE TABLE IF NOT EXISTS `complaints_page` (
  `id` INT(11) PRIMARY KEY AUTO_INCREMENT,
  `hero_title` VARCHAR(255) NOT NULL DEFAULT 'Virunga Massif Solutions',
  `hero_subtitle` TEXT NOT NULL DEFAULT 'Professional solutions for 50+ common visitor challenges across Rwanda, Uganda, and the Democratic Republic of Congo. Experience seamless wildlife adventures with our expert guidance and local expertise.',
  `hero_image` VARCHAR(255) DEFAULT NULL,
  `updated_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Parallax section content
CREATE TABLE IF NOT EXISTS `complaints_parallax` (
  `id` INT(11) PRIMARY KEY AUTO_INCREMENT,
  `parallax_title` VARCHAR(255) NOT NULL DEFAULT 'Expert Wildlife Experiences',
  `parallax_subtitle` TEXT NOT NULL DEFAULT 'With over a decade of experience guiding visitors through the breathtaking landscapes of the Virunga Massif, we ensure every encounter with mountain gorillas, golden monkeys, and local communities creates memories that last a lifetime.',
  `updated_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Problem cards table with section column (1 = up, 2 = down)
CREATE TABLE IF NOT EXISTS `complaints_problems` (
  `id` INT(11) PRIMARY KEY AUTO_INCREMENT,
  `problem_number` INT(11) NOT NULL,
  `section` INT(11) NOT NULL COMMENT '1 = Before Parallax (UP), 2 = After Parallax (DOWN)',
  `problem_title` VARCHAR(255) NOT NULL,
  `problem_icon` VARCHAR(50) NOT NULL DEFAULT 'fas fa-star',
  `problem_description` TEXT NOT NULL,
  `solution_text` TEXT NOT NULL,
  `card_order` INT(11) NOT NULL,
  `updated_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- CTA/Conclusion section (static, not editable)
-- This is hardcoded in PHP and not stored in database

-- Insert default page data
INSERT INTO `complaints_page` (`id`, `hero_title`, `hero_subtitle`) VALUES
(1, 'Virunga Massif Solutions', 'Professional solutions for 50+ common visitor challenges across Rwanda, Uganda, and the Democratic Republic of Congo. Experience seamless wildlife adventures with our expert guidance and local expertise.');

-- Insert parallax section data
INSERT INTO `complaints_parallax` (`id`, `parallax_title`, `parallax_subtitle`) VALUES
(1, 'Expert Wildlife Experiences', 'With over a decade of experience guiding visitors through the breathtaking landscapes of the Virunga Massif, we ensure every encounter with mountain gorillas, golden monkeys, and local communities creates memories that last a lifetime.');

-- Insert problem cards - SECTION 1 (UP - Before Parallax)
INSERT INTO `complaints_problems` (`problem_number`, `section`, `problem_title`, `problem_icon`, `problem_description`, `solution_text`, `card_order`) VALUES
(1, 1, 'Gorilla Permit Availability', 'fas fa-ticket-alt', 'Many clients struggle with limited gorilla permits.', 'Virunga Ecotours secures permits in advance and informs clients of peak booking periods.', 1),
(2, 1, 'Golden Monkey Permit Confusion', 'fas fa-paw', 'Tourists are often unclear about golden monkey tracking requirements.', 'Clear guidance, booking, and document preparation.', 2),
(3, 1, 'Cross-Border Entry Requirements', 'fas fa-passport', 'Traveling across Rwanda, Uganda, and DRC involves visas and documentation.', 'Expert handling of visa assistance and entry requirements.', 3),
(4, 1, 'Transport Logistics', 'fas fa-bus', 'Independent travelers face unreliable road transport.', 'Virunga Ecotours provides safe, comfortable vehicles with experienced drivers familiar with regional roads.', 4),
(5, 1, 'Language Barriers', 'fas fa-language', 'Communication with local guides and communities can be challenging.', 'Multilingual guides fluent in English, French, and local dialects.', 5),
(6, 1, 'Inaccurate Park Rules Knowledge', 'fas fa-info-circle', 'Visitors often don\'t know park regulations.', 'Comprehensive briefings before each activity.', 6),
(7, 1, 'Safety Concerns in Remote Areas', 'fas fa-shield-alt', 'Safety in national parks can be intimidating.', 'Trained guides, first-aid protocols, and real-time communication equipment.', 7),
(8, 1, 'Accommodation Booking Confusion', 'fas fa-bed', 'Difficulty finding suitable lodges or homestays.', 'Curated options based on client preferences and comfort levels.', 8),
(9, 1, 'Seasonal Weather Challenges', 'fas fa-cloud-rain', 'Heavy rains can disrupt plans.', 'Flexible itineraries and alternative activities prepared in advance.', 9),
(10, 1, 'Wildlife Sighting Uncertainty', 'fas fa-binoculars', 'Fear of not seeing gorillas or other animals.', 'Expert trackers maximize chances of sightings and provide backup wildlife experiences.', 10),
(11, 1, 'High Costs of Meals and Services', 'fas fa-dollar-sign', 'Unexpected expenses can frustrate travelers.', 'Transparent pricing, package deals, and local dining recommendations.', 11),
(12, 1, 'Health Requirements', 'fas fa-syringe', 'Vaccinations and medical preparations are often unclear.', 'Pre-travel guidance and coordination with health authorities.', 12),
(13, 1, 'Travel Insurance Understanding', 'fas fa-umbrella', 'Many clients overlook insurance needs.', 'Assistance in selecting appropriate insurance for high-risk activities.', 13),
(14, 1, 'Limited Connectivity in Remote Areas', 'fas fa-wifi', 'Poor network coverage can worry clients.', 'Guides maintain communication devices for emergencies.', 14),
(15, 1, 'Documentation Requirements', 'fas fa-file-alt', 'Confusion about required IDs, permits, and confirmations.', 'Clear, step-by-step checklists for travelers.', 15),
(16, 1, 'Local Currency Challenges', 'fas fa-coins', 'Difficulty in managing payments in multiple countries.', 'Advice on currency exchange and secure cash handling.', 16),
(17, 1, 'Last-Minute Itinerary Changes', 'fas fa-calendar-alt', 'Unforeseen events can require plan adjustments.', 'Dynamic scheduling and quick adaptation by expert planners.', 17),
(18, 1, 'Age Restrictions for Activities', 'fas fa-child', 'Families with children often face limitations.', 'Age-appropriate alternatives and guidance on activity suitability.', 18),
(19, 1, 'Dietary Preferences', 'fas fa-utensils', 'Limited knowledge of local food options for vegans or specific diets.', 'Customized meal plans and restaurant arrangements.', 19),
(20, 1, 'Environmental and Terrain Hazards', 'fas fa-exclamation-triangle', 'Clients may underestimate hiking difficulty.', 'Pre-activity briefings and safety equipment provisions.', 20),
(21, 1, 'Lack of Cultural Context', 'fas fa-users', 'Visitors often miss local traditions.', 'Guides provide rich cultural and historical explanations during activities.', 21),
(22, 1, 'Misleading Online Information', 'fas fa-search', 'Online travel advice can be outdated or incorrect.', 'Up-to-date guidance based on local knowledge.', 22),
(23, 1, 'Wildlife Encounter Risks', 'fas fa-paw', 'Safety risks during wildlife tracking.', 'Professional monitoring and strict adherence to safety protocols.', 23),
(24, 1, 'Lost or Stolen Items', 'fas fa-key', 'Risk of personal items being lost.', 'Secure accommodations and guidance on keeping valuables safe.', 24),
(25, 1, 'Miscommunication With Local Operators', 'fas fa-phone', 'Confusion with local service providers.', 'Direct coordination and advocacy for clients.', 25);

-- Insert problem cards - SECTION 2 (DOWN - After Parallax)
INSERT INTO `complaints_problems` (`problem_number`, `section`, `problem_title`, `problem_icon`, `problem_description`, `solution_text`, `card_order`) VALUES
(26, 2, 'Limited Night Activities', 'fas fa-moon', 'Few options for evening exploration.', 'Curated night walks, community visits, and cultural shows.', 1),
(27, 2, 'Delayed or Canceled Activities', 'fas fa-clock', 'Activities affected by weather or logistics.', 'Immediate rescheduling or alternative experiences.', 2),
(28, 2, 'Photography Restrictions', 'fas fa-camera', 'Rules may limit photography in parks.', 'Guidance on legal photography zones and tips for optimal shots.', 3),
(29, 2, 'Lack of Child-Friendly Activities', 'fas fa-baby', 'Families struggle to find engaging options for children.', 'Child-centric excursions like Buhanga EcoPark visits.', 4),
(30, 2, 'Mismanaged Group Tours', 'fas fa-users', 'Large groups often experience delays and confusion.', 'Efficient group coordination and clear itineraries.', 5),
(31, 2, 'Unclear Local Etiquette', 'fas fa-handshake', 'Risk of offending locals unknowingly.', 'Cultural briefings and community engagement guidance.', 6),
(32, 2, 'Difficulty Understanding Park Conservation Efforts', 'fas fa-leaf', 'Visitors miss key conservation narratives.', 'Guides provide detailed explanations without overwhelming.', 7),
(33, 2, 'Travel Fatigue', 'fas fa-tired', 'Long drives and treks can be exhausting.', 'Optimized schedules with rest periods and comfortable transport.', 8),
(34, 2, 'Limited Access to Medical Services', 'fas fa-hospital', 'Medical emergencies in remote areas.', 'First-aid trained guides and access to nearby health facilities.', 9),
(35, 2, 'Overbooking in Peak Seasons', 'fas fa-calendar-times', 'Difficulty securing permits and lodgings.', 'Early reservations and priority access through established networks.', 10),
(36, 2, 'Difficulty Aligning Travel Dates with Local Festivals or Events', 'fas fa-calendar-times', 'Many travelers miss unique cultural festivals because they don\'t know the local calendars.', 'Virunga Ecotours integrates regional cultural events into itineraries, aligning visits with festivals, traditional dances, and community gatherings for a richer experience.', 11),
(37, 2, 'Unclear Border Health Protocols', 'fas fa-calendar-times', 'Clients are often uncertain about health checks and vaccination proof when crossing borders in the Virunga region.', 'Virunga Ecotours provides up-to-date guidance on border health requirements, prepares travelers with necessary documentation, and coordinates with local authorities for smooth passage.', 12);

