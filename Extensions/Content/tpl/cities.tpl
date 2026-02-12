<?php
/** @var array $content */
$index = $content->loadFrom('/');

App\Layout\Components\Common\Header\Layout::draw();
?>

<main>
    <?php
    App\Layout\Components\UI\Core\BreadCrumbs\Layout::draw();

    App\Layout\Components\Common\PageHeading\Layout::drawPageHeading(
        backButton: false,
        style: App\Layout\Components\Common\PageHeading\PageHeadingStyle::Secondary
    );

    App\Layout\Components\Common\InfoSection\Layout::draw([
        'text' => self::getTableFrom('cities_page_text', $content),
        'is_form_active' => $content['params']['cities_form_active'],
        'form_title' => $content['params']['cities_form_title'] ?: $index['params']['form-feedback_title'],
        'form_desc' => $content['params']['cities_form_desc'] ?: $index['params']['form-feedback_desc'],
    ]);
    ?>
</main>

<?php App\Layout\Components\Common\Footer\Layout::draw(); ?>