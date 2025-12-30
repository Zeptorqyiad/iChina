<?php
/** @var array $data */

?>

<section class="reviews-content wrapper">
    <div class="reviews-content__container">
        <ul class="reviews-content__list">
            <?php foreach ($data['cards'] as $i): ?>
                <li class="reviews-content__item">
                    <?php App\Layout\Components\Cards\ReviewsCard\Layout::drawReviewsCard(
                        title: $i['name'] ?? '',
                        text: $i['short'] ?? '',
                        badge: $i['date'] ?? '',
                        photo: $i['photo'] ?? '',
                        path: '/reviews/' . $i['alias'] . '/',
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
