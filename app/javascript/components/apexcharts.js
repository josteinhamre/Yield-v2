import ApexCharts from 'apexcharts'

var options1 = {
  chart: {
    type: 'area',
    toolbar: {
      show: false,
    },
  },
  series: [{
    data: [30,40,35,50,49,60,70,91,78,30,40,35,50,49,60,70,91,125]
  }],
  dataLabels: {
    enabled: false,
  },
  xaxis: {
    labels: {
      show: false,
    },
    axisBorder: {
      show: false,
    },
    axisTicks: {
      show: false,
    },
    tooltip: {
      enabled: false,
    },
    crosshairs: {
      show: false,
    }
  },
  grid: {
    show: false,
  },
  tooltip: {
    enabled: false,
  }
}

var options2 = {
  chart: {
    type: 'line',
    toolbar: {
      show: false,
    },
  },
  series: [{
    name: 'sales',
    data: [30,40,35,50,49,60,70,91,125]
  }],
  xaxis: {
    categories: [1991,1992,1993,1994,1995,1996,1997, 1998,1999]
  }
}

var options3 = {
  chart: {
    type: 'line',
    toolbar: {
      show: false,
    },
  },
  series: [{
    name: 'sales',
    data: [30,40,35,50,49,60,70,91,125]
  }],
  xaxis: {
    categories: [1991,1992,1993,1994,1995,1996,1997, 1998,1999]
  }
}

var optionstab1 = {
  chart: {
    type: 'area',
    toolbar: {
      show: false,
    },
  },
  series: [{
    data: [30,40,35,50,49,60,70,91,125]
  }],
  dataLabels: {
    enabled: false,
  },
  xaxis: {
    labels: {
      show: false,
    },
    axisBorder: {
      show: false,
    },
    axisTicks: {
      show: false,
    },
    tooltip: {
      enabled: false,
    },
    crosshairs: {
      show: false,
    }
  },
  grid: {
    show: false,
  },
  tooltip: {
    enabled: false,
  }
}

var optionstab2 = {
  chart: {
    type: 'area',
    toolbar: {
      show: false,
    },
  },
  series: [{
    data: [30,40,35,50,49,60,70,91,125]
  }],
  dataLabels: {
    enabled: false,
  },
  xaxis: {
    labels: {
      show: false,
    },
    axisBorder: {
      show: false,
    },
    axisTicks: {
      show: false,
    },
    tooltip: {
      enabled: false,
    },
    crosshairs: {
      show: true,
    }
  },
  grid: {
    show: false,
  },
  tooltip: {
    enabled: false,
  }
}

var optionstab3 = {
  chart: {
    type: 'bar',
    toolbar: {
      show: false,
    },
  },
  plotOptions: {
    bar: {
      endingShape: 'rounded'
    },
  },
  series: [{
    data: [30,40,35,50,49,60,70,91,125,30,40,35,50,49,60,70,91,125,30,40,35,50,49,60,70,91,125,30,40,35,50,49,60,70,91,125]
  }],
  dataLabels: {
    enabled: false,
  },
  xaxis: {
    labels: {
      show: false,
    },
    axisBorder: {
      show: false,
    },
    axisTicks: {
      show: false,
    },
    tooltip: {
      enabled: false,
    },
    crosshairs: {
      show: false,
    }
  },
  grid: {
    show: false,
  },
  tooltip: {
    enabled: false,
  }
}

var chart1 = new ApexCharts(document.querySelector("#chart1"), options1);
var chart2 = new ApexCharts(document.querySelector("#chart2"), options2);
var chart3 = new ApexCharts(document.querySelector("#chart3"), options3);
var charttab1 = new ApexCharts(document.querySelector("#charttab1"), optionstab1);
var charttab2 = new ApexCharts(document.querySelector("#charttab2"), optionstab2);
var charttab3 = new ApexCharts(document.querySelector("#charttab3"), optionstab3);

export { chart1, chart2, chart3, charttab1, charttab2, charttab3 }
