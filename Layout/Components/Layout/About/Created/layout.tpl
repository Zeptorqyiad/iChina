<?php
/** @var array $data */

?>

<section class="created">
    <div class="created__container wrapper">
        <?php App\Layout\Components\Cards\TitleCard\Layout::drawTitleCard(
            title: $data['title'],
            titleAccent: $data['titleAccent'],
        ); ?>

        <div class="created__content">
            <div class="created__content-ls">
                <?php if ($data['hello']): ?>
                    <h3 class="created__content-ls--hello">
                        <?= $data['hello'] ?>
                    </h3>
                <?php endif; ?>
                <?php if ($data['subhello']): ?>
                    <div class="created__content-ls--subhello">
                        <?= $data['subhello'] ?>
                    </div>
                <?php endif; ?>
                <?php if ($data['article']): ?>
                    <div class="created__content-ls--article">
                        <?= $data['article'] ?>
                    </div>
                <?php endif; ?>
                <?php if ($data['about-me']): ?>
                    <div class="created__content-ls--about-me">
                        <?= $data['about-me'] ?>
                    </div>
                <?php endif; ?>
                <?php if ($data['card-text']): ?>
                    <div class="created__content-ls--card-text">
                        <?= $data['card-text'] ?>
                    </div>
                <?php endif; ?>
                <?php if ($data['bottom-text']): ?>
                    <div class="created__content-ls--bottom-text">
                        <?= $data['bottom-text'] ?>
                    </div>
                <?php endif; ?>
            </div>
            <div class="created__content-rs">
                <?php if ($data['image']): ?>
                    <div class="created__content-rs--image">
                        <img src="<?= $data['image'] ?>" alt="">
                    </div>
                <?php endif; ?>
                <?php if ($data['dir-title']): ?>
                    <h5 class="created__content-rs--dir-title">
                        <?= $data['dir-title'] ?>
                    </h5>
                <?php endif; ?>
                <?php if ($data['dir-subtitle']): ?>
                    <div class="created__content-rs--dir-subtitle">
                        <?= $data['dir-subtitle'] ?>
                    </div>
                <?php endif; ?>
            </div>
        </div>
    </div>
</section>