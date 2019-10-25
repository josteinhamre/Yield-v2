import "bootstrap";
import { listOpen } from '../components/list_dropdown';

import { setupColorPicker } from '../components/color-picker';


window.listOpen = listOpen;
listOpen();

setupColorPicker();
