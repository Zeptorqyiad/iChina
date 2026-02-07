<?php
/** @var array $data */

$cases = App\Extensions\Cases\Model\Cases::findAdv()
    ->where(['is_active' => 1])
    ->limit(15)
    ->orderBy('npp desc')
    ->all();

$cats = App\Extensions\Cases\Model\CasesCategory::findAdv()->all();
$catMap = [];
$catTypeMap = [];
foreach ($cats as $cat) {
    $catMap[$cat->cc_id] = $cat->name;
    $catTypeMap[$cat->cc_id] = $cat->type ?? '';
}
?>

<section class="cases-slider js--cases-slider <?= $data['className'] ?>">

    <?php if ($data['title']): ?>
        <h2 class="section-title cases-slider__title title wrapper">
            <?= $data['title'] ?>
        </h2>
    <?php endif; ?>

    <div class="cases-slider__buttons wrapper">
        <?php if ($data['link']) {
            App\Layout\Components\UI\Core\Buttons\Button\Layout::drawButton(
                className: 'cases-slider__button-link',
                text: 'Показать все',
                link: $data['link'],
                style: App\Layout\Components\UI\Core\Buttons\Button\ButtonStyle::Gray,
            );
        }
        App\Layout\Components\UI\Core\Buttons\Button\Layout::drawButton(
            className: 'cases-slider__button-prev',
            icon: 'arrow-left',
            style: App\Layout\Components\UI\Core\Buttons\Button\ButtonStyle::Outline,
        );
        App\Layout\Components\UI\Core\Buttons\Button\Layout::drawButton(
            className: 'cases-slider__button-next',
            icon: 'arrow-right',
            style: App\Layout\Components\UI\Core\Buttons\Button\ButtonStyle::Outline,
        );
        ?>
    </div>

    <div class="cases-slider__slider-wrap">
        <div class="cases-slider__slider js--cases-slider__slider swiper">
            <div class="swiper-wrapper">
                <?php foreach ($cases as $i) {
                    App\Layout\Components\Cards\CaseCard\Layout::drawCaseCard(
                        className: 'swiper-slide',
                        name: $i->name ?? '',
                        short: $i->short ?? '',
                        photo: $i->photo_min ?? '',
                        link: '/cases/' . $i->alias . '/',
                        badge: $catMap[$i->cc_id] ?? '',
                        badgeStyle: ($catTypeMap[$i->cc_id] ?? '') === 'blue'
                                ? App\Layout\Components\UI\Core\Badge\BadgeStyle::GradientLight
                                : App\Layout\Components\UI\Core\Badge\BadgeStyle::Gradient,
                    );
                } ?>
            </div>
        </div>
    </div>
</section>
