<?php
/** @var array $data */

$contactsClasses = [
    'contacts',
    $data['className'] ?? ''
];

$email = Simflex\Core\Core::siteParam('email');
$phone = Simflex\Core\Core::siteParam('phone');
$address = Simflex\Core\Core::siteParam('address');
$workhours = Simflex\Core\Core::siteParam('office_address');
$tg = Simflex\Core\Core::siteParam('tg');
$wt = Simflex\Core\Core::siteParam('whats_app');
$vk = Simflex\Core\Core::siteParam('vk');
$max_social = Simflex\Core\Core::siteParam('max_social');
$mapScripts = $data['mapScripts'] ?? [];

if (empty($mapScripts)) {
    $mapScripts = [
        '<script type="text/javascript" charset="utf-8" async src="https://api-maps.yandex.ru/services/constructor/1.0/js/?um=constructor%3Ae0eb2b77dd818b6aab6005ccf70f39e5f8730f2493db3052ae9079c444f7fbbf&amp;width=450&amp;height=600&amp;lang=ru_RU&amp;scroll=true"></script>',
        '<script type="text/javascript" charset="utf-8" async src="https://api-maps.yandex.ru/services/constructor/1.0/js/?um=constructor%3Adba3bdb02a43813c385e9f7984b8122489339f00af268eaf155978a3bd9d6101&amp;width=450&amp;height=600&amp;lang=ru_RU&amp;scroll=true"></script>',
    ];
}

?>

<section class="<?= implode(' ', $contactsClasses) ?>" <?= buildAttrs($data['attributes'] ?? []) ?> id="contacts">
    <div class="contacts__content container">
        <div class="contacts__content-ls">
            <div class="contacts__content_item">
                <h5 class="contacts__content_item--title">
                    Телефон:
                </h5>
                <div class="contacts__content_item--btn">
                    <?php
                    App\Layout\Components\UI\Core\Buttons\ButtonContact\Layout::drawButtonContact(
                        className: 'contacts__info-row--phone',
                        text: '{phone}',
                        link: 'tel:{phone}',
                        style: App\Layout\Components\UI\Core\Buttons\ButtonContact\ButtonContactStyle::Filled,
                        size: App\Layout\Components\UI\Core\Buttons\ButtonContact\ButtonContactSize::Small,
                    );
                    if ($wt) {
                        App\Layout\Components\UI\Core\Buttons\ButtonSocial\Layout::drawButtonSocial(
                            className: 'contacts__button-social',
                            link: $wt,
                            type: App\Layout\Components\UI\Core\Buttons\ButtonSocial\ButtonSocialType::WhatsApp
                        );
                    }
                    if ($tg) {
                        App\Layout\Components\UI\Core\Buttons\ButtonSocial\Layout::drawButtonSocial(
                            className: 'contacts__button-social',
                            link: $tg
                        );
                    }
                    ?>
                </div>

                <?php if ($workhours): ?>
                    <div class="contacts__content_item--workhours">
                        <?= $workhours ?>
                    </div>
                <?php endif; ?>
            </div>

            <?php App\Layout\Components\UI\Core\Separator\Layout::drawSeparator(); ?>

            <div class="contacts__content_item">
                <h5 class="contacts__content_item--title">
                    Почта:
                </h5>
                <div class="contacts__content_item--btn">
                    <?php if ($email) {
                        App\Layout\Components\UI\Core\Buttons\ButtonContact\Layout::drawButtonContact(
                            className: 'contacts__info-row--phone',
                            text: '{email}',
                            link: 'mailto:{email}',
                            style: App\Layout\Components\UI\Core\Buttons\ButtonContact\ButtonContactStyle::Filled,
                            size: App\Layout\Components\UI\Core\Buttons\ButtonContact\ButtonContactSize::Small,
                        );
                    } ?>
                </div>
            </div>

            <?php App\Layout\Components\UI\Core\Separator\Layout::drawSeparator(); ?>

            <div class="contacts__content_item">
                <h5 class="contacts__content_item--title">
                    Соц.сети и мессенджеры:
                </h5>
                <div class="contacts__content_item--btn">
                    <?php
                    if ($wt) {
                        App\Layout\Components\UI\Core\Buttons\ButtonSocial\Layout::drawButtonSocial(
                            className: 'contacts__button-social',
                            link: $wt,
                            type: App\Layout\Components\UI\Core\Buttons\ButtonSocial\ButtonSocialType::WhatsApp
                        );
                    }
                    if ($tg) {
                        App\Layout\Components\UI\Core\Buttons\ButtonSocial\Layout::drawButtonSocial(
                            className: 'contacts__button-social',
                            link: $tg
                        );
                    }
                    if ($vk) {
                        App\Layout\Components\UI\Core\Buttons\ButtonSocial\Layout::drawButtonSocial(
                            className: 'contacts__button-social',
                            link: $vk,
                            type: App\Layout\Components\UI\Core\Buttons\ButtonSocial\ButtonSocialType::Vkontakte,
                        );
                    }
                    if ($max_social) {
                        App\Layout\Components\UI\Core\Buttons\Button\Layout::drawButton(
                            className: 'header__items-callback--social',
                            link: $max_social,
                            icon: 'social-max',
                            style: App\Layout\Components\UI\Core\Buttons\Button\ButtonStyle::Secondary,
                        );
                    }
                    ?>
                </div>
            </div>
        </div>

        <?php if (!empty($data['items'])): ?>
            <div class="contacts__content-rs">
                <?php foreach ($data['items'] as $i => $index): ?>
                    <div class="contacts__content-rs_item">
                        <h5 class="contacts__content-rs_item--title">
                            <?= $index['title'] ?>
                        </h5>
                        <div class="contacts__content-rs_item--address">
                            <?= $index['subtitle'] ?>
                        </div>
                        <div class="contacts__content-rs_item--map">
                            <?php
                            $mapScript = $mapScripts[$i] ?? '';
                            if ($mapScript) {
                                echo $mapScript;
                            }
                            ?>
                        </div>
                    </div>
                <?php endforeach; ?>
            </div>
        <?php endif; ?>
    </div>
</section>
