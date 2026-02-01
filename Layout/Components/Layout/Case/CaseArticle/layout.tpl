<?php
/** @var array $data */

?>

<section class="case-article <?= $data['className'] ?>">
    <div class="case-article__container">
        <div class="case-article__content case-content">
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
                <div class="case-content__tini content">
                    <?= $data['tini'] ?>
                </div>
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
                     src="/uf/images/source/<?= $data['image-third'] ?>"
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
                        <img class="case-content__image"
                             src="<?= $i['image'] ?>"
                             alt="">
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
                    <?php foreach ($data['benefits'] as $index => $i): ?>
                        <div class="case-content__benefit">
                            <h6 class="case-content__benefit--title uppercase">
                                <?= $i['title'] ?>
                            </h6>
                            <div class="case-content__benefit--text">
                                <?= $i['text'] ?>
                            </div>
                        </div>
                        <?php if ($index < 2) {
                            App\Layout\Components\UI\Core\Separator\Layout::drawSeparator(
                                orientation: App\Layout\Components\UI\Core\Separator\SeparatorOrientation::Vertical,
                                theme: App\Layout\Components\UI\Core\Separator\SeparatorTheme::Medium,
                            );
                        }  ?>
                    <?php endforeach; ?>
                </div>
            <?php endif; ?>

            <!-- Четвертая секция  -->

            <?php if ($data['fourth_title']): ?>
                <h3 class="case-content__title">
                    <?= $data['fourth_title'] ?>
                </h3>
            <?php endif; ?>

            <?php if ($data['fourth_text']): ?>
                <div class="case-content__text">
                    <?= $data['fourth_text'] ?>
                </div>
            <?php endif; ?>
            <div class="case-content__buttons">
                <?php
                    if ($data['fourth_button_text_1']) {
                        App\Layout\Components\UI\Core\Buttons\Button\Layout::drawButton(
                            text: $data['fourth_button_text_1'],
                            link: $data['fourth_button_link_1'],
                            style: App\Layout\Components\UI\Core\Buttons\Button\ButtonStyle::Secondary,
                            size: App\Layout\Components\UI\Core\Buttons\Button\ButtonSize::Small,
                        );
                    }
                    if ($data['fourth_button_text_2']) {
                        App\Layout\Components\UI\Core\Buttons\Button\Layout::drawButton(
                            text: $data['fourth_button_text_2'],
                            link: $data['fourth_button_link_2'],
                            size: App\Layout\Components\UI\Core\Buttons\Button\ButtonSize::Small,
                        );
                    }
                ?>
            </div>

            <?php if ($data['video']): ?>
                <div class="case-content__video" data-case-video>
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
                    <button class="case-content__video-play" type="button" aria-label="Play video">
                        <span class="case-content__video-play-circle">
                            <?= renderIcon('play', 'case-content__video-play-icon') ?>
                        </span>
                    </button>
                </div>
            <?php endif; ?>

            <?php if ($data['video_desc']): ?>
                <div class="case-content__desc">
                    <?= $data['video_desc'] ?>
                </div>
            <?php endif; ?>

            <?php if ($data['video_v']): ?>
                <div class="case-content__video video-vertical" data-case-video>
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
                    <button class="case-content__video-play" type="button" aria-label="Play video">
                        <span class="case-content__video-play-circle">
                            <?= renderIcon('play', 'case-content__video-play-icon') ?>
                        </span>
                    </button>
                </div>
            <?php endif; ?>

            <?php if ($data['video_v_desc']): ?>
                <div class="case-content__desc">
                    <?= $data['video_v_desc'] ?>
                </div>
            <?php endif; ?>

            <?php if ($data['video_v_text']): ?>
                <div class="case-content__text">
                    <?= $data['video_v_text'] ?>
                </div>
            <?php endif; ?>

            <?php if ($data['date']): ?>
                <div class="case-content__date">
                    <?= $data['date'] ?>
                </div>
            <?php endif; ?>
        </div>

        <div class="case-article__buttons">
            <?php App\Layout\Components\UI\Core\Buttons\Button\Layout::drawButton(
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
