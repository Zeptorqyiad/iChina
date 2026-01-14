<?php
/** @var array $data */

?>

<section class="banner">
    <div class="banner__content">
        <div class="banner__slider">
            <div class="swiper-wrapper">
                <div class="banner__slide swiper-slide">
                    <img src="/assets/images/Main/Banner_1.png" alt="" draggable="false">
                </div>
                <div class="banner__slide swiper-slide">
                    <img src="/assets/images/Main/Banner_2.png" alt="" draggable="false">
                </div>
            </div>
        </div>

        <div class="banner__navigation">
            <?php
            App\Layout\Components\UI\Core\Buttons\Button\Layout::drawButton(
                className: 'banner__button-prev',
                icon: 'chevron-left',
                style: App\Layout\Components\UI\Core\Buttons\Button\ButtonStyle::Flat,
                size: App\Layout\Components\UI\Core\Buttons\Button\ButtonSize::ExtraSmall,
            );
            App\Layout\Components\UI\Core\Buttons\Button\Layout::drawButton(
                className: 'banner__button-next',
                icon: 'chevron-right',
                style: App\Layout\Components\UI\Core\Buttons\Button\ButtonStyle::Flat,
                size: App\Layout\Components\UI\Core\Buttons\Button\ButtonSize::ExtraSmall,
            );
            ?>
        </div>
    </div>
</section>