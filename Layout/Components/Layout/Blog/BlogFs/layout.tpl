<?php
/** @var array $data */

?>

<section class="blog-fs">
    <div class="blog-fs__container container">
        <?php
            App\Layout\Components\UI\Core\BreadCrumbs\Layout::draw();
            App\Layout\Components\Common\PageHeading\Layout::drawPageHeading();
        ?>

        <div class="blog-fs__content">
            <?php if ($data['title']): ?>
                <h1 class="blog-fs__title">
                    <?= $data['title'] ?>
                </h1>
            <?php endif; ?>

            <?php if ($data['desc']): ?>
                <div class="blog-fs__desc">
                    <?= $data['desc'] ?>
                </div>
            <?php endif; ?>
        </div>
    </div>
</section>
