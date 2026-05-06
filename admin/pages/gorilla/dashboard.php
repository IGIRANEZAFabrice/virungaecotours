<?php
session_start();

// Initialize stats
$stats = [];
$families_by_country = [];
$error_message = '';

// Try to connect and get statistics
try {
    require_once(dirname(__FILE__) . '/../../config/connection.php');

    if (!$conn) {
        throw new Exception("Database connection failed");
    }

    // Hero section
    $hero_query = "SELECT COUNT(*) as count FROM gorilla_hero_section WHERE is_active = 1";
    $hero_result = $conn->query($hero_query);
    if ($hero_result) {
        $stats['hero'] = $hero_result->fetch_assoc()['count'] ?? 0;
    }

    // Intro section
    $intro_query = "SELECT COUNT(*) as count FROM gorilla_intro_section WHERE is_active = 1";
    $intro_result = $conn->query($intro_query);
    if ($intro_result) {
        $stats['intro'] = $intro_result->fetch_assoc()['count'] ?? 0;
    }

    // History section
    $history_query = "SELECT COUNT(*) as count FROM gorilla_history_section WHERE is_active = 1";
    $history_result = $conn->query($history_query);
    if ($history_result) {
        $stats['history'] = $history_result->fetch_assoc()['count'] ?? 0;
    }

    // Habitat section
    $habitat_query = "SELECT COUNT(*) as count FROM gorilla_habitat_section WHERE is_active = 1";
    $habitat_result = $conn->query($habitat_query);
    if ($habitat_result) {
        $stats['habitat'] = $habitat_result->fetch_assoc()['count'] ?? 0;
    }

    // Conservation section
    $conservation_query = "SELECT COUNT(*) as count FROM gorilla_conservation_section WHERE is_active = 1";
    $conservation_result = $conn->query($conservation_query);
    if ($conservation_result) {
        $stats['conservation'] = $conservation_result->fetch_assoc()['count'] ?? 0;
    }

    // Discounts section
    $discounts_query = "SELECT COUNT(*) as count FROM gorilla_discounts_section WHERE is_active = 1";
    $discounts_result = $conn->query($discounts_query);
    if ($discounts_result) {
        $stats['discounts'] = $discounts_result->fetch_assoc()['count'] ?? 0;
    }

    // Families
    $families_query = "SELECT COUNT(*) as count FROM gorilla_families WHERE is_active = 1";
    $families_result = $conn->query($families_query);
    if ($families_result) {
        $stats['families'] = $families_result->fetch_assoc()['count'] ?? 0;
    }

    // Families by country
    $country_query = "SELECT country, COUNT(*) as count FROM gorilla_families WHERE is_active = 1 GROUP BY country";
    $country_result = $conn->query($country_query);
    if ($country_result) {
        while ($row = $country_result->fetch_assoc()) {
            $families_by_country[$row['country']] = $row['count'];
        }
    }
} catch (Exception $e) {
    $error_message = "Error loading dashboard: " . $e->getMessage();
}
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Gorilla Page Admin Dashboard</title>
    <link rel="shortcut icon" href="../../images/icon.png" type="image/x-icon" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css" />
    <link rel="stylesheet" href="../../css/common.css" />
    <link rel="stylesheet" href="../../css/gorilla.css" />
    <script src="../../js/common.js" defer></script>
