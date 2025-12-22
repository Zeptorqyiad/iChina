<?php
/** @var array $data */

?>

<section class="categories <?= $data['className'] ?>">
    <div class="categories__container container">
        <?php
            App\Layout\Components\Cards\TitleCard\Layout::drawTitleCard(
                title: $data['title'],
                desc: $data['desc'],
                separator: false,
            );
        ?>

        <div class="categories__list">
            <?php
                foreach ($data['cards'] as $c) {
                    App\Layout\Components\Cards\CategoryCard\Layout::drawCategoryCard(
                        title: $c['title'],
                        img: $c['img'],
                    );
                }
            ?>
        </div>

        <?php
            App\Layout\Components\UI\Core\Separator\Layout::drawSeparator(
                className: 'categories__separator',
            );
            App\Layout\Components\Cards\CallbackCard\Layout::drawCallbackCard(
                title: $data['callback-title'],
                desc: $data['callback-desc'],
            );
        ?>
    </div>
</section>