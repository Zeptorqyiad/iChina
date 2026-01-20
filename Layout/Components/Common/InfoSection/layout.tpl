<?php
/** @var array $data */

?>

<section class="info-section">
    <?php App\Layout\Components\Common\NavList\Layout::draw(); ?>

    <div class="info-section__container container ">
        <?php App\Layout\Components\Common\NavSticky\Layout::draw(); ?>

        <?php if ($data['text']): ?>
            <div class="info-section__body content info-container">
                <?php foreach ($data['text'] as $i): ?>
                    <h2>
                        <?= $i['title']?>
                    </h2>
                    <h3>
                        <?= $i['achor']?>
                    </h3>
                    <?= $i['text']?>
                <?php endforeach; ?>
            </div>
        <?php endif; ?>
    </div>
</section>