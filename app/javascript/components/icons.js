const setupProfileIcons = () => {
  const icons = document.querySelectorAll(".icons");
  icons.forEach(icon => {
    icon.addEventListener("click", (event) => {
      event.preventDefault();
      console.log(event.target.parentElement.dataset.id)
      document.getElementById('category_icon_id').value = event.target.parentElement.dataset.id
    });
  });
};

export { setupProfileIcons };
