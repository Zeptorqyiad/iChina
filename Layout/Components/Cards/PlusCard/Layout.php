<?php

namespace App\Layout\Components\Cards\PlusCard;

use App\Layout\LayoutBase;

class Layout extends LayoutBase
{
    public static function drawPlusCard(
        string      $className = '',
        string      $text = '',
        string      $icon = '',
        array       $attributes = []
    ): void
    {
        static::draw(compact(
            'className',
            'text',
            'icon',
            'attributes'
        ));
    }
}