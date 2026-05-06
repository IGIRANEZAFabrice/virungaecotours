<?php require_once '../admin/config/connection.php'; ?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Stays Around the Virunga Massif | Lodges, Hotels, Homestays | Virunga Ecotours</title>
    <meta name="description" content="Explore luxury lodges, mid-range hotels, and community homestays across the Virunga Massif. Support conservation, empower communities, and enjoy authentic cultural stays.">
    <meta name="keywords" content="Virunga hotels, Volcanoes NP lodges, Musanze homestays, luxury lodges Rwanda, community homestay Virunga, mid-range hotels Kinigi">

    <link rel="icon" type="image/x-icon" href="../images/favicon.ico" />
    <link rel="apple-touch-icon" sizes="180x180" href="../images/apple-touch-icon.png" />
    <link rel="icon" type="image/png" sizes="32x32" href="../images/favicon-32x32.png" />
    <link rel="icon" type="image/png" sizes="16x16" href="../images/favicon-16x16.png" />

    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" />

    <link rel="stylesheet" href="../css/earthy-theme.css" />
    <link rel="stylesheet" href="../css/header.css" />
    <link rel="stylesheet" href="../css/hotels.css" />
</head>
<body>
    <?php include './includes/header.php'; ?>
<section class="hero">
            <div class="hero-content">
                <h1>Stays Around the <span class="highlight-text">Virunga Massif</span></h1>
                <p>Experience the remarkable landscapes of Rwanda, Uganda, and the Democratic Republic of Congo—home to towering volcanoes, rare mountain gorillas, golden monkeys, and vibrant local cultures. Every stay contributes to conservation, empowers local communities, and offers authentic cultural exchanges.</p>
            </div>
        </section>
    
    <div class="container">
        <!-- intro -->
        <!-- Quick Intro -->

        <div class="container">
            <p class="lead">While traveling near the Virunga Massif, you’ll have plenty of places to stay—ranging from luxury lodges and mid‑range hotels to community homestays. It’s easy to find an option that fits your comfort, and purpose, all while supporting conservation and local communities.</p>
        </div>


        <!-- High-End Lodges Section -->
        <section class="section">
            <div class="section-header">
                <h2><i class="fas fa-gem"></i> High-End Lodges</h2>
                <p>Luxury Stays with Major Conservation Impact</p>
            </div>

            <div class="lodge-grid">
                <div class="lodge-card">
                    <div class="lodge-name">Bisate Lodge (Wilderness Safaris)</div>
                    <div class="lodge-location">Rwanda – Volcanoes NP</div>
                    <div class="lodge-highlights">Iconic "nest-shaped" villas with volcano views</div>
                    <div class="lodge-support">
                        <strong>Conservation Impact:</strong> Large-scale reforestation (100k+ trees), community education, sustainable design
                    </div>
                </div>

                <div class="lodge-card">
                    <div class="lodge-name">Sabyinyo Silverback Lodge</div>
                    <div class="lodge-location">Rwanda – Kinigi</div>
                    <div class="lodge-highlights">Luxury cottages close to park HQ</div>
                    <div class="lodge-support">
                        <strong>Community Impact:</strong> Rwanda's first community-owned lodge; revenues go to SACOLA trust funding schools & livelihoods
                    </div>
                </div>

                <div class="lodge-card">
                    <div class="lodge-name">Singita Kwitonda Lodge & Kataza House</div>
                    <div class="lodge-location">Rwanda – Edge of Volcanoes NP</div>
                    <div class="lodge-highlights">Contemporary suites, private pools</div>
                    <div class="lodge-support">
                        <strong>Sustainability:</strong> On-site nursery, organic gardens, community outreach
                    </div>
                </div>

                <div class="lodge-card">
                    <div class="lodge-name">One&Only Gorilla's Nest</div>
                    <div class="lodge-location">Rwanda – Kinigi</div>
                    <div class="lodge-highlights">High-end wellness resort in eucalyptus groves</div>
                    <div class="lodge-support">
                        <strong>Programs:</strong> Sustainability programs and local employment
                    </div>
                </div>

                <div class="lodge-card">
                    <div class="lodge-name">Virunga Lodge (Volcanoes Safaris)</div>
                    <div class="lodge-location">Rwanda – Ridge above Twin Lakes</div>
                    <div class="lodge-highlights">Panoramic views of lakes & volcanoes</div>
                    <div class="lodge-support">
                        <strong>VSPT Projects:</strong> Water tanks, solar power, cultural village walks
                    </div>
                </div>

                <div class="lodge-card">
                    <div class="lodge-name">Mount Gahinga Lodge</div>
                    <div class="lodge-location">Uganda – Mgahinga NP</div>
                    <div class="lodge-highlights">Boutique luxury lodge</div>
                    <div class="lodge-support">
                        <strong>Community Support:</strong> Built permanent Batwa Village, ongoing community & education projects
                    </div>
                </div>
            </div>
        </section>

        <!-- Mid-Range Section -->
        <section class="section">
            <div class="section-header">
                <h2><i class="fas fa-hotel"></i> Mid-Range Hotels & Homestays</h2>
                <p>Value & Culture with Strong Community Connection</p>
            </div>

            <div class="stays-table">
                <div class="table-container">
                    <table>
                        <thead>
                            <tr>
                                <th>Stay</th>
                                <th>Location</th>
                                <th>Type</th>
                                <th>Why Stay Here</th>
                                <th>Community & Nature Support</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>
                                    <div class="stay-name">Five Volcanoes Boutique Hotel</div>
                                </td>
                                <td>Rwanda – Kinigi</td>
                                <td><span class="stay-type">Upper mid-range</span></td>
                                <td>Pool, easy park access</td>
                                <td>Local staff, links with Dian Fossey Fund</td>
                            </tr>
                            <tr>
                                <td>
                                    <div class="stay-name">Virunga Homestay</div>
                                </td>
                                <td>Rwanda – Musanze</td>
                                <td><span class="stay-type">Homestay</span></td>
                                <td>Warm hospitality, volcano views, authentic immersion</td>
                                <td>Run by local family, creates jobs & preserves traditions</td>
                            </tr>
                            <tr>
                                <td>
                                    <div class="stay-name">Farmhouse Rwanda</div>
                                </td>
                                <td>Rwanda – Musanze</td>
                                <td><span class="stay-type">Farmstay</span></td>
                                <td>Farm-to-table luxury on working farm</td>
                                <td>Sustainable agriculture & community tours</td>
                            </tr>
                            <tr>
                                <td>
                                    <div class="stay-name">Red Rocks Rwanda</div>
                                </td>
                                <td>Rwanda – Musanze</td>
                                <td><span class="stay-type">Community guesthouse</span></td>
                                <td>Budget-friendly with cultural workshops</td>
                                <td>Social enterprise supporting conservation education</td>
                            </tr>
                            <tr>
                                <td>
                                    <div class="stay-name">Mutanda Lake Resort</div>
                                </td>
                                <td>Uganda – Lake Mutanda</td>
                                <td><span class="stay-type">Mid-range resort</span></td>
                                <td>Stunning lakeside setting</td>
                                <td>Tourism revenue supports local livelihoods</td>
                            </tr>
                            <tr>
                                <td>
                                    <div class="stay-name">Travellers Rest Hotel</div>
                                </td>
                                <td>Uganda – Kisoro</td>
                                <td><span class="stay-type">Historic hotel</span></td>
                                <td>Dian Fossey's "second home"</td>
                                <td>Historic role in gorilla conservation</td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </section>

        <!-- Importance Section -->
        <section class="section">
            <div class="section-header">
                <h2><i class="fas fa-heart"></i> Importance of These Stays</h2>
                <p>Every night spent makes a difference</p>
            </div>

            <div class="importance-grid">
                <div class="importance-item">
                    <div class="importance-icon"><i class="fas fa-paw"></i></div>
                    <div class="importance-title">Conservation Funding</div>
                    <p>Lodge revenues and park fees support gorilla monitoring, anti-poaching patrols, and habitat restoration.</p>
                </div>

                <div class="importance-item">
                    <div class="importance-icon"><i class="fas fa-users"></i></div>
                    <div class="importance-title">Community Empowerment</div>
                    <p>Many lodges are community-owned or employ locals, ensuring tourism benefits flow directly to villages near the parks.</p>
                </div>

                <div class="importance-item">
                    <div class="importance-icon"><i class="fas fa-landmark"></i></div>
                    <div class="importance-title">Cultural Preservation</div>
                    <p>Homestays and community lodges provide authentic cultural experiences while safeguarding traditions.</p>
                </div>

                <div class="importance-item">
                    <div class="importance-icon"><i class="fas fa-leaf"></i></div>
                    <div class="importance-title">Sustainable Travel</div>
                    <p>From plastic-free policies to farm-to-table dining and reforestation, these stays model responsible tourism practices.</p>
                </div>
            </div>
        </section>

        <!-- Closing Section -->
        <section class="closing">
            <div class="closing-content">
                <p>Whether you choose a luxury lodge with panoramic views or a homestay like Virunga Homestay, your stay in the Virungas is not just a travel experience—it's a contribution to protecting endangered gorillas, preserving forests, and supporting the people who call this land home.</p>
                
                <div class="slogan">
                    "Stay in the Virungas – Where Every Night Spent Protects Nature and Empowers Communities."
                </div>
            </div>
        </section>
    </div>


    <?php include './includes/footer.php'; ?>
    <script src="../js/header.js" defer></script>
</body>
</html>