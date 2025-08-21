<?php
require_once __DIR__ . '/../config/connection.php';

// Process form submission
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    session_start();
    
    try {
        // Validate required fields
        $requiredFields = ['firstName', 'lastName', 'email', 'subject', 'message'];
        foreach ($requiredFields as $field) {
            if (empty($_POST[$field])) {
                throw new Exception("Please fill in all required fields");
            }
        }

        // Sanitize inputs
        $firstName = $conn->real_escape_string(trim($_POST['firstName']));
        $lastName = $conn->real_escape_string(trim($_POST['lastName']));
        $email = filter_var(trim($_POST['email']), FILTER_SANITIZE_EMAIL);
        $phone = isset($_POST['phone']) ? $conn->real_escape_string(trim($_POST['phone'])) : null;
        $subject = $conn->real_escape_string(trim($_POST['subject']));
        $message = $conn->real_escape_string(trim($_POST['message']));
        $ipAddress = $_SERVER['REMOTE_ADDR'];

        // Validate email format
        if (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
            throw new Exception("Please enter a valid email address");
        }

        // Prepare and execute query
        $query = "INSERT INTO contact_submissions 
                 (first_name, last_name, email, phone, subject, message, ip_address) 
                 VALUES ('$firstName', '$lastName', '$email', '$phone', '$subject', '$message', '$ipAddress')";
        
        if (!$conn->query($query)) {
            throw new Exception("Error submitting your message. Please try again later.");
        }

        // Store success message in session
        $_SESSION['contact_message'] = [
            'type' => 'success',
            'text' => 'Thank you for your message! We will get back to you soon.'
        ];
        
    } catch (Exception $e) {
        $_SESSION['contact_message'] = [
            'type' => 'error',
            'text' => $e->getMessage()
        ];
    }
    
    $conn->close();
    header("Location: ../../pages/contactus.php");
    exit;
}

// Invalid request method
http_response_code(405);
echo "Invalid request method";
exit;
?>