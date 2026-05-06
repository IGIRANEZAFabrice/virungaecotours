# Gala Dinner Management System

## Overview
This module manages the Gala Local Dinner & Culture Experience page content. It provides an admin interface to edit and manage all content displayed on the public-facing gala dinner page.

## Features

### 1. Hero Section Management (`edit-hero.php`)
- Edit hero title, subtitle, and description
- Manage introduction text
- Edit activities section title and introduction
- Edit dinner section title and content
- Edit final section title and content

### 2. Activities Management (`edit-activities.php`)
- Add new afternoon cultural activities
- Edit existing activities
- Delete activities
- Manage activity order
- Upload activity images

### 3. Importance Cards Management (`edit-importance.php`)
- Add new importance/impact cards
- Edit existing cards
- Delete cards
- Manage card order
- Select Font Awesome icons for each card

## Database Tables

### gala_hero
Stores the main content sections:
- `hero_title` - Main hero title
- `hero_subtitle` - Hero subtitle
- `hero_description` - Hero description text
- `intro_text` - Introduction paragraph
- `activities_title` - Activities section title
- `activities_intro` - Activities introduction text
- `dinner_title` - Dinner section title
- `dinner_text` - Dinner section content
- `final_title` - Final section title
- `final_text` - Final section content

### gala_activities
Stores afternoon activities:
- `activity_title` - Activity name
- `activity_description` - Activity description
- `activity_image` - Image path
- `display_order` - Display order (1, 2, 3, etc.)

### gala_importance
Stores importance/impact cards:
- `importance_title` - Card title
- `importance_icon` - Font Awesome icon class (e.g., "fas fa-heart")
- `importance_description` - Card description
- `display_order` - Display order

## Setup Instructions

1. **Database Setup**
   - Run the setup script: `community/setup/gala_setup.php`
   - This will create all necessary tables and insert default data

2. **Access Admin Panel**
   - Navigate to: `/community/admin/gala/`
   - You must be logged in as a community admin

3. **Edit Content**
   - Click on the respective cards to edit hero, activities, or importance cards
   - Changes are saved immediately to the database

## Frontend Integration

The public-facing page (`community/galadinner.php`) automatically fetches content from the database:
- All text content is pulled from `gala_hero` table
- Activities are dynamically generated from `gala_activities` table
- Importance cards are dynamically generated from `gala_importance` table

## File Structure

```
community/admin/gala/
├── index.php              # Main dashboard
├── edit-hero.php          # Hero section editor
├── edit-activities.php    # Activities manager
├── edit-importance.php    # Importance cards manager
└── README.md              # This file
```

## Icon Classes

For importance cards, use Font Awesome icon classes:
- `fas fa-scroll` - Cultural Preservation
- `fas fa-coins` - Economic Empowerment
- `fas fa-heart` - Community Pride
- `fas fa-globe` - Traveler Enrichment
- `fas fa-handshake` - Mutual Understanding

See [Font Awesome Icons](https://fontawesome.com/icons) for more options.

## Image Paths

Activity images should be stored in: `community/images/gala/`

Example paths:
- `../images/gala/1.jpg`
- `../images/gala/2.jpg`
- `../images/gala/3.jpg`
- `../images/gala/5.jpg`

## Troubleshooting

### Tables not created
- Ensure the database connection is working
- Check that the user has CREATE TABLE permissions
- Run the setup script again

### Images not displaying
- Verify image paths are correct
- Ensure images exist in the specified directory
- Check file permissions

### Content not updating
- Clear browser cache
- Verify you're logged in as admin
- Check database connection

## Support

For issues or questions, contact the development team.

