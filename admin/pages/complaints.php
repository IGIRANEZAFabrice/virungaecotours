<?php
// Database connection
require_once('../config/connection.php');

// Start session
if (session_status() === PHP_SESSION_NONE) {
    session_start();
}

// Check if admin is logged in
if (!isset($_SESSION['admin_id'])) {
    header('Location: login.html');
    exit();
}

// Get action from URL
$action = isset($_GET['action']) ? $_GET['action'] : 'dashboard';
$section = isset($_GET['section']) ? (int)$_GET['section'] : 1;

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

$success_message = '';
$error_message = '';

// Handle form submissions
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    if (isset($_POST['form_type'])) {
        if ($_POST['form_type'] === 'hero') {
            $hero_subtitle = mysqli_real_escape_string($conn, $_POST['hero_subtitle'] ?? '');
            $hero_image = $page['hero_image']; // Keep existing image by default

            // Handle image upload
            if (isset($_FILES['hero_image']) && $_FILES['hero_image']['error'] === UPLOAD_ERR_OK) {
                $upload_dir = '../../pages/assets/images/';
                if (!is_dir($upload_dir)) {
                    mkdir($upload_dir, 0755, true);
                }

                $file_name = 'complaints_hero_' . time() . '_' . basename($_FILES['hero_image']['name']);
                $file_path = $upload_dir . $file_name;

                if (move_uploaded_file($_FILES['hero_image']['tmp_name'], $file_path)) {
                    $hero_image = 'assets/images/' . $file_name;
                } else {
                    $error_message = 'Failed to upload image.';
                }
            }

            if (!$error_message) {
                $hero_image = mysqli_real_escape_string($conn, $hero_image);
                $update_query = "UPDATE complaints_page SET hero_subtitle = '$hero_subtitle', hero_image = '$hero_image' WHERE id = 1";
                if (mysqli_query($conn, $update_query)) {
                    $success_message = 'Hero section updated successfully!';
                    $page_result = mysqli_query($conn, $page_query);
                    $page = mysqli_fetch_assoc($page_result);
                } else {
                    $error_message = 'Database error: ' . mysqli_error($conn);
                }
            }
        } elseif ($_POST['form_type'] === 'parallax') {
            $parallax_subtitle = mysqli_real_escape_string($conn, $_POST['parallax_subtitle'] ?? '');
            $update_query = "UPDATE complaints_parallax SET parallax_subtitle = '$parallax_subtitle' WHERE id = 1";
            if (mysqli_query($conn, $update_query)) {
                $success_message = 'Parallax section updated successfully!';
                $parallax_result = mysqli_query($conn, $parallax_query);
                $parallax = mysqli_fetch_assoc($parallax_result);
            } else {
                $error_message = 'Database error: ' . mysqli_error($conn);
            }
        } elseif ($_POST['form_type'] === 'problem') {
            $problem_id = (int)$_POST['problem_id'];
            $problem_description = mysqli_real_escape_string($conn, $_POST['problem_description'] ?? '');
            $solution_text = mysqli_real_escape_string($conn, $_POST['solution_text'] ?? '');
            $problem_icon = mysqli_real_escape_string($conn, $_POST['problem_icon'] ?? 'fas fa-star');
            $update_query = "UPDATE complaints_problems SET problem_description = '$problem_description', solution_text = '$solution_text', problem_icon = '$problem_icon' WHERE id = $problem_id";
            if (mysqli_query($conn, $update_query)) {
                $success_message = 'Problem updated successfully!';
            } else {
                $error_message = 'Database error: ' . mysqli_error($conn);
            }
        }
    }
}

