function tabClickChart() {
  let tabcharts = document.querySelectorAll(".tabcharts");
  let chart = document.querySelectorAll(".chart");

  tabcharts.forEach ((tab) => {
    tab.addEventListener("click", (event) => {
      document.querySelectorAll('.active').forEach ((active) => {
        active.classList.remove('active');
      });
      tab = event.target.parentElement.querySelector('.tabcharts')
      console.log(tab)
      tab.classList.add('active');
      document.getElementById(tab.dataset.id).classList.add('active');
    });
  });
};

export { tabClickChart }
