document.addEventListener('DOMContentLoaded', () => {
    const swiperManager = {
        create: function (element, config) {
            return new Swiper(element, config);
        }
    };

    document.querySelectorAll('.reviews-slider').forEach(container => {
        const slider = container.querySelector('.reviews-slider__slider');
        const slides = slider.querySelectorAll('.swiper-slide');
        const hasNavigation = slides.length > 5;

        const swiperConfig = {
            loop: true,
            breakpoints: {
                0: {spaceBetween: 16, slidesPerView: 1.24},
                481: {spaceBetween: 16, slidesPerView: 2.6},
                811: {spaceBetween: 20, slidesPerView: 4.14},
                1401: {spaceBetween: 20, slidesPerView: 4.7},
            },
        };

        if (hasNavigation) {
            swiperConfig.navigation = {
                prevEl: container.querySelector('.reviews-slider__button-prev'),
                nextEl: container.querySelector('.reviews-slider__button-next')
            };
        } else {
            const prevButton = container.querySelector('.reviews-slider__button-prev');
            const nextButton = container.querySelector('.reviews-slider__button-next');
            if (prevButton) prevButton.style.display = 'none';
            if (nextButton) nextButton.style.display = 'none';
        }

        new Swiper(slider, swiperConfig);
    });
});
