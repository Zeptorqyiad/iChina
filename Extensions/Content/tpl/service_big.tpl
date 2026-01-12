<?php
/** @var array $content */

use App\Extensions\Reviews\Model\Reviews;

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
			'title' => $this->service->banner_service_title ?? 'Услуги ICHINA',
			'subtitle' => $this->service->banner_service_subtitle ?? 'Комплексные решения для вашего бизнеса 
				в Китае',
			'description' => $this->service->banner_service_desc ?? 'От поиска поставщика и контроля 
				производства до логистики и таможенного оформления. Аутсорсинг ВЭД «под ключ» и экспертные услуги на месте. 
				Ваша уверенность в импорте.',
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

        App\Layout\Components\Layout\Main\MainAbout\Layout::draw([
            'title' => $this->service->about_us_title ?? 'Проверенный эксперт',
            'title-accent' => $this->service->about_us_title_accent ?? 'по поставкам из китая',
            'title-third' => $this->service->about_us_title_third ?? 'для бизнеса',
            'title-why' => $this->service->about_us_title_why ?? 'Почему бизнесу удобно и выгодно с ICHINA?',
            'benefits' => [
                    [
                            'title' => '2500+',
                            'text' => 'успешных поставок',
                    ],[
                            'title' => '85000+',
                            'text' => 'фабрик в базе',
                    ],[
                            'title' => '120+',
                            'text' => 'проверенных поставщиков',
                    ]
            ],
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
            'cardText-why' => $this->service->about_us_cardtext_why ?? 'Мы не просто доставляем товары — мы строим надёжный мост между Россией и Китаем, 
            помогая вашему бизнесу расти без границ.',
            'description-why' => $this->service->about_us_description_why ?? 'Каждый проект ICHINA проходит без задержек и рисков. Мы организуем поставки 
            из Китая для бизнеса любого масштаба — от первых тестовых партий до крупных контрактов. ',
            'callback-title' => $this->service->about_us_callback_title ?? 'Персональный расчёт импорта в 2 клика!',
            'callback-desc' => $this->service->about_us_callback_desc ?? 'Ответьте на несколько вопросов, и мы предложим самые выгодные условия',
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

        App\Layout\Components\Common\Types\Layout::draw([
            'title' => $this->service->types_title ?? 'Что мы делаем в рамках [услуги]',
            'desc' => $this->service->types_desc ?? 'Полный цикл услуг — от международного контракта до товара на вашем складе. 
            Мы закрываем все этапы ВЭД, чтобы вы занимались бизнесом.',
            'badge' => [
                [
                    'text' => 'Предварительный аудит',
                    'desc' => 'Разрабатываем и проверяем международные контракты, готовим полный пакет документов для 
                    таможни и банков (инвойсы, спецификации, сертификаты).'
                ],[
                    'text' => 'Предварительный аудит',
                    'desc' => 'Разрабатываем и проверяем международные контракты, готовим полный пакет документов для 
            таможни и банков (инвойсы, спецификации, сертификаты).'
                ],[
                    'text' => 'Предварительный аудит',
                    'desc' => 'Разрабатываем и проверяем международные контракты, готовим полный пакет документов для 
            таможни и банков (инвойсы, спецификации, сертификаты).'
                ],[
                    'text' => 'Предварительный аудит',
                    'desc' => 'Разрабатываем и проверяем международные контракты, готовим полный пакет документов для 
            таможни и банков (инвойсы, спецификации, сертификаты).'
                ],[
                    'text' => 'Предварительный аудит',
                    'desc' => 'Разрабатываем и проверяем международные контракты, готовим полный пакет документов для 
            таможни и банков (инвойсы, спецификации, сертификаты).'
                ],[
                    'text' => 'Предварительный аудит',
                    'desc' => 'Разрабатываем и проверяем международные контракты, готовим полный пакет документов для 
            таможни и банков (инвойсы, спецификации, сертификаты).'
                ],
            ],
        ]);

        App\Layout\Components\Layout\ServiceBig\CTA\Layout::draw([
            'title' => $this->service->cta_title ?? 'Получите бесплатную консультацию и чек-лист по оптимизации',
            'subtitle' => $this->service->cta_subtitle ?? 'Наш эксперт проанализирует ваши текущие операции 
            (контракты, логистику, таможенное оформление) и выявит скрытые риски и точки роста. ',
            'text' => $this->service->cta_text ?? 'В подарок вы получите персонализированный чек-лист из 7-10 шагов, 
            как снизить издержки и ускорить поставки уже в этом месяце.',
            'image' => $this->service->cta_image ?? '',
        ]);

        App\Layout\Components\Common\Options\Layout::draw([
            'title' => $this->service->options_title ?? 'услуг',
            'titleAccent' => $this->service->options_titleAccent ?? 'Пакеты',
            'desc' => $this->service->options_desc ?? 'Выберите готовое решение, которое идеально 
            подходит под ваши задачи и масштаб операций. Мы собрали самые востребованные опции в прозрачные пакеты.',
            'items' => [
                [
                    'title' => 'Пакет "СТАРТ"',
                    'image' => '/assets/images/Main/plug.png',
                    'desc' => 'Базовый комплект услуг для безопасного ввоза или вывоза партии товара. Мы берём на себя 
                    ключевые этапы, чтобы вы гарантированно прошли таможню и получили груз без юридических ошибок.',
                    'text' => 'Кнопка призыва',
                    'link' => '##'
                ],[
                    'title' => 'Пакет "БИЗНЕС"',
                    'image' => '/assets/images/Main/plug.png',
                    'desc' => 'Базовый комплект услуг для безопасного ввоза или вывоза партии товара. Мы берём на себя 
                    ключевые этапы, чтобы вы гарантированно прошли таможню и получили груз без юридических ошибок.',
                    'text' => 'Кнопка призыва',
                    'link' => '##'
                ],
            ],
        ]);

        App\Layout\Components\Layout\ServiceBig\ServiceAbout\Layout::draw([
            'title' => $this->service->another_about_title ?? 'Другая информация про ',
            'titleAccent' => $this->service->another_about_title_accent ?? '[услугу]',
            'desc' => $this->service->another_about_desc ?? 'Как мы выстраиваем работу и становимся частью вашей команды.',
            'subtitle-left' => $this->service->another_about_subtitle_left ?? 'Принципы нашего партнёрства:',
            'desc-left' => $this->service->another_about_desc_left ?? 'Аутсорсинг ВЭД — это долгосрочное сотрудничество, 
            где успех зависит от слаженности действий. Мы не просто исполняем поручения, а полностью погружаемся в специфику 
            вашего бизнеса, чтобы стать вашим надёжным стратегическим партнёром в международной торговле. 
            Наша интеграция строится на трёх ключевых принципах.',
            'bullits' => [
                [
                    'text' => 'Единая команда. Вам не нужно координировать нескольких подрядчиков. 
                    Ваш персональный менеджер выступает единым центром ответственности за всю цепочку: от контракта до поставки.'
                ],[
                    'text' => 'Единая система отчётности. Все этапы, документы и коммуникации доступны в вашем личном кабинете. 
                    Вы в любой момент видите статус операции, сроки и финансовые детали.'
                ],[
                    'text' => 'Единая цель — ваш результат. Мы заинтересованы в росте ваших объёмов и оптимизации издержек. 
                    Наши ежемесячные отчёты содержат не только факты, но и аналитику с рекомендациями по улучшению.'
                ]
            ],
            'callback-title' => $this->service->another_about_callback_title ?? 'Хотите такого партнёра по ВЭД?',
            'callback-desc' => $this->service->another_about_callback_desc ?? 'Запланируйте вводную встречу с нашим директором по развитию. ',
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

        App\Layout\Components\Common\Map\Layout::draw([
            'main-title' => $this->service->map_title ?? '',
            'main-desc' => $this->service->map_desc ?? '',
            'city-title' => [],
            'city-badge' => [],
            'country-title' => [],
            'country-badge' => [],
            'image' => '/assets/images/Main/Mapping.png',
            'image-t' => '/assets/images/Main/miniMap.png',
        ]);

        App\Layout\Components\Common\RouteMap\Layout::draw([
            'title' => $index['route-map_title'] ?? 'Наши ',
            'title-accent' => $index['route-map_title-accent'] ?? 'маршруты',
            'desc' => $index['route-map_desc'] ?? 'Наши специалисты помогут вам выбрать оптимальный маршрут, осуществляем таможенное оформление грузов по всей России',
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

        App\Layout\Components\Sliders\BlogSlider\Layout::draw([
            'title' => 'Наши отзывы',
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
            'seo-title' => $this->service->seo_title ?? 'Тест',
            'seo-desc' => $this->service->seo_desc ?? 'Тест',
            'seo2-title' => $this->service->seo_title_2 ?? 'Тест',
            'seo2-desc' => $this->service->seo_desc_2 ?? 'Тест',
        ]);
    ?>
</main>

<?php App\Layout\Components\Common\Footer\Layout::draw(); ?>