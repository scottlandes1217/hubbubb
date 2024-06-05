//= require rails-ujs
//= require_tree .

console.log('Rails UJS is loaded');

// JavaScript for dropdown and search functionality
document.addEventListener('DOMContentLoaded', () => {
  document.querySelectorAll('.dropbtn').forEach(button => {
    button.addEventListener('click', (event) => {
      // Close all other open dropdowns
      document.querySelectorAll('.dropdown-content, .dropdown-search').forEach(content => {
        if (content !== button.nextElementSibling) {
          content.style.display = 'none';
        }
      });

      // Toggle the clicked dropdown
      const dropdownContent = button.nextElementSibling;
      dropdownContent.style.display = dropdownContent.style.display === 'block' ? 'none' : 'block';

      // Prevent the event from bubbling up to the document
      event.stopPropagation();
    });
  });

  // Close dropdowns if clicking outside of them
  document.addEventListener('click', (event) => {
    const dropdowns = document.querySelectorAll('.dropdown-content, .dropdown-search');
    dropdowns.forEach(dropdown => {
      if (!dropdown.contains(event.target) && !dropdown.previousElementSibling.contains(event.target)) {
        dropdown.style.display = 'none';
      }
    });
  });

  // Filter custom objects based on search input
  const searchInput = document.getElementById('searchInput');
  searchInput.addEventListener('keyup', function() {
    const filter = searchInput.value.toUpperCase();
    const objectList = document.getElementById('objectList');
    const links = objectList.getElementsByTagName('a');

    for (let i = 0; i < links.length; i++) {
      const txtValue = links[i].textContent || links[i].innerText;
      if (txtValue.toUpperCase().indexOf(filter) > -1) {
        links[i].style.display = "";
      } else {
        links[i].style.display = "none";
      }
    }
  });
});
