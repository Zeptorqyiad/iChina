<?php
/** @var array $content */

App\Layout\Components\Common\Header\Layout::draw();

$raw = json_decode($this->document->text, true);

$prepared = [];

if (!empty($raw['v'][0])) {
    $prepared = [
        'title'  => $raw['v'][0]['title']  ?? '',
        'anchor' => $raw['v'][0]['anchor'] ?? '',
        'text'   => $raw['v'][0]['text']   ?? '',
    ];
}

?>

<main>
    <?php
    App\Layout\Components\UI\Core\BreadCrumbs\Layout::draw();

    App\Layout\Components\Common\DocumentContent\Layout::draw([
        'text' => $prepared,
    ]);
    ?>
</main>

<?php App\Layout\Components\Common\Footer\Layout::draw(); ?>