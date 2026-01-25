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
            'image' => $this->service->banner_image,
			'title' => $this->service->banner_service_title,
			'subtitle' => $this->service->banner_service_subtitle,
			'description' => $this->service->banner_service_desc,
			'card-title' => $this->service->banner_card_title,
			'card-text' => $this->service->banner_card_text,
            'button-text' => $this->service->banner_card_button_text,
            'button-link' => $this->service->banner_card_button_link,
			'items' => $this->service->banner_card_items
		]);

        App\Layout\Components\Layout\ServiceBig\ServiceAbout\Layout::draw([
            'title' => $this->service->about_title,
            'titleAccent' => $this->service->about_title_accent,
            'desc' => $this->service->about_desc,
            'subtitle-left' => $this->service->about_subtitle_left,
            'desc-left' => $this->service->about_desc_left,
            'bullits' => $this->service->about_bullits,
            'accent-text' => $this->service->about_accent_text,
            'items' => $this->service->about_items,
            'image' => $this->service->about_image,
            'offer-title' => $this->service->about_offer_title,
            'offer-desc' => $this->service->about_offer_desc,
            'offer-price' => $this->service->about_offer_price,
            'offer-time' => $this->service->about_offer_time,
            'offer-text' => $this->service->about_offer_button_text,
        ]);

        App\Layout\Components\Layout\Main\MainAbout\Layout::draw([
            'title' => $this->service->about_us_title,
            'title-accent' => $this->service->about_us_title_accent,
            'title-third' => $this->service->about_us_title_third,
            'benefits' => $this->service->about_us_benefits,
            'title-why' => $this->service->about_us_title_why,
            'items-why' => $this->service->about_us_items_why,
            'cardText-why' => $this->service->about_us_card_text_why,
            'description-why' => $this->service->about_us_description_why,
            'callback-title' => $this->service->about_us_callback_title,
            'callback-desc' => $this->service->about_us_callback_desc,
        ]);

        App\Layout\Components\Layout\Main\MainBenefit\Layout::draw([
            'title' => $this->service->benefits_title ?? $index['params']['main-benefit_title'],
            'title-accent' => $this->service->benefits_title_accent ?? $index['params']['main-benefit_title-accent'],
            'description' => $this->service->benefits_description ?? $index['params']['main-benefits_description'],
            'items' => $this->service->benefits_items
        ]);

        App\Layout\Components\Common\Types\Layout::draw([
            'title' => $this->service->types_title,
            'desc' => $this->service->types_desc,
            'badge' => $this->service->types_badge,
        ]);

        App\Layout\Components\Layout\ServiceBig\CTA\Layout::draw([
            'title' => $this->service->cta_title,
            'subtitle' => $this->service->cta_subtitle,
            'text' => $this->service->cta_text,
            'image' => $this->service->cta_image,
        ]);

        App\Layout\Components\Common\Options\Layout::draw([
            'title' => $this->service->options_title,
            'titleAccent' => $this->service->options_title_accent,
            'desc' => $this->service->options_desc,
            'items' => $this->service->options_items
        ]);

        App\Layout\Components\Layout\ServiceBig\ServiceAbout\Layout::draw([
            'title' => $this->service->another_about_title,
            'titleAccent' => $this->service->another_about_title_accent,
            'desc' => $this->service->another_about_desc,
            'subtitle-left' => $this->service->another_about_subtitle_left,
            'desc-left' => $this->service->another_about_desc_left,
            'bullits' => $this->service->another_about_bullits ?? [
                [
                    'text' => ''
                ]
            ],
            'callback-title' => $this->service->another_about_callback_title,
            'callback-desc' => $this->service->another_about_callback_desc,
        ]);

        App\Layout\Components\Common\Stages\Layout::draw([
            'title' => $this->service->stages_title,
            'desc' => $this->service->stages_desc,
            'cards' => $this->service->stages_cards ?? [
                [
                    'title' => '',
                    'desc' => '',
                ]
            ],
            'image' => $this->service->stages_offer_image,
            'offer-title' => $this->service->stages_offer_title,
            'offer-desc' => $this->service->stages_offer_desc,
            'offer-text' => $this->service->stages_offer_button_text
        ]);

        App\Layout\Components\Common\Risks\Layout::draw([
            'title' => $this->service->risks_title,
            'titleAccent' => $this->service->risks_title_accent,
            'desc' => $this->service->risks_desc,
            'text' => $this->service->risks_questions ?? [
                [
                    'title' => 'С чего начать?',
                    'desc' => 'Тест 1',
                ]
            ],
            'callback-title' => $this->service->risks_callback_title,
            'callback-desc' => $this->service->risks_callback_desc,
        ]);

        App\Layout\Components\Common\Map\Layout::draw([
            'main-title' => $this->service->map_title,
            'main-desc' => $this->service->map_desc,
            'addresses-title' => $this->service->addresses_title,
            'image' => $this->service->map_image,
            'image-t' => $this->service->map_image_t,
        ]);

        App\Layout\Components\Common\RouteMap\Layout::draw([
            'title' => $this->service->route_map_title ?? $index['route-map_title'],
            'title-accent' => $this->service->route_map_title_accent ?? $index['route-map_title-accent'],
            'desc' => $this->service->route_map_desc ?? $index['route-map_desc'],
            'items' => $this->service->route_map_items ?? [
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
            'title' => $index['params']['categories-title'],
            'desc' => $index['params']['categories-desc'],
            'cards' => self::getTableFrom('categories-items', $index),
            'callback-title' => $index['params']['categories-callback_title'],
            'callback-desc' => $index['params']['categories-callback-desc'],
        ]); // Натянуто

        App\Layout\Components\Common\OtherServices\Layout::draw([
            'title' => $this->service->o_serv_title,
            'titleAccent' => $this->service->o_serv_title_accent,
            'desc' => $this->service->o_serv_desc,
            'items' => $this->service->o_serv_items ?? [
                [
                    'title' => 'Полный аутсорсинг ВЭД',
                    'desc' => 'Все сложности работы с Китаем решаем за вас — от китайской фабрики до вашего склада',
                    'link' => '##',
                    'image' => '/assets/images/Main/key.png',
                ]
            ] // TODO
        ]);

        App\Layout\Components\Common\Certificate\Layout::draw([
            'title' => $index['params']['certificate-title'],
            'desc' => $index['params']['certificate-desc'],
            'cards-doc' => self::getTableFrom('certificate-cards_doc', $index),
            'items' => self::getTableFrom('certificate-items', $index),
        ]); // Натянуто

        App\Layout\Components\Sliders\BlogSlider\Layout::draw([
            'title' => 'Наши отзывы',
            'link' => '/reviews/',
            'cards' => $reviews,
        ]); // Натянуто

        App\Layout\Components\Common\Info\Layout::draw([
            'title' => $index['params']['info_title'],
            'desc' => $index['params']['info_desc'],
            'cards' => self::getTableFrom('info-items', $index),
        ]); // Натянуто

        App\Layout\Components\Common\Partners\Layout::draw([
            'title' => $index['params']['partners_title'],
            'desc' => $index['params']['partners_desc'],
            'items' => self::getTableFrom('partner-items', $index),
        ]); // Натянуто

        App\Layout\Components\Common\ContactSection\Layout::draw([
            'title' => $index['params']['main_contact_title'],
        ]); // Натянуто

        App\Layout\Components\Common\FormFeedback\Layout::draw([
            'title' => $this->service->form_title ?? $index['params']['form-feedback_title'],
            'desc' => $this->service->form_desc ?? $index['params']['form-feedback_desc'],
            'image' => $this->service->form_image ?? $index['params']['form-feedback-img'],
        ]);

        App\Layout\Components\Common\Seo\Layout::draw([
            'seo-title' => $this->service->seo_title,
            'seo-desc' => $this->service->seo_desc,
            'seo2-title' => $this->service->seo_title_2,
            'seo2-desc' => $this->service->seo_desc_2,
        ]);
    ?>
</main>

<?php App\Layout\Components\Common\Footer\Layout::draw(); ?>