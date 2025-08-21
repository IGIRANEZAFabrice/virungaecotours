<?php
require_once '../../admin/config/connection.php'; // Adjust path as needed

header('Content-Type: application/json'); // Set response type to JSON

$limit = isset($_GET['limit']) ? intval($_GET['limit']) : 6; // Default limit
$offset = isset($_GET['offset']) ? intval($_GET['offset']) : 0;

if ($limit <= 0) $limit = 6;
if ($offset < 0) $offset = 0;

// Prepare the query to fetch the next batch of posts
$query = "SELECT bp.blog_id, bp.title, bp.author, bp.read_minutes, bp.cover_image, 
                 bp.introduction, bp.published_at, bp.created_at, 
                 bc.category_slug, bc.category_name 
          FROM blog_posts bp
          JOIN blog_categories bc ON bp.category_id = bc.category_id
          WHERE bp.status = 'published' 
          ORDER BY bp.published_at DESC, bp.created_at DESC
          LIMIT ? OFFSET ?";

$stmt = $conn->prepare($query);
if (!$stmt) {
    echo json_encode(['error' => 'Failed to prepare statement: ' . $conn->error]);
    exit;
}

$stmt->bind_param("ii", $limit, $offset);
$stmt->execute();
$result = $stmt->get_result();

$posts = [];
if ($result) {
    while ($post = $result->fetch_assoc()) {
        // Apply stripslashes before sending
        $post['title'] = stripslashes($post['title']);
        $post['author'] = stripslashes($post['author']);
        $post['introduction'] = $post['introduction'];
        $post['category_name'] = stripslashes($post['category_name']);
        $post['cover_image'] = stripslashes($post['cover_image']); 
        
        // Create snippet and flag for JS
        $post['introduction_snippet'] = substr(strip_tags(stripslashes($post['introduction'])), 0, 300);
        $post['introduction_long'] = strlen(strip_tags(stripslashes($post['introduction']))) > 300;
        unset($post['introduction']); // Remove full intro to save bandwidth

        // Format date
        $post['published_date'] = date('M d, Y', strtotime($post['published_at'] ?? $post['created_at']));
        unset($post['published_at']); // Remove original date fields
        unset($post['created_at']);

        $posts[] = $post;
    }
    $stmt->close();
} else {
     echo json_encode(['error' => 'Failed to execute query: ' . $stmt->error]);
     exit;
}

$conn->close();

echo json_encode($posts); // Output the posts as JSON
?>