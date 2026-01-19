<?php
/** @var $data array */

?>

<div class="banner-service__card">
    <?php if ($data['title']): ?>
        <div class="banner-service__card--title">
            <?= $data['title'] ?>
        </div>
    <?php endif; ?>

    <?php App\Layout\Components\UI\Core\Separator\Layout::drawSeparator(
        theme: App\Layout\Components\UI\Core\Separator\SeparatorTheme::Medium,
    ); ?>

    <?php if ($data['text']): ?>
        <div class="banner-service__card--text">
            <?= $data['text'] ?>
        </div>
    <?php elseif ($data['list']): ?>
        <ul class="banner-service__list">
            <?php foreach ($data['list'] as $i): ?>
                <li class="banner-service__item">
                    <svg class="bullits-card__bullit-icon"  viewBox="0 0 24 24">
                        <use href="/assets/icons/icons.svg#icon-true"></use>
                    </svg>

                    <div class="banner-service__item--text">
                        <?= $i['text'] ?>
                    </div>
                </li>
            <?php endforeach; ?>
        </ul>
    <?php endif; ?>

    <?php
        if ($data['buttonCard']) {
            App\Layout\Components\UI\Core\Buttons\Button\Layout::drawButton(
            className: 'banner-service__card--button',
            text: 'Получить расчет',
            icon: 'arrow-right',
            style: App\Layout\Components\UI\Core\Buttons\Button\ButtonStyle::Accent,
            iconPos: App\Layout\Components\UI\Core\Buttons\Button\ButtonIconPos::Right,
        );
    }
    ?>
</div>