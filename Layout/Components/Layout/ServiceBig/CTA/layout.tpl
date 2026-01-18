<?php
/** @var $data array */

?>

<section class="cta">
    <div class="cta__container container">
        <div class="cta__content">
            <div class="cta__content-ls">
                <?php if ($data['title']): ?>
                    <h3 class="cta__content-ls--title">
                        <?= $data['title'] ?>
                    </h3>
                <?php endif; ?>
                <?php if ($data['subtitle']): ?>
                    <div class="cta__content-ls--subtitle">
                        <?= $data['subtitle'] ?>
                    </div>
                <?php endif; ?>
                <?php if ($data['text']): ?>
                    <div class="cta__content-ls--text">
                        <?= $data['text'] ?>
                    </div>
                <?php endif; ?>

                <div class="cta__content-buttons">
                    <?php
                    App\Layout\Components\UI\Core\Buttons\Button\Layout::drawButton(
                        text: 'Получить консультацию',
                        style: App\Layout\Components\UI\Core\Buttons\Button\ButtonStyle::Accent,
                        attributes: [
                            'onclick' => 'modalManager.open("callback-modal")',
                        ]
                    );
                    App\Layout\Components\UI\Core\Buttons\Button\Layout::drawButton(
                        text: 'Читать подробную инструкцию',
                        link: '/info/',
                        style: App\Layout\Components\UI\Core\Buttons\Button\ButtonStyle::Dark,
                    );
                    ?>
                </div>
            </div>

            <div class="cta__content-rs">
                <?php if ($data['image']): ?>
                    <div class="cta__content-rs--image">
                        <img src="<?= $data['image'] ?>" alt="">
                    </div>
                <?php endif; ?>
            </div>
        </div>
    </div>
</section>
