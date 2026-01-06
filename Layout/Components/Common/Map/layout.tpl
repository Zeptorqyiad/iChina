<?php
/** @var array $data */

?>

<section class="map">
    <div class="map__container container">
        <?php if ($data['main-title'] || $data['main-desc']) {
            App\Layout\Components\Cards\TitleCard\Layout::drawTitleCard(
                title: $data['main-title'] ?? '',
                desc: $data['main-desc'] ?? '',
                separator: true,
            );
        } ?>

        <div class="map-container">
            <div class="map-container__content">
                <div class="map-container__cities">
                    <div class="map-container__cities-title">
                        <?= $data['city-title'] ?>
                    </div>

                    <div class="map-container__cities-wrap">
                        <?php foreach ($data['city-badge'] as $badge) {
                            App\Layout\Components\UI\Core\Badge\Layout::drawBadge(
                                text: $badge['city'],
                                style: App\Layout\Components\UI\Core\Badge\BadgeStyle::Secondary,
                                size: App\Layout\Components\UI\Core\Badge\BadgeSize::Medium
                            );
                        } ?>
                    </div>
                </div>

                <?php App\Layout\Components\UI\Core\Separator\Layout::drawSeparator(
                    className: 'map-container__content-separator'
                ); ?>

                <div class="map-container__countries">
                    <div class="map-container__countries-title">
                        <?= $data['country-title'] ?>
                    </div>

                    <div class="map-container__countries-wrap">
                        <?php foreach ($data['country-badge'] as $badge) {
                            App\Layout\Components\UI\Core\Badge\Layout::drawBadge(
                                text: $badge['country'],
                                style: App\Layout\Components\UI\Core\Badge\BadgeStyle::Secondary,
                                size: App\Layout\Components\UI\Core\Badge\BadgeSize::Medium
                            );
                        } ?>
                    </div>
                </div>
            </div>

            <?php App\Layout\Components\UI\Core\Separator\Layout::drawSeparator(
                className: 'map-container__separator',
            ); ?>

            <div class="map-container__map-section">
                <div class="map-container__padding">
                    <h5 class="map-container__padding-title">
                        <?= $data['addresses-title']?>
                    </h5>

                    <?php
                    App\Layout\Components\UI\Core\Separator\Layout::drawSeparator(
                        className: 'map-container__padding-addresses-separator',
                        theme: App\Layout\Components\UI\Core\Separator\SeparatorTheme::Medium
                    );
                    ?>

                    <div class="map-container__padding-addresses">
                        <?php
                            foreach ($data['addresses'] as $i) {
                                App\Layout\Components\UI\Core\Location\Layout::drawLocation(
                                    className: $i->type,
                                    title: $i->title,
                                    subtitle: $i->address,
                                );
                            }
                        ?>
                    </div>
                </div>

                <?php App\Layout\Components\UI\Core\Separator\Layout::drawSeparator(
                    className: 'map-container__padding-separator',
                ); ?>

                <?php App\Layout\Components\Common\MapSection\Layout::draw([
                    'addresses-desktop' => $data['addresses'],
                    'image' => $data['image'],
                    'image-t' => $data['image-t']
                ]); ?>
            </div>
        </div>

        <?php App\Layout\Components\UI\Core\Separator\Layout::drawSeparator(
            className: 'map__separator',
        ); ?>

        <?php if ($data['card-title'] || $data['card-desc']) {
            App\Layout\Components\Cards\CallbackCard\Layout::drawCallbackCard(
            title: $data['card-title'],
            desc: $data['card-desc'],
        ); } ?>
    </div>
</section>