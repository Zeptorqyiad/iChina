<?php
/** @var array $data */

?>

<section class="team">
    <div class="team__container wrapper">
        <?php App\Layout\Components\Cards\TitleCard\Layout::drawTitleCard(
            title: $data['title'],
            titleAccent: $data['titleAccent'],
        ); ?>

        <ul class="team__content">
            <?php foreach ($data['items'] as $i): ?>
                <li class="team__content-item">
                    <img src="<?= $i['image'] ?>" alt="">
                    <h5 class="team__content-item--title">
                        <?= $i['title'] ?>
                    </h5>
                    <div class="team__content-item--subtitle">
                        <?= $i['subtitle'] ?>
                    </div>
                </li>
            <?php endforeach; ?>
        </ul>
    </div>
</section>