<?php
/** @var array $data */

$cats = App\Extensions\Site\Model\DocumentsCategory::findAdv()->all();
?>

<section class="documents-section">
    <?php App\Layout\Components\Common\NavList\Layout::draw(); ?>

    <div class="documents-section__container container ">
        <?php App\Layout\Components\Common\NavSticky\Layout::draw(); ?>

        <div class="documents-section__body content documents-container">
            <?php if ($data['nav-title'] || $data['link']): ?>
                <div class="documents-section__anchor">
                    <h4 class="documents-section__anchor--title">
                        <?= $data['nav-title'] ?>
                    </h4>
                    <?php foreach ($data['link'] as $i): ?>
                        <a href="#<?= $i['link'] ?>" class="documents-section__anchor--link">
                            <?= $i['title'] ?>
                        </a>
                    <?php endforeach; ?>
                </div>
            <?php endif; ?>

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
                        <div class="documents-section__item" id="<?= $c->anchor ?>">
                            <h3 class="documents-section__item--title">
                                <?= $c->name ?>
                            </h3>

                            <div class="documents-section__grid">
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