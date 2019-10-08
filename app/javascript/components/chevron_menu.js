const listOpen = () => {
  const categoryArrows = document.querySelectorAll(".row-arrow");
  categoryArrows.forEach((categoryArrow) => {
    categoryArrow.addEventListener("click", (event) => {
    categoryArrow.classList.toggle('turned')
    const categoryDropdown = document.getElementById(event.currentTarget.dataset.rowId)
    categoryDropdown.classList.toggle("display")
    });
  })

  const transCats = document.querySelectorAll(".trans-cat");
  transCats.forEach((transCat) => {
    transCat.addEventListener("click", (event) => {
    console.log(event.currentTarget.dataset.rowId)
    transCat.parentElement.querySelector('.transaction-arrow').classList.toggle('turned')
    const categoryDropdown = document.getElementById(event.currentTarget.dataset.rowId)
    categoryDropdown.classList.toggle("display")
    });
  })

};

export {listOpen}
