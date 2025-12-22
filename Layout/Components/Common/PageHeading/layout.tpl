<?php
/** @var array $data */

$pageHeadingClasses = [
    'page-heading',
    $data['className'],
    "page-heading-style_{$data['style']}",
    $data['className'] ?? ''
];

use Simflex\Extensions\Breadcrumbs\Breadcrumbs;

$breadcrumbs = Breadcrumbs::get();
$activeBreadcrumb = Breadcrumbs::getLast();


// Ensure breadcrumbs are re-indexed from 0.
$breadcrumbs = array_values($breadcrumbs);
?>

<div class="<?= implode(' ', $pageHeadingClasses) ?>">
    <div class="page-heading__container container">
        <div class="page-heading__back">
            <?php
                App\Layout\Components\UI\Core\Buttons\Button\Layout::drawButton(
                    className: 'page-heading__button-back',
                    icon: 'arrow-left',
                    style: \App\Layout\Components\UI\Core\Buttons\Button\ButtonStyle::Secondary,
                    attributes: [
                        'onclick' => 'event.preventDefault(); history.back();',
                    ]
                );
            ?>

            <?php foreach ($breadcrumbs as $breadcrumb): ?>
                <?php if ($activeBreadcrumb['link'] === $breadcrumb['link']): ?>
                    <p class="page-heading__back-title"><?= $breadcrumb['name'] ?></p>
                <?php endif; ?>
            <?php endforeach; ?>
        </div>

        <?php foreach ($breadcrumbs as $breadcrumb): ?>
            <?php if ($activeBreadcrumb['link'] === $breadcrumb['link']): ?>
                <h1 class="page-heading__title "><?= $breadcrumb['name'] ?></h1>
            <?php endif; ?>
        <?php endforeach; ?>
    </div>
</div>