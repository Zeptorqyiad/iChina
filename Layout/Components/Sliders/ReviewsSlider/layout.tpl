<?php
/** @var array $data */

?>

<section class="reviews-slider <?= $data['className'] ?>">
    <?php if ($data['title']): ?>
        <h2 class="section-title reviews-slider__title title wrapper uppercase">
            <?= $data['title'] ?>

            &nbsp;
            <?php if ($data['title-accent']): ?>
                <div class="reviews-slider__title--accent">
                    <?= $data['title-accent'] ?>
                </div>
            <?php endif; ?>
        </h2>
    <?php endif; ?>

    <div class="reviews-slider__buttons wrapper">
        <?php
            if ($data['link']) {
                App\Layout\Components\UI\Core\Buttons\Button\Layout::drawButton(
                    className: 'reviews-slider__button-link',
                    text: 'Показать все',
                    link: $data['link'],
                    style: App\Layout\Components\UI\Core\Buttons\Button\ButtonStyle::Gray,
                );
            }
            App\Layout\Components\UI\Core\Buttons\Button\Layout::drawButton(
                className: 'reviews-slider__button-prev',
                icon: 'arrow-left',
                style: App\Layout\Components\UI\Core\Buttons\Button\ButtonStyle::Outline,
            );
            App\Layout\Components\UI\Core\Buttons\Button\Layout::drawButton(
                className: 'reviews-slider__button-next',
                icon: 'arrow-right',
                style: App\Layout\Components\UI\Core\Buttons\Button\ButtonStyle::Outline,
            );
        ?>
    </div>

    <div class="reviews-slider__slider-wrap">
        <div class="reviews-slider__slider">
            <div class="swiper-wrapper">
                <?php foreach ($data['cards'] as $i) {
                    App\Layout\Components\Cards\ReviewsCard\Layout::drawReviewsCard(
                        className: 'swiper-slide review-card_uniq',
                        title: $i['name'] ?? '',
                        text: $i['short'] ?? '',
                        date: $i['date'] ?? '',
                        photo: $i['photo'] ?? '',
                        video: $i['video'] ?? '',
                        video_h: $i['video_horizontal'] ?? '',
                        video_v: $i['video_vertical'] ?? '',
                        path: '/reviews/' . $i['alias'] . '/',
                    );
                } ?>
            </div>
        </div>
    </div>
</section>
