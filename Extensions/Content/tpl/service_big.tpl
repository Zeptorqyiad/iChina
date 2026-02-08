<?php
/** @var array $content */

use App\Extensions\Reviews\Model\Reviews;

$reviews = Reviews::findAdv()
        ->limit(10)
        ->where(['is_active' => 1])
        ->orderBy('npp')
        ->all();

$index = $content->loadFrom('/');
$about = $content->loadFrom('/about/');

App\Layout\Components\Common\Header\Layout::draw([
	'absolute' => true,
]);
?>

<main>
	<?php
        if ($this->service->banner_image) {
            App\Layout\Components\Layout\Services\BannerService\Layout::draw([
                'image' => $this->service->banner_image,
                'title' => $this->service->banner_service_title,
                'subtitle' => $this->service->banner_service_subtitle,
                'description' => $this->service->banner_service_desc,
                'card-title' => $this->service->banner_card_title,
                'card-text' => $this->service->banner_card_text,
                'button-text' => $this->service->banner_card_button_text,
                'button-link' => $this->service->banner_card_button_link,
                'items' => $this->service->getBannerItems()
            ]);
        }

        if ($this->service->about_title || $this->service->about_desc) {
            App\Layout\Components\Layout\ServiceBig\ServiceAbout\Layout::draw([
                'title' => $this->service->about_title,
                'titleAccent' => $this->service->about_title_accent,
                'desc' => $this->service->about_desc,
                'subtitle-left' => $this->service->about_subtitle_left,
                'desc-left' => $this->service->about_desc_left,
                'bullits' => $this->service->getAboutBullitsList(),
                'accent-text' => $this->service->about_accent_text,
                'items' => $this->service->getAboutItems(),
                'image' => $this->service->about_image,
                'offer-title' => $this->service->about_offer_title,
                'offer-desc' => $this->service->about_offer_desc,
                'offer-price' => $this->service->about_offer_price,
                'offer-time' => $this->service->about_offer_time,
                'offer-text' => $this->service->about_offer_buttons_text,
            ]);
        }

        App\Layout\Components\Layout\Main\MainAbout\Layout::draw([
            'title' => $this->service->about_us_title ?: $index['params']['main-about_title'],
            'title-accent' => $this->service->about_us_title_accent ?: $index['params']['main-about_title-accent'],
            'title-third' => $this->service->about_us_title_third ?: $index['params']['main-about_title-third'],
            'benefits' => $this->service->getAboutBenefits(),
            'title-why' => $this->service->about_us_title_why ?: $index['params']['main-about_title-why'],
            'items-why' => $this->service->getAboutUsItemsWhy() ?: self::getTableFrom('main-about_items-why', $index),
            'cardText-why' => $this->service->about_us_card_text_why ?: $index['params']['main-about_cardText-why'],
            'description-why' => $this->service->about_us_description_why ?: $index['params']['main-about_description-why'],
            'callback-title' => $this->service->about_us_callback_title ?: $index['params']['main-about_callback-title'],
            'callback-desc' => $this->service->about_us_callback_desc ?: $index['params']['main-about_callback-desc'],
        ]);

        App\Layout\Components\Layout\Main\MainBenefit\Layout::draw([
            'title' => $this->service->benefits_title ?: $index['params']['main-benefit_title'],
            'titleAccent' => $this->service->benefits_title_accent ?: $index['params']['main-benefit_title-accent'],
            'description' => $this->service->benefits_description ?: $index['params']['main-benefits_description'],
            'items' => $this->service->getBenefitsItems() ?: self::getTableFrom('main-benefit-items', $index),
        ]);

        if ($this->service->types_title || !empty($this->service->getTypes())) {
            App\Layout\Components\Common\Types\Layout::draw([
                'title' => $this->service->types_title,
                'desc' => $this->service->types_desc,
                'badge' => $this->service->getTypes(),
            ]);
        }

        if ($this->service->cta_title || $this->service->cta_subtitle) {
            App\Layout\Components\Layout\ServiceBig\CTA\Layout::draw([
                'title' => $this->service->cta_title,
                'subtitle' => $this->service->cta_subtitle,
                'text' => $this->service->cta_text,
                'image' => $this->service->cta_image,
            ]);
        }

        if ($this->service->options_title) {
            App\Layout\Components\Common\Options\Layout::draw([
                'title' => $this->service->options_title,
                'titleAccent' => $this->service->options_title_accent,
                'desc' => $this->service->options_desc,
                'items' => $this->service->getOptions()
            ]);
        }

        if ($this->service->another_about_title || $this->service->another_about_desc) {
            App\Layout\Components\Layout\ServiceBig\ServiceAbout\Layout::draw([
                'title' => $this->service->another_about_title,
                'titleAccent' => $this->service->another_about_title_accent,
                'desc' => $this->service->another_about_desc,
                'subtitle-left' => $this->service->another_about_subtitle_left,
                'desc-left' => $this->service->another_about_desc_left,
                'bullitsTitle' => $this->service->another_about_bullits_title,
                'bullits' => $this->service->getAnotherAboutBullitsList(),
                'callback-title' => $this->service->another_about_callback_title,
                'callback-desc' => $this->service->another_about_callback_desc,
                'callback-button-text' => $this->service->another_about_callback_button_text,
            ]);
        }

        if ($this->service->stages_title || $index['params']['main_stages-title']) {
            App\Layout\Components\Common\Stages\Layout::draw([
                'title' => $this->service->stages_title ?: $index['params']['main_stages-title'],
                'desc' => $this->service->stages_desc ?: $index['params']['main_stages-desc'],
                'cards' => $this->service->getStageCards() ?: self::getTableFrom('main_stage-items', $index),
                'image' => $this->service->stages_offer_image,
                'offer-title' => $this->service->stages_offer_title,
                'offer-desc' => $this->service->stages_offer_desc,
                'offer-text' => $this->service->stages_offer_button_text
            ]);
        }

        if ($this->service->risks_title || $this->service->risks_desc) {
            App\Layout\Components\Common\Risks\Layout::draw([
                'title' => $this->service->risks_title,
                'titleAccent' => $this->service->risks_title_accent,
                'desc' => $this->service->risks_desc,
                'text' => $this->service->getQuestions(),
                'callback-title' => $this->service->risks_callback_title,
                'callback-desc' => $this->service->risks_callback_desc,
            ]);
        }

        App\Layout\Components\Common\Map\Layout::draw([
            'title' => $about['params']['about_map-title'],
            'desc' => $about['params']['about_map-desc'],
            'addresses-title' => $about['params']['about_map-addresses-title'],
            'image' => $about['params']['about_map-image'],
            'image-t' => $about['params']['about_map-image-t'],
        ]);

        if (!empty($index['params']['route-map_title'])) {
            App\Layout\Components\Common\RouteMap\Layout::draw([
                'title' => $index['params']['route-map_title'],
                'title-accent' => $index['params']['route-map_title-accent'],
                'desc' => $index['params']['route-map_desc'],
                'image' => $index['params']['route-map_image'],
                'items' => self::getTableFrom('route-map_items', $index),
            ]);
        }

        App\Layout\Components\Common\Categories\Layout::draw([
            'title' => $index['params']['categories-title'],
            'desc' => $index['params']['categories-desc'],
            'cards' => self::getTableFrom('categories-items', $index),
            'callback-title' => $index['params']['categories-callback_title'],
            'callback-desc' => $index['params']['categories-callback-desc'],
        ]);

        App\Layout\Components\Common\OtherServices\Layout::draw([
            'title' => $this->service->o_serv_title,
            'titleAccent' => $this->service->o_serv_title_accent,
            'desc' => $this->service->o_serv_desc,
            'items' => $this->service->o_serv_items
        ]);

        App\Layout\Components\Common\Certificate\Layout::draw([
            'title' => $index['params']['certificate-title'],
            'desc' => $index['params']['certificate-desc'],
            'cards-doc' => self::getTableFrom('certificate-cards_doc', $index),
            'items' => self::getTableFrom('certificate-items', $index),
        ]);

        App\Layout\Components\Sliders\BlogSlider\Layout::draw([
            'title' => 'Наши отзывы',
            'link' => '/reviews/',
            'cards' => $reviews,
        ]);

        if (!empty($this->service->getFaqs())) {
            App\Layout\Components\Common\Faq\Layout::draw([
                'title' => $this->service->faq_title,
                'desc' => $this->service->faq_desc,
                'faq' => $this->service->getFaqs(),
            ]);
        }

        App\Layout\Components\Common\Info\Layout::draw([
            'title' => $index['params']['info_title'],
            'desc' => $index['params']['info_desc'],
            'cards' => self::getTableFrom('info-items', $index),
        ]);

        App\Layout\Components\Common\Partners\Layout::draw([
            'title' => $index['params']['partners_title'],
            'desc' => $index['params']['partners_desc'],
            'items' => self::getTableFrom('partner-items', $index),
        ]);

        App\Layout\Components\Common\ContactSection\Layout::draw([
            'title' => $index['params']['main_contact_title'],
        ]);

        App\Layout\Components\Common\FormFeedback\Layout::draw([
            'title' => $this->service->form_title ?: $index['params']['form-feedback_title'],
            'desc' => $this->service->form_desc ?: $index['params']['form-feedback_desc'],
            'image' => $this->service->form_image ?: $index['params']['form-feedback-img'],
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
