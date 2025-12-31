<?php
/** @var array $data */

?>

<section class="video-page">
    <div class="video-page__container container">
        <div class="video-container">
            <?php if($data['video_h']): ?>
                <div class="blog-card__video horizontal-video">
                    <iframe src="<?= $data['video_h'] ?>"
                            allow="autoplay; encrypted-media; fullscreen; picture-in-picture; screen-wake-lock;"
                            frameborder="0"
                            allowfullscreen>
                    </iframe>
                </div>
            <?php elseif ($data['video_v']): ?>
                <div class="blog-card__video vertical-video">
                    <iframe src="<?= $data['video_v'] ?>"
                            allow="autoplay; encrypted-media; fullscreen; picture-in-picture; screen-wake-lock;"
                            frameborder="0"
                            allowfullscreen>
                    </iframe>
                </div>
            <?php elseif ($data['video']): ?>
                <video class="blog-card__video horizontal-video"
                       autoplay
                       playsinline
                       muted
                       loop
                       preload="metadata"
                >
                    <source src="/uf/files/<?= $data['video'] ?>" type="video/<?= pathinfo($data['video'], PATHINFO_EXTENSION) ?>">
                    Ваш браузер не поддерживает видео.
                </video>
            <?php endif; ?>
        </div>

        <div class="video-page__text">
            <h1 class="video-page__title">
                <?= $data['title'] ?>
            </h1>
            <p class="video-page__desc">
                <?= $data['description'] ?>
            </p>
        </div>
    </div>
</section>
