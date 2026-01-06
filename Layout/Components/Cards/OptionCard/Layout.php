<?php

namespace App\Layout\Components\Cards\OptionCard;

use App\Layout\LayoutBase;

class
Layout extends LayoutBase
{
    public static function drawOptionCard(
        string             $className = '',
        string             $title = '',
        string             $image = '',
        string             $desc = '',
        string             $text = '',
        string             $link = '',
        array              $attributes = []
    ): void
    {
        static::draw(compact(
                'className',
                'title',
                'image',
                'desc',
                'text',
                'link',
                'attributes'
            )
        );
    }
}