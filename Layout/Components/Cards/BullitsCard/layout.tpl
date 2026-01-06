<?php
/** @var $data array */

$bullitsCardClasses = [
    'bullits-card',
    "bullits-card-theme_{$data['theme']}",
    $data['className'] ?? ''
];

?>

<ul class="<?= implode(' ', $bullitsCardClasses) ?>">
    <?php if ($data['desc']): ?>
        <div class="bullits-card__title">
            <?= $data['desc'] ?>
        </div>
    <?php endif; ?>

    <?php if ($data['bullits']):
        foreach ($data['bullits'] as $b): ?>
            <li class="bullits-card__bullit">
                <svg class="bullits-card__bullit-icon"  viewBox="0 0 24 24">
                    <use href="/assets/icons/icons.svg#icon-true"></use>
                </svg>

                <span>
                    <?= $b['text'] ?? '' ?>
                </span>
            </li>
        <?php endforeach; ?>
    <?php endif; ?>

    <?php if ($data['text']):
        foreach ($data['text'] as $i): ?>
            <li class="bullits-card__bullit">
                <svg class="bullits-card__bullit-icon"  viewBox="0 0 24 24">
                    <use href="/assets/icons/icons.svg#icon-true"></use>
                </svg>

                <span>
                    <?= $i->text ?>
                </span>
            </li>
        <?php endforeach; ?>
    <?php endif; ?>
</ul>