<?php
/** @var array $data */

?>

<section class="info-section">
    <?php App\Layout\Components\Common\NavList\Layout::draw(); ?>

    <div class="info-section__container container ">
        <?php App\Layout\Components\Common\NavSticky\Layout::draw(); ?>

        <div class="info-section__body info-container">
            <?php if ($data['nav-title'] || $data['link']): ?>
                <div class="info-section__anchor">
                    <h4 class="info-section__anchor--title">
                        <?= $data['nav-title'] ?>
                    </h4>
                    <?php foreach ($data['link'] as $i): ?>
                        <a href="#<?= $i['link'] ?>" class="info-section__anchor--link">
                            <?= $i['title'] ?>
                        </a>
                    <?php endforeach; ?>
                </div>
            <?php endif; ?>

            <?php if ($data['text']): ?>
                <div class="content">
                    <?php foreach ($data['text'] as $i): ?>
                        <div class="info-section__content-block" id="<?= $i['anchor'] ?>">
                            <h2>
                                <?= $i['title'] ?>
                            </h2>

                            <?= $i['text'] ?>
                        </div>
                    <?php endforeach; ?>
                </div>
            <?php endif; ?>

            <?php if ($data['is_form_active'] == 1): ?>
                <div class="info-section__form">
                    <div class="info-section__form-top">
                        <h3 class="info-section__form-top--title">
                            Связаться
                        </h3>
                        <div class="info-section__form-top--subtitle">
                            Свяжитесь с нами, чтобы обсудить, как мы можем
                            помочь именно вашему бизнесу.
                        </div>
                    </div>

                    <?php App\Layout\Components\Common\Form\Layout::draw([
                        'className' => 'form-feedback__form',
                    ]); ?>
                </div>
            <?php endif; ?>
        </div>
    </div>
</section>