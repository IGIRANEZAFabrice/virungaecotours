<?php
require_once('../../config/connection.php');

// Check if form was submitted
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    try {
        // Validate required fields
        if (empty($_POST['slide_id'])) {
            throw new Exception("Slide ID is required");
        }

        $slideId = intval($_POST['slide_id']);
        
        // Check if this is the last slide
        $countQuery = "SELECT COUNT(*) as total FROM home_hero";
        $countResult = $conn->query($countQuery);
        $totalSlides = $countResult->fetch_assoc()['total'];
        
        if ($totalSlides <= 1) {
            throw new Exception("Cannot delete the last remaining slide. At least one slide must remain.");
        }

        // Get the image path before deleting
        $imageQuery = "SELECT image_url FROM home_hero WHERE id = ?";
        $imageStmt = $conn->prepare($imageQuery);
        $imageStmt->bind_param("i", $slideId);
        $imageStmt->execute();
        $imageResult = $imageStmt->get_result();
        
        if ($imageResult->num_rows === 0) {
            throw new Exception("Slide not found");
        }
        
        $imageData = $imageResult->fetch_assoc();
        $imagePath = $imageData['image_url'];
        $imageStmt->close();

        // Delete from database
        $deleteStmt = $conn->prepare("DELETE FROM home_hero WHERE id = ?");
        if (!$deleteStmt) {
            throw new Exception("Database prepare failed: " . $conn->error);
        }
        
        $deleteStmt->bind_param("i", $slideId);
        
        if (!$deleteStmt->execute()) {
            throw new Exception("Database execution failed: " . $deleteStmt->error);
        }
        
        if ($deleteStmt->affected_rows === 0) {
            throw new Exception("No slide was deleted. Slide may not exist.");
        }
        
        $deleteStmt->close();

        // Delete the image file if it exists
        if (!empty($imagePath)) {
            $fullImagePath = '../../images/home/hero/' . basename($imagePath);
            if (file_exists($fullImagePath)) {
                unlink($fullImagePath);
            }
        }
        
        $conn->close();

        // Redirect back with success message
        header("Location: ../../pages/home/hero.php?status=success&message=" . urlencode("Hero slide deleted successfully!"));
        exit();
        
    } catch (Exception $e) {
        // Redirect back with error message
        header("Location: ../../pages/home/hero.php?status=error&message=" . urlencode($e->getMessage()));
        exit();
    }
} else {
    // Redirect if not POST request
    header("Location: ../../pages/home/hero.php");
    exit();
}
?>
