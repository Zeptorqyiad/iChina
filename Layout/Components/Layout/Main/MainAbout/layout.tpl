<?php
/** @var array $data */

?>

<section class="main-about">
    <div class="main-about__container wrapper">
        <div class="main-about__content">
            <?php if ($data['title']): ?>
                <div class="main-about__title">
                    <h2> <?= $data['title'] ?> </h2>
                    <h2 class="main-about__title--accent">
                        <?= $data['title-accent'] ?>
                    </h2>
                    <h2> <?= $data['title-third'] ?> </h2>
                </div>
            <?php endif; ?>

            <ul class="main-about__items">
                <?php foreach ($data['items'] as $i): ?>
                    <li class="main-about__item <?= $i['className'] ?>" >
                        <?php App\Layout\Components\Cards\ServiceCard\Layout::drawServiceCard(
                            title: $i['title'],
                            desc: $i['desc'],
                            link: $i['link'],
                            image: $i['image'],
                            style: App\Layout\Components\Cards\ServiceCard\ServiceCardStyle::Gray,
                        ); ?>
                    </li>
                <?php endforeach; ?>
            </ul>
        </div>
    </div>
</section>