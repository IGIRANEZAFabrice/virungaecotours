# Gala Dinner Admin - Quick Reference Guide

## URLs

| Page | URL |
|------|-----|
| Admin Dashboard | `/community/admin/gala/` |
| Hero Editor | `/community/admin/gala/edit-hero.php` |
| Activities Manager | `/community/admin/gala/edit-activities.php` |
| Importance Cards | `/community/admin/gala/edit-importance.php` |
| Public Page | `/community/galadinner.php` |
| Setup Script | `/community/setup/gala_setup.php` |

## Database Tables

| Table | Purpose | Records |
|-------|---------|---------|
| `gala_hero` | Main content sections | 1 |
| `gala_activities` | Afternoon activities | Multiple |
| `gala_importance` | Impact cards | Multiple |

## Admin Operations

### Hero Section
```
1. Go to: /community/admin/gala/
2. Click: "Edit" button on Hero Section card
3. Edit: All text fields
4. Save: Click "Save Changes"
```

### Add Activity
```
1. Go to: /community/admin/gala/edit-activities.php
2. Fill: Title, Description, Image Path
3. Click: "Add Activity"
4. View: Activity appears in list below
```

### Edit Activity
```
1. Go to: /community/admin/gala/edit-activities.php
2. Click: "Edit" button on activity
3. Modify: Fields as needed
4. Click: "Update Activity"
```

### Delete Activity
```
1. Go to: /community/admin/gala/edit-activities.php
2. Click: "Delete" button
3. Confirm: Delete action
```

### Add Importance Card
```
1. Go to: /community/admin/gala/edit-importance.php
2. Fill: Title, Icon Class, Description
3. Click: "Add Card"
4. View: Card appears in list below
```

### Edit Importance Card
```
1. Go to: /community/admin/gala/edit-importance.php
2. Click: "Edit" button on card
3. Modify: Fields as needed
4. Click: "Update Card"
```

### Delete Importance Card
```
1. Go to: /community/admin/gala/edit-importance.php
2. Click: "Delete" button
3. Confirm: Delete action
```

## Common Icon Classes

Use these for importance cards:

| Icon | Class |
|------|-------|
| 📜 Scroll | `fas fa-scroll` |
| 💰 Coins | `fas fa-coins` |
| ❤️ Heart | `fas fa-heart` |
| 🌍 Globe | `fas fa-globe` |
| 🤝 Handshake | `fas fa-handshake` |
| 👥 Users | `fas fa-users` |
| 🎓 Graduation | `fas fa-graduation-cap` |
| 🌱 Leaf | `fas fa-leaf` |
| 🏆 Trophy | `fas fa-trophy` |
| 🎯 Target | `fas fa-bullseye` |

## Image Paths

Store images in: `community/images/gala/`

Example paths:
- `../images/gala/1.jpg`
- `../images/gala/2.jpg`
- `../images/gala/activity-name.jpg`

## Form Fields Reference

### Hero Section Form
- **Hero Title** - Main page title
- **Hero Subtitle** - Subtitle under title
- **Hero Description** - Large description text
- **Introduction Text** - Intro paragraph
- **Activities Title** - "Afternoon Cultural Activities"
- **Activities Introduction** - Intro to activities section
- **Dinner Title** - "The Gala Dinner Experience"
- **Dinner Text** - Dinner section content
- **Final Title** - Final section heading
- **Final Text** - Final section content

### Activity Form
- **Activity Title** - Name of activity
- **Activity Description** - What the activity involves
- **Image Path** - Path to activity image

### Importance Card Form
- **Card Title** - Card heading
- **Font Awesome Icon Class** - Icon to display
- **Card Description** - Card content

## Keyboard Shortcuts

| Action | Shortcut |
|--------|----------|
| Save Form | `Ctrl + Enter` |
| Cancel | `Esc` |
| Delete | `Ctrl + D` |

## Display Order

Activities and importance cards are sorted by `display_order`:
- Lower numbers appear first
- Default: 1, 2, 3, 4, 5...
- Edit directly in database if needed

## Troubleshooting Quick Fixes

| Issue | Fix |
|-------|-----|
| Page won't load | Check if logged in |
| Changes not saving | Check database connection |
| Images not showing | Verify image path and file exists |
| Menu not visible | Clear browser cache, log out/in |
| Database error | Run setup script again |

## File Locations

```
community/
├── admin/gala/
│   ├── index.php
│   ├── edit-hero.php
│   ├── edit-activities.php
│   ├── edit-importance.php
│   └── README.md
├── galadinner.php
└── setup/gala_setup.php
```

## Database Queries

### View all activities
```sql
SELECT * FROM gala_activities ORDER BY display_order;
```

### View all importance cards
```sql
SELECT * FROM gala_importance ORDER BY display_order;
```

### View hero content
```sql
SELECT * FROM gala_hero;
```

### Delete activity
```sql
DELETE FROM gala_activities WHERE id = [ID];
```

## Tips & Tricks

1. **Backup before major changes**: Export database before bulk edits
2. **Use consistent image paths**: Keep all images in `community/images/gala/`
3. **Test on public page**: Always check changes on `/community/galadinner.php`
4. **Keep descriptions concise**: Long text may break layout
5. **Use proper icon classes**: Verify icons exist on Font Awesome
6. **Order matters**: Lower display_order numbers appear first

## Support Resources

- **README.md** - Full documentation
- **INSTALLATION.md** - Setup instructions
- **IMPLEMENTATION_SUMMARY.md** - Technical details
- **Font Awesome Icons** - https://fontawesome.com/icons

## Quick Links

- [Admin Dashboard](http://localhost/virungaecotours/community/admin/gala/)
- [Public Page](http://localhost/virungaecotours/community/galadinner.php)
- [Setup Script](http://localhost/virungaecotours/community/setup/gala_setup.php)

---

**Last Updated**: 2025-10-22
**Version**: 1.0

