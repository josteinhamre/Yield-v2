import Picker from 'vanilla-picker';

const loadColorPicker = () => {
  // Create a new Picker instance and set the parent element.
  // By default, the color picker is a popup which appears when you click the parent.
  var parent = document.querySelector('#color-picker');
  var picker = new Picker({
    parent: parent,
    popup: 'left',
    onDone: function(color) {
      document.getElementById('color-picker-square').style.backgroundColor = color.rgbaString;
      document.getElementById('category_color').value = color.rgbaString;
    }
  });
  // You can do what you want with the chosen color using two callbacks: onChange and onDone.
  // onDone is similar to onChange, but only called when you click 'Ok'.
};

const setupColorPicker = () => {
  document.addEventListener('DOMContentLoaded', () => {
    loadColorPicker();
  })
};

window.loadColorPicker = loadColorPicker;
export { setupColorPicker };
