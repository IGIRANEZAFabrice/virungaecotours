document.addEventListener("DOMContentLoaded", function () {
  // New Category functionality
  const tourCategorySelect = document.getElementById("tourCategory");
  const newCategoryContainer = document.getElementById("newCategoryContainer");
  const newCategoryInput = document.getElementById("newCategoryInput");
  const confirmNewCategoryBtn = document.getElementById("confirmNewCategory");
  const cancelNewCategoryBtn = document.getElementById("cancelNewCategory");

  // Handle category selection change
  tourCategorySelect.addEventListener("change", function () {
    if (this.value === "add_new") {
      newCategoryContainer.style.display = "block";
      newCategoryInput.focus();
      // Reset the select to empty to avoid form submission issues
      this.value = "";
    } else {
      newCategoryContainer.style.display = "none";
      newCategoryInput.value = "";
    }
  });

  // Handle confirm new category
  confirmNewCategoryBtn.addEventListener("click", function () {
    const newCategoryName = newCategoryInput.value.trim();
    if (newCategoryName) {
      // Check if category already exists
      const existingOptions = Array.from(tourCategorySelect.options);
      const categoryExists = existingOptions.some(
        option => option.value.toLowerCase() === newCategoryName.toLowerCase() && option.value !== "add_new"
      );

      if (categoryExists) {
        alert("This category already exists. Please choose a different name.");
        newCategoryInput.focus();
        return;
      }

      // Add new option to select
      const newOption = document.createElement("option");
      newOption.value = newCategoryName;
      newOption.textContent = newCategoryName;
      newOption.selected = true;

      // Insert before the "Add New Category" option
      const addNewOption = tourCategorySelect.querySelector('option[value="add_new"]');
      tourCategorySelect.insertBefore(newOption, addNewOption);

      // Hide the new category container
      newCategoryContainer.style.display = "none";
      newCategoryInput.value = "";

      // Show success message
      showNotification("New category added successfully!", "success");
    } else {
      alert("Please enter a category name.");
      newCategoryInput.focus();
    }
  });

  // Handle cancel new category
  cancelNewCategoryBtn.addEventListener("click", function () {
    newCategoryContainer.style.display = "none";
    newCategoryInput.value = "";
    tourCategorySelect.value = "";
  });

  // Handle Enter key in new category input
  newCategoryInput.addEventListener("keypress", function (e) {
    if (e.key === "Enter") {
      e.preventDefault();
      confirmNewCategoryBtn.click();
    } else if (e.key === "Escape") {
      e.preventDefault();
      cancelNewCategoryBtn.click();
    }
  });

  // Utility function to show notifications
  function showNotification(message, type = "info") {
    // Create notification element
    const notification = document.createElement("div");
    notification.className = `notification notification-${type}`;
    notification.textContent = message;
    notification.style.cssText = `
      position: fixed;
      top: 20px;
      right: 20px;
      padding: 12px 20px;
      background-color: ${type === "success" ? "var(--primary-green)" : "var(--accent-terracotta)"};
      color: white;
      border-radius: 6px;
      box-shadow: 0 4px 12px rgba(0, 0, 0, 0.15);
      z-index: 1000;
      animation: slideInRight 0.3s ease-out;
    `;

    document.body.appendChild(notification);

    // Remove notification after 3 seconds
    setTimeout(() => {
      notification.style.animation = "slideOutRight 0.3s ease-in";
      setTimeout(() => {
        if (notification.parentNode) {
          notification.parentNode.removeChild(notification);
        }
      }, 300);
    }, 3000);
  }

  // Edit button click handler
  document.querySelectorAll(".edit-btn").forEach((btn) => {
    btn.addEventListener("click", function () {
      const row = this.closest("tr");
      const title = row.cells[0].textContent;
      const destination = row.cells[1].textContent;
      const category = row.cells[2].textContent;

      // Get form elements
      const tourForm = document.getElementById("tourForm");
      const addTourBtn = document.querySelector(".add-tour-btn");
      const btnText = addTourBtn.querySelector(".btn-text");
      const formTitle = document.querySelector(".form-title");
      const submitBtn = tourForm.querySelector(".submit-btn");

      // Update form title and button text
      formTitle.textContent = "Edit Tour";
      submitBtn.textContent = "Update Tour";
      btnText.textContent = "Close Form";
      addTourBtn.dataset.state = "close";

      // Fill form with existing data
      document.getElementById("tourTitle").value = title;
      document.getElementById("tourCategory").value = category.toLowerCase();

      // Show form and hide table
      document.getElementById("addTourForm").classList.add("active");
      document.getElementById("tableSection").classList.add("hidden");

      // Add edit mode flag
      tourForm.dataset.mode = "edit";
      tourForm.dataset.editId = row.dataset.id; // If you have IDs for tours
    });
  });

  // Form submission handler
  const tourForm = document.getElementById("tourForm");
  tourForm.addEventListener("submit", function (e) {
    e.preventDefault();

    // Create FormData object to properly handle file uploads
    const formData = new FormData(this);

    // Collect all activities
    const activities = [];
    const dayContainers = document.querySelectorAll(".day-container");
    dayContainers.forEach((container, index) => {
      const titleInput = container.querySelector('input[name$="Title"]');
      const descInput = container.querySelector('textarea[name$="Desc"]');
      if (titleInput && descInput) {
        activities.push({
          day_number: index + 1,
          title: titleInput.value,
          description: descInput.value,
        });
      }
    });

    // Add activities to form data
    formData.append("activities", JSON.stringify(activities));

    // Collect list items
    const includedItems = Array.from(
      document.querySelectorAll("#includedList input")
    ).map((input) => input.value);
    const excludedItems = Array.from(
      document.querySelectorAll("#excludedList input")
    ).map((input) => input.value);
    const toBringItems = Array.from(
      document.querySelectorAll("#bringList input")
    ).map((input) => input.value);

    // Add list items to form data
    formData.append(
      "includedItems",
      JSON.stringify(includedItems.filter(Boolean))
    );
    formData.append(
      "excludedItems",
      JSON.stringify(excludedItems.filter(Boolean))
    );
    formData.append(
      "toBringItems",
      JSON.stringify(toBringItems.filter(Boolean))
    );

    // Keep the file input if it has a file, even in edit mode
    const fileInput = document.getElementById("coverImage");
    if (fileInput.files.length > 0) {
      formData.append("coverImage", fileInput.files[0]);
    }

    // Submit the form
    this.submit();
  });
});
