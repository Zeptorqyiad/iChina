<?php
/** @var array $data */

?>

<div class="tab-bar">
    <div class="tab-bar__container">
        <?php
        App\Layout\Components\UI\Core\Buttons\Button\Layout::drawButton(
            className: 'tab-bar__button',
            text: 'Услуги',
            link: '/services/',
            style: App\Layout\Components\UI\Core\Buttons\Button\ButtonStyle::Secondary,
            size: App\Layout\Components\UI\Core\Buttons\Button\ButtonSize::Small,
        );

        App\Layout\Components\UI\Core\Buttons\Button\Layout::drawButton(
            className: 'tab-bar__button',
            text: 'Связаться',
            size: App\Layout\Components\UI\Core\Buttons\Button\ButtonSize::Small,
            attributes: [
                'onclick' => 'modalManager.open("callback-modal");',
            ]
        );
        ?>
    </div>
</div>
