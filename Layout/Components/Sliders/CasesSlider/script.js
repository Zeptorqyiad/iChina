document.addEventListener('DOMContentLoaded', () => {
    const swiperManager = {
        create: function (element, config) {
            return new Swiper(element, config);
        }
    };

    document.querySelectorAll('.js--cases-slider').forEach(container => {
        const slider = container.querySelector('.js--cases-slider__slider');
        const slides = slider.querySelectorAll('.swiper-slide');
        const hasNavigation = slides.length > 3;

        const swiperConfig = {
            loop: true,
            breakpoints: {
                0: {spaceBetween: 16, slidesPerView: 1.2},
                481: {spaceBetween: 16, slidesPerView: 2.5},
                811: {spaceBetween: 16, slidesPerView: 3.11},
                1401: {spaceBetween: 20, slidesPerView: 3.52},
            },
        };

        if (hasNavigation) {
            swiperConfig.navigation = {
                prevEl: container.querySelector('.cases-slider__button-prev'),
                nextEl: container.querySelector('.cases-slider__button-next')
            };
        } else {
            const prevButton = container.querySelector('.cases-slider__button-prev');
            const nextButton = container.querySelector('.cases-slider__button-next');
            if (prevButton) prevButton.style.display = 'none';
            if (nextButton) nextButton.style.display = 'none';
        }

        new Swiper(slider, swiperConfig);
    });
});
