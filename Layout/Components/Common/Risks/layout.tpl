<?php
/** @var array $data */

?>

<section class="risks <?= $data['className'] ?>">
    <div class="risks__container container">
        <div class="risks__title">
            <?php
                if ($data['title'] || $data['desc']) {
                    App\Layout\Components\Cards\TitleCard\Layout::drawTitleCard(
                        title: $data['title'] ?? '',
                        titleAccent: $data['titleAccent'] ?? '',
                        desc: $data['desc'] ?? '',
                    );
                }
            ?>
        </div>

        <?php if($data['text']): ?>
            <?php App\Layout\Components\Common\TabList\Layout::draw([
                'text' => $data['text'],
            ]); ?>

            <div class="risks__body">
                <?php App\Layout\Components\Common\TabSticky\Layout::draw([
                    'text' => $data['text'],
                ]); ?>

                <?php foreach($data['text'] as $i): ?>
                    <div class="risks__body-text">
                        <h4 class="risks__body-text-title">
                            <?= $i['title'] ?? '' ?>
                        </h4>
                        <div class="risks__body-text-desc content">
                            <?= $i['desc'] ?? ''?>
                        </div>
                    </div>
                <?php endforeach; ?>
            </div>
        <?php endif; ?>

        <?php if ($data['callback-title']): ?>
            <div class="risks__callback-card">
                <?php
                    App\Layout\Components\UI\Core\Separator\Layout::drawSeparator(
                        className: 'risks__separator',
                    );
                    App\Layout\Components\Cards\CallbackCard\Layout::drawCallbackCard(
                        title: $data['callback-title'],
                        desc: $data['callback-desc'],
                    );
                ?>
            </div>
        <?php endif; ?>
    </div>
</section>