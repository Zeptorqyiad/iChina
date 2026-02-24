<?php

$q = App\Extensions\Blog\Model\Blog::findAdv()->where(['is_active' => 1]);
$c = $_REQUEST['c'] ?? 0;
if ($c) {
    $q->andWhere(['bc_id' => $c]);
}
?>

<div id="categories-modal" class="modal-tablet categories-modal" role="dialog" aria-modal="true">
    <div class="categories-modal__container">
        <div class="categories-modal__top">
            <?php App\Layout\Components\UI\Core\Buttons\ButtonClose\Layout::drawButtonClose(
                className: 'categories-modal__button-close',
                attributes: [
                    'onclick' => 'modalManager.close("categories-modal")',
                ]
            ); ?>
        </div>
        <div class="categories-modal__content">
            <?php
                App\Layout\Components\Layout\Blog\MediaFilter\Layout::draw([
                        'className' => 'media-filter__modal',
                        'cats' => $c,
                    ]
                );
            ?>
        </div>
    </div>
</div>