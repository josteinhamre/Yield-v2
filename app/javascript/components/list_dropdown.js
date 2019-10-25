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
    const categoryDropdown = document.getElementById(event.currentTarget.dataset.rowId)
    categoryDropdown.classList.toggle("display")
    transCat.parentElement.querySelector('.transaction-arrow').classList.toggle('turned')
    });
  })

};

const listOpenThis = (id) => {
  const BudgetCategory = document.getElementById(`category-${id}`);
  const categoryArrow = BudgetCategory.querySelector(".row-arrow");
  if (categoryArrow != null) {
    categoryArrow.addEventListener("click", (event) => {
    const categoryDropdown = document.getElementById(event.currentTarget.dataset.rowId)
    categoryDropdown.classList.toggle("display")
    });
  }
};


export {listOpen, listOpenThis};


