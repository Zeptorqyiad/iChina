<?php
/** @var array $data */

?>

<div class="post-heading ">
    <div class="post-heading__container container">
        <div class="post-heading__top">
            <div class="post-heading__links">
                <?php
                if ($data['category']) {
                    App\Layout\Components\UI\Core\Tab\Layout::drawTab(
                        className: 'post-heading__link post-heading__category',
                        text: $data['category'],
                        link: '/blog/?c=' . $data['categoryId'] ?? 0,
                        iconLeft: 'uniq-hashtag',
                        size: \App\Layout\Components\UI\Core\Tab\TabSize::Small,
                    );
                }

                if ($data['date']) {
                    App\Layout\Components\UI\Core\Tab\Layout::drawTab(
                        className: 'post-heading__link post-heading__date',
                        text: $data['date'],
                        size: \App\Layout\Components\UI\Core\Tab\TabSize::Small,
                    );
                }

                if ($data['views']) {
                    App\Layout\Components\UI\Core\Tab\Layout::drawTab(
                        className: 'post-heading__link post-heading__views',
                        text: $data['views'] . ' ' . Simflex\Core\Helpers\Str::pluralize($data['views'], 'просмотр', true, false),
                        size: \App\Layout\Components\UI\Core\Tab\TabSize::Small,
                    );
                }

                App\Layout\Components\UI\Core\Buttons\Button\Layout::drawButton(
                    className: 'post-heading__link post-heading__button-share share-button',
                    text: 'Поделиться',
                    icon: 'share',
                    style: \App\Layout\Components\UI\Core\Buttons\Button\ButtonStyle::Secondary,
                    size: \App\Layout\Components\UI\Core\Buttons\Button\ButtonSize::Small,
                );
                ?>
            </div>
        </div>

        <?php if ($data['desc']): ?>
            <div class="post-heading__bottom">
                <p class="post-heading__desc"><?= $data['desc'] ?></p>
            </div>
        <?php endif; ?>
    </div>
</div>