<?php
/** @var array $content */

App\Layout\Components\Common\Header\Layout::draw();
?>

<main>
	<?php
        App\Layout\Components\Layout\Main\MainBanner\Layout::draw();

        App\Layout\Components\Layout\Main\MainAbout\Layout::draw([
            'title' => $content['params']['main-about_title'] ?? 'Проверенный эксперт',
            'title-accent' => $content['params']['main-about_title-accent'] ?? 'по поставкам из китая',
            'title-third' => $content['params']['main-about_title-third'] ?? 'для бизнеса',
            'items' => [
                [
                    'className' => 'first',
                    'title' => 'Полный аутсорсинг ВЭД',
                    'desc' => 'Все сложности работы с Китаем решаем за вас — от китайской фабрики до вашего склада',
                    'link' => '##',
                    'image' => '/assets/images/Main/key.png',
                ],[
                    'className' => 'second',
                    'title' => 'Таможенное сопровождение ',
                    'desc' => 'Работаем с разрешительной документацией, чтобы ваши грузы проходили без риска простоев',
                    'link' => '##',
                    'image' => '/assets/images/Main/key.png',
                ],[
                    'className' => 'third',
                    'title' => 'Ведение переговоров',
                    'desc' => 'Мы команда, готовая отстаивать ваши интересы перед китайской стороной на равных',
                    'link' => '##',
                    'image' => '/assets/images/Main/key.png',
                ],[
                    'className' => 'fouth',
                    'title' => 'Подбор поставщика ',
                    'desc' => 'Проверка от ICHINA - безопасный путь к качественному производителю',
                    'link' => '##',
                    'image' => '/assets/images/Main/key.png',
                ],[
                    'className' => 'fivth',
                    'title' => 'Оплата в Китай',
                    'desc' => 'Описание услуги',
                    'link' => '##',
                    'image' => '/assets/images/Main/key.png',
                ]
            ],

            'title-why' => $content['params']['main-about_title-why'] ?? 'Почему бизнесу удобно и 
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
            'cardText-why' => $content['params']['main-about_cardText-why'] ?? 'Мы не просто доставляем товары — мы строим надёжный мост между Россией и Китаем, 
            помогая вашему бизнесу расти без границ.',
            'description-why' => $cotent['params']['main-about_description-why'] ?? 'Каждый проект ICHINA проходит без задержек и рисков. Мы организуем поставки 
            из Китая для бизнеса любого масштаба — от первых тестовых партий до крупных контрактов. ',
            'callback-title' => $cotent['params']['main-about_callback-title'] ?? 'Персональный расчёт импорта в 2 клика!',
            'callback-desc' => $content['params']['main-about_callback-desc'] ?? 'Ответьте на несколько вопросов, и мы предложим самые выгодные условия',
        ]);
	?>
</main>
