<?php

namespace App\Layout\Components\Cards\AccentCard;

use App\Layout\LayoutBase;

class Layout extends LayoutBase
{
    public static function drawAccentCard(
        string $className = '',
        string $text = '',
        string $icon = '',
        string $desc = '',
        array  $attributes = []
    ): void
    {
        static::draw(compact(
                'className',
                'text',
                'icon',
                'desc',
                'attributes'
            )
        );
    }
}