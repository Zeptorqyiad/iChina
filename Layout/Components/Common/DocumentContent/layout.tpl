<?php
/** @var array $data */

?>

<section class="documents-section wrapper">
    <?php App\Layout\Components\Common\PageHeading\Layout::drawPageHeading(
            style: App\Layout\Components\Common\PageHeading\PageHeadingStyle::Secondary
    ); ?>

    <div class="documents-section--text content">
        <?= $data['text'] ?>
    </div>
</section>