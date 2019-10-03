const listOpen = () => {
  const categoryArrows = document.querySelectorAll(".row-arrow");
  categoryArrows.forEach((categoryArrow) => {
    categoryArrow.addEventListener("click", (event) => {
    console.log(event.currentTarget.dataset.rowId);
    const categoryDropdown = document.getElementById(event.currentTarget.dataset.rowId)
    console.log(categoryDropdown)
    categoryDropdown.classList.toggle("display")
    });
  })
};

export {listOpen}
