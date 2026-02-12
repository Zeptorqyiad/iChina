<?php
/** @var array $data */

?>

<section class="about-history">
    <?php App\Layout\Components\Cards\TitleCard\Layout::drawTitleCard(
        className: 'wrapper',
        title: $data['title'],
        titleAccent: $data['titleAccent'],
    ); ?>

    <div class="about-history__body">
        <div class="about-history__body-wrap">
            <?php
            foreach ($data['cards'] as $index => $card) {
                App\Layout\Components\Cards\YearCard\Layout::drawYearCard(
                    class: 'about-history__card' . ($index == 0 ? ' active' : ''),
                    title: $card['title'] ?? '',
                    descRowFirst: $card['descRowFirst'] ?? '',
                    descRowSecond: $card['descRowSecond'] ?? '',
                    descRowThird: $card['descRowThird'] ?? '',
                );
            }
            ?>
        </div>
    </div>
</section>