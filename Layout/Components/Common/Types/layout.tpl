<?php
/** @var $data array */

?>

<section class="types">
    <div class="types__container container">
        <?php if ($data['title'] || $data['desc']) {
            App\Layout\Components\Cards\TitleCard\Layout::drawTitleCard(
                title: $data['title'] ?? '',
                desc: $data['desc'] ?? '',
            );
        } ?>

        <div class="types__cards">
            <?php if ($data['badge']): ?>
                <?php foreach ($data['badge'] as $i): ?>
                    <?php App\Layout\Components\Cards\BadgeCard\Layout::drawBadgeCard(
                        text: $i['text'] ?? '',
                        image: $i['image'] ?? '',
                        desc: $i['desc'] ?? '',
                    ); ?>
                <?php endforeach; ?>
            <?php endif; ?>
        </div>

        <?php if ($data['image'] ?? $data['image-t']): ?>
            <?php App\Layout\Components\UI\Core\Separator\Layout::drawSeparator(
                className: 'types__separator'
            ); ?>

            <div class="types__scheme">
                <img src="/uf/images/source/<?= $data['image'] ?>" alt="scheme" class="types__scheme-image">
                <img src="/uf/images/source/<?= $data['image-t'] ?>" alt="scheme" class="types__scheme-image-t">
            </div>
        <?php endif; ?>

        <?php if ($data['image-guarantee']): ?>
            <?php App\Layout\Components\UI\Core\Separator\Layout::drawSeparator(
                className: 'types__separator'
            ); ?>

            <div class="types__guarantee">
                <img src="/uf/images/source/<?= $data['image-guarantee'] ?>" alt="guarantee" class="types__guarantee-image">

                <?php App\Layout\Components\Cards\AccentCard\Layout::drawAccentCard(
                    text: $data['card-text'] ?? '',
                    icon: $data['card-image'] ?? '',
                    desc: $data['card-desc'] ?? '',
                ); ?>
            </div>
        <?php endif; ?>
    </div>
</section>
