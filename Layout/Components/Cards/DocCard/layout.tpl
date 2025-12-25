<?php
/** @var array $data */

?>

<div class="doc-card <?= $data['className'] ?>">
    <div class="doc-card__wrap">
        <img class="doc-card__image"
             src="<?= $data['image'] ?>"
             alt="<?= $data['title'] ?>"
             draggable="false"
             loading="lazy"
             data-fancybox="<?= $data['groupImages'] ?>"
             data-caption="<?= $data['title'] ?>"
             onerror="this.src=null;this.src='/assets/images/fallback-img.webp'"
        >
        <div class="doc-card__icon">
            <span>
                <svg aria-hidden="true">
                    <use href="/assets/icons/icons.svg#icon-uniq-expand"></use>
                </svg>
            </span>
        </div>
    </div>

    <h5 class="doc-card__title"><?= $data['title'] ?></h5>
</div>