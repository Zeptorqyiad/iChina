document.querySelectorAll('.banner').forEach(container => {
    const slider = container.querySelector('.banner__slider');
    const scrollbarElement = container.querySelector('.swiper-scrollbar');

    const swiperConfig = {
        loop: true,
        simulateTouch: false,

        scrollbar: {
            el: scrollbarElement,
            draggable: false,
            hide: false,
        },
    };

    swiperConfig.navigation = {
        prevEl: container.querySelector('.banner__button-prev'),
        nextEl: container.querySelector('.banner__button-next')
    };

    new Swiper(slider, swiperConfig);
});

