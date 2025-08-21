<?php
// Enable error reporting for debugging
error_reporting(E_ALL);
ini_set('display_errors', 1);

// Include database connection
require_once './admin/config/connection.php';

// Initialize default values
$hero_slides = [];
$card_title1 = $card_title2 = "Explore With Us";
$card_desc1 = $card_desc2 = "Discover amazing destinations";
$card_img1 = $card_img2 = "images/default-card.jpg";
$country1 = $country2 = $country3 = "Featured Destination";
$desc1 = $desc2 = $desc3 = "Experience unique adventures";
$dest_img1 = $dest_img2 = $dest_img3 = "images/default-destination.jpg";
$attractions = [];
$tours = [];
$partners = [];
$blogs = [];
$tour_categories = [];

// Function to clean image path
function cleanImagePath($path) {
    // Remove '../../' from the beginning of the path
    return preg_replace('/^\.\.\/\.\.\//', '', $path);
}

// Only try to fetch data if connection exists
if ($conn) {
    // Fetch all hero slides data dynamically
    $hero_stmt = $conn->prepare("SELECT id, title, description, image_url FROM home_hero ORDER BY id ASC");
    if ($hero_stmt && $hero_stmt->execute()) {
        $hero_result = $hero_stmt->get_result();
        while ($row = $hero_result->fetch_assoc()) {
            $row['image_url'] = cleanImagePath($row['image_url']);
            $hero_slides[] = $row;
        }
        $hero_stmt->close();
    }

    // Fallback: If no slides found, create a default slide
    if (empty($hero_slides)) {
        $hero_slides[] = [
            'id' => 1,
            'title' => 'Welcome to Virunga Ecotours',
            'description' => 'Experience the beauty of nature with sustainable tourism',
            'image_url' => 'images/default-hero.jpg'
        ];
    }
    
    // Fetch under hero cards
    $cards_stmt = $conn->prepare("SELECT title, description, image_url FROM home_under_hero_cards ORDER BY id ASC LIMIT 2");
    if ($cards_stmt && $cards_stmt->execute()) {
        $cards_stmt->store_result();

        $cards_stmt->bind_result($card_title1, $card_desc1, $card_img1);
        $cards_stmt->fetch();

        $cards_stmt->bind_result($card_title2, $card_desc2, $card_img2);
        $cards_stmt->fetch();

        $cards_stmt->close();
    }

    // Fetch destinations
    $dest_stmt = $conn->prepare("SELECT country, description, image_url FROM home_destinations ORDER BY id ASC LIMIT 3");
    if ($dest_stmt && $dest_stmt->execute()) {
        $dest_stmt->store_result();

        $dest_stmt->bind_result($country1, $desc1, $dest_img1);
        $dest_stmt->fetch();
        $dest_img1 = cleanImagePath($dest_img1);

        $dest_stmt->bind_result($country2, $desc2, $dest_img2);
        $dest_stmt->fetch();
        $dest_img2 = cleanImagePath($dest_img2);

        $dest_stmt->bind_result($country3, $desc3, $dest_img3);
        $dest_stmt->fetch();
        $dest_img3 = cleanImagePath($dest_img3);

        $dest_stmt->close();
    }

    // Fetch attractions
    $attractions_stmt = $conn->prepare("SELECT id, title, image_url FROM home_attractions ORDER BY id ASC LIMIT 8");
    if ($attractions_stmt && $attractions_stmt->execute()) {
        $attractions_result = $attractions_stmt->get_result();
        while ($row = $attractions_result->fetch_assoc()) {
            $row['image_url'] = cleanImagePath($row['image_url']);
            $attractions[] = $row;
        }
        $attractions_stmt->close();
    }

    // Fetch community tours
    $tours_stmt = $conn->prepare("SELECT tour_id, title, category, days_count, cover_image_path, short_description FROM tours WHERE category = 'adventure' ORDER BY created_at DESC LIMIT 3");
    if ($tours_stmt && $tours_stmt->execute()) {
        $tours_result = $tours_stmt->get_result();
        while ($row = $tours_result->fetch_assoc()) {
            $tours[] = $row;
        }
        $tours_stmt->close();
    }

    // Modified fetch for random tours - fetch ALL tours except adventure category
    $random_tours_stmt = $conn->prepare("
        SELECT 
            t.tour_id,
            t.title,
            t.days_count,
            t.cover_image_path,
            t.short_description,
            t.category 
        FROM tours t 
        WHERE LOWER(t.category) != 'adventure'
        ORDER BY t.created_at DESC LIMIT 3
    ");

    if ($random_tours_stmt && $random_tours_stmt->execute()) {
        $random_tours_result = $random_tours_stmt->get_result();
        $random_tours = [];
        while ($row = $random_tours_result->fetch_assoc()) {
            $random_tours[] = $row;
        }
        $random_tours_stmt->close();
    }

    // Fetch partners
    $partners_stmt = $conn->prepare("SELECT web_url, logo_url FROM home_partners ORDER BY id ASC");
    if ($partners_stmt && $partners_stmt->execute()) {
        $partners_result = $partners_stmt->get_result();
        while ($row = $partners_result->fetch_assoc()) {
            $row['logo_url'] = cleanImagePath($row['logo_url']);
            $partners[] = $row;
        }
        $partners_stmt->close();
    }

    // Fetch blogs for the blog section - Updated Query
    $blogs_stmt = $conn->prepare("
        SELECT 
            p.blog_id,      -- Changed from post_id
            p.title,
            p.cover_image,
            p.author,
            p.read_minutes, -- Changed from read_time
            p.main_headline,-- Changed from headline
            p.introduction,
            p.created_at,
            bc.category_name -- Fetch category name from joined table
        FROM blog_posts p
        JOIN blog_categories bc ON p.category_id = bc.category_id -- Join with categories table
        WHERE p.status = 'published' -- Only fetch published posts
        ORDER BY p.created_at DESC 
        LIMIT 3
    ");
    
    if ($blogs_stmt && $blogs_stmt->execute()) {
        $blogs_result = $blogs_stmt->get_result();
        $blogs = []; // Re-initialize blogs array here
        while ($row = $blogs_result->fetch_assoc()) {
            $row['cover_image'] = cleanImagePath($row['cover_image']);
            // Use main_headline if needed, or keep introduction for short intro
            $row['short_intro'] = substr(strip_tags($row['introduction']), 0, 200) . '...'; 
            // The category is now available as $row['category_name']
            $blogs[] = $row;
        }
        $blogs_stmt->close();
    } else {
        // Log error if statement preparation or execution fails
        error_log("Blog fetching failed: " . $conn->error);
    }

    // Fetch home about section data
    $about_stmt = $conn->prepare("SELECT title, slide_description, youtube_url FROM home_about WHERE id = 1 LIMIT 1");
    if ($about_stmt && $about_stmt->execute()) {
        $about_result = $about_stmt->get_result();
        $about_data = $about_result->fetch_assoc();
        $about_stmt->close();
    } else {
        // Default values if query fails
        $about_data = [
            'title' => 'Transforming Ideas Into Reality',
            'slide_description' => 'Virunga Ecotours is a leader in sustainable travel...',
            'youtube_url' => ''
        ];
    }
} else {
    error_log("Database connection failed - using default values");
}
