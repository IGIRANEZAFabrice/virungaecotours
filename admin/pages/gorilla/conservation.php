<?php
session_start();
require_once(dirname(__FILE__) . '/../../config/connection.php');

$message = '';
$error = '';

// Get conservation section data
$conservation_query = "SELECT * FROM gorilla_conservation_section WHERE is_active = 1 LIMIT 1";
$conservation_result = $conn->query($conservation_query);
$conservation = $conservation_result ? $conservation_result->fetch_assoc() : null;

// Get benefits
$benefits = [];
if ($conservation) {
    $benefits_query = "SELECT * FROM gorilla_conservation_benefits WHERE conservation_id = " . $conservation['conservation_id'] . " ORDER BY sort_order";
    $benefits_result = $conn->query($benefits_query);
    while ($row = $benefits_result->fetch_assoc()) {
        $benefits[] = $row;
    }
}

// Handle form submission
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $title = $_POST['title'] ?? '';
    $description = $_POST['description'] ?? '';
    $is_active = isset($_POST['is_active']) ? 1 : 0;
    
    if (empty($title) || empty($description)) {
        $error = 'Title and description are required';
    } else {
        if ($conservation) {
            // Update existing
            $update_query = "UPDATE gorilla_conservation_section SET title = ?, description = ?, is_active = ? WHERE conservation_id = ?";
            $stmt = $conn->prepare($update_query);
            $stmt->bind_param("ssii", $title, $description, $is_active, $conservation['conservation_id']);
        } else {
            // Insert new
            $insert_query = "INSERT INTO gorilla_conservation_section (title, description, is_active) VALUES (?, ?, ?)";
            $stmt = $conn->prepare($insert_query);
            $stmt->bind_param("ssi", $title, $description, $is_active);
        }
        
        if ($stmt->execute()) {
            $message = 'Conservation section updated successfully!';
            // Refresh data
            $conservation_result = $conn->query($conservation_query);
            $conservation = $conservation_result ? $conservation_result->fetch_assoc() : null;
            
            // Refresh benefits
            $benefits = [];
            if ($conservation) {
                $benefits_query = "SELECT * FROM gorilla_conservation_benefits WHERE conservation_id = " . $conservation['conservation_id'] . " ORDER BY sort_order";
                $benefits_result = $conn->query($benefits_query);
                while ($row = $benefits_result->fetch_assoc()) {
                    $benefits[] = $row;
                }
            }
        } else {
            $error = 'Error updating conservation section: ' . $conn->error;
        }
    }
}

// Handle benefit deletion
if (isset($_GET['delete_benefit'])) {
    $benefit_id = intval($_GET['delete_benefit']);
    $delete_query = "DELETE FROM gorilla_conservation_benefits WHERE benefit_id = ?";
    $stmt = $conn->prepare($delete_query);
    $stmt->bind_param("i", $benefit_id);
    if ($stmt->execute()) {
        header('Location: conservation.php');
        exit();
    }
}

