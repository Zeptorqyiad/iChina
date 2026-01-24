<?php
/** @var array $data */

use App\Extensions\Site\Model\Addresses;

$addresses = Addresses::findAdv()
    ->where(['is_active' => 1])
    ->orderBy('npp')
    ->all();

?>

<section class="map">
    <div class="map__container container">
        <?php if ($data['title'] || $data['desc']) {
            App\Layout\Components\Cards\TitleCard\Layout::drawTitleCard(
                title: $data['title'] ?? '',
                desc: $data['desc'] ?? '',
            );
        } ?>

        <div class="map-container">
            <div class="map-container__map-section">
                <div class="map-container__padding">
                    <h5 class="map-container__padding-title">
                        <?= $data['addresses-title']?>
                    </h5>

                    <?php App\Layout\Components\UI\Core\Separator\Layout::drawSeparator(
                        className: 'map-container__padding-addresses-separator',
                        theme: App\Layout\Components\UI\Core\Separator\SeparatorTheme::Medium
                    ); ?>

                    <div class="map-container__padding-addresses">
                        <?php foreach ($addresses as $i) {
                            App\Layout\Components\UI\Core\Location\Layout::drawLocation(
                                className: $i->type,
                                title: $i->title,
                                subtitle: $i->address,
                            );
                        } ?>
                    </div>
                </div>

                <?php App\Layout\Components\UI\Core\Separator\Layout::drawSeparator(
                    className: 'map-container__padding-separator',
                ); ?>

                <?php App\Layout\Components\Common\MapSection\Layout::draw([
                    'addresses-desktop' => $addresses,
                    'image' => $data['image'],
                    'image-t' => $data['image-t']
                ]); ?>
            </div>
        </div>

        <?php if ($data['card-title'] || $data['card-desc']) {
            App\Layout\Components\UI\Core\Separator\Layout::drawSeparator(
                    className: 'map__separator',
            );

            App\Layout\Components\Cards\CallbackCard\Layout::drawCallbackCard(
            title: $data['card-title'],
            desc: $data['card-desc'],
        ); } ?>
    </div>
</section>