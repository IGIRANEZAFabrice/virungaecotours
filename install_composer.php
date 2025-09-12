<?php
/**
 * Composer Installation Script for Bluehost
 * This script will download and install Composer, then install PHPMailer
 */

echo "<h1>Composer & PHPMailer Installation for Bluehost</h1>\n";
echo "<pre>\n";

// Set time limit for installation
set_time_limit(300); // 5 minutes

// Get current directory
$currentDir = __DIR__;
echo "Current directory: $currentDir\n";

// Check if we can execute shell commands
$canExecShell = function_exists('shell_exec') && !in_array('shell_exec', array_map('trim', explode(',', ini_get('disable_functions'))));
echo "Shell execution available: " . ($canExecShell ? "YES" : "NO") . "\n";

// Check PHP version
echo "PHP Version: " . phpversion() . "\n";

// Check if Composer is already installed
$composerExists = file_exists($currentDir . '/composer.phar');
echo "Composer exists: " . ($composerExists ? "YES" : "NO") . "\n";

if (!$composerExists) {
    echo "\n=== Installing Composer ===\n";
    
    // Download Composer installer
    echo "Downloading Composer installer...\n";
    $installerUrl = 'https://getcomposer.org/installer';
    $installer = file_get_contents($installerUrl);
    
    if ($installer === false) {
        echo "ERROR: Could not download Composer installer\n";
        exit(1);
    }
    
    file_put_contents($currentDir . '/composer-setup.php', $installer);
    echo "Composer installer downloaded\n";
    
    // Install Composer
    echo "Installing Composer...\n";
    if ($canExecShell) {
        $output = shell_exec("cd $currentDir && php composer-setup.php 2>&1");
        echo $output . "\n";
    } else {
        // Manual installation without shell_exec
        include $currentDir . '/composer-setup.php';
    }
    
    // Clean up installer
    unlink($currentDir . '/composer-setup.php');
    
    // Check if installation was successful
    if (file_exists($currentDir . '/composer.phar')) {
        echo "Composer installed successfully!\n";
    } else {
        echo "ERROR: Composer installation failed\n";
        exit(1);
    }
} else {
    echo "Composer already installed\n";
}

// Create composer.json if it doesn't exist
$composerJsonPath = $currentDir . '/composer.json';
if (!file_exists($composerJsonPath)) {
    echo "\n=== Creating composer.json ===\n";
    
    $composerConfig = [
        "require" => [
            "phpmailer/phpmailer" => "^6.8"
        ],
        "config" => [
            "vendor-dir" => "vendor"
        ]
    ];
    
    file_put_contents($composerJsonPath, json_encode($composerConfig, JSON_PRETTY_PRINT));
    echo "composer.json created\n";
}

// Install PHPMailer
echo "\n=== Installing PHPMailer ===\n";
if ($canExecShell) {
    $output = shell_exec("cd $currentDir && php composer.phar install 2>&1");
    echo $output . "\n";
} else {
    echo "Shell execution not available. Manual PHPMailer installation required.\n";
    echo "Please download PHPMailer manually from GitHub.\n";
}

// Check if PHPMailer was installed
$phpmailerPath = $currentDir . '/vendor/phpmailer/phpmailer/src/PHPMailer.php';
if (file_exists($phpmailerPath)) {
    echo "PHPMailer installed successfully!\n";
} else {
    echo "PHPMailer installation may have failed. Checking alternative paths...\n";
    
    // Check for alternative installation paths
    $altPaths = [
        $currentDir . '/vendor/autoload.php',
        $currentDir . '/PHPMailer/src/PHPMailer.php'
    ];
    
    foreach ($altPaths as $path) {
        if (file_exists($path)) {
            echo "Found: $path\n";
        }
    }
}

// Test PHPMailer loading
echo "\n=== Testing PHPMailer ===\n";
try {
    if (file_exists($currentDir . '/vendor/autoload.php')) {
        require_once $currentDir . '/vendor/autoload.php';
        echo "Autoloader loaded successfully\n";
        
        if (class_exists('PHPMailer\\PHPMailer\\PHPMailer')) {
            echo "PHPMailer class available via Composer\n";
        } else {
            echo "PHPMailer class not found via Composer\n";
        }
    } else {
        echo "Composer autoloader not found\n";
    }
} catch (Exception $e) {
    echo "Error testing PHPMailer: " . $e->getMessage() . "\n";
}

// Create installation status file
$statusFile = $currentDir . '/installation_status.txt';
$status = [
    'timestamp' => date('Y-m-d H:i:s'),
    'composer_installed' => file_exists($currentDir . '/composer.phar'),
    'phpmailer_installed' => file_exists($phpmailerPath) || file_exists($currentDir . '/vendor/autoload.php'),
    'php_version' => phpversion(),
    'shell_exec_available' => $canExecShell
];

file_put_contents($statusFile, json_encode($status, JSON_PRETTY_PRINT));

echo "\n=== Installation Complete ===\n";
echo "Status saved to: installation_status.txt\n";
echo "Next step: Run debug_email.php to test email functionality\n";

echo "</pre>\n";
?>

<style>
body { font-family: Arial, sans-serif; margin: 20px; }
pre { background: #f5f5f5; padding: 15px; border-radius: 5px; overflow-x: auto; }
h1 { color: #2a4858; }
</style>
