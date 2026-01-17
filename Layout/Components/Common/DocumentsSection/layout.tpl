<?php
/** @var array $data */
?>

<section class="documents-section">
    <?php App\Layout\Components\Common\NavList\Layout::draw(); ?>

    <div class="documents-section__container container ">
        <?php App\Layout\Components\Common\NavSticky\Layout::draw(); ?>

        <div class="documents-section__body documents-container">
            <h2 class="document-section__body--title uppercase">
                Юридические документы
            </h2>
            <div class="document-section__body--subtitle">
                Здесь вы можете ознакомиться с корпоративной документацией компании ICHINA,
                нашими юридическими обязательствами и образцами рабочих результатов.
                Эта страница отражает нашу приверженность прозрачности, соблюдению закона и профессиональному подходу к каждому проекту.
            </div>

            <div class="documents-section__items">
                <div class="document-section__item">
                    <h3 class="document-section__item--title">
                        Правовые документы и политики компании
                    </h3>

                    <div class="documet-section__grid">
                        <?php App\Layout\Components\Cards\CategoryCard\Layout::drawCategoryCard(
                            link: '/documents/document/',
                            title: 'Политика конфиденциальности',
                            icon: 'file',
                        ); ?>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>