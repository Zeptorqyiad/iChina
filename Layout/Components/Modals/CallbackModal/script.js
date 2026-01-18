(function () {
    'use strict';

    const successModal = document.getElementById('callback-modal');
    const defaultTitle = successModal.querySelector('.callback-modal__title').textContent;
    const defaultDesc = successModal.querySelector('.callback-modal__desc').textContent;

    successModal.addEventListener('modalopen', function(event) {
        const data = event.detail || {};
        const titleElement = this.querySelector('.callback-modal__title');
        const descElement = this.querySelector('.callback-modal__desc');
        titleElement.textContent = data.title || defaultTitle;
        descElement.textContent = data.desc || defaultDesc;
    });
}());