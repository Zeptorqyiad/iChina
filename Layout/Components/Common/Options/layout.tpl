<?php
/** @var array $data */

$items = $data['items']['v'] ?? $data['items'] ?? [];
?>

<section class="options">
    <div class="options__container container">
        <?php if ($data['title'] || $data['desc']): ?>
            <?php
                App\Layout\Components\Cards\TitleCard\Layout::drawTitleCard(
                    title: $data['title'] ?? '',
                    titleAccent: $data['titleAccent'] ?? '',
                    desc: $data['desc'] ?? '',
                );
            ?>
        <?php endif; ?>

        <?php if ($items): ?>
            <div class="options__cards">
                <?php foreach ($items as $i):
                    App\Layout\Components\Cards\OptionCard\Layout::drawOptionCard(
                        title: $i['title'] ?? '',
                        image: $i['image'] ?? '',
                        desc: $i['desc'] ?? '',
                        text: $i['text'] ?? '',
                        link: $i['link'] ?? '',
                    );
                ?>
                <?php endforeach; ?>
            </div>
        <?php endif; ?>
    </div>
</section>