// Handle add benefit
if (isset($_POST['add_benefit']) && $conservation) {
    $benefit_title = $_POST['benefit_title'] ?? '';
    $benefit_description = $_POST['benefit_description'] ?? '';
    $icon_class = $_POST['icon_class'] ?? '';
    
    if (!empty($benefit_title)) {
        $sort_order = count($benefits) + 1;
        $insert_query = "INSERT INTO gorilla_conservation_benefits (conservation_id, benefit_title, benefit_description, icon_class, sort_order) VALUES (?, ?, ?, ?, ?)";
        $stmt = $conn->prepare($insert_query);
        $stmt->bind_param("isssi", $conservation['conservation_id'], $benefit_title, $benefit_description, $icon_class, $sort_order);
        
        if ($stmt->execute()) {
            $message = 'Benefit added successfully!';
            // Refresh benefits
            $benefits = [];
            $benefits_query = "SELECT * FROM gorilla_conservation_benefits WHERE conservation_id = " . $conservation['conservation_id'] . " ORDER BY sort_order";
            $benefits_result = $conn->query($benefits_query);
            while ($row = $benefits_result->fetch_assoc()) {
                $benefits[] = $row;
            }
        } else {
            $error = 'Error adding benefit: ' . $conn->error;
        }
    } else {
        $error = 'Benefit title is required';
    }
}
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Conservation Section - Gorilla Page Admin</title>
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
        
        .card h2 {
            color: #333;
            margin-top: 30px;
            margin-bottom: 20px;
            font-size: 18px;
            border-bottom: 2px solid #667eea;
            padding-bottom: 10px;
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
        
        .btn-danger {
            background: #dc3545;
            color: white;
            padding: 8px 16px;
            font-size: 12px;
        }
        
        .btn-danger:hover {
            background: #c82333;
        }
        
        .benefits-list {
            background: #f9f9f9;
            border-radius: 5px;
            padding: 20px;
        }
        
        .benefit-item {
            background: white;
            padding: 15px;
            border-radius: 5px;
            margin-bottom: 10px;
            border-left: 4px solid #667eea;
            display: flex;
            justify-content: space-between;
            align-items: flex-start;
        }
        
        .benefit-item:last-child {
            margin-bottom: 0;
        }
        
        .benefit-info h4 {
            color: #333;
            margin-bottom: 5px;
        }
        
        .benefit-info p {
            color: #666;
            font-size: 13px;
            margin: 3px 0;
        }
        
        .checkbox-group {
            display: flex;
            align-items: center;
            gap: 10px;
        }
        
        .checkbox-group input[type="checkbox"] {
            width: auto;
        }
        
        .add-form {
            background: #f0f7ff;
            padding: 20px;
            border-radius: 5px;
            border: 2px dashed #667eea;
        }
        
        .form-row {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 15px;
        }
        
        @media (max-width: 600px) {
            .form-row {
                grid-template-columns: 1fr;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <a href="dashboard.php" class="back-link"><i class="fas fa-arrow-left"></i> Back to Dashboard</a>
        
        <div class="card">
            <h1><i class="fas fa-leaf"></i> Edit Conservation Section</h1>
            <p>Manage conservation benefits and statistics.</p>
            
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
                    <label for="title">Conservation Title *</label>
                    <input type="text" id="title" name="title" value="<?php echo htmlspecialchars($conservation['title'] ?? ''); ?>" required>
                </div>
                
                <div class="form-group">
                    <label for="description">Description *</label>
                    <textarea id="description" name="description" required><?php echo htmlspecialchars($conservation['description'] ?? ''); ?></textarea>
                </div>
                
                <div class="form-group checkbox-group">
                    <input type="checkbox" id="is_active" name="is_active" <?php echo ($conservation && $conservation['is_active']) ? 'checked' : ''; ?>>
                    <label for="is_active" style="margin-bottom: 0;">Active (Display on page)</label>
                </div>
                
                <div class="btn-group">
                    <button type="submit" class="btn btn-primary"><i class="fas fa-save"></i> Save Changes</button>
                    <a href="dashboard.php" class="btn btn-secondary"><i class="fas fa-times"></i> Cancel</a>
                </div>
            </form>
            
            <?php if ($conservation): ?>
                <h2><i class="fas fa-list"></i> Conservation Benefits (<?php echo count($benefits); ?>)</h2>
                
                <?php if (!empty($benefits)): ?>
                    <div class="benefits-list">
                        <?php foreach ($benefits as $benefit): ?>
                            <div class="benefit-item">
                                <div class="benefit-info">
                                    <h4><?php echo htmlspecialchars($benefit['benefit_title']); ?></h4>
                                    <p><i class="<?php echo htmlspecialchars($benefit['icon_class']); ?>"></i> <?php echo htmlspecialchars($benefit['icon_class']); ?></p>
                                    <p><?php echo htmlspecialchars($benefit['benefit_description']); ?></p>
                                </div>
                                <a href="?delete_benefit=<?php echo $benefit['benefit_id']; ?>" class="btn btn-danger" onclick="return confirm('Delete this benefit?')"><i class="fas fa-trash"></i> Delete</a>
                            </div>
                        <?php endforeach; ?>
                    </div>
                <?php endif; ?>
                
                <h2 style="margin-top: 40px;"><i class="fas fa-plus"></i> Add Conservation Benefit</h2>
                <form method="POST" class="add-form">
                    <div class="form-group">
                        <label for="benefit_title">Benefit Title *</label>
                        <input type="text" id="benefit_title" name="benefit_title" placeholder="e.g., Protection" required>
                    </div>
                    
                    <div class="form-group">
                        <label for="benefit_description">Benefit Description</label>
                        <textarea id="benefit_description" name="benefit_description" placeholder="Describe the benefit..."></textarea>
                    </div>
                    
                    <div class="form-group">
                        <label for="icon_class">Icon Class (FontAwesome)</label>
                        <input type="text" id="icon_class" name="icon_class" placeholder="e.g., fas fa-shield-alt" value="fas fa-">
                    </div>
                    
                    <button type="submit" name="add_benefit" class="btn btn-primary"><i class="fas fa-plus"></i> Add Benefit</button>
                </form>
            <?php endif; ?>
        </div>
    </div>
</body>
</html>

