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
            ]
        ]);
	?>
</main>
