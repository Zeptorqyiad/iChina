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

    App\Layout\Components\Common\Contacts\Layout::draw();

    App\Layout\Components\Common\FormFeedback\Layout::draw([
        'title' => $index['params']['form-feedback_title'] ?? 'Обратная связь',
        'desc' => $index['params']['form-feedback_desc'] ?? 'Оставьте заявку, чтобы получить консультацию',
        'image' => $index['params']['form-feedback-img'] ?? '/assets/images/Main/Form.png',
    ]);
    ?>
</main>

<?php App\Layout\Components\Common\Footer\Layout::draw(); ?>
