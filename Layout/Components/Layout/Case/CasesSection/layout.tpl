<?php
/** @var array $data */

$totalCount = App\Extensions\Cases\Model\CasesCategory::getTotalCount();
$cats = App\Extensions\Cases\Model\CasesCategory::findAdv()->all();
$catMap = [];
$catTypeMap = [];
foreach ($cats as $cat) {
    $catMap[$cat->cc_id] = $cat->name;
    $catTypeMap[$cat->cc_id] = $cat->type ?? '';
}
?>

<section class="cases-section">
    <div class="cases-section__container container">
        <div class="cases-section__categories">

            <?php
            App\Layout\Components\UI\Core\Tab\Layout::drawTab(
                className: !$data['cats'] ? 'active' : '',
                text: 'Все кейсы',
                link: '/cases/',
                badge: $totalCount,
                size: App\Layout\Components\UI\Core\Tab\TabSize::Small
            );

            foreach ($cats as $cat) {
                if (!empty($cat->getCount())) {
                    App\Layout\Components\UI\Core\Tab\Layout::drawTab(
                        className: $data['cats'] == $cat->cc_id  ? 'active' : '',
                        text: $cat->name,
                        link: '/cases/?c=' . $cat->cc_id,
                        badge: $cat->getCount(),
                        size: App\Layout\Components\UI\Core\Tab\TabSize::Small
                    );
                }
            }
            ?>
        </div>

        <div class="cases-section__wrap">
            <?php foreach ($data['items'] as $i): ?>
                <?php App\Layout\Components\Cards\CaseCard\Layout::drawCaseCard(
                    name: $i->name ?? '',
                    short: $i->short ?? '',
                    photo: $i->photo_min ?? '',
                    link: $i->alias . '/',
                    badge: $catMap[$i->cc_id] ?? '',
                    badgeStyle: ($catTypeMap[$i->cc_id] ?? '') === 'blue'
                        ? App\Layout\Components\UI\Core\Badge\BadgeStyle::GradientLight
                        : App\Layout\Components\UI\Core\Badge\BadgeStyle::Gradient,
                ); ?>
            <?php endforeach; ?>
        </div>
        <?php if (!empty($data['pagination']) && (int)($data['pagination']['pages'] ?? 0) > 1) {

            App\Layout\Components\UI\Core\Separator\Layout::drawSeparator();

            App\Layout\Components\UI\Other\Pagination\Layout::draw($data['pagination']);
        } ?>
    </div>
</section>