</head>
<body>
    <div class="admin-container">
        <!-- Include sidebar -->
        <?php include_once dirname(__FILE__) . '/include/sidebar.php'; ?>

        <main class="main-content">
            <!-- Include header -->
            <?php include_once dirname(__FILE__) . '/include/header.php'; ?>

            <div class="content-area">
                <div class="panel">
                    <div class="panel-header">
                        <h1><i class="fas fa-paw"></i> Gorilla Page Dashboard</h1>
                    </div>

                    <?php if (!empty($error_message)): ?>
                        <div style="background-color: #fee; border: 1px solid #fcc; color: #c33; padding: 1rem; border-radius: 4px; margin-bottom: 1rem;">
                            <strong>Error:</strong> <?php echo htmlspecialchars($error_message); ?>
                        </div>
                    <?php endif; ?>

                    <p style="color: var(--text-medium); margin-bottom: 2rem;">Manage all sections of the gorilla page including hero, intro, history, habitat, conservation, discounts, and families.</p>

                    <!-- Statistics Grid -->
                    <div class="dashboard-grid">
                        <div class="dashboard-card">
                            <div class="card-icon"><i class="fas fa-users"></i></div>
                            <div class="card-title">Total Families</div>
                            <div class="card-value"><?php echo $stats['families']; ?></div>
                        </div>
                        <div class="dashboard-card">
                            <div class="card-icon"><i class="fas fa-check-circle"></i></div>
                            <div class="card-title">Sections Active</div>
                            <div class="card-value"><?php echo array_sum($stats) - $stats['families']; ?></div>
                        </div>
                        <div class="dashboard-card">
                            <div class="card-icon"><i class="fas fa-map-marker-alt"></i></div>
                            <div class="card-title">Rwanda Families</div>
                            <div class="card-value"><?php echo $families_by_country['Rwanda'] ?? 0; ?></div>
                        </div>
                        <div class="dashboard-card">
                            <div class="card-icon"><i class="fas fa-map-marker-alt"></i></div>
                            <div class="card-title">Uganda Families</div>
                            <div class="card-value"><?php echo $families_by_country['Uganda'] ?? 0; ?></div>
                        </div>
                    </div>

                    <!-- Section Header -->
                    <div class="section-header" style="margin-top: 2rem;">
                        <h2><i class="fas fa-cog"></i> Manage Sections</h2>
                    </div>

                    <!-- Sections Grid -->
                    <div class="dashboard-grid" style="margin-top: 1.5rem;">
                        <!-- Hero Section -->
                        <div class="dashboard-card">
                            <div class="card-icon"><i class="fas fa-image"></i></div>
                            <div class="card-title">Hero Section</div>
                            <p style="color: var(--text-medium); font-size: 0.9rem; margin-bottom: 1rem;">Edit the main hero banner with title, subtitle, and background image.</p>
                            <a href="hero.php" class="card-action"><i class="fas fa-edit"></i> Edit</a>
                        </div>

                        <!-- Intro Section -->
                        <div class="dashboard-card">
                            <div class="card-icon"><i class="fas fa-info-circle"></i></div>
                            <div class="card-title">Intro Section</div>
                            <p style="color: var(--text-medium); font-size: 0.9rem; margin-bottom: 1rem;">Manage introduction text, image, and highlight points.</p>
                            <a href="intro.php" class="card-action"><i class="fas fa-edit"></i> Edit</a>
                        </div>

                        <!-- History Section -->
                        <div class="dashboard-card">
                            <div class="card-icon"><i class="fas fa-history"></i></div>
                            <div class="card-title">History Section</div>
                            <p style="color: var(--text-medium); font-size: 0.9rem; margin-bottom: 1rem;">Edit timeline events and conservation history.</p>
                            <a href="history.php" class="card-action"><i class="fas fa-edit"></i> Edit</a>
                        </div>

                        <!-- Habitat Section -->
                        <div class="dashboard-card">
                            <div class="card-icon"><i class="fas fa-tree"></i></div>
                            <div class="card-title">Habitat Section</div>
                            <p style="color: var(--text-medium); font-size: 0.9rem; margin-bottom: 1rem;">Manage habitat cards and location information.</p>
                            <a href="habitat.php" class="card-action"><i class="fas fa-edit"></i> Edit</a>
                        </div>

                        <!-- Conservation Section -->
                        <div class="dashboard-card">
                            <div class="card-icon"><i class="fas fa-leaf"></i></div>
                            <div class="card-title">Conservation Section</div>
                            <p style="color: var(--text-medium); font-size: 0.9rem; margin-bottom: 1rem;">Edit conservation benefits and statistics.</p>
                            <a href="conservation.php" class="card-action"><i class="fas fa-edit"></i> Edit</a>
                        </div>

                        <!-- Discounts Section -->
                        <div class="dashboard-card">
                            <div class="card-icon"><i class="fas fa-tag"></i></div>
                            <div class="card-title">Discounts Section</div>
                            <p style="color: var(--text-medium); font-size: 0.9rem; margin-bottom: 1rem;">Manage discount information and pricing tables.</p>
                            <a href="discounts.php" class="card-action"><i class="fas fa-edit"></i> Edit</a>
                        </div>

                        <!-- Families Section -->
                        <div class="dashboard-card">
                            <div class="card-icon"><i class="fas fa-users"></i></div>
                            <div class="card-title">Gorilla Families</div>
                            <div style="background: var(--neutral-light); padding: 1rem; border-radius: var(--border-radius); margin-bottom: 1rem; font-size: 0.9rem;">
                                <p><strong>Total:</strong> <?php echo $stats['families']; ?></p>
                                <?php foreach ($families_by_country as $country => $count): ?>
                                    <p><strong><?php echo $country; ?>:</strong> <?php echo $count; ?></p>
                                <?php endforeach; ?>
                            </div>
                            <a href="families.php" class="card-action"><i class="fas fa-edit"></i> Manage</a>
                        </div>
                    </div>
                </div>
            </div>
        </main>
    </div>
    <script src="../../js/common.js"></script>
</body>
</html>

