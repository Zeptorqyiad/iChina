<?php
/** @var array $data */

?>

<section class="info" <?= $data['className'] ?>>
    <div class="info__container container">
        <?php
            App\Layout\Components\Cards\TitleCard\Layout::drawTitleCard(
                title: $data['title'],
                desc: $data['desc'],
                separator: true,
            );
        ?>

        <div class="info__list">
            <?php foreach ($data['cards'] as $i) {
                App\Layout\Components\Cards\CategoryCard\Layout::drawCategoryCard(
                    link: $i['link'],
                    title: $i['title'],
                    img: $i['img'],
                );
            } ?>
        </div>
    </div>
</section>