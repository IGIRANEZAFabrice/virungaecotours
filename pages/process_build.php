<?php
require_once '../admin/config/connection.php';

// Check if form was submitted
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    // Validate and sanitize input
    $names = isset($_POST['names']) ? $conn->real_escape_string(trim($_POST['names'])) : '';
    $email = isset($_POST['email']) ? filter_var($_POST['email'], FILTER_SANITIZE_EMAIL) : '';
    $phone = isset($_POST['phone']) ? $conn->real_escape_string(trim($_POST['phone'])) : '';
    $referral_source = isset($_POST['referral_source']) ? $conn->real_escape_string(trim($_POST['referral_source'])) : '';
    $travelers_info = isset($_POST['travelers_info']) ? $conn->real_escape_string(trim($_POST['travelers_info'])) : '';
    $trip_days = isset($_POST['trip_days']) ? $conn->real_escape_string(trim($_POST['trip_days'])) : '';
    $group_size = isset($_POST['group_size']) ? $conn->real_escape_string(trim($_POST['group_size'])) : '';
    $travel_date = isset($_POST['travel_date']) ? $conn->real_escape_string(trim($_POST['travel_date'])) : '';
    $budget_notes = isset($_POST['budget_notes']) ? $conn->real_escape_string(trim($_POST['budget_notes'])) : '';
    $newsletter = isset($_POST['newsletter']) ? 1 : 0;
    $weekly_emails = isset($_POST['weekly-emails']) ? 1 : 0;

    // Validate required fields
    $missing_fields = [];
    if (empty($names)) $missing_fields[] = 'names';
    if (empty($email)) $missing_fields[] = 'email';
    if (empty($phone)) $missing_fields[] = 'phone';
    if (empty($trip_days)) $missing_fields[] = 'trip_days';
    if (empty($group_size)) $missing_fields[] = 'group_size';
    if (empty($travel_date)) $missing_fields[] = 'travel_date';
    
    if (!empty($missing_fields)) {
        header('Location: build.php?error=missing_fields&fields=' . urlencode(implode(',', $missing_fields)));
        exit;
    }

    // Validate email format
    if (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
        header('Location: build.php?error=invalid_email');
        exit;
    }

    // Prepare and execute SQL statement
    $stmt = $conn->prepare("INSERT INTO build_submissions (names, email, phone, referral_source, travelers_info, trip_days, group_size, travel_date, budget_notes, newsletter, weekly_emails) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)");
    $stmt->bind_param("sssssssssii", $names, $email, $phone, $referral_source, $travelers_info, $trip_days, $group_size, $travel_date, $budget_notes, $newsletter, $weekly_emails);

    if ($stmt->execute()) {
        header('Location: build.php?success=true');
    } else {
        header('Location: build.php?error=database_error');
    }

    $stmt->close();
    $conn->close();
} else {
    header('Location: build.php');
    exit;
}
?>