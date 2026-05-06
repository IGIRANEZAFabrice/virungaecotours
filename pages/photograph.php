<?php
// Database connection
require_once('../admin/config/connection.php');

// Start session for admin check
if (session_status() === PHP_SESSION_NONE) {
    session_start();
}

// Fetch page data
$page_query = "SELECT * FROM photograph_page WHERE id = 1";
$page_result = mysqli_query($conn, $page_query);
$page = mysqli_fetch_assoc($page_result);

// Fetch overview data
$overview_query = "SELECT * FROM photograph_overview WHERE id = 1";
$overview_result = mysqli_query($conn, $overview_query);
$overview = mysqli_fetch_assoc($overview_result);

// Fetch expectations data
$expectations_query = "SELECT * FROM photograph_expectations WHERE id = 1";
$expectations_result = mysqli_query($conn, $expectations_query);
$expectations = mysqli_fetch_assoc($expectations_result);

// Fetch expectations items
$expectations_items_query = "SELECT * FROM photograph_expectations_items ORDER BY item_order ASC";
$expectations_items_result = mysqli_query($conn, $expectations_items_query);
$expectations_items = [];
while ($item = mysqli_fetch_assoc($expectations_items_result)) {
    $expectations_items[] = $item;
}

// Fetch table section data
$table_section_query = "SELECT * FROM photograph_table_section WHERE id = 1";
$table_section_result = mysqli_query($conn, $table_section_query);
$table_section = mysqli_fetch_assoc($table_section_result);

