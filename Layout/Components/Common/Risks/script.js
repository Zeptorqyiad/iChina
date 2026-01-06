document.addEventListener('DOMContentLoaded', function() {
    const navButtonsDesktop = document.querySelectorAll('.tab-sticky .tab-nav__tab');
    const navButtonsMobile = document.querySelectorAll('.tab-list .tab-nav__tab');
    const contentSections = document.querySelectorAll('.risks__body-text');

    function switchSection(index) {

        navButtonsDesktop.forEach(button => {
            button.classList.remove('active');
            button.setAttribute('aria-selected', 'false');
        });

        navButtonsMobile.forEach(button => {
            button.classList.remove('active');
            button.setAttribute('aria-selected', 'false');
        });

        contentSections.forEach(section => {
            section.classList.remove('active');
        });

        if (navButtonsMobile[index]  && navButtonsDesktop[index] && contentSections[index]) {
            navButtonsMobile[index].classList.add('active');
            navButtonsMobile[index].setAttribute('aria-selected', 'true');
            navButtonsDesktop[index].classList.add('active');
            navButtonsDesktop[index].setAttribute('aria-selected', 'true');
            contentSections[index].classList.add('active');
        }
    }

    navButtonsMobile.forEach((button, index) => {
        button.addEventListener('click', function() {
            switchSection(index);
        });
    });

    navButtonsDesktop.forEach((button, index) => {
        button.addEventListener('click', function() {
            switchSection(index);
        });
    });

    navButtonsDesktop.forEach((desktopButton, index) => {
        desktopButton.addEventListener('click', function() {
            if (navButtonsMobile[index]) {
                switchSection(index);
            }
        });
    });

    navButtonsMobile.forEach((mobileButton, index) => {
        mobileButton.addEventListener('click', function() {
            if (navButtonsDesktop[index]) {
                switchSection(index);
            }
        });
    });

    if (navButtonsMobile.length > 0 && navButtonsDesktop.length > 0 && contentSections.length > 0) {
        setTimeout(() => {
            switchSection(0);
        }, 100);
    }
});