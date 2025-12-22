<?php
/** @var $data array */

$benefitsCardClasses = [
    'benefits-card',
    "benefits-card-style_{$data['style']}",
    $data['className'] ?? ''
];
?>

<div class="<?= implode(' ', $benefitsCardClasses) ?>"
   <?= buildAttrs($data['attributes'] ?? []) ?>
   draggable="false"
>
    <?php if ($data['image']): ?>
        <div class="benefits-card__image">
            <img src="<?= $data['image'] ?>" alt="">
        </div>
    <?php endif; ?>

    <div class="benefits-card__wrap">
        <?php if ($data['title']): ?>
            <h4 class="benefits-card__wrap--title">
                <?= $data['title'] ?>
            </h4>
        <?php endif ?>

        <?php App\Layout\Components\UI\Core\Separator\Layout::drawSeparator(
                className: 'benefits-card__separator',
        ); ?>

        <?php if ($data['text']): ?>
            <div class="benefits-card__wrap--desc">
                <?= $data['text'] ?>
            </div>
        <?php endif; ?>
    </div>
</div>