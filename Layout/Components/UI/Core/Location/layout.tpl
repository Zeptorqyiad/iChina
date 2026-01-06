<?php
/** @var array $data */

$tooltipClasses = [
    'location',
    "location-theme_{$data['theme']}",
    $data['className'] ?? ''
];
?>

<div class="<?= implode(' ', $tooltipClasses) ?>" <?= buildAttrs($data['attributes'] ?? []) ?>>
    <div class="location__text">
        <?php if ($data['title']): ?>
            <p class="location__title"><?= $data['title'] ?></p>
        <?php endif; ?>

        <p class="location__subtitle"><?= $data['subtitle'] ?></p>
    </div>
</div>