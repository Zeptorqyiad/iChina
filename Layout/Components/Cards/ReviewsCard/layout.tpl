<?php
/** @var array $data */

?>

<?php if ($data['image']): ?>
    <div class="reviews-card <?= $data['className'] ?>">
        <a class="reviews-card__link"
           href="<?= $data['path'] ?>"
           draggable="false"
           aria-label="<?= $data['title'] ?>"
        ></a>
        <div class="reviews-card__container">
            <div class="reviews-card__wrap">
                <div class="reviews-card__badges">
                    <?php if ($data['date']): ?>
                        <?php
                        App\Layout\Components\UI\Core\Badge\Layout::drawBadge(
                            className: 'reviews-card__badge-date',
                            text: $data['date'],
                            style: App\Layout\Components\UI\Core\Badge\BadgeStyle::Secondary,
                            size: App\Layout\Components\UI\Core\Badge\BadgeSize::Medium,
                        );
                        ?>
                    <?php endif; ?>
                    <?php if ($data['category']): ?>
                        <?php App\Layout\Components\UI\Core\Badge\Layout::drawBadge(
                            className: 'reviews-card__badge-category',
                            text: $data['category'],
                            style: App\Layout\Components\UI\Core\Badge\BadgeStyle::Secondary,
                            size: App\Layout\Components\UI\Core\Badge\BadgeSize::Medium,
                            icon: 'uniq-hashtag-slim'
                        ); ?>
                    <?php endif; ?>
                </div>

                <?php App\Layout\Components\UI\Core\Buttons\Button\Layout::drawButton(
                    className: 'reviews-card__button',
                    text: 'Читать',
                    link: $data['link'],
                    icon: 'arrow-right',
                    style: App\Layout\Components\UI\Core\Buttons\Button\ButtonStyle::Gray,
                    iconPos: App\Layout\Components\UI\Core\Buttons\Button\ButtonIconPos::Right,
                    attributes: [
                        'draggable' => 'false'
                    ]
                ); ?>
            </div>

            <img class="reviews-card__image"
                 src="/uf/images/source/<?= $data['image'] ?>"
                 alt=""
                 draggable="false"
                 loading="lazy"
            >
        </div>

        <div class="reviews-card__text">
            <h3 class="reviews-card__title">
                <?= $data['title'] ?>
            </h3>
            <p class="reviews-card__desc">
                <?= $data['desc'] ?>
            </p>
        </div>
    </div>
<?php elseif ($data['video_v'] || $data['video_h']): ?>
    <div class="reviews-card <?= $data['className'] ?>" title="<?= $data['title'] ?>">
        <a href="<?= $data['path'] ?>" class="reviews-card__slide" draggable="false">
            <div class="reviews-card__image-block">
                <?php if ($data['badge']): ?>
                    <span class="reviews-card__badge promo__badge">
                        <?= $data['badge'] ?>
                    </span>
                <?php endif ?>
                <?php if($data['video_h']): ?>
                    <div class="reviews-card__video horizontal-video">
                        <iframe src="<?= $data['video_h'] ?>"
                                allow="autoplay; encrypted-media; fullscreen; picture-in-picture; screen-wake-lock;"
                                frameborder="0"
                                allowfullscreen>
                        </iframe>
                    </div>
                <?php endif; ?>
                <?php if($data['video_v']): ?>
                    <div class="reviews-card__video vertical-video">
                        <iframe src="<?= $data['video_v'] ?>"
                                allow="autoplay; encrypted-media; fullscreen; picture-in-picture; screen-wake-lock;"
                                frameborder="0"
                                allowfullscreen>
                        </iframe>
                    </div>
                <?php endif; ?>
                <div class="reviews-card__swim-link">
                <span>
                    Смотреть
                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none">
                            <path fill-rule="evenodd"
                                  clip-rule="evenodd"
                                  d="M13.2929 5.29289C12.9024 5.68342 12.9024 6.31658 13.2929 6.70711L17.5858 11H4C3.44772 11 3 11.4477 3 12C3 12.5523 3.44772 13 4 13H17.5858L13.2929 17.2929C12.9024 17.6834 12.9024 18.3166 13.2929 18.7071C13.6834 19.0976 14.3166 19.0976 14.7071 18.7071L20.7071 12.7071C21.0976 12.3166 21.0976 11.6834 20.7071 11.2929L14.7071 5.29289C14.3166 4.90237 13.6834 4.90237 13.2929 5.29289Z"
                                  fill="none" />
                        </svg>
                </span>
                </div>
            </div>
            <div class="reviews-card__info">
                <div class="reviews-card__count">
                    <?= $data['date'] ?>

                    <span class="reviews-card__count--views">
                        <?= $data['views'] ?> просмотров
                    </span>
                </div>
                <h3 class="reviews-card__title">
                    <?= $data['title'] ?>
                </h3>
            </div>
        </a>
    </div>
<?php else: ?>
    <div class="reviews-card-text <?= $data['className'] ?>" title="<?= $data['title'] ?>">
        <div class="reviews-card__badges">
            <?php if ($data['date']): ?>
                <?php App\Layout\Components\UI\Core\Badge\Layout::drawBadge(
                    className: 'reviews-card__badge-date',
                    text: $data['date'],
                    style: App\Layout\Components\UI\Core\Badge\BadgeStyle::Secondary,
                    size: App\Layout\Components\UI\Core\Badge\BadgeSize::Medium,
                ); ?>
            <?php endif; ?>
            <?php if ($data['category']): ?>
                <?php App\Layout\Components\UI\Core\Badge\Layout::drawBadge(
                    className: 'reviews-card__badge-category',
                    text: $data['category'],
                    style: App\Layout\Components\UI\Core\Badge\BadgeStyle::Secondary,
                    size: App\Layout\Components\UI\Core\Badge\BadgeSize::Medium,
                    icon: 'uniq-hashtag-slim'
                ); ?>
            <?php endif; ?>
        </div>

        <div class="reviews-card-text__content">
            <h3 class="reviews-card-text__content--title">
                <?= $data['title'] ?>
            </h3>
            <div class="reviews-card-text__content--desc">
                <?= $data['desc'] ?>
            </div>
        </div>

        <?php App\Layout\Components\UI\Core\Buttons\Button\Layout::drawButton(
            className: 'reviews-card-text__link',
            text: 'Читать',
            link: $data['path'],
            icon: 'arrow-right',
            style: App\Layout\Components\UI\Core\Buttons\Button\ButtonStyle::Gray,
            iconPos: App\Layout\Components\UI\Core\Buttons\Button\ButtonIconPos::Right,
        ); ?>
    </div>
<?php endif; ?>