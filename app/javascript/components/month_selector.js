// const getMonth = () => {
//   let monthSelector = document.getElementById("monthSelector");
//   let monthSelectorGroup = document.getElementById("monthSelectorGroup");
//   let selectedMonth = monthSelectorGroup.dataset.selectedMonth);
//   monthSelector.innerHTML = selectedMonth.toLocaleString('no-NO', { month: 'long', year: 'numeric' });
// };

// const pMonth = () => {
//   // let prevMonth = document.getElementById("prevMonth");

//   // prevMonth.addEventListener("click", (event) => {
//     let monthSelector = document.getElementById("monthSelector");
//     let monthSelectorGroup = document.getElementById("monthSelectorGroup");
//     let selectedMonth = new Date(monthSelectorGroup.dataset.selectedMonth);
//     let decremented = selectedMonth.getMonth() - 1;
//     selectedMonth.setMonth(decremented);
//     monthSelectorGroup.dataset.selectedMonth = selectedMonth.toLocaleString('no-NO', { month: 'long', year: 'numeric' });
//     monthSelector.innerHTML = selectedMonth.toLocaleString('no-NO', { month: 'long', year: 'numeric' });
//   // });
// };


// const nMonth = () => {
//   // let nextMonth = document.getElementById("nextMonth");

//   // nextMonth.addEventListener("click", (event) => {
//     let monthSelector = document.getElementById("monthSelector");
//     let monthSelectorGroup = document.getElementById("monthSelectorGroup");
//     let selectedMonth = new Date(monthSelectorGroup.dataset.selectedMonth);
//     let incremented = selectedMonth.getMonth() + 1;
//     selectedMonth.setMonth(incremented);
//     monthSelectorGroup.dataset.selectedMonth = selectedMonth.toLocaleString('no-NO', { month: 'long', year: 'numeric' });
//     monthSelector.innerHTML = selectedMonth.toLocaleString('no-NO', { month: 'long', year: 'numeric' });
//   // });
// };

// export { getMonth };
