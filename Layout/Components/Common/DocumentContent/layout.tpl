<?php
/** @var array $data */

?>

<section class="documents-section wrapper">
    <?php App\Layout\Components\Common\PageHeading\Layout::drawPageHeading(
            style: App\Layout\Components\Common\PageHeading\PageHeadingStyle::Secondary
    ); ?>

    <?php if ($data['text']): ?>
        <div class="documents-section--text content">
            <?php foreach ($data['text'] as $i): ?>
                <?= $i['anchor'] ?>
                <?= $i['title'] ?>
                <?= $i['text'] ?>
            <?php endforeach; ?>
        </div>
    <?php endif; ?>
</section>