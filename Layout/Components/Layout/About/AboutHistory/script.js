(function () {
    'use strict';

    class HistoryScroller {
        constructor(options = {}) {
            this.container = options.container || document.querySelector('.about-history__body');
            this.wrapper = options.wrapper || document.querySelector('.about-history__body-wrap');

            this.scrollAmount = options.scrollAmount || 300;
            this.scrollBehavior = options.scrollBehavior || 'smooth';

            this.isDragging = false;
            this.startX = 0;
            this.scrollLeft = 0;

            this.init();
        }

        init() {
            this.wrapper.addEventListener('mousedown', e => this.startDrag(e));
            this.wrapper.addEventListener('touchstart', e => this.startDrag(e), { passive: true });

            this.wrapper.addEventListener('mousemove', e => this.drag(e));
            this.wrapper.addEventListener('touchmove', e => this.drag(e), { passive: true });

            window.addEventListener('mouseup', () => this.endDrag());
            window.addEventListener('touchend', () => this.endDrag());

            this.container.addEventListener('scroll', () => this.updateButtonState());

            this.container.style.cursor = 'grab';

            return this;
        }

        scrollNext() {
            this.container.scrollBy({
                left: this.scrollAmount,
                behavior: this.scrollBehavior
            });
        }

        scrollPrev() {
            this.container.scrollBy({
                left: -this.scrollAmount,
                behavior: this.scrollBehavior
            });
        }

        startDrag(e) {
            this.isDragging = true;
            this.startX = e.type.includes('mouse') ? e.pageX : e.touches[0].pageX;
            this.scrollLeft = this.container.scrollLeft;

            this.wrapper.style.cursor = 'grabbing';
            this.wrapper.style.userSelect = 'none';
        }

        drag(e) {
            if (!this.isDragging) return;

            if (e.type.includes('mouse')) {
                e.preventDefault();
            }

            const x = e.type.includes('mouse') ? e.pageX : e.touches[0].pageX;
            const distance = x - this.startX;

            this.container.scrollLeft = this.scrollLeft - distance;
        }

        endDrag() {
            this.isDragging = false;
            this.wrapper.style.cursor = 'grab';
            this.wrapper.style.userSelect = '';
        }

        scrollTo(position) {
            this.container.scrollTo({
                left: position,
                behavior: this.scrollBehavior
            });
        }

        destroy() {
            this.prevBtn.removeEventListener('click', () => this.scrollPrev());
            this.nextBtn.removeEventListener('click', () => this.scrollNext());
            this.wrapper.removeEventListener('mousedown', e => this.startDrag(e));
            this.wrapper.removeEventListener('touchstart', e => this.startDrag(e));
            this.wrapper.removeEventListener('mousemove', e => this.drag(e));
            this.wrapper.removeEventListener('touchmove', e => this.drag(e));
            window.removeEventListener('mouseup', () => this.endDrag());
            window.removeEventListener('touchend', () => this.endDrag());
            this.container.removeEventListener('scroll', () => this.updateButtonState());
            window.removeEventListener('resize', () => this.checkScrollableContent());
        }
    }

    document.addEventListener('DOMContentLoaded', () => {
        const scroller = new HistoryScroller();
    });
})();