function getColor(value) {
    //value from 0 to 1
    const hue=((1-value)*120).toString(10);
    return ["hsl(",hue,",100%,50%)"].join("");
}


progressViews = document.querySelectorAll('.progress-view');
progressViews.forEach((progress) => {
value = progress.dataset.percentage/100
if (value > 1) {
color = getColor(1)
} else {
color = getColor(value)
}
progress.querySelector('.progress-grow').style.backgroundColor = color;
})
