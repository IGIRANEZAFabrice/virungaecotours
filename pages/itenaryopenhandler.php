<?php
require_once '../admin/config/database.php';

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Get form data
    $full_name = $_POST['name'] ?? '';
    $email = $_POST['email'] ?? '';
    $phone = $_POST['phone'] ?? '';
    $travel_date = $_POST['date'] ?? '';
    $tour_id = $_POST['tour_id'] ?? '';
    $ip_address = $_SERVER['REMOTE_ADDR'];

    // Validate required fields
    if (empty($full_name) || empty($email) || empty($phone) || empty($travel_date) || empty($tour_id)) {
        header("Location: itenaryopen.php?id=$tour_id&error=missing_fields");
        exit;
    }

    // Validate email
    if (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
        header("Location: itenaryopen.php?id=$tour_id&error=invalid_email");
        exit;
    }

    try {
        // Prepare SQL statement
        $sql = "INSERT INTO tour_bookings (tour_id, full_name, email, phone, travel_date, ip_address) 
                VALUES (:tour_id, :full_name, :email, :phone, :travel_date, :ip_address)";
        
        $stmt = $pdo->prepare($sql);
        
        // Bind parameters
        $stmt->bindParam(':tour_id', $tour_id);
        $stmt->bindParam(':full_name', $full_name);
        $stmt->bindParam(':email', $email);
        $stmt->bindParam(':phone', $phone);
        $stmt->bindParam(':travel_date', $travel_date);
        $stmt->bindParam(':ip_address', $ip_address);
        
        // Execute the statement
        $stmt->execute();
        
        // Redirect with success message
        header("Location: itenaryopen.php?id=$tour_id&success=1");
        exit;
        
    } catch(PDOException $e) {
        // Redirect with error message
        header("Location: itenaryopen.php?id=$tour_id&error=database");
        exit;
    }
}

// Handle page load and data fetching
$tour_id = isset($_GET['id']) ? (int)$_GET['id'] : 0;

try {
    // Fetch main tour data
    $tourQuery = "SELECT * FROM tours WHERE tour_id = :tour_id";
    $tourStmt = $pdo->prepare($tourQuery);
    $tourStmt->execute(['tour_id' => $tour_id]);
    $tour = $tourStmt->fetch(PDO::FETCH_ASSOC);

    if (!$tour) {
        header('Location: itenary.php');
        exit();
    }

    // Fetch tour highlights/images
    $highlightsQuery = "SELECT * FROM tour_highlights WHERE tour_id = :tour_id ORDER BY display_order";
    $highlightsStmt = $pdo->prepare($highlightsQuery);
    $highlightsStmt->execute(['tour_id' => $tour_id]);
    $highlights = $highlightsStmt->fetchAll(PDO::FETCH_ASSOC);

    // Fetch tour days
    $daysQuery = "SELECT * FROM tour_days WHERE tour_id = :tour_id ORDER BY day_number";
    $daysStmt = $pdo->prepare($daysQuery);
    $daysStmt->execute(['tour_id' => $tour_id]);
    $days = $daysStmt->fetchAll(PDO::FETCH_ASSOC);

    // Fetch included items
    $includedQuery = "SELECT * FROM tour_included WHERE tour_id = :tour_id";
    $includedStmt = $pdo->prepare($includedQuery);
    $includedStmt->execute(['tour_id' => $tour_id]);
    $included = $includedStmt->fetchAll(PDO::FETCH_ASSOC);

    // Fetch excluded items
    $excludedQuery = "SELECT * FROM tour_excluded WHERE tour_id = :tour_id";
    $excludedStmt = $pdo->prepare($excludedQuery);
    $excludedStmt->execute(['tour_id' => $tour_id]);
    $excluded = $excludedStmt->fetchAll(PDO::FETCH_ASSOC);

    // Fetch items to bring
    $toBringQuery = "SELECT * FROM tour_to_bring WHERE tour_id = :tour_id";
    $toBringStmt = $pdo->prepare($toBringQuery);
    $toBringStmt->execute(['tour_id' => $tour_id]);
    $toBring = $toBringStmt->fetchAll(PDO::FETCH_ASSOC);
    
    // Fetch related tours
    $relatedToursQuery = "SELECT * FROM tours WHERE category = :category AND tour_id != :tour_id LIMIT 3";
    $relatedToursStmt = $pdo->prepare($relatedToursQuery);
    $relatedToursStmt->execute([
        'category' => $tour['category'],
        'tour_id' => $tour_id
    ]);
    $relatedTours = $relatedToursStmt->fetchAll(PDO::FETCH_ASSOC);

} catch(PDOException $e) {
    error_log("Error fetching tour data: " . $e->getMessage());
    header('Location: itenary.php');
    exit();
}