<?php
/** @var array $content */

use App\Extensions\Blog\Model\Blog;

$post = Blog::findAdv()
        ->limit(10)
        ->andWhere(['is_active' => 1])
        ->orderBy('npp')
        ->all();

App\Layout\Components\Common\Header\Layout::draw([
    'absolute' => true,
]);
?>

<main>
	<?php
        App\Layout\Components\Layout\Main\MainBanner\Layout::draw();

        App\Layout\Components\Layout\Main\MainAbout\Layout::draw([
            'title' => $content['params']['main-about_title'],
            'title-accent' => $content['params']['main-about_title-accent'],
            'title-third' => $content['params']['main-about_title-third'],
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
            'title-why' => $content['params']['main-about_title-why'],
            'items-why' => self::getTableFrom('main-about_items-why', $content),
            'cardText-why' => $content['params']['main-about_cardText-why'],
            'description-why' => $content['params']['main-about_description-why'],
            'callback-title' => $content['params']['main-about_callback-title'],
            'callback-desc' => $content['params']['main-about_callback-desc'],
        ]); // TODO

        App\Layout\Components\Layout\Main\MainBenefit\Layout::draw([
            'title' => $content['params']['main-benefit_title'],
            'titleAccent' => $content['params']['main-benefit_title-accent'],
            'description' => $content['params']['main-benefits_description'],
            'items' => self::getTableFrom('main-benefit-items', $content),
        ]);

        if (!empty(self::getTableFrom('route-map_items', $content))) {
            App\Layout\Components\Common\RouteMap\Layout::draw([
                'title' => $content['params']['route-map_title'],
                'title-accent' => $content['params']['route-map_title-accent'],
                'desc' => $content['params']['route-map_desc'],
                'image' => $content['params']['route-map_image'],
                'items' => self::getTableFrom('route-map_items', $content),
            ]);
        }

        App\Layout\Components\Common\Categories\Layout::draw([
            'title' => $content['params']['categories-title'],
            'desc' => $content['params']['categories-desc'],
            'cards' => self::getTableFrom('categories-items', $content),
            'callback-title' => $content['params']['categories-callback_title'],
            'callback-desc' => $content['params']['categories-callback-desc'],
        ]);

        App\Layout\Components\Sliders\CasesSlider\Layout::draw([
            'title' => 'Наши кейсы',
            'link' => '/cases/',
        ]);

        App\Layout\Components\Common\Stages\Layout::draw([
            'title' => $content['params']['main_stages-title'],
            'desc' => $content['params']['main_stages-desc'],
            'cards' => self::getTableFrom('main_stage-items', $content)
        ]);

        App\Layout\Components\Common\Certificate\Layout::draw([
            'title' => $content['params']['certificate-title'],
            'desc' => $content['params']['certificate-desc'],
            'cards-doc' => self::getTableFrom('certificate-cards_doc', $content),
            'items' => self::getTableFrom('certificate-items', $content),
        ]);

        App\Layout\Components\Common\Info\Layout::draw([
            'title' => $content['params']['info_title'],
            'desc' => $content['params']['info_desc'],
            'cards' => self::getTableFrom('info-items', $content),
        ]);

        App\Layout\Components\Sliders\BlogSlider\Layout::draw([
            'title' => 'медиа-центр',
            'title-accent' => 'ichina',
            'link' => '/blog/',
            'cards' => $post,
        ]);

        App\Layout\Components\Common\Partners\Layout::draw([
            'title' => $content['params']['partners_title'],
            'desc' => $content['params']['partners_desc'],
            'items' => self::getTableFrom('partner-items', $content),
        ]);

        App\Layout\Components\Common\ContactSection\Layout::draw([
            'title' => $content['params']['main_contact_title'],
        ]);

        App\Layout\Components\Common\FormFeedback\Layout::draw([
            'title' => $content['params']['form-feedback_title'],
            'desc' => $content['params']['form-feedback_desc'],
            'image' => $content['params']['form-feedback-img'],
        ]);

        App\Layout\Components\Common\Seo\Layout::draw([
            'seo-title' => $content['params']['seo_title_1'],
            'seo-desc' => $content['params']['seo_text_1'],
            'seo2-title' => $content['params']['seo_title_2'],
            'seo2-desc' => $content['params']['seo_text_2'],
        ]);
	?>
</main>

<?php App\Layout\Components\Common\Footer\Layout::draw(); ?>
