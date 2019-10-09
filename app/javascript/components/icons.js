const setupProfileIcons = () => {
  document.querySelector('.category-container').addEventListener('click', event => {
    console.log(event.target)
    // if (event.target('icon-container')) {
    //   console.log('icon clicked');
    // }
  })


  // let icons = document.querySelectorAll(".icons");
  // icons.forEach(icon => {
  //   icon.addEventListener("click", (event) => {
  //     //event.preventDefault();

  //     // deselect other icons
  //     document.querySelectorAll('.icon-container').forEach(icon => {
  //       icon.classList.remove('selected');
  //     })

  //     // set id on form
  //     document.getElementById('category_icon_id').value = event.target.parentElement.dataset.id;
  //     event.target.parentElement.classList.add('selected')
  //   });
  // });
};

export { setupProfileIcons };
