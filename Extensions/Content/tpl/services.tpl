<?php
/** @var array $content */

$index = $content->loadFrom('/');

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
			'title' => $content['params']['services_banner-title'],
			'subtitle' => $content['params']['services_banner-subtitle'],
			'description' => $content['params']['services_banner-description'],
			'card-title' => $content['params']['services_banner-card-title'],
			'card-text' => $content['params']['services_banner-card-text'],
            'button-text' => $content['params']['services_banner-button-text'],
            'button-link' => $content['params']['services_banner-button-link'],
			'items' => self::getTableFrom('services_banner-items', $content),
            'image' => $content['params']['services_banner-image'],
		]);

		App\Layout\Components\Layout\Services\Services\Layout::draw([
			'title' => $content['params']['services_services-title'],
			'description' => $content['params']['services_services-description'],
		]);

        App\Layout\Components\Layout\Main\MainAbout\Layout::draw([
            'title' => $content['params']['services_about-title'] ?: $index['params']['main-about_title'],
            'title-accent' => $content['params']['services_about-title-accent'] ?: $index['params']['main-about_title-accent'],
            'title-third' => $content['params']['services_about-title-third'] ?: $index['params']['main-about_title-third'],
            'benefits' => self::getTableFrom('services_about-benefits', $content),
            'title-why' => $content['params']['services_about-title-why'] ?: $index['params']['main-about_title-why'],
            'items-why' => self::getTableFrom('services_about-items-why', $content) ?: self::getTableFrom('main-about_items-why', $index),
            'cardText-why' => $content['params']['services_about-cardText-why'] ?: $index['params']['main-about_cardText-why'],
            'description-why' => $content['params']['services_about-description-why'] ?: $index['params']['main-about_description-why'],
            'callback-title' => $content['params']['services_about-callback-title'] ?: $index['params']['main-about_callback-title'],
            'callback-desc' => $content['params']['services_about-callback-desc'] ?: $index['params']['main-about_callback-desc'],
        ]);

		$servicesBenefitsItems = self::getTableFrom('services_benefits-items', $content);
		App\Layout\Components\Layout\Main\MainBenefit\Layout::draw([
			'title' => $content['params']['services_benefits-title'] ?: $index['params']['main-benefit_title'],
			'title-accent' => $content['params']['services_benefits-title-accent'] ?: $index['params']['main-benefit_title-accent'],
			'description' => $content['params']['services_benefits-description'] ?: $index['params']['main-benefits_description'],
			'items' => !empty($servicesBenefitsItems) ? $servicesBenefitsItems : self::getTableFrom('main-benefit-items', $index),
		]);

		App\Layout\Components\Common\Certificate\Layout::draw([
			'title' => $index['params']['certificate-title'],
            'desc' => $index['params']['certificate-desc'],
            'cards-doc' => self::getTableFrom('certificate-cards_doc', $index),
            'items' => self::getTableFrom('certificate-items', $index),
		]);

		App\Layout\Components\Sliders\CasesSlider\Layout::draw([
			'title' => 'Наши кейсы',
			'link' => '/cases/',
		]);

        $servicesStagesCards = self::getTableFrom('services_stages-cards', $content);
        App\Layout\Components\Common\Stages\Layout::draw([
            'title' => $content['params']['services_stages-title'] ?: $index['params']['main_stages-title'],
            'desc' => $content['params']['services_stages-desc'] ?: $index['params']['main_stages-desc'],
            'cards' => !empty($servicesStagesCards) ? $servicesStagesCards : self::getTableFrom('main_stage-items', $index)
        ]);

		App\Layout\Components\Sliders\BlogSlider\Layout::draw([
			'title' => 'Наши отзывы',
			'link' => '/reviews/',
			'cards' => $items,
		]);

		App\Layout\Components\Common\Info\Layout::draw([
            'title' => $index['params']['info_title'],
            'desc' => $index['params']['info_desc'],
            'cards' => self::getTableFrom('info-items', $index),
		]);

		App\Layout\Components\Common\Partners\Layout::draw([
            'title' => $index['params']['partners_title'],
            'desc' => $index['params']['partners_desc'] ,
            'items' => self::getTableFrom('partner-items', $index),
		]);

        App\Layout\Components\Common\ContactSection\Layout::draw([
            'title' => $index['params']['main_contact_title'],
        ]);

		App\Layout\Components\Common\FormFeedback\Layout::draw([
			'title' => $content['params']['services_form-title'] ?: $index['params']['form-feedback_title'],
			'desc' => $content['params']['services_form-desc'] ?: $index['params']['form-feedback_desc'],
            'image' => $content['params']['services_form-image'] ?: $index['params']['form-feedback-img'],
		]);

		App\Layout\Components\Common\Seo\Layout::draw([
			'seo-title' => $content['params']['services_seo_title_1'],
			'seo-desc' => $content['params']['services_seo_text_1'],
			'seo2-title' => $content['params']['services_seo_title_2'],
			'seo2-desc' => $content['params']['services_seo_text_2'],
		]);
	?>
</main>

<?php App\Layout\Components\Common\Footer\Layout::draw(); ?>
