<?php
/**
 * @var array $data
 */

$parsedText = json_decode($data['text'], true);
?>

<section class="documents-section wrapper">
    <?php App\Layout\Components\Common\PageHeading\Layout::drawPageHeading(
            style: App\Layout\Components\Common\PageHeading\PageHeadingStyle::Secondary
    ); ?>

    <div class="documents-section--text content">
        <?php foreach ($parsedText['v'] as $item): ?>
            <?php if (!empty($item['anchor'])): ?>
                <a id="<?= htmlspecialchars($item['anchor']) ?>"
                   class="documents-section--anchor">
                    <?= $item['anchor'] ?>
                </a>
            <?php endif; ?>

            <?php if (!empty($item['title'])): ?>
                <h2>
                    <?= htmlspecialchars($item['title']) ?>
                </h2>
            <?php endif; ?>

            <?php if (!empty($item['text'])): ?>
                <div class="document-text">
                    <?= $item['text'] ?>
                </div>
            <?php endif; ?>
        <?php endforeach; ?>
    </div>
</section>