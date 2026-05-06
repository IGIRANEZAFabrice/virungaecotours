<?php
session_start();
require_once(dirname(__FILE__) . '/../../config/connection.php');

$message = '';
$error = '';

// Get history section data
$history_query = "SELECT * FROM gorilla_history_section WHERE is_active = 1 LIMIT 1";
$history_result = $conn->query($history_query);
$history = $history_result ? $history_result->fetch_assoc() : null;

// Get timeline items
$timeline_items = [];
if ($history) {
    $timeline_query = "SELECT * FROM gorilla_timeline_items WHERE history_id = " . $history['history_id'] . " ORDER BY sort_order";
    $timeline_result = $conn->query($timeline_query);
    while ($row = $timeline_result->fetch_assoc()) {
        $timeline_items[] = $row;
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
        if ($history) {
            // Update existing
            $update_query = "UPDATE gorilla_history_section SET title = ?, subtitle = ?, is_active = ? WHERE history_id = ?";
            $stmt = $conn->prepare($update_query);
            $stmt->bind_param("ssii", $title, $subtitle, $is_active, $history['history_id']);
        } else {
            // Insert new
            $insert_query = "INSERT INTO gorilla_history_section (title, subtitle, is_active) VALUES (?, ?, ?)";
            $stmt = $conn->prepare($insert_query);
            $stmt->bind_param("ssi", $title, $subtitle, $is_active);
        }
        
        if ($stmt->execute()) {
            $message = 'History section updated successfully!';
            // Refresh data
            $history_result = $conn->query($history_query);
            $history = $history_result ? $history_result->fetch_assoc() : null;
            
            // Refresh timeline
            $timeline_items = [];
            if ($history) {
                $timeline_query = "SELECT * FROM gorilla_timeline_items WHERE history_id = " . $history['history_id'] . " ORDER BY sort_order";
                $timeline_result = $conn->query($timeline_query);
                while ($row = $timeline_result->fetch_assoc()) {
                    $timeline_items[] = $row;
                }
            }
        } else {
            $error = 'Error updating history section: ' . $conn->error;
        }
    }
}

// Handle timeline item deletion
if (isset($_GET['delete_item'])) {
    $item_id = intval($_GET['delete_item']);
    $delete_query = "DELETE FROM gorilla_timeline_items WHERE timeline_id = ?";
    $stmt = $conn->prepare($delete_query);
    $stmt->bind_param("i", $item_id);
    if ($stmt->execute()) {
        header('Location: history.php');
        exit();
    }
}

// Handle add timeline item
if (isset($_POST['add_timeline_item']) && $history) {
    $year = $_POST['timeline_year'] ?? '';
    $event_title = $_POST['timeline_event_title'] ?? '';
    $event_description = $_POST['timeline_event_description'] ?? '';
    
    if (!empty($year) && !empty($event_title)) {
        $sort_order = count($timeline_items) + 1;
        $insert_query = "INSERT INTO gorilla_timeline_items (history_id, year, event_title, event_description, sort_order) VALUES (?, ?, ?, ?, ?)";
        $stmt = $conn->prepare($insert_query);
        $stmt->bind_param("isssi", $history['history_id'], $year, $event_title, $event_description, $sort_order);
        
        if ($stmt->execute()) {
            $message = 'Timeline item added successfully!';
            // Refresh timeline
            $timeline_items = [];
            $timeline_query = "SELECT * FROM gorilla_timeline_items WHERE history_id = " . $history['history_id'] . " ORDER BY sort_order";
            $timeline_result = $conn->query($timeline_query);
            while ($row = $timeline_result->fetch_assoc()) {
                $timeline_items[] = $row;
            }
        } else {
            $error = 'Error adding timeline item: ' . $conn->error;
        }
    } else {
        $error = 'Year and event title are required';
    }
}
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit History Section - Gorilla Page Admin</title>
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
        
        .timeline-list {
            background: #f9f9f9;
            border-radius: 5px;
            padding: 20px;
        }
        
        .timeline-item {
            background: white;
            padding: 15px;
            border-radius: 5px;
            margin-bottom: 10px;
            border-left: 4px solid #667eea;
            display: flex;
            justify-content: space-between;
            align-items: flex-start;
        }
        
        .timeline-item:last-child {
            margin-bottom: 0;
        }
        
        .timeline-info h4 {
            color: #667eea;
            margin-bottom: 5px;
            font-size: 16px;
        }
        
        .timeline-info h5 {
            color: #333;
            margin-bottom: 5px;
        }
        
        .timeline-info p {
            color: #666;
            font-size: 13px;
            margin: 0;
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
            <h1><i class="fas fa-history"></i> Edit History Section</h1>
            <p>Manage timeline events and conservation history.</p>
            
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
                    <label for="title">History Title *</label>
                    <input type="text" id="title" name="title" value="<?php echo htmlspecialchars($history['title'] ?? ''); ?>" required>
                </div>
                
                <div class="form-group">
                    <label for="subtitle">History Subtitle</label>
                    <input type="text" id="subtitle" name="subtitle" value="<?php echo htmlspecialchars($history['subtitle'] ?? ''); ?>">
                </div>
                
                <div class="form-group checkbox-group">
                    <input type="checkbox" id="is_active" name="is_active" <?php echo ($history && $history['is_active']) ? 'checked' : ''; ?>>
                    <label for="is_active" style="margin-bottom: 0;">Active (Display on page)</label>
                </div>
                
                <div class="btn-group">
                    <button type="submit" class="btn btn-primary"><i class="fas fa-save"></i> Save Changes</button>
                    <a href="dashboard.php" class="btn btn-secondary"><i class="fas fa-times"></i> Cancel</a>
                </div>
            </form>
            
            <?php if ($history): ?>
                <h2><i class="fas fa-list"></i> Timeline Events (<?php echo count($timeline_items); ?>)</h2>
                
                <?php if (!empty($timeline_items)): ?>
                    <div class="timeline-list">
                        <?php foreach ($timeline_items as $item): ?>
                            <div class="timeline-item">
                                <div class="timeline-info">
                                    <h4><?php echo htmlspecialchars($item['year']); ?></h4>
                                    <h5><?php echo htmlspecialchars($item['event_title']); ?></h5>
                                    <p><?php echo htmlspecialchars($item['event_description']); ?></p>
                                </div>
                                <a href="?delete_item=<?php echo $item['timeline_id']; ?>" class="btn btn-danger" onclick="return confirm('Delete this event?')"><i class="fas fa-trash"></i> Delete</a>
                            </div>
                        <?php endforeach; ?>
                    </div>
                <?php endif; ?>
                
                <h2 style="margin-top: 40px;"><i class="fas fa-plus"></i> Add Timeline Event</h2>
                <form method="POST" class="add-form">
                    <div class="form-row">
                        <div class="form-group">
                            <label for="timeline_year">Year *</label>
                            <input type="text" id="timeline_year" name="timeline_year" placeholder="e.g., 1902" required>
                        </div>
                        <div class="form-group">
                            <label for="timeline_event_title">Event Title *</label>
                            <input type="text" id="timeline_event_title" name="timeline_event_title" placeholder="e.g., Scientific Discovery" required>
                        </div>
                    </div>
                    
                    <div class="form-group">
                        <label for="timeline_event_description">Event Description</label>
                        <textarea id="timeline_event_description" name="timeline_event_description" placeholder="Describe the event..."></textarea>
                    </div>
                    
                    <button type="submit" name="add_timeline_item" class="btn btn-primary"><i class="fas fa-plus"></i> Add Event</button>
                </form>
            <?php endif; ?>
        </div>
    </div>
</body>
</html>

