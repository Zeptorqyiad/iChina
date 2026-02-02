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
            'text' => self::getTableFrom('info_page_text', $content),
        ]);
    ?>
</main>

<?php App\Layout\Components\Common\Footer\Layout::draw(); ?>