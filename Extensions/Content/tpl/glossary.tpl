<?php
/** @var array $content */

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
        'nav-title' => $content['params']['glossary_nav-title'],
        'link' => self::getTableFrom('glossary_nav-link', $content),
        'main-title' => $content['params']['glossary_main-title'],
        'main-text' => $content['params']['glossary_main-text'],
        'main-card' => $content['params']['glossary_main-card'],
        'text' => self::getTableFrom('glossary_page_text', $content),
        'is_form_active' => $content['params']['glossary_form_active'],
    ]);
    ?>
</main>

<?php App\Layout\Components\Common\Footer\Layout::draw(); ?>