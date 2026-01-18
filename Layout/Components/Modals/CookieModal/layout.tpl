<div class="cookie-modal" id="cookie" role="dialog">
    <div class="cookie-modal__container container">
        <div class="cookie-modal__description">
            <p class="cookie-modal__title">Сайт использует файлы Cookie</p>
            <p class="cookie-modal__text">
                Мы используем файлы cookie и сторонние сервисы (Yandex.Metrica и AppMetrica) для анализа трафика, персонализации контента и улучшения сайта. <br />
                Подробнее см. в <a href="/documents/policy/" class="accent-color">Политике обработки персональных данных</a>
            </p>
        </div>
        <?php
        App\Layout\Components\UI\Core\Buttons\Button\Layout::drawButton(
            className: 'cookie-modal__submit',
            text: 'Соглашаюсь',
            style: App\Layout\Components\UI\Core\Buttons\Button\ButtonStyle::Gray,
            size: App\Layout\Components\UI\Core\Buttons\Button\ButtonSize::Small,
        ); ?>
    </div>
</div>