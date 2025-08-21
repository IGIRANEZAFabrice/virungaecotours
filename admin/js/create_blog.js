/**
 * Create Blog JavaScript
 * Handles content block creation, gallery management, and form validation for new blog posts
 */

// Global variables
let blockCounter = 0;
let richTextEditors = new Map();

// Initialize when DOM is loaded
document.addEventListener("DOMContentLoaded", function () {
  initializeCreateBlogPage();
});

/**
 * Main initialization function
 */
function initializeCreateBlogPage() {
  console.log("Initializing Create Blog Page...");

  // Initialize form elements
  initializeFormElements();
  initializeGalleryManagement();
  initializeCoverImagePreview();

  console.log("Create Blog Page initialized successfully");
}

/**
 * Initialize form elements and event listeners
 */
function initializeFormElements() {
  // Add block buttons
  document.querySelectorAll(".add-block-btn").forEach((button) => {
    button.addEventListener("click", function () {
      const blockType = this.getAttribute("data-block-type");
      addContentBlock(blockType);
    });
  });

  // Form submission
  const blogForm = document.getElementById("blogForm");
  if (blogForm) {
    blogForm.addEventListener("submit", function (e) {
      if (!validateForm()) {
        e.preventDefault();
        showNotification(
          "Please fill in all required fields correctly.",
          "error"
        );
      }
    });
  }
}

/**
 * Initialize gallery management
 */
function initializeGalleryManagement() {
  document.querySelectorAll(".gallery-upload").forEach((input) => {
    input.addEventListener("change", function () {
      handleGalleryImagePreview(this);
    });
  });
}

/**
 * Initialize cover image preview
 */
function initializeCoverImagePreview() {
  const coverImageInput = document.getElementById("coverImage");
  if (coverImageInput) {
    coverImageInput.addEventListener("change", function () {
      handleCoverImagePreview(this);
    });
  }
}

/**
 * Handle cover image preview
 */
function handleCoverImagePreview(input) {
  const previewImg = document.getElementById("coverImagePreviewImg");

  if (input.files && input.files[0]) {
    const reader = new FileReader();

    reader.onload = function (e) {
      previewImg.src = e.target.result;
      previewImg.style.display = "block";
    };

    reader.readAsDataURL(input.files[0]);
  } else {
    previewImg.style.display = "none";
  }
}

/**
 * Handle gallery image preview
 */
function handleGalleryImagePreview(input) {
  const item = input.closest(".gallery-item");
  const preview = item.querySelector(".gallery-preview");
  const placeholder = item.querySelector(".gallery-placeholder i");

  if (input.files && input.files[0]) {
    const reader = new FileReader();

    reader.onload = function (e) {
      preview.src = e.target.result;
      preview.style.display = "block";
      placeholder.style.display = "none";
    };

    reader.readAsDataURL(input.files[0]);
  } else {
    preview.style.display = "none";
    placeholder.style.display = "block";
  }
}

/**
 * Add a new content block
 */
function addContentBlock(blockType) {
  const contentBlocks = document.getElementById("contentBlocks");
  blockCounter++;

  const currentBlockCount =
    contentBlocks.querySelectorAll(".content-block").length + 1;

  const blockElement = document.createElement("div");
  blockElement.className = "content-block";
  blockElement.setAttribute("data-block-type", blockType);

  let blockHTML = `
        <div class="block-header">
            <span class="block-title">${capitalizeFirst(
              blockType
            )} Block ${currentBlockCount}</span>
            <button type="button" class="remove-block">
                <i class="fas fa-times"></i>
            </button>
        </div>
    `;

  // Add block-specific content
  switch (blockType) {
    case "text":
      blockHTML += generateTextBlockHTML(blockCounter);
      break;
    case "image":
      blockHTML += generateImageBlockHTML(blockCounter);
      break;
  }

  blockElement.innerHTML = blockHTML;
  contentBlocks.appendChild(blockElement);

  // Initialize functionality for the new block
  initializeNewBlock(blockElement, blockType);

  // Scroll to new block
  setTimeout(() => {
    blockElement.scrollIntoView({ behavior: "smooth", block: "center" });
  }, 100);

  console.log(`Added new ${blockType} block`);
}

/**
 * Generate HTML for text block
 */
