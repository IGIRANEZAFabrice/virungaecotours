<?php
session_start();
require_once(dirname(__FILE__) . '/../../config/connection.php');

$message = '';
$error = '';

// Get all families
$families_query = "SELECT * FROM gorilla_families ORDER BY country, sort_order";
$families_result = $conn->query($families_query);
$families = [];
while ($row = $families_result->fetch_assoc()) {
    $families[] = $row;
}

// Handle add family
if (isset($_POST['add_family'])) {
    $family_name = $_POST['family_name'] ?? '';
    $country = $_POST['country'] ?? '';
    $family_size = $_POST['family_size'] ?? '';
    $description = $_POST['description'] ?? '';
    $characteristics = $_POST['characteristics'] ?? '';
    $is_active = isset($_POST['is_active']) ? 1 : 0;
    
    if (empty($family_name) || empty($country)) {
        $error = 'Family name and country are required';
    } else {
        $sort_order = count($families) + 1;
        $insert_query = "INSERT INTO gorilla_families (family_name, country, family_size, description, characteristics, sort_order, is_active) VALUES (?, ?, ?, ?, ?, ?, ?)";
        $stmt = $conn->prepare($insert_query);
        $stmt->bind_param("ssissii", $family_name, $country, $family_size, $description, $characteristics, $sort_order, $is_active);
        
        if ($stmt->execute()) {
            $message = 'Family added successfully!';
            // Refresh families
            $families_result = $conn->query($families_query);
            $families = [];
            while ($row = $families_result->fetch_assoc()) {
                $families[] = $row;
            }
        } else {
            $error = 'Error adding family: ' . $conn->error;
        }
    }
}

// Handle delete family
if (isset($_GET['delete_family'])) {
    $family_id = intval($_GET['delete_family']);
    $delete_query = "DELETE FROM gorilla_families WHERE family_id = ?";
    $stmt = $conn->prepare($delete_query);
    $stmt->bind_param("i", $family_id);
    if ($stmt->execute()) {
        header('Location: families.php');
        exit();
    }
}

// Handle toggle active
if (isset($_GET['toggle_active'])) {
    $family_id = intval($_GET['toggle_active']);
    $family = array_filter($families, fn($f) => $f['family_id'] == $family_id)[0] ?? null;
    if ($family) {
        $new_active = $family['is_active'] ? 0 : 1;
        $update_query = "UPDATE gorilla_families SET is_active = ? WHERE family_id = ?";
        $stmt = $conn->prepare($update_query);
        $stmt->bind_param("ii", $new_active, $family_id);
        if ($stmt->execute()) {
            header('Location: families.php');
            exit();
        }
    }
}

