<?php
/** @var array $data */

$tg = Simflex\Core\Core::siteParam('tg');
$vk = Simflex\Core\Core::siteParam('vk');
$wt = Simflex\Core\Core::siteParam('whats_app');
?>

<header class="header <?= $data['absolute'] ? 'absolute' : 'fixed' ?>">
	<div class="header__container wrapper">
		<div class="header__content ">
			<div class="header__content-ls">
                <?php
                    App\Layout\Components\UI\Core\Buttons\Button\Layout::drawButton(
                        className: 'header__burger',
                        text: 'Услуги',
                        icon: 'menu-3-line',
                        style: App\Layout\Components\UI\Core\Buttons\Button\ButtonStyle::Accent,
                        iconPos: App\Layout\Components\UI\Core\Buttons\Button\ButtonIconPos::Right,
                    )
                ?>
				<div class="header__logo">
                    <img src="/assets/images/Main/Logotype.png" alt="" draggable="false">
                </div>
			</div>
			<div class="header__content-rs">
                <nav class="header__items">
                    <a class="header__items--link" href="/about/">
                        О компании
                    </a>
                    <a class="header__items--link" href="/blog/">
                        Медиа-центр
                    </a>
                    <a class="header__items--link" href="/reviews/">
                        Отзывы
                    </a>
                    <a class="header__items--link" href="/cases/">
                        Кейсы
                    </a>
                    <a class="header__items--link" href="/info/">
                        Информация
                    </a>
                    <a class="header__items--link" href="/contacts/">
                        Контакты
                    </a>
                </nav>

                <div class="header__items-callback">
                    <?php
                    if ($wt) {
                        App\Layout\Components\UI\Core\Buttons\ButtonSocial\Layout::drawButtonSocial(
                            className: 'header__items-callback--social',
                            link: $wt,
                            type: App\Layout\Components\UI\Core\Buttons\ButtonSocial\ButtonSocialType::WhatsApp,
                            size: App\Layout\Components\UI\Core\Buttons\ButtonSocial\ButtonSocialSize::Small,
                            theme: App\Layout\Components\UI\Core\Buttons\ButtonSocial\ButtonSocialTheme::Transparent
                        );
                    }
                    if ($vk) {
                        App\Layout\Components\UI\Core\Buttons\ButtonSocial\Layout::drawButtonSocial(
                            className: 'header__items-callback--social',
                            link: $vk,
                            type: App\Layout\Components\UI\Core\Buttons\ButtonSocial\ButtonSocialType::Vkontakte,
                            size: App\Layout\Components\UI\Core\Buttons\ButtonSocial\ButtonSocialSize::Small,
                            theme: App\Layout\Components\UI\Core\Buttons\ButtonSocial\ButtonSocialTheme::Transparent
                        );
                    }
                    if ($tg) {
                        App\Layout\Components\UI\Core\Buttons\ButtonSocial\Layout::drawButtonSocial(
                            className: 'header__items-callback--social',
                            link: $tg,
                            size: App\Layout\Components\UI\Core\Buttons\ButtonSocial\ButtonSocialSize::Small,
                            theme: App\Layout\Components\UI\Core\Buttons\ButtonSocial\ButtonSocialTheme::Transparent
                        );
                    }


                    App\Layout\Components\UI\Core\Buttons\Button\Layout::drawButton(
                            className: 'header__button',
                            text: 'Связаться',
                            size: \App\Layout\Components\UI\Core\Buttons\Button\ButtonSize::Small,
                    )
                    ?>
                </div>
            </div>
		</div>
	</div>
</header>
