<?php
session_start();
require_once(dirname(__FILE__) . '/../../config/connection.php');

// Get hero section data
$hero_query = "SELECT * FROM gorilla_hero_section LIMIT 1";
$hero_result = $conn->query($hero_query);
$hero = $hero_result->fetch_assoc();

// Handle form submission
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $title = $_POST['title'] ?? '';
    $subtitle = $_POST['subtitle'] ?? '';
    $is_active = isset($_POST['is_active']) ? 1 : 0;
    $background_image_url = $hero['background_image_url'] ?? '';
    
    // Handle image upload
    if (isset($_FILES['hero_image']) && $_FILES['hero_image']['error'] === UPLOAD_ERR_OK) {
        $upload_dir = dirname(__FILE__) . '/../../images/gorilla/hero/';
        
        // Create directory if it doesn't exist
        if (!file_exists($upload_dir)) {
            mkdir($upload_dir, 0777, true);
        }
        
        $file_extension = strtolower(pathinfo($_FILES['hero_image']['name'], PATHINFO_EXTENSION));
        $allowed_types = ['jpg', 'jpeg', 'png', 'gif', 'webp'];
        
        if (!in_array($file_extension, $allowed_types)) {
            $error = "Only JPG, JPEG, PNG, GIF, and WEBP files are allowed.";
        } elseif ($_FILES['hero_image']['size'] > 5000000) { // 5MB max
            $error = "File is too large. Maximum size is 5MB.";
        } else {
            $new_filename = uniqid('hero_') . '.' . $file_extension;
            $target_file = $upload_dir . $new_filename;
            $relative_path = "images/gorilla/hero/" . $new_filename;
            
            if (move_uploaded_file($_FILES['hero_image']['tmp_name'], $target_file)) {
                // Delete old image if exists
                if (!empty($hero['background_image_url']) && file_exists(dirname(__FILE__) . '/../../' . $hero['background_image_url'])) {
                    unlink(dirname(__FILE__) . '/../../' . $hero['background_image_url']);
                }
                $background_image_url = $relative_path;
            } else {
                $error = "Failed to upload image.";
            }
        }
    }
    
    // Update or insert hero section
    if (!isset($error)) {
        if ($hero) {
            // Update existing
            $update_query = "UPDATE gorilla_hero_section SET title = ?, subtitle = ?, background_image_url = ?, is_active = ? WHERE id = ?";
            $stmt = $conn->prepare($update_query);
            $stmt->bind_param("sssii", $title, $subtitle, $background_image_url, $is_active, $hero['id']);
        } else {
            // Insert new
            $update_query = "INSERT INTO gorilla_hero_section (title, subtitle, background_image_url, is_active) VALUES (?, ?, ?, ?)";
            $stmt = $conn->prepare($update_query);
            $stmt->bind_param("sssi", $title, $subtitle, $background_image_url, $is_active);
        }
        
        if ($stmt->execute()) {
            $success = "Hero section updated successfully!";
            // Refresh hero data
            $hero_result = $conn->query($hero_query);
            $hero = $hero_result->fetch_assoc();
        } else {
            $error = "Failed to update hero section: " . $conn->error;
        }
    }
}
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Hero Section - Gorilla Page</title>
    <link rel="shortcut icon" href="../../images/icon.png" type="image/x-icon" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css" />
    <link rel="stylesheet" href="../../css/common.css" />
    <link rel="stylesheet" href="../../css/gorilla.css" />
    <script src="../../js/common.js" defer></script>
</head>
<body>
    <div class="admin-container">
        <?php include_once dirname(__FILE__) . '/include/sidebar.php'; ?>

        <main class="main-content">
            <?php include_once dirname(__FILE__) . '/include/header.php'; ?>
            
            <div class="content-area">
                <div class="panel">
                    <div class="panel-header">
                        <h1><i class="fas fa-image"></i> Edit Hero Section</h1>
                        <div class="panel-actions">
                            <a href="dashboard.php" class="action-button" style="background: var(--neutral-beige); color: var(--text-dark);">
                                <i class="fas fa-arrow-left"></i> Back
                            </a>
                        </div>
                    </div>
                    
                    <?php if (isset($success)): ?>
                        <div class="message-receiver success">
                            <i class="fas fa-check-circle"></i>
                            <span><?php echo $success; ?></span>
                        </div>
                    <?php endif; ?>
                    
                    <?php if (isset($error)): ?>
                        <div class="message-receiver error">
                            <i class="fas fa-exclamation-circle"></i>
                            <span><?php echo $error; ?></span>
                        </div>
                    <?php endif; ?>
                    
                    <form method="POST" enctype="multipart/form-data">
                        <!-- Title -->
                        <div class="form-group">
                            <label for="title">Hero Title *</label>
                            <input type="text" id="title" name="title" value="<?php echo htmlspecialchars($hero['title'] ?? ''); ?>" required>
                        </div>
                        
                        <!-- Subtitle -->
                        <div class="form-group">
                            <label for="subtitle">Hero Subtitle</label>
                            <textarea id="subtitle" name="subtitle"><?php echo htmlspecialchars($hero['subtitle'] ?? ''); ?></textarea>
                        </div>
                        
                        <!-- Image Upload -->
                        <div class="form-group">
                            <label for="hero_image">Background Image</label>
                            <div class="image-upload-container" id="uploadContainer">
                                <input type="file" id="hero_image" name="hero_image" accept="image/*">
                                <div class="upload-icon"><i class="fas fa-cloud-upload-alt"></i></div>
                                <div class="upload-text">Click to upload or drag and drop</div>
                                <div class="upload-hint">PNG, JPG, GIF, WEBP up to 5MB</div>
                            </div>
                            
                            <!-- Image Preview -->
                            <?php if (!empty($hero['background_image_url'])): ?>
                                <div class="image-preview" style="margin-top: 1rem;">
                                    <img src="../../<?php echo htmlspecialchars($hero['background_image_url']); ?>" alt="Hero Image">
                                    <button type="button" class="image-remove-btn" onclick="removeImage()">
                                        <i class="fas fa-times"></i>
                                    </button>
                                </div>
                            <?php endif; ?>
                        </div>
                        
                        <!-- Active Toggle -->
                        <div class="form-group">
                            <label style="display: flex; align-items: center; gap: 0.5rem; cursor: pointer;">
                                <input type="checkbox" name="is_active" <?php echo ($hero['is_active'] ?? 0) ? 'checked' : ''; ?> style="width: auto;">
                                <span>Active (Display on website)</span>
                            </label>
                        </div>
                        
                        <!-- Submit Button -->
                        <div class="form-group">
                            <button type="submit" class="action-button">
                                <i class="fas fa-save"></i> Save Changes
                            </button>
                        </div>
                    </form>
                </div>
            </div>
        </main>
    </div>
    
    <script>
        // Drag and drop functionality
        const uploadContainer = document.getElementById('uploadContainer');
        const fileInput = document.getElementById('hero_image');
        
        uploadContainer.addEventListener('dragover', (e) => {
            e.preventDefault();
            uploadContainer.classList.add('dragover');
        });
        
        uploadContainer.addEventListener('dragleave', () => {
            uploadContainer.classList.remove('dragover');
        });
        
        uploadContainer.addEventListener('drop', (e) => {
            e.preventDefault();
            uploadContainer.classList.remove('dragover');
            fileInput.files = e.dataTransfer.files;
        });
        
        uploadContainer.addEventListener('click', () => {
            fileInput.click();
        });
        
        function removeImage() {
            // This would require additional backend logic to handle deletion
            alert('To remove the image, upload a new one or contact support.');
        }
    </script>
</body>
</html>

