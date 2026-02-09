document.querySelectorAll('.banner').forEach(container => {
    const slider = container.querySelector('.banner__slider');
    const scrollbarElement = container.querySelector('.swiper-scrollbar');
    const pageCurrent = container.querySelector('.banner__page--current');
    const pageAll = container.querySelector('.banner__page--all');

    const pad2 = value => String(value).padStart(2, '0');
    let totalSlides = 0;

    const updateProgress = (swiper) => {
        const drag = scrollbarElement?.querySelector('.swiper-scrollbar-drag');
        if (!drag || totalSlides <= 0) {
            return;
        }
        const percent = ((swiper.realIndex + 1) / totalSlides) * 100;
        drag.style.transform = 'translate3d(0, 0, 0)';
        drag.style.width = `${percent}%`;
    };

    const swiperConfig = {
        loop: true,
        simulateTouch: false,
        autoplay: {
            delay: 20000,
            disableOnInteraction: false,
        },

        scrollbar: {
            el: scrollbarElement,
            draggable: false,
            hide: false,
        },

        on: {
            init(swiper) {
                totalSlides = slider.querySelectorAll('.swiper-slide:not(.swiper-slide-duplicate)').length;
                if (pageAll) {
                    pageAll.textContent = `/${pad2(Math.max(totalSlides, 0))}`;
                }
                if (pageCurrent) {
                    pageCurrent.textContent = pad2(swiper.realIndex + 1);
                }
                updateProgress(swiper);
            },
            slideChange(swiper) {
                if (pageAll) {
                    pageAll.textContent = `/${pad2(Math.max(totalSlides, 0))}`;
                }
                if (pageCurrent) {
                    pageCurrent.textContent = pad2(swiper.realIndex + 1);
                }
                updateProgress(swiper);
            },
        },
    };

    swiperConfig.navigation = {
        prevEl: container.querySelector('.banner__button-prev'),
        nextEl: container.querySelector('.banner__button-next')
    };

    new Swiper(slider, swiperConfig);
});
