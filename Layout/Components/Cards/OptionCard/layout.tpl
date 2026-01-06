<?php
/** @var array $data */

?>

<div class="option-card">
    <div class="option-card__content">
        <?php if ($data['title']): ?>
            <h3 class="option-card__content-title">
                <?= $data['title'] ?>
            </h3>
        <?php endif; ?>

        <?php if ($data['image']): ?>
            <img src="<?= $data['image'] ?>" alt="" class="option-card__content-image">
        <?php endif; ?>

        <?php
            App\Layout\Components\Cards\BullitsCard\Layout::drawBullitsCard(
                desc: $data['desc'],
            );
        ?>
    </div>

    <?php if ($data['link']): ?>
        <?php
            App\Layout\Components\UI\Core\Buttons\Button\Layout::drawButton(
                className: 'option-card__button',
                text: $data['text'],
                link: $data['link'],
                style: App\Layout\Components\UI\Core\Buttons\Button\ButtonStyle::Outline,
            );
        ?>
    <?php else: ?>
        <?php
        App\Layout\Components\UI\Core\Buttons\Button\Layout::drawButton(
            className: 'option-card__button',
            text: $data['text'],
            attributes: [
                'onclick' => 'modalManager.open("callback-modal")',
            ]
        );
        ?>
    <?php endif; ?>
</div>