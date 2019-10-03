const submitOn = () => {
  const budgetForm = document.querySelectorAll(".budgetForm");
  budgetForm.forEach((form) => {
    // console.log(form.budget_amount)
    form.budget_amount.addEventListener("blur", (event) => {
      console.log(event.target.parentElement)
      // Rails.fire(event.target.parentElement, 'submit');
      event.target.parentElement.submit()
    });
     form.budget_amount.addEventListener("keydown", (event) => {
      console.log(event.target.parentElement)
      if (event.keyCode == 13) {
        event.preventDefault()
        event.target.parentElement.submit()
      // Rails.fire(event.target.parentElement, 'submit');
      }
    });
  })
};

export { submitOn }
