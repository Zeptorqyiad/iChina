<?php
/** @var array $data */

$totalCount = App\Extensions\Blog\Model\BlogCategory::getTotalCount();
$cats = App\Extensions\Blog\Model\BlogCategory::findAdv()->all();

?>

<div class="media-filter <?= $data['className'] ?>">
    <?php
        App\Layout\Components\UI\Core\Tab\Layout::drawTab(
            className: !$data['cats'] ? 'active' : '',
            text: 'Все категории',
            link: '/blog/',
            badge: $totalCount,
            style: App\Layout\Components\UI\Core\Tab\TabStyle::Secondary,
            size: App\Layout\Components\UI\Core\Tab\TabSize::Large,
        );
        foreach ($cats as $cat) {
            if ($cat->getCount() != 0) {
                App\Layout\Components\UI\Core\Tab\Layout::drawTab(
                    className: $data['cats'] == $cat->bc_id  ? 'active' : '',
                    text:  $cat->name,
                    link: '/blog/?c=' . $cat->bc_id,
                    badge: $cat->getCount(),
                    style: App\Layout\Components\UI\Core\Tab\TabStyle::Secondary,
                    size: App\Layout\Components\UI\Core\Tab\TabSize::Large,
                );
            }
        }
    ?>
</div>
