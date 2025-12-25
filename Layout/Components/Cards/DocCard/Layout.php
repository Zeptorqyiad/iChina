<?php

namespace App\Layout\Components\Cards\DocCard;

use App\Layout\LayoutBase;

class Layout extends LayoutBase
{
    public static function drawDocCard(
        string $className = '',
        string $title = '',
        string $image = '',
        string $groupImages = '',
        array  $attributes = []
    ): void
    {
        static::draw(compact(
                'className',
                'title',
                'image',
                'groupImages',
                'attributes'
            )
        );
    }
}