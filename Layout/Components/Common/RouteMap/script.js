document.addEventListener('DOMContentLoaded', function () {
    const navButtons = document.querySelectorAll('.accordion-card');
    const routeMap = document.querySelectorAll('.route-map__image-route');

    function switchRouteMap(index) {

        navButtons.forEach(button => {
            button.classList.remove('active');
            button.setAttribute('aria-selected', 'false');
        });

        routeMap.forEach(section => {
            section.classList.remove('active');
        });

        if (navButtons[index] && routeMap[index]) {
            navButtons[index].classList.add('active');
            navButtons[index].setAttribute('aria-selected', 'true');
            routeMap[index].classList.add('active');
        }
    }

    navButtons.forEach((button, index) => {
        button.addEventListener('click', function() {
            switchRouteMap(index);
        });
    });

    if (navButtons.length > 0 && routeMap.length > 0) {
        setTimeout(() => {
            switchRouteMap(0);
        }, 100);
    }
})