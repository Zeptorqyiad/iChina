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
                    ?>
                </div>
            </div>
        </div>

        <?php if (!empty($data['items'])): ?>
            <div class="contacts__content-rs">
                <?php foreach ($data['items'] as $i): ?>
                    <div class="contacts__content-rs_item">
                        <h5 class="contacts__content-rs_item--title">
                            <?= $i['title'] ?>
                        </h5>
                        <div class="contacts__content-rs_item--address">
                            <?= $i['subtitle'] ?>
                        </div>
                        <div class="contacts__content-rs_item--image">
                            <img src="<?= $i['image'] ?>"
                                 alt=""
                                 class="contacts__content-rs_item--image"
                            >
                            <img src="/assets/images/Contacts/dot.png"
                                 alt=""
                                 class="contacts__content-dot"
                            >
                        </div>
                    </div>
                <?php endforeach; ?>
            </div>
        <?php endif; ?>
    </div>
</section>