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

// Get section from URL
$section = isset($_GET['section']) ? (int)$_GET['section'] : 1;
if ($section !== 1 && $section !== 2) {
    $section = 1;
}

$success_message = '';
$error_message = '';

// Handle form submission for updating a problem
if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['action']) && $_POST['action'] === 'update') {
    $problem_id = (int)$_POST['problem_id'];
    $problem_title = mysqli_real_escape_string($conn, $_POST['problem_title'] ?? '');
    $problem_description = mysqli_real_escape_string($conn, $_POST['problem_description'] ?? '');
    $solution_text = mysqli_real_escape_string($conn, $_POST['solution_text'] ?? '');
    $problem_icon = mysqli_real_escape_string($conn, $_POST['problem_icon'] ?? 'fas fa-star');

    $update_query = "UPDATE complaints_problems SET problem_title = '$problem_title', problem_description = '$problem_description', solution_text = '$solution_text', problem_icon = '$problem_icon' WHERE id = $problem_id";
    
    if (mysqli_query($conn, $update_query)) {
        $success_message = 'Problem updated successfully!';
    } else {
        $error_message = 'Database error: ' . mysqli_error($conn);
    }
}

// Fetch problems for selected section
$problems_query = "SELECT * FROM complaints_problems WHERE section = $section ORDER BY card_order ASC";
$problems_result = mysqli_query($conn, $problems_query);
$problems = [];
while ($problem = mysqli_fetch_assoc($problems_result)) {
    $problems[] = $problem;
}

$section_label = ($section === 1) ? 'Before Parallax (UP)' : 'After Parallax (DOWN)';
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Problems - Complaints Admin</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link rel="stylesheet" href="../assets/css/admin-style.css">
    <style>
        .section-tabs {
            display: flex;
            gap: 10px;
            margin-bottom: 20px;
            border-bottom: 2px solid #ddd;
        }
        .section-tabs a {
            padding: 10px 20px;
            text-decoration: none;
            color: #666;
            border-bottom: 3px solid transparent;
            transition: all 0.3s;
        }
        .section-tabs a.active {
            color: #8B7355;
            border-bottom-color: #8B7355;
        }
        .problems-list {
            display: grid;
            gap: 20px;
        }
        .problem-item {
            background: white;
            border: 1px solid #ddd;
            border-radius: 8px;
            padding: 20px;
            box-shadow: 0 2px 4px rgba(0,0,0,0.05);
        }
        .problem-item h4 {
            margin-top: 0;
            color: #333;
        }
        .form-group {
            margin-bottom: 15px;
        }
        .form-group label {
            display: block;
            margin-bottom: 5px;
            font-weight: 600;
            color: #555;
            font-size: 14px;
        }
        .form-group input,
        .form-group textarea {
            width: 100%;
            padding: 8px;
            border: 1px solid #ddd;
            border-radius: 4px;
            font-family: Arial, sans-serif;
            font-size: 14px;
        }
        .form-group textarea {
            resize: vertical;
            min-height: 80px;
        }
        .btn {
            padding: 8px 16px;
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
            <h1><i class="fas fa-list"></i> Edit Problems</h1>
            <p>Manage problem cards for the selected section</p>
        </header>

        <div class="section-tabs">
            <a href="?section=1" class="<?php echo ($section === 1) ? 'active' : ''; ?>"><i class="fas fa-arrow-up"></i> Section 1 (UP)</a>
            <a href="?section=2" class="<?php echo ($section === 2) ? 'active' : ''; ?>"><i class="fas fa-arrow-down"></i> Section 2 (DOWN)</a>
        </div>

        <?php if ($success_message): ?>
            <div class="alert alert-success"><?php echo $success_message; ?></div>
        <?php endif; ?>
        <?php if ($error_message): ?>
            <div class="alert alert-error"><?php echo $error_message; ?></div>
        <?php endif; ?>

        <div class="problems-list">
            <?php foreach ($problems as $problem): ?>
            <div class="problem-item">
                <h4>Problem #<?php echo htmlspecialchars($problem['problem_number']); ?> - <?php echo htmlspecialchars($problem['problem_title']); ?></h4>
                
                <form method="POST">
                    <input type="hidden" name="action" value="update">
                    <input type="hidden" name="problem_id" value="<?php echo $problem['id']; ?>">

                    <div class="form-group">
                        <label>Problem Title (Static - Display Only)</label>
                        <input type="text" value="<?php echo htmlspecialchars($problem['problem_title']); ?>" readonly style="background: #f5f5f5; cursor: not-allowed;">
                    </div>

                    <div class="form-group">
                        <label for="problem_icon_<?php echo $problem['id']; ?>">Icon Class</label>
                        <input type="text" id="problem_icon_<?php echo $problem['id']; ?>" name="problem_icon" value="<?php echo htmlspecialchars($problem['problem_icon']); ?>" placeholder="e.g., fas fa-star">
                    </div>

                    <div class="form-group">
                        <label for="problem_description_<?php echo $problem['id']; ?>">Problem Description</label>
                        <textarea id="problem_description_<?php echo $problem['id']; ?>" name="problem_description" required><?php echo htmlspecialchars($problem['problem_description']); ?></textarea>
                    </div>

                    <div class="form-group">
                        <label for="solution_text_<?php echo $problem['id']; ?>">Solution</label>
                        <textarea id="solution_text_<?php echo $problem['id']; ?>" name="solution_text" required><?php echo htmlspecialchars($problem['solution_text']); ?></textarea>
                    </div>

                    <button type="submit" class="btn btn-primary"><i class="fas fa-save"></i> Save Problem</button>
                </form>
            </div>
            <?php endforeach; ?>
        </div>

        <div style="margin-top: 30px;">
            <a href="index.php" class="btn btn-primary"><i class="fas fa-arrow-left"></i> Back to Dashboard</a>
        </div>
    </div>
</body>
</html>

