<?php
/**
 * API Endpoint: Get Empowerment Programs
 * Returns all programs with category = 'Empowerment'
 */

header('Content-Type: application/json');
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods: GET');
header('Access-Control-Allow-Headers: Content-Type');

// Include database connection
require_once '../../admin/config/connection.php';

try {
    // Query to get empowerment programs
    $query = "SELECT 
                id,
                title,
                short_description,
                description,
                category,
                country,
                status,
                start_date,
                end_date,
                budget,
                beneficiaries,
                image,
                featured,
                created_at,
                updated_at
              FROM community_programs 
              WHERE category = 'Empowerment' 
              AND status IN ('active', 'completed', 'upcoming')
              ORDER BY featured DESC, start_date DESC";
    
    $result = mysqli_query($conn, $query);
    
    if (!$result) {
        throw new Exception('Database query failed: ' . mysqli_error($conn));
    }
    
    $programs = [];
    while ($row = mysqli_fetch_assoc($result)) {
        // Format the program data
        $program = [
            'id' => (int)$row['id'],
            'title' => $row['title'],
            'short_description' => $row['short_description'],
            'description' => $row['description'],
            'category' => $row['category'],
            'country' => $row['country'],
            'status' => $row['status'],
            'start_date' => $row['start_date'],
            'end_date' => $row['end_date'],
            'budget' => $row['budget'] ? (float)$row['budget'] : null,
            'beneficiaries' => $row['beneficiaries'] ? (int)$row['beneficiaries'] : null,
            'image' => $row['image'] ?: 'default-empowerment.jpg',
            'featured' => (bool)$row['featured'],
            'created_at' => $row['created_at'],
            'updated_at' => $row['updated_at']
        ];
        
        // Add computed fields
        $program['duration'] = calculateDuration($row['start_date'], $row['end_date']);
        $program['is_ongoing'] = isOngoing($row['start_date'], $row['end_date']);
        $program['url'] = "program-detail.php?id=" . $program['id'];
        
        $programs[] = $program;
    }
    
    // Return success response
    $response = [
        'success' => true,
        'count' => count($programs),
        'programs' => $programs,
        'message' => count($programs) > 0 ? 'Programs loaded successfully' : 'No empowerment programs found'
    ];
    
    echo json_encode($response, JSON_PRETTY_PRINT);
    
} catch (Exception $e) {
    // Return error response
    http_response_code(500);
    $response = [
        'success' => false,
        'error' => $e->getMessage(),
        'programs' => [],
        'count' => 0
    ];
    
    echo json_encode($response, JSON_PRETTY_PRINT);
    
} finally {
    // Close database connection
    if (isset($conn)) {
        mysqli_close($conn);
    }
}

/**
 * Calculate program duration in human-readable format
 */
function calculateDuration($start_date, $end_date) {
    if (!$start_date) return 'Unknown';
    
    $start = new DateTime($start_date);
    $end = $end_date ? new DateTime($end_date) : new DateTime();
    
    $interval = $start->diff($end);
    
    if ($interval->y > 0) {
        return $interval->y . ' year' . ($interval->y > 1 ? 's' : '');
    } elseif ($interval->m > 0) {
        return $interval->m . ' month' . ($interval->m > 1 ? 's' : '');
    } elseif ($interval->d > 0) {
        return $interval->d . ' day' . ($interval->d > 1 ? 's' : '');
    } else {
        return 'Less than a day';
    }
}

/**
 * Check if program is currently ongoing
 */
function isOngoing($start_date, $end_date) {
    if (!$start_date) return false;
    
    $now = new DateTime();
    $start = new DateTime($start_date);
    
    // If no end date, consider it ongoing if started
    if (!$end_date) {
        return $now >= $start;
    }
    
    $end = new DateTime($end_date);
    return $now >= $start && $now <= $end;
}

/**
 * Validate and sanitize input
 */
function sanitizeInput($input) {
    return htmlspecialchars(strip_tags(trim($input)), ENT_QUOTES, 'UTF-8');
}

/**
 * Format currency amount
 */
function formatCurrency($amount) {
    if (!$amount) return null;
    return number_format($amount, 0);
}

/**
 * Get program status badge info
 */
function getStatusInfo($status) {
    $statusMap = [
        'active' => ['color' => '#28a745', 'icon' => 'fa-play-circle', 'label' => 'Active'],
        'completed' => ['color' => '#6c757d', 'icon' => 'fa-check-circle', 'label' => 'Completed'],
        'upcoming' => ['color' => '#ffc107', 'icon' => 'fa-clock', 'label' => 'Upcoming'],
        'paused' => ['color' => '#fd7e14', 'icon' => 'fa-pause-circle', 'label' => 'Paused'],
        'cancelled' => ['color' => '#dc3545', 'icon' => 'fa-times-circle', 'label' => 'Cancelled']
    ];
    
    return $statusMap[$status] ?? $statusMap['active'];
}
?>
