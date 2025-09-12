<?php
/**
 * Email System Debug Script
 * Tests database connection, PHPMailer installation, and email sending
 */

// Import PHPMailer classes
use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\SMTP;
use PHPMailer\PHPMailer\Exception;

echo "<h1>Email System Debug Test</h1>\n";
echo "<pre>\n";

$errors = [];
$warnings = [];
$success = [];

echo "=== SYSTEM INFORMATION ===\n";
echo "PHP Version: " . phpversion() . "\n";
echo "Server: " . $_SERVER['SERVER_SOFTWARE'] ?? 'Unknown' . "\n";
echo "Current Time: " . date('Y-m-d H:i:s') . "\n";
echo "Script Path: " . __FILE__ . "\n";
echo "Working Directory: " . getcwd() . "\n\n";

// Test 1: Check PHPMailer Installation
echo "=== TEST 1: PHPMailer Installation ===\n";
$phpmailerLoaded = false;

// Try Composer autoload first
if (file_exists(__DIR__ . '/vendor/autoload.php')) {
    try {
        require_once __DIR__ . '/vendor/autoload.php';
        echo "✓ Composer autoloader found and loaded\n";
        
        if (class_exists('PHPMailer\\PHPMailer\\PHPMailer')) {
            echo "✓ PHPMailer class available via Composer\n";
            $phpmailerLoaded = true;
            $success[] = "PHPMailer loaded via Composer";
        } else {
            echo "✗ PHPMailer class not found via Composer\n";
            $errors[] = "PHPMailer class not available";
        }
    } catch (Exception $e) {
        echo "✗ Error loading Composer autoloader: " . $e->getMessage() . "\n";
        $errors[] = "Composer autoloader error: " . $e->getMessage();
    }
}

// Try manual PHPMailer includes if Composer failed
if (!$phpmailerLoaded) {
    echo "Trying manual PHPMailer includes...\n";
    $phpmailerPaths = [
        __DIR__ . '/PHPMailer/src/Exception.php',
        __DIR__ . '/PHPMailer/src/PHPMailer.php',
        __DIR__ . '/PHPMailer/src/SMTP.php'
    ];
    
    $allFilesExist = true;
    foreach ($phpmailerPaths as $path) {
        if (file_exists($path)) {
            echo "✓ Found: " . basename($path) . "\n";
        } else {
            echo "✗ Missing: " . basename($path) . "\n";
            $allFilesExist = false;
        }
    }
    
    if ($allFilesExist) {
        try {
            require_once $phpmailerPaths[0]; // Exception.php
            require_once $phpmailerPaths[1]; // PHPMailer.php
            require_once $phpmailerPaths[2]; // SMTP.php
            echo "✓ PHPMailer files loaded manually\n";
            $phpmailerLoaded = true;
            $success[] = "PHPMailer loaded manually";
        } catch (Exception $e) {
            echo "✗ Error loading PHPMailer files: " . $e->getMessage() . "\n";
            $errors[] = "Manual PHPMailer loading failed: " . $e->getMessage();
        }
    } else {
        $errors[] = "PHPMailer files not found";
    }
}

echo "\n";

// Test 2: Database Connection
echo "=== TEST 2: Database Connection ===\n";
$dbConnected = false;

try {
    $db_host = 'localhost';
    $db_user = 'root';
    $db_pass = '';
    $db_name = 'virungaecotoursdb';
    
    echo "Attempting to connect to database...\n";
    echo "Host: $db_host\n";
    echo "User: $db_user\n";
    echo "Database: $db_name\n";
    
    $conn = new mysqli($db_host, $db_user, $db_pass, $db_name);
    
    if ($conn->connect_error) {
        echo "✗ Database connection failed: " . $conn->connect_error . "\n";
        $errors[] = "Database connection failed: " . $conn->connect_error;
    } else {
        echo "✓ Database connected successfully\n";
        $dbConnected = true;
        $success[] = "Database connection successful";
        
        // Test tables
        $tables = ['tour_booking', 'contact_submissions', 'build_submission', 'community_messages'];
        foreach ($tables as $table) {
            $result = $conn->query("SHOW TABLES LIKE '$table'");
            if ($result && $result->num_rows > 0) {
                echo "✓ Table '$table' exists\n";
                
                // Check for emailed column
                $columnCheck = $conn->query("SHOW COLUMNS FROM `$table` LIKE 'emailed'");
                if ($columnCheck && $columnCheck->num_rows > 0) {
                    echo "  ✓ 'emailed' column exists\n";
                } else {
                    echo "  ⚠ 'emailed' column missing (will be added automatically)\n";
                    $warnings[] = "Table '$table' missing 'emailed' column";
                }
            } else {
                echo "✗ Table '$table' not found\n";
                $errors[] = "Table '$table' not found";
            }
        }
        
        $conn->close();
    }
} catch (Exception $e) {
    echo "✗ Database error: " . $e->getMessage() . "\n";
    $errors[] = "Database error: " . $e->getMessage();
}

echo "\n";

