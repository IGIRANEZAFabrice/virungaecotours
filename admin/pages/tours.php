<?php
require_once '../config/database.php';
session_start();

if (!isset($_SESSION['admin_id'])) {
  header("Location: login.html");
  exit();
}
// Get messages from session
$success_message = isset($_SESSION['success_message']) ? $_SESSION['success_message'] : null;
$error_message = isset($_SESSION['error_message']) ? $_SESSION['error_message'] : null;

// Clear the messages from session
unset($_SESSION['success_message']);
unset($_SESSION['error_message']);

// Update the delete handling section at the top of the file
if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['delete_tour'])) {
    try {
        $tour_id = $_POST['tour_id'];
        $pdo->beginTransaction();

        // Delete from child tables first due to foreign key constraints
        $tables = [
            'tour_highlights',
            'tour_days',
            'tour_included',
            'tour_excluded',
            'tour_to_bring'
        ];

        foreach ($tables as $table) {
            $stmt = $pdo->prepare("DELETE FROM $table WHERE tour_id = ?");
            $stmt->execute([$tour_id]);
        }

        // Get image paths before deleting tour record
        $stmt = $pdo->prepare("SELECT cover_image_path FROM tours WHERE tour_id = ?");
        $stmt->execute([$tour_id]);
        $tour = $stmt->fetch();

        // Delete the main tour record
        $stmt = $pdo->prepare("DELETE FROM tours WHERE tour_id = ?");
        $stmt->execute([$tour_id]);

        // Delete associated files if they exist
        if ($tour && $tour['cover_image_path']) {
            $file_path = '../../' . $tour['cover_image_path'];
            if (file_exists($file_path)) {
                unlink($file_path);
            }
        }

        $pdo->commit();
        $success_message = "Tour deleted successfully!";
        // Note: Removed the echo json_encode and exit calls
    } catch (Exception $e) {
        $pdo->rollBack();
        $error_message = "Error deleting tour: " . $e->getMessage();
    }
}

