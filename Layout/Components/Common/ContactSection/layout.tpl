<?php
/** @var array $data */

$contactsClasses = [
    'contact-section',
    $data['className'] ?? ''
];

$email = Simflex\Core\Core::siteParam('email');
$phone = Simflex\Core\Core::siteParam('phone');
$address = Simflex\Core\Core::siteParam('address');
$workhours = Simflex\Core\Core::siteParam('workhours');
$tg = Simflex\Core\Core::siteParam('tg');
$wt = Simflex\Core\Core::siteParam('whats_app');
$vk = Simflex\Core\Core::siteParam('vk');
$max_social = Simflex\Core\Core::siteParam('max_social');

?>

<section class="<?= implode(' ', $contactsClasses) ?>" <?= buildAttrs($data['attributes'] ?? []) ?> id="contacts">
    <div class="contact-section__container container">
        <?php
            if ($data['title'] || $data['desc']) {
                App\Layout\Components\Cards\TitleCard\Layout::drawTitleCard(
                    title: $data['title'] ?? '',
                );
            }
        ?>

        <div class="contact-section__wrap">
            <div class="contact-section__info">
                <div class="contact-section__info-row">
                    <h5 class="contact-section__info-row--label">Телефон:</h5>

                    <?php if ($phone): ?>
                        <div class="contact-section__info-row--container">
                            <?php App\Layout\Components\UI\Core\Buttons\ButtonContact\Layout::drawButtonContact(
                                className: 'contact-section__info-row--phone',
                                text: '{phone}',
                                link: 'tel:{phone}',
                                style: App\Layout\Components\UI\Core\Buttons\ButtonContact\ButtonContactStyle::Monochrome,
                                size: App\Layout\Components\UI\Core\Buttons\ButtonContact\ButtonContactSize::Small,
                            ); ?>
                        </div>
                    <?php endif; ?>
                </div>
                <?php
                    App\Layout\Components\UI\Core\Separator\Layout::drawSeparator(
                        className: 'contact-section__separator'
                    );
                ?>
                <div class="contact-section__info-row">
                    <h5 class="contact-section__info-row--label">Почта:</h5>

                    <?php if ($email): ?>
                        <div class="contact-section__info-row--container">
                            <?php App\Layout\Components\UI\Core\Buttons\ButtonContact\Layout::drawButtonContact(
                                text: '{email}',
                                link: 'mailto:{email}',
                                style: App\Layout\Components\UI\Core\Buttons\ButtonContact\ButtonContactStyle::Monochrome,
                                size: App\Layout\Components\UI\Core\Buttons\ButtonContact\ButtonContactSize::Small,
                            ); ?>
                        </div>
                    <?php endif; ?>
                </div>
                <?php
                    App\Layout\Components\UI\Core\Separator\Layout::drawSeparator(
                        className: 'contact-section__separator'
                    );
                ?>
                <div class="contact-section__info-row">
                    <h5 class="contact-section__info-row--label">График работы:</h5>

                    <div class="contact-section__info-row--container">
                        <?php if ($workhours):?>
                            <div class="contact-section__info-row--text-lh">
                                <?= '{workhours}' ?>
                            </div>
                        <?php endif; ?>
                    </div>
                </div>
                <?php App\Layout\Components\UI\Core\Separator\Layout::drawSeparator(
                    className: 'contact-section__separator'
                ); ?>

                <div class="contact-section__info-row">
                    <h5 class="contact-section__info-row--label">Адрес главного офиса:</h5>

                    <div class="contact-section__info-row--container">
                        <?php if ($address):?>

                            <div class="contact-section__info-row--text-lh">
                                <?='{address}'?>
                            </div>
                        <?php endif; ?>
                    </div>

                    <?php App\Layout\Components\UI\Core\Separator\Layout::drawSeparator(
                        className: 'contact-section__separator'
                    ); ?>
                </div>

                <?php if ($tg || $wt): ?>
                    <div class="contact-section__info-row contact-section__info-row--social">
                        <h5 class="contact-section__info-row--label">Соц.сети и мессенджеры:</h5>

                        <div class="contact-section__info-social">
                            <?php
                            if ($wt) {
                                App\Layout\Components\UI\Core\Buttons\ButtonSocial\Layout::drawButtonSocial(
                                    className: 'contact-section__button-social',
                                    link: $wt,
                                    type: App\Layout\Components\UI\Core\Buttons\ButtonSocial\ButtonSocialType::WhatsApp
                                );
                            }

                            if ($tg) {
                                App\Layout\Components\UI\Core\Buttons\ButtonSocial\Layout::drawButtonSocial(
                                    className: 'contact-section__button-social',
                                    link: $tg
                                );
                            }

                            if ($max_social) {
                                App\Layout\Components\UI\Core\Buttons\Button\Layout::drawButton(
                                    className: 'header__items-callback--social social-max',
                                    link: $max_social,
                                    icon: 'social-max',
                                    style: App\Layout\Components\UI\Core\Buttons\Button\ButtonStyle::Secondary,
                                );
                            }
                            ?>
                        </div>
                    </div>
                <?php endif ?>
            </div>

            <div class="contact-section__map">
                <script type="text/javascript" charset="utf-8" async src="https://api-maps.yandex.ru/services/constructor/1.0/js/?um=constructor%3A9621d876410349ec0c553599034c60650545fc9faa9e1e0b581bdebd3826189c&amp;width=920&amp;height=650&amp;lang=ru_RU&amp;scroll=true"></script>
            </div>
        </div>
    </div>
</section>