<?php
/** @var array $data */

$cats = App\Extensions\Site\Model\DocumentsCategory::findAdv()->all();
?>

<section class="documents-section">
    <?php App\Layout\Components\Common\NavList\Layout::draw(); ?>

    <div class="documents-section__container container ">
        <?php App\Layout\Components\Common\NavSticky\Layout::draw(); ?>

        <div class="documents-section__body content documents-container">
            <?php if ($data['title']): ?>
                <h2 class="document-section__body--title uppercase">
                    <?= $data['title'] ?>
                </h2>
            <?php endif; ?>
            <?php if ($data['text']): ?>
                <div class="document-section__body--subtitle">
                    <?= $data['text'] ?>
                </div>
            <?php endif; ?>

            <div class="documents-section__items">
                <?php foreach ($cats as $c): ?>
                    <?php if ($children = $c->getChildrenDocuments()): ?>
                        <div class="document-section__item">
                            <h3 class="document-section__item--title">
                                <?= $c->name ?>
                            </h3>

                            <div class="documet-section__grid">
                                <?php foreach ($children as $index => $i): ?>
                                    <?php App\Layout\Components\Cards\CategoryCard\Layout::drawCategoryCard(
                                        link: '/documents/' . $i['alias'] . '/',
                                        title: $i['name'],
                                        icon: 'file',
                                    ); ?>
                                <?php endforeach; ?>
                            </div>
                        </div>
                    <?php endif; ?>
                <?php endforeach; ?>
            </div>
        </div>
    </div>
</section>