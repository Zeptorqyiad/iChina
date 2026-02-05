<?php
/** @var array $data */

?>

<section class="route-map">
    <div class="route-map__container container">
        <?php if ($data['title'] || $data['desc']): ?>
            <?php
                App\Layout\Components\Cards\TitleCard\Layout::drawTitleCard(
                    title: $data['title'],
                    titleAccent: $data['title-accent'],
                    desc: $data['desc'],
                );
            ?>
        <?php endif; ?>

        <div class="route-map__list">
            <?php if ($data['items']): ?>
                <?php foreach ($data['items'] as $i): ?>
                    <?php
                        App\Layout\Components\Cards\AccordionCard\Layout::drawAccordionCard(
                            title: $i['title'],
                            provider: $i['provider'],
                            city: $i['city'],
                            city2: $i['city2'],
                            city3: $i['city3'],
                            city4: $i['city4'],
                            transportation: $i['transportation'],
                            transportation2: $i['transportation2'],
                            transportation3: $i['transportation3'],
                            transportation4: $i['transportation4'],
                        );
                    ?>
                <?php endforeach; ?>
            <?php endif; ?>
        </div>

        <div class="route-map__images">
            <img class="route-map__image"
                 src="/uf/images/source/<?= $data['image'] ?>"
                 alt="map">

            <?php foreach ($data['items'] as $i): ?>
                <img class="route-map__image-route"
                     src="<?= $i['imageRoute'] ?>"
                     alt="map"
                     id="air-china-russia"
                >
            <?php endforeach; ?>
        </div>
    </div>
</section>
