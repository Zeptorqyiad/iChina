<?php
/** @var array $data */

?>

<article class="<?= $data['className'] ?> media-card">
    <?php if ($data['badge'] || $data['name'] || $data['text']): ?>
        <div class="media-card__info">
            <?php if($data['badge']): ?>
                <div class="media-card__badge">
                    <?php App\Layout\Components\UI\Core\Badge\Layout::drawBadge(
                        className: 'media-card__category',
                        text: $data['badge'],
                        style: App\Layout\Components\UI\Core\Badge\BadgeStyle::Secondary,
                        size: App\Layout\Components\UI\Core\Badge\BadgeSize::Medium,
                    ); ?>
                </div>
            <?php endif; ?>
            <div class="media-card__text">
                <?php if($data['title']): ?>
                    <h5 class="media-card__text-title">
                        <?= $data['title'] ?>
                    </h5>
                <?php endif; ?>
                <?php if($data['text']): ?>
                    <p class="media-card__text-desc">
                        <?= $data['text'] ?>
                    </p>
                <?php endif; ?>
            </div>
        </div>
    <?php endif; ?>

    <?php if($data['photo']): ?>
        <div class="media-card__image-block">
            <img src="/uf/images/source/<?= $data['photo'] ?>" alt="" class="media-card__image" draggable="false">
        </div>
    <?php elseif ($data['video']): ?>
        <video class="media-card__video horizontal-video"
           playsinline
           muted
           autoplay
           loop
           preload="metadata"
        >
            <source src="/uf/files/<?= $data['video'] ?>" type="video/<?= pathinfo($data['video'], PATHINFO_EXTENSION) ?>">
            Ваш браузер не поддерживает видео.
        </video>
    <?php elseif ($data['video_h']): ?>
        <div class="media-card__video horizontal-video">
            <iframe src="<?= $data['video_h'] ?>"
                allow="autoplay; encrypted-media; fullscreen; picture-in-picture; screen-wake-lock;"
                frameborder="0"
                allowfullscreen>
            </iframe>
        </div>
    <?php elseif ($data['video_v']): ?>
        <div class="media-card__video vertical-video">
            <iframe src="<?= $data['video_v'] ?>"
                allow="autoplay; encrypted-media; fullscreen; picture-in-picture; screen-wake-lock;"
                frameborder="0"
                allowfullscreen>
            </iframe>
        </div>
    <?php endif; ?>

    <div class="media-card__bottom">
        <div class="media-card__bottom--ls">
            <?php App\Layout\Components\UI\Core\Buttons\Button\Layout::drawButton(
                className: 'media-card__link',
                text: 'Подробнее',
                link: $data['path'] . '/',
                icon: 'arrow-right',
                style: App\Layout\Components\UI\Core\Buttons\Button\ButtonStyle::Gray,
                iconPos: App\Layout\Components\UI\Core\Buttons\Button\ButtonIconPos::Right
            ); ?>
        </div>
        <div class="media-card__bottom--rs"
             data-id="<?= $data['blog_id'] ?>"
             data-path="blog"
             data-type="post"
        >

            <button class="media-card__feedback media-card__feedback-button"
                    data-action="like"
                    id="feedback-like-<?= $data['blog_id'] ?>"
            >
                <?= renderIcon('heart', 'feedback__icon')?>
                <span class="media-card__feedback-value media-card__feedback-button-value">
                    <?= $data['likes'] ?>
                </span>
            </button>

            <?php App\Layout\Components\UI\Core\Separator\Layout::drawSeparator(
                className: 'media-card__bottom-separator',
                orientation: App\Layout\Components\UI\Core\Separator\SeparatorOrientation::Vertical
            ); ?>

            <div class="media-card__feedback media-card__feedback-views">
                <?= renderIcon('eye', 'feedback__icon')?>
                <span class="media-card__feedback-value"><?=$data['views']?></span>
            </div>
        </div>
    </div>
</article>