<?php
/** @var $data array */

?>

<div class="banner-service__card">
    <?php if ($data['title']): ?>
        <div class="banner-service__card--title">
            <?= $data['title'] ?>
        </div>

        <?php App\Layout\Components\UI\Core\Separator\Layout::drawSeparator(
            theme: App\Layout\Components\UI\Core\Separator\SeparatorTheme::Medium,
        ); ?>
    <?php endif; ?>

    <?php if ($data['text']): ?>
        <div class="banner-service__card--text">
            <?= $data['text'] ?>
        </div>
    <?php endif; ?>

    <?php if ($data['buttonText']) {
        $buttonLink = $data['buttonLink'] ?? '';
        $buttonAttributes = [];
        if (!$buttonLink) {
            $buttonAttributes['onclick'] = 'modalManager.open("callback-modal")';
        }
        App\Layout\Components\UI\Core\Buttons\Button\Layout::drawButton(
            className: 'banner-service__card--button',
            text: $data['buttonText'],
            link: $buttonLink,
            icon: 'arrow-right',
            style: App\Layout\Components\UI\Core\Buttons\Button\ButtonStyle::Accent,
            iconPos: App\Layout\Components\UI\Core\Buttons\Button\ButtonIconPos::Right,
            attributes: $buttonAttributes,
        );
    }  ?>
</div>
