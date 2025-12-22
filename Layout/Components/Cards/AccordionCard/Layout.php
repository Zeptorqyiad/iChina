<?php

namespace App\Layout\Components\Cards\AccordionCard;

use App\Layout\LayoutBase;

class Layout extends LayoutBase
{
    public static function drawAccordionCard(
        string $className = '',
        string $title = '',
        string $icon = '',
        string $image = '',
        string $provider = '',
        string $city = '',
        string $city2 = '',
        string $city3 = '',
        string $city4 = '',
        string $transportation = '',
        string $transportation2 = '',
        string $transportation3 = '',
        string $transportation4 = '',
        array  $attributes = []
    ): void
    {
        static::draw(compact(
                'className',
                'title',
                'icon',
                'image',
                'provider',
                'city',
                'city2',
                'city3',
                'city4',
                'transportation',
                'transportation2',
                'transportation3',
                'transportation4',
                'attributes'
            ) + [

            ]
        );
    }
}