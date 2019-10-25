const getColor = (value) => {
//value from 0 to 1
const hue=((1-value)*120).toString(10);
return ["hsl(",hue,",90%,60%)"].join("");
};

const setColors = () => {
  const progressViews = document.querySelectorAll('.progress-view');
  progressViews.forEach((progress) => {
    const value = progress.dataset.percentage/100
    let color = ''
    if (value > 1) {
      color = getColor(1)
    } else {
      color = getColor(value)
    }
    progress.querySelector('.progress-grow').style.backgroundColor = color;
  })
};

const setColor = (id) => {
  const BudgetCategory = document.getElementById(`category-${id}`);
  const progressView = BudgetCategory.querySelector('.progress-view');
  const value = progressView.dataset.percentage/100
  let color = ''
  if (value > 1) {
    color = getColor(1)
  } else {
    color = getColor(value)
  }
  progressView.querySelector('.progress-grow').style.backgroundColor = color;
}

export { setColor, setColors }