// Update the fetch handler section
if ($_SERVER['REQUEST_METHOD'] === 'GET' && isset($_GET['fetch_tour'])) {
    try {
        $tour_id = $_GET['id'];
        error_log("Fetching tour with ID: " . $tour_id);

        // First get the main tour data
        $stmt = $pdo->prepare("SELECT * FROM tours WHERE tour_id = ?");
        $stmt->execute([$tour_id]);
        $tour = $stmt->fetch(PDO::FETCH_ASSOC);

        if (!$tour) {
            error_log("Tour not found with ID: " . $tour_id);
            throw new Exception("Tour not found");
        }

        error_log("Tour found: " . print_r($tour, true));

        // Fetch tour days - Modified this query
        $stmt = $pdo->prepare("
            SELECT day_number, day_title, day_description 
            FROM tour_days 
            WHERE tour_id = ? 
            ORDER BY day_number ASC
        ");
        $stmt->execute([$tour_id]);
        $tour['days'] = $stmt->fetchAll(PDO::FETCH_ASSOC);

        // Fetch tour highlights
        $stmt = $pdo->prepare("SELECT image_path, display_order FROM tour_highlights WHERE tour_id = ? ORDER BY display_order");
        $stmt->execute([$tour_id]);
        $tour['highlights'] = $stmt->fetchAll(PDO::FETCH_ASSOC);

        // Fetch included items
        $stmt = $pdo->prepare("SELECT item_description FROM tour_included WHERE tour_id = ?");
        $stmt->execute([$tour_id]);
        $tour['included'] = $stmt->fetchAll(PDO::FETCH_ASSOC);

        // Fetch excluded items
        $stmt = $pdo->prepare("SELECT item_description FROM tour_excluded WHERE tour_id = ?");
        $stmt->execute([$tour_id]);
        $tour['excluded'] = $stmt->fetchAll(PDO::FETCH_ASSOC);

        // Fetch to bring items
        $stmt = $pdo->prepare("SELECT item_description FROM tour_to_bring WHERE tour_id = ?");
        $stmt->execute([$tour_id]);
        $tour['to_bring'] = $stmt->fetchAll(PDO::FETCH_ASSOC);

        // Add debug logging
        error_log('Tour days data: ' . print_r($tour['days'], true));

        header('Content-Type: application/json');
        echo json_encode(['success' => true, 'data' => $tour]);
        exit;
    } catch (Exception $e) {
        error_log("Error fetching tour: " . $e->getMessage());
        header('Content-Type: application/json');
        echo json_encode(['success' => false, 'message' => $e->getMessage()]);
        exit;
    }
}

// Add this to handle tour updates
if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST['update_tour'])) {
    try {
        $pdo->beginTransaction();
        $tour_id = $_POST['tour_id'];
        $cover_image_path = null;

        // Check if a new cover image was uploaded
        if (isset($_FILES['coverImage']) && $_FILES['coverImage']['error'] === 0) {
            // Get the old image path
            $stmt = $pdo->prepare("SELECT cover_image_path FROM tours WHERE tour_id = ?");
            $stmt->execute([$tour_id]);
            $old_image = $stmt->fetch(PDO::FETCH_ASSOC);

            // Delete old image if it exists
            if ($old_image && $old_image['cover_image_path']) {
                $old_file_path = '../../' . $old_image['cover_image_path'];
                if (file_exists($old_file_path)) {
                    unlink($old_file_path);
                }
            }

            // Process new image
            $upload_dir = '../../images/tours/';
            if (!file_exists($upload_dir)) {
                mkdir($upload_dir, 0777, true);
            }

            $file_extension = pathinfo($_FILES['coverImage']['name'], PATHINFO_EXTENSION);
            $file_name = uniqid() . '.' . $file_extension;
            $target_path = $upload_dir . $file_name;
            
            if (move_uploaded_file($_FILES['coverImage']['tmp_name'], $target_path)) {
                $cover_image_path = 'images/tours/' . $file_name;
            }
        }

        // Update tour data with or without new image
        if ($cover_image_path) {
            $stmt = $pdo->prepare("UPDATE tours SET 
                title = :title,
                category = :category,
                country = :country,
                days_count = :days_count,
                short_description = :short_description,
                why_attend = :why_attend,
                cover_image_path = :cover_image_path
                WHERE tour_id = :tour_id");

            $params = [
                ':title' => $_POST['tourTitle'],
                ':category' => $_POST['tourCategory'],
                ':country' => $_POST['tourCountry'],
                ':days_count' => $_POST['tourDays'],
                ':short_description' => $_POST['tourDesc'],
                ':why_attend' => $_POST['whyAttend'],
                ':cover_image_path' => $cover_image_path,
                ':tour_id' => $tour_id
            ];
        } else {
            $stmt = $pdo->prepare("UPDATE tours SET 
                title = :title,
                category = :category,
                country = :country,
                days_count = :days_count,
                short_description = :short_description,
                why_attend = :why_attend
                WHERE tour_id = :tour_id");

            $params = [
                ':title' => $_POST['tourTitle'],
                ':category' => $_POST['tourCategory'],
                ':country' => $_POST['tourCountry'],
                ':days_count' => $_POST['tourDays'],
                ':short_description' => $_POST['tourDesc'],
                ':why_attend' => $_POST['whyAttend'],
                ':tour_id' => $tour_id
            ];
        }

        $stmt->execute($params);

        // Update activities
        if (isset($_POST['activities'])) {
            // First delete existing activities
            $stmt = $pdo->prepare("DELETE FROM tour_days WHERE tour_id = ?");
            $stmt->execute([$tour_id]);

            // Then insert new activities
            $activities = json_decode($_POST['activities'], true);
            $stmt = $pdo->prepare("INSERT INTO tour_days (tour_id, day_number, day_title, day_description) VALUES (?, ?, ?, ?)");
            foreach ($activities as $activity) {
                if (!empty($activity['title']) && !empty($activity['description'])) {
                    $stmt->execute([
                        $tour_id,
                        $activity['day_number'],
                        $activity['title'],
                        $activity['description']
                    ]);
                }
            }
        }

        // Update included items
        if (isset($_POST['includedItems'])) {
            $stmt = $pdo->prepare("DELETE FROM tour_included WHERE tour_id = ?");
            $stmt->execute([$tour_id]);

            $included_items = json_decode($_POST['includedItems'], true);
            $stmt = $pdo->prepare("INSERT INTO tour_included (tour_id, item_description) VALUES (?, ?)");
            foreach ($included_items as $item) {
                if (!empty($item)) {
                    $stmt->execute([$tour_id, $item]);
                }
            }
        }

        // Update excluded items
        if (isset($_POST['excludedItems'])) {
            $stmt = $pdo->prepare("DELETE FROM tour_excluded WHERE tour_id = ?");
            $stmt->execute([$tour_id]);

            $excluded_items = json_decode($_POST['excludedItems'], true);
            $stmt = $pdo->prepare("INSERT INTO tour_excluded (tour_id, item_description) VALUES (?, ?)");
            foreach ($excluded_items as $item) {
                if (!empty($item)) {
                    $stmt->execute([$tour_id, $item]);
                }
            }
        }

        // Update to bring items
        if (isset($_POST['toBringItems'])) {
            $stmt = $pdo->prepare("DELETE FROM tour_to_bring WHERE tour_id = ?");
            $stmt->execute([$tour_id]);

            $to_bring_items = json_decode($_POST['toBringItems'], true);
            $stmt = $pdo->prepare("INSERT INTO tour_to_bring (tour_id, item_description) VALUES (?, ?)");
            foreach ($to_bring_items as $item) {
                if (!empty($item)) {
                    $stmt->execute([$tour_id, $item]);
                }
            }
        }

        // Handle highlight images update
        for ($i = 1; $i <= 4; $i++) {
            if (isset($_FILES["highlight$i"]) && $_FILES["highlight$i"]['error'] === 0) {
                // Get existing highlight image for this position
                $stmt = $pdo->prepare("SELECT image_path FROM tour_highlights WHERE tour_id = ? AND display_order = ?");
                $stmt->execute([$tour_id, $i]);
                $existing_highlight = $stmt->fetch(PDO::FETCH_ASSOC);

                // Delete old image file if it exists
                if ($existing_highlight && $existing_highlight['image_path']) {
                    $old_file_path = '../../' . $existing_highlight['image_path'];
                    if (file_exists($old_file_path)) {
                        unlink($old_file_path);
                    }
                }

                // Upload new image
                $upload_dir = '../../images/tours/highlights/';
                if (!file_exists($upload_dir)) {
                    mkdir($upload_dir, 0777, true);
                }

                $file_extension = pathinfo($_FILES["highlight$i"]['name'], PATHINFO_EXTENSION);
                $file_name = uniqid() . '.' . $file_extension;
                $target_path = $upload_dir . $file_name;

                if (move_uploaded_file($_FILES["highlight$i"]['tmp_name'], $target_path)) {
                    $image_path = 'images/tours/highlights/' . $file_name;

                    // Update or insert highlight image
                    if ($existing_highlight) {
                        $stmt = $pdo->prepare("UPDATE tour_highlights SET image_path = ? WHERE tour_id = ? AND display_order = ?");
                        $stmt->execute([$image_path, $tour_id, $i]);
                    } else {
                        $stmt = $pdo->prepare("INSERT INTO tour_highlights (tour_id, image_path, display_order) VALUES (?, ?, ?)");
                        $stmt->execute([$tour_id, $image_path, $i]);
                    }
                }
            }
        }

        $pdo->commit();
        $_SESSION['success_message'] = "Tour updated successfully!";
        header('Location: ' . $_SERVER['PHP_SELF']);
        exit;
    } catch (Exception $e) {
        $pdo->rollBack();
        $_SESSION['error_message'] = "Error updating tour: " . $e->getMessage();
        header('Location: ' . $_SERVER['PHP_SELF']);
        exit;
    }
}

// Process form submission
if ($_SERVER["REQUEST_METHOD"] == "POST" && !isset($_POST['delete_tour']) && !isset($_POST['update_tour'])) {
    try {
        $pdo->beginTransaction();

        // Insert main tour data
        $stmt = $pdo->prepare("INSERT INTO tours (title, category, country, days_count, cover_image_path, short_description, why_attend) 
                              VALUES (:title, :category, :country, :days_count, :cover_image_path, :short_description, :why_attend)");
        
        // Handle cover image upload
        $cover_image_path = '';
        if (isset($_FILES['coverImage']) && $_FILES['coverImage']['error'] === 0) {
            $upload_dir = '../../images/tours/'; // Changed path
            if (!file_exists($upload_dir)) {
                mkdir($upload_dir, 0777, true);
            }
            
            $file_extension = pathinfo($_FILES['coverImage']['name'], PATHINFO_EXTENSION);
            $file_name = uniqid() . '.' . $file_extension;
            $target_path = $upload_dir . $file_name;
            
            if (move_uploaded_file($_FILES['coverImage']['tmp_name'], $target_path)) {
                $cover_image_path = 'images/tours/' . $file_name; // Changed path
            }
        }

        // Execute main tour insert
        $stmt->execute([
            ':title' => $_POST['tourTitle'],
            ':category' => $_POST['tourCategory'],
            ':country' => $_POST['tourCountry'],
            ':days_count' => $_POST['tourDays'],
            ':cover_image_path' => $cover_image_path,
            ':short_description' => $_POST['tourDesc'],
            ':why_attend' => $_POST['whyAttend']
        ]);

        $tour_id = $pdo->lastInsertId();

        // Handle highlight images
        for ($i = 1; $i <= 4; $i++) {
            if (isset($_FILES["highlight$i"]) && $_FILES["highlight$i"]['error'] === 0) {
                $upload_dir = '../../images/tours/highlights/'; // Changed path
                if (!file_exists($upload_dir)) {
                    mkdir($upload_dir, 0777, true);
                }
                
                $file_extension = pathinfo($_FILES["highlight$i"]['name'], PATHINFO_EXTENSION);
                $file_name = uniqid() . '.' . $file_extension;
                $target_path = $upload_dir . $file_name;
                
                if (move_uploaded_file($_FILES["highlight$i"]['tmp_name'], $target_path)) {
                    $image_path = 'images/tours/highlights/' . $file_name; // Changed path
                    
                    $stmt = $pdo->prepare("INSERT INTO tour_highlights (tour_id, image_path, display_order) VALUES (?, ?, ?)");
                    $stmt->execute([$tour_id, $image_path, $i]);
                }
            }
        }

        // Handle activities
        if (isset($_POST['activities'])) {
            $activities = json_decode($_POST['activities'], true);
            $stmt = $pdo->prepare("INSERT INTO tour_days (tour_id, day_number, day_title, day_description) VALUES (?, ?, ?, ?)");
            foreach ($activities as $activity) {
                if (!empty($activity['title']) && !empty($activity['description'])) {
                    $stmt->execute([
                        $tour_id,
                        $activity['day_number'],
                        $activity['title'],
                        $activity['description']
                    ]);
                }
            }
        }

        // Insert included items
        if (isset($_POST['includedItems'])) {
            $included_items = json_decode($_POST['includedItems'], true);
            $stmt = $pdo->prepare("INSERT INTO tour_included (tour_id, item_description) VALUES (?, ?)");
            foreach ($included_items as $item) {
                if (!empty($item)) {
                    $stmt->execute([$tour_id, $item]);
                }
            }
        }

        // Insert excluded items
        if (isset($_POST['excludedItems'])) {
            $excluded_items = json_decode($_POST['excludedItems'], true);
            $stmt = $pdo->prepare("INSERT INTO tour_excluded (tour_id, item_description) VALUES (?, ?)");
            foreach ($excluded_items as $item) {
                if (!empty($item)) {
                    $stmt->execute([$tour_id, $item]);
                }
            }
        }

        // Insert what to bring items
        if (isset($_POST['toBringItems'])) {
            $to_bring_items = json_decode($_POST['toBringItems'], true);
            $stmt = $pdo->prepare("INSERT INTO tour_to_bring (tour_id, item_description) VALUES (?, ?)");
            foreach ($to_bring_items as $item) {
                if (!empty($item)) {
                    $stmt->execute([$tour_id, $item]);
                }
            }
        }

        $pdo->commit();
        $_SESSION['success_message'] = "Tour saved successfully!";
        // Redirect to the same page with GET request
        header('Location: ' . $_SERVER['PHP_SELF']);
        exit;
    } catch (Exception $e) {
        $pdo->rollBack();
        $_SESSION['error_message'] = "Error: " . $e->getMessage();
        header('Location: ' . $_SERVER['PHP_SELF']);
        exit;
    }
}

// Rest of your HTML code...
?>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Tours Management - Virunga Ecotours</title>
    <link
      rel="shortcut icon"
      href="../../images/logos/icon.png"
      type="image/x-icon"
    />
    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css"
    />
    <link rel="stylesheet" href="../css/common.css" />
    <link rel="stylesheet" href="../css/tours.css" />
    <script src="../js/common.js" defer></script>
    <script src="../js/tours.js" defer></script>
  </head>
  <body>
    <div class="admin-container">
      <!-- Include sidebar template -->
      <?php include_once './includes/sidebar.php'; ?>

      <main class="main-content">
        <!-- Include header template -->
        <?php include_once './includes/header.php'; ?>

        <div class="content-panels">
          <!-- Tours specific content -->
          <div class="panel active" id="tours-panel">
            <div class="container">
              <button class="add-tour-btn" data-state="add">
                <span class="btn-text">Add New Tour</span>
              </button>

              <div class="add-tour-form" id="addTourForm">
                <h2 class="form-title">Add New Tour</h2>
                <form id="tourForm" method="POST" action="<?php echo $_SERVER['PHP_SELF']; ?>" enctype="multipart/form-data">
                  <div class="form-row">
                    <div class="form-col">
                      <div class="form-group">
                        <label for="tourTitle">Tour Title</label>
                        <input type="text" id="tourTitle" name="tourTitle" required />
                      </div>
                    </div>
                    <div class="form-col">
                      <div class="form-group">
                        <label for="tourCountry">Country</label>
                        <select id="tourCountry" name="tourCountry" required>
                          <option value="">Select Country</option>
                          <option value="all">All</option>
                          <option value="rwanda">Rwanda</option>
                          <option value="uganda">Uganda</option>
                          <option value="congo">DR Congo</option>
                          <option value="burundi">Burundi</option>
                        </select>
                      </div>
                    </div>
                    <div class="form-col">
                      <div class="form-group">
                        <label for="tourCategory">Category</label>
                        <div class="category-input-container">
                          <select id="tourCategory" name="tourCategory" required>
                            <option value="">Select a category</option>
                            <option value="Adventure">Adventure</option>
                            <option value="Cultural">Cultural</option>
                            <option value="City Tours">City Tours</option>
                            <option value="Comunity Based Tourism">Comunity Based Tourism</option>
                            <option value="Family Friendly">Family Friendly</option>
                            <option value="Food & Culinary">Food & Culinary</option>
                            <option value="Gastronomy">Gastronomy</option>
                            <option value="Highlights">Highlights</option>
                            <option value="Nature">Nature</option>
                            <option value="Off the beaten Path">Off the beaten Path</option>
                            <option value="Historical">Historical</option>
                            <option value="Spiritual">Spiritual</option>
                            <option value="add_new">+ Add New Category</option>
                          </select>
                          <div id="newCategoryContainer" class="new-category-container" style="display: none;">
                            <input type="text" id="newCategoryInput" placeholder="Enter new category name" maxlength="50">
                            <div class="category-actions">
                              <button type="button" id="confirmNewCategory" class="btn-confirm">
                                <i class="fas fa-check"></i>
                              </button>
                              <button type="button" id="cancelNewCategory" class="btn-cancel">
                                <i class="fas fa-times"></i>
                              </button>
                            </div>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>

                  <div class="form-row">
                    <div class="form-col">
                      <div class="form-group">
                        <label for="tourDays">Number of Days</label>
                        <input type="number" id="tourDays" name="tourDays" min="1" required />
                      </div>
                    </div>
                  </div>
                  <div class="form-row">
                    <div class="form-col">
                      <div class="form-group image-upload">
                        <label for="coverImage">Cover Image</label>
                        <div class="image-preview" id="coverPreview">
                          Cover Image Preview
                        </div>
                        <input type="file" id="coverImage" name="coverImage" accept="image/*" />
                      </div>
                    </div>
                  </div>

                  <div class="form-group">
                    <label for="tourDesc">Short Description</label>
                    <textarea
                      id="tourDesc"
                      name="tourDesc"
                      placeholder="Enter a brief description of the tour"
                      required
                    ></textarea>
                  </div>

                  <h3 class="section-title">Highlight Images</h3>
                  <div class="highlight-images">
                    <div class="form-group image-upload">
                      <div
                        class="image-preview highlight-image"
                        id="highlight1Preview"
                      >
                        Highlight 1
                      </div>
                      <input type="file" id="highlight1" name="highlight1" accept="image/*" />
                    </div>
                    <div class="form-group image-upload">
                      <div
                        class="image-preview highlight-image"
                        id="highlight2Preview"
                      >
                        Highlight 2
                      </div>
                      <input type="file" id="highlight2" name="highlight2" accept="image/*" />
                    </div>
                    <div class="form-group image-upload">
                      <div
                        class="image-preview highlight-image"
                        id="highlight3Preview"
                      >
                        Highlight 3
                      </div>
                      <input type="file" id="highlight3" name="highlight3" accept="image/*" />
                    </div>
                    <div class="form-group image-upload">
                      <div
                        class="image-preview highlight-image"
                        id="highlight4Preview"
                      >
                        Highlight 4
                      </div>
                      <input type="file" id="highlight4" name="highlight4" accept="image/*" />
                    </div>
                  </div>

                  <h3 class="section-title">Tour Itinerary</h3>
                  <div id="daysContainer">
                    <div class="day-container">
                      <h4 class="day-title">Activity 1</h4>
                      <div class="form-group">
                        <label for="day1Title">Activity Title</label>
                        <input type="text" 
                               id="day1Title" 
                               name="day1Title" 
                               placeholder="Enter title for activity" 
                               required>
                      </div>
                      <div class="form-group">
                        <label for="day1Desc">Activity Description</label>
                        <textarea id="day1Desc" 
                                 name="day1Desc" 
                                 placeholder="Describe the activity" 
                                 required></textarea>
                      </div>
                    </div>
                  </div>
                  <button type="button" class="btn add-btn" id="addActivityBtn">
                    <span>+</span> Add More Activities
                  </button>

                  <h3 class="section-title">What's Included</h3>
                  <div class="list-container" id="includedList">
                    <div class="list-item">
                      <input type="text" placeholder="Enter included item" />
                      <button type="button" class="btn remove-btn">
                        Remove
                      </button>
                    </div>
                  </div>
                  <button type="button" class="btn add-btn" id="addIncludedBtn">
                    <span>+</span> Add More
                  </button>

                  <h3 class="section-title">What's Excluded</h3>
                  <div class="list-container" id="excludedList">
                    <div class="list-item">
                      <input type="text" placeholder="Enter excluded item" />
                      <button type="button" class="btn remove-btn">
                        Remove
                      </button>
                    </div>
                  </div>
                  <button type="button" class="btn add-btn" id="addExcludedBtn">
                    <span>+</span> Add More
                  </button>

                  <h3 class="section-title">What to Bring</h3>
                  <div class="list-container" id="bringList">
                    <div class="list-item">
                      <input type="text" placeholder="Enter item to bring" />
                      <button type="button" class="btn remove-btn">
                        Remove
                      </button>
                    </div>
                  </div>
                  <button type="button" class="btn add-btn" id="addBringBtn">
                    <span>+</span> Add More
                  </button>

                  <h3 class="section-title">Why Attend</h3>
                  <textarea
                    id="whyAttend"
                    name="whyAttend"
                    placeholder="Enter reasons why people should attend this tour"
                  ></textarea>

                  <button type="submit" class="submit-btn">Create Tour</button>
                </form>
              </div>

              <div class="table-section" id="tableSection">
                <?php
                require_once '../config/database.php';

                // Prepare the query
                $query = "SELECT t.tour_id, t.title, t.category, t.days_count, 
                          COUNT(DISTINCT td.day_id) as total_days,
                          COUNT(DISTINCT th.highlight_id) as total_highlights
                          FROM tours t
                          LEFT JOIN tour_days td ON t.tour_id = td.tour_id
                          LEFT JOIN tour_highlights th ON t.tour_id = th.tour_id
                          GROUP BY t.tour_id
                          ORDER BY t.created_at DESC";

                try {
                    $stmt = $pdo->query($query);
                    ?>
                    <div class="table-container">
                        <table class="tours-table">
                            <thead>
                                <tr>
                                    <th>Title</th>
                                    <th>Category</th>
                                    <th>Activities</th>
                                    <th>Highlights</th>
                                    <th>Actions</th>
                                </tr>
                            </thead>
                            <tbody>
                                <?php while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) { ?>
                                    <tr data-id="<?php echo htmlspecialchars($row['tour_id']); ?>">
                                        <td><?php echo htmlspecialchars($row['title']); ?></td>
                                        <td><?php echo htmlspecialchars($row['category']); ?></td>
                                        <td><?php echo htmlspecialchars($row['total_days']); ?></td>
                                        <td><?php echo htmlspecialchars($row['total_highlights']); ?></td>
                                        <td class="actions">
                                            <button class="edit-btn" onclick="editTour(<?php echo $row['tour_id']; ?>)">
                                                <i class="fas fa-edit"></i>
                                            </button>
                                            <form method="POST" style="display: inline;" onsubmit="return confirm('Are you sure you want to delete this tour? This action cannot be undone.');">
                                                <input type="hidden" name="delete_tour" value="1">
                                                <input type="hidden" name="tour_id" value="<?php echo $row['tour_id']; ?>">
                                                <button type="submit" class="delete-btn">
                                                    <i class="fas fa-trash"></i>
                                                </button>
                                            </form>
                                        </td>
                                    </tr>
                                <?php } ?>
                            </tbody>
                        </table>
                    </div>
                    <?php
                } catch(PDOException $e) {
                    echo "<p class='error-message'>Error loading tours: " . $e->getMessage() . "</p>";
                }
                ?>

                <!-- Add pagination -->
                <div class="pagination">
                    <?php
                    // Get total number of records
                    $countQuery = "SELECT COUNT(*) as total FROM tours";
                    $total = $pdo->query($countQuery)->fetch()['total'];
                    $perPage = 10;
                    $totalPages = ceil($total / $perPage);
                    $currentPage = isset($_GET['page']) ? (int)$_GET['page'] : 1;

                    // Generate pagination links
                    if ($totalPages > 1) {
                        if ($currentPage > 1) {
                            echo '<button class="page-btn" onclick="changePage('.($currentPage-1).')"><i class="fas fa-chevron-left"></i></button>';
                        }

                        for ($i = 1; $i <= $totalPages; $i++) {
                            if ($i == $currentPage) {
                                echo '<button class="page-btn active">'.$i.'</button>';
                            } else {
                                echo '<button class="page-btn" onclick="changePage('.$i.')">'.$i.'</button>';
                            }
                        }

                        if ($currentPage < $totalPages) {
                            echo '<button class="page-btn" onclick="changePage('.($currentPage+1).')"><i class="fas fa-chevron-right"></i></button>';
                        }
                    }
                    ?>
                </div>
              </div>

              <script>
                // Global function definitions (outside DOMContentLoaded)
                function setupListControls(addBtnId, listId) {
                  const addBtn = document.getElementById(addBtnId);
                  const list = document.getElementById(listId);

                  if (!addBtn || !list) return;

                  // Remove existing event listeners to prevent duplicates
                  const newAddBtn = addBtn.cloneNode(true);
                  addBtn.parentNode.replaceChild(newAddBtn, addBtn);

                  // Add new item
                  newAddBtn.addEventListener("click", function () {
                    const newItem = document.createElement("div");
                    newItem.className = "list-item";
                    newItem.innerHTML = `
                        <input type="text" placeholder="Enter item">
                        <button type="button" class="btn remove-btn">Remove</button>
                    `;
                    list.appendChild(newItem);

                    // Setup remove button for the new item
                    const removeBtn = newItem.querySelector(".remove-btn");
                    removeBtn.addEventListener("click", function () {
                      list.removeChild(newItem);
                    });
                  });

                  // Setup existing remove buttons
                  const removeButtons = list.querySelectorAll(".remove-btn");
                  removeButtons.forEach((btn) => {
                    // Remove existing listeners and add new ones
                    const newBtn = btn.cloneNode(true);
                    btn.parentNode.replaceChild(newBtn, btn);

                    newBtn.addEventListener("click", function () {
                      const item = this.parentElement;
                      list.removeChild(item);
                    });
                  });
                }

                document.addEventListener("DOMContentLoaded", function () {
                  const addTourBtn = document.querySelector(".add-tour-btn");
                  const addTourForm = document.getElementById("addTourForm");
                  const tableSection = document.getElementById("tableSection");
                  const tourForm = document.getElementById("tourForm");
                  const btnText = addTourBtn.querySelector(".btn-text");

                  function resetFormToAddMode() {
                    // Reset form
                    document.getElementById('tourForm').reset();

                    // Remove edit mode hidden inputs
                    const existingHiddenInputs = document.querySelectorAll('input[name="tour_id"], input[name="update_tour"]');
                    existingHiddenInputs.forEach(input => input.remove());

                    // Reset form title and button
                    document.querySelector('.form-title').textContent = 'Add New Tour';
                    document.querySelector('.submit-btn').textContent = 'Create Tour';

                    // Reset image previews
                    document.getElementById('coverPreview').innerHTML = 'Cover Image Preview';
                    for (let i = 1; i <= 4; i++) {
                        document.getElementById(`highlight${i}Preview`).innerHTML = `Highlight ${i}`;
                    }

                    // Reset activities to default
                    const daysContainer = document.getElementById('daysContainer');
                    daysContainer.innerHTML = `
                        <div class="day-container">
                            <h4 class="day-title">Activity 1</h4>
                            <div class="form-group">
                                <label for="day1Title">Activity Title</label>
                                <input type="text"
                                       id="day1Title"
                                       name="day1Title"
                                       placeholder="Enter title for activity"
                                       required>
                            </div>
                            <div class="form-group">
                                <label for="day1Desc">Activity Description</label>
                                <textarea id="day1Desc"
                                         name="day1Desc"
                                         placeholder="Describe the activity"
                                         required></textarea>
                            </div>
                        </div>
                    `;
                    window.activityCount = 1;

                    // Reset lists to default
                    const lists = ['includedList', 'excludedList', 'bringList'];
                    const placeholders = ['Enter included item', 'Enter excluded item', 'Enter item to bring'];

                    lists.forEach((listId, index) => {
                        const list = document.getElementById(listId);
                        list.innerHTML = `
                            <div class="list-item">
                                <input type="text" placeholder="${placeholders[index]}">
                                <button type="button" class="btn remove-btn">Remove</button>
                            </div>
                        `;
                    });

                    // Re-setup list controls
                    setupListControls("addIncludedBtn", "includedList");
                    setupListControls("addExcludedBtn", "excludedList");
                    setupListControls("addBringBtn", "bringList");
                  }

                  function toggleFormAndTable() {
                    addTourForm.classList.toggle("active");
                    tableSection.classList.toggle("hidden");

                    // Toggle button state and text
                    if (addTourBtn.dataset.state === "add") {
                      addTourBtn.dataset.state = "close";
                      btnText.textContent = "Close Form";
                    } else {
                      addTourBtn.dataset.state = "add";
                      btnText.textContent = "Add New Tour";
                      // Reset form when closing
                      resetFormToAddMode();
                    }
                  }

                  // Toggle form visibility when Add Tour button is clicked
                  addTourBtn.addEventListener("click", toggleFormAndTable);

                  // Handle image preview functionality
                  function setupImagePreview(inputId, previewId) {
                    const input = document.getElementById(inputId);
                    const preview = document.getElementById(previewId);

                    input.addEventListener("change", function () {
                      const file = this.files[0];
                      if (file) {
                        const reader = new FileReader();
                        reader.onload = function (e) {
                          preview.innerHTML = `<img src="${e.target.result}" alt="Preview">`;
                        };
                        reader.readAsDataURL(file);
                      }
                    });
                  }

                  // Setup image previews
                  setupImagePreview("coverImage", "coverPreview");
                  setupImagePreview("highlight1", "highlight1Preview");
                  setupImagePreview("highlight2", "highlight2Preview");
                  setupImagePreview("highlight3", "highlight3Preview");
                  setupImagePreview("highlight4", "highlight4Preview");

                  // Modified add activity button handler
                  const addActivityBtn = document.getElementById("addActivityBtn");
                  window.activityCount = 1; // Make it global so editTour can access it

                  addActivityBtn.addEventListener("click", function() {
                    window.activityCount++;
                    const dayDiv = document.createElement('div');
                    dayDiv.className = 'day-container';

                    dayDiv.innerHTML = `
                      <div class="day-header">
                        <h4 class="day-title">Activity ${window.activityCount}</h4>
                        <button type="button" class="btn remove-btn remove-activity">
                          <i class="fas fa-times"></i>
                        </button>
                      </div>
                      <div class="form-group">
                        <label for="day${window.activityCount}Title">Activity Title</label>
                        <input type="text"
                               id="day${window.activityCount}Title"
                               name="day${window.activityCount}Title"
                               placeholder="Enter title for activity"
                               required>
                      </div>
                      <div class="form-group">
                        <label for="day${window.activityCount}Desc">Activity Description</label>
                        <textarea id="day${window.activityCount}Desc"
                                 name="day${window.activityCount}Desc"
                                 placeholder="Describe the activity"
                                 required></textarea>
                      </div>
                    `;

                    document.getElementById('daysContainer').appendChild(dayDiv);
                  });

                  // Add event delegation for removing activities
                  document.getElementById('daysContainer').addEventListener('click', function(e) {
                    if (e.target.closest('.remove-activity')) {
                        const dayContainer = e.target.closest('.day-container');
                        if (dayContainer) {
                            dayContainer.remove();
                            
                            // Renumber the remaining activities
                            const remainingDays = document.querySelectorAll('.day-container');
                            remainingDays.forEach((day, index) => {
                                const dayTitle = day.querySelector('.day-title');
                                const titleInput = day.querySelector('input[name$="Title"]');
                                const descInput = day.querySelector('textarea[name$="Desc"]');
                                
                                dayTitle.textContent = `Activity ${index + 1}`;
                                if (titleInput) {
                                    titleInput.id = `day${index + 1}Title`;
                                    titleInput.name = `day${index + 1}Title`;
                                }
                                if (descInput) {
                                    descInput.id = `day${index + 1}Desc`;
                                    descInput.name = `day${index + 1}Desc`;
                                }
                            });
                            
                            // Update activity counter
                            window.activityCount = remainingDays.length;
                        }
                    }
                  });

                  // Handle add/remove functionality for list items - using global function

                  // Setup list controls
                  setupListControls("addIncludedBtn", "includedList");
                  setupListControls("addExcludedBtn", "excludedList");
                  setupListControls("addBringBtn", "bringList");

                  // Modified form submission handler to collect activities
                  tourForm.addEventListener("submit", function (e) {
                    e.preventDefault();
                    
                    // Collect all activities
                    const activities = [];
                    const dayContainers = document.querySelectorAll('.day-container');
                    dayContainers.forEach((container, index) => {
                      const titleInput = container.querySelector('input[name$="Title"]');
                      const descInput = container.querySelector('textarea[name$="Desc"]');
                      if (titleInput && descInput) {
                        activities.push({
                          day_number: index + 1,
                          title: titleInput.value,
                          description: descInput.value
                        });
                      }
                    });

                    // Add activities to form data
                    const activitiesInput = document.createElement('input');
                    activitiesInput.type = 'hidden';
                    activitiesInput.name = 'activities';
                    activitiesInput.value = JSON.stringify(activities);
                    this.appendChild(activitiesInput);

                    // Collect other form data as before
                    const includedItems = Array.from(document.querySelectorAll('#includedList input')).map(input => input.value);
                    const excludedItems = Array.from(document.querySelectorAll('#excludedList input')).map(input => input.value);
                    const toBringItems = Array.from(document.querySelectorAll('#bringList input')).map(input => input.value);

                    // Create hidden inputs for the lists
                    let hiddenInput = document.createElement('input');
                    hiddenInput.type = 'hidden';
                    hiddenInput.name = 'includedItems';
                    hiddenInput.value = JSON.stringify(includedItems.filter(Boolean));
                    this.appendChild(hiddenInput);

                    hiddenInput = document.createElement('input');
                    hiddenInput.type = 'hidden';
                    hiddenInput.name = 'excludedItems';
                    hiddenInput.value = JSON.stringify(excludedItems.filter(Boolean));
                    this.appendChild(hiddenInput);

                    hiddenInput = document.createElement('input');
                    hiddenInput.type = 'hidden';
                    hiddenInput.name = 'toBringItems';
                    hiddenInput.value = JSON.stringify(toBringItems.filter(Boolean));
                    this.appendChild(hiddenInput);

                    // Submit the form
                    this.submit();
                  });

                  // ...rest of existing code...
                });

                function editTour(tourId) {
                    // Clear previous form data and reset form state
                    const form = document.getElementById('tourForm');
                    form.reset();

                    // Remove any existing hidden inputs for edit mode
                    const existingHiddenInputs = form.querySelectorAll('input[name="tour_id"], input[name="update_tour"]');
                    existingHiddenInputs.forEach(input => input.remove());

                    // Reset image previews
                    document.getElementById('coverPreview').innerHTML = 'Cover Image Preview';
                    for (let i = 1; i <= 4; i++) {
                        document.getElementById(`highlight${i}Preview`).innerHTML = `Highlight ${i}`;
                    }

                    fetch(`?fetch_tour=1&id=${tourId}`)
                        .then(response => {
                            console.log('Response status:', response.status);
                            if (!response.ok) {
                                throw new Error(`HTTP error! status: ${response.status}`);
                            }
                            return response.json();
                        })
                        .then(result => {
                            console.log('Fetched data:', result); // Debug log
                            if (result.success) {
                                const data = result.data;

                                // Populate main fields with proper error handling
                                const fields = [
                                    { id: 'tourTitle', value: data.title },
                                    { id: 'tourCategory', value: data.category },
                                    { id: 'tourCountry', value: data.country },
                                    { id: 'tourDays', value: data.days_count },
                                    { id: 'tourDesc', value: data.short_description },
                                    { id: 'whyAttend', value: data.why_attend }
                                ];

                                fields.forEach(field => {
                                    const element = document.getElementById(field.id);
                                    if (element) {
                                        element.value = field.value || '';
                                    }
                                });

                                // Show existing cover image
                                if (data.cover_image_path) {
                                    document.getElementById('coverPreview').innerHTML =
                                        `<img src="../../${data.cover_image_path}" alt="Cover Image">`;
                                }

                                // Reset highlight previews and show existing images
                                if (data.highlights && data.highlights.length > 0) {
                                    data.highlights.forEach((highlight, index) => {
                                        const previewElem = document.getElementById(`highlight${index + 1}Preview`);
                                        if (previewElem && highlight.image_path) {
                                            previewElem.innerHTML = `<img src="../../${highlight.image_path}" alt="Highlight ${index + 1}">`;
                                        }
                                    });
                                }

                                // Clear and populate included items
                                const includedList = document.getElementById('includedList');
                                includedList.innerHTML = '';
                                if (data.included && data.included.length > 0) {
                                    data.included.forEach(item => {
                                        const div = document.createElement('div');
                                        div.className = 'list-item';
                                        div.innerHTML = `
                                            <input type="text" value="${(item.item_description || '').replace(/"/g, '&quot;')}">
                                            <button type="button" class="btn remove-btn">Remove</button>
                                        `;
                                        includedList.appendChild(div);
                                    });
                                } else {
                                    // Add default empty item if no data
                                    const div = document.createElement('div');
                                    div.className = 'list-item';
                                    div.innerHTML = `
                                        <input type="text" placeholder="Enter included item">
                                        <button type="button" class="btn remove-btn">Remove</button>
                                    `;
                                    includedList.appendChild(div);
                                }

                                // Clear and populate excluded items
                                const excludedList = document.getElementById('excludedList');
                                excludedList.innerHTML = '';
                                if (data.excluded && data.excluded.length > 0) {
                                    data.excluded.forEach(item => {
                                        const div = document.createElement('div');
                                        div.className = 'list-item';
                                        div.innerHTML = `
                                            <input type="text" value="${(item.item_description || '').replace(/"/g, '&quot;')}">
                                            <button type="button" class="btn remove-btn">Remove</button>
                                        `;
                                        excludedList.appendChild(div);
                                    });
                                } else {
                                    // Add default empty item if no data
                                    const div = document.createElement('div');
                                    div.className = 'list-item';
                                    div.innerHTML = `
                                        <input type="text" placeholder="Enter excluded item">
                                        <button type="button" class="btn remove-btn">Remove</button>
                                    `;
                                    excludedList.appendChild(div);
                                }

                                // Clear and populate to bring items
                                const bringList = document.getElementById('bringList');
                                bringList.innerHTML = '';
                                if (data.to_bring && data.to_bring.length > 0) {
                                    data.to_bring.forEach(item => {
                                        const div = document.createElement('div');
                                        div.className = 'list-item';
                                        div.innerHTML = `
                                            <input type="text" value="${(item.item_description || '').replace(/"/g, '&quot;')}">
                                            <button type="button" class="btn remove-btn">Remove</button>
                                        `;
                                        bringList.appendChild(div);
                                    });
                                } else {
                                    // Add default empty item if no data
                                    const div = document.createElement('div');
                                    div.className = 'list-item';
                                    div.innerHTML = `
                                        <input type="text" placeholder="Enter item to bring">
                                        <button type="button" class="btn remove-btn">Remove</button>
                                    `;
                                    bringList.appendChild(div);
                                }

                                // Populate activities
                                const daysContainer = document.getElementById('daysContainer');
                                daysContainer.innerHTML = '';
                                if (data.days && data.days.length > 0) {
                                    data.days.forEach((day, index) => {
                                        const dayDiv = document.createElement('div');
                                        dayDiv.className = 'day-container';
                                        const removeButton = index === 0 ? '' : `
                                            <button type="button" class="btn remove-btn remove-activity">
                                                <i class="fas fa-times"></i>
                                            </button>
                                        `;
                                        dayDiv.innerHTML = `
                                            <div class="day-header">
                                                <h4 class="day-title">Activity ${index + 1}</h4>
                                                ${removeButton}
                                            </div>
                                            <div class="form-group">
                                                <label for="day${index + 1}Title">Activity Title</label>
                                                <input type="text"
                                                       id="day${index + 1}Title"
                                                       name="day${index + 1}Title"
                                                       value="${(day.day_title || '').replace(/"/g, '&quot;')}"
                                                       placeholder="Enter title for activity"
                                                       required>
                                            </div>
                                            <div class="form-group">
                                                <label for="day${index + 1}Desc">Activity Description</label>
                                                <textarea id="day${index + 1}Desc"
                                                          name="day${index + 1}Desc"
                                                          placeholder="Describe the activity"
                                                          required>${(day.day_description || '').replace(/</g, '&lt;').replace(/>/g, '&gt;')}</textarea>
                                            </div>
                                        `;
                                        daysContainer.appendChild(dayDiv);
                                    });
                                    // Update activity counter
                                    window.activityCount = data.days.length;
                                } else {
                                    // Add default activity if no data
                                    const dayDiv = document.createElement('div');
                                    dayDiv.className = 'day-container';
                                    dayDiv.innerHTML = `
                                        <h4 class="day-title">Activity 1</h4>
                                        <div class="form-group">
                                            <label for="day1Title">Activity Title</label>
                                            <input type="text"
                                                   id="day1Title"
                                                   name="day1Title"
                                                   placeholder="Enter title for activity"
                                                   required>
                                        </div>
                                        <div class="form-group">
                                            <label for="day1Desc">Activity Description</label>
                                            <textarea id="day1Desc"
                                                     name="day1Desc"
                                                     placeholder="Describe the activity"
                                                     required></textarea>
                                        </div>
                                    `;
                                    daysContainer.appendChild(dayDiv);
                                    window.activityCount = 1;
                                }

                                // Show form and hide table
                                document.getElementById('addTourForm').classList.add('active');
                                document.getElementById('tableSection').classList.add('hidden');

                                // Update form state
                                document.querySelector('.form-title').textContent = 'Edit Tour';
                                document.querySelector('.submit-btn').textContent = 'Update Tour';

                                // Update button state
                                const addTourBtn = document.querySelector('.add-tour-btn');
                                const btnText = addTourBtn.querySelector('.btn-text');
                                addTourBtn.dataset.state = 'close';
                                btnText.textContent = 'Close Form';

                                // Add hidden inputs for edit mode
                                const form = document.getElementById('tourForm');
                                const hiddenInputs = `
                                    <input type="hidden" name="tour_id" value="${tourId}">
                                    <input type="hidden" name="update_tour" value="1">
                                `;
                                form.insertAdjacentHTML('beforeend', hiddenInputs);

                                // Setup list controls again
                                setupListControls("addIncludedBtn", "includedList");
                                setupListControls("addExcludedBtn", "excludedList");
                                setupListControls("addBringBtn", "bringList");
                            } else {
                                console.error('Error:', result.message);
                                alert('Error fetching tour data: ' + result.message);
                            }
                        })
                        .catch(error => {
                            console.error('Error:', error);
                            alert('Error fetching tour data: ' + error.message);
                        });
                }

                // Add event listener for remove buttons
                document.addEventListener('click', function(e) {
                    if (e.target.classList.contains('remove-btn')) {
                        e.target.closest('.list-item').remove();
                    }
                });

              function changePage(page) {
                  window.location.href = `?page=${page}`;
              }
              </script>
              <?php if (isset($success_message)): ?>
                <div class="alert alert-success">
                    <?php echo htmlspecialchars($success_message); ?>
                </div>
              <?php endif; ?>

              <?php if (isset($error_message)): ?>
                <div class="alert alert-danger">
                    <?php echo htmlspecialchars($error_message); ?>
                </div>
              <?php endif; ?>
          </div>
        </div>
      </main>
    </div>
  </body>
</html>