<?php
require_once('../admin/config/connection.php');

// Fetch all gorilla families grouped by country
$families_by_country = [];
$query = "SELECT * FROM gorilla_families WHERE is_active = 1 ORDER BY country, sort_order";
$result = $conn->query($query);

if ($result) {
    while ($row = $result->fetch_assoc()) {
        $country = $row['country'];
        if (!isset($families_by_country[$country])) {
            $families_by_country[$country] = [];
        }
        $families_by_country[$country][] = $row;
    }
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Mountain Gorillas - Virunga Ecotours</title>
    <link rel="stylesheet" href="../css/style.css">
    <link rel="stylesheet" href="../css/gorilla-modern.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
</head>
<body>


    <!-- Hero Section -->
    <section class="hero-section" style="background: linear-gradient(rgba(0,0,0,0.5), rgba(0,0,0,0.5)), url('../images/gorilla-hero.jpg') center/cover; min-height: 500px; display: flex; align-items: center; justify-content: center; color: white; text-align: center;">
        <div class="hero-content">
            <h1 style="font-size: 48px; margin-bottom: 20px;">Mountain Gorillas of Virunga</h1>
            <p style="font-size: 20px; max-width: 600px; margin: 0 auto;">Discover the majestic mountain gorillas and their fascinating families across Rwanda, Uganda, and the Democratic Republic of Congo</p>
        </div>
    </section>

    <!-- Gorilla Families Section -->
    <section class="families-section">
        <div class="container">
            <div class="section-header">
                <h2>Gorilla Families</h2>
                <p>Explore the diverse gorilla families across the Virunga Massif. Click on any family to learn more about their unique stories and characteristics.</p>
            </div>

            <!-- Country Tabs -->
            <div class="country-tabs">
                <?php foreach ($families_by_country as $country => $families): ?>
                    <button class="tab-btn <?php echo $country === 'Rwanda' ? 'active' : ''; ?>" onclick="switchCountry('<?php echo $country; ?>')">
                        <span><?php echo $country; ?></span>
                        <span class="tab-count"><?php echo count($families); ?> families</span>
                    </button>
                <?php endforeach; ?>
            </div>

            <!-- Country Content -->
            <?php foreach ($families_by_country as $country => $families): ?>
                <div class="country-content <?php echo $country === 'Rwanda' ? 'active' : ''; ?>" id="content-<?php echo $country; ?>">
                    <div class="country-intro">
                        <h3><?php echo $country; ?> Gorilla Families</h3>
                    </div>

                    <div class="families-grid">
                        <?php foreach ($families as $family): ?>
                            <div class="family-card" onclick="openModal(<?php echo htmlspecialchars(json_encode($family)); ?>)">
                                <div class="family-header">
                                    <h5><?php echo htmlspecialchars($family['family_name']); ?></h5>
                                    <span class="family-size"><?php echo htmlspecialchars($family['family_size']); ?></span>
                                </div>

                                <p><?php echo htmlspecialchars(substr($family['description'], 0, 150)); ?>...</p>

                                <?php if ($family['characteristics']): ?>
                                    <div class="family-tags">
                                        <?php 
                                        $tags = array_map('trim', explode(',', $family['characteristics']));
                                        foreach (array_slice($tags, 0, 3) as $tag): 
                                        ?>
                                            <span class="tag"><?php echo htmlspecialchars($tag); ?></span>
                                        <?php endforeach; ?>
                                    </div>
                                <?php endif; ?>

                                <button class="view-details-btn" onclick="event.stopPropagation();">
                                    <i class="fas fa-arrow-right"></i> View Details
                                </button>
                            </div>
                        <?php endforeach; ?>
                    </div>
                </div>
            <?php endforeach; ?>
        </div>
    </section>

    <!-- Modal -->
    <div id="familyModal" class="modal">
        <div style="position: relative; width: 100%; display: flex; align-items: center; justify-content: center;">
            <span class="close-modal" onclick="closeModal()">&times;</span>
            <div class="modal-content">
                <div class="modal-header">
                    <h2 id="modalFamilyName"></h2>
                    <div class="family-meta">
                        <span><i class="fas fa-map-marker-alt"></i> <span id="modalRegion"></span></span>
                        <span><i class="fas fa-users"></i> <span id="modalSize"></span></span>
                        <span id="silverbackSpan" style="display: none;"><i class="fas fa-crown"></i> Silverback: <span id="modalSilverback"></span></span>
                    </div>
                </div>

                <div class="modal-section">
                    <h3>About This Family</h3>
                    <p id="modalDescription"></p>
                </div>

                <div class="modal-section" id="characteristicsSection" style="display: none;">
                    <h3>Characteristics</h3>
                    <div class="modal-tags" id="modalCharacteristics"></div>
                </div>

                <div class="modal-section" id="historySection" style="display: none;">
                    <h3>History</h3>
                    <p id="modalHistory"></p>
                </div>

                <div class="modal-section" id="specialFeaturesSection" style="display: none;">
                    <h3>Special Features</h3>
                    <p id="modalSpecialFeatures"></p>
                </div>

                <div class="family-categories">
                    <h4>Family Information</h4>
                    <p><strong>Habituated:</strong> <span id="modalHabituated"></span></p>
                    <p><strong>Country:</strong> <span id="modalCountry"></span></p>
                </div>
            </div>
        </div>
    </div>


    <script>
        function switchCountry(country) {
            // Hide all country contents
            document.querySelectorAll('.country-content').forEach(el => {
                el.classList.remove('active');
            });

            // Remove active class from all tabs
            document.querySelectorAll('.tab-btn').forEach(btn => {
                btn.classList.remove('active');
            });

            // Show selected country content
            document.getElementById('content-' + country).classList.add('active');

            // Add active class to clicked tab
            event.target.closest('.tab-btn').classList.add('active');
        }

        function openModal(family) {
            // Check if family has details to show
            if (!family.description && !family.history && !family.special_features && !family.characteristics) {
                alert('No detailed information available for this family.');
                return;
            }

            // Populate modal with family data
            document.getElementById('modalFamilyName').textContent = family.family_name;
            document.getElementById('modalRegion').textContent = family.region || 'N/A';
            document.getElementById('modalSize').textContent = family.family_size || 'N/A';
            document.getElementById('modalDescription').textContent = family.description || 'No description available.';
            document.getElementById('modalCountry').textContent = family.country;
            document.getElementById('modalHabituated').textContent = family.is_habituated ? 'Yes' : 'No';

            // Handle silverback
            if (family.silverback_name) {
                document.getElementById('silverbackSpan').style.display = 'inline-block';
                document.getElementById('modalSilverback').textContent = family.silverback_name;
            } else {
                document.getElementById('silverbackSpan').style.display = 'none';
            }

            // Handle characteristics
            if (family.characteristics) {
                const characteristicsDiv = document.getElementById('modalCharacteristics');
                characteristicsDiv.innerHTML = '';
                const tags = family.characteristics.split(',').map(t => t.trim());
                tags.forEach(tag => {
                    const tagEl = document.createElement('span');
                    tagEl.className = 'modal-tag';
                    tagEl.textContent = tag;
                    characteristicsDiv.appendChild(tagEl);
                });
                document.getElementById('characteristicsSection').style.display = 'block';
            } else {
                document.getElementById('characteristicsSection').style.display = 'none';
            }

            // Handle history
            if (family.history) {
                document.getElementById('modalHistory').textContent = family.history;
                document.getElementById('historySection').style.display = 'block';
            } else {
                document.getElementById('historySection').style.display = 'none';
            }

            // Handle special features
            if (family.special_features) {
                document.getElementById('modalSpecialFeatures').textContent = family.special_features;
                document.getElementById('specialFeaturesSection').style.display = 'block';
            } else {
                document.getElementById('specialFeaturesSection').style.display = 'none';
            }

            // Show modal
            document.getElementById('familyModal').classList.add('show');
        }

        function closeModal() {
            document.getElementById('familyModal').classList.remove('show');
        }

        // Close modal when clicking outside
        window.onclick = function(event) {
            const modal = document.getElementById('familyModal');
            if (event.target === modal) {
                closeModal();
            }
        }
    </script>
</body>
</html>

