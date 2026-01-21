<?php

namespace App\Layout\Components\Cards\BannerCard;

use App\Layout\LayoutBase;

class Layout extends LayoutBase
{
    public static function drawBannerCard(
        string       $className = '',
        string       $title = '',
        string       $text = '',
        string       $buttonText = '',
        string       $buttonLink = '',
        array        $attributes = []
    ): void
    {
        static::draw(compact(
                'className',
                'title',
                'text',
                'buttonText',
                'buttonLink',
                'attributes'
            )
        );
    }
}