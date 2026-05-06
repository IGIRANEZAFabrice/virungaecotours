<?php require_once '../admin/config/connection.php'; ?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Hiking the Virunga Massif | Professional & Emotional Journeys | Virunga Ecotours</title>
    <meta name="description" content="Hike the Virunga Massif: Karisimbi, Bisoke, Sabyinyo, Muhabura, Gahinga, and Nyiragongo. Professional challenges, volcanic majesty, tri-border summits, and unforgettable views.">
    <meta name="keywords" content="Virunga hiking, Karisimbi, Bisoke, Sabyinyo, Muhabura, Gahinga, Nyiragongo, Rwanda hiking, Uganda hiking, DRC hiking, Virunga Massif tours">

    <link rel="icon" type="image/x-icon" href="../images/favicon.ico" />
    <link rel="apple-touch-icon" sizes="180x180" href="../images/apple-touch-icon.png" />
    <link rel="icon" type="image/png" sizes="32x32" href="../images/favicon-32x32.png" />
    <link rel="icon" type="image/png" sizes="16x16" href="../images/favicon-16x16.png" />

    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" />

    <link rel="stylesheet" href="../css/earthy-theme.css" />
    <link rel="stylesheet" href="../css/header.css" />
    <link rel="stylesheet" href="../css/hiking.css" />
