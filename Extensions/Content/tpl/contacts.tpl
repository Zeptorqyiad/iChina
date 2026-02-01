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

    App\Layout\Components\Common\Contacts\Layout::draw([
        'items' => self::getTableFrom('contacts-items', $content),
    ]);

    App\Layout\Components\Common\FormFeedback\Layout::draw([
        'title' => $content['params']['contacts_form-title'] ?: $index['params']['form-feedback_title'],
        'desc' => $content['params']['contacts_form-desc'] ?: $index['params']['form-feedback_desc'],
        'image' => $content['params']['contacts_form-image'] ?: $index['params']['form-feedback-img'],
    ]);
    ?>
</main>

<?php App\Layout\Components\Common\Footer\Layout::draw(); ?>
