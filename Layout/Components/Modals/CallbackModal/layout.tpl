<?php
/** @var array $data */

?>

<div id="callback-modal" class="modal callback-modal" role="dialog" aria-modal="true">
    <div class="callback-modal__container">
        <?php App\Layout\Components\UI\Core\Buttons\ButtonClose\Layout::drawButtonClose(
            className: 'callback-modal__button-close',
            attributes: [
                'onclick' => 'modalManager.close("callback-modal")',
            ]
        ); ?>

        <div class="callback-modal__top">
            <h4 class="callback-modal__title">Получить консультацию</h4>
            <p class="callback-modal__desc">
                Опишите задачу — и наш специалист по ВЭД свяжется с вами для бесплатной консультации
            </p>
        </div>

        <?php App\Layout\Components\Common\Form\Layout::draw([
            'className' => 'callback-modal__form'
        ]); ?>
    </div>
</div>