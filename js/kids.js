// Sticky image until content scrolling is complete
let parallaxImage = document.querySelector(".parallax-image");
let contentContainer = document.querySelector(".content-container");
let parallaxSection = document.querySelector(".parallax-section");

function updateStickyImage() {
  if (window.innerWidth > 1024) {
    let sectionRect = parallaxSection.getBoundingClientRect();
    let contentHeight = contentContainer.offsetHeight;
    let viewportHeight = window.innerHeight;

    // Calculate if we've scrolled through all the content
    let scrollProgress =
      Math.abs(sectionRect.top) / Math.max(1, contentHeight - viewportHeight);

    if (sectionRect.top <= 0 && sectionRect.bottom > viewportHeight) {
      // Keep image fixed while scrolling through content
      parallaxImage.style.position = "fixed";
      parallaxImage.style.top = "0";
    } else if (sectionRect.bottom <= viewportHeight) {
      // Once content is fully scrolled, let image scroll normally
      parallaxImage.style.position = "absolute";
      parallaxImage.style.top = "auto";
      parallaxImage.style.bottom = "0";
    } else {
      // Before reaching the section
      parallaxImage.style.position = "absolute";
      parallaxImage.style.top = "0";
      parallaxImage.style.bottom = "auto";
    }
  } else {
    // Reset for mobile
    parallaxImage.style.position = "relative";
  }
}

// Smooth scrolling effect
let ticking = false;

function requestTick() {
  if (!ticking) {
    requestAnimationFrame(updateStickyImage);
    ticking = true;
  }
}

function handleScroll() {
  requestTick();
  ticking = false;
}

window.addEventListener("scroll", handleScroll);
window.addEventListener("resize", () => {
  if (window.innerWidth <= 1024) {
    parallaxImage.style.position = "relative";
  }
});

// Initialize
updateStickyImage();
