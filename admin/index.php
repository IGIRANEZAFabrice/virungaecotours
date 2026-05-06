<?php 

session_start();

if (!isset($_SESSION['admin_id'])) {
    header("Location: pages/login.html");
    exit();
}

// Include database connection - make sure this path is correct
require_once './config/connection.php';

// Fetch admin data
$admin_id = $_SESSION['admin_id'];
$sql = "SELECT first_name, last_name, profile_image FROM admins WHERE admin_id = ?";
$stmt = $conn->prepare($sql);
$stmt->bind_param("i", $admin_id);
$stmt->execute();
$stmt->bind_result($first_name, $last_name, $profile_image);
$stmt->fetch();
$admin = ['first_name' => $first_name, 'last_name' => $last_name, 'profile_image' => $profile_image];
$stmt->close();

// Fetch recent bookings data
$recentBookingsQuery = "SELECT b.booking_id, b.full_name, t.title as tour_title, 
                              b.travel_date, b.status 
                       FROM tour_bookings b
                       JOIN tours t ON b.tour_id = t.tour_id
                       ORDER BY b.created_at DESC
                       LIMIT 5";
$recentBookingsResult = $conn->query($recentBookingsQuery);
$recentBookings = [];
if ($recentBookingsResult) {
    while ($row = $recentBookingsResult->fetch_assoc()) {
        $recentBookings[] = $row;
    }
}
?>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Dashboard - Virunga Ecotours</title>
    <link
      rel="shortcut icon"
      href="../images/logos/icon.png"
      type="image/x-icon"
    />
    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css"
    />
    <link rel="stylesheet" href="./css/common.css" />
    <link rel="stylesheet" href="./css/dashboard.css" />
    <script src="./js/common.js" defer></script>
  </head>
  <body>
    <div class="admin-container">
      <!-- Include sidebar template -->
      <aside class="sidebar">
        <div class="sidebar-header">
          <div class="logo">
            <img src="./images/icon.png" alt="Logo" />
          </div>
          <h2>Admin</h2>
        </div>
        <nav class="sidebar-nav">
          <ul>
            <li class="nav-item">
              <a href="index.php"
                ><i class="fa-solid fa-chart-line"></i> <span>Dashboard</span></a
              >
            </li>
            <li class="nav-item dropdown">
              <a href="#" class="dropdown-toggle">
                <i class="fas fa-house"></i>
                <span>Home</span>
                <i class="fas fa-chevron-down"></i>
              </a>
              <ul class="submenu">
                <li>
                  <a href="./pages/home/hero.php"><i class="fas fa-image"></i> Hero</a>
                </li>
                <li>
                  <a href="./pages/home/destinations.php"
                    ><i class="fas fa-map-marker-alt"></i> Destinations</a
                  >
                </li>
                <li>
                  <a href="./pages/home/attractions.php"
                    ><i class="fas fa-landmark"></i> Attractions</a
                  >
                </li>
                <li>
                  <a href="./pages/home/about.php"
                    ><i class="fas fa-info-circle"></i> About Us</a
                  >
                </li>
                <li>
                    <a href="./pages/home/month.php"
                    ><i class="fas fa-calendar-alt"></i> month</a
                  >
                </li>
                <li>
                  <a href="./pages/home/partners.php"><i class="fas fa-handshake"></i> Partners</a>
                </li>
              </ul>
            </li>
            <li class="nav-item">
              <a href="./pages/tours.php"><i class="fas fa-compass"></i> <span>Tours</span></a>
            </li>
            <li class="nav-item">
              <a href="./pages/about_page_manager.php"><i class="fas fa-users"></i> <span>Aboutus</span></a>
            </li>
            <li class="nav-item">
              <a href="./pages/accommodation/index.php"><i class="fas fa-bed"></i> <span>Accommodation</span></a>
            </li>
            <li class="nav-item">
              <a href="./pages/contact_messages.php"><i class="fas fa-envelope"></i> <span>contact messages</span></a>
            </li>
            <li class="nav-item">
              <a href="./pages/itenary_messages.php"><i class="fas fa-calendar-check"></i> <span>tour bookings</span></a>
            </li>
            <li class="nav-item dropdown">
              <a href="#" class="dropdown-toggle">
                <i class="fas fa-newspaper"></i>
                <span>blogs</span>
                <i class="fas fa-chevron-down"></i>
              </a>
              <ul class="submenu">
                <li>
                    <a href="./pages/blogs.php"><i class="fas fa-book"></i> blogs</a>
                </li>
                <li>
                  <a href="./pages/blog_comments.php"
                    ><i class="fas fa-route"></i> blog comments</a
                  >
                </li>
              </ul>
            </li>
            <li class="nav-item">
              <a href="./pages/faqs.php"><i class="fas fa-circle-question"></i> <span>Faqs</span></a>
            </li>
            <li class="nav-item">
              <a href="./pages/buildmessage.php"><i class="fas fa-map-marked-alt"></i> <span>Costom Trip</span></a>
            </li>
            <li class="nav-item">
              <a href="./pages/subscribers.php"><i class="fas fa-users"></i> <span>Subscribers</span></a>
            </li>
            <li class="nav-item">
              <a href="./pages/profile.php"><i class="fas fa-user-gear"></i> <span>Settings</span></a>
            </li>
            <li class="nav-item">
              <a href="./pages/gallery.php"><i class="fas fa-images"></i> <span>Gallery</span></a>
            </li>
            <li class="nav-item">
              <a href="./pages/styleguides.php"><i class="fas fa-map"></i> <span>Style Guides</span></a>
            </li>
          </ul>
        </nav>
        <div class="sidebar-footer">
          <a href="../index.php" class="view-site" target="_blank"
            ><i class="fas fa-globe"></i> <span>View Website</span></a
          >
          <a href="./pages/logout.html" class="logout"
            ><i class="fas fa-sign-out-alt"></i> <span>Logout</span></a
          >
        </div>
      </aside>

      <main class="main-content">
        <!-- Top Header -->
        <header class="top-header">
          <button class="sidebar-toggle" id="sidebarToggle">
            <i class="fas fa-bars"></i>
          </button>
          <div class="user-menu">
            <div class="user-profile">
              <img src="<?php 
                // Determine the correct path to the profile image
                if (isset($admin) && !empty($admin['profile_image'])) {
                  // Extract just the filename from the path
                  $img_path = basename($admin['profile_image']);
                  echo "./images/profile/" . $img_path;
                } else {
                  echo "./images/costa-rica.jpg";
                }
              ?>" alt="Admin" />
              <span><?php echo isset($admin) ? htmlspecialchars($admin['first_name'] . ' ' . $admin['last_name']) : 'Admin User'; ?></span>
              <i class="fas fa-chevron-down"></i>
              <!-- Add dropdown menu -->
              <div class="user-dropdown">
                <a href="./pages/profile.php" class="dropdown-item">
                  <i class="fas fa-user"></i>
                  <span>My Profile</span>
                </a>
                <div class="dropdown-divider"></div>
                <a href="./pages/logout.html" class="dropdown-item text-danger">
                  <i class="fas fa-sign-out-alt"></i>
                  <span>Logout</span>
                </a>
              </div>
            </div>
          </div>
        </header>

        <div class="content-panels">
          <!-- Dashboard specific content -->
          <div class="panel active" id="dashboard-panel">
            <div class="panel-header">
              <h1>Dashboard Overview</h1>
              <div class="date-range">
                <i class="fas fa-calendar"></i>
                <span>March 10, 2025 - March 16, 2025</span>
              </div>
            </div>

            <!-- Stats Cards -->
            <div class="stats-cards">
             
              <div class="stat-card">
                <div class="stat-icon">
                  <i class="fas fa-shopping-cart"></i>
                </div>
                <div class="stat-info">
                  <h3>New Bookings</h3>
                  <p class="stat-value">128</p>
                  <p class="stat-change positive">
                    <i class="fas fa-arrow-up"></i> 8.2%
                  </p>
                </div>
              </div>
              <div class="stat-card">
                <div class="stat-icon">
                  <i class="fas fa-money-bill-wave"></i>
                </div>
                <div class="stat-info">
                  <h3>Contact Us</h3>
                  <p class="stat-value">$89,750</p>
                    <p class="stat-change positive">
                    <i class="fas fa-envelope"></i> 15.3%
                    </p>
                </div>
              </div>
              <div class="stat-card">
                <div class="stat-icon">
                  <i class="fas fa-star"></i>
                </div>
                <div class="stat-info">
                  <h3>Custom Trips</h3>
                  <p class="stat-value">4.8/5</p>
                  <p class="stat-change positive">
                    <i class="fas fa-arrow-up"></i> 0.2
                  </p>
                </div>
              </div>
            </div>

            <!-- Recent Activity Section -->
            <div class="recent-section">
              <div class="recent-bookings">
                <div class="section-header">
                  <h3>Recent Bookings</h3>
                  <a href="./pages/itenary_messages.php" class="view-all">View All</a>
                </div>
                <div class="table-container">
                  <table class="data-table">
                    <thead>
                      <tr>
                        <th>ID</th>
                        <th>Customer</th>
                        <th>Tour</th>
                        <th>Date</th>
                        <th>Status</th>
                      </tr>
                    </thead>
                    <tbody>
                      <?php foreach ($recentBookings as $booking): ?>
                      <tr>
                        <td>#BK-<?php echo str_pad($booking['booking_id'], 4, '0', STR_PAD_LEFT); ?></td>
                        <td><?php echo htmlspecialchars($booking['full_name']); ?></td>
                        <td><?php echo htmlspecialchars($booking['tour_title']); ?></td>
                        <td><?php echo date('M d, Y', strtotime($booking['travel_date'])); ?></td>
                        <td><span class="status <?php echo $booking['status']; ?>"><?php echo ucfirst($booking['status']); ?></span></td>
                      </tr>
                      <?php endforeach; ?>
                    </tbody>
                  </table>
                </div>
              </div>
            </div>
          </div>
        </div>
      </main>
    </div>
  </body>
</html>
