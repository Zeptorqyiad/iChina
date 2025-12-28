<?php
/** @var array $data */

$contactsClasses = [
    'contacts',
    $data['className'] ?? ''
];

$email = Simflex\Core\Core::siteParam('email');
$phone = Simflex\Core\Core::siteParam('phone');
$address = Simflex\Core\Core::siteParam('address');
$workhours = Simflex\Core\Core::siteParam('workhours');
$tg = Simflex\Core\Core::siteParam('tg');
$wt = Simflex\Core\Core::siteParam('whats_app');

?>

<section class="<?= implode(' ', $contactsClasses) ?>" <?= buildAttrs($data['attributes'] ?? []) ?> id="contacts">
    <div class="contacts__container container">
        <?php
            App\Layout\Components\Cards\TitleCard\Layout::drawTitleCard(
                title: $data['title'] ?? '',
                desc: $data['desc'] ?? '',
            );
        ?>

        <div class="contacts__wrap">
            <div class="contacts__info">
                <div class="contacts__info-row">
                    <h5 class="contacts__info-row--label">Телефон:</h5>

                    <?php if ($phone): ?>
                        <div class="contacts__info-row--container">
                            <?php
                            App\Layout\Components\UI\Core\Buttons\ButtonContact\Layout::drawButtonContact(
                                className: 'contacts__info-row--phone',
                                text: '{phone}',
                                link: 'tel:{phone}',
                                style: App\Layout\Components\UI\Core\Buttons\ButtonContact\ButtonContactStyle::Monochrome,
                                size: App\Layout\Components\UI\Core\Buttons\ButtonContact\ButtonContactSize::Small,
                            );
                            ?>
                        </div>
                    <?php endif; ?>
                </div>
                <?php
                    App\Layout\Components\UI\Core\Separator\Layout::drawSeparator(
                        className: 'contacts__separator'
                    );
                ?>
                <div class="contacts__info-row">
                    <h5 class="contacts__info-row--label">Почта:</h5>

                    <?php if ($email): ?>
                        <div class="contacts__info-row--container">
                            <?php App\Layout\Components\UI\Core\Buttons\ButtonContact\Layout::drawButtonContact(
                                className: 'contacts__info-row--button',
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
                        className: 'contacts__separator'
                    );
                ?>
                <div class="contacts__info-row">
                    <h5 class="contacts__info-row--label">График работы:</h5>

                    <div class="contacts__info-row--container">
                        <?php if ($workhours): ?>
                            <p class="contacts__info-row--text-lh">
                                <?= '{workhours}' ?>
                            </p>
                        <?php endif; ?>
                    </div>
                </div>
                <?php
                    App\Layout\Components\UI\Core\Separator\Layout::drawSeparator(
                        className: 'contacts__separator'
                    );
                ?>

                <div class="contacts__info-row">
                    <h5 class="contacts__info-row--label">Адрес главного офиса:</h5>

                    <div class="contacts__info-row--container">
                        <?php if ($address): ?>
                            <p class="contacts__info-row--text-lh"><?='{address}'?></p>
                        <?php endif; ?>
                    </div>
                </div>

                <?php App\Layout\Components\UI\Core\Separator\Layout::drawSeparator(
                        className: 'contacts__separator'
                ); ?>

                <?php if ($tg || $wt): ?>
                    <div class="contacts__info-row contacts__info-row--social">
                        <h5 class="contacts__info-row--label">Соц.сети и мессенджеры:</h5>

                    <div class="contacts__info-social">
                        <?php
                        if ($wt) {
                            App\Layout\Components\UI\Core\Buttons\ButtonSocial\Layout::drawButtonSocial(
                                className: 'contacts__button-social',
                                link: $wt,
                                type: \App\Layout\Components\UI\Core\Buttons\ButtonSocial\ButtonSocialType::WhatsApp
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
                <?php endif; ?>
                </div>
            </div>

            <div class="contacts__map">
                <script type="text/javascript"
                        charset="utf-8"
                        async
                        src="https://api-maps.yandex.ru/services/constructor/1.0/js/?um=constructor%3A62261dc0d04e1464d22f7b773ff6e3971932c95790cfdcaf30723afdfcc059a6&amp;width=100%25&amp;height=100%&amp;lang=ru_RU&amp;scroll=true">
                </script>
            </div>
        </div>
    </div>
</section>