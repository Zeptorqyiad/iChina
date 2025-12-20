<?php
/** @var array $data */

$tg = Simflex\Core\Core::siteParam('tg');
$vk = Simflex\Core\Core::siteParam('vk');
$wt = Simflex\Core\Core::siteParam('whats_app');
?>

<section class="main-about">
    <div class="main-about__container wrapper">
        <div class="main-about__content">
            <?php if ($data['title']): ?>
                <div class="main-about__title">
                    <h2> <?= $data['title'] ?> </h2>
                    <h2 class="main-about__title--accent">
                        <?= $data['title-accent'] ?>
                    </h2>
                    <h2> <?= $data['title-third'] ?> </h2>
                </div>
            <?php endif; ?>

            <ul class="main-about__items">
                <?php foreach ($data['items'] as $i): ?>
                    <li class="main-about__item <?= $i['className'] ?>" >
                        <?php App\Layout\Components\Cards\ServiceCard\Layout::drawServiceCard(
                            title: $i['title'],
                            desc: $i['desc'],
                            link: $i['link'],
                            image: $i['image'],
                            style: App\Layout\Components\Cards\ServiceCard\ServiceCardStyle::Gray,
                        ); ?>
                    </li>
                <?php endforeach; ?>
            </ul>
        </div>

        <div class="main-about__why">
            <div class="main-about__why-ls">
                <h4 class="main-about__why-ls--title">
                    <?= $data['title-why'] ?>
                </h4>

                <?php if (!empty($data['items-why'])): ?>
                    <ul class="main-about__why--list">
                        <?php foreach($data['items-why'] as $i): ?>
                            <li class="main-about__why--item">
                                <?= $i['text'] ?>
                            </li>
                        <?php endforeach; ?>
                    </ul>
                <?php endif; ?>
            </div>
            <div class="main-about__why-rs">
                <?php App\Layout\Components\Cards\AccentCard\Layout::drawAccentCard(
                    desc: $data['cardText-why'],
                ) ?>
                <div class="main-about__why-rs--text">
                    <?= $data['description-why'] ?>
                </div>

                <div class="main-about__why-buttons">
                    <?php App\Layout\Components\UI\Core\Buttons\Button\Layout::drawButton(
                            className: 'main-about__why-button--about',
                            text: 'Все услуги',
                            link: '/services/',
                            style: App\Layout\Components\UI\Core\Buttons\Button\ButtonStyle::Accent,
                    ); ?>

                    <?php if ($wt || $tg): ?>
                        <div class="main-about__why-buttons-social">
                            <?php
                            if ($wt) {
                                App\Layout\Components\UI\Core\Buttons\ButtonSocial\Layout::drawButtonSocial(
                                    className: 'main-about__why-button--social',
                                    link: $wt,
                                    type: App\Layout\Components\UI\Core\Buttons\ButtonSocial\ButtonSocialType::WhatsApp,
                                );
                            }
                            if ($vk) {
                                App\Layout\Components\UI\Core\Buttons\ButtonSocial\Layout::drawButtonSocial(
                                    className: 'main-about__why-button--social',
                                    link: $tg,
                                    type: App\Layout\Components\UI\Core\Buttons\ButtonSocial\ButtonSocialType::Vkontakte,
                                );
                            }
                            if ($tg) {
                                App\Layout\Components\UI\Core\Buttons\ButtonSocial\Layout::drawButtonSocial(
                                    className: 'main-about__why-button--social',
                                    link: $tg
                                );
                            }
                            ?>
                        </div>
                    <?php endif; ?>

                    <?php App\Layout\Components\UI\Core\Buttons\Button\Layout::drawButton(
                        className: 'main-about__why-button',
                        text: 'Подробнее о компании',
                        link: '/about/',
                        style: App\Layout\Components\UI\Core\Buttons\Button\ButtonStyle::Outline
                    ); ?>
                </div>
            </div>
        </div>

        <?php
        App\Layout\Components\UI\Core\Separator\Layout::drawSeparator(
            className: 'main-about__why-separator',
        );
        App\Layout\Components\Cards\CallbackCard\Layout::drawCallbackCard(
            title: $data['callback-title'],
            desc: $data['callback-desc'],
        ) ?>
    </div>
</section>