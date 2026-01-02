<?php
/** @var $data array */

$serviceExampleCardClasses = [
    'service-example-card',
    "service-example-card-color_{$data['color']}",
    $data['className'] ?? ''
]
?>

<?php if ($data['link']): ?>
    <a href="<?= $data['link'] ?>"
       class="<?= implode(' ', $serviceExampleCardClasses) ?>"
        <?= buildAttrs($data['attributes'] ?? []) ?>
    >
        <div class="service-example-card__top">
            <svg class="service-example-card__arrow" width="24" height="24" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                <path d="M7.05025 16.9498L16.9497 7.05033M16.9497 7.05033H7.05025M16.9497 7.05033V16.9498" stroke="currentColor" fill="none" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
            </svg>
        </div>

        <div class="service-example-card__bottom">
            <?php if ($data['title']): ?>
                <h5 class="service-example-card__title">
                    <?= $data['title'] ?>
                </h5>
            <?php endif; ?>

            <?php if ($data['text']): ?>
                <div class="service-example-card__text">
                    <?= $data['text'] ?>
                </div>
            <?php endif; ?>
        </div>
    </a>
<?php else: ?>
    <div class="<?= implode(' ', $serviceExampleCardClasses) ?>" <?= buildAttrs($data['attributes'] ?? []) ?>>
        <div class="service-example-card__top">
            <?php
                App\Layout\Components\UI\Core\Marker\Layout::drawMarker(
                    className: 'service-example-card__marker',
                    img: $data['img'] ?? '',
                    size: App\Layout\Components\UI\Core\Marker\MarkerSize::Small
                );
            ?>
        </div>
        <div class="service-example-card__bottom">
            <h5 class="service-example-card__title">
                <?= $data['title'] ?>
            </h5>

            <div class="service-example-card__text">
                <?= $data['text'] ?>
            </div>
        </div>

        <?php
            App\Layout\Components\UI\Core\Buttons\Button\Layout::drawButton(
                className: 'service-example-card__button',
                text: 'Оставить заявку',
                attributes: [
                    'onclick' => 'modalManager.open("callback-modal");'
                ]
            );
        ?>
    </div>
<?php endif; ?>