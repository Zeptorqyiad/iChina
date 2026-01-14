document.querySelectorAll('.banner').forEach(container => {
    const slider = container.querySelector('.banner__slider');

    const swiperConfig = {
        loop: true,
        simulateTouch: false,
    };

    swiperConfig.navigation = {
        prevEl: container.querySelector('.banner__button-prev'),
        nextEl: container.querySelector('.banner__button-next')
    };

    new Swiper(slider, swiperConfig);
});

