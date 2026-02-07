<?php

namespace App\Layout\Components\Cards\CallbackCard;

use App\Layout\LayoutBase;

class Layout extends LayoutBase
{
    public static function drawCallbackCard(
        string           $className = '',
        string           $title = '',
        string           $desc = '',
        string           $buttonText = '',
        array            $attributes = []
    ): void
    {
        static::draw(compact(
                'className',
                'title',
                'desc',
                'buttonText',
                'attributes'
            )
        );
    }
}