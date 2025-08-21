<?php
require_once '../config/connection.php';

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    try {
        $conn->begin_transaction();

        // Handle cover image upload
        $coverImagePath = '';
        if (isset($_FILES['coverImage']) && $_FILES['coverImage']['error'] == 0) {
            $targetDir = "../../images/tours/";
            if (!file_exists($targetDir)) {
                mkdir($targetDir, 0777, true);
            }
            $fileName = uniqid() . '_' . basename($_FILES['coverImage']['name']);
            $fullPath = $targetDir . $fileName;
            $dbPath = "images/tours/" . $fileName; // Store relative path in database
            
            if (move_uploaded_file($_FILES['coverImage']['tmp_name'], $fullPath)) {
                $coverImagePath = $dbPath;
            }
        }

        // Insert main tour details
        $stmt = $conn->prepare("INSERT INTO tours (title, category, country, days_count, cover_image_path, short_description, why_attend) VALUES (?, ?, ?, ?, ?, ?, ?)");
        $stmt->bind_param("sssisss", 
            $_POST['tourTitle'],
            $_POST['tourCategory'],
            $_POST['tourCountry'],
            $_POST['tourDays'],
            $coverImagePath,
            $_POST['tourDesc'],
            $_POST['whyAttend']
        );
        $stmt->execute();
        $tourId = $conn->insert_id;

        // Process highlight images
        for ($i = 1; $i <= 4; $i++) {
            if (isset($_FILES["highlight{$i}"]) && $_FILES["highlight{$i}"]['error'] == 0) {
                $targetDir = "../../images/tours/highlights/";
                if (!file_exists($targetDir)) {
                    mkdir($targetDir, 0777, true);
                }
                $fileName = uniqid() . '_' . basename($_FILES["highlight{$i}"]['name']);
                $fullPath = $targetDir . $fileName;
                $dbPath = "images/tours/highlights/" . $fileName; // Store relative path in database
                
                if (move_uploaded_file($_FILES["highlight{$i}"]['tmp_name'], $fullPath)) {
                    $stmt = $conn->prepare("INSERT INTO tour_highlights (tour_id, image_path, display_order) VALUES (?, ?, ?)");
                    $stmt->bind_param("isi", $tourId, $dbPath, $i);
                    $stmt->execute();
                }
            }
        }

        // Process activities/days
        if (isset($_POST['activities'])) {
            $stmt = $conn->prepare("INSERT INTO tour_days (tour_id, day_number, day_title, day_description) VALUES (?, ?, ?, ?)");
            $dayNumber = 1;
            foreach ($_POST['activities'] as $activity) {
                $stmt->bind_param("iiss", 
                    $tourId,
                    $dayNumber,
                    $activity['title'],
                    $activity['desc']
                );
                $stmt->execute();
                $dayNumber++;
            }
        }

        // Process included items
        if (isset($_POST['included'])) {
            $stmt = $conn->prepare("INSERT INTO tour_included (tour_id, item_description) VALUES (?, ?)");
            foreach ($_POST['included'] as $item) {
                if (!empty($item)) {
                    $stmt->bind_param("is", $tourId, $item);
                    $stmt->execute();
                }
            }
        }

        // Process excluded items
        if (isset($_POST['excluded'])) {
            $stmt = $conn->prepare("INSERT INTO tour_excluded (tour_id, item_description) VALUES (?, ?)");
            foreach ($_POST['excluded'] as $item) {
                if (!empty($item)) {
                    $stmt->bind_param("is", $tourId, $item);
                    $stmt->execute();
                }
            }
        }

        // Process what to bring items
        if (isset($_POST['bring']) && is_array($_POST['bring'])) {
            $toBringStmt = $conn->prepare("INSERT INTO tour_to_bring (tour_id, item_description) VALUES (?, ?)");
            
            foreach ($_POST['bring'] as $item) {
                if (!empty(trim($item))) {
                    $toBringStmt->bind_param("is", $tourId, $item);
                    $toBringStmt->execute();
                }
            }
            $toBringStmt->close();
        }

        $conn->commit();
        echo json_encode(['success' => true, 'message' => 'Tour created successfully']);

    } catch (Exception $e) {
        $conn->rollback();
        echo json_encode(['success' => false, 'message' => 'Error: ' . $e->getMessage()]);
    }
} else {
    echo json_encode(['success' => false, 'message' => 'Invalid request method']);
}
?>
