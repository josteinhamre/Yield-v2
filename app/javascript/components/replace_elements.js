const replaceBudget = (innerHTML, id) => {
  const BudgetCategory = document.getElementById(`category-${id}`);
  BudgetCategory.innerHTML = innerHTML;
};

const replaceInfo = (infoPartial) => {
  const info = document.querySelector('.budget-info-cards');
  info.innerHTML = infoPartial;
};

const replaceCategories = (innerHTML) => {
  const categories = document.getElementById('categoryListContainer');
  categories.innerHTML = innerHTML;
};

const replaceMonth = (month) => {
document.getElementById("monthSelector").innerHTML = month;
};

const replaceTransactions = (innerHTML) => {
  const transactions = document.getElementById('transactionsListContainer');
  transactions.innerHTML = innerHTML;
}

export { replaceBudget, replaceCategories, replaceInfo, replaceMonth, replaceTransactions };
