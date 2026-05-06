<?php 
session_start();

if (!isset($_SESSION['admin_id'])) {
  header("Location: ../login.html");
  exit();
}

require_once('../../config/connection.php');

// Fetch all gorilla families
$query = "SELECT * FROM gorilla_families ORDER BY country, sort_order";
$result = $conn->query($query);
$families = [];
if ($result) {
    while ($row = $result->fetch_assoc()) {
        $families[] = $row;
    }
}

// Get status message
$status = $_GET['status'] ?? '';
$message = $_GET['message'] ?? '';
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Manage Gorilla Families - Virunga Ecotours Admin</title>
    <link rel="stylesheet" href="../../css/admin-style.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        .families-table { width: 100%; border-collapse: collapse; margin-top: 20px; }
        .families-table th, .families-table td { padding: 12px; text-align: left; border-bottom: 1px solid #ddd; }
        .families-table th { background-color: #016905; color: white; }
        .families-table tr:hover { background-color: #f5f5f5; }
        .btn-add { background-color: #016905; color: white; padding: 10px 20px; border: none; border-radius: 5px; cursor: pointer; margin-bottom: 20px; }
        .btn-add:hover { background-color: #014d04; }
        .btn-edit, .btn-delete { padding: 6px 12px; margin: 0 5px; border: none; border-radius: 3px; cursor: pointer; }
        .btn-edit { background-color: #007bff; color: white; }
        .btn-delete { background-color: #dc3545; color: white; }
        .btn-edit:hover { background-color: #0056b3; }
        .btn-delete:hover { background-color: #c82333; }
        .status-badge { padding: 4px 8px; border-radius: 3px; font-size: 12px; }
        .status-active { background-color: #d4edda; color: #155724; }
        .status-inactive { background-color: #f8d7da; color: #721c24; }
        .alert { padding: 15px; margin-bottom: 20px; border-radius: 5px; }
        .alert-success { background-color: #d4edda; color: #155724; border: 1px solid #c3e6cb; }
        .alert-error { background-color: #f8d7da; color: #721c24; border: 1px solid #f5c6cb; }
    </style>
</head>
<body>
    <!-- Include Sidebar -->
    <?php include '../includes/sidebar.php'; ?>

    <div class="main-content">
        <div class="container">
            <div class="page-header">
                <h1><i class="fas fa-paw"></i> Manage Gorilla Families</h1>
                <p>Add, edit, or delete gorilla family information</p>
            </div>

            <?php if ($status === 'success'): ?>
                <div class="alert alert-success">
                    <i class="fas fa-check-circle"></i> <?php echo htmlspecialchars($message); ?>
                </div>
            <?php elseif ($status === 'error'): ?>
                <div class="alert alert-error">
                    <i class="fas fa-exclamation-circle"></i> <?php echo htmlspecialchars($message); ?>
                </div>
            <?php endif; ?>

            <button class="btn-add" onclick="window.location.href='add.php'">
                <i class="fas fa-plus"></i> Add New Gorilla Family
            </button>

            <table class="families-table">
                <thead>
                    <tr>
                        <th>#</th>
                        <th>Family Name</th>
                        <th>Country</th>
                        <th>Region</th>
                        <th>Silverback</th>
                        <th>Size</th>
                        <th>Status</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <?php if (count($families) > 0): ?>
                        <?php foreach ($families as $index => $family): ?>
                            <tr>
                                <td><?php echo $index + 1; ?></td>
                                <td><?php echo htmlspecialchars($family['family_name']); ?></td>
                                <td><?php echo htmlspecialchars($family['country']); ?></td>
                                <td><?php echo htmlspecialchars($family['region']); ?></td>
                                <td><?php echo htmlspecialchars($family['silverback_name'] ?: 'N/A'); ?></td>
                                <td><?php echo htmlspecialchars($family['family_size']); ?></td>
                                <td>
                                    <span class="status-badge <?php echo $family['is_active'] ? 'status-active' : 'status-inactive'; ?>">
                                        <?php echo $family['is_active'] ? 'Active' : 'Inactive'; ?>
                                    </span>
                                </td>
                                <td>
                                    <button class="btn-edit" onclick="window.location.href='edit.php?id=<?php echo $family['family_id']; ?>'">
                                        <i class="fas fa-edit"></i> Edit
                                    </button>
                                    <button class="btn-delete" onclick="if(confirm('Are you sure?')) window.location.href='../../handlers/gorilla_handler.php?action=delete&id=<?php echo $family['family_id']; ?>'">
                                        <i class="fas fa-trash"></i> Delete
                                    </button>
                                </td>
                            </tr>
                        <?php endforeach; ?>
                    <?php else: ?>
                        <tr>
                            <td colspan="8" style="text-align: center; padding: 20px;">No gorilla families found. <a href="add.php">Add one now</a></td>
                        </tr>
                    <?php endif; ?>
                </tbody>
            </table>
        </div>
    </div>
</body>
</html>

