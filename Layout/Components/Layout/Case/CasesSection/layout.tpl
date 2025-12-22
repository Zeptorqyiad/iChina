<?php
/** @var array $data */

?>

<section class="cases-section">
    <div class="cases-section__container container">
        <div class="cases-section__wrap">
            <?php foreach ($data['items'] as $i): ?>
                <?php
                    App\Layout\Components\Cards\CaseCard\Layout::drawCaseCard(
                        name: $i->name ?? '',
                        short: $i->short ?? '',
                        photo: $i->photo_min ?? '',
                        link: $i->alias . '/',
                    );
                ?>
            <?php endforeach; ?>
        </div>
        <?php
//        App\Layout\Components\UI\Other\Pagination\Layout::draw();
        ?>
    </div>
</section>
<div class="container">
    <?php
        App\Layout\Components\UI\Core\Separator\Layout::drawSeparator();
    ?>
</div>
