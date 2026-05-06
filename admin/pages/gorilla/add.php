<?php 
session_start();

if (!isset($_SESSION['admin_id'])) {
  header("Location: ../login.html");
  exit();
}

require_once('../../config/connection.php');

$family = null;
$is_edit = false;

// Check if editing
if (isset($_GET['id'])) {
    $family_id = intval($_GET['id']);
    $query = "SELECT * FROM gorilla_families WHERE family_id = ?";
    $stmt = $conn->prepare($query);
    $stmt->bind_param("i", $family_id);
    $stmt->execute();
    $result = $stmt->get_result();
    $family = $result->fetch_assoc();
    $stmt->close();
    $is_edit = true;
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title><?php echo $is_edit ? 'Edit' : 'Add'; ?> Gorilla Family - Virunga Ecotours Admin</title>
    <link rel="stylesheet" href="../../css/admin-style.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        .form-container { max-width: 900px; margin: 0 auto; background: white; padding: 30px; border-radius: 8px; box-shadow: 0 2px 10px rgba(0,0,0,0.1); }
        .form-group { margin-bottom: 20px; }
        .form-group label { display: block; margin-bottom: 8px; font-weight: 600; color: #333; }
        .form-group input, .form-group select, .form-group textarea { width: 100%; padding: 10px; border: 1px solid #ddd; border-radius: 5px; font-size: 14px; }
        .form-group textarea { resize: vertical; min-height: 100px; }
        .form-row { display: grid; grid-template-columns: 1fr 1fr; gap: 20px; }
        .form-row.full { grid-template-columns: 1fr; }
        .checkbox-group { display: flex; gap: 20px; }
        .checkbox-group label { display: flex; align-items: center; margin-bottom: 0; }
        .checkbox-group input { width: auto; margin-right: 8px; }
        .btn-submit, .btn-cancel { padding: 12px 30px; border: none; border-radius: 5px; cursor: pointer; font-size: 16px; }
        .btn-submit { background-color: #016905; color: white; }
        .btn-submit:hover { background-color: #014d04; }
        .btn-cancel { background-color: #6c757d; color: white; margin-left: 10px; }
        .btn-cancel:hover { background-color: #5a6268; }
        .button-group { margin-top: 30px; }
    </style>
</head>
<body>
    <!-- Include Sidebar -->
    <?php include '../includes/sidebar.php'; ?>

    <div class="main-content">
        <div class="container">
            <div class="page-header">
                <h1><i class="fas fa-paw"></i> <?php echo $is_edit ? 'Edit' : 'Add New'; ?> Gorilla Family</h1>
            </div>

            <div class="form-container">
                <form method="POST" action="../../handlers/gorilla_handler.php">
                    <input type="hidden" name="action" value="<?php echo $is_edit ? 'update' : 'create'; ?>">
                    <?php if ($is_edit): ?>
                        <input type="hidden" name="family_id" value="<?php echo $family['family_id']; ?>">
                    <?php endif; ?>

                    <div class="form-row">
                        <div class="form-group">
                            <label for="family_name">Family Name *</label>
                            <input type="text" id="family_name" name="family_name" value="<?php echo $family ? htmlspecialchars($family['family_name']) : ''; ?>" required>
                        </div>
                        <div class="form-group">
                            <label for="country">Country *</label>
                            <select id="country" name="country" required>
                                <option value="">Select Country</option>
                                <option value="Rwanda" <?php echo ($family && $family['country'] === 'Rwanda') ? 'selected' : ''; ?>>Rwanda</option>
                                <option value="Uganda" <?php echo ($family && $family['country'] === 'Uganda') ? 'selected' : ''; ?>>Uganda</option>
                                <option value="DRC" <?php echo ($family && $family['country'] === 'DRC') ? 'selected' : ''; ?>>DR Congo</option>
                            </select>
                        </div>
                    </div>

                    <div class="form-row">
                        <div class="form-group">
                            <label for="region">Region</label>
                            <input type="text" id="region" name="region" value="<?php echo $family ? htmlspecialchars($family['region']) : ''; ?>">
                        </div>
                        <div class="form-group">
                            <label for="silverback_name">Silverback Name</label>
                            <input type="text" id="silverback_name" name="silverback_name" value="<?php echo $family ? htmlspecialchars($family['silverback_name']) : ''; ?>">
                        </div>
                    </div>

                    <div class="form-row">
                        <div class="form-group">
                            <label for="family_size">Family Size</label>
                            <input type="text" id="family_size" name="family_size" placeholder="e.g., 15-20 members" value="<?php echo $family ? htmlspecialchars($family['family_size']) : ''; ?>">
                        </div>
                        <div class="form-group">
                            <label for="sort_order">Sort Order</label>
                            <input type="number" id="sort_order" name="sort_order" value="<?php echo $family ? $family['sort_order'] : '0'; ?>">
                        </div>
                    </div>

                    <div class="form-group form-row full">
                        <label for="description">Description</label>
                        <textarea id="description" name="description"><?php echo $family ? htmlspecialchars($family['description']) : ''; ?></textarea>
                    </div>

                    <div class="form-group form-row full">
                        <label for="characteristics">Characteristics (comma-separated)</label>
                        <textarea id="characteristics" name="characteristics"><?php echo $family ? htmlspecialchars($family['characteristics']) : ''; ?></textarea>
                    </div>

                    <div class="form-group form-row full">
                        <label for="history">History</label>
                        <textarea id="history" name="history"><?php echo $family ? htmlspecialchars($family['history']) : ''; ?></textarea>
                    </div>

                    <div class="form-group form-row full">
                        <label for="special_features">Special Features</label>
                        <textarea id="special_features" name="special_features"><?php echo $family ? htmlspecialchars($family['special_features']) : ''; ?></textarea>
                    </div>

                    <div class="form-row">
                        <div class="form-group">
                            <label for="image_url">Image URL</label>
                            <input type="text" id="image_url" name="image_url" value="<?php echo $family ? htmlspecialchars($family['image_url']) : ''; ?>">
                        </div>
                    </div>

                    <div class="form-group">
                        <label>Status</label>
                        <div class="checkbox-group">
                            <label>
                                <input type="checkbox" name="is_habituated" <?php echo ($family && $family['is_habituated']) ? 'checked' : ''; ?>>
                                Habituated
                            </label>
                            <label>
                                <input type="checkbox" name="is_active" <?php echo (!$family || $family['is_active']) ? 'checked' : ''; ?>>
                                Active
                            </label>
                        </div>
                    </div>

                    <div class="button-group">
                        <button type="submit" class="btn-submit">
                            <i class="fas fa-save"></i> <?php echo $is_edit ? 'Update' : 'Create'; ?> Family
                        </button>
                        <button type="button" class="btn-cancel" onclick="window.location.href='index.php'">
                            <i class="fas fa-times"></i> Cancel
                        </button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</body>
</html>

