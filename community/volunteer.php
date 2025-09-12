
<?php
require_once '../admin/config/connection.php';
// Error reporting for debugging
error_reporting(E_ALL);
ini_set('display_errors', 1);

// Fetch main page info
$page_query = "SELECT * FROM volunteer_page LIMIT 1";
$page_result = mysqli_query($conn, $page_query);
$page = mysqli_fetch_assoc($page_result);

// Fetch involved cards
$cards_query = "SELECT icon, title, description FROM involved_cards WHERE page_id = " . ($page['id'] ?? 1);
$cards_result = mysqli_query($conn, $cards_query);
$involved_cards = [];
if ($cards_result && mysqli_num_rows($cards_result) > 0) {
    while ($row = mysqli_fetch_assoc($cards_result)) {
        $involved_cards[] = $row;
    }
}

// Fetch empowerment programs
$empower_query = "SELECT * FROM empowerment_programs WHERE page_id = " . ($page['id'] ?? 1) . " LIMIT 1";
$empower_result = mysqli_query($conn, $empower_query);
$empower = mysqli_fetch_assoc($empower_result);

// Parse highlights (JSON or comma separated)
$highlights = [];
if (!empty($empower['highlights'])) {
    if (strpos($empower['highlights'], '[') === 0) {
        $highlights = json_decode($empower['highlights'], true);
    } else {
        $highlights = array_map('trim', explode(',', $empower['highlights']));
    }
}
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Volunteer With Us</title>
    <link rel="stylesheet" href="assets/css/volunteer.css">
    <!-- FontAwesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">

    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
     
    <!-- Favicon -->
    <link rel="icon" type="image/x-icon" href="assets/images/logos/logo.jpg">
    <link rel="stylesheet" href="assets/css/impact.css">
    <link rel="stylesheet" href="../css/earthy-theme.css">
    <link rel="stylesheet" href="assets/css/community.css">
    <link rel="stylesheet" href="assets/css/about.css">
</head>
<body>
    <?php include 'includes/header.php'; ?>
        <!-- Hero Section -->
         <section class="page-header">
            <div class="page-header-background">
                <img src="uploads/impact/hero.jpg" alt="About Virunga Ecotours Community" loading="lazy" ondragstart="return false;" oncontextmenu="return false;">
                <div class="page-header-overlay"></div>
            </div>
            <div class="container">
                <div class="page-header-content">
                    <nav class="breadcrumb">
                        <a href="index.php">Community</a>
                        <span class="separator"><i class="fas fa-chevron-right"></i></span>
                        <span class="current">Volunteer with us</span>
                    </nav>
                    <h1 style="color: #ffffff;">Our Impact on Community</h1>
                    <p style="color: #ffffff;">
                        <?php echo !empty($page['page_description']) ? nl2br(htmlspecialchars($page['page_description'])) : "There’s a Virunga Ecotours Community Program volunteering opportunity for everyone. All are welcome to work together, a simple help changes lives of ones in need."; ?>
                    </p>
                </div>
            </div>
        </section>
      

        <!-- Introduction Section -->
        <section class="introduction-section">
            <div class="container">
                <h2 class="section-title">Help Change Lives</h2>
                <p class="section-description">
                    <?php echo !empty($empower['content']) ? nl2br(htmlspecialchars($empower['content'])) : "We believe people want to help communities that they travel to. Join us in inspiring community growth and connection through the joy of travel and meaningful action."; ?>
                </p>
            </div>
        </section>

        <!-- Get Involved Section -->
        <section class="get-involved-section">
            <div class="container">
                <h2 class="section-title">Get Involved</h2>
                <p class="section-description">Discover ways you can give back and learn more about our initiatives.</p>

                <div class="involved-cards">
                    <?php if (count($involved_cards) > 0): ?>
                        <?php foreach ($involved_cards as $card): ?>
                            <div class="involved-card">
                                <div class="card-icon"><?php echo htmlspecialchars($card['icon']); ?></div>
                                <h3><?php echo htmlspecialchars($card['title']); ?></h3>
                                <p><?php echo nl2br(htmlspecialchars($card['description'])); ?></p>
                            </div>
                        <?php endforeach; ?>
                    <?php else: ?>
                        <p>No involvement options available yet.</p>
                    <?php endif; ?>
                </div>
            </div>
            
        </section>
          <!-- Parallax Scrolling Section -->
        <section class="parallax-section-v">
            <div class="parallax-overlay-v">
                <div class="parallax-content-v">
                    <h2>Preserving Heritage, Empowering Futures</h2>
                    <p style="color: #ffffff;">Empowering you to give back to communities around the world.</p>
                </div>
            </div>
        </section>

        
        <!-- Learn More Section -->
        <section class="learn-more-section">
            <div class="container">
                <h2 class="section-title">
                    <?php echo !empty($empower['section_title']) ? htmlspecialchars($empower['section_title']) : "Empowering Women Through Traditional Arts"; ?>
                </h2>
                <p class="section-description">
                    <?php echo !empty($empower['section_description']) ? nl2br(htmlspecialchars($empower['section_description'])) : "Discover how Virunga community programs create lasting impact through cultural preservation and economic empowerment."; ?>
                </p>
                
                <div class="empowerment-content">
                    <div class="empowerment-text">
                        <?php if (!empty($highlights)): ?>
                            <div class="impact-list" style="margin-bottom:1em;">
                                <?php echo implode('<br>', array_map('htmlspecialchars', $highlights)); ?>
                            </div>
                        <?php endif; ?>
                        <p>
                            <?php echo !empty($empower['content']) ? nl2br(htmlspecialchars($empower['content'])) : "These programs have transformed countless lives, allowing women to become financial contributors to their households, gain respect within their communities, and pass their skills to younger generations. The ripple effects extend beyond individual artisans to strengthen entire communities."; ?>
                        </p>
                    </div>
                </div>
                
                <div class="shop-action">
                    <?php if (!empty($empower['shop_link'])): ?>
                        <a href="<?php echo htmlspecialchars($empower['shop_link']); ?>" class="shop-button">
                            Support Women Artisans - Shop Handcrafted Products
                        </a>
                    <?php else: ?>
                        <a href="https://virungahomestay.com/pages/shop.php" class="shop-button">
                            Support Women Artisans - Shop Handcrafted Products
                        </a>
                    <?php endif; ?>
                    <p class="shop-note">
                        <?php echo !empty($empower['shop_note']) ? nl2br(htmlspecialchars($empower['shop_note'])) : "Your purchase directly supports women artisans and their families while preserving cultural heritage."; ?>
                    </p>
                </div>
            </div>
        </section>
    
    <?php include 'includes/footer.php'; ?>
    
    <script src="assets/js/script.js"></script>
</body>
</html>

