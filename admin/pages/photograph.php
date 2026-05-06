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

$success_message = '';
$error_message = '';

// Handle form submissions
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    if (isset($_POST['form_type'])) {
        if ($_POST['form_type'] === 'hero') {
            $hero_description = mysqli_real_escape_string($conn, $_POST['hero_description'] ?? '');
            $hero_image = $page['hero_image']; // Keep existing image by default

            // Handle image upload
            if (isset($_FILES['hero_image']) && $_FILES['hero_image']['error'] === UPLOAD_ERR_OK) {
                $upload_dir = '../../pages/assets/images/';
                if (!is_dir($upload_dir)) {
                    mkdir($upload_dir, 0755, true);
                }

                $file_name = 'photograph_hero_' . time() . '_' . basename($_FILES['hero_image']['name']);
                $file_path = $upload_dir . $file_name;

                if (move_uploaded_file($_FILES['hero_image']['tmp_name'], $file_path)) {
                    $hero_image = 'assets/images/' . $file_name;
                } else {
                    $error_message = 'Failed to upload image.';
                }
            }

            if (!$error_message) {
                $hero_image = mysqli_real_escape_string($conn, $hero_image);
                $update_query = "UPDATE photograph_page SET hero_description = '$hero_description', hero_image = '$hero_image' WHERE id = 1";
                if (mysqli_query($conn, $update_query)) {
                    $success_message = 'Hero section updated successfully!';
                    $page_result = mysqli_query($conn, $page_query);
                    $page = mysqli_fetch_assoc($page_result);
                } else {
                    $error_message = 'Database error: ' . mysqli_error($conn);
                }
            }
        } elseif ($_POST['form_type'] === 'overview') {
            $overview_intro = mysqli_real_escape_string($conn, $_POST['overview_intro'] ?? '');
            $overview_content = mysqli_real_escape_string($conn, $_POST['overview_content'] ?? '');
            $update_query = "UPDATE photograph_overview SET overview_intro = '$overview_intro', overview_content = '$overview_content' WHERE id = 1";
            if (mysqli_query($conn, $update_query)) {
                $success_message = 'Overview section updated successfully!';
                $overview_result = mysqli_query($conn, $overview_query);
                $overview = mysqli_fetch_assoc($overview_result);
            } else {
                $error_message = 'Database error: ' . mysqli_error($conn);
            }
        } elseif ($_POST['form_type'] === 'expectations') {
            $expectations_image = $expectations['expectations_image']; // Keep existing image by default

            // Handle image upload
            if (isset($_FILES['expectations_image']) && $_FILES['expectations_image']['error'] === UPLOAD_ERR_OK) {
                $upload_dir = '../../pages/assets/images/';
                if (!is_dir($upload_dir)) {
                    mkdir($upload_dir, 0755, true);
                }

                $file_name = 'expectations_' . time() . '_' . basename($_FILES['expectations_image']['name']);
                $file_path = $upload_dir . $file_name;

                if (move_uploaded_file($_FILES['expectations_image']['tmp_name'], $file_path)) {
                    $expectations_image = 'assets/images/' . $file_name;
                } else {
                    $error_message = 'Failed to upload image.';
                }
            }

            if (!$error_message) {
                $expectations_image = mysqli_real_escape_string($conn, $expectations_image);
                $update_query = "UPDATE photograph_expectations SET expectations_image = '$expectations_image' WHERE id = 1";
                if (mysqli_query($conn, $update_query)) {
                    $success_message = 'Expectations section updated successfully!';
                    $expectations_result = mysqli_query($conn, $expectations_query);
                    $expectations = mysqli_fetch_assoc($expectations_result);
                } else {
                    $error_message = 'Database error: ' . mysqli_error($conn);
                }
            }
        } elseif ($_POST['form_type'] === 'table') {
            $table_intro = mysqli_real_escape_string($conn, $_POST['table_intro'] ?? '');
            $update_query = "UPDATE photograph_table_section SET table_intro = '$table_intro' WHERE id = 1";
            if (mysqli_query($conn, $update_query)) {
                $success_message = 'Table section updated successfully!';
                $table_section_result = mysqli_query($conn, $table_section_query);
                $table_section = mysqli_fetch_assoc($table_section_result);
            } else {
                $error_message = 'Database error: ' . mysqli_error($conn);
            }
        }
    }
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Kids for Life Photography - Admin</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link rel="stylesheet" href="../css/common.css">
    <style>
        .admin-container { display: grid; grid-template-columns: repeat(auto-fit, minmax(300px, 1fr)); gap: 20px; margin-top: 20px; }
        .admin-card { background: white; border-radius: 8px; padding: 20px; box-shadow: 0 2px 8px rgba(0,0,0,0.1); border-left: 4px solid #8B7355; }
        .admin-card h3 { margin-top: 0; color: #333; display: flex; align-items: center; gap: 10px; }
        .admin-card .btn { display: inline-block; padding: 10px 20px; background: #8B7355; color: white; text-decoration: none; border-radius: 4px; margin-top: 10px; transition: background 0.3s; }
        .admin-card .btn:hover { background: #5C4033; }
        .preview-image { width: 100%; height: 150px; background: #f0f0f0; border-radius: 4px; display: flex; align-items: center; justify-content: center; margin: 10px 0; overflow: hidden; }
        .preview-image img { width: 100%; height: 100%; object-fit: cover; }
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
    </style>
</head>
<body class="admin-layout">
    <?php include 'includes/sidebar.php'; ?>

    <div class="admin-main">
        <?php include 'includes/header.php'; ?>

        <header class="page-header">
            <h1><i class="fas fa-camera"></i> Kids for Life Photography</h1>
            <p>Manage all content for the Photography Training program page</p>
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
                    <h3><i class="fas fa-image"></i> Hero Section</h3>
                    <p><strong>Title:</strong> <?php echo htmlspecialchars($page['hero_title'] ?? 'N/A'); ?></p>
                    <p><strong>Subtitle:</strong> <?php echo htmlspecialchars($page['hero_subtitle'] ?? 'N/A'); ?></p>
                    <?php if (!empty($page['hero_image'])): ?>
                        <div class="preview-image">
                            <img src="<?php echo htmlspecialchars('../../pages/' . $page['hero_image']); ?>" alt="Hero Image">
                        </div>
                    <?php else: ?>
                        <p style="color: #999; font-style: italic;">No image uploaded</p>
                    <?php endif; ?>
                    <a href="?action=edit_hero" class="btn"><i class="fas fa-edit"></i> Edit Hero</a>
                </div>

                <div class="admin-card">
                    <h3><i class="fas fa-book"></i> Overview Section</h3>
                    <p><strong>Title:</strong> <?php echo htmlspecialchars($overview['overview_title'] ?? 'N/A'); ?></p>
                    <p><strong>Content:</strong> <?php echo substr(htmlspecialchars($overview['overview_intro'] ?? ''), 0, 100) . '...'; ?></p>
                    <a href="?action=edit_overview" class="btn"><i class="fas fa-edit"></i> Edit Overview</a>
                </div>

                <div class="admin-card">
                    <h3><i class="fas fa-star"></i> Expectations Section</h3>
                    <p><strong>Title:</strong> <?php echo htmlspecialchars($expectations['expectations_title'] ?? 'N/A'); ?></p>
                    <?php if (!empty($expectations['expectations_image'])): ?>
                        <div class="preview-image">
                            <img src="<?php echo htmlspecialchars('../../pages/' . $expectations['expectations_image']); ?>" alt="Expectations Image">
                        </div>
                    <?php else: ?>
                        <p style="color: #999; font-style: italic;">No image uploaded</p>
                    <?php endif; ?>
                    <a href="?action=edit_expectations" class="btn"><i class="fas fa-edit"></i> Edit Expectations</a>
                </div>

                <div class="admin-card">
                    <h3><i class="fas fa-table"></i> Program Table</h3>
                    <p><strong>Title:</strong> <?php echo htmlspecialchars($table_section['table_title'] ?? 'N/A'); ?></p>
                    <p><strong>Intro:</strong> <?php echo substr(htmlspecialchars($table_section['table_intro'] ?? ''), 0, 100) . '...'; ?></p>
                    <a href="?action=edit_table" class="btn"><i class="fas fa-edit"></i> Edit Table</a>
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
                    <label>Hero Subtitle (Static - Display Only)</label>
                    <input type="text" value="<?php echo htmlspecialchars($page['hero_subtitle'] ?? ''); ?>" readonly style="background: #f5f5f5; cursor: not-allowed;">
                </div>
                <div class="form-group">
                    <label for="hero_description">Hero Description</label>
                    <textarea id="hero_description" name="hero_description" required><?php echo htmlspecialchars($page['hero_description'] ?? ''); ?></textarea>
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

        <?php elseif ($action === 'edit_overview'): ?>
            <form method="POST" style="max-width: 600px;">
                <input type="hidden" name="form_type" value="overview">
                <div class="form-group">
                    <label>Overview Title (Static - Display Only)</label>
                    <input type="text" value="<?php echo htmlspecialchars($overview['overview_title'] ?? ''); ?>" readonly style="background: #f5f5f5; cursor: not-allowed;">
                </div>
                <div class="form-group">
                    <label for="overview_intro">Overview Intro</label>
                    <textarea id="overview_intro" name="overview_intro" required><?php echo htmlspecialchars($overview['overview_intro'] ?? ''); ?></textarea>
                </div>
                <div class="form-group">
                    <label for="overview_content">Overview Content</label>
                    <textarea id="overview_content" name="overview_content" required><?php echo htmlspecialchars($overview['overview_content'] ?? ''); ?></textarea>
                </div>
                <div class="btn-group">
                    <button type="submit" class="btn-primary"><i class="fas fa-save"></i> Save Changes</button>
                    <a href="?action=dashboard" class="btn-primary" style="background: #ddd; color: #333; text-decoration: none;"><i class="fas fa-arrow-left"></i> Back</a>
                </div>
            </form>

        <?php elseif ($action === 'edit_expectations'): ?>
            <form method="POST" enctype="multipart/form-data" style="max-width: 600px;">
                <input type="hidden" name="form_type" value="expectations">
                <div class="form-group">
                    <label>Expectations Title (Static - Display Only)</label>
                    <input type="text" value="<?php echo htmlspecialchars($expectations['expectations_title'] ?? ''); ?>" readonly style="background: #f5f5f5; cursor: not-allowed;">
                </div>
                <div class="form-group">
                    <label for="expectations_image">Expectations Image</label>
                    <?php if (!empty($expectations['expectations_image'])): ?>
                        <div class="preview-image">
                            <img src="<?php echo htmlspecialchars('../../pages/' . $expectations['expectations_image']); ?>" alt="Expectations Image">
                        </div>
                    <?php endif; ?>
                    <input type="file" id="expectations_image" name="expectations_image" accept="image/*">
                    <small style="color: #666;">Upload a new image to replace the current one (optional)</small>
                </div>
                <div class="btn-group">
                    <button type="submit" class="btn-primary"><i class="fas fa-save"></i> Save Changes</button>
                    <a href="?action=dashboard" class="btn-primary" style="background: #ddd; color: #333; text-decoration: none;"><i class="fas fa-arrow-left"></i> Back</a>
                </div>
            </form>

        <?php elseif ($action === 'edit_table'): ?>
            <form method="POST" style="max-width: 600px;">
                <input type="hidden" name="form_type" value="table">
                <div class="form-group">
                    <label>Table Title (Static - Display Only)</label>
                    <input type="text" value="<?php echo htmlspecialchars($table_section['table_title'] ?? ''); ?>" readonly style="background: #f5f5f5; cursor: not-allowed;">
                </div>
                <div class="form-group">
                    <label for="table_intro">Table Intro</label>
                    <textarea id="table_intro" name="table_intro" required><?php echo htmlspecialchars($table_section['table_intro'] ?? ''); ?></textarea>
                </div>
                <div class="btn-group">
                    <button type="submit" class="btn-primary"><i class="fas fa-save"></i> Save Changes</button>
                    <a href="?action=dashboard" class="btn-primary" style="background: #ddd; color: #333; text-decoration: none;"><i class="fas fa-arrow-left"></i> Back</a>
                </div>
            </form>
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

