<?php
// Database connection
require_once '../admin/config/connection.php';

// Page title and meta information
$page_title = "From Fields and Culture to Futures: Tourism as a Catalyst";
$page_description = "Discover how farm and cultural tourism transform communities, creating sustainable income while preserving heritage and supporting conservation efforts.";
$page_keywords = "farm tourism, cultural tourism, heritage preservation, community development, sustainable tourism, Rwanda";
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><?php echo $page_title; ?> | Virunga Ecotours</title>
    <meta name="description" content="<?php echo $page_description; ?>">
    <meta name="keywords" content="<?php echo $page_keywords; ?>">
    
    <!-- Open Graph Meta Tags -->
    <meta property="og:title" content="<?php echo $page_title; ?> | Virunga Ecotours">
    <meta property="og:description" content="<?php echo $page_description; ?>">
    <meta property="og:type" content="website">
    <meta property="og:url" content="<?php echo $_SERVER['REQUEST_URI']; ?>">
    <meta property="og:image" content="../assets/images/heritage-og-image.jpg">
     <!-- CSS Files -->
    <link rel="stylesheet" href="../css/earthy-theme.css">
    <link rel="stylesheet" href="assets/css/community.css">
    <!-- Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&family=Playfair+Display:wght@400;500;600;700&display=swap" rel="stylesheet">
    
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    
    <!-- External CSS -->
    <link rel="stylesheet" href="assets/css/heritage.css">
