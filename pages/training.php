<?php
require_once '../admin/config/connection.php';
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>VETI Training Institute - Virunga Ecotours</title>
    <meta name="description" content="Virunga Ecotours Training Institute (VETI) - Professional training for community guides, porters, and hospitality staff in the Virunga Massif">
    
    <!-- Favicon -->
    <link rel="shortcut icon" href="../images/logos/icon.png" type="image/x-icon" />
    
    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    
    <!-- CSS Files -->
    <link rel="stylesheet" href="../css/header.css" />
    <link rel="stylesheet" href="../css/earthy-theme.css">
    <link rel="stylesheet" href="../community/assets/css/training.css">
    
    <script src="../js/header.js"></script>
</head>
<body>
    <?php include 'includes/header.php'; ?>

    <!-- Hero Section -->
    <section class="hero-section">
        <div class="hero-background">
            <img src="../images/training/IMG-20250814-WA0054.jpg" alt="VETI Training Institute" loading="lazy">
            <div class="hero-overlay"></div>
        </div>
        <div class="container">
            <div class="hero-content">
                <h1 class="hero-title">Virunga Ecotours Training Institute</h1>
                <p class="hero-subtitle">Professionalizing frontline tourism roles through competency-based training and mentorship</p>
                <a href="#programs" class="hero-cta">
                    <i class="fas fa-graduation-cap"></i>
                    Explore Programs
                </a>
            </div>
        </div>
    </section>

    <!-- Introduction Section -->
    <section class="intro-section">
        <div class="container">
            <div class="intro-content">
                <h2 class="section-title">Building Professional Excellence</h2>
                <p>The Virunga Ecotours Training Institute (VETI) is a competency-based training and mentorship center located in the Virunga Massif tourism hub. Our mandate is to professionalize frontline and entry-level roles across the visitor value chain community guides, future local porters, homestay and lodge staff, junior tour operations assistants through short, intensive weekend training followed by structured mentorship and internships.</p>
                
                <p>The curriculum integrates First Aid, hospitality and tourism management, guiding and porter skills, customer experience, safety and risk management, environmental stewardship, and foundational business and digital literacy.</p>
            </div>
        </div>
    </section>

    <!-- Why Training Matters Section -->
    <section class="why-matters-section">
        <div class="container">
            <div class="section-header">
                <h2>Why This Training Matters to the Community</h2>
                <p>Creating sustainable livelihoods through professional development</p>
            </div>
            
            <div class="benefits-grid">
                <div class="benefit-card">
                    <div class="benefit-icon">
                        <i class="fas fa-chart-line"></i>
                    </div>
                    <h3>Increased Employability</h3>
                    <p>Increases employability and earnings for youth and women through industry recognized skills</p>
                </div>
                
                <div class="benefit-card">
                    <div class="benefit-icon">
                        <i class="fas fa-shield-alt"></i>
                    </div>
                    <h3>Enhanced Safety & Quality</h3>
                    <p>Improves visitor safety, service quality, and satisfaction, strengthening the destination's reputation</p>
                </div>
                
                <div class="benefit-card">
                    <div class="benefit-icon">
                        <i class="fas fa-users"></i>
                    </div>
                    <h3>Local Workforce Development</h3>
                    <p>Builds a locally led workforce for guiding and porterage with safe load, first-aid, and mountain risk competencies</p>
                </div>
                
                <div class="benefit-card">
                    <div class="benefit-icon">
                        <i class="fas fa-home"></i>
                    </div>
                    <h3>Community Benefits</h3>
                    <p>Channels tourism benefits into households via homestays and micro-enterprises (food supply, crafts, transport)</p>
                </div>
                
                <div class="benefit-card">
                    <div class="benefit-icon">
                        <i class="fas fa-leaf"></i>
                    </div>
                    <h3>Conservation Practices</h3>
                    <p>Embeds conservation positive practices (trail etiquette, waste minimization, cultural respect) in daily operations</p>
                </div>
            </div>
        </div>
    </section>

    <!-- Programs Overview Section -->
    <section id="programs" class="programs-section">
        <div class="container">
            <div class="section-header">
                <h2>Programs Offered</h2>
                <p>Comprehensive training tracks for different career paths</p>
            </div>
            
            <div class="programs-table-container">
                <div class="programs-table">
                    <div class="table-header">
                        <div class="header-cell">Program</div>
                        <div class="header-cell">Purpose</div>
                        <div class="header-cell">Target Participants</div>
                        <div class="header-cell">Core Competencies</div>
                        <div class="header-cell">Exit Credential</div>
                    </div>
                    
                    <div class="table-row">
                        <div class="program-name">
                            <div class="program-icon">
                                <i class="fas fa-first-aid"></i>
                            </div>
                            <span>Wilderness First Aid</span>
                        </div>
                        <div class="program-cell">Equip frontline staff to respond to common field incidents</div>
                        <div class="program-cell">Porters, guides, homestay staff, activity leaders</div>
                        <div class="program-cell">Scene assessment, patient surveys, bleeding control, fractures/splints, burns, altitude & hypothermia basics</div>
                        <div class="program-cell">VETI First Aid Certificate (Foundations)</div>
                    </div>
                    
                    <div class="table-row">
                        <div class="program-name">
                            <div class="program-icon">
                                <i class="fas fa-concierge-bell"></i>
                            </div>
                            <span>Hospitality & Tourism Management</span>
                        </div>
                        <div class="program-cell">Raise service standards across homestays/lodges and tour ops</div>
                        <div class="program-cell">Homestay hosts, reception/F&B, junior ops</div>
                        <div class="program-cell">Guest cycle, housekeeping, F&B service, reservations & OTA basics, service recovery</div>
                        <div class="program-cell">VETI Hospitality Certificate (Entry)</div>
                    </div>
                    
                    <div class="table-row">
                        <div class="program-name">
                            <div class="program-icon">
                                <i class="fas fa-map-marked-alt"></i>
                            </div>
                            <span>Community Guide & Interpretation</span>
                        </div>
                        <div class="program-cell">Professionalize community guiding beyond park gates</div>
                        <div class="program-cell">Aspiring community guides, cultural facilitators</div>
                        <div class="program-cell">Route planning, interpretive storytelling, cultural protocol, group management</div>
                        <div class="program-cell">VETI Community Guide Certificate</div>
                    </div>
                    
                    <div class="table-row">
                        <div class="program-name">
                            <div class="program-icon">
                                <i class="fas fa-hiking"></i>
                            </div>
                            <span>Future Local Porters</span>
                        </div>
                        <div class="program-cell">Build safe, ethical, client-focused porter services</div>
                        <div class="program-cell">Aspiring/early-career porters</div>
                        <div class="program-cell">Load management & ergonomics, footcare, pace & altitude awareness</div>
                        <div class="program-cell">VETI Porter Skills Certificate</div>
                    </div>
                    
                    <div class="table-row">
                        <div class="program-name">
                            <div class="program-icon">
                                <i class="fas fa-handshake"></i>
                            </div>
                            <span>Internship & Mentorship</span>
                        </div>
                        <div class="program-cell">Consolidate learning in real workplaces</div>
                        <div class="program-cell">All graduates</div>
                        <div class="program-cell">Workplace professionalism, reflective practice, KPI tracking</div>
                        <div class="program-cell">VETI Mentorship/Internship Attestation</div>
                    </div>
                </div>
            </div>
        </div>
    </section>
 <!-- Parallax Scrolling Section -->
        <section class="parallax-section-v1">
            <div class="parallax-overlay-v">
                <div class="parallax-content-v">
                    <h2>Preserving Heritage, Empowering Futures</h2>
                    <p style="color: #ffffff;">Empowering you to give back to communities around the world.</p>
                </div>
            </div>
        </section>
    <!-- Program Details Section -->
    <section class="program-details-section">
        <div class="container">
            <div class="section-header">
                <h2>Program at a Glance</h2>
                <p>Comprehensive overview of training structure and requirements</p>
            </div>

            <div class="program-glance-table">
                <div class="glance-table">
                    <div class="glance-header">
                        <div class="glance-header-cell">Item</div>
                        <div class="glance-header-cell">Detail</div>
                    </div>

                    <div class="glance-row">
                        <div class="glance-item">Total Duration</div>
                        <div class="glance-detail">3 months training (weekends only) + 3 months mentorship & internship</div>
                    </div>

                    <div class="glance-row">
                        <div class="glance-item">Contact Time</div>
                        <div class="glance-detail">≈160 guided contact hours over 12 weekends + ≈300 internship hours over 12 weeks</div>
                    </div>

                    <div class="glance-row">
                        <div class="glance-item">Delivery Mode</div>
                        <div class="glance-detail">Workshops, simulations, field practicums, micro-projects, coaching</div>
                    </div>

                    <div class="glance-row">
                        <div class="glance-item">Language</div>
                        <div class="glance-detail">English with facilitation support for Kinyarwanda/French where needed</div>
                    </div>

                    <div class="glance-row">
                        <div class="glance-item">Cohort Size</div>
                        <div class="glance-detail">20–28 participants per intake (to preserve hands-on practice ratios)</div>
                    </div>

                    <div class="glance-row">
                        <div class="glance-item">Entry Requirements</div>
                        <div class="glance-detail">Motivation statement; basic literacy; fitness for field roles (for porter/guide tracks)</div>
                    </div>

                    <div class="glance-row">
                        <div class="glance-item">Assessment</div>
                        <div class="glance-detail">Practical demonstrations, scenario-based checks, short quizzes, portfolio & supervisor reviews</div>
                    </div>

                    <div class="glance-row">
                        <div class="glance-item">Certification</div>
                        <div class="glance-detail">VETI certificates per track; internship attestation upon successful completion</div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Curriculum Structure Section -->
    <section class="curriculum-section">
        <div class="container">
            <div class="section-header">
                <h2>Curriculum Structure and Hours</h2>
                <p>Detailed breakdown of training modules and learning outcomes</p>
            </div>

            <div class="curriculum-table-container">
                <div class="curriculum-table">
                    <div class="curriculum-header">
                        <div class="curriculum-header-cell">Module</div>
                        <div class="curriculum-header-cell">Hours (T/P*)</div>
                        <div class="curriculum-header-cell">Key Learning Outcomes</div>
                        <div class="curriculum-header-cell">Assessment Snapshot</div>
                    </div>

                    <div class="curriculum-row">
                        <div class="module-name">
                            <div class="module-icon">
                                <i class="fas fa-first-aid"></i>
                            </div>
                            <span>First Aid Foundations</span>
                        </div>
                        <div class="curriculum-cell">20 (8/12)</div>
                        <div class="curriculum-cell">Primary survey, bleeding control, splinting, shock, altitude/hypothermia basics, evacuation plans</div>
                        <div class="curriculum-cell">Practical drills + scenario checklist</div>
                    </div>

                    <div class="curriculum-row">
                        <div class="module-name">
                            <div class="module-icon">
                                <i class="fas fa-shield-alt"></i>
                            </div>
                            <span>Safety & Risk in the Massif</span>
                        </div>
                        <div class="curriculum-cell">12 (6/6)</div>
                        <div class="curriculum-cell">Hazard ID, weather & terrain, incident reporting, radio/phone protocols</div>
                        <div class="curriculum-cell">Risk plan + tabletop exercise</div>
                    </div>

                    <div class="curriculum-row">
                        <div class="module-name">
                            <div class="module-icon">
                                <i class="fas fa-concierge-bell"></i>
                            </div>
                            <span>Hospitality Operations</span>
                        </div>
                        <div class="curriculum-cell">28 (14/14)</div>
                        <div class="curriculum-cell">Guest cycle, service standards, housekeeping, F&B basics, hygiene & HACCP-lite</div>
                        <div class="curriculum-cell">Role-play + micro-audit</div>
                    </div>

                    <div class="curriculum-row">
                        <div class="module-name">
                            <div class="module-icon">
                                <i class="fas fa-map-marked-alt"></i>
                            </div>
                            <span>Community Guiding & Interpretation</span>
                        </div>
                        <div class="curriculum-cell">24 (10/14)</div>
                        <div class="curriculum-cell">Route design, interpretive talks, cultural protocol, LNT essentials</div>
                        <div class="curriculum-cell">Guided walk assessment</div>
                    </div>

                    <div class="curriculum-row">
                        <div class="module-name">
                            <div class="module-icon">
                                <i class="fas fa-hiking"></i>
                            </div>
                            <span>Porter Skills & Professional Practice</span>
                        </div>
                        <div class="curriculum-cell">20 (6/14)</div>
                        <div class="curriculum-cell">Load limits/ergonomics, footwear/footcare, pacing, equipment checks, client communication</div>
                        <div class="curriculum-cell">Field carry test</div>
                    </div>

                    <div class="curriculum-row">
                        <div class="module-name">
                            <div class="module-icon">
                                <i class="fas fa-smile"></i>
                            </div>
                            <span>Customer Experience & Service Recovery</span>
                        </div>
                        <div class="curriculum-cell">12 (6/6)</div>
                        <div class="curriculum-cell">Feedback loops, complaint handling, empathy, inclusivity</div>
                        <div class="curriculum-cell">CSAT role-play</div>
                    </div>

                    <div class="curriculum-row">
                        <div class="module-name">
                            <div class="module-icon">
                                <i class="fas fa-laptop"></i>
                            </div>
                            <span>Digital & Business Literacy</span>
                        </div>
                        <div class="curriculum-cell">12 (8/4)</div>
                        <div class="curriculum-cell">WhatsApp/OTA etiquette, basic spreadsheets, pricing & receipts, e-maps</div>
                        <div class="curriculum-cell">Mini booking workflow</div>
                    </div>

                    <div class="curriculum-row">
                        <div class="module-name">
                            <div class="module-icon">
                                <i class="fas fa-leaf"></i>
                            </div>
                            <span>Environmental Stewardship</span>
                        </div>
                        <div class="curriculum-cell">8 (4/4)</div>
                        <div class="curriculum-cell">Waste minimization, water safety, trail impacts, community code</div>
                        <div class="curriculum-cell">Stewardship pledge + quiz</div>
                    </div>

                    <div class="curriculum-row">
                        <div class="module-name">
                            <div class="module-icon">
                                <i class="fas fa-comments"></i>
                            </div>
                            <span>Communication & Languages for Tourism</span>
                        </div>
                        <div class="curriculum-cell">12 (8/4)</div>
                        <div class="curriculum-cell">Core English/French phrases, clear briefings, radio clarity</div>
                        <div class="curriculum-cell">Oral briefing check</div>
                    </div>

                    <div class="curriculum-row">
                        <div class="module-name">
                            <div class="module-icon">
                                <i class="fas fa-project-diagram"></i>
                            </div>
                            <span>Capstone Micro-Project</span>
                        </div>
                        <div class="curriculum-cell">12 (2/10)</div>
                        <div class="curriculum-cell">Team designs a safe, guest-ready half-day experience</div>
                        <div class="curriculum-cell">Pitch + field demo</div>
                    </div>
                </div>
                <p class="table-note">*T/P = Theory/Practice. Hours are indicative for demonstration.</p>
            </div>
        </div>
    </section>

    <!-- Sample Weekend Timetable Section -->
    <section class="timetable-section">
        <div class="container">
            <div class="section-header">
                <h2>Sample Weekend Timetable</h2>
                <p>Typical weekend schedule demonstrating balanced learning approach</p>
            </div>

            <div class="timetable-container">
                <div class="timetable-table">
                    <div class="timetable-header">
                        <div class="timetable-header-cell">Time</div>
                        <div class="timetable-header-cell">Saturday</div>
                        <div class="timetable-header-cell">Sunday</div>
                    </div>

                    <div class="timetable-row">
                        <div class="time-slot">08:30–10:30</div>
                        <div class="activity-cell">First Aid scenarios</div>
                        <div class="activity-cell">Guiding field practice</div>
                    </div>

                    <div class="timetable-row">
                        <div class="time-slot">10:45–12:30</div>
                        <div class="activity-cell">Hospitality workshop</div>
                        <div class="activity-cell">Customer experience lab</div>
                    </div>

                    <div class="timetable-row">
                        <div class="time-slot">13:30–15:15</div>
                        <div class="activity-cell">Risk & safety tabletop</div>
                        <div class="activity-cell">Porter skills field drill</div>
                    </div>

                    <div class="timetable-row">
                        <div class="time-slot">15:30–17:00</div>
                        <div class="activity-cell">Digital & business lab</div>
                        <div class="activity-cell">Debrief, reflections, prep for next week</div>
                    </div>
                </div>
            </div>
        </div>
    </section>
 <!-- Parallax Scrolling Section -->
        <section class="parallax-section-v2">
            <div class="parallax-overlay-v">
                <div class="parallax-content-v">
                    <h2>Preserving Heritage, Empowering Futures</h2>
                    <p style="color: #ffffff;">Empowering you to give back to communities around the world.</p>
                </div>
            </div>
        </section>
    <!-- Learning Roadmap Section -->
    <section class="roadmap-section">
        <div class="container">
            <div class="section-header">
                <h2>Twelve-Weekend Learning Roadmap</h2>
                <p>Progressive skill development over 12 intensive weekends</p>
            </div>

            <div class="roadmap-grid">
                <div class="roadmap-item">
                    <div class="weekend-number">1</div>
                    <h4>Orientation & Safety Culture</h4>
                    <p>First Aid I foundations</p>
                </div>

                <div class="roadmap-item">
                    <div class="weekend-number">2</div>
                    <h4>First Aid II</h4>
                    <p>Hospitality standards</p>
                </div>

                <div class="roadmap-item">
                    <div class="weekend-number">3</div>
                    <h4>Housekeeping & F&B Labs</h4>
                    <p>Environmental stewardship</p>
                </div>

                <div class="roadmap-item">
                    <div class="weekend-number">4</div>
                    <h4>Guiding I</h4>
                    <p>Interpretation & routes</p>
                </div>

                <div class="roadmap-item">
                    <div class="weekend-number">5</div>
                    <h4>Guiding II</h4>
                    <p>Cultural protocol, LNT</p>
                </div>

                <div class="roadmap-item">
                    <div class="weekend-number">6</div>
                    <h4>Porter Skills I</h4>
                    <p>Ergonomics & pacing</p>
                </div>

                <div class="roadmap-item">
                    <div class="weekend-number">7</div>
                    <h4>Porter Skills II</h4>
                    <p>Equipment & hazard response</p>
                </div>

                <div class="roadmap-item">
                    <div class="weekend-number">8</div>
                    <h4>Customer Experience</h4>
                    <p>Service recovery</p>
                </div>

                <div class="roadmap-item">
                    <div class="weekend-number">9</div>
                    <h4>Digital/OTAs</h4>
                    <p>Pricing fundamentals</p>
                </div>

                <div class="roadmap-item">
                    <div class="weekend-number">10</div>
                    <h4>Risk Management</h4>
                    <p>Field simulation</p>
                </div>

                <div class="roadmap-item">
                    <div class="weekend-number">11</div>
                    <h4>Capstone Design</h4>
                    <p>Sprint planning</p>
                </div>

                <div class="roadmap-item">
                    <div class="weekend-number">12</div>
                    <h4>Capstone Field Demo</h4>
                    <p>Summative checks</p>
                </div>
            </div>
        </div>
    </section>

    <!-- Mentorship Framework Section -->
    <section class="mentorship-section">
        <div class="container">
            <div class="section-header">
                <h2>Mentorship & Internship Framework</h2>
                <p>3-month practical application in real workplace settings</p>
            </div>

            <div class="mentorship-table-container">
                <div class="mentorship-table">
                    <div class="mentorship-header">
                        <div class="mentorship-header-cell">Track</div>
                        <div class="mentorship-header-cell">Host Sites (examples)</div>
                        <div class="mentorship-header-cell">Weekly Hours</div>
                        <div class="mentorship-header-cell">Core Activities</div>
                        <div class="mentorship-header-cell">Deliverables</div>
                        <div class="mentorship-header-cell">Evaluation</div>
                    </div>

                    <div class="mentorship-row">
                        <div class="track-name">
                            <div class="track-icon">
                                <i class="fas fa-concierge-bell"></i>
                            </div>
                            <span>Hospitality</span>
                        </div>
                        <div class="mentorship-cell">Homestays/lodges, cafés</div>
                        <div class="mentorship-cell">24–30</div>
                        <div class="mentorship-cell">Check-in/out, housekeeping, breakfast service, inventory</div>
                        <div class="mentorship-cell">2 guest feedback forms/week, mini-cost log</div>
                        <div class="mentorship-cell">Supervisor rubric + VETI visit</div>
                    </div>

                    <div class="mentorship-row">
                        <div class="track-name">
                            <div class="track-icon">
                                <i class="fas fa-map-marked-alt"></i>
                            </div>
                            <span>Community Guiding</span>
                        </div>
                        <div class="mentorship-cell">Community routes, cultural sites</div>
                        <div class="mentorship-cell">24–30</div>
                        <div class="mentorship-cell">Co-guiding, storytelling, safety briefings, route audits</div>
                        <div class="mentorship-cell">1 route card/week + risk notes</div>
                        <div class="mentorship-cell">Field observation</div>
                    </div>

                    <div class="mentorship-row">
                        <div class="track-name">
                            <div class="track-icon">
                                <i class="fas fa-hiking"></i>
                            </div>
                            <span>Porterage</span>
                        </div>
                        <div class="mentorship-cell">Trails, farm-to-trail logistics</div>
                        <div class="mentorship-cell">24–30</div>
                        <div class="mentorship-cell">Equipment checks, safe carry, client pacing, incident drills</div>
                        <div class="mentorship-cell">Load log + post-trek debrief sheets</div>
                        <div class="mentorship-cell">Skills checklist</div>
                    </div>

                    <div class="mentorship-row">
                        <div class="track-name">
                            <div class="track-icon">
                                <i class="fas fa-clipboard-list"></i>
                            </div>
                            <span>Tour Ops Assistant</span>
                        </div>
                        <div class="mentorship-cell">Small operators</div>
                        <div class="mentorship-cell">20–24</div>
                        <div class="mentorship-cell">Bookings, WhatsApp etiquette, voucher prep, supplier calls</div>
                        <div class="mentorship-cell">Booking workflow map</div>
                        <div class="mentorship-cell">Office-based task review</div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Assessment and Certification Section -->
    <section class="assessment-section">
        <div class="container">
            <div class="section-header">
                <h2>Assessment and Certification</h2>
                <p>Comprehensive evaluation framework ensuring competency standards</p>
            </div>

            <div class="assessment-table-container">
                <div class="assessment-table">
                    <div class="assessment-header">
                        <div class="assessment-header-cell">Component</div>
                        <div class="assessment-header-cell">Weight</div>
                        <div class="assessment-header-cell">Minimum Standard to Pass</div>
                    </div>

                    <div class="assessment-row">
                        <div class="assessment-component">Practical skills checks (FA, guiding, porter, hospitality)</div>
                        <div class="assessment-weight">40%</div>
                        <div class="assessment-standard">80% of critical tasks passed</div>
                    </div>

                    <div class="assessment-row">
                        <div class="assessment-component">Scenario/role-play evaluations</div>
                        <div class="assessment-weight">20%</div>
                        <div class="assessment-standard">"Meets standard" across safety & service criteria</div>
                    </div>

                    <div class="assessment-row">
                        <div class="assessment-component">Short quizzes (knowledge)</div>
                        <div class="assessment-weight">10%</div>
                        <div class="assessment-standard">70% average</div>
                    </div>

                    <div class="assessment-row">
                        <div class="assessment-component">Capstone project (design + field demo)</div>
                        <div class="assessment-weight">15%</div>
                        <div class="assessment-standard">Safe, guest-ready, costed experience</div>
                    </div>

                    <div class="assessment-row">
                        <div class="assessment-component">Internship supervisor rating</div>
                        <div class="assessment-weight">15%</div>
                        <div class="assessment-standard">"Good" or better on professionalism & reliability</div>
                    </div>
                </div>
            </div>
        </div>
    </section>
 <!-- Parallax Scrolling Section -->
        <section class="parallax-section-v3">
            <div class="parallax-overlay-v">
                <div class="parallax-content-v">
                    <h2>Preserving Heritage, Empowering Futures</h2>
                    <p style="color: #ffffff;">Empowering you to give back to communities around the world.</p>
                </div>
            </div>
        </section>
    <!-- Outcomes and Responsibilities Section -->
    <section class="outcomes-section">
        <div class="container">
            <div class="section-header">
                <h2>What is Expected from the Training</h2>
                <p>Clear outcomes and responsibilities for all stakeholders</p>
            </div>

            <div class="outcomes-grid">
                <div class="outcomes-card">
                    <div class="outcomes-header">
                        <div class="outcomes-icon">
                            <i class="fas fa-graduation-cap"></i>
                        </div>
                        <h3>Graduate Outcomes</h3>
                    </div>
                    <ul class="outcomes-list">
                        <li>Demonstrate safe-load porter practice, trail etiquette, and hazard response appropriate to the Virunga Massif</li>
                        <li>Deliver guest-ready service across housekeeping, F&B basics, reservations communication, and service recovery</li>
                        <li>Conduct short community walks with clear safety briefings, accurate interpretation, and cultural respect</li>
                        <li>Apply foundational First Aid in wilderness contexts and coordinate help effectively</li>
                        <li>Use basic digital tools (messaging, e-maps, simple spreadsheets) to support daily operations</li>
                        <li>Document work with simple logs (loads, routes, incidents, inventory) and communicate clearly with supervisors</li>
                    </ul>
                </div>

                <div class="outcomes-card">
                    <div class="outcomes-header">
                        <div class="outcomes-icon">
                            <i class="fas fa-user-graduate"></i>
                        </div>
                        <h3>Trainee Responsibilities</h3>
                    </div>
                    <ul class="outcomes-list">
                        <li>Attend ≥85% of contact hours and all summative assessments</li>
                        <li>Uphold safety, integrity, and cultural respect; wear appropriate PPE for field practicums</li>
                        <li>Complete internship hours and weekly reflections; maintain client confidentiality</li>
                        <li>Participate in capstone team project and community stewardship activities</li>
                    </ul>
                </div>

                <div class="outcomes-card">
                    <div class="outcomes-header">
                        <div class="outcomes-icon">
                            <i class="fas fa-school"></i>
                        </div>
                        <h3>Institute Responsibilities</h3>
                    </div>
                    <ul class="outcomes-list">
                        <li>Provide qualified trainers, safe practice environments, and calibrated equipment</li>
                        <li>Ensure realistic simulations and supervised field practicums with clear risk controls</li>
                        <li>Place graduates in mentored internships and conduct at least two onsite evaluations</li>
                        <li>Issue certificates and internship attestations upon successful completion</li>
                    </ul>
                </div>

                <div class="outcomes-card">
                    <div class="outcomes-header">
                        <div class="outcomes-icon">
                            <i class="fas fa-handshake"></i>
                        </div>
                        <h3>Industry Partner Responsibilities</h3>
                    </div>
                    <ul class="outcomes-list">
                        <li>Assign a workplace supervisor and meaningful learning tasks</li>
                        <li>Provide safe working conditions and necessary basic equipment/PPE</li>
                        <li>Deliver timely performance feedback using VETI tools</li>
                    </ul>
                </div>
            </div>
        </div>
    </section>

    <!-- Resources and Equipment Section -->
    <section class="resources-section">
        <div class="container">
            <div class="section-header">
                <h2>Resources and Equipment</h2>
                <p>Essential tools and materials for effective training delivery</p>
            </div>

            <div class="resources-table-container">
                <div class="resources-table">
                    <div class="resources-header">
                        <div class="resources-header-cell">Resource</div>
                        <div class="resources-header-cell">Provided By</div>
                        <div class="resources-header-cell">Notes</div>
                    </div>

                    <div class="resources-row">
                        <div class="resource-item">First aid training kits, splints, manikins</div>
                        <div class="resource-provider">VETI</div>
                        <div class="resource-notes">For simulations and skills checks</div>
                    </div>

                    <div class="resources-row">
                        <div class="resource-item">Porter PPE (demo sets)</div>
                        <div class="resource-provider">VETI</div>
                        <div class="resource-notes">Boots, socks, rain gear, straps; trainees bring personal gear for fit</div>
                    </div>

                    <div class="resources-row">
                        <div class="resource-item">Housekeeping & F&B kits</div>
                        <div class="resource-provider">Host venues/VETI</div>
                        <div class="resource-notes">Real-world practice environments</div>
                    </div>

                    <div class="resources-row">
                        <div class="resource-item">Radios/phones for drills</div>
                        <div class="resource-provider">VETI/Partners</div>
                        <div class="resource-notes">Communication protocols practice</div>
                    </div>

                    <div class="resources-row">
                        <div class="resource-item">Digital tools</div>
                        <div class="resource-provider">VETI</div>
                        <div class="resource-notes">Shared devices for e-maps, booking practice</div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Community Impact Section -->
    <section class="impact-section">
        <div class="container">
            <div class="section-header">
                <h2>Community Impact Metrics</h2>
                <p>Post-cohort tracking to measure training effectiveness and community benefit</p>
            </div>

            <div class="impact-table-container">
                <div class="impact-table">
                    <div class="impact-header">
                        <div class="impact-header-cell">Indicator</div>
                        <div class="impact-header-cell">Target within 6 months</div>
                    </div>

                    <div class="impact-row">
                        <div class="impact-indicator">Graduates placed or retained in related roles</div>
                        <div class="impact-target">≥70%</div>
                    </div>

                    <div class="impact-row">
                        <div class="impact-indicator">Reported client safety incidents among hosted groups</div>
                        <div class="impact-target">↓ year-on-year</div>
                    </div>

                    <div class="impact-row">
                        <div class="impact-indicator">Homestay service score (internal audits)</div>
                        <div class="impact-target">≥4.3/5 average</div>
                    </div>

                    <div class="impact-row">
                        <div class="impact-indicator">Women/youth participation</div>
                        <div class="impact-target">≥50% of cohort</div>
                    </div>

                    <div class="impact-row">
                        <div class="impact-indicator">Community-led experiences launched or improved</div>
                        <div class="impact-target">≥6 per cohort</div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Call to Action Section -->
    <section class="cta-section">
        <div class="container">
            <div class="cta-content">
                <h2>Join the Next VETI Cohort</h2>
                <p>Transform your career and contribute to sustainable tourism development in the Virunga Massif. Applications are now open for our next training cohort.</p>
                <div class="cta-buttons">
                    <a href="../pages/contactus.php" class="cta-btn primary">
                        <i class="fas fa-file-alt"></i>
                        Apply Now
                    </a>
                    <a href="../pages/about.php" class="cta-btn secondary">
                        <i class="fas fa-info-circle"></i>
                        Learn More
                    </a>
                </div>
            </div>
        </div>
    </section>

    <?php include 'includes/footer.php'; ?>
</body>
</html>
