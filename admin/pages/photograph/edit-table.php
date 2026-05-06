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
$table_section_query = "SELECT * FROM photograph_table_section WHERE id = 1";
$table_section_result = mysqli_query($conn, $table_section_query);
$table_section = mysqli_fetch_assoc($table_section_result);

$rows_query = "SELECT * FROM photograph_table_rows ORDER BY row_order ASC";
$rows_result = mysqli_query($conn, $rows_query);
$rows = [];
while ($row = mysqli_fetch_assoc($rows_result)) {
    $rows[] = $row;
}

$success_message = '';
$error_message = '';

// Handle form submission
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $table_intro = mysqli_real_escape_string($conn, $_POST['table_intro'] ?? '');

    // Update table rows
    foreach ($rows as $row) {
        $component_description = mysqli_real_escape_string($conn, $_POST['component_description_' . $row['id']] ?? '');
        $educational_value = mysqli_real_escape_string($conn, $_POST['educational_value_' . $row['id']] ?? '');

        $update_row_query = "UPDATE photograph_table_rows SET component_description = '$component_description', educational_value = '$educational_value' WHERE id = " . $row['id'];
        mysqli_query($conn, $update_row_query);
    }

    // Update table section
    $update_query = "UPDATE photograph_table_section SET table_intro = '$table_intro' WHERE id = 1";
    
    if (mysqli_query($conn, $update_query)) {
        $success_message = 'Program table updated successfully!';
        // Refresh data
        $table_section_result = mysqli_query($conn, $table_section_query);
        $table_section = mysqli_fetch_assoc($table_section_result);
        $rows_result = mysqli_query($conn, $rows_query);
        $rows = [];
        while ($row = mysqli_fetch_assoc($rows_result)) {
            $rows[] = $row;
        }
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
    <title>Edit Program Table - Photography Admin</title>
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
        .row-card {
            background: #f9f9f9;
            padding: 15px;
            border-radius: 4px;
            margin-bottom: 15px;
            border-left: 4px solid #8B7355;
        }
        .row-card h4 {
            margin-top: 0;
            color: #333;
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
            <h1><i class="fas fa-table"></i> Edit Program Table</h1>
            <p>Update program structure table content</p>
        </header>

        <?php if ($success_message): ?>
            <div class="alert alert-success"><?php echo $success_message; ?></div>
        <?php endif; ?>
        <?php if ($error_message): ?>
            <div class="alert alert-error"><?php echo $error_message; ?></div>
        <?php endif; ?>

        <form method="POST" style="max-width: 800px;">
            <div class="form-group">
                <label for="table_title">Table Title (Static - Display Only)</label>
                <input type="text" id="table_title" value="<?php echo htmlspecialchars($table_section['table_title'] ?? ''); ?>" readonly style="background: #f5f5f5; cursor: not-allowed;">
            </div>

            <div class="form-group">
                <label for="table_intro">Table Introduction</label>
                <textarea id="table_intro" name="table_intro" required><?php echo htmlspecialchars($table_section['table_intro'] ?? ''); ?></textarea>
            </div>

            <hr style="margin: 30px 0;">
            <h3>Program Components</h3>

            <?php foreach ($rows as $row): ?>
            <div class="row-card">
                <h4><i class="<?php echo htmlspecialchars($row['component_icon']); ?>"></i> <?php echo htmlspecialchars($row['component_name']); ?></h4>
                
                <div class="form-group">
                    <label for="component_description_<?php echo $row['id']; ?>">Description</label>
                    <textarea id="component_description_<?php echo $row['id']; ?>" name="component_description_<?php echo $row['id']; ?>" required><?php echo htmlspecialchars($row['component_description']); ?></textarea>
                </div>

                <div class="form-group">
                    <label for="educational_value_<?php echo $row['id']; ?>">Educational Value</label>
                    <textarea id="educational_value_<?php echo $row['id']; ?>" name="educational_value_<?php echo $row['id']; ?>" required><?php echo htmlspecialchars($row['educational_value']); ?></textarea>
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

