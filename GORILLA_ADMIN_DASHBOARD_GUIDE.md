# 🦍 GORILLA PAGE ADMIN DASHBOARD - COMPLETE GUIDE

## 📍 ACCESS THE ADMIN DASHBOARD

**URL:** `http://localhost/virungaecotours/admin/pages/gorilla/dashboard.php`

---

## 🎯 DASHBOARD OVERVIEW

The admin dashboard provides a centralized interface to manage all sections of the gorilla page:

### Main Dashboard Features:
- ✅ **Statistics Overview** - See total families and active sections
- ✅ **Quick Access** - Links to edit each section
- ✅ **Family Count by Country** - Rwanda, Uganda, DRC breakdown
- ✅ **Section Status** - Know which sections are active

---

## 📋 MANAGING EACH SECTION

### 1. **HERO SECTION** 🖼️
**File:** `admin/pages/gorilla/hero.php`

**What you can edit:**
- Hero title
- Hero subtitle
- Background image URL
- Active/Inactive toggle

**Steps:**
1. Click "Edit" on Hero Section card
2. Update title and subtitle
3. Enter background image URL
4. Check "Active" to display on page
5. Click "Save Changes"

**Example:**
```
Title: Mountain Gorillas of the Virunga Massif
Subtitle: Discover the world's most endangered apes
Image: ../images/gorillas/hero-bg.jpg
```

---

### 2. **INTRO SECTION** ℹ️
**File:** `admin/pages/gorilla/intro.php`

**What you can edit:**
- Introduction title
- Description text
- Image URL and caption
- Highlight points (view only)

**Steps:**
1. Click "Edit" on Intro Section card
2. Update title and description
3. Add image URL and caption
4. Check "Active" to display
5. Click "Save Changes"

**Note:** Highlight points are managed in the database. Contact admin to add/edit highlights.

---

### 3. **HISTORY SECTION** 📜
**File:** `admin/pages/gorilla/history.php`

**What you can edit:**
- History title and subtitle
- Timeline events (add/delete)
- Event year, title, and description

**Steps to Edit Section:**
1. Click "Edit" on History Section card
2. Update title and subtitle
3. Click "Save Changes"

**Steps to Add Timeline Event:**
1. Scroll to "Add Timeline Event" section
2. Enter year (e.g., 1902)
3. Enter event title (e.g., Scientific Discovery)
4. Enter event description
5. Click "Add Event"

**Steps to Delete Timeline Event:**
1. Find the event in the timeline list
2. Click "Delete" button
3. Confirm deletion

---

### 4. **HABITAT SECTION** 🌳
**File:** `admin/pages/gorilla/habitat.php`

**What you can edit:**
- Habitat title and subtitle
- View habitat cards (add/delete managed by admin)

**Steps:**
1. Click "Edit" on Habitat Section card
2. Update title and subtitle
3. Check "Active" to display
4. Click "Save Changes"

**Note:** Habitat cards are managed by administrator. Contact admin to add/edit cards.

---

### 5. **CONSERVATION SECTION** 🌿
**File:** `admin/pages/gorilla/conservation.php`

**What you can edit:**
- Conservation title and description
- Conservation benefits (add/delete)
- Benefit title, description, and icon

**Steps to Edit Section:**
1. Click "Edit" on Conservation Section card
2. Update title and description
3. Click "Save Changes"

**Steps to Add Benefit:**
1. Scroll to "Add Conservation Benefit" section
2. Enter benefit title (e.g., Protection)
3. Enter benefit description
4. Enter FontAwesome icon class (e.g., fas fa-shield-alt)
5. Click "Add Benefit"

**Steps to Delete Benefit:**
1. Find the benefit in the list
2. Click "Delete" button
3. Confirm deletion

**FontAwesome Icons:**
- `fas fa-shield-alt` - Protection
- `fas fa-stethoscope` - Healthcare
- `fas fa-school` - Education
- `fas fa-coins` - Money/Revenue
- `fas fa-leaf` - Environment
- `fas fa-users` - Community

---

