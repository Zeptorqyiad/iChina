<?php
/** @var array $content */

App\Layout\Components\Common\Header\Layout::draw();
?>

<main>
    <?php
    App\Layout\Components\UI\Core\BreadCrumbs\Layout::draw();

    App\Layout\Components\Common\DocumentContent\Layout::draw([
        'text' => $this->document->text ?? 'Длиный текст',
    ]);
    ?>
</main>

<?php App\Layout\Components\Common\Footer\Layout::draw(); ?>