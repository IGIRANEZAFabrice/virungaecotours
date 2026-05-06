<?php
session_start();
require_once(dirname(__FILE__) . '/../../config/connection.php');

$message = '';
$error = '';

// Get discounts section data
$discounts_query = "SELECT * FROM gorilla_discounts_section WHERE is_active = 1 LIMIT 1";
$discounts_result = $conn->query($discounts_query);
$discounts = $discounts_result ? $discounts_result->fetch_assoc() : null;

// Handle form submission
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $title = $_POST['title'] ?? '';
    $subtitle = $_POST['subtitle'] ?? '';
    $is_active = isset($_POST['is_active']) ? 1 : 0;
    
    if (empty($title)) {
        $error = 'Title is required';
    } else {
        if ($discounts) {
            // Update existing
            $update_query = "UPDATE gorilla_discounts_section SET title = ?, subtitle = ?, is_active = ? WHERE discount_id = ?";
            $stmt = $conn->prepare($update_query);
            $stmt->bind_param("ssii", $title, $subtitle, $is_active, $discounts['discount_id']);
        } else {
            // Insert new
            $insert_query = "INSERT INTO gorilla_discounts_section (title, subtitle, is_active) VALUES (?, ?, ?)";
            $stmt = $conn->prepare($insert_query);
            $stmt->bind_param("ssi", $title, $subtitle, $is_active);
        }
        
        if ($stmt->execute()) {
            $message = 'Discounts section updated successfully!';
            // Refresh data
            $discounts_result = $conn->query($discounts_query);
            $discounts = $discounts_result ? $discounts_result->fetch_assoc() : null;
        } else {
            $error = 'Error updating discounts section: ' . $conn->error;
        }
    }
}
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Discounts Section - Gorilla Page Admin</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            min-height: 100vh;
            padding: 20px;
        }
        
        .container {
            max-width: 900px;
            margin: 0 auto;
        }
        
        .back-link {
            display: inline-block;
            margin-bottom: 20px;
            color: white;
            text-decoration: none;
            font-size: 14px;
        }
        
        .back-link:hover {
            text-decoration: underline;
        }
        
        .card {
            background: white;
            border-radius: 10px;
            padding: 30px;
            box-shadow: 0 5px 15px rgba(0,0,0,0.1);
            margin-bottom: 20px;
        }
        
        .card h1 {
            color: #333;
            margin-bottom: 10px;
            display: flex;
            align-items: center;
            gap: 15px;
        }
        
        .card p {
            color: #666;
            font-size: 14px;
            margin-bottom: 30px;
        }
        
        .form-group {
            margin-bottom: 20px;
        }
        
        .form-group label {
            display: block;
            margin-bottom: 8px;
            color: #333;
            font-weight: 500;
        }
        
        .form-group input,
        .form-group textarea {
            width: 100%;
            padding: 12px;
            border: 1px solid #ddd;
            border-radius: 5px;
            font-family: inherit;
            font-size: 14px;
        }
        
        .form-group textarea {
            resize: vertical;
            min-height: 100px;
        }
        
        .form-group input:focus,
        .form-group textarea:focus {
            outline: none;
            border-color: #667eea;
            box-shadow: 0 0 0 3px rgba(102, 126, 234, 0.1);
        }
        
        .alert {
            padding: 15px;
            border-radius: 5px;
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
        
        .btn-group {
            display: flex;
            gap: 10px;
            margin-top: 30px;
        }
        
        .btn {
            padding: 12px 24px;
            border-radius: 5px;
            border: none;
            font-size: 14px;
            cursor: pointer;
            transition: all 0.3s;
            text-decoration: none;
            display: inline-block;
        }
        
        .btn-primary {
            background: #667eea;
            color: white;
        }
        
        .btn-primary:hover {
            background: #5568d3;
        }
        
        .btn-secondary {
            background: #f0f0f0;
            color: #333;
        }
        
        .btn-secondary:hover {
            background: #e0e0e0;
        }
        
        .checkbox-group {
            display: flex;
            align-items: center;
            gap: 10px;
        }
        
        .checkbox-group input[type="checkbox"] {
            width: auto;
        }
        
        .info-box {
            background: #e7f3ff;
            border-left: 4px solid #667eea;
            padding: 15px;
            border-radius: 5px;
            margin-top: 30px;
        }
        
        .info-box h3 {
            color: #667eea;
            margin-bottom: 10px;
        }
        
        .info-box p {
            color: #333;
            font-size: 13px;
            margin: 5px 0;
        }
    </style>
</head>
<body>
    <div class="container">
        <a href="dashboard.php" class="back-link"><i class="fas fa-arrow-left"></i> Back to Dashboard</a>
        
        <div class="card">
            <h1><i class="fas fa-tag"></i> Edit Discounts Section</h1>
            <p>Manage discount information and pricing tables.</p>
            
            <?php if ($message): ?>
                <div class="alert alert-success">
                    <i class="fas fa-check-circle"></i> <?php echo htmlspecialchars($message); ?>
                </div>
            <?php endif; ?>
            
            <?php if ($error): ?>
                <div class="alert alert-error">
                    <i class="fas fa-exclamation-circle"></i> <?php echo htmlspecialchars($error); ?>
                </div>
            <?php endif; ?>
            
            <form method="POST">
                <div class="form-group">
                    <label for="title">Discounts Title *</label>
                    <input type="text" id="title" name="title" value="<?php echo htmlspecialchars($discounts['title'] ?? ''); ?>" required>
                </div>
                
                <div class="form-group">
                    <label for="subtitle">Discounts Subtitle</label>
                    <textarea id="subtitle" name="subtitle"><?php echo htmlspecialchars($discounts['subtitle'] ?? ''); ?></textarea>
                </div>
                
                <div class="form-group checkbox-group">
                    <input type="checkbox" id="is_active" name="is_active" <?php echo ($discounts && $discounts['is_active']) ? 'checked' : ''; ?>>
                    <label for="is_active" style="margin-bottom: 0;">Active (Display on page)</label>
                </div>
                
                <div class="btn-group">
                    <button type="submit" class="btn btn-primary"><i class="fas fa-save"></i> Save Changes</button>
                    <a href="dashboard.php" class="btn btn-secondary"><i class="fas fa-times"></i> Cancel</a>
                </div>
            </form>
            
            <div class="info-box">
                <h3><i class="fas fa-info-circle"></i> Pricing Table Information</h3>
                <p>The discount pricing tables are currently managed through the database directly.</p>
                <p>To update pricing information, please contact your administrator or modify the database records in the gorilla_discounts_pricing table.</p>
                <p><strong>Tables available:</strong></p>
                <ul style="margin-left: 20px; margin-top: 10px;">
                    <li>Gorilla Permit Prices (Rwanda, Uganda, DRC)</li>
                    <li>Resident Discounts</li>
                    <li>Group Discounts</li>
                </ul>
            </div>
        </div>
    </div>
</body>
</html>

