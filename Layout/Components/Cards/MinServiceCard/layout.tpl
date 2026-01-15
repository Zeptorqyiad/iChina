<?php
/** @var $data array */

?>

<a href="<?= $data['link'] ?>" class="min-service-card">
    <div class="min-service-card__top">
        <?php if ($data['title']): ?>
            <h6 class="min-service-card__top--title uppercase">
                <?= $data['title'] ?>
            </h6>
        <?php endif; ?>

        <?= renderIcon('arrow-up-right', 'badge__icon') ?>
    </div>
    <div class="min-service-card__text">
        <?= $data['text'] ?>
    </div>
</a>