// Fetch problems for selected section
$problems_query = "SELECT * FROM complaints_problems WHERE section = $section ORDER BY card_order ASC";
$problems_result = mysqli_query($conn, $problems_query);
$problems = [];
while ($problem = mysqli_fetch_assoc($problems_result)) {
    $problems[] = $problem;
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Common Complaints - Admin</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link rel="stylesheet" href="../css/common.css">
    <style>
        .admin-container { display: grid; grid-template-columns: repeat(auto-fit, minmax(300px, 1fr)); gap: 20px; margin-top: 20px; }
        .admin-card { background: white; border-radius: 8px; padding: 20px; box-shadow: 0 2px 8px rgba(0,0,0,0.1); border-left: 4px solid #8B7355; }
        .admin-card h3 { margin-top: 0; color: #333; display: flex; align-items: center; gap: 10px; }
        .admin-card .btn { display: inline-block; padding: 10px 20px; background: #8B7355; color: white; text-decoration: none; border-radius: 4px; margin-top: 10px; transition: background 0.3s; }
        .admin-card .btn:hover { background: #5C4033; }
        .section-badge { display: inline-block; background: #8B7355; color: white; padding: 4px 12px; border-radius: 20px; font-size: 12px; font-weight: 600; margin-left: 10px; }
        .form-group { margin-bottom: 20px; }
        .form-group label { display: block; margin-bottom: 8px; font-weight: 600; color: #333; }
        .form-group input, .form-group textarea { width: 100%; padding: 10px; border: 1px solid #ddd; border-radius: 4px; }
        .form-group textarea { resize: vertical; min-height: 100px; }
        .btn-group { display: flex; gap: 10px; margin-top: 20px; }
        .btn-primary { padding: 10px 20px; background: #8B7355; color: white; border: none; border-radius: 4px; cursor: pointer; }
        .btn-primary:hover { background: #5C4033; }
        .alert { padding: 15px; border-radius: 4px; margin-bottom: 20px; }
        .alert-success { background: #d4edda; color: #155724; border: 1px solid #c3e6cb; }
        .alert-error { background: #f8d7da; color: #721c24; border: 1px solid #f5c6cb; }
        .section-tabs { display: flex; gap: 10px; margin-bottom: 20px; border-bottom: 2px solid #ddd; }
        .section-tabs a { padding: 10px 20px; text-decoration: none; color: #666; border-bottom: 3px solid transparent; transition: all 0.3s; }
        .section-tabs a.active { color: #8B7355; border-bottom-color: #8B7355; }
        .problems-list { display: grid; gap: 20px; }
        .problem-item { background: white; border: 1px solid #ddd; border-radius: 8px; padding: 20px; box-shadow: 0 2px 4px rgba(0,0,0,0.05); }
        .problem-item h4 { margin-top: 0; color: #333; }
        .preview-image { width: 100%; height: 150px; background: #f0f0f0; border-radius: 4px; display: flex; align-items: center; justify-content: center; margin: 10px 0; overflow: hidden; }
        .preview-image img { width: 100%; height: 100%; object-fit: cover; }
    </style>
</head>
<body class="admin-layout">
    <?php include 'includes/sidebar.php'; ?>

    <div class="admin-main">
        <?php include 'includes/header.php'; ?>

        <header class="page-header">
            <h1><i class="fas fa-exclamation-circle"></i> Common Complaints & Solutions</h1>
            <p>Manage all content for the Common Complaints page</p>
        </header>

        <?php if ($success_message): ?>
            <div class="alert alert-success"><?php echo $success_message; ?></div>
        <?php endif; ?>
        <?php if ($error_message): ?>
            <div class="alert alert-error"><?php echo $error_message; ?></div>
        <?php endif; ?>

        <?php if ($action === 'dashboard'): ?>
            <div class="admin-container">
                <div class="admin-card">
                    <h3><i class="fas fa-heading"></i> Hero Section</h3>
                    <p><strong>Title:</strong> <?php echo htmlspecialchars($page['hero_title'] ?? 'N/A'); ?></p>
                    <p><strong>Subtitle:</strong> <?php echo substr(htmlspecialchars($page['hero_subtitle'] ?? ''), 0, 100) . '...'; ?></p>
                    <a href="?action=edit_hero" class="btn"><i class="fas fa-edit"></i> Edit Hero</a>
                </div>

                <div class="admin-card">
                    <h3><i class="fas fa-mountain"></i> Parallax Section</h3>
                    <p><strong>Title:</strong> <?php echo htmlspecialchars($parallax['parallax_title'] ?? 'N/A'); ?></p>
                    <p><strong>Content:</strong> <?php echo substr(htmlspecialchars($parallax['parallax_subtitle'] ?? ''), 0, 100) . '...'; ?></p>
                    <a href="?action=edit_parallax" class="btn"><i class="fas fa-edit"></i> Edit Parallax</a>
                </div>

                <div class="admin-card">
                    <h3><i class="fas fa-arrow-up"></i> Section 1 - Before Parallax <span class="section-badge">UP</span></h3>
                    <p><strong>Total Problems:</strong> <?php echo $up_count; ?></p>
                    <p style="color: #999; font-size: 13px;">These problems appear BEFORE the parallax section</p>
                    <a href="?action=edit_problems&section=1" class="btn"><i class="fas fa-edit"></i> Edit Problems</a>
                </div>

                <div class="admin-card">
                    <h3><i class="fas fa-arrow-down"></i> Section 2 - After Parallax <span class="section-badge">DOWN</span></h3>
                    <p><strong>Total Problems:</strong> <?php echo $down_count; ?></p>
                    <p style="color: #999; font-size: 13px;">These problems appear AFTER the parallax section</p>
                    <a href="?action=edit_problems&section=2" class="btn"><i class="fas fa-edit"></i> Edit Problems</a>
                </div>
            </div>

        <?php elseif ($action === 'edit_hero'): ?>
            <form method="POST" enctype="multipart/form-data" style="max-width: 600px;">
                <input type="hidden" name="form_type" value="hero">
                <div class="form-group">
                    <label>Hero Title (Static - Display Only)</label>
                    <input type="text" value="<?php echo htmlspecialchars($page['hero_title'] ?? ''); ?>" readonly style="background: #f5f5f5; cursor: not-allowed;">
                </div>
                <div class="form-group">
                    <label for="hero_subtitle">Hero Subtitle</label>
                    <textarea id="hero_subtitle" name="hero_subtitle" required><?php echo htmlspecialchars($page['hero_subtitle'] ?? ''); ?></textarea>
                </div>
                <div class="form-group">
                    <label for="hero_image">Hero Image</label>
                    <?php if (!empty($page['hero_image'])): ?>
                        <div class="preview-image">
                            <img src="<?php echo htmlspecialchars('../../pages/' . $page['hero_image']); ?>" alt="Hero Image">
                        </div>
                    <?php endif; ?>
                    <input type="file" id="hero_image" name="hero_image" accept="image/*">
                    <small style="color: #666;">Upload a new image to replace the current one (optional)</small>
                </div>
                <div class="btn-group">
                    <button type="submit" class="btn-primary"><i class="fas fa-save"></i> Save Changes</button>
                    <a href="?action=dashboard" class="btn-primary" style="background: #ddd; color: #333; text-decoration: none;"><i class="fas fa-arrow-left"></i> Back</a>
                </div>
            </form>

        <?php elseif ($action === 'edit_parallax'): ?>
            <form method="POST" style="max-width: 600px;">
                <input type="hidden" name="form_type" value="parallax">
                <div class="form-group">
                    <label>Parallax Title (Static - Display Only)</label>
                    <input type="text" value="<?php echo htmlspecialchars($parallax['parallax_title'] ?? ''); ?>" readonly style="background: #f5f5f5; cursor: not-allowed;">
                </div>
                <div class="form-group">
                    <label for="parallax_subtitle">Parallax Subtitle</label>
                    <textarea id="parallax_subtitle" name="parallax_subtitle" required><?php echo htmlspecialchars($parallax['parallax_subtitle'] ?? ''); ?></textarea>
                </div>
                <div class="btn-group">
                    <button type="submit" class="btn-primary"><i class="fas fa-save"></i> Save Changes</button>
                    <a href="?action=dashboard" class="btn-primary" style="background: #ddd; color: #333; text-decoration: none;"><i class="fas fa-arrow-left"></i> Back</a>
                </div>
            </form>

        <?php elseif ($action === 'edit_problems'): ?>
            <div class="section-tabs">
                <a href="?action=edit_problems&section=1" class="<?php echo ($section === 1) ? 'active' : ''; ?>"><i class="fas fa-arrow-up"></i> Section 1 (UP)</a>
                <a href="?action=edit_problems&section=2" class="<?php echo ($section === 2) ? 'active' : ''; ?>"><i class="fas fa-arrow-down"></i> Section 2 (DOWN)</a>
            </div>

            <div class="problems-list">
                <?php foreach ($problems as $problem): ?>
                <div class="problem-item">
                    <h4>Problem #<?php echo htmlspecialchars($problem['problem_number']); ?> - <?php echo htmlspecialchars($problem['problem_title']); ?></h4>
                    <form method="POST">
                        <input type="hidden" name="form_type" value="problem">
                        <input type="hidden" name="problem_id" value="<?php echo $problem['id']; ?>">
                        <div class="form-group">
                            <label>Problem Title (Static - Display Only)</label>
                            <input type="text" value="<?php echo htmlspecialchars($problem['problem_title']); ?>" readonly style="background: #f5f5f5; cursor: not-allowed;">
                        </div>
                        <div class="form-group">
                            <label>Icon Class</label>
                            <input type="text" name="problem_icon" value="<?php echo htmlspecialchars($problem['problem_icon']); ?>" placeholder="e.g., fas fa-star">
                        </div>
                        <div class="form-group">
                            <label>Problem Description</label>
                            <textarea name="problem_description" required><?php echo htmlspecialchars($problem['problem_description']); ?></textarea>
                        </div>
                        <div class="form-group">
                            <label>Solution</label>
                            <textarea name="solution_text" required><?php echo htmlspecialchars($problem['solution_text']); ?></textarea>
                        </div>
                        <button type="submit" class="btn-primary"><i class="fas fa-save"></i> Save Problem</button>
                    </form>
                </div>
                <?php endforeach; ?>
            </div>

            <div style="margin-top: 30px;">
                <a href="?action=dashboard" class="btn-primary"><i class="fas fa-arrow-left"></i> Back to Dashboard</a>
            </div>
        <?php endif; ?>
    </div>

    <script src="../js/common.js"></script>
    <script>
        // Update admin-main margin when sidebar is toggled
        const sidebar = document.querySelector('.sidebar');
        const adminMain = document.querySelector('.admin-main');
        const sidebarToggle = document.getElementById('sidebarToggle');

        if (sidebarToggle) {
            sidebarToggle.addEventListener('click', () => {
                if (adminMain) {
                    adminMain.classList.toggle('collapsed');
                }
            });
        }
    </script>
</body>
</html>

