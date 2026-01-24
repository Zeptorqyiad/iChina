<?php
/** @var array $data */

$tooltipClasses = [
    'tooltip',
    "tooltip-theme_{$data['theme']}",
    "tooltip-position_{$data['position']}",
    "tooltip-side_{$data['side']}",
    $data['className'] ?? ''
];
?>

<div class="<?= implode(' ', $tooltipClasses) ?>" <?= buildAttrs($data['attributes'] ?? []) ?>>
    <div class="tooltip__text">
        <?php if ($data['title']): ?>
            <p class="tooltip__title">
                <?= $data['title'] ?>
            </p>
        <?php endif; ?>

        <?php if ($data['subtitle']): ?>
            <p class="tooltip__subtitle">
                <?= $data['subtitle'] ?>
            </p>
        <?php endif; ?>
    </div>
</div>
