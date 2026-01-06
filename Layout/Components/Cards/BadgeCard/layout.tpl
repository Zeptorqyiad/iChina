<?php
/** @var $data array */

?>

<div class="badge-card">
    <?php
        App\Layout\Components\UI\Core\Badge\Layout::drawBadge(
            className: 'badge-card__badge',
            text: $data['text'],
            size: App\Layout\Components\UI\Core\Badge\BadgeSize::ExtraLarge,
            icon: $data['icon'] ?? '',
        );
    ?>

    <?php if ($data['desc']): ?>
        <div class="badge-card__desc">
            <?= $data['desc'] ?>
        </div>
    <?php endif; ?>
</div>
