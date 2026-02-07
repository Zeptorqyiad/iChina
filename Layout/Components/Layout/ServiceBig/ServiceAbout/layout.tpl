<?php
/** @var $data array */

?>

<section class="service-about">
    <div class="service-about__container container">
        <?php if ($data['title'] || $data['titleAccent']) {
            App\Layout\Components\Cards\TitleCard\Layout::drawTitleCard(
                title: $data['title'] ?? '',
                titleAccent: $data['titleAccent'] ?? '',
                desc: $data['desc'] ?? '',
            );
        } ?>

        <div class="service-about__wrap">
            <div class="service-about__left">
                <?php if ($data['subtitle-left']): ?>
                    <div class="service-about__left-subtitle">
                        <?= $data['subtitle-left'] ?>
                    </div>
                <?php endif; ?>

                <?php if ($data['desc-left']): ?>
                    <div class="service-about__left-desc content">
                        <?= $data['desc-left'] ?>
                    </div>
                <?php endif; ?>
            </div>

            <div class="service-about__right">
                <?php if ($data['subtitle-right'] && $data['desc-right']): ?>
                    <div class="service-about__right-text">
                        <div class="service-about__right-subtitle">
                            <?= $data['subtitle-right'] ?>
                        </div>

                        <div class="service-about__right-desc content">
                            <?= $data['desc-right'] ?>
                        </div>
                    </div>
                <?php endif; ?>

                <?php if ($data['bullits'] || $data['bullitsTitle']) {
                    App\Layout\Components\Cards\BullitsCard\Layout::drawBullitsCard(
                        title: $data['bullitsTitle'] ?? '',
                        bullits: $data['bullits'],
                    );
                } ?>
                <?php if ($data['accent-text']): ?>
                    <?php App\Layout\Components\Cards\AccentCard\Layout::drawAccentCard(
                        desc: $data['accent-text'],
                    ); ?>
                <?php endif; ?>
            </div>
        </div>
        <?php if ($data['items'] && $data['image']): ?>
            <?php App\Layout\Components\UI\Core\Separator\Layout::drawSeparator(
                className: 'service-about__separator'
            ); ?>

            <div class="service-about__plus">
                <?php foreach ($data['items'] as $i) {
                    App\Layout\Components\Cards\PlusCard\Layout::drawPlusCard(
                        text: $i['text'],
                        icon: $i['img'],
                    );
                } ?>
            </div>

            <?php App\Layout\Components\UI\Core\Separator\Layout::drawSeparator(
                className: 'service-about__separator'
            ); ?>

            <div class="service-about__banner">
                <img src="/uf/images/source/<?= $data['image'] ?>"
                     alt="image"
                     class="service-about__banner-image">

                <?php App\Layout\Components\Cards\OfferCard\Layout::drawOfferCard(
                    title: $data['offer-title'] ?? '',
                    desc: $data['offer-desc'] ?? '',
                    price: $data['offer-price'] ?? '',
                    time: $data['offer-time'] ?? '',
                    text: $data['offer-text'] ?? '',
                ); ?>
            </div>
        <?php endif; ?>

        <?php if ($data['callback-title'] || $data['callback-desc']): ?>
            <?php App\Layout\Components\UI\Core\Separator\Layout::drawSeparator(
                className: 'service-about__separator'
            ); ?>

            <?php App\Layout\Components\Cards\CallbackCard\Layout::drawCallbackCard(
                className: 'service-about__callback',
                title: $data['callback-title'] ?? '',
                desc: $data['callback-desc'] ?? '',
                buttonText: $data['callback-button-text'] ?? '',
            ); ?>
        <?php endif; ?>
    </div>
</section>
