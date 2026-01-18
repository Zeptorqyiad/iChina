<?php
/** @var array $data */

$collapsibleClasses = [
    'collapsible',
    $data['className'] ?? ''
];
?>

<div class="<?= implode(' ', $collapsibleClasses) ?>">
    <?php App\Layout\Components\UI\Core\Tab\Layout::drawTab(
        className: 'collapsible__trigger',
        text: $data['text'] ?? '',
        iconRight: 'chevron-down-sm',
        badge: $data['badge'] ?? '',
        style: App\Layout\Components\UI\Core\Tab\TabStyle::Secondary,
        size: App\Layout\Components\UI\Core\Tab\TabSize::Small,
    ); ?>

    <ul class="collapsible__menu">
        <?php foreach ($data['options'] as $i): ?>
            <li class="collapsible__option" role="menuitem" data-value="<?= $i['value'] ?>">
                <?php App\Layout\Components\UI\Core\Tab\Layout::drawTab(
                    className: 'collapsible__link',
                    text: $i['text'] ?? '',
                    link: ($data['serviceRoute'] === true ? '/services' : '') . ($i['link'] ?? ''),
                    iconRight: $i['iconRight'] ?? '',
                    badge: $i['badge'] ?? '',
                    style: App\Layout\Components\UI\Core\Tab\TabStyle::Secondary,
                    size: App\Layout\Components\UI\Core\Tab\TabSize::Small,
                ); ?>
            </li>
        <?php endforeach; ?>

        <?php if ($data['link']): ?>
            <li class="collapsible__option">
                <?php App\Layout\Components\UI\Core\Buttons\Button\Layout::drawButton(
                    className: 'collapsible__show-all',
                    text: 'Вся категория',
                    link: $data['link'],
                    icon: 'home',
                    style: \App\Layout\Components\UI\Core\Buttons\Button\ButtonStyle::Secondary,
                    size: \App\Layout\Components\UI\Core\Buttons\Button\ButtonSize::Small,
                ); ?>
            </li>
        <?php endif; ?>
    </ul>
</div>
