<?php
/** @var array $data */

?>

<section class="video-page">
    <div class="video-page__container container">
        <div class="video-container">
            <?php if($data['video_h']): ?>
                <div class="blog-card__video horizontal-video">
                    <?= $data['video_h'] ?>
                </div>
            <?php elseif ($data['video_v']): ?>
                <div class="blog-card__video vertical-video">
                    <?= $data['video_v'] ?>
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
