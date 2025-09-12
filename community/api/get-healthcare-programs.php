<?php
/**
 * API Endpoint: Get Healthcare Programs
 * Returns all programs with category = 'Healthcare'
 */

header('Content-Type: application/json');
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods: GET');
header('Access-Control-Allow-Headers: Content-Type');

// Include database connection
require_once '../../admin/config/connection.php';

try {
    // Query to get healthcare programs
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
              WHERE category = 'Healthcare' 
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
            'image' => $row['image'] ?: 'default-healthcare.jpg',
            'featured' => (bool)$row['featured'],
            'created_at' => $row['created_at'],
            'updated_at' => $row['updated_at']
        ];
        
        // Add computed fields
        $program['duration'] = calculateDuration($row['start_date'], $row['end_date']);
        $program['is_ongoing'] = isOngoing($row['start_date'], $row['end_date']);
        $program['url'] = "program-detail.php?id=" . $program['id'];
        $program['health_focus'] = getHealthFocus($program['title'], $program['description']);
        
        $programs[] = $program;
    }
    
    // Return success response
    $response = [
        'success' => true,
        'count' => count($programs),
        'programs' => $programs,
        'message' => count($programs) > 0 ? 'Healthcare programs loaded successfully' : 'No healthcare programs found'
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
 * Determine health focus areas based on program content
 */
function getHealthFocus($title, $description) {
    $focus_areas = [];
    $content = strtolower($title . ' ' . $description);
    
    // Define focus area keywords
    $focus_keywords = [
        'community_health' => ['community', 'clinic', 'health center', 'public health', 'rural health'],
        'wellness' => ['wellness', 'spa', 'therapy', 'relaxation', 'mental health'],
        'preventive' => ['prevention', 'hygiene', 'sanitation', 'vaccination', 'screening'],
        'maternal' => ['maternal', 'pregnancy', 'birth', 'mother', 'reproductive'],
        'nutrition' => ['nutrition', 'food', 'malnutrition', 'diet', 'feeding'],
        'water_sanitation' => ['water', 'sanitation', 'hygiene', 'toilet', 'clean water'],
        'traditional_medicine' => ['traditional', 'herbal', 'medicine', 'healing', 'indigenous'],
        'health_education' => ['education', 'awareness', 'training', 'knowledge', 'learning']
    ];
    
    foreach ($focus_keywords as $focus => $keywords) {
        foreach ($keywords as $keyword) {
            if (strpos($content, $keyword) !== false) {
                $focus_areas[] = $focus;
                break;
            }
        }
    }
    
    return array_unique($focus_areas);
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

/**
 * Calculate health impact metrics
 */
function getHealthMetrics($programs) {
    $metrics = [
        'total_programs' => count($programs),
        'active_programs' => 0,
        'total_budget' => 0,
        'total_beneficiaries' => 0,
        'countries_covered' => [],
        'focus_areas' => [],
        'health_facilities' => 0
    ];
    
    foreach ($programs as $program) {
        if ($program['status'] === 'active') {
            $metrics['active_programs']++;
        }
        
        if ($program['budget']) {
            $metrics['total_budget'] += $program['budget'];
        }
        
        if ($program['beneficiaries']) {
            $metrics['total_beneficiaries'] += $program['beneficiaries'];
        }
        
        if (!in_array($program['country'], $metrics['countries_covered'])) {
            $metrics['countries_covered'][] = $program['country'];
        }
        
        if (isset($program['health_focus'])) {
            $metrics['focus_areas'] = array_merge($metrics['focus_areas'], $program['health_focus']);
        }
        
        // Count health facilities (estimate based on program type)
        $content = strtolower($program['title'] . ' ' . $program['description']);
        if (strpos($content, 'clinic') !== false || strpos($content, 'health center') !== false) {
            $metrics['health_facilities']++;
        }
    }
    
    $metrics['focus_areas'] = array_unique($metrics['focus_areas']);
    
    return $metrics;
}
?>
