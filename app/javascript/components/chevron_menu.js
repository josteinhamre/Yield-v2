const listOpen = () => {
  const categoryArrows = document.querySelectorAll(".row-arrow");
  categoryArrows.forEach((categoryArrow) => {
    categoryArrow.addEventListener("click", (event) => {
    categoryArrow.classList.toggle('turned')
    const categoryDropdown = document.getElementById(event.currentTarget.dataset.rowId)
    categoryDropdown.classList.toggle("display")
    // if (categoryDropdown.classList.contains('display')) {
    //   setTimeout(categoryDropdown.scrollIntoView(true), 1000)
    // }
    });
  })

  const transCats = document.querySelectorAll(".trans-cat");
  transCats.forEach((transCat) => {
    transCat.addEventListener("click", (event) => {
    const categoryDropdown = document.getElementById(event.currentTarget.dataset.rowId)
    categoryDropdown.classList.toggle("display")
    transCat.parentElement.querySelector('.transaction-arrow').classList.toggle('turned')
    // if (categoryDropdown.classList.contains('display')) {
    //   setTimeout(categoryDropdown.scrollIntoView(true), 1000)
    // }
    });
  })

};

export {listOpen}
