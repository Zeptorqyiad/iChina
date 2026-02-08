<?php
/** @var $data array */

?>

<?php if ($data['seo-title'] || $data['seo-desc'] || $data['seo2-title'] || $data['seo2-desc']): ?>
    <section class="seo">
        <div class="seo__container container">
            <div class="seo__wrap">
                <h3 class="seo__title"><?= $data['seo-title'] ?></h3>
                <div class="seo__desc"><?= $data['seo-desc'] ?></div>
            </div>
            <div class="seo__wrap">
                <h3 class="seo__title"><?= $data['seo2-title'] ?></h3>
                <div class="seo__desc"><?= $data['seo2-desc'] ?></div>
            </div>
        </div>
    </section>
<?php endif; ?>
