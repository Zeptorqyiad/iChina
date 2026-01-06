<?php

namespace App\Layout\Components\Cards\BadgeCard;

use App\Layout\LayoutBase;

class
Layout extends LayoutBase
{
    public static function drawBadgeCard(
        string $className = '',
        string $text = '',
        string $icon = '',
        string $image = '',
        string $desc = '',
    ): void
    {
        static::draw(compact(
            'className',
            'text',
            'icon',
            'image',
            'desc',
            )
        );
    }
}