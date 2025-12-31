<?php
/** @var array $data */

?>

<?php if ($data['photo']): ?>
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
                            style: App\Layout\Components\UI\Core\Badge\BadgeStyle::White,
                            size: App\Layout\Components\UI\Core\Badge\BadgeSize::Medium,
                        );
                        ?>
                    <?php endif; ?>
                    <?php if ($data['category']): ?>
                        <?php App\Layout\Components\UI\Core\Badge\Layout::drawBadge(
                            className: 'reviews-card__badge-category',
                            text: $data['category'],
                            style: App\Layout\Components\UI\Core\Badge\BadgeStyle::Dark,
                            size: App\Layout\Components\UI\Core\Badge\BadgeSize::Medium,
                        ); ?>
                    <?php endif; ?>
                </div>

                <?php App\Layout\Components\UI\Core\Buttons\Button\Layout::drawButton(
                    className: 'reviews-card__button',
                    text: 'Читать',
                    link: $data['path'],
                    icon: 'arrow-right',
                    style: App\Layout\Components\UI\Core\Buttons\Button\ButtonStyle::Gray,
                    iconPos: App\Layout\Components\UI\Core\Buttons\Button\ButtonIconPos::Right,
                    attributes: [
                        'draggable' => 'false'
                    ]
                ); ?>
            </div>

            <img class="reviews-card__image"
                 src="/uf/images/source/<?= $data['photo'] ?>"
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
<?php elseif ($data['video_v'] || $data['video_h'] || $data['video']): ?>
    <div class="reviews-card video-card <?= $data['className'] ?>">
        <div class="reviews-card__container">
            <div class="reviews-card__badges">
                <?php if ($data['date']): ?>
                    <?php
                    App\Layout\Components\UI\Core\Badge\Layout::drawBadge(
                        className: 'reviews-card__badge-date',
                        text: $data['date'],
                        style: App\Layout\Components\UI\Core\Badge\BadgeStyle::White,
                        size: App\Layout\Components\UI\Core\Badge\BadgeSize::Medium,
                    );
                    ?>
                <?php endif; ?>
                <?php if ($data['category']): ?>
                    <?php App\Layout\Components\UI\Core\Badge\Layout::drawBadge(
                        className: 'reviews-card__badge-category',
                        text: $data['category'],
                        style: App\Layout\Components\UI\Core\Badge\BadgeStyle::Dark,
                        size: App\Layout\Components\UI\Core\Badge\BadgeSize::Medium,
                    ); ?>
                <?php endif; ?>
            </div>
            <?php if ($data['video']): ?>
                <div class="reviews-card__video upload-video">
                    <video
                       playsinline
                       loop
                       autoplay
                       muted
                       preload="metadata"
                    >
                        <source src="/uf/files/<?= $data['video'] ?>"
                                type="video/<?= pathinfo($data['video'], PATHINFO_EXTENSION) ?>">
                        Ваш браузер не поддерживает видео.
                    </video>
                </div>
            <?php endif; ?>
            <?php if ($data['video_h']): ?>
                <div class="reviews-card__video horizontal-video">
                    <?= $data['video_h'] ?>
                </div>
            <?php endif; ?>
            <?php if ($data['video_v']): ?>
                <div class="reviews-card__video vertical-video">
                    <?= $data['video_v'] ?>
                </div>
            <?php endif; ?>
            <?php App\Layout\Components\UI\Core\Buttons\Button\Layout::drawButton(
                className: 'reviews-card__button',
                text: 'Читать',
                link: $data['path'],
                icon: 'arrow-right',
                style: App\Layout\Components\UI\Core\Buttons\Button\ButtonStyle::Gray,
                iconPos: App\Layout\Components\UI\Core\Buttons\Button\ButtonIconPos::Right,
                attributes: [
                    'draggable' => 'false'
                ]
            ); ?>
        </div>
        <h3 class="reviews-card__title">
            <?= $data['title'] ?>
        </h3>
    </div>
<?php else: ?>
    <div class="reviews-card reviews-card-text <?= $data['className'] ?>">
        <a class="reviews-card__link"
           href="<?= $data['path'] ?>"
           draggable="false"
        ></a>
        <div class="reviews-card__container">
            <div class="reviews-card__wrap">
                <div class="reviews-card__badges">
                    <?php if ($data['date']): ?>
                        <?php
                        App\Layout\Components\UI\Core\Badge\Layout::drawBadge(
                            className: 'reviews-card__badge-date',
                            text: $data['date'],
                            style: App\Layout\Components\UI\Core\Badge\BadgeStyle::White,
                            size: App\Layout\Components\UI\Core\Badge\BadgeSize::Medium,
                        );
                        ?>
                    <?php endif; ?>
                    <?php if ($data['category']): ?>
                        <?php App\Layout\Components\UI\Core\Badge\Layout::drawBadge(
                            className: 'reviews-card__badge-category',
                            text: $data['category'],
                            style: App\Layout\Components\UI\Core\Badge\BadgeStyle::Dark,
                            size: App\Layout\Components\UI\Core\Badge\BadgeSize::Medium,
                        ); ?>
                    <?php endif; ?>
                </div>

                <?php App\Layout\Components\UI\Core\Buttons\Button\Layout::drawButton(
                    className: 'reviews-card__button',
                    text: 'Читать',
                    link: $data['path'],
                    icon: 'arrow-right',
                    style: App\Layout\Components\UI\Core\Buttons\Button\ButtonStyle::Gray,
                    iconPos: App\Layout\Components\UI\Core\Buttons\Button\ButtonIconPos::Right,
                    attributes: [
                        'draggable' => 'false'
                    ]
                ); ?>
            </div>
            <?php if ($data['text']): ?>
                <div class="reviews-card__desc">
                    <?= $data['text'] ?>
                </div>
            <?php endif; ?>
        </div>

        <h3 class="reviews-card__title">
            <?= $data['title'] ?>
        </h3>
    </div>
<?php endif; ?>