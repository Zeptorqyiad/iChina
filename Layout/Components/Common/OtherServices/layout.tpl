<?php
/** @var array $data */

?>

<div class="<?= $data['title'] ? 'other-services' : '' ?>">
    <?php if ($data['title'] || $data['desc']): ?>
        <div class="other-services__top wrapper">
            <?php App\Layout\Components\Cards\TitleCard\Layout::drawTitleCard(
                title: $data['title'],
                titleAccent: $data['titleAccent'],
                desc: $data['desc'],
            ); ?>
        </div>
    <?php endif; ?>

    <ul class="other-services__items <?= $data['title'] ? 'wrapper' : '' ?>">
        <?php foreach ($data['items'] as $i): ?>
            <li class="other-services__item <?= $i['className'] ?>" >
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
