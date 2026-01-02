<?php
/** @var array $content */

use App\Extensions\Reviews\Model\Reviews;

$q = Reviews::findAdv();
$items = $q->select('*')
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
			'title' => $content['params']['banner_service-title'] ?? 'Услуги ICHINA',
			'subtitle' => $content['params']['banner_service-subtitle'] ?? 'Комплексные решения для вашего бизнеса 
			в Китае',
			'description' => $content['params']['banner_service-description'] ?? 'От поиска поставщика и контроля 
			производства до логистики и таможенного оформления. Аутсорсинг ВЭД «под ключ» и экспертные услуги на месте. 
			Ваша уверенность в импорте.',
			'card-title' => $content['params']['banner_card-title'] ?? 'Расчет <br /> за 24 часа',
			'card-text' => $content['params']['banner_card-text'] ?? 'Оставьте заявку, и наш специалист подготовит для вас 
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

		App\Layout\Components\Layout\Services\Services\Layout::draw([
			'title' => 'Наши услуги',
			'description' => 'Мы оказываем полный комплекс услуг во внешнеэкономической деятельности —  от поиска поставщика до доставки товара на ваш склад ',
		]);

		App\Layout\Components\Layout\Services\ServicesAbout\Layout::draw();

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

		App\Layout\Components\Sliders\BlogSlider\Layout::draw([
			'title' => 'Другие отзывы',
			'link' => '/reviews/',
			'cards' => $items,
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
			'seo-title' => $content['params']['services__seo_title_1'] ?? 'Тест',
			'seo-desc' => $content['params']['services__seo_text_1'] ?? 'Тест',
			'seo2-title' => $content['params']['services__seo_title_2'] ?? 'Тест',
			'seo2-desc' => $content['params']['services__seo_text_2'] ?? 'Тест',
		]);
	?>
</main>

<?php
	App\Layout\Components\Common\Footer\Layout::draw();
?>