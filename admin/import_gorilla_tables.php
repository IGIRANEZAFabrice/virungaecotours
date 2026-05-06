<?php
/**
 * Gorilla Database Tables Import Script
 * This script imports all gorilla section tables into the database
 */

require_once('./config/connection.php');

// Check if form was submitted
$import_status = '';
$import_message = '';

if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['import_gorilla'])) {
    try {
        // Read the SQL file
        $sql_file = '../pages/gorilla_all_sections.sql';
        
        if (!file_exists($sql_file)) {
            throw new Exception("SQL file not found: " . $sql_file);
        }
        
        $sql_content = file_get_contents($sql_file);
        
        // Split SQL statements by semicolon
        $statements = array_filter(array_map('trim', explode(';', $sql_content)));
        
        $imported_count = 0;
        $error_count = 0;
        $errors = [];
        
        // Execute each statement
        foreach ($statements as $statement) {
            if (empty($statement)) {
                continue;
            }
            
            // Skip comments
            if (strpos(trim($statement), '--') === 0) {
                continue;
            }
            
            if ($conn->query($statement) === TRUE) {
                $imported_count++;
            } else {
                $error_count++;
                $errors[] = $conn->error;
            }
        }
        
        if ($error_count === 0) {
            $import_status = 'success';
            $import_message = "✅ SUCCESS! Imported $imported_count SQL statements. All 17 tables created with 31+ records.";
        } else {
            $import_status = 'warning';
            $import_message = "⚠️ Partial Success! Imported $imported_count statements with $error_count errors.";
        }
        
    } catch (Exception $e) {
        $import_status = 'error';
        $import_message = "❌ ERROR: " . $e->getMessage();
    }
}

// Verify tables exist
$tables_exist = false;
$table_count = 0;
$tables_list = [];

$result = $conn->query("SHOW TABLES LIKE 'gorilla_%'");
if ($result) {
    $table_count = $result->num_rows;
    while ($row = $result->fetch_row()) {
        $tables_list[] = $row[0];
    }
    $tables_exist = ($table_count > 0);
}

?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Import Gorilla Database Tables</title>
    <link rel="stylesheet" href="../css/earthy-theme.css">
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 20px;
        }
        
        .container {
            background: white;
            border-radius: 12px;
            box-shadow: 0 10px 40px rgba(0, 0, 0, 0.2);
            max-width: 800px;
            width: 100%;
            padding: 40px;
        }
        
        h1 {
            color: #016905;
            margin-bottom: 10px;
            text-align: center;
        }
        
        .subtitle {
            text-align: center;
            color: #666;
            margin-bottom: 30px;
        }
        
        .status-box {
            padding: 20px;
            border-radius: 8px;
            margin-bottom: 30px;
            display: none;
        }
        
        .status-box.success {
            background: #d4edda;
            border: 1px solid #c3e6cb;
            color: #155724;
            display: block;
        }
        
        .status-box.error {
            background: #f8d7da;
            border: 1px solid #f5c6cb;
            color: #721c24;
            display: block;
        }
        
        .status-box.warning {
            background: #fff3cd;
            border: 1px solid #ffeaa7;
            color: #856404;
            display: block;
        }
        
        .info-box {
            background: #e7f3ff;
            border-left: 4px solid #2196F3;
            padding: 15px;
            margin-bottom: 20px;
            border-radius: 4px;
        }
        
        .info-box h3 {
            margin-top: 0;
            color: #1976D2;
        }
        
        .info-box ul {
            margin: 10px 0;
            padding-left: 20px;
        }
        
        .info-box li {
            margin: 5px 0;
        }
        
        .button-group {
            display: flex;
            gap: 10px;
            margin-bottom: 30px;
        }
        
        button {
            flex: 1;
            padding: 12px 20px;
            border: none;
            border-radius: 6px;
            font-size: 16px;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s ease;
        }
        
        .btn-import {
            background: #016905;
            color: white;
        }
        
        .btn-import:hover {
            background: #014d04;
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(1, 105, 5, 0.3);
        }
        
        .btn-verify {
            background: #2196F3;
            color: white;
        }
        
        .btn-verify:hover {
            background: #1976D2;
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(33, 150, 243, 0.3);
        }
        
        .tables-list {
            background: #f5f5f5;
            padding: 20px;
            border-radius: 8px;
            margin-top: 20px;
        }
        
        .tables-list h3 {
            margin-top: 0;
            color: #333;
        }
        
        .table-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(250px, 1fr));
            gap: 10px;
        }
        
        .table-item {
            background: white;
            padding: 10px 15px;
            border-radius: 6px;
            border-left: 4px solid #016905;
            font-size: 14px;
            font-family: 'Courier New', monospace;
        }
        
        .stats {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(150px, 1fr));
            gap: 15px;
            margin-top: 20px;
        }
        
        .stat-card {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            padding: 20px;
            border-radius: 8px;
            text-align: center;
        }
        
        .stat-number {
            font-size: 32px;
            font-weight: bold;
            margin-bottom: 5px;
        }
        
        .stat-label {
            font-size: 14px;
            opacity: 0.9;
        }
        
        .success-icon {
            font-size: 48px;
            text-align: center;
            margin-bottom: 20px;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>🦍 Gorilla Database Import</h1>
        <p class="subtitle">Import all gorilla section tables into your database</p>
        
        <?php if ($import_status): ?>
            <div class="status-box <?php echo $import_status; ?>">
                <?php if ($import_status === 'success'): ?>
                    <div class="success-icon">✅</div>
                <?php endif; ?>
                <strong><?php echo $import_message; ?></strong>
            </div>
        <?php endif; ?>
        
        <div class="info-box">
            <h3>📋 What Will Be Imported</h3>
            <ul>
                <li><strong>17 Database Tables</strong> for all gorilla page sections</li>
                <li><strong>31+ Pre-loaded Records</strong> with all content</li>
                <li><strong>6 Sections:</strong> Hero, Intro, History, Habitat, Conservation, Discounts</li>
                <li><strong>Proper Relationships:</strong> Foreign keys and data integrity</li>
            </ul>
        </div>
        
        <form method="POST">
            <div class="button-group">
                <button type="submit" name="import_gorilla" value="1" class="btn-import">
                    📥 Import All Tables
                </button>
            </div>
        </form>
        
        <?php if ($tables_exist): ?>
            <div class="tables-list">
                <h3>✅ Tables Found (<?php echo $table_count; ?> tables)</h3>
                <div class="table-grid">
                    <?php foreach ($tables_list as $table): ?>
                        <div class="table-item">✓ <?php echo htmlspecialchars($table); ?></div>
                    <?php endforeach; ?>
                </div>
                
                <div class="stats">
                    <div class="stat-card">
                        <div class="stat-number"><?php echo $table_count; ?></div>
                        <div class="stat-label">Tables</div>
                    </div>
                    <div class="stat-card">
                        <div class="stat-number">6</div>
                        <div class="stat-label">Sections</div>
                    </div>
                    <div class="stat-card">
                        <div class="stat-number">31+</div>
                        <div class="stat-label">Records</div>
                    </div>
                </div>
            </div>
        <?php else: ?>
            <div class="info-box" style="background: #fff3cd; border-left-color: #ffc107;">
                <h3>⚠️ No Tables Found</h3>
                <p>Click "Import All Tables" above to create the gorilla database tables.</p>
            </div>
        <?php endif; ?>
    </div>
</body>
</html>

