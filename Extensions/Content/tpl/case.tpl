<?php
/** @var array $content */

$index = $content->loadFrom('/');

App\Layout\Components\Common\Header\Layout::draw([
    'subtitle' => $index['params']['header_logo-text'],
]);
?>

<main>
    <?php
    App\Layout\Components\UI\Core\BreadCrumbs\Layout::draw();

    App\Layout\Components\Common\PageHeading\Layout::drawPageHeading();

    App\Layout\Components\Layout\Case\CaseFs\Layout::draw([
        'image' => $this->case->photo,
        'name' => $this->case->name,
        'short' => $this->case->short,
    ]);

    App\Layout\Components\Layout\Case\CaseArticle\Layout::draw([
        'first-id' => $this->case->first_id,
        'second-id' => $this->case->second_id,
        'third-id' => $this->case->third_id,
        'fourth-id' => $this->case->fourth_id,
        'nav-title' => $this->case->nav_title,
        'link' => $this->case->getLinkTo(),
        'tini' => $this->case->tini,
        'title-s' => $this->case->title_s,
        'text-s' => $this->case->text_s,
        'steps' => $this->case->getSteps(),
        'text-s-bottom' => $this->case->text_s_bottom,
        'title-third' => $this->case->title_third,
        'text-third' => $this->case->text_third,
        'image-third' => $this->case->image_third,
        'desc-third' => $this->case->desc_third,
        'image-list' => $this->case->getImages(),
        'desc-third-image' => $this->case->desc_third_image,
        'text-third-after' => $this->case->text_third_after,
        'benefits' => $this->case->getBenefits(),
        'fourth_title' => $this->case->fourth_title,
        'fourth_text' => $this->case->fourth_text,
        'fourth_button_text_1' => $this->case->fourth_button_text_1,
        'fourth_button_link_1' => $this->case->fourth_button_link_1,
        'fourth_button_text_2' => $this->case->fourth_button_text_2,
        'fourth_button_link_2' => $this->case->fourth_button_link_2,
        'video' => $this->case->video,
        'video_desc' => $this->case->video_desc,
        'video_v' => $this->case->video_v,
        'video_v_desc' => $this->case->video_v_desc,
        'video_v_text' => $this->case->video_v_text,
        'date' => $this->case->date,
    ]);

    App\Layout\Components\Sliders\CasesSlider\Layout::draw([
        'title' => 'Другие наши кейсы',
        'link' => '/cases/',
        'id' => $this->case->cases_id
    ]);

    App\Layout\Components\Common\FormFeedback\Layout::draw([
        'title' => $index['params']['form-feedback_title'],
        'desc' => $index['params']['form-feedback_desc'],
        'image' => $index['params']['form-feedback-img'],
    ]);

    App\Layout\Components\Common\Seo\Layout::draw([
        'seo-title' => $this->case->seo_title,
        'seo-desc' => $this->case->seo_desc,
        'seo2-title' => $this->case->seo2_title,
        'seo2-desc' => $this->case->seo2_desc,
    ]);
    ?>
</main>

<?php App\Layout\Components\Common\Footer\Layout::draw(); ?>