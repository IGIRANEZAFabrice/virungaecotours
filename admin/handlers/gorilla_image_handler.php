<?php
/**
 * Gorilla Image Upload Handler
 * Handles image uploads for gorilla page sections
 */

require_once('../config/connection.php');

// Define upload directory
$upload_base_dir = dirname(__FILE__) . '/../../images/gorilla/';

// Create directory if it doesn't exist
if (!file_exists($upload_base_dir)) {
    mkdir($upload_base_dir, 0777, true);
}

// Allowed file extensions
$allowed_extensions = ['jpg', 'jpeg', 'png', 'gif', 'webp'];
$max_file_size = 5 * 1024 * 1024; // 5MB

/**
 * Upload image and return the relative path
 * 
 * @param array $file - $_FILES array element
 * @param string $subfolder - Subfolder within gorilla images directory
 * @return array - ['success' => bool, 'path' => string, 'message' => string]
 */
function uploadGorilaImage($file, $subfolder = '') {
    global $upload_base_dir, $allowed_extensions, $max_file_size;
    
    // Validate file exists
    if (!isset($file) || $file['error'] !== UPLOAD_ERR_OK) {
        return [
            'success' => false,
            'message' => 'No file uploaded or upload error occurred'
        ];
    }
    
    // Validate file size
    if ($file['size'] > $max_file_size) {
        return [
            'success' => false,
            'message' => 'File size exceeds 5MB limit'
        ];
    }
    
    // Get file extension
    $file_extension = strtolower(pathinfo($file['name'], PATHINFO_EXTENSION));
    
    // Validate file extension
    if (!in_array($file_extension, $allowed_extensions)) {
        return [
            'success' => false,
            'message' => 'Invalid file type. Allowed: ' . implode(', ', $allowed_extensions)
        ];
    }
    
    // Validate MIME type
    $finfo = finfo_open(FILEINFO_MIME_TYPE);
    $mime_type = finfo_file($finfo, $file['tmp_name']);
    finfo_close($finfo);
    
    $allowed_mimes = ['image/jpeg', 'image/png', 'image/gif', 'image/webp'];
    if (!in_array($mime_type, $allowed_mimes)) {
        return [
            'success' => false,
            'message' => 'Invalid image file'
        ];
    }
    
    // Create subfolder if specified
    $upload_dir = $upload_base_dir;
    if (!empty($subfolder)) {
        $upload_dir = $upload_base_dir . $subfolder . '/';
        if (!file_exists($upload_dir)) {
            mkdir($upload_dir, 0777, true);
        }
    }
    
    // Generate unique filename
    $filename = uniqid('gorilla_') . '.' . $file_extension;
    $upload_path = $upload_dir . $filename;
    
    // Move uploaded file
    if (!move_uploaded_file($file['tmp_name'], $upload_path)) {
        return [
            'success' => false,
            'message' => 'Failed to upload file'
        ];
    }
    
    // Return relative path for database storage
    $relative_path = 'images/gorilla/';
    if (!empty($subfolder)) {
        $relative_path .= $subfolder . '/';
    }
    $relative_path .= $filename;
    
    return [
        'success' => true,
        'path' => $relative_path,
        'message' => 'Image uploaded successfully'
    ];
}

/**
 * Delete image file
 * 
 * @param string $image_path - Relative path to image
 * @return bool - Success status
 */
function deleteGorilaImage($image_path) {
    global $upload_base_dir;
    
    $full_path = dirname(__FILE__) . '/../../' . $image_path;
    
    if (file_exists($full_path)) {
        return unlink($full_path);
    }
    
    return false;
}

// Handle AJAX requests
if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['action'])) {
    header('Content-Type: application/json');
    
    $action = $_POST['action'];
    
    if ($action === 'upload_hero_image') {
        if (!isset($_FILES['hero_image'])) {
            echo json_encode([
                'success' => false,
                'message' => 'No file provided'
            ]);
            exit;
        }
        
        $result = uploadGorilaImage($_FILES['hero_image'], 'hero');
        echo json_encode($result);
        exit;
    }
    
    if ($action === 'upload_intro_image') {
        if (!isset($_FILES['intro_image'])) {
            echo json_encode([
                'success' => false,
                'message' => 'No file provided'
            ]);
            exit;
        }
        
        $result = uploadGorilaImage($_FILES['intro_image'], 'intro');
        echo json_encode($result);
        exit;
    }
    
    if ($action === 'delete_image') {
        $image_path = $_POST['image_path'] ?? '';
        
        if (empty($image_path)) {
            echo json_encode([
                'success' => false,
                'message' => 'No image path provided'
            ]);
            exit;
        }
        
        $success = deleteGorilaImage($image_path);
        echo json_encode([
            'success' => $success,
            'message' => $success ? 'Image deleted successfully' : 'Failed to delete image'
        ]);
        exit;
    }
}

echo json_encode([
    'success' => false,
    'message' => 'Invalid request'
]);
?>

