<?php
/** @var array $data */
use App\Extensions\Site\Model\MainSlider;

$slider = MainSlider::findAdv()->where(['is_active' => 1])->all();

?>

<section class="banner">
    <div class="banner__content">
        <div class="banner__slider">
            <div class="swiper-wrapper">
                <?php foreach ($slider as $i): ?>
                    <div class="banner__slide swiper-slide">
                        <div class="banner__slide-image">
                            <img src="/uf/images/source/<?= $i['image'] ?>" alt="" draggable="false">
                            <div class="banner__slide-image--mask"></div>
                        </div>

                        <div class="banner__wrap wrapper">
                            <div class="banner__wrap-ls banner-grid-info">
                                <?php if ($i['title']): ?>
                                    <h1 class="banner__wrap-ls--title uppercase">
                                        <?= $i['title'] ?>
                                    </h1>
                                <?php endif; ?>
                                <?php if ($i['subtitle']): ?>
                                    <div class="banner__wrap-ls--text">
                                        <?= $i['subtitle'] ?>
                                    </div>
                                <?php endif; ?>
                            </div>
                            <div class="banner__wrap-rs banner-grid-card">
                                <?php if ($i['cardTitle'] || $i['cardText']) {
                                    App\Layout\Components\Cards\BannerCard\Layout::drawBannerCard(
                                        title: $i['cardTitle'] ?? '',
                                        text: $i['cardText'] ?? '',
                                        buttonText: $i['buttonText'] ?? '',
                                        buttonLink: $i['buttonLink'] ?? '',
                                    );
                                } ?>
                            </div>
                            <div class="banner__wrap-bottom banner-grid-bottom">
                                <?php if ($i['serviceCardTitle'] || $i['serviceCardText'] || $i['serviceCardLink']) {
                                    App\Layout\Components\Cards\MinServiceCard\Layout::draw([
                                        'title' => $i['serviceCardTitle'] ?? '',
                                        'text' => $i['serviceCardText'] ?? '',
                                        'link' => $i['serviceCardLink'] ?? '',
                                    ]);
                                } ?>

                                <?php
                                $bullets = json_decode($i['bullets'], true);
                                $bulletsList = isset($bullets['v']) && is_array($bullets['v']) ? $bullets['v'] : [];
                                ?>

                                <ul class="banner__numbers">
                                    <?php foreach ($bulletsList as $b): ?>
                                        <li class="banner__numbers-item">
                                            <h2 class="banner__numbers-item--title">
                                                <?= $b['title'] ?>
                                            </h2>
                                            <div class="banner__numbers-item--text">
                                                <?= $b['text'] ?>
                                            </div>
                                        </li>
                                    <?php endforeach; ?>
                                </ul>
                            </div>
                        </div>

                        <div class="banner__mobile-wrap wrapper">
                            <?php if ($i['subtitle']): ?>
                                <div class="banner__mobile-wrap--text">
                                    <?= $i['subtitle'] ?>
                                </div>
                            <?php endif; ?>

                            <?php if ($i['serviceCardTitle'] || $i['serviceCardText'] || $i['serviceCardLink']) {
                                App\Layout\Components\Cards\MinServiceCard\Layout::draw([
                                    'title' => $i['serviceCardTitle'] ?? '',
                                    'text' => $i['serviceCardText'] ?? '',
                                    'link' => $i['serviceCardLink'] ?? '',
                                ]);
                            }
                            if ($i['cardTitle'] || $i['cardText'] || $i['cardList']) {
                                App\Layout\Components\Cards\BannerCard\Layout::drawBannerCard(
                                    title: $i['cardTitle'] ?? '',
                                    text: $i['cardText'] ?? '',
                                    buttonText: $i['buttonText'] ?? '',
                                    buttonLink: $i['buttonLink'] ?? '',
                                );
                            } ?>
                        </div>
                    </div>
                <?php endforeach; ?>
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