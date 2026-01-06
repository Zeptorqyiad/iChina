<?php
/** @var $data array */

?>

<div class="callback-card">
    <?php if ($data['title']): ?>
        <h4 class="callback-card__title">
            <?= $data['title'] ?>
        </h4>
    <?php endif; ?>

    <div class="callback-card__info">
        <?php if ($data['desc']): ?>
            <div class="callback-card__info-desc">
                <?= $data['desc'] ?>
            </div>
        <?php endif; ?>

        <?php
            App\Layout\Components\UI\Core\Buttons\Button\Layout::drawButton(
                className: 'callback-card__info-button-callback',
                text: 'Назначить встречу',
                attributes: [
                    'onclick' => 'modalManager.open("callback-modal")',
                ]
            );
        ?>
    </div>
</div>
