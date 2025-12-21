<?php
/** @var array $data */

$tg = Simflex\Core\Core::siteParam('tg');
$vk = Simflex\Core\Core::siteParam('vk');
$wt = Simflex\Core\Core::siteParam('whats_app');
?>

<section class="main-benefit">
    <div class="main-benefit__container wrapper">
        <div class="main-benefit__top">
            <?php if ($data['title'] || $data['title-accent']): ?>
                <div class="main-benefit__title">
                    <h2> <?= $data['title'] ?> </h2>

                    <h2 class="main-benefit__title--accent">
                        <?= $data['title-accent'] ?>
                    </h2>
                </div>
            <?php endif; ?>

            <?php if ($data['description']): ?>
                <div class="main-benefit__description">
                    <?= $data['description'] ?>
                </div>
            <?php endif; ?>
        </div>

        <?php if (!empty($data['items'])): ?>
        <ul class="main-benefit__items">
            <?php foreach ($data['items'] as $i): ?>
                <li class="main-benefit__item <?= $i['className'] ?>">
                    <?php App\Layout\Components\Cards\BenefitsCard\Layout::drawBenefitsCard(
                        image: $i['image'],
                        title: $i['title'],
                        text: $i['text'],
                        style: App\Layout\Components\Cards\BenefitsCard\BenefitsCardStyle::Gray,
                    ); ?>
                </li>
            <?php endforeach; ?>
        </ul>
        <?php endif; ?>
    </div>
</section>