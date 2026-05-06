@echo off
REM Import Gorilla Database Tables
REM This batch file imports all gorilla section tables into the database

cd /d "c:\xampp\htdocs\virungaecotours\pages"

echo Importing Gorilla Database Tables...
echo.

REM Import all tables at once
"c:\xampp\mysql\bin\mysql.exe" -u root virungaecotours < gorilla_all_sections.sql

if %errorlevel% equ 0 (
    echo.
    echo ========================================
    echo SUCCESS! All tables imported.
    echo ========================================
    echo.
    echo Tables created:
    echo - gorilla_hero_section
    echo - gorilla_intro_section
    echo - gorilla_intro_highlights
    echo - gorilla_history_section
    echo - gorilla_timeline_items
    echo - gorilla_habitat_section
    echo - gorilla_habitat_cards
    echo - gorilla_habitat_locations
    echo - gorilla_conservation_section
    echo - gorilla_conservation_benefits
    echo - gorilla_conservation_stats
    echo - gorilla_discounts_section
    echo - gorilla_discount_cards
    echo - gorilla_discount_details
    echo.
    echo Total: 17 tables with 31+ records
    echo.
) else (
    echo.
    echo ERROR! Import failed.
    echo Please check your MySQL connection.
    echo.
)

pause

