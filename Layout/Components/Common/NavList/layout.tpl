<?php
/** @var array $data */

use Simflex\Core\Container;

$navListLinks = [
    [
        'text' => 'Частые вопросы',
        'link' => '/faq/',
    ], [
        'text' => 'Гарантии',
        'link' => '/guarantees/',
    ],  [
        'text' => 'Глоссарий',
        'link' => '/glossary/',
    ], [
        'text' => 'Политика конфиденциальности',
        'link' => '/privacy-policy/'
    ]
];

$tabs = !empty($data['tabs']) ? $data['tabs'] : $navListLinks;

?>

<nav class="nav-list <?= $data['className'] ?? '' ?>">
    <div class="nav-list__container">
        <div class="nav-list__tabs">
            <?php foreach ($tabs as $tab) {
                App\Layout\Components\UI\Core\Tab\Layout::drawTab(
                    className: 'nav-list__tab' . ($tab['className']) . (str_contains($_SERVER['REQUEST_URI'], $tab['link']) ? ' active' : ''),
                    text: $tab['text'] ?? '',
                    link: $tab['link'] ?? '',
                    style: App\Layout\Components\UI\Core\Tab\TabStyle::Secondary,
                    size: App\Layout\Components\UI\Core\Tab\TabSize::Large,
                );
            } ?>
        </div>
    </div>
</nav>
