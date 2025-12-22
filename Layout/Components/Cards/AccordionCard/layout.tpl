<?php
/** @var array $data */

$accordionCardClasses = [
    'accordion-card',
    $data['className'] ?? ''
];
?>

<li class="<?= implode(' ', $accordionCardClasses) ?>" <?= buildAttrs($data['attributes'] ?? []) ?>>
    <div class="accordion-card__header" role="tab">
        <div class="accordion-card__header-wrapper">
            <?php if ($data['icon']): ?>
                <?= renderIcon($data['icon'], 'accordion-card__icon') ?>
            <?php elseif ($data['image']): ?>
                <div class="accordion-card__image" <?= buildAttrs($data['attributes'] ?? []) ?>>
                    <img src="<?= $data['image']?>" alt="image">
                </div>
            <?php endif; ?>

            <div class="accordion-card__text-wrapper">
                <p class="accordion-card__title"><?= $data['title'] ?></p>
            </div>
        </div>

        <div class="accordion-card__controls-wrapper">
            <button type="button" class="accordion-card__button">
                <?= renderIcon('chevron-down', 'accordion-card__chevron') ?>
            </button>
        </div>
    </div>
    <div class="accordion-card__content" role="tabpanel">
        <div class="accordion-card__info">
            <!-- Первым идет "Город поставщика" затем в разном порядке идут "Этапы перевозки" и "Города остановки" от 3 до 5 (Первые "Этапы перевозки" и "Города остановки" обязательны и не требуют проверки) и заканчивается "Городом прибытия" -->

            <!-- "Город поставщика" -->
            <?php if ($data['provider']): ?>
                <div class="accordion-card__info-wrap">
                    <div class="accordion-card__info-item accordion-card__info-item-secondary-bold"><?= $data['provider'] ?></div>

                    <?= renderIcon('arrow-right', 'accordion-card__info-arrow') ?>
                </div>
            <?php endif; ?>

            <!-- Первый "Этап перевозки" -->
            <?php if ($data['transition']): ?>
                <div class="accordion-card__info-wrap">
                    <div class="accordion-card__info-item accordion-card__info-item-primary"><?= $data['transportation1'] ?></div>

                    <?= renderIcon('arrow-right', 'accordion-card__info-arrow') ?>
                </div>
            <?php endif; ?>

            <!-- Первый или последний "Город остановки" -->
            <?php if ($data['city']): ?>
                <div class="accordion-card__info-wrap">
                    <div class="accordion-card__info-item accordion-card__info-item-secondary"><?= $data['city'] ?></div>

                    <?= renderIcon('arrow-right', 'accordion-card__info-arrow') ?>
                </div>
            <?php endif; ?>

            <!-- Дальше либо второй и т.д. "Города остановки", либо еще "Этапы перевозки" -->

            <?php if ($data['city2']): ?>
                <div class="accordion-card__info-wrap">
                    <div class="accordion-card__info-item accordion-card__info-item-secondary"><?= $data['city2'] ?></div>

                    <?= renderIcon('arrow-right', 'accordion-card__info-arrow') ?>
                </div>
            <?php elseif ($data['transportation2']): ?>
                <div class="accordion-card__info-wrap">
                    <div class="accordion-card__info-item accordion-card__info-item-primary"><?= $data['transportation2'] ?></div>

                    <?= renderIcon('arrow-right', 'accordion-card__info-arrow') ?>
                </div>
            <?php endif; ?>

            <?php if ($data['city3']): ?>
                <div class="accordion-card__info-wrap">
                    <div class="accordion-card__info-item accordion-card__info-item-secondary"><?= $data['city3'] ?></div>

                    <?= renderIcon('arrow-right', 'accordion-card__info-arrow') ?>
                </div>
            <?php elseif ($data['transportation3']): ?>
                <div class="accordion-card__info-wrap ">
                    <div class="accordion-card__info-item accordion-card__info-item-primary"><?= $data['transportation3'] ?></div>

                    <?= renderIcon('arrow-right', 'accordion-card__info-arrow') ?>
                </div>
            <?php endif; ?>

            <?php if ($data['city4']): ?>
                <div class="accordion-card__info-wrap">
                    <div class="accordion-card__info-item accordion-card__info-item-secondary"><?= $data['city4'] ?></div>

                    <?= renderIcon('arrow-right', 'accordion-card__info-arrow') ?>
                </div>
            <?php elseif ($data['transportation4']): ?>
                <div class="accordion-card__info-wrap ">
                    <div class="accordion-card__info-item accordion-card__info-item-primary"><?= $data['transportation4'] ?></div>

                    <?= renderIcon('arrow-right', 'accordion-card__info-arrow') ?>
                </div>
            <?php endif; ?>

            <!-- "Город прибытия" -->
            <div class="accordion-card__info-city">Ваш город в России</div>
        </div>
    </div>
</li>
