<?php

namespace App\Layout\Components\Cards\ServiceExampleCard;

use App\Layout\LayoutBase;

class Layout extends LayoutBase
{
    public static function drawServiceExampleCard(
        string           $className = '',
        string           $title = '',
        string           $text = '',
        string           $img = '',
        string           $link = '',
        ServiceExampleCardColor $color = ServiceExampleCardColor::Main,
        array            $attributes = []
    ): void
    {
        static::draw(compact(
                'className',
                'title',
                'text',
                'img',
                'link',
                'attributes'
            ) + [
                'color' => $color->value
            ]
        );
    }
}