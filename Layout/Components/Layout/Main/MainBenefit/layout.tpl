<?php
/** @var array $data */

$tg = Simflex\Core\Core::siteParam('tg');
$vk = Simflex\Core\Core::siteParam('vk');
$wt = Simflex\Core\Core::siteParam('whats_app');
?>

<section class="main-benefit">
    <div class="main-benefit__container wrapper">
        <div class="main-benefit__top">
            <?php if ($data['title'] || $data['titleAccent']) {
                App\Layout\Components\Cards\TitleCard\Layout::drawTitleCard(
                    title: $data['title'] ?? '',
                    titleAccent: $data['titleAccent'] ?? '',
                    desc: $data['description'] ?? '',
                );
            } ?>
        </div>

        <?php if (!empty($data['items'])): ?>
        <ul class="main-benefit__items">
            <?php
                $classNames = ['first', 'second', 'third', 'fouth', 'fivth'];

                foreach ($data['items'] as $index => $i):
                    $className = $classNames[$index] ?? '';
                ?>
                <li class="main-benefit__item <?= $className ?>">
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