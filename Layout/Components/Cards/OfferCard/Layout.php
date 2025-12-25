<?php

namespace App\Layout\Components\Cards\OfferCard;

use App\Layout\LayoutBase;

class
Layout extends LayoutBase
{
    public static function drawOfferCard(
        string         $className = '',
        string         $title = '',
        string         $desc = '',
        string         $price = '',
        string         $time = '',
        string         $text = '',
        array          $bullits = [],
        array          $attributes = []
    ): void
    {
        static::draw(compact(
                'className',
                'title',
                'desc',
                'price',
                'time',
                'text',
                'bullits',
                'attributes'
            )
        );
    }
}