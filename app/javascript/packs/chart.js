import Chart from 'chart.js';
import { tabClick } from '../components/tabs';

// const ctx = document.getElementById("balance-chart").getContext("2d");

// const gradient = ctx.createLinearGradient(0, 0, 0, 400);
//     gradient.addColorStop(0, 'rgba(131, 190, 211, 1)');
//     gradient.addColorStop(1, 'rgba(131, 190, 211, 0)');

const SMALL_CHART_OPTIONS = {
  tooltips: { enabled: false },
  elements: { point: { radius: 0 } },
  title: { display: false, text: 'Account balance (in Norgwegian kroners)' },
  legend: { display: false },
  scales: { xAxes: [{ gridLines: { display: false }, ticks: { display: false } }],
            yAxes: [{ gridLines: { display: false }, ticks: { display: false } }]
          }
};

const BIG_CHART_OPTIONS = {
  elements: { point: { radius: 0 } },
  title: { display: false, text: 'Account balance (in Norgwegian kroners)' },
  legend: { display: false },
  scales: { xAxes: [{ gridLines: { drawOnChartArea: false } }],
            yAxes: [{ gridLines: { drawOnChartArea: false } }]
          }
};

const balanceChart = (elementId, data, isThumbnail = false) => {
  const element = document.getElementById(elementId);
  new Chart(element, {
    type: 'line',
      data: data,
      options: isThumbnail ? SMALL_CHART_OPTIONS : BIG_CHART_OPTIONS
  });
};

const spentChart = (elementId, data, isThumbnail = false) => {
  const element = document.getElementById(elementId);
  new Chart(element, {
    type: 'line',
      data: data,
      options: isThumbnail ? SMALL_CHART_OPTIONS : BIG_CHART_OPTIONS
  });
};

const budgetedChart = (elementId, data, isThumbnail = false) => {
  const element = document.getElementById(elementId);
  new Chart(element, {
    type: 'bar',
      data: data,
      options: isThumbnail ? SMALL_CHART_OPTIONS : BIG_CHART_OPTIONS
  });
};

const loadCharts = () => {
    // spent data
  fetch('/spent_data')
    .then(response => response.json())
    .then(data => {
      spentChart("tab-spent-chart", data, true);
      spentChart("spent-chart", data);
    })
    .catch(response => {
      console.log(response)
      alert('Something went wrong');
    });

  // balance data
  fetch('/balance_data')
    .then(response => response.json())
    .then(data => {
      balanceChart("tab-balance-chart", data, true);
      balanceChart("balance-chart", data);
    })
    .catch(response => {
      alert('Something went wrong2');
    });

  // budgeted data
  fetch('/budgeted_data')
    .then(response => response.json())
    .then(data => {
      budgetedChart("tab-budgeted-chart", data, true);
      budgetedChart("budgeted-chart", data);
    })
    .catch(response => {
      alert('Something went wrong3')
    });
}

document.addEventListener('DOMContentLoaded', () => {
  loadCharts();
});

window.loadCharts = loadCharts;

tabClick();

