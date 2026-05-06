<?php
// Database connection
require_once('../admin/config/connection.php');

// Start session for admin check
if (session_status() === PHP_SESSION_NONE) {
    session_start();
}

// Fetch page data
$page_query = "SELECT * FROM complaints_page WHERE id = 1";
$page_result = mysqli_query($conn, $page_query);
$page = mysqli_fetch_assoc($page_result);

// Fetch parallax data
$parallax_query = "SELECT * FROM complaints_parallax WHERE id = 1";
$parallax_result = mysqli_query($conn, $parallax_query);
$parallax = mysqli_fetch_assoc($parallax_result);

// Fetch problems for section 1 (UP)
$problems_up_query = "SELECT * FROM complaints_problems WHERE section = 1 ORDER BY card_order ASC";
$problems_up_result = mysqli_query($conn, $problems_up_query);
$problems_up = [];
while ($problem = mysqli_fetch_assoc($problems_up_result)) {
    $problems_up[] = $problem;
}

// Fetch problems for section 2 (DOWN)
$problems_down_query = "SELECT * FROM complaints_problems WHERE section = 2 ORDER BY card_order ASC";
$problems_down_result = mysqli_query($conn, $problems_down_query);
$problems_down = [];
while ($problem = mysqli_fetch_assoc($problems_down_result)) {
    $problems_down[] = $problem;
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Virunga Ecotours - Common Complaints</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link rel="stylesheet" href="../css/complaints.css">
    <link rel="stylesheet" href="../css/earthy-theme.css">
    <link rel="stylesheet" href="../css/header.css" />
    <link rel="stylesheet" href="../css/main.css" />
    <link rel="stylesheet" href="../css/new.css" />
    <link
      rel="shortcut icon"
      href="../images/logos/icon.png"
      type="image/x-icon"
    />
   
</head>
<body>
    <?php include "./includes/header.php"; ?>
    <div class="hero-section" <?php if (!empty($page['hero_image'])): ?>style="background-image: url('<?php echo htmlspecialchars('pages/' . $page['hero_image']); ?>'); background-size: cover; background-position: center;"<?php endif; ?>>
        <div class="safety-banner">
            <div class="safety-text">
                <i class="fas fa-shield-alt"></i>
                <strong>Your Safety, Our Priority</strong>
                <i class="fas fa-shield-alt"></i>
            </div>
        </div>

        <div class="parallax-bg"></div>
        <div class="floating-element" style="top: 20%; left: 8%; font-size: 4rem;">
            <i class="fas fa-mountain"></i>
        </div>
        <div class="floating-element" style="top: 30%; right: 12%; font-size: 3rem; animation-delay: -2s;">
            <i class="fas fa-tree"></i>
        </div>
        <div class="floating-element" style="bottom: 25%; left: 15%; font-size: 5rem; animation-delay: -4s;">
            <i class="fas fa-hiking"></i>
        </div>
        <div class="floating-element" style="bottom: 20%; right: 20%; font-size: 3.5rem; animation-delay: -1s;">
            <i class="fas fa-leaf"></i>
        </div>
        <div class="floating-element" style="top: 60%; left: 5%; font-size: 2.5rem; animation-delay: -3s;">
            <i class="fas fa-binoculars"></i>
        </div>

        <div class="hero-content">
            <h1 class="hero-title">
                <i class="fas fa-globe-africa" style="margin-right: 20px;"></i>
                <?php echo htmlspecialchars($page['hero_title'] ?? 'Virunga Massif Solutions'); ?>
            </h1>
            <p class="hero-subtitle">
                <?php echo htmlspecialchars($page['hero_subtitle'] ?? 'Professional solutions for 50+ common visitor challenges across Rwanda, Uganda, and the Democratic Republic of Congo. Experience seamless wildlife adventures with our expert guidance and local expertise.'); ?>
            </p>


        </div>
    </div>

    <div class="content-wrapper">
        <div class="main-content">
            <div class="section-header">
                <h2 class="section-title">
                    <i class="fas fa-compass"></i>
                    Common Visitor Challenges & Expert Solutions
                </h2>
                <p class="section-description">
                    From permit complications to cultural misunderstandings, we've identified and solved every challenge visitors face in the Virunga Massif region.
                </p>
            </div>

            <div class="problems-grid" id="problemsGrid">
                <?php foreach ($problems_up as $problem): ?>
                <div class="problem-card" data-problem="<?php echo htmlspecialchars(strtolower($problem['problem_title'])); ?>">
                    <div class="problem-header">
                        <div class="problem-number"><?php echo htmlspecialchars($problem['problem_number']); ?></div>
                        <i class="<?php echo htmlspecialchars($problem['problem_icon']); ?> problem-icon"></i>
                        <h3 class="problem-title"><?php echo htmlspecialchars($problem['problem_title']); ?></h3>
                    </div>
                    <p class="problem-description"><?php echo htmlspecialchars($problem['problem_description']); ?></p>
                    <div class="solution-section">
                        <div class="solution-label">
                            <i class="fas fa-lightbulb"></i>
                            Solution:
                        </div>
                        <p class="solution-text"><?php echo htmlspecialchars($problem['solution_text']); ?></p>
                    </div>
                </div>
                <?php endforeach; ?>
            </div>

            <div class="parallax-section" id="parallaxSection">
                <div class="parallax-bg"></div>
                <div class="parallax-content">
                    <h3 class="parallax-title">
                        <i class="fas fa-mountain"></i>
                        <?php echo htmlspecialchars($parallax['parallax_title'] ?? 'Expert Wildlife Experiences'); ?>
                    </h3>
                    <p class="parallax-subtitle">
                        <?php echo htmlspecialchars($parallax['parallax_subtitle'] ?? 'With over a decade of experience guiding visitors through the breathtaking landscapes of the Virunga Massif, we ensure every encounter with mountain gorillas, golden monkeys, and local communities creates memories that last a lifetime.'); ?>
                    </p>
                    <div class="parallax-features">
                        <div class="parallax-feature">
                            <i class="fas fa-users"></i>
                            <div class="parallax-feature-text">Expert Guides</div>
                        </div>
                        <div class="parallax-feature">
                            <i class="fas fa-route"></i>
                            <div class="parallax-feature-text">Custom Routes</div>
                        </div>
                        <div class="parallax-feature">
                            <i class="fas fa-headset"></i>
                            <div class="parallax-feature-text">24/7 Support</div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="problems-grid" id="problemsGridSecond">
                <?php foreach ($problems_down as $problem): ?>
                <div class="problem-card" data-problem="<?php echo htmlspecialchars(strtolower($problem['problem_title'])); ?>">
                    <div class="problem-header">
                        <div class="problem-number"><?php echo htmlspecialchars($problem['problem_number']); ?></div>
                        <i class="<?php echo htmlspecialchars($problem['problem_icon']); ?> problem-icon"></i>
                        <h3 class="problem-title"><?php echo htmlspecialchars($problem['problem_title']); ?></h3>
                    </div>
                    <p class="problem-description"><?php echo htmlspecialchars($problem['problem_description']); ?></p>
                    <div class="solution-section">
                        <div class="solution-label">
                            <i class="fas fa-lightbulb"></i>
                            Solution:
                        </div>
                        <p class="solution-text"><?php echo htmlspecialchars($problem['solution_text']); ?></p>
                    </div>
                </div>
                <?php endforeach; ?>
            </div>

            <div class="conclusion-section">
                <h2 class="conclusion-title">
                    <i class="fas fa-check-circle"></i>
                    Your Journey, Our Expertise
                </h2>
                <p class="conclusion-text">
                    Virunga Ecotours combines local expertise, strategic planning, and professional coordination to address these challenges proactively.
                    Clients are guided from initial planning to post-trip follow-up, ensuring every journey across the Virunga Massif is safe, seamless, and unforgettable.
                </p>
            </div>
        </div>
    </div>

    <script>
        // Hero steady; section background fixed (no JS transforms)
        function updateParallax() {
            // No-op now; kept for future use
        }
        let ticking = false;
        function requestTick() {
            if (!ticking) {
                requestAnimationFrame(updateParallax);
                ticking = true;
            }
        }
        function handleScroll() {
            requestTick();
            ticking = false;
        }
        document.addEventListener('DOMContentLoaded', function() {
            // No scroll handlers needed since both backgrounds are steady
        });
    </script>
    <?php include './includes/footer.php'; ?>
    <script src="../js/header.js" defer></script>
</body>
</html>