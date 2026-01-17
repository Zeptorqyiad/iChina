<?php

namespace App\Layout\Components\Common\InfoSection;

use App\Layout\LayoutBase;

class Layout extends LayoutBase
{
    public static function drawInfoSection(
        string $className = '',
        string $text = '',
    ): void
    {
        static::draw(compact(
                'className',
                'text',
            ) + [

            ]
        );
    }
}