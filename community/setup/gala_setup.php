<?php
// Gala Dinner Database Setup
require_once '../../admin/config/connection.php';

$success = true;
$messages = [];

// Create gala_hero table
$hero_table = "CREATE TABLE IF NOT EXISTS `gala_hero` (
  `id` INT(11) PRIMARY KEY AUTO_INCREMENT,
  `hero_title` VARCHAR(255) NOT NULL,
  `hero_subtitle` VARCHAR(255) NOT NULL,
  `hero_description` TEXT NOT NULL,
  `hero_image` VARCHAR(255) DEFAULT NULL,
  `intro_text` TEXT NOT NULL,
  `activities_title` VARCHAR(255) NOT NULL,
  `activities_intro` TEXT NOT NULL,
  `dinner_title` VARCHAR(255) DEFAULT 'The Gala Dinner Experience',
  `dinner_text` TEXT DEFAULT NULL,
  `dinner_image` VARCHAR(255) DEFAULT NULL,
  `final_title` VARCHAR(255) DEFAULT 'More Than a Dinner—A Bridge of Friendship',
  `final_text` TEXT DEFAULT NULL,
  `updated_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4";

if (!mysqli_query($conn, $hero_table)) {
    $success = false;
    $messages[] = "Error creating gala_hero: " . mysqli_error($conn);
}

// Create gala_activities table
$activities_table = "CREATE TABLE IF NOT EXISTS `gala_activities` (
  `id` INT(11) PRIMARY KEY AUTO_INCREMENT,
  `activity_title` VARCHAR(255) NOT NULL,
  `activity_description` TEXT NOT NULL,
  `activity_image` VARCHAR(255) DEFAULT NULL,
  `display_order` INT(11) NOT NULL DEFAULT 0,
  `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  `updated_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4";

if (!mysqli_query($conn, $activities_table)) {
    $success = false;
    $messages[] = "Error creating gala_activities: " . mysqli_error($conn);
}

// Create gala_importance table
$importance_table = "CREATE TABLE IF NOT EXISTS `gala_importance` (
  `id` INT(11) PRIMARY KEY AUTO_INCREMENT,
  `importance_title` VARCHAR(255) NOT NULL,
  `importance_icon` VARCHAR(100) NOT NULL,
  `importance_description` TEXT NOT NULL,
  `display_order` INT(11) NOT NULL DEFAULT 0,
  `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  `updated_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4";

if (!mysqli_query($conn, $importance_table)) {
    $success = false;
    $messages[] = "Error creating gala_importance: " . mysqli_error($conn);
}

// Insert default data if tables are empty
if ($success) {
    $check = mysqli_query($conn, "SELECT COUNT(*) as count FROM gala_hero");
    $result = mysqli_fetch_assoc($check);

    if ($result['count'] == 0) {
        // Insert hero data
        $hero_insert = "INSERT INTO `gala_hero` (`hero_title`, `hero_subtitle`, `hero_description`, `intro_text`, `activities_title`, `activities_intro`, `dinner_title`, `dinner_text`, `final_title`, `final_text`) VALUES
        ('Gala Local Dinner & Culture Experience',
         'in Musanze',
         'More than an evening meal—it is an immersion into the soul of Musanze. Here, visitors are welcomed not just as travelers, but as friends and family, invited to share food, stories, and moments that reveal the heart of Rwandan life.',
         'The evening atmosphere is warm and authentic. Guests settle into a setting prepared by the community, surrounded by the aroma of freshly made dishes and the friendly welcome of their hosts. Each plate is a chapter of Rwanda\\'s story—cassava grown on volcanic soils, beans slow-cooked with care, bananas turned into sweet or fermented delicacies.',
         'Afternoon Cultural Activities',
         'Before the dinner begins, guests are guided through a selection of afternoon activities that connect them with Musanze\\'s daily life. These experiences create anticipation for the evening feast:',
         'The Gala Dinner Experience',
         'The Gala Dinner is more than a meal—it is a celebration of community, tradition, and connection. Guests sit together with local families, sharing dishes prepared with ingredients from local farms and recipes passed down through generations. The evening unfolds with stories, laughter, and the warmth of genuine hospitality. Each course tells a story of Rwanda\\'s agricultural heritage and culinary traditions.',
         'More Than a Dinner—A Bridge of Friendship',
         'The Gala Local Dinner & Culture Experience is not just another evening activity. It is a bridge of friendship between Musanze\\'s communities and the wider world. Visitors leave with lasting memories of warmth, hospitality, and belonging, while the community strengthens its heritage, pride, and prosperity.')";

        if (mysqli_query($conn, $hero_insert)) {
            $messages[] = "Hero data inserted successfully!";
        } else {
            $messages[] = "Error inserting hero data: " . mysqli_error($conn);
        }

        // Insert activities
        $activities_insert = "INSERT INTO `gala_activities` (`activity_title`, `activity_description`, `activity_image`, `display_order`) VALUES
        ('Village Walk & Farm Visit', 'A walk through the village introduces guests to everyday life—meeting families, seeing crops, and learning how food moves from field to table.', '../images/gala/2.jpg', 1),
        ('Crafts Workshop', 'An encounter with artisans who share skills in basket weaving, pottery, or painting. Each creation carries cultural meaning, turning craft into a storytelling medium.', '../images/gala/1.jpg', 2),
        ('Traditional Music & Dance', 'Songs and dances that have been performed for generations, connecting visitors to the rhythm and spirit of Rwandan culture.', '../images/gala/3.jpg', 3),
        ('Storytelling Session', 'Elders share legends, proverbs, and history, bridging generations and offering visitors a window into Rwanda\\'s living memory.', '../images/gala/5.jpg', 4)";

        if (mysqli_query($conn, $activities_insert)) {
            $messages[] = "Activities inserted successfully!";
        } else {
            $messages[] = "Error inserting activities: " . mysqli_error($conn);
        }

        // Insert importance cards
        $importance_insert = "INSERT INTO `gala_importance` (`importance_title`, `importance_icon`, `importance_description`, `display_order`) VALUES
        ('Cultural Preservation', 'fas fa-scroll', 'Recipes, customs, and oral traditions are celebrated and passed to younger generations.', 1),
        ('Economic Empowerment', 'fas fa-coins', 'Families who farm, cook, or host benefit directly, creating sustainable livelihoods.', 2),
        ('Community Pride', 'fas fa-heart', 'Sharing their culture affirms identity and dignity, strengthening the bonds of the community.', 3),
        ('Traveler Enrichment', 'fas fa-globe', 'Guests leave with memories of connection and meaning, far beyond sightseeing.', 4),
        ('Mutual Understanding', 'fas fa-handshake', 'A shared table dissolves barriers, replacing them with friendships and authentic human connection.', 5)";

        if (mysqli_query($conn, $importance_insert)) {
            $messages[] = "Importance cards inserted successfully!";
        } else {
            $messages[] = "Error inserting importance cards: " . mysqli_error($conn);
        }
    } else {
        $messages[] = "Data already exists in gala_hero table. Skipping insertion.";
    }
}

echo json_encode([
    'success' => $success,
    'messages' => $messages
]);
?>

