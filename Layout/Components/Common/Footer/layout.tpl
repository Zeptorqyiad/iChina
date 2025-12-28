<?php
/** @var array $data */

$email = Simflex\Core\Core::siteParam('email');
$phone = Simflex\Core\Core::siteParam('phone');
$address = Simflex\Core\Core::siteParam('address');
$workhours = Simflex\Core\Core::siteParam('workhours');
$tg = Simflex\Core\Core::siteParam('tg');
$wt = Simflex\Core\Core::siteParam('whats_app');

$services = [
    [
        'title' => 'Международная доставка',
        'link' => '/',
    ],[
        'title' => 'Доставка грузов из Европы',
        'link' => '/',
    ],[
        'title' => 'Доставка грузов из Китая',
        'link' => '/',
    ],[
        'title' => 'Доставка товара «под ключ»',
        'link' => '/',
    ],[
        'title' => 'Честный знак',
        'link' => '/',
    ],
];
$about = [
    [
        'title' => 'О компании',
        'link' => '/about/',
    ],[
        'title' => 'Медиа-центр',
        'link' => '/media/',
    ],[
        'title' => 'Отзывы',
        'link' => '/reviews/',
    ],[
        'title' => 'Кейсы',
        'link' => '/cases/',
    ],[
        'title' => 'Контакты',
        'link' => '/contacts/',
    ],
];
$info = [
    [
        'title' => 'Частые вопросы',
        'link' => '/faq/',
    ],[
        'title' => 'Глоссарий',
        'link' => '/glossary/',
    ],[
        'title' => 'Гарантии',
        'link' => '/guarantees/',
    ],[
        'title' => 'Политика конфиденциальности',
        'link' => '/policy/',
    ]
];
?>

