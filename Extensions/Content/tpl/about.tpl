<?php
/** @var array $content */

use App\Extensions\Reviews\Model\Reviews;
$index = $content->loadFrom('/');

$reviews = Reviews::findAdv()
        ->select('*')
        ->limit(15)
        ->orderBy('npp')
        ->andWhere(['is_active' => 1])
        ->all();

App\Layout\Components\Common\Header\Layout::draw([
    'absolute' => true,
]);
?>

<main>
    <?php
        App\Layout\Components\Layout\Services\BannerService\Layout::draw([
            'image' => $content['params']['about_banner-image'],
            'title' => $content['params']['about_banner-title'],
            'card-title' => $content['params']['about_banner-card-title'],
            'card-text' => $content['params']['about_banner-card-text'],
            'button-text' => $content['params']['about_banner-button-text'],
            'button-link' => $content['params']['about_banner-button-link'],
            'items' => self::getTableFrom('about_banner-items', $content),
            'service_card-title' => $content['params']['about_banner-serv-title'],
            'service_card-text' => $content['params']['about_banner-serv-text'],
            'service_card-link' => $content['params']['about_banner-serv-link'],
        ]);

        App\Layout\Components\Layout\Main\MainAbout\Layout::draw([
            'title' => $content['params']['about_us-title'],
            'title-accent' => $content['params']['about_us-title-accent'],
            'title-third' => $content['params']['about_us-title-third'],
            'mission' => $content['params']['about_us-mission'],
            'title-why' => $cotnent['params']['about_us-title-why'] ?? $index['params']['main-about_title-why'],
            'items-why' => self::getTableFrom('about_us-items-why', $content) ?? self::getTableFrom('main-about_items-why', $index),
            'cardText-why' => $content['params']['about_us-cardText-why'] ?? $index['params']['main-about_cardText-why'],
            'description-why' => $content['params']['about_us-description-why'] ?? $index['params']['main-about_description-why'],
            'callback-title' => $content['params']['about_us-callback-title'] ?? $index['params']['main-about_callback-title'],
            'callback-desc' => $content['params']['about_us-callback-desc'] ?? $index['params']['main-about_callback-desc'],
        ]);

        App\Layout\Components\Layout\About\AboutHistory\Layout::draw([
            'title' => $content['params']['about_history_title'],
            'titleAccent' => $content['params']['about_history_title-accent'],
            'cards' => self::getTableFrom('about_history-cards', $content),
        ]);

        App\Layout\Components\Layout\About\Created\Layout::draw([
            'title' => $content['params']['about_created-title'],
            'titleAccent' => $content['params']['about_created-title-accent'],
            'hello' => $content['params']['about_created-hello'],
            'subhello' => $content['params']['about_created-subhello'],
            'article' => $content['params']['about_created-article'],
            'about-me' => $content['params']['about_created-about-me'],
            'card-text' => $content['params']['about_created-card-text'],
            'bottom-text' => $content['params']['about_created-bottom-text'],
            'image' => $content['params']['about_created-image'],
            'dir-title' => $content['params']['about_created-dir-title'],
            'dir-subtitle' => $content['params']['about_created-dir-subtitle'],
        ]);

        App\Layout\Components\Layout\About\Team\Layout::draw([
            'title' => $content['params']['about_team-title'] ?? 'наша',
            'titleAccent' => $content['params']['about_team-title-accent'] ?? 'команда',
            'items' => self::getTableFrom('about_team-items', $content),
        ]);

        App\Layout\Components\Common\Map\Layout::draw([
            'main-title' => $content['params']['about_map-title'] ?? 'карта присутствия',
            'main-desc' => $content['params']['about_map-desc'] ?? 'Где бы ни находился ваш груз — в порту, на границе или на внутреннем складе, — наши специалисты будут рядом.',
            'city-title' => [],
            'city-badge' => [],
            'country-title' => [],
            'country-badge' => [],
            'image' => '/assets/images/Main/Mapping.png',
            'image-t' => '/assets/images/Main/miniMap.png',
        ]);

        App\Layout\Components\Layout\Main\MainBenefit\Layout::draw([
            'title' => $index['params']['main-benefit_title'] ?? 'Почему бизнес',
            'title-accent' => $index['params']['main-benefit_title-accent'] ?? 'выбирает ICHINA',
            'description' => $index['params']['main-benefits_description'] ?? 'Наш опыт и подход позволяют клиентам быть уверенными в результате',
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

        App\Layout\Components\Common\Categories\Layout::draw([
            'title' => $index['categories-title'] ?? 'товары',
            'desc' => $index['categories-desc'] ?? 'У нас есть опыт перевозки и растаможки любых категорий товаров, в том числе:',
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
            'callback-title' => $index['categories-callback_title'] ?? 'Работаем с любыми видами грузов',
            'callback-desc' => $index['categories-callback-desc'] ?? 'Оставьте заявку, и мы проконсультируем, как сможем вам помочь с его растоможкой',
        ]);

        App\Layout\Components\Sliders\CasesSlider\Layout::draw([
            'title' => 'Наши кейсы',
            'link' => '/cases/',
        ]);

        App\Layout\Components\Common\Stages\Layout::draw([
            'title' => $index['params']['main_stages-title'] ?? 'Этапы взаимодействия',
            'desc' => $index['params']['main_stages-desc'] ?? 'Наша помощь клиентам позволяет им минимизировать риски 
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
            'title' => $index['params']['certificate-title'] ?? 'Разрешительные документы',
            'desc' => $index['params']['certificate-desc'] ?? 'Мы гарантируем надёжность и прозрачность в сфере 
                таможенных перевозок, соблюдая все требования законодательства для вашего спокойствия и доверия',
            'cards-doc' => [
                [
                    'title' => 'Свидетельство',
                    'image' => '/assets/images/Main/certificate.png',
                ],[
                    'title' => 'Свидетельство',
                    'image' => '/assets/images/Main/certificate.png',
                ],
            ],
        ]);

        App\Layout\Components\Sliders\BlogSlider\Layout::draw([
            'title' => 'Другие отзывы',
            'link' => '/reviews/',
            'cards' => $reviews,
        ]);

        App\Layout\Components\Common\Info\Layout::draw([
            'title' => $index['params']['info_title'] ?? 'Информация',
            'desc' => $index['params']['info_desc'] ?? 'Мы стремимся сделать процесс работы максимально понятным 
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
            'title' => $index['params']['partners_title'] ?? 'Партнёры и клиенты',
            'desc' => $index['params']['partners_desc'] ?? 'Небольшой текст-описание для блока Небольшой текст-описание 
            для блока Небольшой текст-описание для блока Небольшой текст-описание для блока ',
            'items' => [
                [
                    'image' => '/assets/images/Main/partners.png'
                ],
            ],
        ]);

        App\Layout\Components\Common\Contacts\Layout::draw([
            'title' => $index['params']['contacts_title'] ?? 'Контакты',
            'desc' => $index['params']['contacts_desc'] ?? '',
        ]);

        App\Layout\Components\Common\FormFeedback\Layout::draw([
            'title' => $index['params']['form-feedback_title'] ?? 'Обратная связь',
            'desc' => $index['params']['form-feedback_desc'] ?? 'Оставьте заявку, чтобы получить консультацию',
        ]);

        App\Layout\Components\Common\Seo\Layout::draw([
            'seo-title' => $content['params']['about_seo_title_1'] ?? 'Тест',
            'seo-desc' => $conten['params']['about_seo_text_1'] ?? 'Тест',
            'seo2-title' => $content['params']['about_seo_title_2'] ?? 'Тест',
            'seo2-desc' => $content['params']['about_seo_text_2'] ?? 'Тест',
        ]);
    ?>
</main>

<?php
    App\Layout\Components\Common\Footer\Layout::draw();
?>