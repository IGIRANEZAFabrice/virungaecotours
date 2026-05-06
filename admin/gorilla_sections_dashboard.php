<?php
/**
 * Gorilla Sections Management Dashboard
 */

session_start();
if (!isset($_SESSION['admin_id'])) {
    header("Location: login.php");
    exit;
}

require_once('./config/connection.php');

// Get statistics
$stats = [];
$tables = [
    'gorilla_hero_section' => 'Hero Section',
    'gorilla_intro_section' => 'Intro Section',
    'gorilla_history_section' => 'History Section',
    'gorilla_habitat_section' => 'Habitat Section',
    'gorilla_conservation_section' => 'Conservation Section',
    'gorilla_discounts_section' => 'Discounts Section',
    'gorilla_families' => 'Gorilla Families'
];

foreach ($tables as $table => $label) {
    $result = $conn->query("SELECT COUNT(*) as count FROM $table");
    if ($result) {
        $row = $result->fetch_assoc();
        $stats[$label] = $row['count'];
    }
}

?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Gorilla Page Management - Admin Dashboard</title>
    <link rel="stylesheet" href="./css/earthy-theme.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        
        body {
            font-family: 'Poppins', sans-serif;
            background: #f5f5f5;
        }
        
        .admin-container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 20px;
        }
        
        .page-header {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            padding: 40px;
            border-radius: 12px;
            margin-bottom: 40px;
            text-align: center;
        }
        
        .page-header h1 {
            font-size: 36px;
            margin-bottom: 10px;
        }
        
        .page-header p {
            font-size: 16px;
            opacity: 0.9;
        }
        
        .sections-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 25px;
            margin-bottom: 40px;
        }
        
        .section-card {
            background: white;
            border-radius: 12px;
            padding: 30px;
            box-shadow: 0 2px 15px rgba(0, 0, 0, 0.1);
            transition: all 0.3s ease;
            border-top: 5px solid #667eea;
            position: relative;
            overflow: hidden;
        }
        
        .section-card::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background: linear-gradient(135deg, rgba(102, 126, 234, 0.05) 0%, transparent 100%);
            pointer-events: none;
        }
        
        .section-card:hover {
            transform: translateY(-8px);
            box-shadow: 0 8px 25px rgba(0, 0, 0, 0.15);
        }
        
        .section-icon {
            font-size: 48px;
            margin-bottom: 15px;
            display: block;
        }
        
        .section-card h3 {
            font-size: 20px;
            color: #333;
            margin-bottom: 10px;
        }
        
        .section-card p {
            color: #666;
            font-size: 14px;
            margin-bottom: 20px;
            line-height: 1.5;
        }
        
        .record-count {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            padding: 12px 16px;
            border-radius: 8px;
            margin-bottom: 20px;
            font-weight: 600;
            text-align: center;
            font-size: 16px;
        }
        
        .button-group {
            display: flex;
            gap: 10px;
        }
        
        .btn {
            flex: 1;
            padding: 12px 16px;
            border: none;
            border-radius: 6px;
            font-size: 14px;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s ease;
            text-decoration: none;
            text-align: center;
            display: inline-block;
        }
        
        .btn-primary {
            background: #667eea;
            color: white;
        }
        
        .btn-primary:hover {
            background: #5568d3;
            transform: translateY(-2px);
        }
        
        .btn-secondary {
            background: #e0e0e0;
            color: #333;
        }
        
        .btn-secondary:hover {
            background: #d0d0d0;
        }
        
        .stats-section {
            background: white;
            border-radius: 12px;
            padding: 30px;
            box-shadow: 0 2px 15px rgba(0, 0, 0, 0.1);
        }
        
        .stats-section h2 {
            margin-bottom: 25px;
            color: #333;
            font-size: 24px;
        }
        
        .stats-table {
            width: 100%;
            border-collapse: collapse;
        }
        
        .stats-table th,
        .stats-table td {
            padding: 15px;
            text-align: left;
            border-bottom: 1px solid #eee;
        }
        
        .stats-table th {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            font-weight: 600;
        }
        
        .stats-table tr:hover {
            background: #f9f9f9;
        }
        
        .status-badge {
            display: inline-block;
            padding: 6px 14px;
            border-radius: 20px;
            font-size: 12px;
            font-weight: 600;
        }
        
        .status-active {
            background: #d4edda;
            color: #155724;
        }
        
        .status-inactive {
            background: #f8d7da;
            color: #721c24;
        }
        
        .back-link {
            display: inline-block;
            margin-bottom: 20px;
            color: #667eea;
            text-decoration: none;
            font-weight: 600;
        }
        
        .back-link:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <div class="admin-container">
        <a href="index.php" class="back-link">← Back to Admin</a>
        
        <div class="page-header">
            <h1>🦍 Gorilla Page Management</h1>
            <p>Manage all sections of the gorilla page content</p>
        </div>
        
        <div class="sections-grid">
            <!-- Hero Section -->
            <div class="section-card">
                <span class="section-icon">🎬</span>
                <h3>Hero Section</h3>
                <p>Main banner with title, subtitle, and background image</p>
                <div class="record-count">
                    <?php echo isset($stats['Hero Section']) ? $stats['Hero Section'] : 0; ?> Record(s)
                </div>
                <div class="button-group">
                    <a href="pages/gorilla/hero.php" class="btn btn-primary">Edit</a>
                </div>
            </div>
            
            <!-- Intro Section -->
            <div class="section-card">
                <span class="section-icon">📖</span>
                <h3>Intro Section</h3>
                <p>Introduction with highlights and key facts</p>
                <div class="record-count">
                    <?php echo isset($stats['Intro Section']) ? $stats['Intro Section'] : 0; ?> Record(s)
                </div>
                <div class="button-group">
                    <a href="pages/gorilla/intro.php" class="btn btn-primary">Edit</a>
                </div>
            </div>
            
            <!-- History Section -->
            <div class="section-card">
                <span class="section-icon">📜</span>
                <h3>History Section</h3>
                <p>Timeline of gorilla conservation and discovery</p>
                <div class="record-count">
                    <?php echo isset($stats['History Section']) ? $stats['History Section'] : 0; ?> Record(s)
                </div>
                <div class="button-group">
                    <a href="pages/gorilla/history.php" class="btn btn-primary">Edit</a>
                </div>
            </div>
            
            <!-- Habitat Section -->
            <div class="section-card">
                <span class="section-icon">🏔️</span>
                <h3>Habitat Section</h3>
                <p>Gorilla habitats, locations, and distribution</p>
                <div class="record-count">
                    <?php echo isset($stats['Habitat Section']) ? $stats['Habitat Section'] : 0; ?> Record(s)
                </div>
                <div class="button-group">
                    <a href="pages/gorilla/habitat.php" class="btn btn-primary">Edit</a>
                </div>
            </div>
            
            <!-- Conservation Section -->
            <div class="section-card">
                <span class="section-icon">🌿</span>
                <h3>Conservation Section</h3>
                <p>Conservation efforts, benefits, and statistics</p>
                <div class="record-count">
                    <?php echo isset($stats['Conservation Section']) ? $stats['Conservation Section'] : 0; ?> Record(s)
                </div>
                <div class="button-group">
                    <a href="pages/gorilla/conservation.php" class="btn btn-primary">Edit</a>
                </div>
            </div>
            
            <!-- Discounts Section -->
            <div class="section-card">
                <span class="section-icon">💰</span>
                <h3>Discounts Section</h3>
                <p>Special offers, pricing, and discount information</p>
                <div class="record-count">
                    <?php echo isset($stats['Discounts Section']) ? $stats['Discounts Section'] : 0; ?> Record(s)
                </div>
                <div class="button-group">
                    <a href="pages/gorilla/discounts.php" class="btn btn-primary">Edit</a>
                </div>
            </div>
            
            <!-- Gorilla Families -->
            <div class="section-card">
                <span class="section-icon">👨‍👩‍👧‍👦</span>
                <h3>Gorilla Families</h3>
                <p>Individual family profiles and details</p>
                <div class="record-count">
                    <?php echo isset($stats['Gorilla Families']) ? $stats['Gorilla Families'] : 0; ?> Record(s)
                </div>
                <div class="button-group">
                    <a href="pages/gorilla/index.php" class="btn btn-primary">Manage</a>
                </div>
            </div>
        </div>
        
        <!-- Statistics Table -->
        <div class="stats-section">
            <h2>📊 Content Statistics</h2>
            <table class="stats-table">
                <thead>
                    <tr>
                        <th>Section</th>
                        <th>Records</th>
                        <th>Status</th>
                    </tr>
                </thead>
                <tbody>
                    <?php foreach ($stats as $section => $count): ?>
                        <tr>
                            <td><strong><?php echo htmlspecialchars($section); ?></strong></td>
                            <td><?php echo $count; ?></td>
                            <td>
                                <span class="status-badge <?php echo $count > 0 ? 'status-active' : 'status-inactive'; ?>">
                                    <?php echo $count > 0 ? '✓ Active' : '⚠ Empty'; ?>
                                </span>
                            </td>
                        </tr>
                    <?php endforeach; ?>
                </tbody>
            </table>
        </div>
    </div>
</body>
</html>

