<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Add New Tour</title>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
  <link rel="stylesheet" href="../css/addtour.css">

</head>
<body>
  <div class="container">
    <h2><i class="fas fa-globe-americas"></i> Add New Tour</h2>
    
    <form id="tourForm" method="POST" action="process_tour.php" enctype="multipart/form-data">
      <div class="form-row">
        <div class="form-col">
          <div class="form-group">
            <label for="tourTitle"><i class="fas fa-heading"></i> Tour Title</label>
            <input type="text" id="tourTitle" name="tourTitle" required />
          </div>
        </div>
        <div class="form-col">
          <div class="form-group">
            <label for="tourCountry"><i class="fas fa-flag"></i> Country</label>
            <select id="tourCountry" name="tourCountry" required>
              <option value="rwanda">All</option>
              <option value="rwanda">Rwanda</option>
              <option value="uganda">Uganda</option>
              <option value="congo">DR Congo</option>
              <option value="burundi">Burundi</option>
            </select>
          </div>
        </div>
        <div class="form-col">
          <div class="form-group">
            <label for="tourCategory"><i class="fas fa-tags"></i> Category</label>
            <select id="tourCategory" name="tourCategory" required>
              <option value="">Select a category</option>
              <option value="Adventure">Adventure</option>
              <option value="Cultural">Cultural</option>
              <option value="City Tours">City Tours</option>
              <option value="Comunity Based Tourism">Community Based Tourism</option>
              <option value="Family Friendly">Family Friendly</option>
              <option value="Food & Culinary">Food & Culinary</option>
              <option value="Gastronomy">Gastronomy</option>
              <option value="Highlights">Highlights</option>
              <option value="Nature">Nature</option>
              <option value="Off the beaten Path">Off the beaten Path</option>
              <option value="Historical">Historical</option>
              <option value="Spiritual">Spiritual</option>
            </select>
          </div>
        </div>
      </div>

      <div class="form-row">
        <div class="form-col">
          <div class="form-group">
            <label for="tourDays"><i class="fas fa-calendar-day"></i> Number of Days</label>
            <input type="number" id="tourDays" name="tourDays" min="1" required />
          </div>
        </div>
      </div>
      
      <div class="form-row">
        <div class="form-col">
          <div class="form-group image-upload">
            <label for="coverImage"><i class="fas fa-image"></i> Cover Image</label>
            <div class="image-preview" id="coverPreview" style="background-size: cover; background-position: center;">
              <i class="fas fa-camera"></i> Cover Image Preview
            </div>
            <input type="file" id="coverImage" name="coverImage" accept="image/*" required />
          </div>
        </div>
      </div>

      <div class="form-group">
        <label for="tourDesc"><i class="fas fa-align-left"></i> Short Description</label>
        <textarea
          id="tourDesc"
          name="tourDesc"
          placeholder="Enter a brief description of the tour"
          required
        ></textarea>
      </div>

      <h3 class="section-title"><i class="fas fa-star"></i> Highlight Images</h3>
      <div class="highlight-images">
        <div class="form-group image-upload">
          <div class="image-preview highlight-image" id="highlight1Preview">
            <i class="fas fa-camera"></i> Highlight 1
          </div>
          <input type="file" id="highlight1" name="highlight1" accept="image/*" />
        </div>
        <div class="form-group image-upload">
          <div class="image-preview highlight-image" id="highlight2Preview">
            <i class="fas fa-camera"></i> Highlight 2
          </div>
          <input type="file" id="highlight2" name="highlight2" accept="image/*" />
        </div>
        <div class="form-group image-upload">
          <div class="image-preview highlight-image" id="highlight3Preview">
            <i class="fas fa-camera"></i> Highlight 3
          </div>
          <input type="file" id="highlight3" name="highlight3" accept="image/*" />
        </div>
        <div class="form-group image-upload">
          <div class="image-preview highlight-image" id="highlight4Preview">
            <i class="fas fa-camera"></i> Highlight 4
          </div>
          <input type="file" id="highlight4" name="highlight4" accept="image/*" />
        </div>
      </div>

      <h3 class="section-title"><i class="fas fa-route"></i> Tour Itinerary</h3>
      <div id="activitiesContainer">
        <div class="day-container" data-activity="1">
          <h4 class="day-title"><i class="fas fa-map-marker-alt"></i> Activity 1</h4>
          <div class="form-group">
            <label for="activity1Title">Activity Title</label>
            <input type="text" id="activity1Title" name="activities[1][title]" placeholder="Enter title for activity" required>
          </div>
          <div class="form-group">
            <label for="activity1Desc">Activity Description</label>
            <textarea id="activity1Desc" name="activities[1][desc]" placeholder="Describe the activity" required></textarea>
          </div>
        </div>
      </div>
      <button type="button" class="btn add-btn" id="addActivityBtn">
        <span>+</span> Add More Activities
      </button>

      <h3 class="section-title"><i class="fas fa-check-circle"></i> What's Included</h3>
      <div class="list-container" id="includedList">
        <div class="list-item">
          <input type="text" name="included[]" placeholder="Enter included item" />
          <button type="button" class="btn remove-btn">
            <i class="fas fa-trash"></i> Remove
          </button>
        </div>
      </div>
      <button type="button" class="btn add-btn" id="addIncludedBtn">
        <span>+</span> Add More
      </button>

      <h3 class="section-title"><i class="fas fa-times-circle"></i> What's Excluded</h3>
      <div class="list-container" id="excludedList">
        <div class="list-item">
          <input type="text" name="excluded[]" placeholder="Enter excluded item" />
          <button type="button" class="btn remove-btn">
            <i class="fas fa-trash"></i> Remove
          </button>
        </div>
      </div>
      <button type="button" class="btn add-btn" id="addExcludedBtn">
        <span>+</span> Add More
      </button>

      <h3 class="section-title"><i class="fas fa-suitcase"></i> What to Bring</h3>
      <div class="list-container" id="bringList">
        <div class="list-item">
          <input type="text" name="bring[]" placeholder="Enter item to bring" />
          <button type="button" class="btn remove-btn">
            <i class="fas fa-trash"></i> Remove
          </button>
        </div>
      </div>
      <button type="button" class="btn add-btn" id="addBringBtn">
        <span>+</span> Add More
      </button>

      <h3 class="section-title"><i class="fas fa-question-circle"></i> Why Attend</h3>
      <textarea
        id="whyAttend"
        name="whyAttend"
        placeholder="Enter reasons why people should attend this tour"
      ></textarea>

      <button type="submit" class="submit-btn"><i class="fas fa-paper-plane"></i> Create Tour</button>
    </form>
  </div>

  <script>
    document.addEventListener('DOMContentLoaded', function() {
        // Update file input preview function
        function handleFileInputChange(input) {
            const preview = document.getElementById(input.id + 'Preview');
            if (input.files && input.files[0]) {
                const reader = new FileReader();
                reader.onload = function(e) {
                    preview.style.backgroundImage = `url('${e.target.result}')`;
                    preview.innerHTML = ''; // Clear the preview text
                    preview.classList.add('has-image');
                };
                reader.readAsDataURL(input.files[0]);
            } else {
                preview.style.backgroundImage = '';
                preview.innerHTML = '<i class="fas fa-camera"></i> Image Preview';
                preview.classList.remove('has-image');
            }
        }

        // Add event listeners to file inputs
        const fileInputs = document.querySelectorAll('input[type="file"]');
        fileInputs.forEach(input => {
            input.addEventListener('change', function() {
                handleFileInputChange(this);
            });
        });

        // Handle preview click to trigger file input
        const imagePreviews = document.querySelectorAll('.image-preview');
        imagePreviews.forEach(preview => {
            preview.addEventListener('click', function() {
                const inputId = this.id.replace('Preview', '');
                document.getElementById(inputId).click();
            });
        });

        // Add more activities
        let activityCounter = 1;
        const addActivityBtn = document.getElementById('addActivityBtn');
        const activitiesContainer = document.getElementById('activitiesContainer');
        
        addActivityBtn.addEventListener('click', function() {
          activityCounter++;
          const newActivity = document.createElement('div');
          newActivity.className = 'day-container';
          newActivity.dataset.activity = activityCounter;
          newActivity.innerHTML = `
            <div class="form-row">
              <div class="form-col">
                <h4 class="day-title"><i class="fas fa-map-marker-alt"></i> Activity ${activityCounter}</h4>
              </div>
              <div class="form-col" style="text-align: right;">
                <button type="button" class="btn remove-btn remove-activity">
                  <i class="fas fa-trash"></i> Remove
                </button>
              </div>
            </div>
            <div class="form-group">
              <label for="activity${activityCounter}Title">Activity Title</label>
              <input type="text" id="activity${activityCounter}Title" name="activities[${activityCounter}][title]" placeholder="Enter title for activity" required>
            </div>
            <div class="form-group">
              <label for="activity${activityCounter}Desc">Activity Description</label>
              <textarea id="activity${activityCounter}Desc" name="activities[${activityCounter}][desc]" placeholder="Describe the activity" required></textarea>
            </div>
          `;
          activitiesContainer.appendChild(newActivity);
          
          // Add event listener for the new remove button
          const removeBtn = newActivity.querySelector('.remove-activity');
          removeBtn.addEventListener('click', function() {
            activitiesContainer.removeChild(newActivity);
          });
        });

        // Generic function to add more list items
        function setupListAddition(addBtnId, listId, placeholderText, inputName) {
          const addBtn = document.getElementById(addBtnId);
          const listContainer = document.getElementById(listId);
          
          addBtn.addEventListener('click', function() {
            const newItem = document.createElement('div');
            newItem.className = 'list-item';
            newItem.innerHTML = `
              <input type="text" name="${inputName}" placeholder="${placeholderText}" />
              <button type="button" class="btn remove-btn">
                <i class="fas fa-trash"></i> Remove
              </button>
            `;
            listContainer.appendChild(newItem);
            
            // Add event listener for the new remove button
            const removeBtn = newItem.querySelector('.remove-btn');
            removeBtn.addEventListener('click', function() {
              listContainer.removeChild(newItem);
            });
          });
          
          // Add event listeners to initial remove buttons
          const initialRemoveBtns = listContainer.querySelectorAll('.remove-btn');
          initialRemoveBtns.forEach(btn => {
            btn.addEventListener('click', function() {
              const listItem = btn.closest('.list-item');
              if (listContainer.children.length > 1) {
                listContainer.removeChild(listItem);
              } else {
                listItem.querySelector('input').value = '';
              }
            });
          });
        }

        // Setup all list additions
        setupListAddition('addIncludedBtn', 'includedList', 'Enter included item', 'included[]');
        setupListAddition('addExcludedBtn', 'excludedList', 'Enter excluded item', 'excluded[]');
        setupListAddition('addBringBtn', 'bringList', 'Enter item to bring', 'bring[]');

        // Add form submission handler
        const tourForm = document.getElementById('tourForm');
        tourForm.addEventListener('submit', function(e) {
          e.preventDefault();
          const formData = new FormData(this);

          fetch('process_tour.php', {
            method: 'POST',
            body: formData
          })
          .then(response => response.json())
          .then(data => {
            if (data.success) {
              alert(data.message);
              window.location.href = 'displaytour.php'; // Changed redirect destination
            } else {
              alert('Error: ' + data.message);
            }
          })
          .catch(error => {
            console.error('Error:', error);
            alert('An error occurred while saving the tour');
          });
        });
    });
  </script>
</body>
</html>