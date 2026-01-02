<?php
/** @var array $data */

?>

<section class="banner-service wrapper">
    <div class="banner-service__background-image">
        <img src="/assets/images/placeholders/Banner.png" alt="">
        <div class="banner-service__background-image--mask"></div>
        <div class="banner-service__background-image--v-line"></div>
        <div class="banner-service__background-image--h-line"></div>
        <div class="banner-service__background-image--ellipse">
            <svg width="203" height="203" viewBox="0 0 203 203" fill="none" xmlns="http://www.w3.org/2000/svg">
                <path d="M202 202.5H0.501953C0.567029 176.077 5.78903 149.92 15.877 125.506C26.0285 100.938 40.9077 78.6142 59.665 59.8105C78.4225 41.0068 100.691 26.0905 125.198 15.9141C149.552 5.80153 175.643 0.566373 202 0.500977V202.5Z" stroke="#919599"/>
            </svg>
        </div>
    </div>

    <div class="banner-service__container">
        <div class="banner-service__content">
            <?php App\Layout\Components\UI\Core\BreadCrumbs\Layout::draw(); ?>

            <div class="banner-service__center">
                <div class="banner-service__center-ls">
                    <div class="banner-service__title-block">
                        <h1 class="banner-service__title-block--title">
                            <?= $data['title'] ?>
                        </h1>
                        <div class="banner-service__title-block--subtitle">
                            <?= $data['subtitle'] ?>
                        </div>
                    </div>
                    <div class="banner-service__description">
                        <?= $data['description'] ?>
                    </div>
                </div>
                <div class="banner-service__center-rs">
                    <div class="banner-service__card">
                        <?php if ($data['card-title']): ?>
                            <div class="banner-service__card--title">
                                <?= $data['card-title'] ?>
                            </div>
                        <?php endif; ?>

                        <?php App\Layout\Components\UI\Core\Separator\Layout::drawSeparator(
                            theme: App\Layout\Components\UI\Core\Separator\SeparatorTheme::Medium,
                        ); ?>

                        <?php if ($data['card-text']): ?>
                            <div class="banner-service__card--text">
                                <?= $data['card-text'] ?>
                            </div>
                        <?php endif; ?>

                        <?php App\Layout\Components\UI\Core\Buttons\Button\Layout::drawButton(
                            className: 'banner-service__card--button',
                            text: 'Получить расчет',
                            icon: 'arrow-right',
                            style: App\Layout\Components\UI\Core\Buttons\Button\ButtonStyle::Accent,
                            iconPos: App\Layout\Components\UI\Core\Buttons\Button\ButtonIconPos::Right,
                        ) ?>
                    </div>
                </div>
            </div>

            <ul class="banner-service__bottom">
                <?php foreach ($data['items'] as $i): ?>
                    <li class="banner-service__item">
                        <h2 class="banner-service__item--title">
                            <?= $i['title'] ?>
                        </h2>
                        <div class="banner-service__item--text">
                            <?= $i['text'] ?>
                        </div>
                    </li>
                <?php endforeach; ?>
            </ul>
        </div>
    </div>
</section>