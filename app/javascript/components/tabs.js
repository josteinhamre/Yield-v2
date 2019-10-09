function tabClick() {
  function onTabClick(event) {
    let activeTabs = document.querySelectorAll('.active');

    // deactivate existing active tab and panel
    activeTabs.forEach(function(tab) {
      tab.classList.remove('active');
    });

    // activate new tab and panel
    event.target.parentElement.classList.add('active');
    const id = event.target.closest('.info-card-graph').dataset.id;
    document.getElementById(id).classList.toggle('active');
  };

  const element = document.getElementById('dashboard-tab');

  element.addEventListener('click', onTabClick, false);
}

export { tabClick }
