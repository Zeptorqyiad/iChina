document.addEventListener('DOMContentLoaded', () => {
    const swiperManager = {
        create: function (element, config) {
            return new Swiper(element, config);
        }
    };

    document.querySelectorAll('.certificate').forEach(container => {
        const slider = container.querySelector('.certificate__slider');
        const slides = slider.querySelectorAll('.swiper-slide');
        const hasNavigation = slides.length > 2;

        const swiperConfig = {
            loop: true,
            breakpoints: {
                0: {spaceBetween: 16, slidesPerView: 1.26},
                481: {spaceBetween: 16, slidesPerView: 2},
                811: {spaceBetween: 20, slidesPerView: 2.1},
                1401: {spaceBetween: 20, slidesPerView: 2.52},
            },
        };

        if (hasNavigation) {
            swiperConfig.navigation = {
                element: container.querySelector('.certificate__buttons')
            };
        } else {
            const buttons = container.querySelector('.certificate__buttons');
            if (buttons) buttons.style.display = 'none';
        }

        new Swiper(slider, swiperConfig);
    });
});