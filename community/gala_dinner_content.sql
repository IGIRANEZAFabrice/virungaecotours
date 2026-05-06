-- ============================================
-- Gala Dinner Content - INSERT STATEMENTS
-- ============================================

-- Clear existing data
DELETE FROM `gala_importance`;
DELETE FROM `gala_activities`;
DELETE FROM `gala_hero`;

-- ============================================
-- INSERT HERO & MAIN CONTENT
-- ============================================

INSERT INTO `gala_hero` (
  `hero_title`,
  `hero_subtitle`,
  `hero_description`,
  `intro_text`,
  `activities_title`,
  `activities_intro`,
  `dinner_title`,
  `dinner_text`,
  `final_title`,
  `final_text`
) VALUES (
  'Gala Local Dinner & Culture Experience',
  'in Musanze',
  'More than an evening meal—it is an immersion into the soul of Musanze. Here, visitors are welcomed not just as travelers, but as friends and family, invited to share food, stories, and moments that reveal the heart of Rwandan life.',
  'The evening atmosphere is warm and authentic. Guests settle into a setting prepared by the community, surrounded by the aroma of freshly made dishes and the friendly welcome of their hosts. Each plate is a chapter of Rwanda''s story—cassava grown on volcanic soils, beans slow-cooked with care, bananas turned into sweet or fermented delicacies.',
  'Afternoon Cultural Activities',
  'Before the dinner begins, guests are guided through a selection of afternoon activities that connect them with Musanze''s daily life. These experiences create anticipation for the evening feast:',
  'The Gala Dinner Experience',
  'As the evening unfolds, a feast of traditional dishes is prepared and served by the community—beans, cassava, plantains, goat brochettes, fresh vegetables, and sauces. Drinks include banana beer, fresh juices, and freshly brewed coffee.\n\nThe meal is not just about eating; it is about sharing. Guests and locals sit together at one table, exchanging stories, laughter, and experiences. The dinner becomes a living dialogue—one that honors heritage, fosters pride, and builds new friendships.',
  'More Than a Dinner—A Bridge of Friendship',
  'The Gala Local Dinner & Culture Experience is not just another evening activity. It is a bridge of friendship between Musanze''s communities and the wider world. Visitors leave with lasting memories of warmth, hospitality, and belonging, while the community strengthens its heritage, pride, and prosperity.\n\nThis is the true essence of travel with Virunga Ecotours: where every bite tells a story, and every story builds a bridge.'
);

-- ============================================
-- INSERT AFTERNOON ACTIVITIES
-- ============================================

INSERT INTO `gala_activities` (
  `activity_title`,
  `activity_description`,
  `activity_image`,
  `display_order`
) VALUES
(
  'Local Market & Food Preparation',
  'A guided visit to Musanze''s colorful market where ingredients for the dinner are sourced. Guests may join in small tasks like pounding cassava or roasting maize, adding meaning to the dishes later served.',
  'https://images.unsplash.com/photo-1488459716781-31db52582fe9?ixlib=rb-4.0.3&auto=format&fit=crop&w=2070&q=80',
  1
),
(
  'Crafts Workshop',
  'An encounter with artisans who share skills in basket weaving, pottery, or painting. Each creation carries cultural meaning, turning craft into a storytelling medium.',
  'https://images.unsplash.com/photo-1452860606245-08befc0ff44b?ixlib=rb-4.0.3&auto=format&fit=crop&w=2070&q=80',
  2
),
(
  'Coffee-to-Cup & Banana Beer Brewing',
  'A hands-on session roasting coffee beans or observing the ancestral process of brewing banana beer. Tastings follow, offering a flavorful preview of the evening.',
  'https://images.unsplash.com/photo-1447933601403-0c6688de566e?ixlib=rb-4.0.3&auto=format&fit=crop&w=2061&q=80',
  3
),
(
  'Storytelling & Cultural Sharing',
  'Short sessions with community elders or performers who share folktales, songs, or customs that highlight Rwanda''s oral traditions.',
  'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?ixlib=rb-4.0.3&auto=format&fit=crop&w=2070&q=80',
  4
),
(
  'Village Walk',
  'A gentle stroll through the community, meeting farmers, families, and children at play, providing an authentic glimpse of daily life before the dinner gathering.',
  'https://images.unsplash.com/photo-1578662996442-48f60103fc96?ixlib=rb-4.0.3&auto=format&fit=crop&w=2070&q=80',
  5
);

-- ============================================
-- INSERT IMPORTANCE CARDS
-- ============================================

INSERT INTO `gala_importance` (
  `importance_title`,
  `importance_icon`,
  `importance_description`,
  `display_order`
) VALUES
(
  'Cultural Preservation',
  'fas fa-scroll',
  'Recipes, customs, and oral traditions are celebrated and passed to younger generations.',
  1
),
(
  'Economic Empowerment',
  'fas fa-coins',
  'Families who farm, cook, or host benefit directly, creating sustainable livelihoods.',
  2
),
(
  'Community Pride',
  'fas fa-heart',
  'Sharing their culture affirms identity and dignity, strengthening the bonds of the community.',
  3
),
(
  'Traveler Enrichment',
  'fas fa-globe',
  'Guests leave with memories of connection and meaning, far beyond sightseeing.',
  4
),
(
  'Mutual Understanding',
  'fas fa-handshake',
  'A shared table dissolves barriers, replacing them with friendships and authentic human connection.',
  5
);

-- ============================================
-- VERIFICATION QUERIES
-- ============================================

-- Verify hero content
SELECT COUNT(*) as hero_count FROM `gala_hero`;

-- Verify activities
SELECT COUNT(*) as activities_count FROM `gala_activities`;

-- Verify importance cards
SELECT COUNT(*) as importance_count FROM `gala_importance`;

