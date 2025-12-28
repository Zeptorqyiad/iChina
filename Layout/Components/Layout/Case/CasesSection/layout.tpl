<?php
/** @var array $data */

$totalCount = App\Extensions\Cases\Model\CasesCategory::getTotalCount();
$cats = App\Extensions\Cases\Model\CasesCategory::findAdv()->all();
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
                App\Layout\Components\UI\Core\Tab\Layout::drawTab(
                    className: $data['cats'] == $cat->cc_id  ? 'active' : '',
                    text: $cat->name,
                    link: '/cases/?c=' . $cat->cc_id,
                    badge: $cat->getCount(),
                    size: App\Layout\Components\UI\Core\Tab\TabSize::Small
                );
            }
            ?>
        </div>

        <div class="cases-section__wrap">
            <?php foreach ($data['items'] as $i): ?>
                <?php
                    App\Layout\Components\Cards\CaseCard\Layout::drawCaseCard(
                        name: $i->name ?? '',
                        short: $i->short ?? '',
                        photo: $i->photo_min ?? '',
                        link: $i->alias . '/',
                    );
                ?>
            <?php endforeach; ?>
        </div>
        <?php
//        App\Layout\Components\UI\Other\Pagination\Layout::draw();
        ?>
    </div>
</section>
<div class="container">
    <?php
        App\Layout\Components\UI\Core\Separator\Layout::drawSeparator();
    ?>
</div>
