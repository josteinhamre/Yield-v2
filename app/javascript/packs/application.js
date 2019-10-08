import "bootstrap";
import { listOpen } from '../components/chevron_menu';
import { submitOn } from '../components/submit_on';
import { chart1, chart2, chart3, charttab1, charttab2, charttab3 } from '../components/apexcharts';
import { tabClickChart } from '../components/chart_tabs'

// changeMonth()
submitOn();
listOpen();
chart1.render();
chart2.render();
chart3.render();
charttab1.render();
charttab2.render();
charttab3.render();

tabClickChart()
