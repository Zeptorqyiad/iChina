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
        'company' => $this->case->company,
        'short' => $this->case->short,
    ]);

    App\Layout\Components\Layout\Case\CaseArticle\Layout::draw([
        'content' => $this->case->content
    ]);

    App\Layout\Components\Sliders\CasesSlider\Layout::draw([
        'title' => 'Другие наши кейсы',
        'link' => '/cases/',
    ]);

    App\Layout\Components\Common\Seo\Layout::draw([
            'seo-title' => $this->case->seo_title,
            'seo-desc' => $this->case->seo_desc,
            'seo2-title' => $this->case->seo2_title,
            'seo2-desc' => $this->case->seo2_desc,
    ]);
    ?>
</main>

<?php
App\Layout\Components\Common\Footer\Layout::draw();
?>