<?php
/**
 * Gorilla Hero Section Management
 */

session_start();
if (!isset($_SESSION['admin_id'])) {
    header("Location: ../../login.php");
    exit;
}

require_once(dirname(__FILE__) . '/../../config/connection.php');

// Handle form submission
$message = '';
$status = '';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $hero_id = $_POST['hero_id'] ?? null;
    $title = $_POST['title'] ?? '';
    $subtitle = $_POST['subtitle'] ?? '';
    $background_image_url = $_POST['background_image_url'] ?? '';
    $is_active = isset($_POST['is_active']) ? 1 : 0;
    
    if ($hero_id) {
        // Update existing
        $query = "UPDATE gorilla_hero_section SET title = ?, subtitle = ?, background_image_url = ?, is_active = ? WHERE hero_id = ?";
        $stmt = $conn->prepare($query);
        $stmt->bind_param("sssii", $title, $subtitle, $background_image_url, $is_active, $hero_id);
        
        if ($stmt->execute()) {
            $status = 'success';
            $message = 'Hero section updated successfully!';
        } else {
            $status = 'error';
            $message = 'Error updating hero section: ' . $conn->error;
        }
    } else {
        // Insert new
        $query = "INSERT INTO gorilla_hero_section (title, subtitle, background_image_url, is_active) VALUES (?, ?, ?, ?)";
        $stmt = $conn->prepare($query);
        $stmt->bind_param("sssi", $title, $subtitle, $background_image_url, $is_active);
        
        if ($stmt->execute()) {
            $status = 'success';
            $message = 'Hero section created successfully!';
        } else {
            $status = 'error';
            $message = 'Error creating hero section: ' . $conn->error;
        }
    }
}

// Fetch hero section
$hero = null;
$result = $conn->query("SELECT * FROM gorilla_hero_section WHERE is_active = 1 LIMIT 1");
if ($result && $result->num_rows > 0) {
    $hero = $result->fetch_assoc();
}

?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Hero Section - Gorilla Page Admin</title>
    <link rel="stylesheet" href="../../css/earthy-theme.css">
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background: #f5f5f5;
        }
        
        .container {
            max-width: 800px;
            margin: 0 auto;
            padding: 20px;
        }
        
        .page-header {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            padding: 30px;
            border-radius: 12px;
            margin-bottom: 30px;
        }
        
        .page-header h1 {
            margin: 0;
            font-size: 28px;
        }
        
        .page-header a {
            color: white;
            text-decoration: none;
            margin-top: 10px;
            display: inline-block;
        }
        
        .form-card {
            background: white;
            border-radius: 12px;
            padding: 30px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        }
        
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
            padding: 12px;
            border: 1px solid #ddd;
            border-radius: 6px;
            font-family: 'Poppins', sans-serif;
            font-size: 14px;
        }
        
        .form-group textarea {
            resize: vertical;
            min-height: 120px;
        }
        
        .form-group input:focus,
        .form-group textarea:focus {
            outline: none;
            border-color: #667eea;
            box-shadow: 0 0 0 3px rgba(102, 126, 234, 0.1);
        }
        
        .checkbox-group {
            display: flex;
            align-items: center;
            gap: 10px;
        }
        
        .checkbox-group input[type="checkbox"] {
            width: auto;
        }
        
        .button-group {
            display: flex;
            gap: 10px;
            margin-top: 30px;
        }
        
        .btn {
            flex: 1;
            padding: 12px 20px;
            border: none;
            border-radius: 6px;
            font-size: 16px;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s ease;
        }
        
        .btn-primary {
            background: #667eea;
            color: white;
        }
        
        .btn-primary:hover {
            background: #5568d3;
        }
        
        .btn-secondary {
            background: #e0e0e0;
            color: #333;
        }
        
        .btn-secondary:hover {
            background: #d0d0d0;
        }
        
        .alert {
            padding: 15px;
            border-radius: 6px;
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
        
        .preview-section {
            background: #f9f9f9;
            padding: 20px;
            border-radius: 6px;
            margin-top: 20px;
        }
        
        .preview-section h3 {
            margin-top: 0;
            color: #333;
        }
        
        .preview-image {
            max-width: 100%;
            max-height: 300px;
            border-radius: 6px;
            margin-top: 10px;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="page-header">
            <h1>🎬 Hero Section</h1>
            <a href="../../gorilla_sections_dashboard.php">← Back to Dashboard</a>
        </div>
        
        <?php if ($message): ?>
            <div class="alert alert-<?php echo $status; ?>">
                <?php echo htmlspecialchars($message); ?>
            </div>
        <?php endif; ?>
        
        <div class="form-card">
            <form method="POST">
                <?php if ($hero): ?>
                    <input type="hidden" name="hero_id" value="<?php echo $hero['hero_id']; ?>">
                <?php endif; ?>
                
                <div class="form-group">
                    <label for="title">Hero Title *</label>
                    <input type="text" id="title" name="title" required 
                           value="<?php echo htmlspecialchars($hero['title'] ?? ''); ?>"
                           placeholder="e.g., Mountain Gorillas of the Virunga Massif">
                </div>
                
                <div class="form-group">
                    <label for="subtitle">Hero Subtitle *</label>
                    <textarea id="subtitle" name="subtitle" required 
                              placeholder="Enter the hero section subtitle..."><?php echo htmlspecialchars($hero['subtitle'] ?? ''); ?></textarea>
                </div>
                
                <div class="form-group">
                    <label for="background_image_url">Background Image URL *</label>
                    <input type="text" id="background_image_url" name="background_image_url" required 
                           value="<?php echo htmlspecialchars($hero['background_image_url'] ?? ''); ?>"
                           placeholder="e.g., ../images/gorilla/hero2.jpg">
                </div>
                
                <div class="form-group">
                    <div class="checkbox-group">
                        <input type="checkbox" id="is_active" name="is_active" 
                               <?php echo ($hero && $hero['is_active']) ? 'checked' : ''; ?>>
                        <label for="is_active" style="margin: 0;">Active (Display on page)</label>
                    </div>
                </div>
                
                <?php if ($hero && !empty($hero['background_image_url'])): ?>
                    <div class="preview-section">
                        <h3>Image Preview</h3>
                        <img src="<?php echo htmlspecialchars($hero['background_image_url']); ?>" 
                             alt="Hero Background" class="preview-image" onerror="this.style.display='none'">
                    </div>
                <?php endif; ?>
                
                <div class="button-group">
                    <button type="submit" class="btn btn-primary">
                        <?php echo $hero ? '✓ Update Hero Section' : '+ Create Hero Section'; ?>
                    </button>
                    <a href="../../gorilla_sections_dashboard.php" class="btn btn-secondary" style="text-decoration: none; display: flex; align-items: center; justify-content: center;">
                        Cancel
                    </a>
                </div>
            </form>
        </div>
    </div>
</body>
</html>

