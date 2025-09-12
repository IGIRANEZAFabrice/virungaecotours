# Complete Email Automation Setup Guide for Bluehost

## 📋 Overview
This guide will help you set up an automated email system that sends daily summaries of new submissions from your database tables using PHPMailer and Gmail SMTP.

## 🚀 Quick Setup Steps

### Step 1: Upload Files
Upload these files to your `public_html` directory:
- `install_composer.php`
- `debug_email.php`
- `sendemail.php`

### Step 2: Install Dependencies
1. Visit: `https://yourdomain.com/install_composer.php`
2. This will automatically:
   - Download and install Composer
   - Install PHPMailer via Composer
   - Create necessary configuration files

### Step 3: Test the System
1. Visit: `https://yourdomain.com/debug_email.php`
2. This will test:
   - PHPMailer installation
   - Database connection
   - Email sending functionality
   - File permissions

### Step 4: Set Up Cron Job
1. Log into Bluehost cPanel
2. Go to "Advanced" → "Cron Jobs"
3. Set email to: `fabrdaa@gmail.com`
4. Add new cron job:
   ```
   Minute: 0
   Hour: 9
   Day: *
   Month: *
   Weekday: *
   Command: /usr/local/bin/php /home2/dmxewbmy/public_html/sendemail.php >/dev/null 2>&1
   ```

## 📧 Email Configuration (Already Set)
- **Gmail Account**: fabrdaa@gmail.com
- **App Password**: knqgypzjyrbxxjdg
- **SMTP Server**: smtp.gmail.com
- **Port**: 587
- **Encryption**: STARTTLS

## 🗄️ Database Configuration (Already Set)
- **Host**: localhost
- **Username**: root
- **Password**: (empty)
- **Database**: virungaecotoursdb

## 📊 Monitored Tables
The system checks these tables for new submissions:
1. `tour_booking` - Tour booking requests
2. `contact_submissions` - Contact form submissions
3. `build_submission` - Build project submissions
4. `community_messages` - Community messages

## 🔧 How It Works

### Email Tracking System
- Each table has an `emailed` column (added automatically if missing)
- New records have `emailed = 0`
- After email is sent, records are marked `emailed = 1`
- This prevents duplicate emails

### Email Content
You'll receive HTML emails containing:
- **Professional formatting** with your brand colors
- **Complete submission details** from all tables
- **Summary statistics** of new items
- **Timestamp** of when the report was generated

### Scheduling
- **Recommended**: Daily at 9:00 AM
- **Alternative**: Twice daily (9 AM and 9 PM)
- **Testing**: Hourly (not recommended for production)

## 🛠️ Troubleshooting

### If install_composer.php fails:
1. Check if your hosting supports shell_exec
2. Try manual PHPMailer installation:
   - Download from: https://github.com/PHPMailer/PHPMailer
   - Upload to `PHPMailer/` folder in public_html

### If debug_email.php shows errors:
1. **PHPMailer not found**: Run install_composer.php again
2. **Database connection failed**: Check database credentials
3. **Email sending failed**: Verify Gmail app password

### If emails aren't being sent:
1. Check `email_automation.log` for execution logs
2. Check `email_automation_errors.log` for error details
3. Verify cron job is running in cPanel
4. Test manually by visiting sendemail.php

## 📁 File Structure After Setup
```
public_html/
├── sendemail.php (main email script)
├── install_composer.php (setup script)
├── debug_email.php (testing script)
├── composer.phar (Composer executable)
├── composer.json (Composer configuration)
├── vendor/ (PHPMailer and dependencies)
│   ├── autoload.php
│   └── phpmailer/
├── email_automation.log (execution logs)
├── email_automation_errors.log (error logs)
├── debug_results.json (test results)
└── installation_status.txt (setup status)
```

## 🔒 Security Features
- **SQL Injection Protection**: Parameterized queries
- **Input Sanitization**: All output is HTML-escaped
- **Error Handling**: Comprehensive error logging
- **Rate Limiting**: Only sends emails when there are new items
- **Secure Credentials**: Gmail app password (not regular password)

## 📈 Monitoring
- **Execution Logs**: `email_automation.log`
- **Error Logs**: `email_automation_errors.log`
- **Debug Results**: `debug_results.json`
- **Installation Status**: `installation_status.txt`

## 🎯 Expected Email Content Example

**Subject**: Daily Summary Report - 2024-01-15 09:00:00 - 3 New Items

**Content**:
```
Virunga Ecotours - Daily Summary Report
Generated on January 15, 2024 at 9:00 AM

Tour Bookings (2 new)
├── ID: 123 | John Doe | john@example.com | Gorilla Trekking | 2024-01-20
└── ID: 124 | Jane Smith | jane@example.com | Cultural Tour | 2024-01-22

Contact Submissions (1 new)
└── ID: 45 | Mike Johnson | mike@example.com | Question about tours

Build Submissions (0 new)
No new submissions

Community Messages (0 new)
No new submissions

Summary: Total New Items: 3
```

## ✅ Success Indicators
- ✅ install_composer.php completes without errors
- ✅ debug_email.php shows all tests passed
- ✅ You receive a test email at fabrdaa@gmail.com
- ✅ Cron job appears in cPanel
- ✅ Daily summary emails arrive as scheduled

## 🆘 Support
If you encounter issues:
1. Run debug_email.php and check the results
2. Review the log files for error details
3. Verify all file paths and permissions
4. Ensure Gmail 2FA is enabled for app passwords

## 🔄 Next Steps After Setup
1. Monitor the first few daily emails
2. Adjust cron schedule if needed
3. Customize email formatting if desired
4. Set up additional notification recipients if needed

Your email automation system is now ready to keep you informed of all new submissions automatically!
