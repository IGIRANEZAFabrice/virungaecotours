<?php
require_once '../admin/config/connection.php';

// Fetch activities from the database
$activities_query = "SELECT * FROM community_activities WHERE status = 'active' AND is_active = 1 ORDER BY display_order ASC";
$activities_result = mysqli_query($conn, $activities_query);
?>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">

    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">

    <!-- Favicon -->
    <link rel="icon" type="image/x-icon" href="assets/images/logos/logo.jpg">
    <link rel="stylesheet" href="assets/css/impact.css">
    <link rel="stylesheet" href="../css/earthy-theme.css">
    <link rel="stylesheet" href="assets/css/about.css">
    <link rel="stylesheet" href="assets/css/activity.css">
<?php include 'includes/header.php'; ?>

<!-- Page Header Section -->
<section class="page-header">
    <div class="page-header-background">
        <img src="uploads/impact/hero.jpg" alt="Community Activities" loading="lazy">
        <div class="page-header-overlay"></div>
    </div>
    <div class="container">
        <div class="page-header-content">
            <nav class="breadcrumb">
                <a href="index.php">Community</a>
                <span class="separator"><i class="fas fa-chevron-right"></i></span>
                <span class="current">Activities</span>
            </nav>
            <h1 style="color: #ffffff;">Community Activities</h1>
            <p style="color: #ffffff;">Authentic experiences that directly benefit local communities</p>
        </div>
    </div>
</section>

<!-- Introduction Section -->
<section class="intro-section">
    <div class="intro-container">
        <h2 class="intro-title">Community-Focused Experiences</h2>
        <p class="intro-subtitle">Discover meaningful activities that create positive impact</p>
        
        <div class="intro-description">
            <p>Our community activities are carefully designed to provide authentic cultural experiences while directly supporting local communities in the Virunga region. Unlike traditional tourist activities, these experiences are developed and led by community members themselves, ensuring that benefits flow directly to local families and organizations.</p>
            
            <p>Each activity not only offers you a unique glimpse into local culture and traditions but also contributes to sustainable livelihoods, cultural preservation, and community development. By participating in these activities, you become an active partner in our mission to create positive change.</p>
        </div>
        
        <div class="intro-benefits">
            <div class="benefit-item">
                <div class="benefit-icon">
                    <i class="fas fa-hand-holding-heart"></i>
                </div>
                <h3 class="benefit-title">Direct Community Support</h3>
                <p class="benefit-description">100% of activity proceeds go directly to community members and local initiatives, creating sustainable income opportunities and supporting families.</p>
            </div>
            
            <div class="benefit-item">
                <div class="benefit-icon">
                    <i class="fas fa-users"></i>
                </div>
                <h3 class="benefit-title">Cultural Preservation</h3>
                <p class="benefit-description">These activities help preserve traditional knowledge, crafts, and practices by creating economic value for cultural heritage and passing skills to younger generations.</p>
            </div>
            
            <div class="benefit-item">
                <div class="benefit-icon">
                    <i class="fas fa-handshake"></i>
                </div>
                <h3 class="benefit-title">Authentic Connection</h3>
                <p class="benefit-description">Experience genuine cultural exchange and form meaningful connections with local community members through shared activities and experiences.</p>
            </div>
        </div>
    </div>
</section>

<!-- Activities Section -->
<section class="activities-section">
    <div class="container">
        <div class="section-header">
            <h2>Explore Our Activities</h2>
            <p>Immerse yourself in authentic experiences that make a difference</p>
        </div>
        
        <div class="activities-grid">
            <?php if (mysqli_num_rows($activities_result) > 0): ?>
                <?php while ($activity = mysqli_fetch_assoc($activities_result)): ?>
                    <div class="activity-card">
                        <div class="activity-image">
                            <img src="uploads/activities/<?php echo htmlspecialchars($activity['image']); ?>" 
                                 alt="<?php echo htmlspecialchars($activity['title']); ?>" loading="lazy">
                            <div class="activity-overlay">
                                <div class="activity-duration">
                                    <i class="fas fa-clock"></i>
                                    <?php echo htmlspecialchars($activity['duration']); ?>
                                </div>
                            </div>
                        </div>
                        <div class="activity-content">
                            <h3 class="activity-title"><?php echo htmlspecialchars($activity['title']); ?></h3>
                            <p class="activity-description">
                                <?php 
                                // Display a summary of the content
                                $summary = substr(strip_tags($activity['content']), 0, 150);
                                echo htmlspecialchars($summary) . (strlen(strip_tags($activity['content'])) > 150 ? '...' : '');
                                ?>
                            </p>
                            <div class="activity-meta">
                                <a href="activity-detail.php?id=<?php echo $activity['id']; ?>" class="activity-link">
                                    Learn More
                                </a>
                            </div>
                        </div>
                    </div>
                <?php endwhile; ?>
            <?php else: ?>
                <div class="no-activities">
                    <i class="fas fa-info-circle"></i>
                    <p>No activities available at the moment. Please check back soon!</p>
                </div>
            <?php endif; ?>
        </div>
    </div>
</section>

<!-- CTA Section -->
<section class="cta-section">
    <div class="container">
        <div class="cta-content">
            <h2>Ready to Make an Impact?</h2>
            <p>Join us in creating positive change through meaningful community experiences.</p>
            <div class="cta-buttons">
                <a href="contact.php?action=book" class="btn btn-primary">
                    <i class="fas fa-calendar-check"></i>
                    Book an Activity
                </a>
                <a href="volunteer.php" class="btn btn-secondary">
                    <i class="fas fa-hands-helping"></i>
                    Volunteer With Us
                </a>
            </div>
        </div>
    </div>
</section>

<script>
    // Simple animation for benefits
    document.addEventListener('DOMContentLoaded', function() {
        const benefitItems = document.querySelectorAll('.benefit-item');
        
        benefitItems.forEach((item, index) => {
            setTimeout(() => {
                item.style.opacity = '1';
                item.style.transform = 'translateY(0)';
            }, 200 * index);
        });
    });
</script>

<?php include 'includes/footer.php'; ?>

<?php
// Close database connection
mysqli_close($conn);
?>