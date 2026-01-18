document.addEventListener('DOMContentLoaded', () => {
    const cookie = document.querySelector('.cookie-modal');
    const submitButton = document.querySelector('.cookie-modal__submit');
    const popupSocial = document.getElementById('popupSocial');

    // Проверяем, было ли уже дано согласие на использование cookies
    if (!localStorage.getItem('cookieConsent')) {
        cookie.classList.add('active');
    }

    // Обработчик клика по кнопке подтверждения
    submitButton.addEventListener('click', () => {
        cookie.classList.remove('active');
        localStorage.setItem('cookieConsent', 'true');

        // Вызываем событие storage, чтобы уведомить другие скрипты
        window.dispatchEvent(new Event('storage'));
    });

    // Наблюдаем за изменениями в элементе cookie
    const observer = new MutationObserver((mutationsList) => {
        mutationsList.forEach((mutation) => {
            if (mutation.type === 'attributes' && mutation.attributeName === 'class') {
                // Проверяем, удален ли класс active у cookie
                if (!cookie.classList.contains('active')) {
                    // Удаляем класс over-cookies у popupSocial

                    // Отключаем наблюдение, если класс active отсутствует
                    observer.disconnect();
                }
            }
        });
    });

    // Начинаем наблюдение за изменениями в атрибутах элемента cookie
    if (cookie) {
        observer.observe(cookie, {
            attributes: true
        });
    }
})