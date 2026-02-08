<?php
/** @var array $data */

?>

<section class="banner-service wrapper">
    <div class="banner-service__background-image">
        <img src="/uf/images/source/<?= $data['image'] ?>" alt="">
        <div class="banner-service__background-image--mask"></div>
        <img class="banner-service__background-image--vector"
             src="/assets/images/Main/Vector.png"
             alt="" >
    </div>

    <div class="banner-service__container">
        <div class="banner-service__content">
            <?php App\Layout\Components\UI\Core\BreadCrumbs\Layout::draw([
                'serviceColor' => true,
            ]); ?>

            <div class="banner-service__center">
                <div class="banner-service__center-ls">
                    <div class="banner-service__title-block">
                        <?php if ($data['title']): ?>
                            <h1 class="banner-service__title-block--title uppercase">
                                <?= $data['title'] ?>
                            </h1>
                        <?php endif; ?>
                        <?php if ($data['subtitle']): ?>
                            <div class="banner-service__title-block--subtitle">
                                <?= $data['subtitle'] ?>
                            </div>
                        <?php endif; ?>
                    </div>
                    <?php if ($data['description']): ?>
                        <div class="banner-service__description">
                            <?= $data['description'] ?>
                        </div>
                    <?php endif; ?>
                </div>
                <div class="banner-service__center-rs">
                    <?php if ($data['description']): ?>
                        <div class="banner-service__description banner-service__description--mobile">
                            <?= $data['description'] ?>
                        </div>
                    <?php endif; ?>

                    <?php if ($data['card-title'] || $data['card-text']) {
                        App\Layout\Components\Cards\BannerCard\Layout::drawBannerCard(
                            title: $data['card-title'] ?? '',
                            text: $data['card-text'] ?? '',
                            buttonText: $data['button-text'] ?? '',
                            buttonLink: $data['button-link'] ?? '',
                        );
                    } ?>
                </div>
            </div>

            <?php if (!empty($data['items'])): ?>
                <ul class="banner-service__bottom">
                    <?php if ($data['service_card-title']) {
                        App\Layout\Components\Cards\MinServiceCard\Layout::draw([
                            'title' => $data['service_card-title'],
                            'text' => $data['service_card-text'],
                            'link' => $data['service_card-link'],
                        ]);
                    }  ?>

                    <?php foreach ($data['items'] as $i): ?>
                        <li class="banner-service__rullet">
                            <h2 class="banner-service__rullet--title">
                                <?= $i['title'] ?>
                            </h2>
                            <div class="banner-service__rullet--text">
                                <?= $i['text'] ?>
                            </div>
                        </li>
                    <?php endforeach; ?>
                </ul>
            <?php endif; ?>
        </div>
    </div>
</section>

<div class="banner-service__center-rs banner-service__center-rs--mobile">
    <?php if ($data['description']): ?>
        <div class="banner-service__description banner-service__description--mobile">
            <?= $data['description'] ?>
        </div>
    <?php endif; ?>

    <?php if ($data['card-title'] || $data['card-text']) {
        App\Layout\Components\Cards\BannerCard\Layout::drawBannerCard(
                title: $data['card-title'] ?? '',
                text: $data['card-text'] ?? '',
                buttonText: $data['button-text'] ?? '',
                buttonLink: $data['button-link'] ?? '',
        );
    } ?>
</div>