<?php
/** @var array $data */

?>

<section class="case-article <?= $data['className'] ?>">
    <div class="case-article__container">
        <div class="case-article__content case-content">\
            <?php if ($data['nav-title'] || $data['link']): ?>
                <div class="case-content__navigation">
                    <h4 class="case-content__navigation--title">
                        <?= $data['nav-title'] ?>
                    </h4>
                    <?php foreach ($data['link'] as $i): ?>
                        <a href="<?= $i['link'] ?>" class="case-content__navigation--link">
                            <?= $i['title'] ?>
                        </a>
                    <?php endforeach; ?>
                </div>
            <?php endif; ?>

            <?php if ($data['tini']): ?>
                <h3 class="case-content__tini content">
                    <?= $data['tini'] ?>
                </h3>
            <?php endif; ?>

            <!-- Вторая секция  -->

            <?php if ($data['title-s']): ?>
                <h3 class="case-content__title">
                    <?= $data['title-s'] ?>
                </h3>
            <?php endif; ?>
            <?php if ($data['text-s']): ?>
                <div class="case-content__text">
                    <?= $data['text-s'] ?>
                </div>
            <?php endif; ?>

            <ul class="case-content__steps">
                <?php foreach ($data['steps'] as $i): ?>
                    <li class="case-content__step">
                        <div class="case-content__step--marker">
                            <?= $i['number'] ?>
                        </div>
                        <div class="case-content__step--text">
                            <?= $i['text'] ?>
                        </div>
                    </li>
                <?php endforeach; ?>
            </ul>

            <?php if ($data['text-s-bottom']): ?>
                <div class="case-content__text">
                    <?= $data['text-s-bottom'] ?>
                </div>
            <?php endif; ?>

            <!-- Третья секция  -->

            <?php if ($data['title-third']): ?>
                <h3 class="case-content__title">
                    <?= $data['title-third'] ?>
                </h3>
            <?php endif; ?>
            <?php if ($data['text-third']): ?>
                <div class="case-content__text">
                    <?= $data['text-third'] ?>
                </div>
            <?php endif; ?>

            <?php if ($data['image-third']): ?>
                <img class="case-content__image"
                     src="<?= $data['image-third'] ?>"
                     alt=""
                >
            <?php endif; ?>
            <?php if ($data['desc-third']): ?>
                <div class="case-content__desc">
                    <?= $data['desc-third'] ?>
                </div>
            <?php endif; ?>

            <?php if ($data['image-list']): ?>
                <div class="case-content__list-image">
                    <?php foreach ($data['image-list'] as $i): ?>
                        <img class="case-content__image" src="<?= $i['image'] ?>>" alt="">
                    <?php endforeach; ?>
                </div>
            <?php endif; ?>
            <?php if ($data['desc-third-image']): ?>
                <div class="case-content__desc">
                    <?= $data['desc-third-image'] ?>
                </div>
            <?php endif; ?>

            <?php if ($data['text-third-after']): ?>
                <div class="case-content__text">
                    <?= $data['text-third-after'] ?>
                </div>
            <?php endif; ?>

            <?php if (!empty($data['benefits'])): ?>
                <div class="case-content__benefits">
                    <?php foreach ($data['benefits'] as $i): ?>
                        <div class="case-content__benefit">
                            <h6 class="case-content__benefit--title">
                                <?= $i['title'] ?>
                            </h6>
                            <div class="case-content__benefit--text">
                                <?= $i['text'] ?>
                            </div>
                        </div>
                        <?php App\Layout\Components\UI\Core\Separator\Layout::drawSeparator(
                            orientation: App\Layout\Components\UI\Core\Separator\SeparatorOrientation::Vertical,
                            theme: App\Layout\Components\UI\Core\Separator\SeparatorTheme::Medium,
                        ); ?>
                    <?php endforeach; ?>
                </div>
            <?php endif; ?>

            <!-- Четвертая секция  -->

            <h3 class="case-content__title">
                Отзыв клиента:
            </h3>
            <div class="case-content__text">
                «iChina обеспечила полную прозрачность и соблюдение сроков — мы получили продукт и запуск без стресса».
            </div>
            <div class="case-content__buttons">
                <?php
                    App\Layout\Components\UI\Core\Buttons\Button\Layout::drawButton(
                        text: 'Связаться',
                        style: App\Layout\Components\UI\Core\Buttons\Button\ButtonStyle::Secondary,
                        size: App\Layout\Components\UI\Core\Buttons\Button\ButtonSize::Small,
                    );
                    App\Layout\Components\UI\Core\Buttons\Button\Layout::drawButton(
                        text: 'Связаться',
                        size: App\Layout\Components\UI\Core\Buttons\Button\ButtonSize::Small,
                    );
                ?>
            </div>

            <?php if ($data['video']): ?>
                <div class="case-content__video">
                    <video
                        playsinline
                        loop
                        muted
                        preload="metadata"
                    >
                        <source src="/uf/files/<?= $data['video'] ?>"
                                type="video/<?= pathinfo($data['video'], PATHINFO_EXTENSION) ?>">
                        Ваш браузер не поддерживает видео.
                    </video>
                </div>
            <?php endif; ?>

            <div class="case-content__desc">
                Description
            </div>

            <?php if ($data['video_v']): ?>
                <div class="case-content__video video-vertical">
                    <video
                        playsinline
                        loop
                        muted
                        preload="metadata"
                    >
                        <source src="/uf/files/<?= $data['video_v'] ?>"
                                type="video/<?= pathinfo($data['video_v'], PATHINFO_EXTENSION) ?>">
                        Ваш браузер не поддерживает видео.
                    </video>
                </div>
            <?php endif; ?>
            <div class="case-content__desc">
                Description
            </div>
            <div class="case-content__text">
                Текст
            </div>
            <div class="case-content__date">
                21.02.2024
            </div>
        </div>

        <div class="case-article__buttons">
            <?php
            App\Layout\Components\UI\Core\Buttons\Button\Layout::drawButton(
                className: 'case-article__button',
                text: 'Назад',
                icon: 'arrow-left',
                style: App\Layout\Components\UI\Core\Buttons\Button\ButtonStyle::Secondary,
                attributes: [
                    'onclick' => "event.preventDefault();history.back();"
                ]
            ); ?>
        </div>
    </div>
</section>
