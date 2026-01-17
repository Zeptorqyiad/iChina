<?php
/** @var array $data */
?>

<section class="info-section">
    <?php App\Layout\Components\Common\NavList\Layout::draw(); ?>

    <div class="info-section__container container ">
        <?php App\Layout\Components\Common\NavSticky\Layout::draw(); ?>

        <?php if ($data['text']): ?>
            <div class="info-section__body info-container">
                <?= $data['text']?>
            </div>
        <?php endif; ?>
    </div>
</section>