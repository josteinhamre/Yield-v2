const submitOn = () => {
  const budgetForm = document.querySelectorAll(".budgetForm");
  budgetForm.forEach((form) => {
    form.budget_amount.addEventListener("blur", (event) => {
     console.log('Hello from blur')
      Rails.fire(event.target.parentElement, 'submit');
      // event.target.parentElement.submit()
    });
     form.budget_amount.addEventListener("keydown", (event) => {
      if (event.keyCode == 13) {
     console.log('Hello from enter')
        event.preventDefault()
        // event.target.parentElement.submit()
      Rails.fire(event.target.parentElement, 'submit');
      }
    });
  })
};

function submitOnThis(id) {
  const BudgetCategory = document.getElementById(`category-${id}`);
  const budgetForm = BudgetCategory.querySelector(".budgetForm");
    budgetForm.budget_amount.addEventListener("blur", (event) => {
      Rails.fire(event.target.parentElement, 'submit');
      // event.target.parentElement.submit()
    });
     budgetForm.budget_amount.addEventListener("keydown", (event) => {
      if (event.keyCode == 13) {
        event.preventDefault()
        // event.target.parentElement.submit()
      Rails.fire(event.target.parentElement, 'submit');
      }
    });
};

const submitUpload = () => {
  document.getElementById('upload').addEventListener("change", (event) => {
      event.target.parentElement.parentElement.submit()
    });
};

export { submitOn, submitUpload, submitOnThis }


