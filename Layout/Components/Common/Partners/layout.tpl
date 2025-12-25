<?php
/** @var $data array */

?>

<?php if ($data['items'] || $data['title']): ?>
    <section class="partners">
        <div class="partners__container container">
            <?php
                App\Layout\Components\Cards\TitleCard\Layout::drawTitleCard(
                    title: $data['title'] ?? '',
                    desc: $data['desc'] ?? '',
                    separator: true,
                );
            ?>

            <div class="partners__list ">
                <?php foreach ($data['items'] as $i): ?>
                    <?php
                        App\Layout\Components\Cards\PartnerCard\Layout::draw([
                            'image' => $i['image'],
                        ]);
                    ?>
                <?php endforeach; ?>
            </div>
        </div>
    </section>
<?php endif; ?>