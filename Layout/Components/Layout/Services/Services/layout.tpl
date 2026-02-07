<?php
/** @var $data array */
/** @var $content array */

use App\Extensions\Services\Model\ServiceCategory;
use Simflex\Core\DB;

$categoryRows = ServiceCategory::findAdv()
    ->where(['is_active' => 1])
    ->orderBy('npp')
    ->all();

$bigRows = DB::assoc(
    'SELECT p.category_id, b.sb_id, b.name, b.shortly, b.alias, b.icon
     FROM service_p2c_big p
     JOIN service_big b ON b.sb_id = p.sb_id
     WHERE b.is_active = 1
     ORDER BY b.npp, b.sb_id'
);


$smallRows = DB::assoc(
    'SELECT p.category_id, s.sm_id, s.name, s.shortly, s.alias, s.icon
     FROM service_p2c_small p
     JOIN service_small s ON s.sm_id = p.sm_id
     WHERE s.is_active = 1
     ORDER BY s.npp, s.sm_id'
);

$servicesByCategory = [];
foreach ($bigRows as $row) {
    $servicesByCategory[(int)$row['category_id']][] = [
        'text' => $row['name'] ?? '',
        'short' => $row['shortly'] ?? '',
        'icon' => $row['icon'] ?? '',
        'link' => '/' . ($row['alias'] ?? '') . '/',
    ];
}
foreach ($smallRows as $row) {
    $servicesByCategory[(int)$row['category_id']][] = [
        'text' => $row['name'] ?? '',
        'short' => $row['shortly'] ?? '',
        'icon' => $row['icon'] ?? '',
        'link' => '/' . ($row['alias'] ?? '') . '/',
    ];
}

$categories = [];
foreach ($categoryRows as $row) {
    $categoryId = (int)$row['category_id'];
    $categories[] = [
        'cat' => [$row],
        'options' => $servicesByCategory[$categoryId] ?? [],
    ];
}
?>

<section class="services">
    <div class="services__container container">
        <?php App\Layout\Components\Cards\TitleCard\Layout::drawTitleCard(
            title: $data['title'] ?? '',
            desc: $data['description'] ?? '',
        ); ?>

        <ul class="services__steps">
            <?php foreach ($categories as $category): ?>
                <?php if (!empty($category['options']) && !empty($category['cat'])): ?>
                    <li class="services__step">
                        <div class="services__step_ls">
                            <h3 class="services__step_ls--title">
                                <?= !empty($category['cat'][0]['short']) ? $category['cat'][0]['short'] : ($category['cat'][0]['name'] ?? 'Тест') ?>
                            </h3>

                            <div class="services__step_ls--text">
                                <?= $category['cat'][0]['subtitle'] ?? 'Тест' ?>
                            </div>

                            <?php
                            App\Layout\Components\UI\Core\Buttons\Button\Layout::drawButton(
                                text: 'Нужна консультация',
                                size: App\Layout\Components\UI\Core\Buttons\Button\ButtonSize::Small,
                                attributes: [
                                    'onclick' => 'modalManager.open("callback-modal")',
                                ]
                            );
                            ?>
                        </div>

                        <div class="services__step_rs">
                            <?php foreach ($category['options'] as $i) {
                                App\Layout\Components\Cards\ServiceCard\Layout::drawServiceCard(
                                    className: 'service-example-card__link',
                                    title: $i['text'] ?? '',
                                    desc: $i['short'] ?? '',
                                    link: '/services' . $i['link'],
                                    image: !empty($i['icon']) ? '/uf/images/source/' . $i['icon'] : '',
                                    style: App\Layout\Components\Cards\ServiceCard\ServiceCardStyle::Gray,
                                );
                            } ?>
                        </div>
                    </li>
                <?php endif; ?>
            <?php endforeach; ?>
        </ul>
    </div>
</section>
