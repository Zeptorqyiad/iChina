<?php
/** @var array $data */

$cats = App\Extensions\Reviews\Model\ReviewsCategory::findAdv()->all();
$catMap = [];
foreach ($cats as $cat) {
    $catMap[$cat->rev_id] = $cat->name;
}
?>

<section class="reviews-content wrapper">
    <div class="reviews-content__container">
        <ul class="reviews-content__list">
            <?php foreach ($data['cards'] as $i): ?>
                <li class="reviews-content__item">
                    <?php App\Layout\Components\Cards\ReviewsCard\Layout::drawReviewsCard(
                        title: $i['name'] ?? '',
                        text: $i['short'] ?? '',
                        date: $i['date'] ?? '',
                        category: $catMap[$i['rev_id']] ?? '',
                        photo: $i['photo'] ?? '',
                        video: $i['video'] ?? '',
                        video_v: $i['video_vertical'] ?? '',
                        path: '/reviews/' . $i['alias'] . '/',
                        is_active_button: (int) ($i['is_active_button'] ?? 0),
                    ); ?>
                </li>
            <?php endforeach; ?>
        </ul>

        <?php
        App\Layout\Components\UI\Core\Separator\Layout::drawSeparator();
        ?>

        <?php
//           App\Layout\Components\UI\Other\Pagination\Layout::draw();
        ?>
    </div>
</section>
