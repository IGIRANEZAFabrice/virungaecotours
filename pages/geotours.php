<?php require_once '../admin/config/connection.php'; ?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Geo Tours in the Virunga Massif | Hot Springs, Caves, Salt Springs | Virunga Ecotours</title>
    <meta name="description" content="Discover geo tours across the Virunga Massif: hot springs in Gisenyi, Mpenge saltwater, Musanze lava caves, volcanic formations, and mineral streams—science, culture, and adventure combined.">
    <meta name="keywords" content="geo tours virunga, hot springs Gisenyi, Mpenge salt water, Musanze caves, lava tubes Rwanda, volcanic formations Virunga, mineral streams volcanoes">

    <link rel="icon" type="image/x-icon" href="../images/favicon.ico" />
    <link rel="apple-touch-icon" sizes="180x180" href="../images/apple-touch-icon.png" />
    <link rel="icon" type="image/png" sizes="32x32" href="../images/favicon-32x32.png" />
    <link rel="icon" type="image/png" sizes="16x16" href="../images/favicon-16x16.png" />

    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" />

    <link rel="stylesheet" href="../css/earthy-theme.css" />
    <link rel="stylesheet" href="../css/header.css" />
    <link rel="stylesheet" href="../css/geotours-modern.css" />
</head>
<body>
    <?php include './includes/header.php'; ?>

    <!-- Hero -->
    <section class="gt-hero">
        <div class="container">
            <h1>Geo Tours in the Virunga Massif</h1>
            <p class="lead">Explore hot springs, salt springs, lava caves, and volcanic landscapes—where science, culture, and adventure meet.</p>
        </div>
    </section>

    <!-- Overview -->
    <section class="section">
        <div class="container">
            <span class="eyebrow"><i class="fas fa-mountain"></i> Geo Tours Overview</span>
            <h2 class="section-title" style="margin-top:.5rem;">Earth's Story Written in Stone</h2>
            <p class="lead">The Virunga Massif is home to geological wonders shaped by millions of years of volcanic activity. Our Geo Tours go beyond wildlife to reveal hot springs, saltwater sources, lava caves, and volcanic formations that continue to shape local life. Journey through nature, culture, and science in one unforgettable experience.</p>
        </div>
    </section>

    <!-- Why Choose -->
    <section class="section" style="background: var(--neutral-light);">
        <div class="container">
            <span class="eyebrow"><i class="fas fa-compass"></i> Why Choose These Tours?</span>
            <h2 class="section-title" style="margin-top:.5rem;">What Makes Geo Tours Special</h2>
            <div class="gt-feature-grid">
                <div class="gt-feature">
                    <i class="fas fa-water"></i>
                    <h3>Unique Experiences</h3>
                    <p class="muted">Thermal waters, salt springs, ancient lava tubes—rare phenomena you won't find on typical safaris.</p>
                </div>
                <div class="gt-feature">
                    <i class="fas fa-people-roof"></i>
                    <h3>Cultural Value</h3>
                    <p class="muted">Local communities have long used these sites for healing, rituals, and daily life.</p>
                </div>
                <div class="gt-feature">
                    <i class="fas fa-flask"></i>
                    <h3>Educational Journey</h3>
                    <p class="muted">Understand the science behind volcanoes, mineral waters, and underground formations.</p>
                </div>
                <div class="gt-feature">
                    <i class="fas fa-person-hiking"></i>
                    <h3>Adventure & Relaxation</h3>
                    <p class="muted">From cave treks to hot spring soaks—balance thrill with wellness.</p>
                </div>
            </div>
        </div>
    </section>

    <!-- Key Sites Table -->
    <section class="section">
        <div class="container">
            <span class="eyebrow"><i class="fas fa-table"></i> Key Geo Tour Sites</span>
            <h2 class="section-title" style="margin-top:.5rem;">Highlights by Location</h2>
            <div class="table-wrap">
                <table class="gt-table">
                    <thead>
                        <tr>
                            <th>Site/Attraction</th>
                            <th>Location</th>
                            <th>Highlights</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>Hot Springs (Thermic Water)</td>
                            <td>Gisenyi (Rubavu)</td>
                            <td>Geothermal pools with healing traditions; scenic lakeside relaxation.</td>
                        </tr>
                        <tr>
                            <td>Salt Water at Mpenge</td>
                            <td>Musanze</td>
                            <td>Rare inland saltwater source; historic community salt extraction.</td>
                        </tr>
                        <tr>
                            <td>Musanze Caves</td>
                            <td>Musanze</td>
                            <td>2+ km network of lava tubes showing volcanic history and human use.</td>
                        </tr>
                        <tr>
                            <td>Volcanic Formations</td>
                            <td>Virunga Massif</td>
                            <td>Ancient lava flows, craters, and landscapes of Karisimbi, Nyiragongo, Bisoke.</td>
                        </tr>
                        <tr>
                            <td>Cold Springs & Mineral Streams</td>
                            <td>Surrounding Volcanoes</td>
                            <td>Fresh mineral-rich waters from aquifers shaped by volcanic geology.</td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </section>

    <!-- Cards: Site Summaries -->
    <section class="section" style="background: var(--neutral-cream);">
        <div class="container">
            <span class="eyebrow"><i class="fas fa-layer-group"></i> Explore the Sites</span>
            <h2 class="section-title" style="margin-top:.5rem;">From Caves to Springs</h2>
            <div class="cards-grid">
                <article class="gt-card">
                    <div class="icon"><i class="fas fa-hot-tub"></i></div>
                    <h3>Gisenyi Hot Springs</h3>
                    <p class="muted">Relax in natural thermic waters, a cultural wellness tradition along Lake Kivu.</p>
                </article>
                <article class="gt-card">
                    <div class="icon"><i class="fas fa-salt"></i></div>
                    <h3>Mpenge Salt Water</h3>
                    <p class="muted">A rare inland salt source—learn historical extraction and its role in local life.</p>
                </article>
                <article class="gt-card">
                    <div class="icon"><i class="fas fa-helmet-safety"></i></div>
                    <h3>Musanze Lava Caves</h3>
                    <p class="muted">Walk through ancient lava tubes shaped by the region’s volcanic past.</p>
                </article>
                <article class="gt-card">
                    <div class="icon"><i class="fas fa-volcano"></i></div>
                    <h3>Volcanic Formations</h3>
                    <p class="muted">Trace craters and lava flows across the Virunga volcanoes.</p>
                </article>
            </div>
        </div>
    </section>

    <!-- Requirements -->
    <section class="section">
        <div class="container">
            <span class="eyebrow"><i class="fas fa-clipboard-check"></i> What Is Required</span>
            <h2 class="section-title" style="margin-top:.5rem;">Before You Go</h2>
            <div class="gt-feature-grid">
                <div class="gt-feature">
                    <i class="fas fa-heart-pulse"></i>
                    <h3>Fitness Level</h3>
                    <p class="muted">Moderate. Some sites require short hikes or cave walking.</p>
                </div>
                <div class="gt-feature">
                    <i class="fas fa-user-tie"></i>
                    <h3>Local Guides</h3>
                    <p class="muted">Mandatory for safe navigation, cultural storytelling, and interpretation.</p>
                </div>
                <div class="gt-feature">
                    <i class="fas fa-ticket"></i>
                    <h3>Permits & Fees</h3>
                    <p class="muted">Some caves and springs require entry fees managed by local authorities.</p>
                </div>
            </div>
        </div>
    </section>

    <!-- Packing List -->
    <section class="section" style="background: var(--neutral-light);">
        <div class="container">
            <span class="eyebrow"><i class="fas fa-backpack"></i> What to Bring</span>
            <h2 class="section-title" style="margin-top:.5rem;">Essential Gear</h2>
            <div class="checklist-grid">
                <label class="check-item"><input type="checkbox" disabled checked /><span>Comfortable hiking shoes or boots</span></label>
                <label class="check-item"><input type="checkbox" disabled checked /><span>Light waterproof jacket</span></label>
                <label class="check-item"><input type="checkbox" disabled checked /><span>Torch/flashlight for caves</span></label>
                <label class="check-item"><input type="checkbox" disabled checked /><span>Swimwear and towel (hot springs)</span></label>
                <label class="check-item"><input type="checkbox" disabled checked /><span>Drinking water and light snacks</span></label>
                <label class="check-item"><input type="checkbox" disabled checked /><span>Camera or phone for photography</span></label>
                <label class="check-item"><input type="checkbox" disabled checked /><span>Notebook/journal for notes</span></label>
            </div>
        </div>
    </section>

    <!-- CTA -->
    <section class="cta-section">
        <div class="container">
            <div class="cta-content">
                <h2>“Geo Tours with Virunga Ecotours – Where Earth’s Secrets Come Alive.”</h2>
                <p class="muted">Walk through volcanoes, bathe in hot springs, and discover the Earth’s story—tailored to your curiosity and comfort.</p>
                <div class="cta-buttons">
                    <a href="../pages/contactus.php" class="cta-btn primary"><i class="fas fa-envelope"></i> Contact Us</a>
                    <a href="./build.php" class="cta-btn"><i class="fas fa-calendar-alt"></i> Plan Your Tour</a>
                </div>
            </div>
        </div>
    </section>

    <?php include './includes/footer.php'; ?>
</body>
</html>
