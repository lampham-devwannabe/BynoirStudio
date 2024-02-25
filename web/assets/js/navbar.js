// toggle visibility of the search box
document.getElementById('searchButton').addEventListener('click', function () {
    var searchBox = document.getElementById('searchBox');
    if (searchBox.style.display === 'none') {
        searchBox.style.display = 'block';
    } else {
        searchBox.style.display = 'none';
    }
});

function handleKeyPress(event) {
    if (event.keyCode === 13) { // Check if Enter key is pressed
        event.preventDefault(); // Prevent default form submission
        submitForm(); // Call function to submit the form
    }
}

function submitForm() {
    var keyword = document.getElementById('search-input').value.trim(); // Get input value    
    document.getElementById('searchForm').action = 'search'; // Set form action to servlet endpoint
    document.getElementById('searchForm').method = 'POST'; // Set form method to POST
    document.getElementById('searchForm').submit(); // Submit the form  
}