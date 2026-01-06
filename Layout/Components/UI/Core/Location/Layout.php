<?php

namespace App\Layout\Components\UI\Core\Location;

use App\Layout\LayoutBase;

class Layout extends LayoutBase
{
    public static function drawLocation(
        string             $className = '',
        string             $title = '',
        string             $subtitle = '',
        LocationTheme      $theme = LocationTheme::Light,
        array              $options = [],
        array              $attributes = []
    ): void
    {
        static::draw(compact(
                'className',
                'title',
                'subtitle',
                'options',
                'attributes'
            ) + [
                'theme' => $theme->value,
            ]
        );
    }
}