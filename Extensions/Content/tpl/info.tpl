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
            'nav-title' => $content['params']['info_nav-title'],
            'link' => self::getTableFrom('info_nav-link', $content),
            'main-title' => $content['params']['info_main-title'],
            'main-text' => $content['params']['info_main-text'],
            'main-card' => $content['params']['info_main-card'],
            'text' => self::getTableFrom('info_page_text', $content),
            'is_form_active' => $content['params']['info_form_active'],
        ]);
    ?>
</main>

<?php App\Layout\Components\Common\Footer\Layout::draw(); ?>