function generateTextBlockHTML(counter) {
  return `
        <div class="form-group">
            <label for="blockTitle${counter}">Section Title</label>
            <input
                type="text"
                id="blockTitle${counter}"
                name="blockTitle${counter}"
                placeholder="Enter section title"
            />
        </div>
        <div class="form-group">
            <label for="blockDescription${counter}">Content</label>
            <textarea
                id="blockDescription${counter}"
                name="blockDescription${counter}"
                placeholder="Write your content here"
            ></textarea>
        </div>
    `;
}

/**
 * Generate HTML for image block
 */
function generateImageBlockHTML(counter) {
  return `
        <div class="form-group">
            <label for="blockImageCaption${counter}">Image Caption</label>
            <input
                type="text"
                id="blockImageCaption${counter}"
                name="blockImageCaption${counter}"
                placeholder="Enter image caption"
            />
        </div>
        <div class="form-group">
            <label for="blockImage${counter}">Image</label>
            <input
                type="file"
                id="blockImage${counter}"
                name="blockImage${counter}"
                accept="image/*"
                class="block-image-input"
                data-block-id="${counter}"
            />
            <div class="image-preview" id="imagePreview${counter}"></div>
        </div>
        <div class="form-group">
            <label>Image Alignment</label>
            <div class="alignment-options">
                <label>
                    <input type="radio" name="blockImageAlignment${counter}" value="left" checked>
                    Left
                </label>
                <label>
                    <input type="radio" name="blockImageAlignment${counter}" value="center">
                    Center
                </label>
                <label>
                    <input type="radio" name="blockImageAlignment${counter}" value="right">
                    Right
                </label>
                <label>
                    <input type="radio" name="blockImageAlignment${counter}" value="full">
                    Full Width
                </label>
            </div>
        </div>
    `;
}

/**
 * Initialize functionality for a new block
 */
function initializeNewBlock(blockElement, blockType) {
  // Add remove button functionality
  const removeBtn = blockElement.querySelector(".remove-block");
  if (removeBtn) {
    removeBtn.addEventListener("click", function () {
      removeContentBlock(blockElement);
    });
  }

  // Initialize rich text editors for textareas
  blockElement.querySelectorAll("textarea").forEach((textarea) => {
    initializeRichTextEditor(textarea);
  });

  // Add image preview functionality for image blocks
  if (blockType === "image") {
    const fileInput = blockElement.querySelector('input[type="file"]');
    if (fileInput) {
      fileInput.addEventListener("change", function () {
        handleBlockImagePreview(this);
      });
    }
  }
}

/**
 * Handle image preview for content blocks
 */
function handleBlockImagePreview(input) {
  if (input.files && input.files[0]) {
    const file = input.files[0];
    const reader = new FileReader();

    // Get the block ID from the input's data attribute or ID
    const blockId =
      input.getAttribute("data-block-id") || input.id.replace("blockImage", "");

    // Find the specific preview container for this block
    let previewContainer = input.parentElement.querySelector(".image-preview");

    // If no preview container found, create one with unique ID
    if (!previewContainer) {
      previewContainer = document.createElement("div");
      previewContainer.className = "image-preview";
      previewContainer.id = `imagePreview${blockId}`;
      input.parentElement.appendChild(previewContainer);
    }

    reader.onload = function (e) {
      previewContainer.innerHTML = `<img src="${e.target.result}" alt="Preview" class="preview-image" style="max-width: 80%; height: auto; border-radius: 10px; margin-top: 10px; display: block;">`;
      previewContainer.classList.add("has-image");
    };

    reader.readAsDataURL(file);
  } else {
    // Reset preview if no file selected
    const previewContainer =
      input.parentElement.querySelector(".image-preview");
    if (previewContainer) {
      previewContainer.innerHTML = "";
      previewContainer.classList.remove("has-image");
    }
  }
}

/**
 * Remove a content block
 */
function removeContentBlock(block) {
  if (confirm("Are you sure you want to remove this content block?")) {
    // Clean up rich text editor if it exists
    const textareas = block.querySelectorAll("textarea");
    textareas.forEach((textarea) => {
      if (richTextEditors.has(textarea.id)) {
        richTextEditors.delete(textarea.id);
      }
    });

    block.remove();
    updateBlockNumbers();
    console.log("Content block removed");
  }
}

