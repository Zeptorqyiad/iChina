<?php
/** @var array $data */

?>

<section class="post-fs <?= $data['className'] ?>">
    <div class="post-fs__container container">
            <div class="post-fs__media">
                <?php if ($data['imgBig']): ?>
                    <img class="post-fs__image post-fs__image--desktop"
                         src="<?= '/uf/images/source/' . $data['imgBig'] ?>"
                         alt=""
                         loading="lazy"
                    >
                <?php endif; ?>
                <?php if ($data['imgMob']): ?>
                    <img class="post-fs__image post-fs__image--mobile"
                         src="<?= '/uf/images/source/' . $data['img'] ?>"
                         alt=""
                         loading="lazy"
                    >
                <?php endif; ?>
            </div>
        <div class="post-fs__text">
            <h1 class="post-fs__title">
                <?= $data['title'] ?>
            </h1>
            <p class="post-fs__desc">
                <?= $data['description'] ?>
            </p>
        </div>

        <?php
            App\Layout\Components\UI\Core\Separator\Layout::drawSeparator(
                className: 'post-fs__separator'
            );
        ?>
    </div>
</section>