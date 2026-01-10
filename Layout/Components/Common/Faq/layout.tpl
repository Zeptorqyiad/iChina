<?php
/** @var array $data */

$oddItems = array_filter($data['faq'],  function ($key){
    return $key % 2 === 0;
}, ARRAY_FILTER_USE_KEY);

$evenItems = array_filter($data['faq'],  function ($key){
    return $key % 2 === 1;
}, ARRAY_FILTER_USE_KEY);
?>

<section class="faq">
    <div class="faq__container container">
        <?php
        if ($data['title'] || $data['desc']) {
            App\Layout\Components\Cards\TitleCard\Layout::drawTitleCard(
                title: $data['title'] ?? '',
                desc: $data['desc'] ?? '',
            );
        }
        ?>
        <div class="faq__list">
            <ul class="faq__list-column" role="tablist">
                <?php foreach ($oddItems as $item){
                    App\Layout\Components\UI\Core\Accordion\Layout::drawAccordion(
                        className: 'faq__list-item',
                        title: $item['question'] ?? '',
                        description: $item['answer'] ?? '',
                        size: App\Layout\Components\UI\Core\Accordion\AccordionSize::Medium
                    );
                }
                ?>
            </ul>

            <ul class="faq__list-column" role="tablist">
                <?php foreach ($evenItems as $item){
                    App\Layout\Components\UI\Core\Accordion\Layout::drawAccordion(
                        className: 'faq__list-item',
                        title: $item['question'] ?? '',
                        description: $item['answer'] ?? '',
                        size: App\Layout\Components\UI\Core\Accordion\AccordionSize::Medium
                    );
                }
                ?>
            </ul>
        </div>
    </div>
</section>
