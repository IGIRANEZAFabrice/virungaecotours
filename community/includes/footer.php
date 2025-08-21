    </main>
    <!-- End Main Content Wrapper -->  
    <footer class="community-footer">
        <!-- Main Footer Content -->
        <div class="footer-main">
            <div class="container">
                <div class="footer-grid">
                    <!-- About Section -->
                    <div class="footer-column about-column">
                        <div class="footer-logo">
                            <img src="../images/logos/logo.png" alt="Virunga Ecotours Community Programs">
                            <div class="logo-text">
                                <h4>Community Programs</h4>
                                <span>Virunga Ecotours</span>
                            </div>
                        </div>
                        <p class="footer-description">
                            Empowering communities across Rwanda, DRC Congo, and Uganda through sustainable development, 
                            conservation education, and economic opportunities in the Virunga Massif region.
                        </p>
                    </div>

                    <!-- Quick Links -->
                    <div class="footer-column links-column">
                        <h4 class="footer-title">Quick Links</h4>
                        <ul class="footer-links">
                            <li><a href="index.php">Home</a></li>
                            <li><a href="about.php"> About Us</a></li>
                            <li><a href="programs.php"> Our Programs</a></li>
                            <li><a href="contact.php"> Contact Us</a></li>
                            <li><a href="impact.php">Community Impact</a></li>
                        </ul>
                    </div>

                    <!-- Programs by Country -->
                    <div class="footer-column programs-column">
                        <h4 class="footer-title">Programs by Region</h4>
                        <ul class="footer-links">
                            <li>
                                <a href="programs.php?country=rwanda">
                                    <i class="fas fa-map-marker-alt"></i> 
                                    Rwanda Programs
                                </a>
                            </li>
                            <li>
                                <a href="programs.php?country=uganda">
                                    <i class="fas fa-map-marker-alt"></i> 
                                    Uganda Programs
                                </a>
                            </li>
                            <li>
                                <a href="programs.php?country=congo">
                                    <i class="fas fa-map-marker-alt"></i> 
                                    DRC Congo Programs
                                </a>
                            </li>
                        </ul>
                    </div>

                    <!-- Contact & Get Involved -->
                    <div class="footer-column contact-column">
                        <h4 class="footer-title">Get Involved</h4>
                        <div class="contact-info">
                            <div class="contact-item">
                                <i class="fas fa-envelope"></i>
                                <div class="contact-details">
                                    <span class="contact-label">Email</span>
                                    <a href="mailto:community@virungaecotours.com">info@virungaecotours.com</a>
                                </div>
                            </div>
                            <div class="contact-item">
                                <i class="fas fa-phone"></i>
                                <div class="contact-details">
                                    <span class="contact-label">Phone</span>
                                    <a href="tel:+250784513435">+(250) 784 513 435</a>
                                </div>
                            </div>
                            <div class="contact-item">
                                <i class="fas fa-map-marker-alt"></i>
                                <div class="contact-details">
                                    <span class="contact-label">Location</span>
                                    <span>Virunga Massif Region<br>Rwanda, Uganda, DRC Congo</span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Social Media & Partners Section -->
        <div class="footer-social-section">
            <div class="container">
                <div class="social-content">
                    <div class="social-links-section">
                        <h4>Follow Our Journey</h4>
                        <div class="social-links">
                            <a href="https://www.facebook.com/VirungaPrograms" target="_blank" rel="noopener" class="social-link facebook" aria-label="Follow us on Facebook">
                                <i class="fab fa-facebook-f"></i>
                            </a>
                            <a href="https://www.instagram.com/virunga_ecotours" target="_blank" rel="noopener" class="social-link instagram" aria-label="Follow us on Instagram">
                                <i class="fab fa-instagram"></i>
                            </a>
                            <a href="https://www.linkedin.com/in/virunga-ecotours-863a221b1" target="_blank" rel="noopener" class="social-link linkedin" aria-label="Connect on LinkedIn">
                                <i class="fab fa-linkedin-in"></i>
                            </a>
                            <a href="https://www.youtube.com/@virungaecotours8285" target="_blank" rel="noopener" class="social-link youtube" aria-label="Subscribe to our YouTube channel">
                                <i class="fab fa-youtube"></i>
                            </a>
                            <a href="https://wa.me/250784513435" target="_blank" rel="noopener" class="social-link whatsapp" aria-label="Contact us on WhatsApp">
                                <i class="fab fa-whatsapp"></i>
                            </a>
                        </div>
                    </div>

                    <div class="partners-section">
                        <h4>Our Partners</h4>
                        <div class="partners-logos">
                            <img src="../images/paterners/5826ffd90d544fbc8a11b429ef2fb87b.png" alt="Partner Organization" class="partner-logo">
                            <img src="../images/paterners/FoT Master_RGB.png" alt="Partner Organization" class="partner-logo">
                            <img src="../images/paterners/Mellon_Foundation_logo_2022.svg.png" alt="Partner Organization" class="partner-logo">
                            <img src="../images/paterners/WEB-LOGO-01.png" alt="Partner Organization" class="partner-logo">
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Footer Bottom -->
        <div class="footer-bottom">
            <div class="container">
                <div class="footer-bottom-content">
                    <div class="copyright">
                        <p>&copy; <?php echo date('Y'); ?> Virunga Ecotours Community Programs. All rights reserved.</p>
                        <p class="tagline">Building stronger communities, preserving nature's heritage.</p>
                    </div>
                    
                    <div class="footer-bottom-links">
                        <a href="../pages/privacy.php" class="footer-link">Privacy Policy</a>
                        <a href="../pages/faq-page.php" class="footer-link">Terms of Service</a>
                        <a href="contact.php" class="footer-link">Contact</a>
                        <a href="../index.php" class="footer-link main-site">Main Website</a>
                    </div>
                </div>
            </div>
        </div>

        <!-- Back to Top Button -->
        <button class="back-to-top" id="backToTop" aria-label="Back to top">
            <i class="fas fa-chevron-up"></i>
        </button>
    </footer>

    <!-- JavaScript Files -->
    <script src="assets/js/community-header-footer.js"></script>
    
    <script>
        // Newsletter form submission
        document.getElementById('communityNewsletterForm').addEventListener('submit', function(e) {
            e.preventDefault();
            
            const email = document.getElementById('newsletterEmail').value;
            const messageDiv = document.getElementById('newsletterMessage');
            const submitBtn = this.querySelector('button[type="submit"]');
            
            // Disable button during submission
            submitBtn.disabled = true;
            submitBtn.innerHTML = '<i class="fas fa-spinner fa-spin"></i> <span>Subscribing...</span>';
            
            // Simulate API call (replace with actual endpoint)
            fetch('../includes/save-subscriber.php', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/x-www-form-urlencoded',
                },
                body: 'email=' + encodeURIComponent(email)
            })
            .then(response => response.json())
            .then(data => {
                messageDiv.textContent = data.message;
                messageDiv.className = 'newsletter-message ' + (data.success ? 'success' : 'error');
                messageDiv.style.display = 'block';
                
                if (data.success) {
                    document.getElementById('newsletterEmail').value = '';
                    setTimeout(() => {
                        messageDiv.style.display = 'none';
                    }, 5000);
                }
            })
            .catch(error => {
                console.error('Error:', error);
                messageDiv.textContent = 'An error occurred. Please try again.';
                messageDiv.className = 'newsletter-message error';
                messageDiv.style.display = 'block';
            })
            .finally(() => {
                submitBtn.disabled = false;
                submitBtn.innerHTML = '<i class="fas fa-paper-plane"></i> <span>Subscribe</span>';
            });
        });

        // Back to top functionality
        const backToTopBtn = document.getElementById('backToTop');
        
        window.addEventListener('scroll', function() {
            if (window.pageYOffset > 300) {
                backToTopBtn.classList.add('visible');
            } else {
                backToTopBtn.classList.remove('visible');
            }
        });
        
        backToTopBtn.addEventListener('click', function() {
            window.scrollTo({
                top: 0,
                behavior: 'smooth'
            });
        });
    </script>
</body>
</html>
