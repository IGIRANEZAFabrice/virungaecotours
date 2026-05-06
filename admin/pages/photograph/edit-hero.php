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

$success_message = '';
$error_message = '';

// Handle form submission
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $hero_title = mysqli_real_escape_string($conn, $_POST['hero_title'] ?? '');
    $hero_subtitle = mysqli_real_escape_string($conn, $_POST['hero_subtitle'] ?? '');
    $hero_description = mysqli_real_escape_string($conn, $_POST['hero_description'] ?? '');
    $hero_image = $page['hero_image'];

    // Handle image upload
    if (isset($_FILES['hero_image']) && $_FILES['hero_image']['size'] > 0) {
        $upload_dir = '../../../pages/assets/images/';
        if (!is_dir($upload_dir)) {
            mkdir($upload_dir, 0755, true);
        }

        $file_name = $_FILES['hero_image']['name'];
        $file_ext = strtolower(pathinfo($file_name, PATHINFO_EXTENSION));
        $allowed_ext = ['jpg', 'jpeg', 'png', 'gif', 'webp'];

        if (in_array($file_ext, $allowed_ext)) {
            $new_file_name = 'photograph-hero-' . time() . '.' . $file_ext;
            $file_path = $upload_dir . $new_file_name;

            if (move_uploaded_file($_FILES['hero_image']['tmp_name'], $file_path)) {
                $hero_image = 'assets/images/' . $new_file_name;
            } else {
                $error_message = 'Failed to upload image.';
            }
        } else {
            $error_message = 'Invalid file type. Allowed: jpg, jpeg, png, gif, webp';
        }
    }

    // Update database
    if (empty($error_message)) {
        $update_query = "UPDATE photograph_page SET hero_title = '$hero_title', hero_subtitle = '$hero_subtitle', hero_description = '$hero_description', hero_image = '$hero_image' WHERE id = 1";
        
        if (mysqli_query($conn, $update_query)) {
            $success_message = 'Hero section updated successfully!';
            // Refresh data
            $page_result = mysqli_query($conn, $page_query);
            $page = mysqli_fetch_assoc($page_result);
        } else {
            $error_message = 'Database error: ' . mysqli_error($conn);
        }
    }
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Hero - Photography Admin</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link rel="stylesheet" href="../assets/css/admin-style.css">
    <style>
        .form-group {
            margin-bottom: 20px;
        }
        .form-group label {
            display: block;
            margin-bottom: 8px;
            font-weight: 600;
            color: #333;
        }
        .form-group input,
        .form-group textarea {
            width: 100%;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 4px;
            font-family: Arial, sans-serif;
        }
        .form-group textarea {
            resize: vertical;
            min-height: 100px;
        }
        .preview-image {
            width: 100%;
            max-width: 400px;
            height: 250px;
            background: #f0f0f0;
            border-radius: 4px;
            display: flex;
            align-items: center;
            justify-content: center;
            margin: 15px 0;
            overflow: hidden;
        }
        .preview-image img {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }
        .btn-group {
            display: flex;
            gap: 10px;
            margin-top: 20px;
        }
        .btn {
            padding: 10px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 14px;
            transition: background 0.3s;
        }
        .btn-primary {
            background: #8B7355;
            color: white;
        }
        .btn-primary:hover {
            background: #5C4033;
        }
        .btn-secondary {
            background: #ddd;
            color: #333;
        }
        .btn-secondary:hover {
            background: #ccc;
        }
        .alert {
            padding: 15px;
            border-radius: 4px;
            margin-bottom: 20px;
        }
        .alert-success {
            background: #d4edda;
            color: #155724;
            border: 1px solid #c3e6cb;
        }
        .alert-error {
            background: #f8d7da;
            color: #721c24;
            border: 1px solid #f5c6cb;
        }
    </style>
</head>
<body class="admin-layout">
    <?php include '../includes/sidebar.php'; ?>
    
    <div class="admin-main">
        <header class="page-header">
            <h1><i class="fas fa-image"></i> Edit Hero Section</h1>
            <p>Update hero image and text content</p>
        </header>

        <?php if ($success_message): ?>
            <div class="alert alert-success"><?php echo $success_message; ?></div>
        <?php endif; ?>
        <?php if ($error_message): ?>
            <div class="alert alert-error"><?php echo $error_message; ?></div>
        <?php endif; ?>

        <form method="POST" enctype="multipart/form-data" style="max-width: 600px;">
            <div class="form-group">
                <label for="hero_title">Hero Title (Static - Display Only)</label>
                <input type="text" id="hero_title" name="hero_title" value="<?php echo htmlspecialchars($page['hero_title'] ?? ''); ?>" readonly style="background: #f5f5f5; cursor: not-allowed;">
            </div>

            <div class="form-group">
                <label for="hero_subtitle">Hero Subtitle (Static - Display Only)</label>
                <input type="text" id="hero_subtitle" name="hero_subtitle" value="<?php echo htmlspecialchars($page['hero_subtitle'] ?? ''); ?>" readonly style="background: #f5f5f5; cursor: not-allowed;">
            </div>

            <div class="form-group">
                <label for="hero_description">Hero Description</label>
                <textarea id="hero_description" name="hero_description" required><?php echo htmlspecialchars($page['hero_description'] ?? ''); ?></textarea>
            </div>

            <div class="form-group">
                <label>Current Hero Image</label>
                <?php if (!empty($page['hero_image'])): ?>
                    <div class="preview-image">
                        <img src="<?php echo htmlspecialchars($page['hero_image']); ?>" alt="Hero Image">
                    </div>
                <?php else: ?>
                    <p style="color: #999; font-style: italic;">No image uploaded yet</p>
                <?php endif; ?>
            </div>

            <div class="form-group">
                <label for="hero_image">Upload New Hero Image</label>
                <input type="file" id="hero_image" name="hero_image" accept="image/*">
                <small style="color: #666;">Allowed: jpg, jpeg, png, gif, webp</small>
            </div>

            <div class="btn-group">
                <button type="submit" class="btn btn-primary"><i class="fas fa-save"></i> Save Changes</button>
                <a href="index.php" class="btn btn-secondary"><i class="fas fa-arrow-left"></i> Back</a>
            </div>
        </form>
    </div>
</body>
</html>

