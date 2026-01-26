<?php
/** @var array $data */

use Simflex\Core\Container;

$navListLinks = [
    [
        'text' => 'Общая информация',
        'link' => '/info/',
    ], [
        'text' => 'Частые вопросы',
        'link' => '/faq/',
    ], [
        'text' => 'Гарантия и безопасность',
        'link' => '/guarantee/',
    ], [
        'text' => 'Глоссарий',
        'link' => '/glossary/',
    ],[
        'text' => 'Инструкция для клиентов',
        'link' => '/instructions/',
    ],[
        'text' => 'Список городов',
        'link' => '/cities/'
    ],[
        'text' => 'Документы',
        'link' => '/documents/',
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
