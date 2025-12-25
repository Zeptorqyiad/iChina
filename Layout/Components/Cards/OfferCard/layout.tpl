<?php
/** @var $data array */

?>

<div class="offer-card">
    <div class="offer-card__wrap">
        <div class="offer-card__content">
            <?php if ($data['title']): ?>
                <div class="offer-card__content-title">
                    <?= $data['title'] ?>
                </div>
            <?php endif; ?>

            <?php if ($data['desc']): ?>
                <div class="offer-card__content-desc">
                    <?= $data['desc'] ?>
                </div>
            <?php endif; ?>

            <?php if ($data['price'] || $data['time']): ?>
                <div class="offer-card__content-properties">
                    <div class="offer-card__content-property">
                        <?= $data['price'] ?> ₽
                    </div>

                    <?php
                        App\Layout\Components\UI\Core\Separator\Layout::drawSeparator(
                            className: 'offer-card__content-separator',
                            orientation: App\Layout\Components\UI\Core\Separator\SeparatorOrientation::Vertical
                        );
                    ?>

                    <?php if ($data['time']): ?>
                        <div class="offer-card__content-property">
                            <?= $data['time'] ?>
                        </div>
                    <?php endif; ?>
                </div>
            <?php endif; ?>
        </div>

        <?php if ($data['bullits']): ?>
            <div class="offer-card__wrap-bullits">
                <?php
                    App\Layout\Components\Cards\BullitsCard\Layout::drawBullitsCard(
                        bullits: $data['bullits'],
                    );
                ?>
            </div>
        <?php endif; ?>

        <?php if($data['text']){
            App\Layout\Components\UI\Core\Buttons\Button\Layout::drawButton(
                className: 'offer-card__wrap-button',
                text: $data['text'],
                style: App\Layout\Components\UI\Core\Buttons\Button\ButtonStyle::Gray,
                attributes: [
                    'onclick' => 'modalManager.open("callback-modal")',
                ],
            );
        }else{
            App\Layout\Components\UI\Core\Buttons\Button\Layout::drawButton(
                className: 'offer-card__wrap-button',
                text: 'Оставить заявку',
                style: App\Layout\Components\UI\Core\Buttons\Button\ButtonStyle::Gray,
                attributes: [
                    'onclick' => 'modalManager.open("callback-modal")',
                ],
            );
        }

        ?>
    </div>

    <?php if ($data['bullits']): ?>
        <div class="offer-card__bullits">
            <?php
                App\Layout\Components\Cards\BullitsCard\Layout::drawBullitsCard(
                    bullits: $data['bullits'],
                );
            ?>
        </div>
    <?php endif; ?>
</div>