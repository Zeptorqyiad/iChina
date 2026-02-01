document.addEventListener('DOMContentLoaded', () => {
    const containers = document.querySelectorAll('[data-case-video]');
    if (!containers.length) return;

    containers.forEach(function (container) {
        const video = container.querySelector('video');
        const button = container.querySelector('.case-content__video-play');
        if (!video || !button) return;

        const showOverlay = function () {
            container.classList.remove('is-playing');
            button.removeAttribute('aria-hidden');
        };

        const hideOverlay = function () {
            container.classList.add('is-playing');
            button.setAttribute('aria-hidden', 'true');
        };

        const startVideo = function () {
            if (!video.hasAttribute('controls')) {
                video.setAttribute('controls', '');
            }
            const playPromise = video.play();
            if (playPromise && typeof playPromise.catch === 'function') {
                playPromise.catch(function () {
                    showOverlay();
                });
            }
            hideOverlay();
        };

        button.addEventListener('click', startVideo);
        video.addEventListener('play', hideOverlay);
        video.addEventListener('pause', showOverlay);
        video.addEventListener('ended', showOverlay);
    });
})