# Virunga Ecotours Community Programs Website

A complete, modern, responsive community program website for Virunga Ecotours, promoting eco-tourism and community programs across Rwanda, DRC Congo, and Uganda in the Virunga Massif region.

## 🌟 Features

### Public Website
- **Responsive Design**: Mobile-first design that scales beautifully to desktop
- **Modern UI/UX**: Clean, nature-inspired design with smooth animations
- **Program Showcase**: Display community programs with filtering and search
- **About Us**: Company story, mission, vision, and team profiles
- **Contact System**: Contact form with database storage
- **Testimonials**: Community testimonials and success stories
- **Interactive Elements**: Smooth scrolling, animations, and video modals

### Admin Panel
- **Secure Authentication**: Session-based admin login system
- **Dashboard**: Overview of programs, statistics, and recent activity
- **Program Management**: Full CRUD operations for community programs
- **Team Management**: Manage team member profiles and social links
- **Testimonial Management**: Add and manage community testimonials
- **Message Management**: View and respond to contact form submissions
- **Category Management**: Organize programs by categories
- **File Upload**: Image upload system for programs and team members

## 🛠 Tech Stack

- **Frontend**: HTML5, CSS3, JavaScript (Vanilla)
- **Backend**: PHP (using mysqli, no PDO)
- **Database**: MySQL
- **Icons**: FontAwesome 6.4.0
- **Fonts**: Google Fonts (Poppins)
- **Server**: XAMPP (localhost)

## 📁 Project Structure

```
community/
├── index.php                 # Homepage
├── about.php                 # About us page
├── programs.php              # Programs listing
├── program-detail.php        # Individual program details
├── contact.php               # Contact page
├── assets/
│   ├── css/
│   │   ├── community.css     # Main styles
│   │   ├── programs.css      # Programs page styles
│   │   ├── about.css         # About page styles
│   │   └── contact.css       # Contact page styles
│   ├── js/
│   │   ├── community.js      # Main JavaScript
│   │   ├── programs.js       # Programs functionality
│   │   ├── about.js          # About page scripts
│   │   └── contact.js        # Contact form handling
│   └── images/
│       ├── programs/         # Program images
│       ├── team/             # Team member photos
│       └── testimonials/     # Testimonial photos
├── admin/
│   ├── index.php             # Admin login
│   ├── dashboard.php         # Admin dashboard
│   ├── logout.php            # Logout script
│   ├── includes/
│   │   ├── sidebar.php       # Admin sidebar
│   │   └── topbar.php        # Admin top bar
│   ├── assets/css/
│   │   └── admin.css         # Admin panel styles
│   ├── programs/             # Program management
│   ├── team/                 # Team management
│   ├── testimonials/         # Testimonial management
│   ├── messages/             # Message management
│   └── settings/             # Admin settings
├── database/
│   ├── community_schema.sql  # Database structure
│   └── sample_data.sql       # Sample data
└── setup/
    └── install.php           # Installation script
```

## 🚀 Installation

### Prerequisites
- XAMPP (or similar local server environment)
- PHP 7.4 or higher
- MySQL 5.7 or higher
- Web browser (Chrome, Firefox, Safari, Edge)

### Step 1: Setup XAMPP
1. Download and install XAMPP from [https://www.apachefriends.org/](https://www.apachefriends.org/)
2. Start Apache and MySQL services in XAMPP Control Panel

### Step 2: Database Setup
1. Open phpMyAdmin (http://localhost/phpmyadmin)
2. Create a database named `dmxewbmy_ecodatabase` (or update the name in `admin/config/connection.php`)

### Step 3: File Installation
1. Copy the `community` folder to your XAMPP htdocs directory
2. Ensure the path is: `C:/xampp/htdocs/clone/ecotours/community/`

### Step 4: Run Installation
1. Open your browser and navigate to: `http://localhost/clone/ecotours/community/setup/install.php`
2. Click "Install Community Programs System"
3. Wait for the installation to complete

### Step 5: Access the System
- **Public Website**: `http://localhost/clone/ecotours/community/`
- **Admin Panel**: `http://localhost/clone/ecotours/community/admin/`
- **Default Admin Credentials**:
  - Username: `admin`
  - Password: `admin123`

## 🔧 Configuration

### Database Configuration
Update database settings in `admin/config/connection.php`:
```php
$db_host = 'localhost';
$db_user = 'root';
$db_pass = '';
$db_name = 'dmxewbmy_ecodatabase';
```

### File Permissions
Ensure write permissions for upload directories:
- `community/assets/images/`
- `community/admin/uploads/`

## 📊 Database Tables

- **community_admins**: Admin user accounts
- **community_programs**: Community programs data
- **community_testimonials**: Community testimonials
- **community_team**: Team member profiles
- **community_messages**: Contact form submissions
- **community_categories**: Program categories

## 🎨 Design Features

### Color Palette
- Primary Green: `#2a4858`
- Primary Brown: `#8b7355`
- Accent Sage: `#2a4858ac`
- Accent Terracotta: `#967259`
- Neutral Cream: `#f2e8dc`
- Neutral Light: `#f6f4f0`

### Typography
- Primary Font: Poppins (Google Fonts)
- Fallback: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif

### Responsive Breakpoints
- Mobile: 480px and below
- Tablet: 768px and below
- Desktop: 992px and above

## 🔒 Security Features

- **SQL Injection Protection**: Using `mysqli_real_escape_string()`
- **Session Management**: Secure admin authentication
- **Input Validation**: Client-side and server-side validation
- **File Upload Security**: Restricted file types and sizes
- **XSS Protection**: HTML entity encoding for output

## 📱 Mobile Optimization

- Mobile-first responsive design
- Touch-friendly interface elements
- Optimized images and loading
- Collapsible navigation menu
- Swipe-friendly testimonial slider

## 🚀 Performance Features

- **Lazy Loading**: Images load as needed
- **Optimized CSS**: Minimal and efficient stylesheets
- **JavaScript Optimization**: Vanilla JS for better performance
- **Database Optimization**: Efficient queries with proper indexing

## 🔧 Customization

### Adding New Program Categories
1. Access Admin Panel → Categories
2. Add new category with name, description, and icon
3. Categories will appear in program filters automatically

### Customizing Colors
Update CSS variables in `assets/css/community.css`:
```css
:root {
  --primary-green: #2a4858;
  --accent-terracotta: #967259;
  /* Add your custom colors */
}
```

### Adding New Pages
1. Create new PHP file in community root
2. Include header and footer: `<?php include 'includes/header.php'; ?>`
3. Add navigation link in header.php

## 🐛 Troubleshooting

### Common Issues

**Database Connection Error**
- Check XAMPP MySQL service is running
- Verify database credentials in `connection.php`
- Ensure database exists

**Images Not Loading**
- Check file permissions on upload directories
- Verify image paths in database
- Ensure images exist in correct directories

**Admin Login Issues**
- Use default credentials: admin/admin123
- Check session configuration in PHP
- Clear browser cookies and cache

**Responsive Issues**
- Clear browser cache
- Check CSS file loading
- Verify viewport meta tag

## 📞 Support

For support and questions:
- Email: info@virungaecotours.com
- Phone: +(250) 784 513 435

## 📄 License

© 2025 Virunga Ecotours. All rights reserved.

## 🤝 Contributing

This is a custom project for Virunga Ecotours. For modifications or enhancements, please contact the development team.

---

**Built with ❤️ for the Virunga community**
