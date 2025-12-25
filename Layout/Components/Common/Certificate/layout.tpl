<?php
/** @var array $data */

?>

<section class="certificate">
    <?php if ($data['title']): ?>
        <h2 class="certificate__title">
            <?= $data['title'] ?>
        </h2>
    <?php endif; ?>

    <div class="certificate__left">
        <?php if ($data['desc']): ?>
            <div class="certificate__text">
                <?= $data['desc'] ?>
            </div>
        <?php endif; ?>

        <?php
            App\Layout\Components\UI\Core\Separator\Layout::drawSeparator(
                className: 'certificate__left-separator',
            );
        ?>

        <?php if (!empty($data['cards-plus'])): ?>
            <div class="certificate__plus">
                <?php foreach ($data['cards-plus'] as $i) {
                    App\Layout\Components\Cards\PlusCard\Layout::drawPlusCard(
                        text: $i['text'],
                        icon: $i['icon'],
                    );
                } ?>
            </div>
        <?php endif; ?>
    </div>

    <?php
        App\Layout\Components\UI\Core\Separator\Layout::drawSeparator(
            className: 'certificate__separator',
        );
    ?>

    <div class="certificate__slider-wrap">
        <div class="certificate__slider">
            <div class="swiper-wrapper">
                <?php foreach ($data['cards-doc'] as $i) {
                    App\Layout\Components\Cards\DocCard\Layout::drawDocCard(
                        className: 'swiper-slide',
                        title: $i['title'] ?? '',
                        image: $i['image'] ?? '',
                        groupImages: 'cert-images'
                    );
                } ?>
            </div>
        </div>
    </div>

    <div class="certificate__buttons">
        <?php
            App\Layout\Components\UI\Core\Buttons\Button\Layout::drawButton(
                className: 'certificate__button-prev',
                icon: 'arrow-left',
                style: App\Layout\Components\UI\Core\Buttons\Button\ButtonStyle::Outline,
            );
            App\Layout\Components\UI\Core\Buttons\Button\Layout::drawButton(
                className: 'certificate__button-next',
                icon: 'arrow-right',
                style: App\Layout\Components\UI\Core\Buttons\Button\ButtonStyle::Outline,
            );
        ?>
    </div>
</section>