<?php
// Database connection
require_once('../../config/connection.php');

// Start session
if (session_status() === PHP_SESSION_NONE) {
    session_start();
}

// Check if admin is logged in
if (!isset($_SESSION['admin_id'])) {
    header('Location: ../login.html');
    exit();
}

// Fetch current data
$page_query = "SELECT * FROM photograph_page WHERE id = 1";
$page_result = mysqli_query($conn, $page_query);
$page = mysqli_fetch_assoc($page_result);

$overview_query = "SELECT * FROM photograph_overview WHERE id = 1";
$overview_result = mysqli_query($conn, $overview_query);
$overview = mysqli_fetch_assoc($overview_result);

$expectations_query = "SELECT * FROM photograph_expectations WHERE id = 1";
$expectations_result = mysqli_query($conn, $expectations_query);
$expectations = mysqli_fetch_assoc($expectations_result);

$table_section_query = "SELECT * FROM photograph_table_section WHERE id = 1";
$table_section_result = mysqli_query($conn, $table_section_query);
$table_section = mysqli_fetch_assoc($table_section_result);
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Kids for Life Photography - Admin</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link rel="stylesheet" href="../assets/css/admin-style.css">
    <style>
        .admin-container {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 20px;
            margin-top: 20px;
        }
        .admin-card {
            background: white;
            border-radius: 8px;
            padding: 20px;
            box-shadow: 0 2px 8px rgba(0,0,0,0.1);
            border-left: 4px solid #8B7355;
        }
        .admin-card h3 {
            margin-top: 0;
            color: #333;
            display: flex;
            align-items: center;
            gap: 10px;
        }
        .admin-card p {
            color: #666;
            font-size: 14px;
            margin: 10px 0;
        }
        .admin-card .btn {
            display: inline-block;
            padding: 10px 20px;
            background: #8B7355;
            color: white;
            text-decoration: none;
            border-radius: 4px;
            margin-top: 10px;
            transition: background 0.3s;
        }
        .admin-card .btn:hover {
            background: #5C4033;
        }
        .preview-image {
            width: 100%;
            height: 150px;
            background: #f0f0f0;
            border-radius: 4px;
            display: flex;
            align-items: center;
            justify-content: center;
            margin: 10px 0;
            overflow: hidden;
        }
        .preview-image img {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }
    </style>
</head>
<body class="admin-layout">
    <?php include '../includes/sidebar.php'; ?>
    
    <div class="admin-main">
        <header class="page-header">
            <h1><i class="fas fa-camera"></i> Kids for Life Photography</h1>
            <p>Manage all content for the Photography Training program page</p>
        </header>

        <div class="admin-container">
            <!-- Hero Section Card -->
            <div class="admin-card">
                <h3><i class="fas fa-image"></i> Hero Section</h3>
                <p><strong>Title:</strong> <?php echo htmlspecialchars($page['hero_title'] ?? 'N/A'); ?></p>
                <p><strong>Subtitle:</strong> <?php echo htmlspecialchars($page['hero_subtitle'] ?? 'N/A'); ?></p>
                <?php if (!empty($page['hero_image'])): ?>
                    <div class="preview-image">
                        <img src="<?php echo htmlspecialchars($page['hero_image']); ?>" alt="Hero Image">
                    </div>
                <?php else: ?>
                    <p style="color: #999; font-style: italic;">No image uploaded</p>
                <?php endif; ?>
                <a href="edit-hero.php" class="btn"><i class="fas fa-edit"></i> Edit Hero</a>
            </div>

            <!-- Overview Section Card -->
            <div class="admin-card">
                <h3><i class="fas fa-book"></i> Overview Section</h3>
                <p><strong>Title:</strong> <?php echo htmlspecialchars($overview['overview_title'] ?? 'N/A'); ?></p>
                <p><strong>Content:</strong> <?php echo substr(htmlspecialchars($overview['overview_intro'] ?? ''), 0, 100) . '...'; ?></p>
                <a href="edit-overview.php" class="btn"><i class="fas fa-edit"></i> Edit Overview</a>
            </div>

            <!-- Expectations Section Card -->
            <div class="admin-card">
                <h3><i class="fas fa-star"></i> Expectations Section</h3>
                <p><strong>Title:</strong> <?php echo htmlspecialchars($expectations['expectations_title'] ?? 'N/A'); ?></p>
                <?php if (!empty($expectations['expectations_image'])): ?>
                    <div class="preview-image">
                        <img src="<?php echo htmlspecialchars($expectations['expectations_image']); ?>" alt="Expectations Image">
                    </div>
                <?php else: ?>
                    <p style="color: #999; font-style: italic;">No image uploaded</p>
                <?php endif; ?>
                <a href="edit-expectations.php" class="btn"><i class="fas fa-edit"></i> Edit Expectations</a>
            </div>

            <!-- Program Table Section Card -->
            <div class="admin-card">
                <h3><i class="fas fa-table"></i> Program Table</h3>
                <p><strong>Title:</strong> <?php echo htmlspecialchars($table_section['table_title'] ?? 'N/A'); ?></p>
                <p><strong>Intro:</strong> <?php echo substr(htmlspecialchars($table_section['table_intro'] ?? ''), 0, 100) . '...'; ?></p>
                <a href="edit-table.php" class="btn"><i class="fas fa-edit"></i> Edit Table</a>
            </div>
        </div>
    </div>
</body>
</html>