// Fetch table rows
$table_rows_query = "SELECT * FROM photograph_table_rows ORDER BY row_order ASC";
$table_rows_result = mysqli_query($conn, $table_rows_query);
$table_rows = [];
while ($row = mysqli_fetch_assoc($table_rows_result)) {
    $table_rows[] = $row;
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Kids for Life: Photography Training for Conservation | Virunga Ecotours</title>
    <meta name="description" content="Join our Kids for Life Photography Training program - an immersive educational experience combining photography skills with conservation awareness in the Virunga Massif.">
    <meta name="keywords" content="photography training, conservation education, kids for life, Virunga Massif, youth empowerment, nature photography, community-based tourism">
    
    <!-- Favicon -->
    <link rel="icon" type="image/x-icon" href="../images/favicon.ico">
    <link rel="apple-touch-icon" sizes="180x180" href="../images/apple-touch-icon.png">
    <link rel="icon" type="image/png" sizes="32x32" href="../images/favicon-32x32.png">
    <link rel="icon" type="image/png" sizes="16x16" href="../images/favicon-16x16.png">
    
    <!-- External CSS -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link rel="stylesheet" href="../css/earthy-theme.css">
    <link rel="stylesheet" href="../css/header.css">
    <link rel="stylesheet" href="../css/photograph.css">
</head>
<body>
    <?php include "./includes/header.php" ?>

    <!-- Hero Section -->
    <section class="hero" id="hero">
        <?php if (!empty($page['hero_image'])): ?>
            <img src="<?php echo htmlspecialchars('./' . $page['hero_image']); ?>" alt="Kids for Life Photography" class="hero-bg-img" style="position: absolute; top: 0; left: 0; width: 100%; height: 100%; object-fit: cover; z-index: 0;">
        <?php endif; ?>
        <div class="hero-overlay" style="z-index: 1;"></div>
        <div class="hero-content" style="z-index: 2;">
            <h1><?php echo htmlspecialchars($page['hero_title'] ?? 'Kids for Life'); ?></h1>
            <h2><?php echo htmlspecialchars($page['hero_subtitle'] ?? 'Photography Training for Conservation'); ?></h2>
            <p><?php echo htmlspecialchars($page['hero_description'] ?? 'Inspiring young minds to connect with nature through the art of photography'); ?></p>
            <a href="#overview" class="hero-btn">
                <i class="fas fa-camera"></i>
                Discover the Program
            </a>
        </div>
        <div class="scroll-indicator" id="scroll-down" style="z-index: 2;">
            <i class="fas fa-chevron-down"></i>
        </div>
    </section>

    <!-- Overview Section -->
    <section class="overview" id="overview">
        <div class="container">
            <div class="overview-content" data-animation="fadeInUp">
                <h2><?php echo htmlspecialchars($overview['overview_title'] ?? 'Program Overview'); ?></h2>
                <p class="overview-intro"><?php echo htmlspecialchars($overview['overview_intro'] ?? ''); ?></p>
                <p><?php echo htmlspecialchars($overview['overview_description'] ?? ''); ?></p>
            </div>
        </div>
    </section>

    <!-- Why Important Section -->
    <section class="why-important" id="why-important">
        <div class="container">
            <h2 data-animation="fadeInUp">Why This Training is Important</h2>
            <div class="importance-grid">
                <div class="importance-item" data-animation="fadeInLeft" data-delay="0.2">
                    <div class="importance-icon">
                        <i class="fas fa-leaf"></i>
                    </div>
                    <h3>Conservation Awareness</h3>
                    <p>Photography becomes a powerful tool for storytelling. Children learn how images can raise awareness and inspire people to protect nature.</p>
                </div>
                
                <div class="importance-item" data-animation="fadeInUp" data-delay="0.4">
                    <div class="importance-icon">
                        <i class="fas fa-palette"></i>
                    </div>
                    <h3>Creative Expression</h3>
                    <p>It gives kids an avenue to express their creativity while engaging with real-world conservation issues.</p>
                </div>
                
                <div class="importance-item" data-animation="fadeInRight" data-delay="0.6">
                    <div class="importance-icon">
                        <i class="fas fa-users"></i>
                    </div>
                    <h3>Youth Empowerment</h3>
                    <p>Early exposure to conservation builds pride, responsibility, and leadership among children in local communities.</p>
                </div>
                
                <div class="importance-item" data-animation="fadeInUp" data-delay="0.8">
                    <div class="importance-icon">
                        <i class="fas fa-heart"></i>
                    </div>
                    <h3>Connection to Community</h3>
                    <p>Kids see firsthand how their environment is tied to local livelihoods, tourism, and global interest.</p>
                </div>
            </div>
        </div>
    </section>

    <!-- Expectations Section -->
    <section class="expectations" id="expectations">
        <div class="container">
            <div class="expectations-content">
                <div class="expectations-text" data-animation="fadeInLeft">
                    <h2><?php echo htmlspecialchars($expectations['expectations_title'] ?? 'What Kids Can Expect After the Training'); ?></h2>
                    <div class="expectations-list">
                        <?php foreach ($expectations_items as $item): ?>
                        <div class="expectation-item">
                            <div class="expectation-icon">
                                <i class="<?php echo htmlspecialchars($item['item_icon']); ?>"></i>
                            </div>
                            <div class="expectation-content">
                                <h4><?php echo htmlspecialchars($item['item_title']); ?></h4>
                                <p><?php echo htmlspecialchars($item['item_description']); ?></p>
                            </div>
                        </div>
                        <?php endforeach; ?>
                    </div>
                </div>

                <div class="expectations-image" data-animation="fadeInRight">
                    <div class="image-placeholder">
                        <?php if (!empty($expectations['expectations_image'])): ?>
                            <img style="width: 100%; height: auto;" src="<?php echo htmlspecialchars('./' . $expectations['expectations_image']); ?>" alt="<?php echo htmlspecialchars($expectations['expectations_image_caption']); ?>">
                        <?php else: ?>
                            <div style="width: 100%; height: 400px; background: linear-gradient(135deg, #8B7355 0%, #5C4033 100%);"></div>
                        <?php endif; ?>
                        <p><?php echo htmlspecialchars($expectations['expectations_image_caption'] ?? 'Young photographers in action'); ?></p>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Educational Table Section -->
    <section class="educational-table" id="program-details">
        <div class="container">
            <h2 data-animation="fadeInUp"><?php echo htmlspecialchars($table_section['table_title'] ?? 'Strong Educative Program Structure'); ?></h2>
            <p class="section-intro" data-animation="fadeInUp" data-delay="0.2"><?php echo htmlspecialchars($table_section['table_intro'] ?? 'A comprehensive breakdown of our training components and their educational value'); ?></p>

            <div class="table-container" data-animation="fadeInUp" data-delay="0.4">
                <table class="program-table">
                    <thead>
                        <tr>
                            <th>Component</th>
                            <th>Description</th>
                            <th>Educational Value for Kids</th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php foreach ($table_rows as $row): ?>
                        <tr>
                            <td>
                                <div class="component-cell">
                                    <i class="<?php echo htmlspecialchars($row['component_icon']); ?>"></i>
                                    <span><?php echo htmlspecialchars($row['component_name']); ?></span>
                                </div>
                            </td>
                            <td><?php echo htmlspecialchars($row['component_description']); ?></td>
                            <td><?php echo htmlspecialchars($row['educational_value']); ?></td>
                        </tr>
                        <?php endforeach; ?>
                    </tbody>
                </table>
            </div>
        </div>
    </section>

    <!-- Call to Action Section -->
    <section class="cta" id="contact">
        <div class="container">
            <div class="cta-content" data-animation="fadeIn">
                <h2>Ready to Inspire Young Conservation Leaders?</h2>
                <p>Join our Kids for Life Photography Training program and help nurture the next generation of environmental ambassadors. Contact us to learn more about enrollment, partnerships, or bringing this program to your community.</p>
                <div class="cta-buttons">
                    <a href="../pages/contact.php" class="button primary">
                        <i class="fas fa-envelope"></i>
                        Contact Us
                    </a>
                    <a href="../pages/tours.php" class="button secondary">
                        <i class="fas fa-binoculars"></i>
                        Explore Tours
                    </a>
                </div>
                
                <div class="social-links">
                    <a href="#" target="_blank"><i class="fab fa-facebook-f"></i></a>
                    <a href="#" target="_blank"><i class="fab fa-instagram"></i></a>
                    <a href="#" target="_blank"><i class="fab fa-twitter"></i></a>
                    <a href="#" target="_blank"><i class="fab fa-linkedin"></i></a>
                </div>
            </div>
        </div>
    </section>

    <?php include "./includes/footer.php" ?>

    <!-- JavaScript -->
    <script src="../js/header.js" defer></script>
    <script>
        // Smooth Scroll for Scroll Down Button
        const scrollDown = document.getElementById('scroll-down');
        const heroSection = document.getElementById('hero');

        scrollDown.addEventListener('click', () => {
            const nextSection = heroSection.nextElementSibling;
            nextSection.scrollIntoView({ behavior: 'smooth' });
        });

        // Intersection Observer for animations
        if ('IntersectionObserver' in window) {
            const observerOptions = {
                root: null,
                rootMargin: '0px',
                threshold: 0.1
            };

            const handleIntersect = (entries, observer) => {
                entries.forEach(entry => {
                    if (entry.isIntersecting) {
                        const element = entry.target;
                        const delay = element.dataset.delay || 0;

                        setTimeout(() => {
                            element.classList.add('animated');
                        }, delay * 1000);

                        // Unobserve after animation
                        observer.unobserve(element);
                    }
                });
            };

            const observer = new IntersectionObserver(handleIntersect, observerOptions);

            // Target elements to observe
            const elementsToObserve = document.querySelectorAll('[data-animation]');
            elementsToObserve.forEach(element => {
                observer.observe(element);
            });
        }

        // Smooth scrolling for navigation links
        document.querySelectorAll('a[href^="#"]').forEach(anchor => {
            anchor.addEventListener('click', function (e) {
                e.preventDefault();
                const target = document.querySelector(this.getAttribute('href'));
                if (target) {
                    target.scrollIntoView({
                        behavior: 'smooth',
                        block: 'start'
                    });
                }
            });
        });
    </script>
</body>
</html>
