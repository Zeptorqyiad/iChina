<?php
/** @var array $data */

?>

<section class="case-article <?= $data['className'] ?>">
    <div class="case-article__container info-container">
        <div class="case-article__body content">
            <?= $data['content'] ?>
        </div>

        <div class="case-article__buttons">
            <?php
                App\Layout\Components\UI\Core\Buttons\Button\Layout::drawButton(
                    className: 'case-article__button',
                    text: 'Получить консультацию',
                    attributes: [
                        'onclick' => 'modalManager.open("callback-modal");'
                    ]
                );

                App\Layout\Components\UI\Core\Buttons\Button\Layout::drawButton(
                    className: 'case-article__button',
                    text: 'Назад',
                    icon: 'arrow-left',
                    style: App\Layout\Components\UI\Core\Buttons\Button\ButtonStyle::Secondary,
                    attributes: [
                        'onclick' => "event.preventDefault();history.back();"
                    ]
                );
            ?>
        </div>
    </div>
</section>
