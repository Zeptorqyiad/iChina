<?php
/** @var $data array */

$PlusCardClasses = [
    'plus-card',
    "plus-card-color_{$data['color']}",
    $data['className'] ?? ''
]
?>

<div class="<?= implode(' ', $PlusCardClasses) ?>" <?= buildAttrs($data['attributes'] ?? []) ?>>
    <?php
        App\Layout\Components\UI\Core\Marker\Layout::drawMarker(
            className: 'plus-card__marker',
            icon: false,
            img: $data['icon'],
            size: App\Layout\Components\UI\Core\Marker\MarkerSize::Large,
        );
    ?>

    <div class="plus-card__text"><?= $data['text'] ?></div>
</div>
