<?php
/** @var array $data */

use Simflex\Core\DB;

$totalItems = 11;
$bigTarget = (int)ceil($totalItems / 2);
$smallTarget = $totalItems - $bigTarget;

$bigAll = DB::assoc(
    'SELECT sb_id, name, alias, icon FROM service_big WHERE is_active = 1 ORDER BY npp, sb_id LIMIT ' . (int)$totalItems
);
$smallAll = DB::assoc(
    'SELECT sm_id, name, alias, icon FROM service_small WHERE is_active = 1 ORDER BY npp, sm_id LIMIT ' . (int)$totalItems
);

$bigCount = min($bigTarget, count($bigAll));
$smallCount = min($smallTarget, count($smallAll));
$remaining = $totalItems - ($bigCount + $smallCount);

if ($remaining > 0) {
    $bigExtra = min($remaining, count($bigAll) - $bigCount);
    $bigCount += $bigExtra;
    $remaining -= $bigExtra;
}
if ($remaining > 0) {
    $smallExtra = min($remaining, count($smallAll) - $smallCount);
    $smallCount += $smallExtra;
}

$bigUsed = array_slice($bigAll, 0, $bigCount);
$smallUsed = array_slice($smallAll, 0, $smallCount);

$services = [];
$maxLoops = $bigCount + $smallCount;
for ($i = 0; $i < $maxLoops; $i++) {
    if (!empty($bigUsed)) {
        $row = array_shift($bigUsed);
        $services[] = [
            'name' => $row['name'] ?? '',
            'alias' => $row['alias'] ?? '',
            'icon' => $row['icon'] ?? '',
        ];
    }
    if (!empty($smallUsed)) {
        $row = array_shift($smallUsed);
        $services[] = [
            'name' => $row['name'] ?? '',
            'alias' => $row['alias'] ?? '',
            'icon' => $row['icon'] ?? '',
        ];
    }
}

$services = array_slice($services, 0, $totalItems);
$columns = array_chunk($services, 3);
$defaultImage = '/assets/images/placeholders/fallback-img.webp';
?>

<div id="service-modal" class="modal service-modal wrapper" role="dialog" aria-modal="true">
    <ul class="service-modal__content">
        <?php foreach ($columns as $colIndex => $column): ?>
            <li class="service-modal__item">
                <?php foreach ($column as $service): ?>
                    <a class="service-modal__item--link" draggable="false" href="/services/<?= $service['alias'] ?>/">
                        <img src="<?= $service['icon'] ? ('/uf/images/source/' . $service['icon']) : $defaultImage ?>" alt="">
                        <?= $service['name'] ?>
                    </a>
                <?php endforeach; ?>

                <?php if ($colIndex === count($columns) - 1): ?>
                    <?php App\Layout\Components\UI\Core\Buttons\Button\Layout::drawButton(
                        className: 'service-modal__item--btn',
                        text: 'Смотреть все',
                        link: '/services/',
                        style: App\Layout\Components\UI\Core\Buttons\Button\ButtonStyle::Secondary,
                        size: App\Layout\Components\UI\Core\Buttons\Button\ButtonSize::Large,
                    ); ?>
                <?php endif; ?>
            </li>
        <?php endforeach; ?>
    </ul>
</div>
