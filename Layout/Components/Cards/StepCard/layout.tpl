<?php
/** @var array $data */

$stepCardClasses = [
    'step-card',
    "step-card-{$data['style']}",
    $data['className'] ?? ''
];

$stepStyle = $data['stepStyle'] ?? '';
?>

<div class="<?= implode(' ', $stepCardClasses) ?> <?= $stepStyle ?>" data-options='' <?= buildAttrs($data['attributes'] ?? []) ?>>
    <div class="step-card__text">
        <div class="step-card__item">
            <?php
                App\Layout\Components\UI\Core\Marker\Layout::drawMarker(
                    className: 'step-card__marker',
                    img: $data['icon'] ?? '',
                    size: \App\Layout\Components\UI\Core\Marker\MarkerSize::Small,
                );
            ?>
            <h3 class="step-card__title">
                <?= $data['title'] ?>
            </h3>
        </div>

        <div class="step-card__descr">
            <?= $data['descr']?>
        </div>
    </div>

    <?php if ($data['button']): ?>
        <?php App\Layout\Components\UI\Core\Buttons\Button\Layout::drawButton(
            className: 'step-card__button',
            text: $data['button'],
            attributes: [
                'onclick' => 'modalManager.open("callback-modal")',
            ]
        ); ?>
    <?php endif; ?>
</div>