// Group families by country
$families_by_country = [];
foreach ($families as $family) {
    $country = $family['country'];
    if (!isset($families_by_country[$country])) {
        $families_by_country[$country] = [];
    }
    $families_by_country[$country][] = $family;
}
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Manage Gorilla Families - Admin</title>
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
            max-width: 1000px;
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
        .form-group textarea,
        .form-group select {
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
        .form-group textarea:focus,
        .form-group select:focus {
            outline: none;
            border-color: #667eea;
            box-shadow: 0 0 0 3px rgba(102, 126, 234, 0.1);
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
        
        .btn-success {
            background: #28a745;
            color: white;
            padding: 8px 16px;
            font-size: 12px;
        }
        
        .btn-success:hover {
            background: #218838;
        }
        
        .btn-group {
            display: flex;
            gap: 10px;
            margin-top: 30px;
        }
        
        .add-form {
            background: #f0f7ff;
            padding: 20px;
            border-radius: 5px;
            border: 2px dashed #667eea;
            margin-bottom: 30px;
        }
        
        .families-list {
            background: #f9f9f9;
            border-radius: 5px;
            padding: 20px;
        }
        
        .country-section {
            margin-bottom: 30px;
        }
        
        .country-title {
            background: #667eea;
            color: white;
            padding: 15px;
            border-radius: 5px;
            margin-bottom: 15px;
            font-size: 16px;
            font-weight: bold;
        }
        
        .family-card {
            background: white;
            padding: 15px;
            border-radius: 5px;
            margin-bottom: 10px;
            border-left: 4px solid #667eea;
            display: flex;
            justify-content: space-between;
            align-items: flex-start;
        }
        
        .family-card:last-child {
            margin-bottom: 0;
        }
        
        .family-info h4 {
            color: #333;
            margin-bottom: 5px;
        }
        
        .family-info p {
            color: #666;
            font-size: 13px;
            margin: 3px 0;
        }
        
        .family-actions {
            display: flex;
            gap: 5px;
        }
        
        .checkbox-group {
            display: flex;
            align-items: center;
            gap: 10px;
        }
        
        .checkbox-group input[type="checkbox"] {
            width: auto;
        }
        
        .status-badge {
            display: inline-block;
            padding: 4px 8px;
            border-radius: 3px;
            font-size: 12px;
            font-weight: bold;
        }
        
        .status-active {
            background: #d4edda;
            color: #155724;
        }
        
        .status-inactive {
            background: #f8d7da;
            color: #721c24;
        }
    </style>
</head>
<body>
    <div class="container">
        <a href="dashboard.php" class="back-link"><i class="fas fa-arrow-left"></i> Back to Dashboard</a>
        
        <div class="card">
            <h1><i class="fas fa-users"></i> Manage Gorilla Families</h1>
            <p>Add, edit, and manage gorilla families from all countries.</p>
            
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
            
            <h2><i class="fas fa-plus"></i> Add New Family</h2>
            <form method="POST" class="add-form">
                <div class="form-row">
                    <div class="form-group">
                        <label for="family_name">Family Name *</label>
                        <input type="text" id="family_name" name="family_name" placeholder="e.g., Susa Group" required>
                    </div>
                    <div class="form-group">
                        <label for="country">Country *</label>
                        <select id="country" name="country" required>
                            <option value="">Select Country</option>
                            <option value="Rwanda">Rwanda</option>
                            <option value="Uganda">Uganda</option>
                            <option value="DRC">DRC</option>
                        </select>
                    </div>
                </div>
                
                <div class="form-row">
                    <div class="form-group">
                        <label for="family_size">Family Size</label>
                        <input type="text" id="family_size" name="family_size" placeholder="e.g., 27 members">
                    </div>
                </div>
                
                <div class="form-group">
                    <label for="description">Description</label>
                    <textarea id="description" name="description" placeholder="Describe the family..."></textarea>
                </div>
                
                <div class="form-group">
                    <label for="characteristics">Characteristics (comma-separated)</label>
                    <input type="text" id="characteristics" name="characteristics" placeholder="e.g., Playful, Curious, Strong">
                </div>
                
                <div class="form-group checkbox-group">
                    <input type="checkbox" id="is_active" name="is_active" checked>
                    <label for="is_active" style="margin-bottom: 0;">Active (Display on page)</label>
                </div>
                
                <button type="submit" name="add_family" class="btn btn-primary"><i class="fas fa-plus"></i> Add Family</button>
            </form>
            
            <h2><i class="fas fa-list"></i> All Families (<?php echo count($families); ?>)</h2>
            <div class="families-list">
                <?php foreach ($families_by_country as $country => $country_families): ?>
                    <div class="country-section">
                        <div class="country-title">
                            <i class="fas fa-map-marker-alt"></i> <?php echo htmlspecialchars($country); ?> (<?php echo count($country_families); ?> families)
                        </div>
                        
                        <?php foreach ($country_families as $family): ?>
                            <div class="family-card">
                                <div class="family-info">
                                    <h4><?php echo htmlspecialchars($family['family_name']); ?></h4>
                                    <p><strong>Size:</strong> <?php echo htmlspecialchars($family['family_size']); ?></p>
                                    <p><strong>Description:</strong> <?php echo htmlspecialchars(substr($family['description'], 0, 100)); ?>...</p>
                                    <p><span class="status-badge <?php echo $family['is_active'] ? 'status-active' : 'status-inactive'; ?>">
                                        <?php echo $family['is_active'] ? 'Active' : 'Inactive'; ?>
                                    </span></p>
                                </div>
                                <div class="family-actions">
                                    <a href="?toggle_active=<?php echo $family['family_id']; ?>" class="btn <?php echo $family['is_active'] ? 'btn-secondary' : 'btn-success'; ?>" title="Toggle Active">
                                        <i class="fas fa-<?php echo $family['is_active'] ? 'eye-slash' : 'eye'; ?>"></i>
                                    </a>
                                    <a href="?delete_family=<?php echo $family['family_id']; ?>" class="btn btn-danger" onclick="return confirm('Delete this family?')">
                                        <i class="fas fa-trash"></i>
                                    </a>
                                </div>
                            </div>
                        <?php endforeach; ?>
                    </div>
                <?php endforeach; ?>
            </div>
        </div>
    </div>
</body>
</html>

