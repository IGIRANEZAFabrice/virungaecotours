<?php
// Database connection and data fetching
require_once('../admin/config/connection.php');

// Fetch all about page data
$hero_sql = "SELECT * FROM about_hero WHERE is_active = 1 LIMIT 1";
$hero_result = $conn->query($hero_sql);
$hero_data = $hero_result->fetch_assoc();

$story_sql = "SELECT * FROM about_story WHERE is_active = 1 LIMIT 1";
$story_result = $conn->query($story_sql);
$story_data = $story_result->fetch_assoc();

$impact_sql = "SELECT * FROM about_impact WHERE is_active = 1 LIMIT 1";
$impact_result = $conn->query($impact_sql);
$impact_data = $impact_result->fetch_assoc();

$impact_stats_sql = "SELECT * FROM about_impact_stats WHERE impact_id = ? AND is_active = 1 ORDER BY display_order";
$impact_stats_stmt = $conn->prepare($impact_stats_sql);
$impact_stats_stmt->bind_param("i", $impact_data['impact_id']);
$impact_stats_stmt->execute();
$impact_stats_result = $impact_stats_stmt->get_result();
$impact_stats = [];
while ($row = $impact_stats_result->fetch_assoc()) {
    $impact_stats[] = $row;
}

$team_section_sql = "SELECT * FROM about_team_section WHERE is_active = 1 LIMIT 1";
$team_section_result = $conn->query($team_section_sql);
$team_section_data = $team_section_result->fetch_assoc();

$team_members_sql = "SELECT * FROM about_team_members WHERE section_id = ? AND is_active = 1 ORDER BY display_order";
$team_members_stmt = $conn->prepare($team_members_sql);
$team_members_stmt->bind_param("i", $team_section_data['section_id']);
$team_members_stmt->execute();
$team_members_result = $team_members_stmt->get_result();
$team_members = [];
while ($row = $team_members_result->fetch_assoc()) {
    $team_members[] = $row;
}

$values_section_sql = "SELECT * FROM about_values_section WHERE is_active = 1 LIMIT 1";
$values_section_result = $conn->query($values_section_sql);
$values_section_data = $values_section_result->fetch_assoc();

$values_sql = "SELECT * FROM about_values WHERE section_id = ? AND is_active = 1 ORDER BY display_order";
$values_stmt = $conn->prepare($values_sql);
$values_stmt->bind_param("i", $values_section_data['section_id']);
$values_stmt->execute();
$values_result = $values_stmt->get_result();
$values = [];
while ($row = $values_result->fetch_assoc()) {
    $values[] = $row;
}

$gallery_section_sql = "SELECT * FROM about_gallery_section WHERE is_active = 1 LIMIT 1";
$gallery_section_result = $conn->query($gallery_section_sql);
$gallery_section_data = $gallery_section_result->fetch_assoc();

$gallery_sql = "SELECT * FROM about_gallery WHERE section_id = ? AND is_active = 1 ORDER BY display_order";
$gallery_stmt = $conn->prepare($gallery_sql);
$gallery_stmt->bind_param("i", $gallery_section_data['section_id']);
$gallery_stmt->execute();
$gallery_result = $gallery_stmt->get_result();
$gallery_items = [];
while ($row = $gallery_result->fetch_assoc()) {
    $gallery_items[] = $row;
}

$cta_sql = "SELECT * FROM about_cta WHERE is_active = 1 LIMIT 1";
$cta_result = $conn->query($cta_sql);
$cta_data = $cta_result->fetch_assoc();
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Congo Virunga National Park Tours | Eastern Congo Ecotours | Virunga Ecotours</title>
<meta name="description" content="Discover the wild beauty of Virunga National Park in Congo. Authentic ecotours combining wildlife encounters with community engagement and conservation support.">
<meta name="keywords" content="Virunga National Park Congo, Congo ecotours, eastern Congo wildlife, Congo gorilla tours, DRC tourism">
    <title>About Us | EcoTours</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link rel="stylesheet" href="../css/earthy-theme.css">
    <link rel="stylesheet" href="../css/header.css">
    <link rel="stylesheet" href="../css/about.css">
