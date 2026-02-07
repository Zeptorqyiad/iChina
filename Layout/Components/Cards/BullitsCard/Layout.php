<?php

namespace App\Layout\Components\Cards\BullitsCard;

use App\Layout\LayoutBase;

class
Layout extends LayoutBase
{
    public static function drawBullitsCard(
        string               $className = '',
        string               $title = '',
        string               $desc = '',
        array                $bullits = [],
        array                $text = [],
        BullitsCardTheme     $theme = BullitsCardTheme::Light
    ): void
    {
        static::draw(compact(
            'className',
            'title',
            'desc',
            'bullits',
            'text',
            ) + [
                'theme' => $theme->value,
            ]
        );
    }
}