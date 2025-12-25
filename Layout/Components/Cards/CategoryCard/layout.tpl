<?php
/** @var $data array */
$categoryCardClasses = [
    'category-card',
    "category-card-color_{$data['color']}",
    "category-card-style_{$data['style']}",
    $data['className'] ?? ''
]
?>

<?php if ($data['link']): ?>
    <a href="<?= $data['link'] ?>" class="category-card--link <?= implode(' ', $categoryCardClasses) ?>" <?= buildAttrs($data['attributes'] ?? []) ?> title="<?= $data['title'] ?>">
    <?php
        App\Layout\Components\UI\Core\Marker\Layout::drawMarker(
            className: 'category-card__category-marker',
            icon: $data['icon'] ?? '',
            img: $data['img'] ?? '',
            size: App\Layout\Components\UI\Core\Marker\MarkerSize::Small
        );
    ?>
    <?php if ($data['title']): ?>
        <p class="category-card__title"><?= $data['title'] ?></p>
    <?php endif; ?>
        <span class="category-card__icon">
        <?= renderIcon('arrow-up-right') ?>
    </span>
    </a>
<?php else: ?>
    <div class="<?= implode(' ', $categoryCardClasses) ?>"
        <?= buildAttrs($data['attributes'] ?? []) ?> title="<?= $data['title'] ?>">

        <?php
            App\Layout\Components\UI\Core\Marker\Layout::drawMarker(
                className: 'category-card__category-marker',
                icon: $data['icon'] ?? '',
                size: App\Layout\Components\UI\Core\Marker\MarkerSize::Small
            );
        ?>

        <?php if ($data['title']): ?>
            <p class="category-card__title"><?= $data['title'] ?></p>
        <?php endif; ?>
    </div>
<?php endif; ?>