</head>
<body>
    <?php include './includes/header.php'; ?>

    <!-- Hero -->
    <section class="hk-hero">
        <div class="container">
            <h1>Hiking the Virunga Massif</h1>
            <p class="lead">More than a climb — a journey through volcanic power, mist-covered trails, and tri-border panoramas.</p>
        </div>
    </section>

    <!-- Why Choose -->
    <section class="section">
        <div class="container">
            <span class="eyebrow"><i class="fas fa-boot"></i> Why Choose These Hiking Tours?</span>
            <h2 class="section-title" style="margin-top:.5rem;">What Makes Virunga Different</h2>
            <div class="hk-feature-grid">
                <div class="hk-feature"><i class="fas fa-mountain"></i><h3>Professional Challenge</h3><p class="muted">High-altitude trails up to 4,507m on Karisimbi test stamina, skill, and resilience.</p></div>
                <div class="hk-feature"><i class="fas fa-fire"></i><h3>Volcanic Majesty</h3><p class="muted">Active volcanoes like Nyiragongo and Muhabura reveal the living power of the Earth.</p></div>
                <div class="hk-feature"><i class="fas fa-border-all"></i><h3>Borderland Adventure</h3><p class="muted">Trek a massif shared by Rwanda, Uganda, and the DRC — three cultures, one range.</p></div>
                <div class="hk-feature"><i class="fas fa-leaf"></i><h3>Pristine Nature</h3><p class="muted">Bamboo forests, alpine meadows, and cloud-kissed summits along the trails.</p></div>
                <div class="hk-feature"><i class="fas fa-binoculars"></i><h3>Rare Experiences</h3><p class="muted">Gorilla habitats, volcanic craters, and endless panoramas few will ever see.</p></div>
            </div>
        </div>
    </section>

    <!-- Comparative Overview Table -->
    <section class="section" style="background: var(--neutral-light);">
        <div class="container">
            <span class="eyebrow"><i class="fas fa-table"></i> Comparative Overview</span>
            <h2 class="section-title" style="margin-top:.5rem;">Mountains of the Virunga Massif</h2>
            <div class="table-wrap">
                <table class="hk-table">
                    <thead>
                        <tr>
                            <th>Mountain</th>
                            <th>Location</th>
                            <th>Height</th>
                            <th>Unique Feature</th>
                            <th>Hiking Duration</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr><td>Karisimbi</td><td>Rwanda</td><td>4,507m</td><td>Highest peak in Rwanda, 2-day hike</td><td>2 days</td></tr>
                        <tr><td>Bisoke</td><td>Rwanda</td><td>3,711m</td><td>Crater lake at the summit</td><td>1 day</td></tr>
                        <tr><td>Sabyinyo</td><td>Rwanda/Uganda/DRC</td><td>3,669m</td><td>Summit touches 3 countries</td><td>1 day</td></tr>
                        <tr><td>Muhabura</td><td>Rwanda/Uganda</td><td>4,127m</td><td>Steep volcanic cone, panoramic views</td><td>1 day</td></tr>
                        <tr><td>Gahinga</td><td>Rwanda/Uganda</td><td>3,474m</td><td>Bamboo forests and golden monkeys</td><td>1 day</td></tr>
                        <tr><td>Nyiragongo</td><td>DRC</td><td>3,470m</td><td>World’s largest lava lake</td><td>2 days</td></tr>
                    </tbody>
                </table>
            </div>
        </div>
    </section>

    <!-- Mountains Overview Cards -->
    <section class="section">
        <div class="container">
            <span class="eyebrow"><i class="fas fa-globe-africa"></i> Overview of Each Mountain</span>
            <h2 class="section-title" style="margin-top:.5rem;">Choose Your Summit</h2>
            <div class="cards-grid">
                <article class="hk-card">
                    <div class="icon"><i class="fas fa-mountain"></i></div>
                    <h3>Karisimbi (Rwanda, 4,507m)</h3>
                    <p class="muted">A demanding two-day climb through alpine zones, often mist-shrouded with breathtaking views.</p>
                </article>
                <article class="hk-card">
                    <div class="icon"><i class="fas fa-water"></i></div>
                    <h3>Bisoke (Rwanda, 3,711m)</h3>
                    <p class="muted">Moderate day hike culminating in a vast crater lake at the summit.</p>
                </article>
                <article class="hk-card">
                    <div class="icon"><i class="fas fa-route"></i></div>
                    <h3>Sabyinyo (RW/UG/DRC, 3,669m)</h3>
                    <p class="muted">“Old Man’s Teeth” — rugged ridges leading to a summit where three countries meet.</p>
                </article>
                <article class="hk-card">
                    <div class="icon"><i class="fas fa-binoculars"></i></div>
                    <h3>Muhabura (RW/UG, 4,127m)</h3>
                    <p class="muted">A dramatic cone with sweeping views across lakes and peaks.</p>
                </article>
                <article class="hk-card">
                    <div class="icon"><i class="fas fa-leaf"></i></div>
                    <h3>Gahinga (RW/UG, 3,474m)</h3>
                    <p class="muted">Lush bamboo and golden monkeys — an easier but scenic trek.</p>
                </article>
                <article class="hk-card">
                    <div class="icon"><i class="fas fa-fire"></i></div>
                    <h3>Nyiragongo (DRC, 3,470m)</h3>
                    <p class="muted">Spend the night by a bubbling lava lake — a world wonder.</p>
                </article>
            </div>
        </div>
    </section>

    <!-- Suggested Itineraries -->
    <section class="section" style="background: var(--neutral-light);">
        <div class="container">
            <span class="eyebrow"><i class="fas fa-calendar-alt"></i> Suggested Itineraries</span>
            <h2 class="section-title" style="margin-top:.5rem;">Plan Your Trek</h2>
            <div class="itinerary-grid">
                <div class="itinerary-card">
                    <h3>1-Day Hike — Mount Bisoke</h3>
                    <ul class="muted">
                        <li>Morning: Depart Musanze, begin ascent through bamboo and hagenia forest.</li>
                        <li>Midday: Reach crater lake, explore summit.</li>
                        <li>Afternoon: Descend and return to Musanze.</li>
                    </ul>
                </div>
                <div class="itinerary-card">
                    <h3>2-Day Hike — Mount Karisimbi</h3>
                    <ul class="muted">
                        <li>Day 1: Trek volcanic slopes; camp at 3,700m beneath the stars.</li>
                        <li>Day 2: Pre-dawn push to summit, panoramic sunrise over the massif; descend.</li>
                    </ul>
                </div>
                <div class="itinerary-card">
                    <h3>2-Day Hike — Mount Nyiragongo</h3>
                    <ul class="muted">
                        <li>Day 1: Ascend lava fields and forest to summit cabins overlooking the lava lake; overnight.</li>
                        <li>Day 2: Morning descent back to Goma.</li>
                    </ul>
                </div>
            </div>
            <div class="itinerary-note muted">Multi-Day Circuit (Rwanda): Day 1 Bisoke, Days 2–3 Karisimbi, Day 4 Muhabura, Day 5 Gahinga or Sabyinyo — a perfect 5-day challenge.</div>
        </div>
    </section>

    <!-- Packing List -->
    <section class="section">
        <div class="container">
            <span class="eyebrow"><i class="fas fa-backpack"></i> What You Should Bring</span>
            <h2 class="section-title" style="margin-top:.5rem;">Essential Gear</h2>
            <div class="checklist-grid">
                <label class="check-item"><input type="checkbox" disabled checked /><span>Sturdy waterproof hiking boots</span></label>
                <label class="check-item"><input type="checkbox" disabled checked /><span>Warm layered clothing (freezing nights at altitude)</span></label>
                <label class="check-item"><input type="checkbox" disabled checked /><span>Sleeping bag (for Karisimbi & Nyiragongo)</span></label>
                <label class="check-item"><input type="checkbox" disabled checked /><span>Rain gear and gaiters</span></label>
                <label class="check-item"><input type="checkbox" disabled checked /><span>Trekking poles</span></label>
                <label class="check-item"><input type="checkbox" disabled checked /><span>Headlamp with extra batteries</span></label>
                <label class="check-item"><input type="checkbox" disabled checked /><span>Snacks and high-energy foods</span></label>
                <label class="check-item"><input type="checkbox" disabled checked /><span>Reusable water bottle and purification tablets</span></label>
                <label class="check-item"><input type="checkbox" disabled checked /><span>Personal first-aid kit</span></label>
                <label class="check-item"><input type="checkbox" disabled checked /><span>Camera (weather-sealed preferred)</span></label>
            </div>
        </div>
    </section>

    <!-- CTA Slogan -->
    <section class="cta-section">
        <div class="container">
            <div class="cta-content">
                <h2>“Climb the Virunga Peaks — Where Fire, Mist, and Spirit Meet.”</h2>
                <p class="muted">Ready to take on the massif? Our team will tailor your trek to your goals, experience, and season.</p>
                <div class="cta-buttons">
                    <a href="../pages/contactus.php" class="cta-btn primary"><i class="fas fa-envelope"></i> Contact Us</a>
                    <a href="./build.php" class="cta-btn"><i class="fas fa-calendar-alt"></i> Plan Your Hike</a>
                </div>
            </div>
        </div>
    </section>

    <?php include './includes/footer.php'; ?>
</body>
</html>