<?php
/** @var $data array */
/** @var $content array */

//use App\Extensions\Site\Model\ServiceCategory;

//$catVed = ServiceCategory::findAdv()->where(['name' => 'Консультация ВЭД'])->all();
//$catCustom = ServiceCategory::findAdv()->where(['name' => 'Услуги таможенного представителя'])->all();
//$catHelp = ServiceCategory::findAdv()->where(['name' => 'Помощь в оформлении документов'])->all();
//$catInter = ServiceCategory::findAdv()->where(['name' => 'Услуги международного экспедитора'])->all();
//$catFin = ServiceCategory::findAdv()->where(['name' => 'Финансовая логистика'])->all();

//$vedOptions = getServiceOptions('Консультация ВЭД');
//$customOptions = getServiceOptions('Услуги таможенного представителя');
//$helpOptions = getServiceOptions('Помощь в оформлении документов');
//$interOptions = getServiceOptions('Услуги международного экспедитора');
//$finOptions = getServiceOptions('Финансовая логистика');

$categories = [
    [
        'short' => 'Консалтинговые услуги ',
        'subtitle' => 'Полный аутсорсинг ВЭД: поиск и проверка поставщиков в Китае, переговоры, контроль контракта, производства и логистики. 
        Таможенное оформление "под ключ" и доставка до вашего склада. Юридическая и операционная поддержка на всех этапах.'
    ]
];
$vedOptions = [
    [
        'text' => '"Отдел ВЭД" на аутсорсе',
        'short' => 'Аутсорсинг ВЭД под ключ: от поиска поставщика в Китае до доставки на ваш склад.'
    ],[
        'text' => 'ВЭД под ключ',
        'short' => 'Ваш импорт через нас: мы — официальный покупатель в Китае, а вы получаете товар уже в РФ с документами.',
    ]
];
$customOptions = [
    [
        'text' => 'Поиск поставщика и расчет',
        'short' => 'Поиск 5 поставщиков, их проверка по базам, подбор кода ТНВЭД и расчет полной стоимости импорта с пояснениями и рекомендациями.'
    ],[
        'text' => 'Аудит поставщика',
        'short' => 'Выездной аудит на фабрику сотрудниками или агентами компании для физической проверки компании по ТЗ клиента',
    ]
];

$categories = [
    ['cat' => 'Консалтинговые услуги ', 'options' => $vedOptions],
    ['cat' => 'Услуги в Китае ', 'options' => $customOptions],
];
?>

<section class="services">
    <div class="services__container container">
        <?php App\Layout\Components\Cards\TitleCard\Layout::drawTitleCard(
            title: $data['title'] ?? '',
            desc: $data['description'] ?? '',
            separator: true,
        ); ?>

        <ul class="services__steps">
            <?php foreach ($categories as $category): ?>
                <?php if (!empty($category['options']) && !empty($category['cat'])): ?>
                    <li class="services__step">
                        <div class="services__step_ls">
                            <h3 class="services__step_ls--title">
                                <?= !empty($category['cat'][0]['short']) ? $category['cat'][0]['short'] : ($category['cat'][0]['name'] ?? 'Тест') ?>
                            </h3>

                            <div class="services__step_ls--text">
                                <?= $category['cat'][0]['subtitle'] ?? 'Тест' ?>
                            </div>
                        </div>

                        <div class="services__step_rs">
                            <?php foreach ($category['options'] as $option) {
                                App\Layout\Components\Cards\ServiceExampleCard\Layout::drawServiceExampleCard(
                                    className: 'service-example-card__link',
                                    title: $option['text'] ?? '',
                                    text: $option['short'] ?? '',
                                    img: '/uf/images/source/' . $option['icon'] ?? '',
                                    link: '/services' . $option['link'] ?? '',
                                );
                            } ?>
                        </div>
                    </li>

                    <?php
                    App\Layout\Components\UI\Core\Separator\Layout::drawSeparator(
                        className: 'services__separator'
                    );
                    ?>
                <?php endif; ?>
            <?php endforeach; ?>
        </ul>
    </div>
</section>