/**
 * Update block numbers and titles after changes
 */
function updateBlockNumbers() {
  const blocks = document.querySelectorAll(".content-block");
  blocks.forEach((block, index) => {
    const blockTitle = block.querySelector(".block-title");
    const blockType = block.getAttribute("data-block-type");

    if (blockTitle && blockType) {
      const capitalizedType = capitalizeFirst(blockType);
      blockTitle.textContent = `${capitalizedType} Block ${index + 1}`;
    }
  });
}

/**
 * Initialize rich text editor for a textarea
 */
function initializeRichTextEditor(textarea) {
  if (!textarea || richTextEditors.has(textarea.id)) {
    return; // Already initialized or invalid textarea
  }

  try {
    // Simple rich text functionality using contenteditable
    const wrapper = document.createElement("div");
    wrapper.className = "rich-text-wrapper";

    const toolbar = document.createElement("div");
    toolbar.className = "rich-text-toolbar";
    toolbar.innerHTML = `
            <button type="button" onclick="execCommand('bold')" title="Bold">
                <i class="fas fa-bold"></i>
            </button>
            <button type="button" onclick="execCommand('italic')" title="Italic">
                <i class="fas fa-italic"></i>
            </button>
            <button type="button" onclick="execCommand('underline')" title="Underline">
                <i class="fas fa-underline"></i>
            </button>
            <button type="button" onclick="execCommand('insertUnorderedList')" title="Bullet List">
                <i class="fas fa-list-ul"></i>
            </button>
            <button type="button" onclick="execCommand('insertOrderedList')" title="Numbered List">
                <i class="fas fa-list-ol"></i>
            </button>
            <span class="toolbar-divider">|</span>
            <button type="button" onclick="insertLink()" title="Insert Link">
                <i class="fas fa-link"></i>
            </button>
            <button type="button" onclick="execCommand('unlink')" title="Remove Link">
                <i class="fas fa-unlink"></i>
            </button>
            <span class="toolbar-divider">|</span>
            <button type="button" onclick="insertQuote()" title="Insert Quote">
                <i class="fas fa-quote-left"></i>
            </button>
        `;

    const editor = document.createElement("div");
    editor.className = "rich-text-editor";
    editor.contentEditable = true;
    editor.innerHTML = textarea.value;

    // Insert wrapper before textarea
    textarea.parentNode.insertBefore(wrapper, textarea);
    wrapper.appendChild(toolbar);
    wrapper.appendChild(editor);
    wrapper.appendChild(textarea);

    // Hide original textarea
    textarea.style.display = "none";

    // Sync content
    editor.addEventListener("input", function () {
      textarea.value = editor.innerHTML;
    });

    richTextEditors.set(textarea.id, {
      wrapper: wrapper,
      editor: editor,
      textarea: textarea,
    });

    console.log(`Rich text editor initialized for ${textarea.id}`);
  } catch (error) {
    console.error("Failed to initialize rich text editor:", error);
  }
}

/**
 * Execute rich text command
 */
function execCommand(command) {
  // Note: execCommand is deprecated but still widely supported
  // For production, consider using a modern rich text editor library
  document.execCommand(command, false, null);
}

/**
 * Insert a link in the rich text editor
 */
function insertLink() {
  const selection = window.getSelection();

  if (selection.rangeCount === 0) {
    showNotification(
      "Please place your cursor where you want to insert the link.",
      "warning"
    );
    return;
  }

  const selectedText = selection.toString().trim();
  let linkText = selectedText;
  let linkUrl = "";

  // If no text is selected, prompt for link text
  if (!linkText) {
    linkText = prompt("Enter the text to display for the link:");
    if (!linkText) {
      showNotification("Link creation cancelled.", "info");
      return;
    }
  }

  // Prompt for URL
  linkUrl = prompt("Enter the URL for the link:", "https://");
  if (!linkUrl) {
    showNotification("Link creation cancelled.", "info");
    return;
  }

  // Validate URL format
  if (!isValidUrl(linkUrl)) {
    showNotification(
      "Please enter a valid URL (e.g., https://example.com)",
      "error"
    );
    return;
  }

  // Create the link
  if (selectedText) {
    // Text was selected, just add the link
    document.execCommand("createLink", false, linkUrl);

    // Set target="_blank" for external links
    const links = document.querySelectorAll('a[href="' + linkUrl + '"]');
    links.forEach((link) => {
      link.target = "_blank";
      link.rel = "noopener noreferrer";
    });
  } else {
    // No text selected, insert new link
    const range = selection.getRangeAt(0);
    const link = document.createElement("a");
    link.href = linkUrl;
    link.textContent = linkText;
    link.target = "_blank";
    link.rel = "noopener noreferrer";

    range.deleteContents();
    range.insertNode(link);

    // Move cursor after the link
    range.setStartAfter(link);
    range.setEndAfter(link);
    selection.removeAllRanges();
    selection.addRange(range);
  }

  showNotification("Link inserted successfully!", "success");
}