<footer class="footer">
    <div class="footer__container container">
        <div class="footer__menu">
            <div class="footer__menu--column-container">
                <div class="footer__menu-column">
                    <div class="footer__menu-column--title">
                        Услуги:
                    </div>
                    <div class="footer__menu-column--tab">
                        <?php foreach ($services as $i) {
                            App\Layout\Components\UI\Core\Tab\Layout::drawTab(
                                className: 'footer__menu-column--tab-link',
                                text: $i['title'],
                                link: $i['link'],
                                style: App\Layout\Components\UI\Core\Tab\TabStyle::Flat,
                                size: App\Layout\Components\UI\Core\Tab\TabSize::Small,
                                theme: App\Layout\Components\UI\Core\Tab\TabTheme::Dark
                            );
                        } ?>
                    </div>
                </div>
            </div>

            <div class="footer__menu--column-container">
                <div class="footer__menu-column">
                    <p class="footer__menu-column--title">
                        О нас:
                    </p>
                    <div class="footer__menu-column--tab">
                        <?php foreach ($about as $i) {
                            App\Layout\Components\UI\Core\Tab\Layout::drawTab(
                                className: 'footer__menu-column--tab-link',
                                text: $i['title'],
                                link: $i['link'],
                                style: App\Layout\Components\UI\Core\Tab\TabStyle::Flat,
                                size: App\Layout\Components\UI\Core\Tab\TabSize::Small,
                                theme: App\Layout\Components\UI\Core\Tab\TabTheme::Dark
                            );
                        } ?>
                    </div>
                </div>
            </div>

            <div class="footer__menu--column-container">
                <div class="footer__menu-column">
                    <p class="footer__menu-column--title">
                        Информация:
                    </p>
                    <div class="footer__menu-column--tab">
                        <?php foreach ($info as $i) {
                            App\Layout\Components\UI\Core\Tab\Layout::drawTab(
                                className: 'footer__menu-column--tab-link',
                                text: $i['title'],
                                link: $i['link'],
                                style: App\Layout\Components\UI\Core\Tab\TabStyle::Flat,
                                size: App\Layout\Components\UI\Core\Tab\TabSize::Small,
                                theme: App\Layout\Components\UI\Core\Tab\TabTheme::Dark
                            );
                        } ?>
                    </div>
                </div>
            </div>
        </div>
        <div class="footer__contact-us">
            <div class="footer__contact-us--callback">
                <img class="footer__logo" src="/assets/images/Main/Logotype.png" alt="logo"/>

                <?php App\Layout\Components\UI\Core\Buttons\Button\Layout::drawButton(
                    className: 'footer__button-callback',
                    text: 'Обратная связь',
                    style: App\Layout\Components\UI\Core\Buttons\Button\ButtonStyle::Accent,
                    attributes: [
                        'onclick' => 'modalManager.open("callback-modal");'
                    ]
                );
                ?>
            </div>
            <div class="footer__contact-us--info">
                <?php if ($phone): ?>
                    <div class="footer__contact-us--info-row">
                        <p class="footer__contact-us--info-label">Телефон:</p>
                        <?php
                            App\Layout\Components\UI\Core\Buttons\ButtonContact\Layout::drawButtonContact(
                                className: 'footer__contact-us--button',
                                text: '{phone}',
                                link: 'tel:{phone}',
                                size: App\Layout\Components\UI\Core\Buttons\ButtonContact\ButtonContactSize::Small,
                            );
                        ?>
                    </div>
                <?php endif; ?>

                <?php if ($email): ?>
                    <div class="footer__contact-us--info-row">
                        <p class="footer__contact-us--info-label">Почта:</p>
                        <?php
                        App\Layout\Components\UI\Core\Buttons\ButtonContact\Layout::drawButtonContact(
                            className: 'footer__contact-us--button',
                            text: '{email}',
                            link: 'mailto:{email}',
                            size: App\Layout\Components\UI\Core\Buttons\ButtonContact\ButtonContactSize::Small,
                        );
                        ?>
                    </div>
                <?php endif; ?>

                <?php if ($address): ?>
                    <div class="footer__contact-us--info-row">
                        <p class="footer__contact-us--info-label">Адрес главного офиса:</p>
                        <h5 class="footer__contact-us--info-text"><?='{address}'?></h5>
                    </div>
                <?php endif; ?>

                <?php if ($tg || $wt): ?>
                    <div class="footer__contact-us--info-row contacts__info-row--social">
                        <p class="footer__contact-us--info-label">Соц.сети и мессенджеры:</p>

                        <div class="footer__contact-us--social">
                            <?php
                            if ($wt) {
                                App\Layout\Components\UI\Core\Buttons\ButtonSocial\Layout::drawButtonSocial(
                                    className: 'footer__social-button',
                                    link: $wt,
                                    type: App\Layout\Components\UI\Core\Buttons\ButtonSocial\ButtonSocialType::WhatsApp,
                                    size: App\Layout\Components\UI\Core\Buttons\ButtonSocial\ButtonSocialSize::Small,
                                );
                            }

                            if ($tg) {
                                App\Layout\Components\UI\Core\Buttons\ButtonSocial\Layout::drawButtonSocial(
                                    className: 'footer__social-button',
                                    link: $tg,
                                    size: App\Layout\Components\UI\Core\Buttons\ButtonSocial\ButtonSocialSize::Small,
                                );
                            }
                            ?>
                        </div>
                    </div>
                <?php endif; ?>
            </div>
        </div>
    </div>

    <div class="footer__bottom container">
        <?php
            App\Layout\Components\UI\Core\Separator\Layout::drawSeparator(
                className: 'footer__separator',
            );
        ?>
        <div class="footer__bottom-container">
            <div class="footer__bottom-policy">
                <p class="footer__bottom-policy--copyright">
                    @ ООО «АЙ-ЧАЙНА» 2025
                </p>
            </div>
        </div>
    </div>
</footer>

<div class="modal-overlay" id="modal-overlay" aria-hidden="true"></div>