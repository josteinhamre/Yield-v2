const setupProfileIcons = () => {
  document.querySelector('.category-container').addEventListener('click', event => {
    if (event.target.tagName !== 'IMG') {
      return;
    }

    event.preventDefault();

    // deselect other icons
    document.querySelectorAll('.icon-container').forEach(icon => {
      icon.classList.remove('selected');
    });

    // set id on form
    document.getElementById('category_icon_id').value = event.target.parentElement.dataset.id;
    event.target.parentElement.classList.add('selected');
  });
};

export { setupProfileIcons };
