<?php
/** @var array $content */

use App\Extensions\Reviews\Model\Reviews;
use App\Extensions\Blog\Model\Blog;

$post = Blog::findAdv()
        ->limit(10)
        ->andWhere(['is_active' => 1])
        ->orderBy('npp')
        ->all();

$reviews = Reviews::findAdv()
        ->limit(10)
        ->where(['is_active' => 1])
        ->orderBy('npp')
        ->all();

$index = $content->loadFrom('/');

App\Layout\Components\Common\Header\Layout::draw([
	'absolute' => true,
]);
?>

<main>
	<?php
        App\Layout\Components\Layout\Services\BannerService\Layout::draw([
            'title' => $this->service->banner_service_title  ?? 'Финансирование сделок',
            'subtitle' => $this->service->banner_service_subtitle  ?? 'Ваш импорт и экспорт — наша профессиональная забота',
            'description' => $this->service->banner_service_desc ?? 'Полный цикл услуг по внешнеэкономической деятельности «под ключ». 
            Мы берем на себя всю документацию, логистику, таможенное оформление и валютный контроль, чтобы вы могли сосредоточиться на 
            развитии бизнеса. Минимизируем риски, экономим ваше время и деньги.',
            'card-title' => $this->service->banner_card_title ?? 'Расчет <br /> за 24 часа',
            'card-text' => $this->service->banner_card_text ?? 'Оставьте заявку, и наш специалист подготовит для вас 
                индивидуальный расчет и план работ по вашему направлению ВЭД.',
            'items' => [
                    [
                            'title' => '2500+',
                            'text' => 'успешный поставок'
                    ],[
                            'title' => '85 000+',
                            'text' => 'фабрик в базе'
                    ],[
                            'title' => '120+',
                            'text' => 'проверенных поставщиков'
                    ]
            ]
        ]);

        App\Layout\Components\Layout\ServiceBig\ServiceAbout\Layout::draw([
            'title' => $this->service->about_title ?? 'Что такое ',
            'titleAccent' => $this->service->about_title_accent ?? '[услуга]',
            'desc' => $this->service->about_desc ?? 'Ваш удаленный отдел международной торговли',
            'subtitle-left' => $this->service->about_subtitle_left ?? 'Экономичная и безопасная альтернатива собственному отделу ВЭД',
            'desc-left' => $this->service->about_desc_left ?? 'Если сложности таможенного оформления, валютного контроля, подготовки документов и поиска 
            надёжных перевозчиков тормозят ваш рост, аутсорсинг ВЭД — ваше решение. 
            <br />
            <br />
            Мы систематизируем и автоматизируем эти процессы за вас.
            Это не просто услуга, а стратегическое партнёрство. Мы становимся вашим внешним подразделением, которое 
            берет на себя все технические, юридические и административные задачи по работе с зарубежными рынками. 
            <br />
            <br />
            Ваша задача — стратегия и сбыт, наша — безупречное исполнение.
            Сфокусируйте внутренние ресурсы на развитии продукта и продажах, а операционные риски ВЭД доверьте нам.',
            'bullits' => [
                    [
                            'text' => '<b>Экономия до 40%</b>: Никаких затрат на зарплатный фонд, соцвыплаты, программное обеспечение и рабочее место для специалистов.'
                    ],[
                            'text' => '<b>Скорость выхода на рынок</b>: Запуск первой поставки за 2–3 недели, а не за 3–6 месяцев на поиск и адаптацию своего персонала.'
                    ],[
                            'text' => '<b>Контроль без хлопот</b>: Единый персональный менеджер и чёткая отчётность по каждому этапу.'
                    ],[
                            'text' => '<b>Масштабирование без проблем</b>: Увеличивайте или уменьшайте объёмы операций, не меняя штатное расписание.'
                    ]
            ],
            'accent-text' => $this->service->about_accent_text ?? 'Идеальное решение для компаний, которые хотят выйти на международный уровень быстро, безопасно и с прогнозируемым бюджетом.',
            'items' => [
                    [
                            'text' => 'Гарантия 100% легальности и финансовой безопасности',
                            'img' => '/assets/images/Main/icon.png',
                    ],[
                            'text' => 'Ваш личный менеджер ВЭД и цифровая прозрачность 24/7',
                            'img' => '/assets/images/Main/icon.png',
                    ],[
                            'text' => 'Мы знаем нюансы вашей отрасли, а не только общие правила ВЭД',
                            'img' => '/assets/images/Main/icon.png',
                    ],
            ],
            'image' => $this->service->about_image ?? '/assets/images/Main/plug.png',
            'offer-title' => $this->service->about_offer_title ?? 'Стоимость [услуги]',
            'offer-desc' => $this->service->about_offer_desc ?? 'Стоимость доставки может отличаться в зависимости от конкретного случая. Оставьте заявку 
            на расчет, чтобы узнать точную стоимость.',
            'offer-price' => $this->service->about_offer_price ?? 'стоимость',
            'offer-time' => $this->service->about_offer_time ?? 'сроки',
            'offer-text' => $this->service->about_offer_text ?? 'Получить расчёт',
        ]);

        App\Layout\Components\Common\Stages\Layout::draw([
            'title' => $this->service->stages_title ?? 'этапы оказания услуги',
            'desc' => $this->service->stages_desc ?? 'Чёткий и предсказуемый процесс от вашего первого запроса до регулярных поставок. 
            Мы пройдём этот путь вместе.',
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
            'image' => '/assets/images/Main/plug.png',
            'offer-title' => $this->service->stages_offer_title ?? 'Остались вопросы по этапам?',
            'offer-desc' => $this->service->stages_offer_desc ?? 'Проконсультируйтесь с нашим техническим директором. За 20 минут по видеосвязи он ответит 
            на любые вопросы, разберёт вашу специфику и скажет, какой объём поддержки вам действительно нужен.',
            'offer-text' => $this->service->stages_offer_text ?? 'Задать вопрос эксперту'
        ]);

        App\Layout\Components\Common\Risks\Layout::draw([
            'title' => $this->service->risks_title ?? 'Разбор вопросов по теме услуги ',
            'titleAccent' => $this->service->risks_title_accent ?? '(инструкция для клиента)',
            'desc' => $this->service->risks_desc ?? 'Здесь мы собрали ключевые вопросы, которые помогут вам принять 
            взвешенное решение. Выберите вкладку, чтобы увидеть подробный ответ.',
            'text' => [
                    [
                            'title' => 'С чего начать?',
                            'desc' => 'Тест 1',
                    ],[
                            'title' => 'На что направлена [услуга]?',
                            'desc' => 'Тест 2',
                    ],[
                            'title' => 'Зачем нужна [услуга]?',
                            'desc' => 'Тест 3',
                    ],[
                            'title' => 'Примеры [услуги]?',
                            'desc' => 'Тест 4',
                    ],
            ],
            'callback-title' => $this->service->risks_callback_title ?? 'Персональный расчёт [услуга] в 2 клика!',
            'callback-desc' => $this->service->risks_callback_desc ?? 'Ответьте на несколько вопросов, и мы предложим самые выгодные условия',
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

        App\Layout\Components\Common\OtherServices\Layout::draw([
            'title' => $this->service->o_serv_title ?? 'Другие',
            'titleAccent' => $this->service->o_serv_title_accent ?? 'услуги',
            'desc' => $this->service->o_serv_desc ?? 'Другие услуги, которые могут быть вам полезны',
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

        App\Layout\Components\Sliders\BlogSlider\Layout::draw([
            'title' => 'Наши отзывы',
            'link' => '/reviews/',
            'cards' => $reviews,
        ]); // Переделать под ReviewsSlider

        App\Layout\Components\Common\Certificate\Layout::draw([
            'title' => $index['params']['certificate-title'] ?? 'Разрешительные документы',
            'desc' => $index['params']['certificate-desc'] ?? 'Мы гарантируем надёжность и прозрачность в сфере 
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

        App\Layout\Components\Sliders\CasesSlider\Layout::draw([
            'title' => 'Другие наши кейсы',
            'link' => '/cases/',
        ]);

        App\Layout\Components\Common\Faq\Layout::draw([
            'title' => $this->service->faq_title ?? 'Частые вопросы',
            'desc' => $this->service->faq_desc ?? 'Подробно отвечаем на все ваши вопросы',
            'faq' => [
                [
                    'question' => 'Вопрос',
                    'answer' => 'Ответ',
                ],[
                    'question' => 'Вопрос 2',
                    'answer' => 'Ответ 2',
                ],[
                    'question' => 'Вопрос 3',
                    'answer' => 'Ответ 3',
                ],
            ],
        ]);

        App\Layout\Components\Sliders\BlogSlider\Layout::draw([
            'title' => 'медиа-центр',
            'title-accent' => 'ichina',
            'link' => '/blog/',
            'cards' => $post,
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
            'seo-title' => $this->service->seo_title ?? 'Тест',
            'seo-desc' => $this->service->seo_desc ?? 'Тест',
            'seo2-title' => $this->service->seo_title_2 ?? 'Тест',
            'seo2-desc' => $this->service->seo_desc_2 ?? 'Тест',
        ]);
	?>
</main>

<?php App\Layout\Components\Common\Footer\Layout::draw(); ?>