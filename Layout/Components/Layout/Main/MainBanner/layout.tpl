<?php
/** @var array $data */

?>

<section class="banner">
    <div class="banner__content">
        <div class="banner__slider">
            <div class="swiper-wrapper">
                <div class="banner__slide swiper-slide">
                    <div class="banner__slide-image">
                        <img src="/assets/images/Main/Banner_1.png" alt="" draggable="false">
                        <div class="banner__slide-image--mask"></div>
                    </div>

                    <div class="banner__wrap wrapper">
                        <div class="banner__wrap-ls banner-grid-info">
                            <h1 class="banner__wrap-ls--title uppercase">
                                Импорт из китая — <br /> в руках ICHINA
                            </h1>

                            <div class="banner__wrap-ls--text">
                                Полный цикл услуг по внешнеэкономической деятельности «под ключ».
                                Мы берем на себя всю документацию, логистику, таможенное оформление и
                                валютный контроль, чтобы вы могли сосредоточиться на развитии бизнеса.
                                Минимизируем риски, экономим ваше время и деньги.
                            </div>
                        </div>
                        <div class="banner__wrap-rs banner-grid-card">
                            <?php App\Layout\Components\Cards\BannerCard\Layout::drawBannerCard(
                                title: 'Аутсорсинг ВЭД',
                                list: [
                                    [
                                        'text' => 'Подбор поставщика'
                                    ],[
                                        'text' => 'Оплата в Китай'
                                    ],[
                                        'text' => 'Таможенное сопровождение'
                                    ],[
                                        'text' => 'Логистика'
                                    ],[
                                        'text' => 'Оформление документации'
                                    ],
                                ],
                            ); ?>
                        </div>
                        <div class="banner__wrap-bottom banner-grid-bottom">
                            <?php App\Layout\Components\Cards\MinServiceCard\Layout::draw([
                                'title' => 'Наши услуги',
                                'text' => 'Полный цикл импорта: от китайской фабрики 
                                до вашего склада в России',
                                'link' => '/services/',
                            ]); ?>

                            <ul class="banner__numbers">
                                <?php foreach ($data['items'] as $i): ?>
                                    <li class="banner__numbers-item">
                                        <h2 class="banner__numbers-item--title">
                                            <?= $i['title'] ?>
                                        </h2>
                                        <div class="banner__numbers-item--text">
                                            <?= $i['text'] ?>
                                        </div>
                                    </li>
                                <?php endforeach; ?>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="banner__slide swiper-slide">
                    <div class="banner__slide-image">
                        <img src="/assets/images/Main/Banner_2.png" alt="" draggable="false">
                        <div class="banner__slide-image--mask"></div>
                    </div>

                    <div class="banner__wrap wrapper">
                        <div class="banner__wrap-ls banner-grid-info">
                            <h1 class="banner__wrap-ls--title uppercase">
                                бесплатная консультация
                            </h1>

                            <div class="banner__wrap-ls--text">
                                Полный цикл услуг по внешнеэкономической деятельности «под ключ».
                                Мы берем на себя всю документацию, логистику, таможенное оформление и
                                валютный контроль, чтобы вы могли сосредоточиться на развитии бизнеса.
                                Минимизируем риски, экономим ваше время и деньги.
                            </div>
                        </div>
                        <div class="banner__wrap-rs banner-grid-card">
                            <?php App\Layout\Components\Cards\BannerCard\Layout::drawBannerCard(
                                title: 'Оставьте заявку',
                                text: 'Наш эксперт проанализирует ваши текущие операции (контракты, 
                                логистику, таможенное оформление) и выявит скрытые риски и точки роста. 
                                В подарок вы получите персонализированный чек-лист из 7-10 шагов, как 
                                снизить издержки и ускорить поставки уже в этом месяце.',
                            ); ?>
                        </div>
                        <div class="banner__wrap-bottom banner-grid-bottom">
                            <?php App\Layout\Components\Cards\MinServiceCard\Layout::draw([
                                'title' => 'Наши услуги',
                                'text' => 'Полный цикл импорта: от китайской фабрики 
                                до вашего склада в России',
                                'link' => '/services/',
                            ]); ?>

                            <ul class="banner__numbers">
                                <?php foreach ($data['items'] as $i): ?>
                                    <li class="banner__numbers-item">
                                        <h2 class="banner__numbers-item--title">
                                            <?= $i['title'] ?>
                                        </h2>
                                        <div class="banner__numbers-item--text">
                                            <?= $i['text'] ?>
                                        </div>
                                    </li>
                                <?php endforeach; ?>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="banner__navigation">
            <div class="banner__page">
                <div class="banner__page--current">
                    01
                </div>
                <div class="banner__page--all">
                    /04
                </div>
            </div>
            <div class="banner__buttons">
                <?php
                App\Layout\Components\UI\Core\Buttons\Button\Layout::drawButton(
                    className: 'banner__button-prev',
                    icon: 'chevron-left',
                    style: App\Layout\Components\UI\Core\Buttons\Button\ButtonStyle::Flat,
                    size: App\Layout\Components\UI\Core\Buttons\Button\ButtonSize::ExtraSmall,
                );
                App\Layout\Components\UI\Core\Buttons\Button\Layout::drawButton(
                    className: 'banner__button-next',
                    icon: 'chevron-right',
                    style: App\Layout\Components\UI\Core\Buttons\Button\ButtonStyle::Flat,
                    size: App\Layout\Components\UI\Core\Buttons\Button\ButtonSize::ExtraSmall,
                );
                ?>
            </div>
            <div class="swiper-scrollbar"></div>
        </div>
    </div>
</section>