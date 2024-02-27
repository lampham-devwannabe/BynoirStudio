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
    // check if Enter key is pressed
    if (event.keyCode === 13) {
        // prevent default submission
        event.preventDefault();
        // submit  form
        submitForm();
    }
}

function submitForm() {
    // Set form action to servlet endpoint
    document.getElementById('searchForm').action = 'search';
    // Set form method to POST
    document.getElementById('searchForm').method = 'POST';
    // Submit the form  
    document.getElementById('searchForm').submit();
}