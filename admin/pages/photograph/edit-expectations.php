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
$expectations_query = "SELECT * FROM photograph_expectations WHERE id = 1";
$expectations_result = mysqli_query($conn, $expectations_query);
$expectations = mysqli_fetch_assoc($expectations_result);

$items_query = "SELECT * FROM photograph_expectations_items ORDER BY item_order ASC";
$items_result = mysqli_query($conn, $items_query);
$items = [];
while ($item = mysqli_fetch_assoc($items_result)) {
    $items[] = $item;
}

$success_message = '';
$error_message = '';

// Handle form submission
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $expectations_image_caption = mysqli_real_escape_string($conn, $_POST['expectations_image_caption'] ?? '');
    $expectations_image = $expectations['expectations_image'];

    // Handle image upload
    if (isset($_FILES['expectations_image']) && $_FILES['expectations_image']['size'] > 0) {
        $upload_dir = '../../../pages/assets/images/';
        if (!is_dir($upload_dir)) {
            mkdir($upload_dir, 0755, true);
        }

        $file_name = $_FILES['expectations_image']['name'];
        $file_ext = strtolower(pathinfo($file_name, PATHINFO_EXTENSION));
        $allowed_ext = ['jpg', 'jpeg', 'png', 'gif', 'webp'];

        if (in_array($file_ext, $allowed_ext)) {
            $new_file_name = 'photograph-expectations-' . time() . '.' . $file_ext;
            $file_path = $upload_dir . $new_file_name;

            if (move_uploaded_file($_FILES['expectations_image']['tmp_name'], $file_path)) {
                $expectations_image = 'assets/images/' . $new_file_name;
            } else {
                $error_message = 'Failed to upload image.';
            }
        } else {
            $error_message = 'Invalid file type. Allowed: jpg, jpeg, png, gif, webp';
        }
    }

    // Update expectations items
    if (empty($error_message)) {
        foreach ($items as $item) {
            $item_title = mysqli_real_escape_string($conn, $_POST['item_title_' . $item['id']] ?? '');
            $item_description = mysqli_real_escape_string($conn, $_POST['item_description_' . $item['id']] ?? '');

            $update_item_query = "UPDATE photograph_expectations_items SET item_title = '$item_title', item_description = '$item_description' WHERE id = " . $item['id'];
            mysqli_query($conn, $update_item_query);
        }

        // Update expectations
        $update_query = "UPDATE photograph_expectations SET expectations_image = '$expectations_image', expectations_image_caption = '$expectations_image_caption' WHERE id = 1";
        
        if (mysqli_query($conn, $update_query)) {
            $success_message = 'Expectations section updated successfully!';
            // Refresh data
            $expectations_result = mysqli_query($conn, $expectations_query);
            $expectations = mysqli_fetch_assoc($expectations_result);
            $items_result = mysqli_query($conn, $items_query);
            $items = [];
            while ($item = mysqli_fetch_assoc($items_result)) {
                $items[] = $item;
            }
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
    <title>Edit Expectations - Photography Admin</title>
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
            min-height: 80px;
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
        .item-card {
            background: #f9f9f9;
            padding: 15px;
            border-radius: 4px;
            margin-bottom: 15px;
            border-left: 4px solid #8B7355;
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
            <h1><i class="fas fa-star"></i> Edit Expectations Section</h1>
            <p>Update expectations image and items</p>
        </header>

        <?php if ($success_message): ?>
            <div class="alert alert-success"><?php echo $success_message; ?></div>
        <?php endif; ?>
        <?php if ($error_message): ?>
            <div class="alert alert-error"><?php echo $error_message; ?></div>
        <?php endif; ?>

        <form method="POST" enctype="multipart/form-data" style="max-width: 700px;">
            <h3>Expectations Image</h3>
            
            <div class="form-group">
                <label>Current Image</label>
                <?php if (!empty($expectations['expectations_image'])): ?>
                    <div class="preview-image">
                        <img src="<?php echo htmlspecialchars($expectations['expectations_image']); ?>" alt="Expectations Image">
                    </div>
                <?php else: ?>
                    <p style="color: #999; font-style: italic;">No image uploaded yet</p>
                <?php endif; ?>
            </div>

            <div class="form-group">
                <label for="expectations_image">Upload New Image</label>
                <input type="file" id="expectations_image" name="expectations_image" accept="image/*">
                <small style="color: #666;">Allowed: jpg, jpeg, png, gif, webp</small>
            </div>

            <div class="form-group">
                <label for="expectations_image_caption">Image Caption</label>
                <input type="text" id="expectations_image_caption" name="expectations_image_caption" value="<?php echo htmlspecialchars($expectations['expectations_image_caption'] ?? ''); ?>">
            </div>

            <hr style="margin: 30px 0;">
            <h3>Expectations Items</h3>

            <?php foreach ($items as $item): ?>
            <div class="item-card">
                <h4><?php echo htmlspecialchars($item['item_title']); ?></h4>
                <div class="form-group">
                    <label for="item_title_<?php echo $item['id']; ?>">Item Title</label>
                    <input type="text" id="item_title_<?php echo $item['id']; ?>" name="item_title_<?php echo $item['id']; ?>" value="<?php echo htmlspecialchars($item['item_title']); ?>" required>
                </div>
                <div class="form-group">
                    <label for="item_description_<?php echo $item['id']; ?>">Item Description</label>
                    <textarea id="item_description_<?php echo $item['id']; ?>" name="item_description_<?php echo $item['id']; ?>" required><?php echo htmlspecialchars($item['item_description']); ?></textarea>
                </div>
            </div>
            <?php endforeach; ?>

            <div class="btn-group">
                <button type="submit" class="btn btn-primary"><i class="fas fa-save"></i> Save Changes</button>
                <a href="index.php" class="btn btn-secondary"><i class="fas fa-arrow-left"></i> Back</a>
            </div>
        </form>
    </div>
</body>
</html>

