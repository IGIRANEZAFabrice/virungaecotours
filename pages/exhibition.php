<?php require_once '../admin/config/connection.php'; ?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Exhibitions & Conferences in the Virunga Massif | Virunga Ecotours</title>
    <meta name="description" content="Explore cultural and modern exhibitions across the Virunga Massif—heritage, innovation, green energy, education, research—supported by Virunga Ecotours and local communities." />

    <link rel="icon" type="image/x-icon" href="../images/favicon.ico" />
    <link rel="apple-touch-icon" sizes="180x180" href="../images/apple-touch-icon.png" />
    <link rel="icon" type="image/png" sizes="32x32" href="../images/favicon-32x32.png" />
    <link rel="icon" type="image/png" sizes="16x16" href="../images/favicon-16x16.png" />

    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" />

    <link rel="stylesheet" href="../css/earthy-theme.css" />
    <link rel="stylesheet" href="../css/header.css" />
    <link rel="stylesheet" href="../css/exhibition.css" />
</head>
<body>
    <?php include './includes/header.php'; ?>

    <section class="ex-hero">
        <div class="container">
            <h1>Conferences, Exhibitions & Events in the Virunga Massif</h1>
            <p>Where heritage meets innovation—experience cultural showcases and modern solutions across the Virunga region.</p>
        </div>
    </section>

    <!-- Upcoming Highlight Banner -->
    <section class="upcoming-banner">
        <div class="container">
            <div class="upcoming-wrap">
                <div class="upcoming-text">
                    <span class="eyebrow"><i class="fas fa-bullhorn"></i> Upcoming</span>
                    <h2 class="upcoming-title">Regional Innovation Forum</h2>
                    <p class="muted">A cross‑sector gathering spotlighting eco‑tech, youth innovation, and cultural exchange.</p>
                    <div class="type-badges">
                        <span class="type-badge conference"><i class="fas fa-microphone"></i> Conference</span>
                        <span class="type-badge exhibition"><i class="fas fa-images"></i> Exhibition</span>
                        <span class="type-badge event"><i class="fas fa-calendar-day"></i> Event</span>
                    </div>
                </div>
                <div class="upcoming-media">
                    <div class="upcoming-image">
                        <img src="../images/coffee-hero.jpg" alt="Upcoming Forum visual" loading="lazy">
                    </div>
                    <div class="upcoming-meta">
                        <div class="meta-row"><i class="fas fa-location-dot"></i> Musanze</div>
                        <div class="meta-row"><i class="fas fa-calendar"></i> Dates: TBA</div>
                        <div class="meta-row"><i class="fas fa-link"></i> Details coming soon</div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Overview (Two-Column) -->
    <section class="section">
        <div class="container">
            <span class="eyebrow"><i class="fas fa-mountain"></i> About the Event Landscape</span>
            <h2 class="section-title" style="margin-top:.5rem;">Overview</h2>
            <div class="intro-grid">
                <div>
                    <p class="lead">The Virunga Massif is not only a sanctuary for rare wildlife and breathtaking landscapes but also a stage for ideas, creativity, and innovation. Exhibitions and conferences here bring together local communities, cultural leaders, entrepreneurs, researchers, and innovators to showcase everything from age-old traditions to modern solutions shaping the future.</p>
                    <p class="lead">At Virunga Ecotours, we actively participate in and support these gatherings. Whether it is a cultural exhibition celebrating dance, art, and heritage, or a modern exhibition introducing renewable energy, digital tools, or sustainable agriculture technologies, we ensure travelers experience both the richness of the past and the promise of the future.</p>
                </div>
                <aside class="intro-card">
                    <h3 class="muted" style="margin-top:0;">What makes it special</h3>
                    <ul class="intro-list">
                        <li><i class="fas fa-check"></i> Cultural showcases and live performances</li>
                        <li><i class="fas fa-check"></i> Innovation demos: solar, biogas, digital tools</li>
                        <li><i class="fas fa-check"></i> Farmer-led fairs: honey, coffee, tea</li>
                        <li><i class="fas fa-check"></i> Research talks and conservation panels</li>
                        <li><i class="fas fa-check"></i> Community-first partnerships and outcomes</li>
                    </ul>
                </aside>
            </div>
        </div>
    </section>

    <!-- Why It Matters (Icon Cards) -->
    <section class="section" style="background: var(--neutral-light);">
        <div class="container">
            <span class="eyebrow"><i class="fas fa-seedling"></i> Why It Matters</span>
            <h2 class="section-title" style="margin-top:.5rem;">Conferences, Exhibitions & Events</h2>
            <div class="cards-grid" style="margin-top:1rem;">
                <div class="icon-card">
                    <div class="icon"><i class="fas fa-masks-theater"></i></div>
                    <h3>Cultural Exchange</h3>
                    <p class="muted">Celebrate traditions, crafts, and heritage that define the Virunga Massif.</p>
                </div>
                <div class="icon-card">
                    <div class="icon"><i class="fas fa-bolt"></i></div>
                    <h3>Modern Innovation</h3>
                    <p class="muted">Eco‑technology, agribusiness, conservation science, and digital entrepreneurship.</p>
                </div>
                <div class="icon-card">
                    <div class="icon"><i class="fas fa-people-group"></i></div>
                    <h3>Community Empowerment</h3>
                    <p class="muted">Platforms for artisans, farmers, and innovators to meet global audiences.</p>
                </div>
                <div class="icon-card">
                    <div class="icon"><i class="fas fa-chalkboard-teacher"></i></div>
                    <h3>Knowledge Sharing</h3>
                    <p class="muted">Dialogues on ecotourism, conservation, climate resilience, and development.</p>
                </div>
                <div class="icon-card">
                    <div class="icon"><i class="fas fa-handshake-angle"></i></div>
                    <h3>Tourist Engagement</h3>
                    <p class="muted">Participate, learn, and contribute across cultural and modern exhibitions.</p>
                </div>
            </div>
        </div>
    </section>

    <!-- Sample Exhibitions (Placeholder Cards) -->
    <section class="section exhibitions-section">
        <div class="container">
            <span class="eyebrow"><i class="fas fa-rectangle-list"></i> Samples</span>
            <h2 class="section-title" style="margin-top:.5rem;">Sample Conferences, Exhibitions & Events</h2>
            <p class="muted" style="margin-bottom:1rem;">Preview cards only — replace with real exhibitions when ready.</p>
            <div class="cards-grid">
                <div class="exhibit-card">
                    <div class="exhibit-image">
                        <img src="../images/bee.jpg" alt="Handicraft & Cultural Arts" loading="lazy">
                        <span class="badge sample">Sample</span>
                    </div>
                    <div class="card-body">
                        <h3>Handicraft & Cultural Arts Expo</h3>
                        <p class="muted">Local artisans and troupes showcase crafts, music, and dance.</p>
                        <div class="type-badges"><span class="type-badge exhibition"><i class="fas fa-images"></i> Exhibition</span></div>
                        <div class="exhibit-meta">
                            <span><i class="fas fa-location-dot"></i> Musanze</span>
                            <span><i class="fas fa-calendar"></i> TBD</span>
                        </div>
                    </div>
                </div>
                <div class="exhibit-card">
                    <div class="exhibit-image">
                        <img src="../images/coffee-hero.jpg" alt="Green Energy & Technology" loading="lazy">
                        <span class="badge sample">Sample</span>
                    </div>
                    <div class="card-body">
                        <h3>Green Energy & Technology Fair</h3>
                        <p class="muted">Solar, biogas, and digital tools for resilient communities.</p>
                        <div class="type-badges"><span class="type-badge conference"><i class="fas fa-microphone"></i> Conference</span></div>
                        <div class="exhibit-meta">
                            <span><i class="fas fa-location-dot"></i> Rubavu</span>
                            <span><i class="fas fa-calendar"></i> TBD</span>
                        </div>
                    </div>
                </div>
                <div class="exhibit-card">
                    <div class="exhibit-image">
                        <img src="../images/agro.jpg" alt="Agriculture & Honey Fairs" loading="lazy">
                        <span class="badge sample">Sample</span>
                    </div>
                    <div class="card-body">
                        <h3>Agriculture & Honey Fairs</h3>
                        <p class="muted">Taste honey, coffee, tea while meeting farmer cooperatives.</p>
                        <div class="type-badges"><span class="type-badge event"><i class="fas fa-calendar-day"></i> Event</span></div>
                        <div class="exhibit-meta">
                            <span><i class="fas fa-location-dot"></i> Nyabihu</span>
                            <span><i class="fas fa-calendar"></i> TBD</span>
                        </div>
                    </div>
                </div>
                <div class="exhibit-card">
                    <div class="exhibit-image">
                        <img src="../images/homestay/homestay-1.jpg" alt="Education & Youth Innovation" loading="lazy">
                        <span class="badge sample">Sample</span>
                    </div>
                    <div class="card-body">
                        <h3>Education & Youth Innovation</h3>
                        <p class="muted">Student projects, debates, and future‑focused ideas.</p>
                        <div class="type-badges"><span class="type-badge exhibition"><i class="fas fa-images"></i> Exhibition</span></div>
                        <div class="exhibit-meta">
                            <span><i class="fas fa-location-dot"></i> Kigali</span>
                            <span><i class="fas fa-calendar"></i> TBD</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Call to Action Section -->
    <section class="cta-section">
        <div class="container">
            <div class="cta-content">
                <h2>Be Part of Virunga's Voices & Visions</h2>
                <p>Join cultural showcases, innovation forums, and knowledge exchanges across the Virunga Massif. Partner with communities and help shape a sustainable future.</p>
                <div class="cta-buttons">
                    <a href="../pages/contactus.php" class="cta-btn primary">
                        <i class="fas fa-envelope"></i>
                        Contact Us
                    </a>
                    <a href="./build.php" class="cta-btn">
                        <i class="fas fa-calendar-alt"></i>
                        Plan Your Visit
                    </a>
                </div>
            </div>
        </div>
    </section>

    <?php include './includes/footer.php'; ?>
    <script src="../js/header.js"></script>
</body>
</html>