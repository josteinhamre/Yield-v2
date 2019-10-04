import Chart from 'chart.js';


new Chart(document.getElementById("line-chart"), {
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
  options: {
    title: {
      display: false,
      text: 'Account balance (in Norgwegian kroners)'
    },
    legend: {
      display: false
    },
    scales: {
        xAxes: [{
            gridLines: {
                drawOnChartArea: false
            }
        }],
        yAxes: [{
            gridLines: {
                drawOnChartArea: false
            }
        }]
    }
  }
});



