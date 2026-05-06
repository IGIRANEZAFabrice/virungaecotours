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
$page_query = "SELECT * FROM complaints_page WHERE id = 1";
$page_result = mysqli_query($conn, $page_query);
$page = mysqli_fetch_assoc($page_result);

$parallax_query = "SELECT * FROM complaints_parallax WHERE id = 1";
$parallax_result = mysqli_query($conn, $parallax_query);
$parallax = mysqli_fetch_assoc($parallax_result);

// Count problems in each section
$up_count_query = "SELECT COUNT(*) as count FROM complaints_problems WHERE section = 1";
$up_count_result = mysqli_query($conn, $up_count_query);
$up_count = mysqli_fetch_assoc($up_count_result)['count'];

$down_count_query = "SELECT COUNT(*) as count FROM complaints_problems WHERE section = 2";
$down_count_result = mysqli_query($conn, $down_count_query);
$down_count = mysqli_fetch_assoc($down_count_result)['count'];
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Common Complaints - Admin</title>
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
        .section-badge {
            display: inline-block;
            background: #8B7355;
            color: white;
            padding: 4px 12px;
            border-radius: 20px;
            font-size: 12px;
            font-weight: 600;
            margin-left: 10px;
        }
    </style>
</head>
<body class="admin-layout">
    <?php include '../includes/sidebar.php'; ?>
    
    <div class="admin-main">
        <header class="page-header">
            <h1><i class="fas fa-exclamation-circle"></i> Common Complaints & Solutions</h1>
            <p>Manage all content for the Common Complaints page</p>
        </header>

        <div class="admin-container">
            <!-- Hero Section Card -->
            <div class="admin-card">
                <h3><i class="fas fa-heading"></i> Hero Section</h3>
                <p><strong>Title:</strong> <?php echo htmlspecialchars($page['hero_title'] ?? 'N/A'); ?></p>
                <p><strong>Subtitle:</strong> <?php echo substr(htmlspecialchars($page['hero_subtitle'] ?? ''), 0, 100) . '...'; ?></p>
                <a href="edit-hero.php" class="btn"><i class="fas fa-edit"></i> Edit Hero</a>
            </div>

            <!-- Parallax Section Card -->
            <div class="admin-card">
                <h3><i class="fas fa-mountain"></i> Parallax Section</h3>
                <p><strong>Title:</strong> <?php echo htmlspecialchars($parallax['parallax_title'] ?? 'N/A'); ?></p>
                <p><strong>Content:</strong> <?php echo substr(htmlspecialchars($parallax['parallax_subtitle'] ?? ''), 0, 100) . '...'; ?></p>
                <a href="edit-parallax.php" class="btn"><i class="fas fa-edit"></i> Edit Parallax</a>
            </div>

            <!-- Section 1 (UP) Card -->
            <div class="admin-card">
                <h3><i class="fas fa-arrow-up"></i> Section 1 - Before Parallax <span class="section-badge">UP</span></h3>
                <p><strong>Total Problems:</strong> <?php echo $up_count; ?></p>
                <p style="color: #999; font-size: 13px;">These problems appear BEFORE the parallax section</p>
                <a href="edit-problems.php?section=1" class="btn"><i class="fas fa-edit"></i> Edit Problems</a>
            </div>

            <!-- Section 2 (DOWN) Card -->
            <div class="admin-card">
                <h3><i class="fas fa-arrow-down"></i> Section 2 - After Parallax <span class="section-badge">DOWN</span></h3>
                <p><strong>Total Problems:</strong> <?php echo $down_count; ?></p>
                <p style="color: #999; font-size: 13px;">These problems appear AFTER the parallax section</p>
                <a href="edit-problems.php?section=2" class="btn"><i class="fas fa-edit"></i> Edit Problems</a>
            </div>
        </div>
    </div>
</body>
</html>