// Test 3: PHPMailer Email Test
echo "=== TEST 3: Email Sending Test ===\n";

if ($phpmailerLoaded) {
    try {
        $mail = new PHPMailer(true);
        
        // Server settings
        $mail->isSMTP();
        $mail->Host = 'smtp.gmail.com';
        $mail->SMTPAuth = true;
        $mail->Username = 'fabrdaa@gmail.com';
        $mail->Password = 'knqgypzjyrbxxjdg';
        $mail->SMTPSecure = PHPMailer::ENCRYPTION_STARTTLS;
        $mail->Port = 587;
        
        echo "✓ SMTP settings configured\n";
        
        // Recipients
        $mail->setFrom('fabrdaa@gmail.com', 'Virunga Ecotours Debug');
        $mail->addAddress('fabrdaa@gmail.com');
        
        echo "✓ Email addresses set\n";
        
        // Content
        $mail->isHTML(true);
        $mail->Subject = 'Debug Test Email - ' . date('Y-m-d H:i:s');
        $mail->Body = '<h2>Debug Test Successful!</h2>
                       <p>This is a test email from your Virunga Ecotours email automation system.</p>
                       <p><strong>Test Time:</strong> ' . date('Y-m-d H:i:s') . '</p>
                       <p><strong>Server:</strong> ' . ($_SERVER['SERVER_NAME'] ?? 'Unknown') . '</p>
                       <p><strong>PHP Version:</strong> ' . phpversion() . '</p>
                       <p>If you received this email, your email system is working correctly!</p>';
        
        $mail->AltBody = 'Debug Test Successful! This is a test email from your Virunga Ecotours email automation system.';
        
        echo "✓ Email content prepared\n";
        echo "Attempting to send email...\n";
        
        $result = $mail->send();
        
        if ($result) {
            echo "✓ Email sent successfully!\n";
            echo "Check your inbox at fabrdaa@gmail.com\n";
            $success[] = "Test email sent successfully";
        } else {
            echo "✗ Email sending failed\n";
            $errors[] = "Email sending failed";
        }
        
    } catch (Exception $e) {
        echo "✗ Email error: " . $e->getMessage() . "\n";
        $errors[] = "Email error: " . $e->getMessage();
    }
} else {
    echo "✗ Cannot test email - PHPMailer not loaded\n";
    $errors[] = "Cannot test email - PHPMailer not available";
}

echo "\n";

// Test 4: File Permissions
echo "=== TEST 4: File Permissions ===\n";
$files = ['sendemail.php', 'debug_email.php'];
foreach ($files as $file) {
    if (file_exists($file)) {
        $perms = fileperms($file);
        $permsOctal = substr(sprintf('%o', $perms), -4);
        echo "✓ $file permissions: $permsOctal\n";
        
        if (is_readable($file)) {
            echo "  ✓ Readable\n";
        } else {
            echo "  ✗ Not readable\n";
            $errors[] = "$file is not readable";
        }
        
        if (is_writable(dirname($file))) {
            echo "  ✓ Directory writable\n";
        } else {
            echo "  ✗ Directory not writable\n";
            $warnings[] = "Directory not writable for $file";
        }
    } else {
        echo "✗ $file not found\n";
        $errors[] = "$file not found";
    }
}

echo "\n";

// Summary
echo "=== SUMMARY ===\n";
echo "Successes: " . count($success) . "\n";
foreach ($success as $item) {
    echo "  ✓ $item\n";
}

echo "\nWarnings: " . count($warnings) . "\n";
foreach ($warnings as $item) {
    echo "  ⚠ $item\n";
}

echo "\nErrors: " . count($errors) . "\n";
foreach ($errors as $item) {
    echo "  ✗ $item\n";
}

echo "\n";

if (count($errors) == 0) {
    echo "🎉 ALL TESTS PASSED! Your email system is ready to use.\n";
    echo "You can now set up the cron job to run sendemail.php automatically.\n";
} else {
    echo "❌ ISSUES FOUND. Please fix the errors above before proceeding.\n";
    if (!$phpmailerLoaded) {
        echo "\nTo fix PHPMailer issues:\n";
        echo "1. Run install_composer.php first\n";
        echo "2. Or manually download PHPMailer files\n";
    }
}

// Save debug results
$debugResults = [
    'timestamp' => date('Y-m-d H:i:s'),
    'php_version' => phpversion(),
    'phpmailer_loaded' => $phpmailerLoaded,
    'database_connected' => $dbConnected,
    'success_count' => count($success),
    'warning_count' => count($warnings),
    'error_count' => count($errors),
    'successes' => $success,
    'warnings' => $warnings,
    'errors' => $errors
];

file_put_contents('debug_results.json', json_encode($debugResults, JSON_PRETTY_PRINT));
echo "\nDebug results saved to: debug_results.json\n";

echo "</pre>\n";
?>

<style>
body { font-family: Arial, sans-serif; margin: 20px; }
pre { background: #f5f5f5; padding: 15px; border-radius: 5px; overflow-x: auto; }
h1 { color: #2a4858; }
</style>
