<?php
/** @var $data array */
?>

<div class="accent-card">
    <?php if ($data['text']): ?>
        <?php
            App\Layout\Components\UI\Core\Badge\Layout::drawBadge(
                className: 'accent-card__badge',
                text: $data['text'],
                style: App\Layout\Components\UI\Core\Badge\BadgeStyle::Success,
                size: App\Layout\Components\UI\Core\Badge\BadgeSize::ExtraLarge,
            );
        ?>
    <?php endif; ?>

    <?php if ($data['desc']): ?>
        <div class="accent-card__desc">
            <?= $data['desc'] ?>
        </div>
    <?php endif; ?>
</div>
