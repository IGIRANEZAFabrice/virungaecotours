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
$overview_query = "SELECT * FROM photograph_overview WHERE id = 1";
$overview_result = mysqli_query($conn, $overview_query);
$overview = mysqli_fetch_assoc($overview_result);

$success_message = '';
$error_message = '';

// Handle form submission
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $overview_intro = mysqli_real_escape_string($conn, $_POST['overview_intro'] ?? '');
    $overview_description = mysqli_real_escape_string($conn, $_POST['overview_description'] ?? '');

    $update_query = "UPDATE photograph_overview SET overview_intro = '$overview_intro', overview_description = '$overview_description' WHERE id = 1";
    
    if (mysqli_query($conn, $update_query)) {
        $success_message = 'Overview section updated successfully!';
        // Refresh data
        $overview_result = mysqli_query($conn, $overview_query);
        $overview = mysqli_fetch_assoc($overview_result);
    } else {
        $error_message = 'Database error: ' . mysqli_error($conn);
    }
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Overview - Photography Admin</title>
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
            min-height: 120px;
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
            <h1><i class="fas fa-book"></i> Edit Overview Section</h1>
            <p>Update program overview content</p>
        </header>

        <?php if ($success_message): ?>
            <div class="alert alert-success"><?php echo $success_message; ?></div>
        <?php endif; ?>
        <?php if ($error_message): ?>
            <div class="alert alert-error"><?php echo $error_message; ?></div>
        <?php endif; ?>

        <form method="POST" style="max-width: 600px;">
            <div class="form-group">
                <label for="overview_title">Overview Title (Static - Display Only)</label>
                <input type="text" id="overview_title" value="<?php echo htmlspecialchars($overview['overview_title'] ?? ''); ?>" readonly style="background: #f5f5f5; cursor: not-allowed;">
            </div>

            <div class="form-group">
                <label for="overview_intro">Overview Introduction</label>
                <textarea id="overview_intro" name="overview_intro" required><?php echo htmlspecialchars($overview['overview_intro'] ?? ''); ?></textarea>
            </div>

            <div class="form-group">
                <label for="overview_description">Overview Description</label>
                <textarea id="overview_description" name="overview_description" required><?php echo htmlspecialchars($overview['overview_description'] ?? ''); ?></textarea>
            </div>

            <div class="btn-group">
                <button type="submit" class="btn btn-primary"><i class="fas fa-save"></i> Save Changes</button>
                <a href="index.php" class="btn btn-secondary"><i class="fas fa-arrow-left"></i> Back</a>
            </div>
        </form>
    </div>
</body>
</html>

