<?php
/** @var array $data */

?>

<section class="post-content <?= $data['className'] ?>">
    <?php if ($data['content']): ?>
        <div class="post-content__body content">
            <?= $data['content'] ?>
        </div>
    <?php endif; ?>

    <div class="post-content__bottom">
        <?php if ($data['views']): ?>
            <div class="post-content__views">
                <span><?= $data['views'] ?></span>
                <span><?= Simflex\Core\Helpers\Str::pluralize($data['views'], 'просмотр', true, false) ?></span>
            </div>
        <?php endif; ?>

        <?php if ($data['date']): ?>
            <div class="post-content__date">
                <?= $data['date'] ?>
            </div>
        <?php endif; ?>

        <?php App\Layout\Components\UI\Core\Buttons\Button\Layout::drawButton(
            className: 'post-content__button-back',
            text: 'Назад',
            icon: 'arrow-left',
            style: App\Layout\Components\UI\Core\Buttons\Button\ButtonStyle::Secondary,
            attributes: [
                'onclick' => 'event.preventDefault(); history.back();',
            ]
        ); ?>

        <div class="post-content__feedback">
            <?php App\Layout\Components\UI\Core\Buttons\Button\Layout::drawButton(
                className: 'post-content__button-share share-button',
                text: 'Поделиться',
                icon: 'share',
                style: App\Layout\Components\UI\Core\Buttons\Button\ButtonStyle::Secondary,
            ); ?>
        </div>
    </div>
</section>