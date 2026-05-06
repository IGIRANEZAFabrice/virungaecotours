<?php
session_start();
require_once(dirname(__FILE__) . '/../../config/connection.php');

$message = '';
$error = '';

// Get habitat section data
$habitat_query = "SELECT * FROM gorilla_habitat_section WHERE is_active = 1 LIMIT 1";
$habitat_result = $conn->query($habitat_query);
$habitat = $habitat_result ? $habitat_result->fetch_assoc() : null;

// Get habitat cards
$habitat_cards = [];
if ($habitat) {
    $cards_query = "SELECT * FROM gorilla_habitat_cards WHERE habitat_id = " . $habitat['habitat_id'] . " ORDER BY sort_order";
    $cards_result = $conn->query($cards_query);
    while ($row = $cards_result->fetch_assoc()) {
        $habitat_cards[] = $row;
    }
}

// Handle form submission
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $title = $_POST['title'] ?? '';
    $subtitle = $_POST['subtitle'] ?? '';
    $is_active = isset($_POST['is_active']) ? 1 : 0;
    
    if (empty($title)) {
        $error = 'Title is required';
    } else {
        if ($habitat) {
            // Update existing
            $update_query = "UPDATE gorilla_habitat_section SET title = ?, subtitle = ?, is_active = ? WHERE habitat_id = ?";
            $stmt = $conn->prepare($update_query);
            $stmt->bind_param("ssii", $title, $subtitle, $is_active, $habitat['habitat_id']);
        } else {
            // Insert new
            $insert_query = "INSERT INTO gorilla_habitat_section (title, subtitle, is_active) VALUES (?, ?, ?)";
            $stmt = $conn->prepare($insert_query);
            $stmt->bind_param("ssi", $title, $subtitle, $is_active);
        }
        
        if ($stmt->execute()) {
            $message = 'Habitat section updated successfully!';
            // Refresh data
            $habitat_result = $conn->query($habitat_query);
            $habitat = $habitat_result ? $habitat_result->fetch_assoc() : null;
            
            // Refresh cards
            $habitat_cards = [];
            if ($habitat) {
                $cards_query = "SELECT * FROM gorilla_habitat_cards WHERE habitat_id = " . $habitat['habitat_id'] . " ORDER BY sort_order";
                $cards_result = $conn->query($cards_query);
                while ($row = $cards_result->fetch_assoc()) {
                    $habitat_cards[] = $row;
                }
            }
        } else {
            $error = 'Error updating habitat section: ' . $conn->error;
        }
    }
}

// Handle card deletion
if (isset($_GET['delete_card'])) {
    $card_id = intval($_GET['delete_card']);
    $delete_query = "DELETE FROM gorilla_habitat_cards WHERE card_id = ?";
    $stmt = $conn->prepare($delete_query);
    $stmt->bind_param("i", $card_id);
    if ($stmt->execute()) {
        header('Location: habitat.php');
        exit();
    }
}
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Habitat Section - Gorilla Page Admin</title>
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
            min-height: 80px;
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
        
        .cards-list {
            background: #f9f9f9;
            border-radius: 5px;
            padding: 20px;
        }
        
        .habitat-card-item {
            background: white;
            padding: 15px;
            border-radius: 5px;
            margin-bottom: 10px;
            border-left: 4px solid #667eea;
            display: flex;
            justify-content: space-between;
            align-items: flex-start;
        }
        
        .habitat-card-item:last-child {
            margin-bottom: 0;
        }
        
        .card-info h4 {
            color: #333;
            margin-bottom: 5px;
        }
        
        .card-info p {
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
    </style>
</head>
<body>
    <div class="container">
        <a href="dashboard.php" class="back-link"><i class="fas fa-arrow-left"></i> Back to Dashboard</a>
        
        <div class="card">
            <h1><i class="fas fa-tree"></i> Edit Habitat Section</h1>
            <p>Manage habitat cards and location information.</p>
            
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
                    <label for="title">Habitat Title *</label>
                    <input type="text" id="title" name="title" value="<?php echo htmlspecialchars($habitat['title'] ?? ''); ?>" required>
                </div>
                
                <div class="form-group">
                    <label for="subtitle">Habitat Subtitle</label>
                    <input type="text" id="subtitle" name="subtitle" value="<?php echo htmlspecialchars($habitat['subtitle'] ?? ''); ?>">
                </div>
                
                <div class="form-group checkbox-group">
                    <input type="checkbox" id="is_active" name="is_active" <?php echo ($habitat && $habitat['is_active']) ? 'checked' : ''; ?>>
                    <label for="is_active" style="margin-bottom: 0;">Active (Display on page)</label>
                </div>
                
                <div class="btn-group">
                    <button type="submit" class="btn btn-primary"><i class="fas fa-save"></i> Save Changes</button>
                    <a href="dashboard.php" class="btn btn-secondary"><i class="fas fa-times"></i> Cancel</a>
                </div>
            </form>
            
            <?php if (!empty($habitat_cards)): ?>
                <h2><i class="fas fa-list"></i> Habitat Cards (<?php echo count($habitat_cards); ?>)</h2>
                <div class="cards-list">
                    <?php foreach ($habitat_cards as $card): ?>
                        <div class="habitat-card-item">
                            <div class="card-info">
                                <h4><?php echo htmlspecialchars($card['card_title']); ?></h4>
                                <p><strong>Overlay:</strong> <?php echo htmlspecialchars($card['overlay_title']); ?></p>
                                <p><strong>Description:</strong> <?php echo htmlspecialchars(substr($card['card_description'], 0, 80)); ?>...</p>
                            </div>
                            <a href="?delete_card=<?php echo $card['card_id']; ?>" class="btn btn-danger" onclick="return confirm('Delete this card?')"><i class="fas fa-trash"></i> Delete</a>
                        </div>
                    <?php endforeach; ?>
                </div>
            <?php endif; ?>
            
            <p style="color: #999; font-size: 12px; margin-top: 30px;">
                <i class="fas fa-info-circle"></i> To add or edit habitat cards, please contact your administrator or use the database directly.
            </p>
        </div>
    </div>
</body>
</html>

