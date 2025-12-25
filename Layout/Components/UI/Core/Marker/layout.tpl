<?php
/** @var array $data */

$markerClasses = [
    'marker',
    "marker-size_{$data['size']}",
    $data['className'] ?? ''
];
?>

<?php if ($data['icon']): ?>
<div class="<?= implode(' ', $markerClasses) ?>" <?= buildAttrs($data['attributes'] ?? []) ?>>
    <?= renderIcon($data['icon'], 'marker__icon') ?>
</div>
<?php elseif ($data['img']): ?>
<div class="<?= implode(' ', $markerClasses) ?>" <?= buildAttrs($data['attributes'] ?? []) ?>>
    <img src="<?= $data['img'] ?>" alt="">
</div>
<?php endif; ?>

