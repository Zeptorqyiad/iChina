<?php
/** @var array $data */


?>

<section class="blog-content">
    <div class="blog-content__container container">
        <div class="blog-content__section">
            <?php
//                App\Layout\Components\UI\Core\Tab\Layout::drawTab(
//                    className: 'blog-content__section-modal',
//                    text: 'Все категории',
//                    iconLeft: 'filter',
//                    style: App\Layout\Components\UI\Core\Tab\TabStyle::Secondary,
//                    size: App\Layout\Components\UI\Core\Tab\TabSize::Large,
//                    attributes: [
//                        'onclick' => 'modalManager.open("categories-modal");'
//                    ]
//                );
                App\Layout\Components\Layout\Blog\MediaFilter\Layout::draw([
                    'className' => 'media-filter__content',
                    'cats' => $data['cats'],
                ]);
            ?>

            <div class="blog-content__article">
                <?php
                    App\Layout\Components\UI\Other\Pagination\Layout::drawPages(
                        $data['page'],
                        $data['pages'],
                    );
                ?>

                <ul class="blog-content__list">
                    <?php foreach ($data['cards'] as $item): ?>
                        <li class="blog-content__item">
                            <?php
                            $cat = $item->category->name;
                            App\Layout\Components\Layout\Blog\MediaCard\Layout::drawMediaCard(
                                className: 'blog-content__media-card',
                                blog_id: $item['blog_id'],
                                title: $item['name'],
                                text: $item['short'] ?? '',
                                badge: $cat ?? '',
                                photo: $item['photo'] ?? '',
                                photoMob: $item['photo_mob'] ?? '',
                                video: $item['video'] ?? '',
                                video_h: $item['video_horizontal'] ?? '',
                                video_v: $item['video_vertical'] ?? '',
                                likes: $item['likes'] ?? 0,
                                views: $item['views'],
                                path: $item['alias'],
                            );
                            ?>
                        </li>
                    <?php endforeach; ?>

                    <?php
                        App\Layout\Components\UI\Core\Separator\Layout::drawSeparator();
                    ?>
                </ul>

                <?php
                    App\Layout\Components\UI\Other\Pagination\Layout::drawPages(
                        $data['page'],
                        $data['pages'],
                    );
                ?>
            </div>
        </div>
    </div>
</section>
