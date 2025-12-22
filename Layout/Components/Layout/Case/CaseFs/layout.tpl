<?php
/** @var array $data */

?>

<section class="case-fs <?= $data['className'] ?>">
    <div class="case-fs__container container">
        <img src="/uf/images/source/<?= $data['image'] ?>"
             alt="image"
             class="case-fs__image"
        >

        <div class="case-fs__wrap">
            <div class="case-fs__wrap-text">
                <?php if ($data['name']): ?>
                    <h1 class="case-fs__wrap-title">
                        <?= $data['name'] ?>
                    </h1>
                <?php endif; ?>

                <?php if ($data['company']): ?>
                    <div class="case-fs__wrap-company">
                        <?= $data['company'] ?>
                    </div>
                <?php endif; ?>
            </div>

            <?php if ($data['short']): ?>
                <div class="case-fs__wrap-desc">
                    <?= $data['short'] ?>
                </div>
            <?php endif; ?>
        </div>

        <?php
            App\Layout\Components\UI\Core\Separator\Layout::drawSeparator();
        ?>
    </div>
</section>
