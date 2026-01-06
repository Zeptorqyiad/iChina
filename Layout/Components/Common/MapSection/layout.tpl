<?php
/** @var array $data */

?>

<div class="map-section">
    <div class="map-section__wrap">
        <img class="map-section__img map-section__img-desktop" src="<?= $data['image'] ?>" draggable="false">
        <img class="map-section__img map-section__img-mobile" src="<?= $data['image-t'] ?> " draggable="false">

        <?php foreach ($data['addresses-desktop'] as $i): ?>
        <div class="map-section__location map-section__location-<?= $i->type ?>" >
            <div class="map-section__location-wrapper map-section__location-wrapper-spb">
                <?php
                    App\Layout\Components\UI\Core\Tooltip\Layout::drawTooltip(
                        className: 'map-section__location-content',
                        title: $i->title,
                        subtitle: $i->address,
                    );
                ?>
            </div>

            <svg class="<?= 'map-section__location-marker map-section__location-marker-' . $i->type ?>"
                 xmlns="http://www.w3.org/2000/svg"
                 width="16"
                 height="16"
                 viewBox="0 0 16 16"
                 fill="none">
                <circle cx="8" cy="8" r="8" fill="currentColor"/>
                <circle cx="8" cy="8" r="3" fill="white"/>
            </svg>
        </div>
        <?php endforeach; ?>
    </div>
</div>

