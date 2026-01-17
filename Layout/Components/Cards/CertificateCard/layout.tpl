<?php
/** @var $data array */

$certificateCardClasses = [
    'certificate-card',
    "certificate-card-style_{$data['style']}",
    $data['className'] ?? ''
];
?>

<div class="<?= implode(' ', $certificateCardClasses) ?>" >
    <?php if ($data['image']): ?>
        <div class="certificate-card__image">
            <img src="<?= $data['image'] ?>" alt="">
        </div>
    <?php endif; ?>

    <?php if ($data['title']): ?>
        <h3 class="certificate-card__title">
            <?= $data['title'] ?>
        </h3>
    <?php endif; ?>

    <?php App\Layout\Components\UI\Core\Separator\Layout::drawSeparator(
        className: 'certificate-card__separator',
    ); ?>

    <?php if ($data['text']): ?>
        <div class="certificate-card__desc">
            <?= $data['text'] ?>
        </div>
    <?php endif; ?>
</div>
