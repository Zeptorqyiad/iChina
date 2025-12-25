<?php
/** @var array $data */

$email = Simflex\Core\Core::siteParam('email');
$phone = Simflex\Core\Core::siteParam('phone');
$address = Simflex\Core\Core::siteParam('address');
$workhours = Simflex\Core\Core::siteParam('workhours');
$tg = Simflex\Core\Core::siteParam('tg');
$wt = Simflex\Core\Core::siteParam('whats_app');

$customsBrokerage = [
    [
        'title' => 'Таможенное оформление',
        'link' => '/',
    ],[
        'title' => 'Корректировка таможенной стоимости',
        'link' => '/',
    ],[
        'title' => 'Таможенный аудит',
        'link' => '/',
    ],[
        'title' => 'Документы для таможенного оформления',
        'link' => '/',
    ],[
        'title' => 'Разрешительные документы',
        'link' => '/',
    ],[
        'title' => 'Льготы и преференции',
        'link' => '/services/test/',
    ],[
        'title' => 'Сопровождение камеральных проверок',
        'link' => '/',
    ],[
        'title' => 'Взыскание убытков с ФТС',
        'link' => '/',
    ],[
        'title' => 'Классификационные решения',
        'link' => '/',
    ],[
        'title' => 'Подготовка и анализ внешнеторговых договоров',
        'link' => '/',
    ],[
        'title' => 'Административные правонарушения',
        'link' => '/',
    ],
];
$freightForwarding = [
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
$aboutPages = [
    [
        'title' => 'О компании',
        'link' => '/about/',
    ],[
        'title' => 'Наши кейсы',
        'link' => '/cases/',
    ],[
        'title' => 'Медиа-центр',
        'link' => '/blog/',
    ],[
        'title' => 'Отзывы',
        'link' => '/reviews/',
    ],[
        'title' => 'Контакты',
        'link' => '/contacts/',
    ],
];
$forClientPages = [
    [
        'title' => 'Частые вопросы',
        'link' => '/faq/',
    ],[
        'title' => 'Гарантии',
        'link' => '/guarantees/',
    ],[
        'title' => 'Глоссарий',
        'link' => '/glossary/',
    ],
];
?>

<footer class="footer">
    <div class="footer__container container">
        <div class="footer__menu">
            <div class="footer__menu--column-container">
                <?php
                    App\Layout\Components\UI\Core\Tab\Layout::drawTab(
                        className: 'footer__button-link',
                        text: 'Консультация ВЭД',
                        link: '/',
                        size: App\Layout\Components\UI\Core\Tab\TabSize::Small,
                        theme: App\Layout\Components\UI\Core\Tab\TabTheme::Dark
                    );
                ?>
                <div class="footer__menu-column">
                    <a href="/"
                       class="footer__menu-column--title">
                        Услуги таможенного представителя
                    </a>
                    <div class="footer__menu-column--tab">
                        <?php foreach ($customsBrokerage as $i) {
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
                    <a href="/"
                        class="footer__menu-column--title">
                        Услуги международного экспедитора
                    </a>
                    <div class="footer__menu-column--tab">
                        <?php foreach ($freightForwarding as $i) {
                            App\Layout\Components\UI\Core\Tab\Layout::drawTab(
                                className: 'footer__menu-column--tab-link',
                                text: $i['title'],
                                link: $i['link'],
                                style: \App\Layout\Components\UI\Core\Tab\TabStyle::Flat,
                                size: \App\Layout\Components\UI\Core\Tab\TabSize::Small,
                                theme: \App\Layout\Components\UI\Core\Tab\TabTheme::Dark
                            );
                        } ?>
                    </div>
                </div>

                <div class="footer__menu-column">
                    <a href="/"
                       class="footer__menu-column--title">
                        Финансовая логистика
                    </a>
                </div>

                <div class="footer__menu-column">
                    <a href="/services/"
                       class="footer__menu-column--title">
                        Все услуги
                    </a>
                </div>
            </div>

            <div class="footer__menu--column-container">
                <div class="footer__menu-column">
                    <p class="footer__menu-column--title">
                        О нас
                    </p>
                    <div class="footer__menu-column--tab">
                        <?php foreach ($aboutPages as $i) {
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

                <div class="footer__menu-column">
                    <p class="footer__menu-column--title">
                        Для клиентов
                    </p>

                    <div class="footer__menu-column--tab">
                        <?php foreach ($forClientPages as $i) {
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
                                    theme: App\Layout\Components\UI\Core\Buttons\ButtonSocial\ButtonSocialTheme::Dark,
                                );
                            }

                            if ($tg) {
                                App\Layout\Components\UI\Core\Buttons\ButtonSocial\Layout::drawButtonSocial(
                                    className: 'footer__social-button',
                                    link: $tg,
                                    size: App\Layout\Components\UI\Core\Buttons\ButtonSocial\ButtonSocialSize::Small,
                                    theme: App\Layout\Components\UI\Core\Buttons\ButtonSocial\ButtonSocialTheme::Dark,
                                );
                            }
                            ?>
                        </div>
                    </div>
                <?php endif; ?>

                <?php if ($workhours): ?>
                    <div class="footer__contact-us--info-row">
                        <p class="footer__contact-us--info-label">График работы:</p>
                        <h5 class="footer__contact-us--info-text"><?='{workhours}'?></h5>
                    </div>
                <?php endif; ?>

                <?php if ($address): ?>
                    <div class="footer__contact-us--info-row">
                        <p class="footer__contact-us--info-label">Адрес главного офиса:</p>
                        <h5 class="footer__contact-us--info-text"><?='{address}'?></h5>
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
                <div class="footer__bottom-policy--tab-list">
                    <?php
                    App\Layout\Components\UI\Core\Tab\Layout::drawTab(
                        className: 'footer__bottom-policy--tab',
                        text: 'Политика конфиденциальности',
                        link: '/privacy-policy/',
                        style: App\Layout\Components\UI\Core\Tab\TabStyle::Flat,
                        size: App\Layout\Components\UI\Core\Tab\TabSize::ExtraSmall,
                        theme: App\Layout\Components\UI\Core\Tab\TabTheme::Dark
                    );
                    ?>
                </div>
                <p class="footer__bottom-policy--copyright">
                    ООО «ЧИПБОКС», 119530, г. Москва, Очаковское шоссе 34,пом. В203, ИНН 7714439950 КПП 772901001 ОГРН 1197746142923
                </p>
            </div>
            <div class="footer__bottom-dev">

            </div>
        </div>
    </div>
</footer>

<div class="modal-overlay" id="modal-overlay" aria-hidden="true"></div>