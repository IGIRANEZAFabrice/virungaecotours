# Gala Dinner Admin Module - Installation Guide

## Quick Start

### Step 1: Initialize Database Tables

Visit this URL in your browser to create the database tables:
```
http://localhost/virungaecotours/community/setup/gala_setup.php
```

You should see a JSON response indicating success:
```json
{
  "success": true,
  "messages": ["Default data inserted successfully!"]
}
```

### Step 2: Access Admin Panel

1. Log in to the Community Admin Panel:
   ```
   http://localhost/virungaecotours/community/admin/
   ```

2. You should now see "Gala Dinner" in the left sidebar menu

3. Click on "Gala Dinner" to access the management dashboard

### Step 3: Manage Content

The Gala Dinner management dashboard has three main sections:

#### Hero Section
- Edit the main title, subtitle, and description
- Manage introduction text
- Edit dinner experience section
- Edit final section content

#### Afternoon Activities
- Add/edit/delete activities
- Manage activity order
- Upload activity images
- Add activity descriptions

#### Why This Matters (Importance Cards)
- Add/edit/delete importance cards
- Select Font Awesome icons
- Manage card order
- Add card descriptions

## Database Schema

### Tables Created

1. **gala_hero** - Main content sections
2. **gala_activities** - Afternoon activities list
3. **gala_importance** - Importance/impact cards

All tables include:
- Auto-incrementing ID
- Timestamps for tracking changes
- UTF-8 character encoding

## File Structure

```
community/
├── admin/
│   └── gala/
│       ├── index.php              # Main dashboard
│       ├── edit-hero.php          # Hero editor
│       ├── edit-activities.php    # Activities manager
│       ├── edit-importance.php    # Importance cards manager
│       ├── README.md              # Documentation
│       └── INSTALLATION.md        # This file
├── galadinner.php                 # Public-facing page (updated)
└── setup/
    └── gala_setup.php             # Database setup script
```

## Frontend Integration

The public page (`community/galadinner.php`) has been updated to:
- Fetch hero content from `gala_hero` table
- Dynamically display activities from `gala_activities` table
- Dynamically display importance cards from `gala_importance` table

All changes made in the admin panel are immediately reflected on the public page.

## Default Content

The setup script inserts default content:

### Hero Section
- Title: "Gala Local Dinner & Culture Experience"
- Subtitle: "in Musanze"
- Full descriptions and introduction text

### Activities (4 default)
1. Village Walk & Farm Visit
2. Crafts Workshop
3. Traditional Music & Dance
4. Storytelling Session

### Importance Cards (5 default)
1. Cultural Preservation
2. Economic Empowerment
3. Community Pride
4. Traveler Enrichment
5. Mutual Understanding

## Troubleshooting

### Issue: "Table already exists" error
**Solution:** The tables already exist. This is normal. You can proceed to use the admin panel.

### Issue: Database connection failed
**Solution:** 
- Verify MySQL is running
- Check database credentials in `admin/config/connection.php`
- Ensure the `virungaecotoursdb` database exists

### Issue: Admin panel not showing Gala Dinner menu
**Solution:**
- Clear browser cache
- Log out and log back in
- Verify you're logged in as a community admin

### Issue: Images not displaying
**Solution:**
- Ensure images exist in `community/images/gala/` directory
- Use correct relative paths (e.g., `../images/gala/1.jpg`)
- Check file permissions

## Security Notes

- All user input is escaped using `htmlspecialchars()` and `mysqli_real_escape_string()`
- Admin authentication is required to access the management panel
- Database queries use proper escaping to prevent SQL injection

## Support

For issues or questions:
1. Check the README.md file for detailed documentation
2. Verify database tables exist: `SHOW TABLES LIKE 'gala%';`
3. Check error logs in the browser console

## Next Steps

1. ✅ Initialize database tables
2. ✅ Access admin panel
3. ✅ Edit hero section content
4. ✅ Add/manage activities
5. ✅ Add/manage importance cards
6. ✅ View changes on public page

Enjoy managing your Gala Dinner content!