</head>
<body>
    <?php include 'includes/header.php'; ?>

    <!-- Hero Section -->
    <section class="hero-section">
        <div class="hero-background">
            <div class="hero-overlay"></div>
            <img src="assets/images/heritage/IMG-20250910-WA0033.jpg" alt="Farm and Cultural Heritage" class="hero-bg-img">
        </div>
        <div class="container">
            <div class="hero-content">
                <h1 class="hero-title">From Fields and Culture to Futures</h1>
                <p class="hero-subtitle">Tourism as a Catalyst for Community Development</p>
                <p class="hero-description">Discover how farm and cultural tourism transform communities, creating sustainable income while preserving heritage and supporting conservation efforts across the Virunga region.</p>
                <div class="hero-buttons">
                    <a href="#farm-tourism" class="hero-btn primary">
                        <i class="fas fa-seedling"></i>
                        Explore Farm Tourism
                    </a>
                    <a href="#cultural-tourism" class="hero-btn secondary">
                        <i class="fas fa-music"></i>
                        Discover Cultural Heritage
                    </a>
                </div>
            </div>
        </div>
    </section>

    <!-- Introduction Section -->
    <section class="introduction-section">
        <div class="container">
            <div class="intro-content">
                <div class="intro-text">
                    <h2>Tourism as a Catalyst for Transformation</h2>
                    <p class="intro-lead">In the heart of the Virunga region, tourism serves as more than just an economic activity—it becomes a powerful force for community empowerment, cultural preservation, and sustainable development.</p>
                    <p>Through farm and cultural tourism, local communities transform their traditional practices into engaging visitor experiences, creating multiple income streams while maintaining their authentic way of life. This approach ensures that tourism benefits reach every level of society, from individual farmers and artists to entire nations.</p>
                </div>
                <div class="intro-image">
                    <img src="../assets/images/heritage-intro.jpg" alt="Community tourism activities" class="intro-img">
                    <div class="image-caption">
                        <p>Local communities engaging visitors in traditional farming and cultural practices</p>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Farm Tourism Section -->
    <section class="farm-tourism-section" id="farm-tourism">
        <div class="container">
            <div class="section-header">
                <h2>Farmer through Farm Tourism</h2>
                <p>Transforming agriculture into platforms for visitor experiences and community development</p>
            </div>
            
            <div class="farm-content">
                <div class="farm-description">
                    <p>Farmers engaging in tourism create opportunities where agriculture becomes not only a means of food production but also a platform for visitor experiences. Farm tours, hands-on harvesting, cooking lessons, and agro-product sales transform farms into destinations of learning and leisure. This serves as a stress buster for visitors who reconnect with nature while providing a powerful income generation tool for individuals, communities, states, and even nations.</p>
                </div>
                
                <div class="farm-benefits">
                    <h3>Income Generation Benefits</h3>
                    <div class="benefits-grid">
                        <div class="benefit-card">
                            <div class="benefit-icon">
                                <i class="fas fa-users"></i>
                            </div>
                            <div class="benefit-content">
                                <h4>Communities</h4>
                                <p>Creates local employment (guides, cooks, artisans), sustains traditional farming practices, and strengthens rural economies.</p>
                            </div>
                        </div>
                        
                        <div class="benefit-card">
                            <div class="benefit-icon">
                                <i class="fas fa-leaf"></i>
                            </div>
                            <div class="benefit-content">
                                <h4>Conservation</h4>
                                <p>Encourages eco-friendly farming, biodiversity protection, and reduced land abandonment.</p>
                            </div>
                        </div>
                        
                        <div class="benefit-card">
                            <div class="benefit-icon">
                                <i class="fas fa-flag"></i>
                            </div>
                            <div class="benefit-content">
                                <h4>States and Countries</h4>
                                <p>Expands rural tourism economies, increases tax revenues, diversifies GDP, and improves global image through sustainable rural tourism.</p>
                            </div>
                        </div>
                    </div>
                </div>
                
                <div class="farm-gallery">
                    <div class="gallery-grid">
                        <div class="gallery-item">
                            <img src="../assets/images/farm-tour.jpg" alt="Farm tour experience" class="gallery-img">
                            <div class="gallery-overlay">
                                <h5>Farm Tours</h5>
                                <p>Guided experiences through organic farms</p>
                            </div>
                        </div>
                        <div class="gallery-item">
                            <img src="../assets/images/harvesting.jpg" alt="Hands-on harvesting" class="gallery-img">
                            <div class="gallery-overlay">
                                <h5>Hands-on Harvesting</h5>
                                <p>Visitors participate in seasonal harvests</p>
                            </div>
                        </div>
                        <div class="gallery-item">
                            <img src="../assets/images/cooking-lessons.jpg" alt="Traditional cooking lessons" class="gallery-img">
                            <div class="gallery-overlay">
                                <h5>Cooking Lessons</h5>
                                <p>Learn traditional recipes with local produce</p>
                            </div>
                        </div>
                        <div class="gallery-item">
                            <img src="../assets/images/agro-products.jpg" alt="Agro-product sales" class="gallery-img">
                            <div class="gallery-overlay">
                                <h5>Agro-Product Sales</h5>
                                <p>Direct sales of farm-fresh products</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Cultural Tourism Section -->
    <section class="cultural-tourism-section" id="cultural-tourism">
        <div class="container">
            <div class="section-header">
                <h2>Cultural Artist through Cultural Tourism</h2>
                <p>Transforming cultural heritage into engaging visitor experiences</p>
            </div>
            
            <div class="cultural-content">
                <div class="cultural-description">
                    <p>Cultural artists—musicians, dancers, storytellers, painters, and craftspeople—transform cultural heritage into engaging visitor experiences. Performances, workshops, festivals, and exhibitions offer travelers a chance to connect deeply with local traditions. For artists, this becomes both a source of pride and a source of livelihood.</p>
                </div>
                
                <div class="cultural-benefits">
                    <h3>Cultural Tourism Impact</h3>
                    <div class="benefits-grid">
                        <div class="benefit-card">
                            <div class="benefit-icon">
                                <i class="fas fa-home"></i>
                            </div>
                            <div class="benefit-content">
                                <h4>Communities</h4>
                                <p>Funds community events, sustains traditional knowledge, empowers youth and women, and preserves languages and folklore.</p>
                            </div>
                        </div>
                        
                        <div class="benefit-card">
                            <div class="benefit-icon">
                                <i class="fas fa-shield-alt"></i>
                            </div>
                            <div class="benefit-content">
                                <h4>Conservation of Culture</h4>
                                <p>Protects intangible heritage from erosion, ensuring traditions remain vibrant and relevant.</p>
                            </div>
                        </div>
                        
                        <div class="benefit-card">
                            <div class="benefit-icon">
                                <i class="fas fa-globe"></i>
                            </div>
                            <div class="benefit-content">
                                <h4>States and Countries</h4>
                                <p>Boosts national identity, enhances cultural diplomacy, and diversifies tourism beyond wildlife and landscapes.</p>
                            </div>
                        </div>
                        
                        <div class="benefit-card">
                            <div class="benefit-icon">
                                <i class="fas fa-handshake"></i>
                            </div>
                            <div class="benefit-content">
                                <h4>Society at Large</h4>
                                <p>Promotes intercultural dialogue, tolerance, and creativity, fostering peace and social cohesion.</p>
                            </div>
                        </div>
                    </div>
                </div>
                
                <div class="cultural-gallery">
                    <div class="gallery-grid">
                        <div class="gallery-item">
                            <img src="../assets/images/traditional-music.jpg" alt="Traditional music performance" class="gallery-img">
                            <div class="gallery-overlay">
                                <h5>Music Performances</h5>
                                <p>Traditional songs and instruments</p>
                            </div>
                        </div>
                        <div class="gallery-item">
                            <img src="../assets/images/cultural-dance.jpg" alt="Cultural dance" class="gallery-img">
                            <div class="gallery-overlay">
                                <h5>Cultural Dance</h5>
                                <p>Traditional dances and ceremonies</p>
                            </div>
                        </div>
                        <div class="gallery-item">
                            <img src="../assets/images/storytelling.jpg" alt="Storytelling session" class="gallery-img">
                            <div class="gallery-overlay">
                                <h5>Storytelling</h5>
                                <p>Oral traditions and folklore</p>
                            </div>
                        </div>
                        <div class="gallery-item">
                            <img src="../assets/images/craft-workshop.jpg" alt="Craft workshop" class="gallery-img">
                            <div class="gallery-overlay">
                                <h5>Craft Workshops</h5>
                                <p>Traditional arts and crafts</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Activities Section -->
    <section class="activities-section">
        <div class="container">
            <div class="section-header">
                <h2>Activities Supporting Community Income Generation</h2>
                <p>Diverse activities that create direct and indirect income streams for communities</p>
            </div>

            <div class="activities-content">
                <div class="activities-intro">
                    <p>Both farm and cultural tourism involve diverse activities that create direct and indirect income streams. These activities do more than create revenue—they empower rural communities, conserve culture and nature, support states economically, and enhance national identity globally.</p>
                </div>

                <div class="activities-grid">
                    <div class="activity-card">
                        <div class="activity-icon">
                            <i class="fas fa-walking"></i>
                        </div>
                        <div class="activity-content">
                            <h4>Farm Tours & Demonstrations</h4>
                            <p>Guided farm tours, animal care demonstrations, and organic food tasting experiences.</p>
                        </div>
                    </div>

                    <div class="activity-card">
                        <div class="activity-icon">
                            <i class="fas fa-utensils"></i>
                        </div>
                        <div class="activity-content">
                            <h4>Traditional Cooking Classes</h4>
                            <p>Learn authentic recipes using fresh local produce and traditional cooking methods.</p>
                        </div>
                    </div>

                    <div class="activity-card">
                        <div class="activity-icon">
                            <i class="fas fa-store"></i>
                        </div>
                        <div class="activity-content">
                            <h4>Artisan Craft Markets</h4>
                            <p>Local craft markets and souvenir sales featuring handmade traditional items.</p>
                        </div>
                    </div>

                    <div class="activity-card">
                        <div class="activity-icon">
                            <i class="fas fa-music"></i>
                        </div>
                        <div class="activity-content">
                            <h4>Music & Dance Performances</h4>
                            <p>Traditional music and dance performances showcasing local cultural heritage.</p>
                        </div>
                    </div>

                    <div class="activity-card">
                        <div class="activity-icon">
                            <i class="fas fa-fire"></i>
                        </div>
                        <div class="activity-content">
                            <h4>Storytelling Evenings</h4>
                            <p>Traditional storytelling sessions around firesides sharing local folklore and history.</p>
                        </div>
                    </div>

                    <div class="activity-card">
                        <div class="activity-icon">
                            <i class="fas fa-calendar-alt"></i>
                        </div>
                        <div class="activity-content">
                            <h4>Cultural Festivals</h4>
                            <p>Seasonal cultural festivals showcasing local heritage, traditions, and community celebrations.</p>
                        </div>
                    </div>

                    <div class="activity-card">
                        <div class="activity-icon">
                            <i class="fas fa-graduation-cap"></i>
                        </div>
                        <div class="activity-content">
                            <h4>Educational Workshops</h4>
                            <p>Educational workshops designed for schools and international visitors to learn about local culture.</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Impact Table Section -->
    <section class="impact-table-section">
        <div class="container">
            <div class="section-header">
                <h2>Role of Income Generation from Farm and Cultural Tourism</h2>
                <p>Understanding the multi-level impact of tourism-based income generation</p>
            </div>

            <div class="table-container">
                <div class="impact-table">
                    <div class="table-header">
                        <div class="table-cell header-cell">Level</div>
                        <div class="table-cell header-cell">Role of Income Generation</div>
                    </div>

                    <div class="table-row">
                        <div class="table-cell level-cell">
                            <div class="level-icon">
                                <i class="fas fa-user"></i>
                            </div>
                            <span class="level-name">Individuals</span>
                        </div>
                        <div class="table-cell content-cell">
                            Provides alternative livelihoods, reduces poverty, enhances skills, and increases wellbeing.
                        </div>
                    </div>

                    <div class="table-row">
                        <div class="table-cell level-cell">
                            <div class="level-icon">
                                <i class="fas fa-users"></i>
                            </div>
                            <span class="level-name">Communities</span>
                        </div>
                        <div class="table-cell content-cell">
                            Strengthens local economies, funds schools and healthcare, preserves traditions, and creates jobs.
                        </div>
                    </div>

                    <div class="table-row">
                        <div class="table-cell level-cell">
                            <div class="level-icon">
                                <i class="fas fa-leaf"></i>
                            </div>
                            <span class="level-name">Conservation</span>
                        </div>
                        <div class="table-cell content-cell">
                            Supports sustainable farming, biodiversity protection, and safeguarding of cultural heritage.
                        </div>
                    </div>

                    <div class="table-row">
                        <div class="table-cell level-cell">
                            <div class="level-icon">
                                <i class="fas fa-landmark"></i>
                            </div>
                            <span class="level-name">States</span>
                        </div>
                        <div class="table-cell content-cell">
                            Generates tax revenue, diversifies rural economy, reduces rural-urban migration, and supports tourism policy.
                        </div>
                    </div>

                    <div class="table-row">
                        <div class="table-cell level-cell">
                            <div class="level-icon">
                                <i class="fas fa-globe"></i>
                            </div>
                            <span class="level-name">Countries</span>
                        </div>
                        <div class="table-cell content-cell">
                            Enhances GDP contribution, strengthens global reputation, attracts foreign investment, and boosts national branding.
                        </div>
                    </div>

                    <div class="table-row">
                        <div class="table-cell level-cell">
                            <div class="level-icon">
                                <i class="fas fa-handshake"></i>
                            </div>
                            <span class="level-name">Society</span>
                        </div>
                        <div class="table-cell content-cell">
                            Promotes social cohesion, intercultural exchange, environmental awareness, and shared identity.
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Call to Action Section -->
    <section class="cta-section">
        <div class="container">
            <div class="cta-content">
                <h2>Experience the Transformation</h2>
                <p>Join us in supporting community-based tourism that creates lasting positive impact while preserving the rich heritage and natural beauty of the Virunga region.</p>
                <div class="cta-buttons">
                    <a href="../pages/contactus.php" class="cta-btn primary">
                        <i class="fas fa-envelope"></i>
                        Plan Your Visit
                    </a>
                    <a href="../pages/about.php" class="cta-btn secondary">
                        <i class="fas fa-info-circle"></i>
                        Learn More
                    </a>
                </div>
                <div class="cta-features">
                    <div class="cta-feature">
                        <i class="fas fa-seedling"></i>
                        <span>Sustainable Tourism</span>
                    </div>
                    <div class="cta-feature">
                        <i class="fas fa-heart"></i>
                        <span>Community Impact</span>
                    </div>
                    <div class="cta-feature">
                        <i class="fas fa-shield-alt"></i>
                        <span>Heritage Preservation</span>
                    </div>
                    <div class="cta-feature">
                        <i class="fas fa-star"></i>
                        <span>Authentic Experiences</span>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <?php include 'includes/footer.php'; ?>

    <!-- External JavaScript -->
    <script src="assets/js/heritage.js"></script>
</body>
</html>
