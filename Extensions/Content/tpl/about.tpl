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
        ]); // Натянуто

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
        ]); // Натянуто

        App\Layout\Components\Layout\About\AboutHistory\Layout::draw([
            'title' => $content['params']['about_history_title'],
            'titleAccent' => $content['params']['about_history_title-accent'],
            'cards' => self::getTableFrom('about_history-cards', $content),
        ]); // Натянуто

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
        ]); // Натянуто

        App\Layout\Components\Layout\About\Team\Layout::draw([
            'title' => $content['params']['about_team-title'],
            'titleAccent' => $content['params']['about_team-title-accent'],
            'items' => self::getTableFrom('about_team-items', $content),
        ]); // Натянуто

        App\Layout\Components\Common\Map\Layout::draw([
            'title' => $content['params']['about_map-title'],
            'desc' => $content['params']['about_map-desc'],
            'addresses-title' => $content['params']['about_map-addresses-title'],
            'image' => $content['params']['about_map-image'],
            'image-t' => $content['params']['about_map-image-t'],
        ]); // Натянуто

        App\Layout\Components\Layout\Main\MainBenefit\Layout::draw([
            'title' => $index['params']['main-benefit_title'],
            'titleAccent' => $index['params']['main-benefit_title-accent'],
            'description' => $index['params']['main-benefits_description'],
            'items' => self::getTableFrom('main-benefit-items', $index),
        ]); // Натянуто

        App\Layout\Components\Common\Categories\Layout::draw([
            'title' => $index['params']['categories-title'],
            'desc' => $index['params']['categories-desc'],
            'cards' => self::getTableFrom('categories-items', $index),
            'callback-title' => $index['params']['categories-callback_title'],
            'callback-desc' => $index['params']['categories-callback-desc'],
        ]); // Натянуто

        App\Layout\Components\Sliders\CasesSlider\Layout::draw([
            'title' => 'Наши кейсы',
            'link' => '/cases/',
        ]); // Отедельно дорабатывать

        App\Layout\Components\Common\Stages\Layout::draw([
            'title' => $content['params']['about_stages-title'] ?? $index['params']['main_stages-title'],
            'desc' => $content['params']['about_stages-desc'] ?? $index['params']['main_stages-desc'],
            'cards' => self::getTableFrom('about_stages-cards', $content) ?? self::getTableFrom('main_stage-items', $index),
        ]); // Натянуто

        App\Layout\Components\Common\Certificate\Layout::draw([
            'title' => $index['params']['certificate-title'],
            'desc' => $index['params']['certificate-desc'],
            'cards-doc' => self::getTableFrom('certificate-cards_doc', $index),
            'items' => self::getTableFrom('certificate-items', $index),
        ]); // Натянуто

        App\Layout\Components\Sliders\BlogSlider\Layout::draw([
            'title' => 'Другие отзывы',
            'link' => '/reviews/',
            'cards' => $reviews,
        ]); // Отедельно дорабатывать

        App\Layout\Components\Common\Info\Layout::draw([
            'title' => $index['params']['info_title'],
            'desc' => $index['params']['info_desc'],
            'cards' => self::getTableFrom('info-items', $index),
        ]); // Натянуто

        App\Layout\Components\Common\Partners\Layout::draw([
            'title' => $index['params']['partners_title'],
            'desc' => $index['params']['partners_desc'] ,
            'items' => self::getTableFrom('partner-items', $index),
        ]); // Натянуто

        App\Layout\Components\Common\ContactSection\Layout::draw([
            'title' => $index['params']['main_contact_title'],
        ]); // Натянуто

        App\Layout\Components\Common\FormFeedback\Layout::draw([
            'title' => $content['params']['about_form-title'] ?? $index['params']['form-feedback_title'],
            'desc' => $content['params']['about_form-desc'] ?? $index['params']['form-feedback_desc'],
            'image' => $content['params']['about_form-img'] ?? $index['params']['form-feedback-img'],
        ]); // Натянуто

        App\Layout\Components\Common\Seo\Layout::draw([
            'seo-title' => $content['params']['about_seo_title_1'],
            'seo-desc' => $conten['params']['about_seo_text_1'],
            'seo2-title' => $content['params']['about_seo_title_2'],
            'seo2-desc' => $content['params']['about_seo_text_2'],
        ]); // Натянуто
    ?>
</main>

<?php App\Layout\Components\Common\Footer\Layout::draw(); ?>