</head>
<body>
    <?php include "./includes/header.php" ?>

    <!-- Hero Section -->
    <section class="hero" id="hero" style="background-image: linear-gradient(rgba(0, 0, 0, 0.5), rgba(0, 0, 0, 0.5)), url('../admin/images/about/<?php echo htmlspecialchars($hero_data['background_image']); ?>');">
        <div class="hero-content">
            <h1><?php echo htmlspecialchars($hero_data['title']); ?></h1>
            <p><?php echo htmlspecialchars($hero_data['subtitle']); ?></p>
        </div>
        <div class="scroll-indicator" id="scroll-down">
            <i class="fas fa-chevron-down"></i>
        </div>
    </section>

    <!-- Our Story Section -->
    <section class="our-story" id="our-story">
        <div class="container">
            <div class="story-container">
                <div class="story-text" data-animation="fadeInLeft">
                    <h2><?php echo htmlspecialchars($story_data['section_title']); ?></h2>
                    <p><?php echo htmlspecialchars($story_data['paragraph_1']); ?></p>
                    <p><?php echo htmlspecialchars($story_data['paragraph_2']); ?></p>
                    <p><?php echo htmlspecialchars($story_data['paragraph_3']); ?></p>
                    <a href="<?php echo htmlspecialchars($story_data['button_link']); ?>" class="button"><?php echo htmlspecialchars($story_data['button_text']); ?></a>
                </div>
                <div class="story-image" data-animation="fadeInRight">
                    <img src="../admin/images/about/<?php echo htmlspecialchars($story_data['story_image']); ?>" alt="EcoTours journey">
                </div>
            </div>
        </div>
    </section>

    <!-- Impact Stats Section -->
    <section class="impact" id="impact">
        <div class="container">
            <h2><?php echo htmlspecialchars($impact_data['section_title']); ?></h2>
            <p class="section-intro"><?php echo htmlspecialchars($impact_data['section_intro']); ?></p>

            <div class="stats-container">
                <?php foreach ($impact_stats as $index => $stat): ?>
                    <div class="stat-item" data-animation="fadeIn" data-delay="<?php echo ($index + 1) * 0.2; ?>">
                        <i class="<?php echo htmlspecialchars($stat['icon_class']); ?>"></i>
                        <div class="stat-count" data-count="<?php echo $stat['stat_count']; ?>">0</div>
                        <div class="stat-title"><?php echo htmlspecialchars($stat['stat_title']); ?></div>
                    </div>
                <?php endforeach; ?>
            </div>
        </div>
    </section>

    <!-- Team Section -->
    <section class="team" id="team">
        <div class="container">
            <h2><?php echo htmlspecialchars($team_section_data['section_title']); ?></h2>
            <p class="section-intro"><?php echo htmlspecialchars($team_section_data['section_intro']); ?></p>

            <div class="team-container">
                <?php foreach ($team_members as $index => $member): ?>
                    <div class="team-card" data-animation="fadeIn" data-delay="<?php echo ($index + 1) * 0.2; ?>">
                        <div class="team-image">
                            <img src="../admin/images/about/team/<?php echo htmlspecialchars($member['image']); ?>" alt="<?php echo htmlspecialchars($member['name']); ?>">
                        </div>
                        <div class="team-info">
                            <h3><?php echo htmlspecialchars($member['name']); ?></h3>
                            <div class="team-role"><?php echo htmlspecialchars($member['role']); ?></div>
                            <p class="team-bio"><?php echo htmlspecialchars($member['bio']); ?></p>
                            <div class="team-socials">
                                <?php if (!empty($member['linkedin_url']) && $member['linkedin_url'] !== '#'): ?>
                                    <a href="<?php echo htmlspecialchars($member['linkedin_url']); ?>" target="_blank"><i class="fab fa-linkedin"></i></a>
                                <?php endif; ?>
                                <?php if (!empty($member['twitter_url']) && $member['twitter_url'] !== '#'): ?>
                                    <a href="<?php echo htmlspecialchars($member['twitter_url']); ?>" target="_blank"><i class="fab fa-twitter"></i></a>
                                <?php endif; ?>
                                <?php if (!empty($member['instagram_url']) && $member['instagram_url'] !== '#'): ?>
                                    <a href="<?php echo htmlspecialchars($member['instagram_url']); ?>" target="_blank"><i class="fab fa-instagram"></i></a>
                                <?php endif; ?>
                            </div>
                        </div>
                    </div>
                <?php endforeach; ?>
            </div>
        </div>
    </section>

    <!-- Values Section -->
    <section class="values" id="values">
        <div class="container">
            <h2><?php echo htmlspecialchars($values_section_data['section_title']); ?></h2>
            <p class="section-intro"><?php echo htmlspecialchars($values_section_data['section_intro']); ?></p>

            <div class="values-container">
                <?php foreach ($values as $index => $value): ?>
                    <div class="value-item" data-animation="fadeIn" data-delay="<?php echo ($index + 1) * 0.2; ?>">
                        <div class="value-icon">
                            <i class="<?php echo htmlspecialchars($value['icon_class']); ?>"></i>
                        </div>
                        <h3 class="value-title"><?php echo htmlspecialchars($value['title']); ?></h3>
                        <p class="value-description"><?php echo htmlspecialchars($value['description']); ?></p>
                    </div>
                <?php endforeach; ?>
            </div>
        </div>
    </section>

    <!-- Gallery Section -->
    <section class="gallery" id="gallery">
        <div class="container">
            <h2><?php echo htmlspecialchars($gallery_section_data['section_title']); ?></h2>
            <p class="section-intro"><?php echo htmlspecialchars($gallery_section_data['section_intro']); ?></p>

            <div class="gallery-grid">
                <?php foreach ($gallery_items as $index => $item): ?>
                    <div class="gallery-item" data-animation="fadeIn" data-delay="<?php echo ($index + 1) * 0.1; ?>">
                        <img src="../admin/images/about/gallery/<?php echo htmlspecialchars($item['image']); ?>" alt="<?php echo htmlspecialchars($item['alt_text']); ?>">
                        <div class="gallery-overlay">
                            <h3 class="gallery-title"><?php echo htmlspecialchars($item['title']); ?></h3>
                        </div>
                    </div>
                <?php endforeach; ?>
            </div>
        </div>
    </section>

    <!-- Call to Action Section -->
    <section class="cta" id="contact" style="background-color: var(--neutral-beige);">
        <div class="container">
            <div class="cta-content" data-animation="fadeIn">
                <h2><?php echo htmlspecialchars($cta_data['section_title']); ?></h2>
                <p><?php echo htmlspecialchars($cta_data['section_description']); ?></p>
                <a href="<?php echo htmlspecialchars($cta_data['button_link']); ?>" class="button"><?php echo htmlspecialchars($cta_data['button_text']); ?></a>

                <div class="social-links">
                    <?php if (!empty($cta_data['facebook_url']) && $cta_data['facebook_url'] !== '#'): ?>
                        <a href="<?php echo htmlspecialchars($cta_data['facebook_url']); ?>" target="_blank"><i class="fab fa-facebook-f"></i></a>
                    <?php endif; ?>
                    <?php if (!empty($cta_data['instagram_url']) && $cta_data['instagram_url'] !== '#'): ?>
                        <a href="<?php echo htmlspecialchars($cta_data['instagram_url']); ?>" target="_blank"><i class="fab fa-instagram"></i></a>
                    <?php endif; ?>
                    <?php if (!empty($cta_data['twitter_url']) && $cta_data['twitter_url'] !== '#'): ?>
                        <a href="<?php echo htmlspecialchars($cta_data['twitter_url']); ?>" target="_blank"><i class="fab fa-linkedin"></i></a>
                    <?php endif; ?>
                </div>
            </div>
        </div>
    </section>

    <?php include "./includes/footer.php" ?>

    <!-- Modal for Gallery -->
    <div class="modal" id="image-modal">
        <span class="close-modal" id="close-modal">
            <i class="fas fa-times"></i>
        </span>
        <div class="modal-content">
            <img id="modal-image" src="" alt="Gallery Image">
        </div>
    </div>

    <!-- JavaScript -->
    <script src="../js/header.js" defer></script>
    <script>
        // Navigation and Mobile Menu
        const scrollDown = document.getElementById('scroll-down');
        const heroSection = document.getElementById('hero');

        // Smooth Scroll for Scroll Down Button
        scrollDown.addEventListener('click', () => {
            const nextSection = heroSection.nextElementSibling;
            nextSection.scrollIntoView({ behavior: 'smooth' });
        });

        // Animations on Scroll
        function checkForAnimations() {
            const animatedElements = document.querySelectorAll('[data-animation]');

            animatedElements.forEach(element => {
                const elementPosition = element.getBoundingClientRect().top;
                const viewportHeight = window.innerHeight;

                // If element is in viewport
                if (elementPosition < viewportHeight - 100) {
                    // Add animation class
                    element.classList.add('animated');

                    // For stat counters, start counting if in impact section
                    if (element.closest('.impact')) {
                        const counters = element.querySelectorAll('.stat-count');
                        counters.forEach(counter => startCounting(counter));
                    }
                }
            });
        }

        // Initial check for animations
        window.addEventListener('load', () => {
            setTimeout(checkForAnimations, 500);
        });

        // Stat Counter Animation
        function startCounting(counter) {
            if (counter.classList.contains('counted')) return;

            counter.classList.add('counted');
            const target = parseInt(counter.dataset.count);
            const duration = 2000; // 2 seconds
            const increment = Math.ceil(target / (duration / 30)); // Update every 30ms
            let current = 0;

            const timer = setInterval(() => {
                current += increment;

                if (current >= target) {
                    counter.textContent = target.toLocaleString();
                    clearInterval(timer);
                } else {
                    counter.textContent = current.toLocaleString();
                }
            }, 30);
        }

        // Gallery Modal
        const galleryItems = document.querySelectorAll('.gallery-item');
        const modal = document.getElementById('image-modal');
        const modalImg = document.getElementById('modal-image');
        const closeModal = document.getElementById('close-modal');

        galleryItems.forEach(item => {
            item.addEventListener('click', () => {
                const imgSrc = item.querySelector('img').src;
                const imgAlt = item.querySelector('img').alt;

                modalImg.src = imgSrc;
                modalImg.alt = imgAlt;
                modal.style.display = 'flex';
                document.body.style.overflow = 'hidden';
            });
        });

        closeModal.addEventListener('click', () => {
            modal.style.display = 'none';
            document.body.style.overflow = 'auto';
        });

        modal.addEventListener('click', (e) => {
            if (e.target === modal) {
                modal.style.display = 'none';
                document.body.style.overflow = 'auto';
            }
        });

        // Intersection Observer for better performance
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

                            // For stat counters
                            if (element.classList.contains('stat-item')) {
                                const counter = element.querySelector('.stat-count');
                                startCounting(counter);
                            }
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
    </script>
</body>
</html>