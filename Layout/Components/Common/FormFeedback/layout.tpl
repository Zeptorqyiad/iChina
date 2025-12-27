<?php
/** @var array $data */

?>

<section class="form-feedback wrapper">
    <div class="form-feedback__container">
        <div class="form-feedback__content">
            <?php if ($data['title']): ?>
                <h2 class="form-feedback__content--title uppercase">
                    <?= $data['title'] ?>
                </h2>
            <?php endif; ?>
            <?php if ($data['desc']): ?>
                <div class="form-feedback__content--desc">
                    <?= $data['desc'] ?>
                </div>
            <?php endif; ?>

            <?php if ($data['image']): ?>
                <img src="<?= $data['image'] ?>"
                     class="form-feedback__content--image"
                     alt="">
            <?php endif; ?>
        </div>

        <?php
            App\Layout\Components\Common\Form\Layout::draw([
                'className' => 'form-feedback__form',
            ]);
        ?>
    </div>
</section>