/**
 * Validate URL format
 */
function isValidUrl(string) {
  try {
    new URL(string);
    return true;
  } catch (_) {
    return false;
  }
}

/**
 * Insert a quote in the rich text editor
 */
function insertQuote() {
  const selection = window.getSelection();

  if (selection.rangeCount === 0) {
    showNotification(
      "Please place your cursor where you want to insert the quote.",
      "warning"
    );
    return;
  }

  const selectedText = selection.toString().trim();
  let quoteText = selectedText;
  let quoteAuthor = "";

  // If no text is selected, prompt for quote text
  if (!quoteText) {
    quoteText = prompt("Enter the quote text:");
    if (!quoteText) {
      showNotification("Quote creation cancelled.", "info");
      return;
    }
  }

  // Prompt for author (optional)
  quoteAuthor = prompt("Enter the quote author (optional):");

  // Create the quote HTML
  const range = selection.getRangeAt(0);
  const quoteElement = document.createElement("blockquote");
  quoteElement.style.cssText = `
    border-left: 4px solid var(--primary-green, #2e7d32);
    margin: 20px 0;
    padding: 15px 20px;
    background: #f8f9fa;
    font-style: italic;
    position: relative;
  `;

  let quoteHTML = `<p style="margin: 0; font-size: 1.1em; line-height: 1.6;">"${quoteText}"</p>`;

  if (quoteAuthor) {
    quoteHTML += `<cite style="display: block; margin-top: 10px; font-size: 0.9em; color: #666; font-style: normal;">— ${quoteAuthor}</cite>`;
  }

  quoteElement.innerHTML = quoteHTML;

  if (selectedText) {
    // Replace selected text with quote
    range.deleteContents();
  }

  range.insertNode(quoteElement);

  // Move cursor after the quote
  range.setStartAfter(quoteElement);
  range.setEndAfter(quoteElement);
  selection.removeAllRanges();
  selection.addRange(range);

  showNotification("Quote inserted successfully!", "success");
}

/**
 * Validate the entire form
 */
function validateForm() {
  let isValid = true;
  const errors = [];

  // Validate required fields
  const requiredFields = [
    { id: "blogTitle", name: "Blog Title" },
    { id: "author", name: "Author" },
    { id: "readMin", name: "Read Time" },
    { id: "category", name: "Category" },
    { id: "bigTitle", name: "Main Headline" },
    { id: "bigDescription", name: "Introduction" },
    { id: "coverImage", name: "Cover Image" },
  ];

  requiredFields.forEach((field) => {
    const element = document.getElementById(field.id);
    if (element && !element.value.trim()) {
      isValid = false;
      errors.push(`${field.name} is required`);
      element.style.borderColor = "#dc3545";
    } else if (element) {
      element.style.borderColor = "";
    }
  });

  // Validate content blocks
  const contentBlocks = document.querySelectorAll(".content-block");
  if (contentBlocks.length === 0) {
    isValid = false;
    errors.push("At least one content block is required");
  }

  contentBlocks.forEach((block, index) => {
    const blockType = block.getAttribute("data-block-type");
    const blockNumber = index + 1;

    switch (blockType) {
      case "text":
        const textContent = block.querySelector(
          'textarea[name^="blockDescription"]'
        );
        if (textContent && !textContent.value.trim()) {
          isValid = false;
          errors.push(`Text Block ${blockNumber} content is required`);
        }
        break;

      case "image":
        const imageInput = block.querySelector('input[type="file"]');
        if (
          imageInput &&
          (!imageInput.files || imageInput.files.length === 0)
        ) {
          isValid = false;
          errors.push(`Image Block ${blockNumber} requires an image`);
        }
        break;
    }
  });

  // Show errors if any
  if (!isValid) {
    showNotification(errors.join("<br>"), "error");
  }

  return isValid;
}

