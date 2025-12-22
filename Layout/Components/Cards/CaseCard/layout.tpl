<?php
/** @var array $data */

?>

<div class="case-card <?= $data['className'] ?>">
    <a class="case-card__link"
       href="<?= $data['link'] ?>"
       draggable="false"
       aria-label="<?= $data['title'] ?>"
    ></a>

    <div class="case-card__container">
        <div class="case-card__wrap">
            <?php App\Layout\Components\UI\Core\Buttons\Button\Layout::drawButton(
                className: 'case-card__button',
                text: 'Подробнее',
                link: $data['link'],
                icon: 'arrow-right',
                style: \App\Layout\Components\UI\Core\Buttons\Button\ButtonStyle::Gray,
                iconPos: \App\Layout\Components\UI\Core\Buttons\Button\ButtonIconPos::Right,
                attributes: [
                    'draggable' => 'false'
                ]
            ); ?>
        </div>

        <img class="case-card__image"
             src="/uf/images/source/<?= $data['photo'] ?>"
             alt=""
             draggable="false"
             loading="lazy"
        >
    </div>

    <div class="case-card__text">
        <?php if ($data['name']): ?>
            <h3 class="case-card__title">
                <?= $data['name'] ?>
            </h3>
        <?php endif; ?>
        <?php if ($data['short']): ?>
            <div class="case-card__desc">
                <?= $data['short'] ?>
            </div>
        <?php endif; ?>
    </div>
</div>
