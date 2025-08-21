# Team Management System

A comprehensive team member management system for the Virunga Ecotours Community Admin Panel.

## Features

### Main Management Page (`index.php`)
- **Grid View**: Beautiful card-based layout displaying team members
- **Search & Filter**: Search by name, title, or bio; filter by status
- **Bulk Actions**: Activate, deactivate, or delete multiple members at once
- **Statistics Dashboard**: Overview of total, active, and inactive members
- **Pagination**: Efficient handling of large team lists
- **Responsive Design**: Works perfectly on desktop, tablet, and mobile

### Add Team Member (`create.php`)
- **Complete Profile Form**: Name, title, bio, contact information
- **Image Upload**: Profile photo with validation and preview
- **Social Media Links**: Facebook, Twitter, LinkedIn, Instagram
- **Order Management**: Set display position for team ordering
- **Status Control**: Set as active or inactive
- **Form Validation**: Client-side and server-side validation

### Edit Team Member (`edit.php`)
- **Pre-populated Form**: All existing data loaded for editing
- **Image Management**: Replace or remove existing profile photos
- **Order Position**: Update display order
- **Status Updates**: Change between active/inactive
- **Validation**: Comprehensive validation on all fields

### Data Export (`export.php`)
- **CSV Export**: Download complete team data as CSV file
- **Timestamped Files**: Automatic filename with date/time
- **Complete Data**: All fields including social media links

## File Structure

```
community/admin/team/
├── index.php              # Main management page
├── create.php             # Add new team member
├── edit.php               # Edit existing team member
├── export.php             # Export team data to CSV
├── handlers/              # Form processing handlers
│   ├── create-handler.php # Process new team member creation
│   ├── update-handler.php # Process team member updates
│   └── delete-handler.php # Process team member deletion
└── README.md              # This documentation file

community/assets/images/team/  # Team member photos storage
├── default-avatar.svg         # Default placeholder image
└── [uploaded images]          # User uploaded team photos
```

## Database Integration

Uses the existing `community_team` table with the following fields:
- `id` - Primary key
- `name` - Team member full name
- `title` - Job title/position
- `bio` - Biography/description
- `image` - Profile photo filename
- `email` - Email address
- `phone` - Phone number
- `facebook` - Facebook profile URL
- `twitter` - Twitter profile URL
- `linkedin` - LinkedIn profile URL
- `instagram` - Instagram profile URL
- `order_position` - Display order (lower numbers first)
- `status` - active/inactive
- `created_at` - Creation timestamp
- `updated_at` - Last update timestamp

## Security Features

- **Session Validation**: All pages check for valid admin login
- **Input Sanitization**: All user inputs are properly sanitized
- **File Upload Security**: Image validation and secure file handling
- **SQL Injection Prevention**: Prepared statements for all database queries
- **CSRF Protection**: Form tokens and proper request validation
- **Access Control**: Admin-only access with role verification

## Image Handling

- **Supported Formats**: JPG, JPEG, PNG, GIF, WebP
- **File Size Limit**: Maximum 2MB per image
- **Automatic Naming**: Unique filenames to prevent conflicts
- **Image Validation**: Server-side validation of image files
- **Default Avatar**: SVG placeholder for members without photos
- **Cleanup**: Automatic deletion of old images when updated/removed

## Responsive Design

- **Mobile-First**: Optimized for mobile devices
- **Tablet Support**: Perfect layout for tablet screens
- **Desktop Enhanced**: Full-featured desktop experience
- **Touch-Friendly**: Large buttons and touch targets
- **Accessible**: Proper ARIA labels and keyboard navigation

## Usage Instructions

1. **Access the System**: Navigate to `/community/admin/team/` in your admin panel
2. **Add Team Members**: Click "Add Team Member" and fill out the form
3. **Manage Existing**: Use the grid view to edit, delete, or change status
4. **Bulk Operations**: Select multiple members for bulk actions
5. **Export Data**: Use the export button to download team data
6. **Search & Filter**: Use the filters to find specific team members

## Integration with Main Site

The team management system integrates seamlessly with:
- Community about page (`community/about.php`)
- Main website team sections
- Admin dashboard statistics
- Navigation sidebar

## Technical Requirements

- PHP 7.4 or higher
- MySQL 5.7 or higher
- GD extension for image processing
- Modern web browser with JavaScript enabled

## Customization

The system is built with CSS custom properties (variables) for easy theming:
- Colors can be modified in `css/earthy-theme.css`
- Layout adjustments in component-specific CSS
- Form styling in `assets/css/forms.css`
- Management-specific styles in `assets/css/management.css`

## Support

For technical support or feature requests, contact the development team.
