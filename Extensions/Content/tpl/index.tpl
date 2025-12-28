<?php
/** @var array $content */

App\Layout\Components\Common\Header\Layout::draw([
    'absolute' => true,
]);
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

        App\Layout\Components\Layout\Main\MainBenefit\Layout::draw([
            'title' => $content['params']['main-benefit_title'] ?? 'Почему бизнес',
            'title-accent' => $content['params']['main-benefit_title-accent'] ?? 'выбирает ICHINA',
            'description' => $content['params']['main-benefits_description'] ?? 'Наш опыт и подход позволяют клиентам быть уверенными в результате',
            'items' => [
                [
                    'className' => 'first',
                    'image' => '/assets/images/Main/plug.png',
                    'title' => 'Полный штат аудиторов в Китае',
                    'text' => 'Лично выезжаем на фабрики, проводим инспекции, проверяем производство и даём фото/видео отчёты.',
                ],[
                    'className' => 'second',
                    'image' => '/assets/images/Main/plug.png',
                    'title' => 'Свои склады в Китае',
                    'text' => 'У нас есть склады в основных логистических узлах Китая: Иу, Шанхай, Гуанчжоу',
                ],[
                    'className' => 'third',
                    'image' => '/assets/images/Main/plug.png',
                    'title' => 'Договор в РФ и защита сделки',
                    'text' => 'Официальный договор и полный пакет документов для бухгалтерии и тендеров — юридическая защита сделки.',
                ],[
                    'className' => 'fouth',
                    'image' => '/assets/images/Main/plug.png',
                    'title' => 'Официальное юридическое лицо в России и Китае',
                    'text' => 'Соответствие стандартам безопасности и качества. У нас есть лицензия, мы предоставляем все документы',
                ],[
                    'className' => 'fivth',
                    'image' => '/assets/images/Main/plug.png',
                    'title' => 'Своя платёжная инфраструктура',
                    'text' => 'Безопасные переводы напрямую в Китай, оплата без риска блокировки с соблюдением всех требований.',
                ],
            ]
        ]);

        App\Layout\Components\Common\RouteMap\Layout::draw([
            'title' => $content['route-map_title'] ?? 'Наши ',
            'title-accent' => $content['route-map_title-accent'] ?? 'маршруты',
            'desc' => $content['route-map_desc'] ?? 'Наши специалисты помогут вам выбрать оптимальный маршрут, осуществляем таможенное оформление грузов по всей России',
            'items' => [
                [
                    'title' => 'Авиаперевозка: Китай — Россия',
                    'image' => '',
                    'provider' => '',
                    'city' => 'Шанхай',
                    'city2' => '',
                    'city3' => 'Москва',
                    'city4' => '',
                    'transportation' => 'Авиаперевозка',
                    'transportation2' => 'ЖД или автоперевозка',
                    'transportation3' => '',
                    'transportation4' => '',
                ]
            ]
        ]);

        App\Layout\Components\Common\Categories\Layout::draw([
            'title' => $content['categories-title'] ?? 'товары',
            'desc' => $content['categories-desc'] ?? 'У нас есть опыт перевозки и растаможки любых категорий товаров, в том числе:',
            'cards' => [
                [
                    'title' => 'Техническое оснащение',
                    'img' => '/assets/images/Main/icon.png',
                ],[
                    'title' => 'Запчасти',
                    'img' => '/assets/images/Main/icon.png',
                ],[
                    'title' => 'Химия',
                    'img' => '/assets/images/Main/icon.png',
                ],[
                    'title' => 'Электроника и оборудование',
                    'img' => '/assets/images/Main/icon.png',
                ],[
                    'title' => 'Инструменты и крепеж',
                    'img' => '/assets/images/Main/icon.png',
                ],
            ],
            'callback-title' => $content['categories-callback_title'] ?? 'Работаем с любыми видами грузов',
            'callback-desc' => $content['categories-callback-desc'] ?? 'Оставьте заявку, и мы проконсультируем, как сможем вам помочь с его растоможкой',
        ]);

        App\Layout\Components\Sliders\CasesSlider\Layout::draw([
            'title' => 'Наши кейсы',
            'link' => '/cases/',
        ]);

        App\Layout\Components\Common\Stages\Layout::draw([
            'title' => $content['params']['main_stages-title'] ?? 'Этапы взаимодействия',
            'desc' => $content['params']['main_stages-desc'] ?? 'Наша помощь клиентам позволяет им минимизировать риски 
            потери времени и денег при взаимодействии с таможенными органами',
            'cards' => [
                [
                    'title' => 'Консультация',
                    'desc' => 'Готовим документы к таможенному оформлению с момента отправки груза и ведем переговоры с СВХ и перевозчиком',
                ],[
                    'title' => 'Договор',
                    'desc' => 'Подписываем договор, в котором прописываем все условия сотрудничества: перечень работ, стоимость, алгоритм взаимодействия'
                ],[
                    'title' => 'Услуга',
                    'desc' => 'Мы полностью берем на себя всю работу по оформлению необходимой документации, таможенному оформлению или международной логистике за вас'
                ],[
                    'title' => 'Доп. вопросы',
                    'desc' => 'Решаем все дополнительные вопросы, при необходимости — досмотр, корректировка стоимости, экспертиза'
                ],[
                    'title' => 'Оплата',
                    'desc' => 'Вы оплачиваете стоимость услуги в форме постоплаты, в счёт уже входят все таможенные платежи и сборы'
                ],[
                    'title' => 'Поддержка',
                    'desc' => 'Предоставляем консультации по дальнейшим логистическим операциям и документальному сопровождению после оказания услуги',
                    'img' => '/assets/images/Main/key.png',
                ],
            ],
        ]);

        App\Layout\Components\Common\Certificate\Layout::draw([
                'title' => $content['params']['certificate-title'] ?? 'Разрешительные документы',
                'desc' => $content['params']['certificate-desc'] ?? 'Мы гарантируем надёжность и прозрачность в сфере 
                таможенных перевозок, соблюдая все требования законодательства для вашего спокойствия и доверия',
                'cards-doc' => [
                    [
                        'title' => 'Свидетельство',
                        'image' => '/assets/images/Main/plug.png',
                    ],[
                        'title' => 'Свидетельство',
                        'image' => '/assets/images/Main/plug.png',
                    ],
                ],
        ]);

        App\Layout\Components\Common\Info\Layout::draw([
            'title' => $content['params']['info_title'] ?? 'Информация',
            'desc' => $content['params']['info_desc'] ?? 'Мы стремимся сделать процесс работы максимально понятным 
            и комфортным для вас, обеспечивая полную поддержку на каждом этапе сотрудничества',
            'cards' => [
                [
                    'img' => 'assets/images/Main/icon.png',
                    'title' => 'Частые вопросы',
                    'link' => '##'
                ],[
                    'img' => 'assets/images/Main/icon.png',
                    'title' => 'Гарантии',
                    'link' => '##'
                ],[
                    'img' => 'assets/images/Main/icon.png',
                    'title' => 'Глоссарий',
                    'link' => '##'
                ],[
                    'img' => 'assets/images/Main/icon.png',
                    'title' => 'Политика конфиденциальности',
                    'link' => '##'
                ],
            ],
        ]);

        App\Layout\Components\Common\Partners\Layout::draw([
            'title' => $content['params']['partners_title'] ?? 'Партнёры и клиенты',
            'desc' => $content['params']['partners_desc'] ?? 'Небольшой текст-описание для блока Небольшой текст-описание 
            для блока Небольшой текст-описание для блока Небольшой текст-описание для блока ',
            'items' => [
                [
                    'image' => '/assets/images/Main/partners.png'
                ],
            ],
        ]);

        App\Layout\Components\Common\Contacts\Layout::draw([
            'title' => $content['params']['contacts_title'] ?? 'Контакты',
            'desc' => $content['params']['contacts_desc'] ?? '',
        ]);

        App\Layout\Components\Common\FormFeedback\Layout::draw([
            'title' => $content['params']['form-feedback_title'] ?? 'Обратная связь',
            'desc' => $content['params']['form-feedback_desc'] ?? 'Оставьте заявку, чтобы получить консультацию',
//            'image' => $content['params']['form-feedback-img'] ?? '/assets/images/Main/plug.png',
        ]);

        App\Layout\Components\Common\Seo\Layout::draw([
            'seo-title' => $content['params']['seo_title_1'] ?? 'Тест',
            'seo-desc' => $content['params']['seo_text_1'] ?? 'Тест',
            'seo2-title' => $content['params']['seo_title_2'] ?? 'Тест',
            'seo2-desc' => $content['params']['seo_text_2'] ?? 'Тест',
        ]);
	?>
</main>

<?php
    App\Layout\Components\Common\Footer\Layout::draw();
?>
