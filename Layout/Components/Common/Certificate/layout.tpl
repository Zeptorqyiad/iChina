<?php
/** @var array $data */

?>

<section class="certificate">
    <?php if ($data['title'] || $data['desc']) {
        App\Layout\Components\Cards\TitleCard\Layout::drawTitleCard(
            className: 'wrapper',
            title: $data['title'] ?? '',
            desc: $data['desc'] ?? '',
        );
    } ?>

    <div class="certificate__left">
        <?php
            $classNames = ['first', 'second', 'third'];
            if (!empty($data['items'])): ?>
            <div class="certificate__plus">
                <?php foreach ($data['items'] as $index => $i) {
                    $className = $classNames[$index] ?? '';
                    App\Layout\Components\Cards\CertificateCard\Layout::drawCertificateCard(
                        className: $className,
                        title: $i['title'] ?? '',
                        text: $i['text'] ?? '',
                        image: $i['img'] ?? '',
                    );
                } ?>
            </div>
        <?php endif; ?>
    </div>

    <?php App\Layout\Components\UI\Core\Separator\Layout::drawSeparator(
        className: 'certificate__separator',
    ); ?>

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