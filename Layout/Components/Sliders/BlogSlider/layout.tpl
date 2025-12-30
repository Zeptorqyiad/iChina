<?php
/** @var array $data */

$q = App\Extensions\Blog\Model\Reviews::findAdv();
$items = $q->select('*')
    ->limit(15)
    ->orderBy('date desc')
    ->andWhere(['is_active' => 1])
    ->all();

?>

<section class="blog-slider <?= $data['className'] ?>">
    <h2 class="section-title blog-slider__title title wrapper">
        <?= $data['title'] ?>
    </h2>

    <div class="blog-slider__buttons wrapper">
        <?php
            if ($data['link']) {
                App\Layout\Components\UI\Core\Buttons\Button\Layout::drawButton(
                    className: 'blog-slider__button-link',
                    text: 'Показать все',
                    link: $data['link'],
                    style: \App\Layout\Components\UI\Core\Buttons\Button\ButtonStyle::Gray,
                );
            }
            App\Layout\Components\UI\Core\Buttons\Button\Layout::drawButton(
                className: 'blog-slider__button-prev',
                icon: 'arrow-left',
                style: \App\Layout\Components\UI\Core\Buttons\Button\ButtonStyle::Outline,
            );
            App\Layout\Components\UI\Core\Buttons\Button\Layout::drawButton(
                className: 'blog-slider__button-next',
                icon: 'arrow-right',
                style: \App\Layout\Components\UI\Core\Buttons\Button\ButtonStyle::Outline,
            );
        ?>
    </div>

    <div class="blog-slider__slider-wrap">
        <div class="blog-slider__slider">
            <div class="swiper-wrapper">
                <?php foreach ($items as $i) {
                    $cat = $i->category->name;
                    App\Layout\Components\Cards\BlogCard\Layout::drawBlogCard(
                        className: 'swiper-slide',
                        link: '/blog/' . $i['alias'] . '/',
                        title: $i['name'] ?? '',
                        desc: $i['short'] ?? '',
                        image: $i['photo'] ?? '',
                        date: $i['date'] ?? '',
                        category: $cat,
                    );
                } ?>
            </div>
        </div>
    </div>
</section>
