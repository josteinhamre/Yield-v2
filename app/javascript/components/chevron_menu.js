// element.addEventListener(eventType, (event) => {
//   // Do something (callback)
// });


const listOpen = () => {
  const categoryArrows = document.querySelectorAll(".row-arrow");
  categoryArrows.forEach((categoryArrow) => {
    categoryArrow.addEventListener("click", (event) => {
    const categoryDropdown = document.getElementById(event.currentTarget.dataset.rowId)
    categoryDropdown.classList.toggle("display")
    });
  })
};

export {listOpen}
