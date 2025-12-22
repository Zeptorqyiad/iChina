<?php
/** @var $data array */

$titleCardClasses = [
    'title-card',
    $data['className'] ?? ''
]
?>

<div class="<?= implode(' ', $titleCardClasses) ?>" <?= buildAttrs($data['attributes'] ?? []) ?>>
    <div class="title-card__wrap">
        <?php if ($data['title'] || $data['titleAccent']): ?>
            <h2 class="title-card__title">
                <?= $data['title']?>

                <span><?= $data['titleAccent'] ?></span>
            </h2>
        <?php endif; ?>
        <?php if ($data['desc']): ?>
            <div class="title-card__desc">
                <?= $data['desc'] ?>
            </div>
        <?php endif; ?>
    </div>

    <?php if ($data['separator']): ?>
        <?php
            App\Layout\Components\UI\Core\Separator\Layout::drawSeparator(
                className: 'title-card__separator'
            );
        ?>
    <?php endif; ?>
</div>