/**
 * Capitalize first letter of a string
 */
function capitalizeFirst(str) {
  return str.charAt(0).toUpperCase() + str.slice(1);
}

/**
 * Show notification to user
 */
function showNotification(message, type = "info") {
  // Remove existing notifications
  const existingNotifications = document.querySelectorAll(".notification");
  existingNotifications.forEach((notification) => notification.remove());

  const notification = document.createElement("div");
  notification.className = `notification notification-${type}`;
  notification.innerHTML = `
        <div class="notification-content">
            <i class="fas ${getNotificationIcon(type)}"></i>
            <span>${message}</span>
        </div>
        <button class="notification-close" onclick="this.parentElement.remove()">
            <i class="fas fa-times"></i>
        </button>
    `;

  // Add styles
  notification.style.cssText = `
        position: fixed;
        top: 20px;
        right: 20px;
        padding: 15px 20px;
        border-radius: 8px;
        color: white;
        font-weight: 500;
        z-index: 1000;
        max-width: 400px;
        box-shadow: 0 4px 12px rgba(0,0,0,0.15);
        animation: slideIn 0.3s ease-out;
    `;

  // Set background color based on type
  switch (type) {
    case "success":
      notification.style.backgroundColor = "#28a745";
      break;
    case "error":
      notification.style.backgroundColor = "#dc3545";
      break;
    case "warning":
      notification.style.backgroundColor = "#ffc107";
      notification.style.color = "#212529";
      break;
    default:
      notification.style.backgroundColor = "#17a2b8";
  }

  document.body.appendChild(notification);

  // Auto-remove after 5 seconds
  setTimeout(() => {
    if (notification.parentElement) {
      notification.style.animation = "slideOut 0.3s ease-in";
      setTimeout(() => notification.remove(), 300);
    }
  }, 5000);
}

/**
 * Get notification icon based on type
 */
function getNotificationIcon(type) {
  switch (type) {
    case "success":
      return "fa-check-circle";
    case "error":
      return "fa-exclamation-circle";
    case "warning":
      return "fa-exclamation-triangle";
    default:
      return "fa-info-circle";
  }
}

// Make functions available globally for inline event handlers
window.execCommand = execCommand;
window.insertLink = insertLink;
window.insertQuote = insertQuote;

// Add CSS animations
const style = document.createElement("style");
style.textContent = `
    @keyframes slideIn {
        from { transform: translateX(100%); opacity: 0; }
        to { transform: translateX(0); opacity: 1; }
    }

    @keyframes slideOut {
        from { transform: translateX(0); opacity: 1; }
        to { transform: translateX(100%); opacity: 0; }
    }

    .rich-text-toolbar {
        border: 1px solid #ddd;
        border-bottom: none;
        padding: 8px;
        background: #f8f9fa;
        border-radius: 4px 4px 0 0;
    }

    .rich-text-toolbar button {
        background: none;
        border: 1px solid transparent;
        padding: 6px 8px;
        margin-right: 4px;
        border-radius: 3px;
        cursor: pointer;
    }

    .rich-text-toolbar button:hover {
        background: #e9ecef;
        border-color: #adb5bd;
    }

    .toolbar-divider {
        margin: 0 8px;
        color: #dee2e6;
        font-weight: normal;
        user-select: none;
    }

    .rich-text-editor {
        border: 1px solid #ddd;
        border-radius: 0 0 4px 4px;
        padding: 12px;
        min-height: 100px;
        background: white;
    }

    .rich-text-editor:focus {
        outline: none;
        border-color: var(--primary-green);
        box-shadow: 0 0 0 2px rgba(46, 125, 50, 0.2);
    }

    .notification {
        display: flex;
        align-items: center;
        justify-content: space-between;
    }

    .notification-content {
        display: flex;
        align-items: center;
        gap: 10px;
    }

    .notification-close {
        background: none;
        border: none;
        color: inherit;
        cursor: pointer;
        padding: 4px;
        margin-left: 10px;
    }
`;
document.head.appendChild(style);

console.log("Create Blog JavaScript loaded successfully");
