<?php
/** @var array $data */
?>

<section class="reviews-slider <?= $data['className'] ?>">
    <h2 class="section-title reviews-slider__title title">
        <?= $data['title'] ?>
    </h2>

    <div class="reviews-slider__buttons">
        <?php
        if ($data['link']) {
            App\Layout\Components\UI\Core\Buttons\Button\Layout::drawButton(
                className: 'reviews-slider__button-link',
                text: 'Показать все',
                link: $data['link'],
                style: \App\Layout\Components\UI\Core\Buttons\Button\ButtonStyle::Gray,
            );
        }
        App\Layout\Components\UI\Core\Buttons\Button\Layout::drawButton(
            className: 'reviews-slider__button-prev',
            icon: 'arrow-left',
            style: \App\Layout\Components\UI\Core\Buttons\Button\ButtonStyle::Outline,
        );
        App\Layout\Components\UI\Core\Buttons\Button\Layout::drawButton(
            className: 'reviews-slider__button-next',
            icon: 'arrow-right',
            style: \App\Layout\Components\UI\Core\Buttons\Button\ButtonStyle::Outline,
        );
        ?>
    </div>

    <div class="reviews-slider__slider-wrap">
        <div class="reviews-slider__slider">
            <div class="swiper-wrapper">
                <?php foreach ($data['cards'] as $card) {
                    App\Layout\Components\Cards\DocCard\Layout::drawDocCard(
                        className: 'swiper-slide',
                        title: $card['title'] ?? '',
                        image: $card['image'] ?? '',
                        groupImages: 'review-images'
                    );
                } ?>
            </div>
        </div>
    </div>
</section>
