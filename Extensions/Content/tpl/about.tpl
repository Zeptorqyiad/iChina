<?php
/** @var array $content */

$index = $content->loadFrom('/');

App\Layout\Components\Common\Header\Layout::draw([
    'absolute' => true,
]);
?>

<main>
    <?php
        App\Layout\Components\Layout\Main\MainBanner\Layout::draw();

        App\Layout\Components\Layout\Main\MainAbout\Layout::draw([
            'title' => $index['params']['main-about_title'] ?? 'Проверенный эксперт',
            'title-accent' => $index['params']['main-about_title-accent'] ?? 'по поставкам из китая',
            'title-third' => $index['params']['main-about_title-third'] ?? 'для бизнеса',
            'mission' => $content['params']['about_mission'] ?? '<b>Мы не просто доставляем товары </b> — мы строим надёжный мост между Россией 
            и Китаем, <b> помогая вашему бизнесу расти без границ.</b>',
            'title-why' => $index['params']['main-about_title-why'] ?? 'Почему бизнесу удобно и 
                выгодно с ICHINA?',
            'items-why' => [
                [
                    'text' => 'Работаем под ключ: от поиска до отгрузки на ваш склад'
                ],[
                    'text' => 'Официальное таможенное оформление: выпуск ДТ, сертификация и сопровождение'
                ],[
                    'text' => 'Параллельный импорт и полный пакет документов для B2B-сделок и тендеров'
                ],[
                    'text' => 'Уникальный алгоритм поиска: находим фабрики выпускающие продукцию 
                        даже для международных брендов'
                ],[
                    'text' => 'Оптимальные логистические маршруты: сокращаем сроки и ваши расходы 
                        на доставку'
                ],[
                    'text' => 'Собственная платёжная инфраструктура: безопасные переводы напрямую в КНР'
                ]
            ],
            'cardText-why' => $index['params']['main-about_cardText-why'] ?? 'Мы не просто доставляем товары — мы строим надёжный мост между Россией и Китаем, 
                помогая вашему бизнесу расти без границ.',
            'description-why' => $index['params']['main-about_description-why'] ?? 'Каждый проект ICHINA проходит без задержек и рисков. Мы организуем поставки 
                из Китая для бизнеса любого масштаба — от первых тестовых партий до крупных контрактов. ',
            'callback-title' => $index['params']['main-about_callback-title'] ?? 'Персональный расчёт импорта в 2 клика!',
            'callback-desc' => $index['params']['main-about_callback-desc'] ?? 'Ответьте на несколько вопросов, и мы предложим самые выгодные условия',
        ]);

        App\Layout\Components\Layout\About\AboutHistory\Layout::draw([
            'title' => $content['params']['about_path_title'] ?? 'История ICHINA',
            'cards' => [
                [
                    'title' => '2024',
                    'descRowFirst' => 'Создание компании',
                    'descRowSecond' => 'Создание компании',
                    'descRowThird' => 'Создание компании',
                ],[
                    'title' => '2024',
                    'descRowFirst' => 'Создание компании',
                    'descRowSecond' => 'Создание компании',
                    'descRowThird' => 'Создание компании',
                ],[
                    'title' => '2024',
                    'descRowFirst' => 'Создание компании',
                    'descRowSecond' => 'Создание компании',
                    'descRowThird' => 'Создание компании',
                ],
            ],
        ]);
    ?>
</main>