### 6. **DISCOUNTS SECTION** 💰
**File:** `admin/pages/gorilla/discounts.php`

**What you can edit:**
- Discounts title and subtitle
- Active/Inactive toggle

**Steps:**
1. Click "Edit" on Discounts Section card
2. Update title and subtitle
3. Check "Active" to display
4. Click "Save Changes"

**Note:** Pricing tables are managed in the database. Contact admin for pricing updates.

---

### 7. **GORILLA FAMILIES** 👨‍👩‍👧‍👦
**File:** `admin/pages/gorilla/families.php`

**What you can do:**
- ✅ Add new families
- ✅ Edit family information
- ✅ Delete families
- ✅ Toggle active/inactive status
- ✅ View families by country

**Steps to Add Family:**
1. Click "Manage" on Gorilla Families card
2. Scroll to "Add New Family" section
3. Enter family name (e.g., Susa Group)
4. Select country (Rwanda, Uganda, or DRC)
5. Enter family size (e.g., 27 members)
6. Enter description
7. Enter characteristics (comma-separated, e.g., Playful, Curious, Strong)
8. Check "Active" to display
9. Click "Add Family"

**Steps to Delete Family:**
1. Find the family in the list
2. Click "Delete" button (trash icon)
3. Confirm deletion

**Steps to Toggle Active/Inactive:**
1. Find the family in the list
2. Click the eye icon to toggle visibility
3. Family will be hidden/shown on the page

**Example Family:**
```
Name: Susa Group
Country: Rwanda
Size: 27 members
Description: The Susa group is one of the most habituated gorilla families...
Characteristics: Playful, Curious, Strong, Habituated
```

---

## 🔄 WORKFLOW EXAMPLE

### Adding a New Gorilla Family:

1. **Access Dashboard**
   - Go to: `http://localhost/virungaecotours/admin/pages/gorilla/dashboard.php`

2. **Navigate to Families**
   - Click "Manage" on Gorilla Families card

3. **Add New Family**
   - Scroll to "Add New Family" form
   - Fill in all fields:
     - Family Name: "Umubano Group"
     - Country: "Uganda"
     - Size: "15 members"
     - Description: "A newly habituated family..."
     - Characteristics: "Gentle, Curious, Young"
   - Check "Active"
   - Click "Add Family"

4. **Verify**
   - Family appears in the list
   - Visit gorilla page to see it displayed

---

## 📊 STATISTICS

The dashboard shows:
- **Total Families** - All active families
- **Sections Active** - Number of active sections
- **Rwanda Families** - Count of Rwanda families
- **Uganda Families** - Count of Uganda families

---

## ✅ BEST PRACTICES

1. **Always Check Active Status**
   - Ensure sections are marked "Active" to display on page

2. **Use Descriptive Text**
   - Write clear, engaging descriptions
   - Use proper grammar and spelling

3. **Verify Images**
   - Test image URLs before saving
   - Use relative paths (e.g., ../images/gorillas/...)

4. **Backup Data**
   - Keep backups of important information
   - Note changes made

5. **Test Changes**
   - Visit the gorilla page after making changes
   - Verify sections display correctly

---

## 🆘 TROUBLESHOOTING

### Section Not Displaying?
- ✅ Check if section is marked "Active"
- ✅ Verify database has content
- ✅ Check browser cache (Ctrl+F5)

### Images Not Loading?
- ✅ Verify image URL is correct
- ✅ Check image file exists
- ✅ Use relative paths

### Changes Not Saving?
- ✅ Check for error messages
- ✅ Verify all required fields are filled
- ✅ Check database connection

---

## 📞 SUPPORT

For issues or questions:
1. Check this guide
2. Review error messages
3. Contact your administrator
4. Check database directly

---

## 🎊 SUMMARY

The Gorilla Admin Dashboard provides:
- ✅ Easy management of all page sections
- ✅ Add/edit/delete families
- ✅ Manage timeline events
- ✅ Control section visibility
- ✅ Update content without coding

**Status:** ✅ **READY TO USE**

🦍 **Start managing your gorilla page now!** 🎉

