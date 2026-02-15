<div class="cookie-modal" id="cookie" role="dialog">
    <div class="cookie-modal__container container">
        <div class="cookie-modal__description">
            <p class="cookie-modal__title">Продолжая использовать сайт, вы соглашаетесь с условиями пользовательского соглашения.</p>
            <p class="cookie-modal__text">
                Файлы cookies позволяют нам анализировать взаимодействие посетителей с сайтом с помощью Яндекс.Метрики, делая его удобнее и лучше. В cookie-файлах не хранятся личные данные.
                <br />
                <br />
                Если вы не хотите, чтобы эти данные обрабатывались, пожалуйста, покиньте сайт или отключите cookies в настройках браузера. 
                Продолжая пользоваться сайтом, вы подтверждаете, что уведомлены об этом и согласны с 
                условиями <a href="/documents/polzovatelskoe-soglasenie/" class="accent-color">Пользовательского соглашения</a> и 
                <a href="/documents/policy/" class="accent-color">Политики конфиденциальности</a> .
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