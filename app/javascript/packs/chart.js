import Chart from 'chart.js';
import { tabClick } from '../components/tabs';

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
  title: { display: false, text: 'Account balance (in Norgwegian kroners)' },
  legend: { display: false },
  scales: { xAxes: [{ gridLines: { drawOnChartArea: false } }],
            yAxes: [{ gridLines: { drawOnChartArea: false } }]
          }
};

const balanceChart = (elementId, isThumbnail = false) => {
  const element = document.getElementById(elementId);

  new Chart(element, {
    type: 'line',
      data: {
        labels: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30],
        datasets: [{
            data: [28000, 27100, 26900, 25600, 25200, 24900, 24330, 23410, 21010, 19710, 19543, 19085, 18950, 17963, 16394 , 16094, 15201, 15039, 22100, 22025, 21683, 21115, 20658, 20537, 18537, 18270, 17536, 17301, 12458, 11815],
            label: "Account balance",
            borderColor: "#83BED3",
            fill: false
          }
        ]
      },
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

const budgetedChart = (elementId, isThumbnail = false) => {
  const element = document.getElementById(elementId);

  new Chart(element, {
  type: 'bar',
    data: {
      labels: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12],
      datasets: [{
          data: [3800, 3710, 3690, 3560, 3520, 4490, 3433, 3341, 3101, 4971, 3954, 4908],
          borderColor: "#83BED3",
          backgroundColor: [ "#83BED3", "#83BED3", "#83BED3", "#83BED3", "#83BED3", "#83BED3", "#83BED3", "#83BED3", "#83BED3", "#83BED3", "#83BED3", "#83BED3"],
          fill: false
        }
      ]
    },
    options: isThumbnail ? SMALL_CHART_OPTIONS : BIG_CHART_OPTIONS
  });
};

document.addEventListener('DOMContentLoaded', () => {
  // spent data
  fetch('/spent_data')
    .then(response => response.json())
    .then(data => {
      console.log('loading spent data');
      spentChart("tab-spent-chart", data, true);
      spentChart("spent-chart", data);
    })
    .catch(response => {
      alert('Something went wrong');
    });

  balanceChart("tab-balance-chart", true);
  balanceChart("balance-chart");
  budgetedChart("tab-budgeted-chart", true);
  budgetedChart("budgeted-chart");
});

tabClick();

