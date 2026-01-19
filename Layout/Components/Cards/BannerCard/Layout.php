<?php

namespace App\Layout\Components\Cards\BannerCard;

use App\Layout\LayoutBase;

class Layout extends LayoutBase
{
    public static function drawBannerCard(
        string       $className = '',
        string       $title = '',
        string       $text = '',
        array        $list = [],
        bool         $buttonCard = true,
        array        $attributes = []
    ): void
    {
        static::draw(compact(
                'className',
                'title',
                'text',
                'list',
                'buttonCard',
                'attributes'
            )
        );
    }
}