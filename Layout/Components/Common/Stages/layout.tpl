<?php
/** @var array $data */

$serviceCards = $data['cards']['v'] ?? $data['cards'] ?? [];
?>

<section class="stages <?= $data['className'] ?>">
    <div class="stages__container container">
        <?php if ($data['title'] || $data['desc']) {
            App\Layout\Components\Cards\TitleCard\Layout::drawTitleCard(
                title: $data['title'] ?? '',
                desc: $data['desc'] ?? '',
                separator: true,
            );
        } ?>

        <?php if ($data['image'] && $data['offer-title']): ?>
            <div class="stages__steps">
                <?php
                $cards = $serviceCards;
                $img = '';
                $num = '';
                $button = '';

                for ($i = 0; $i < count($cards); $i++) {
                    $img = '';
                    $num = '';
                    $button = '';
                    $style = App\Layout\Components\Cards\StepCard\StepCardStyle::Outline;

                    if ($i === 0) {
                        $button = 'Оставить заявку';
                        $num = '1';
                    } elseif ($i >= 1 && $i <= 8) {
                        $num = (string) ($i + 1);
                    }

                    App\Layout\Components\Cards\StepCard\Layout::drawStepCard(
                        className: 'stages__step',
                        title: $cards[$i]['title'] ?? '',
                        descr: $cards[$i]['desc'] ?? '',
                        icon: $img,
                        number: $num,
                        style: $style,
                        button: $button,
                    );
                }
                ?>
            </div>


            <?php
            App\Layout\Components\UI\Core\Separator\Layout::drawSeparator(
                className: 'service-about__separator'
            );
            ?>

            <div class="stages__banner">
                <img src="<?= $data['image'] ?>" alt="image" class="stages__banner-image">

                <?php App\Layout\Components\Cards\OfferCard\Layout::drawOfferCard(
                    title: $data['offer-title'],
                    desc: $data['offer-desc'] ?? '',
                    price: $data['offer-price'] ?? '',
                    time: $data['offer-time'] ?? '',
                    text: $data['offer-text'] ?? '',
                ); ?>
            </div>
        <?php else: ?>
            <div class="stages__steps">
                <?php
                $cards = $serviceCards;
                $img = '';
                $num = '';
                $button = '';

                for ($i = 0; $i < count($cards); $i++) {
                    $img = '';
                    $num = '';
                    $button = '';
                    $style = App\Layout\Components\Cards\StepCard\StepCardStyle::Outline;

                    if ($i === 0) {
                        $button = 'Оставить заявку';
                        $num = '1';
                    } elseif ($i >= 1 && $i <= 4) {
                        $num = (string) ($i + 1);
                    } elseif ($i === 5) {
                        $img = $cards[$i]['img'] ?? '';
                        $style = App\Layout\Components\Cards\StepCard\StepCardStyle::White;
                    }

                    App\Layout\Components\Cards\StepCard\Layout::drawStepCard(
                        className: 'stages__step',
                        title: $cards[$i]['title'] ?? '',
                        descr: $cards[$i]['desc'] ?? '',
                        icon: $img,
                        number: $num,
                        style: $style,
                        button: $button,
                    );
                }
                ?>
            </div>
        <?php endif; ?>
    </div>
</section>