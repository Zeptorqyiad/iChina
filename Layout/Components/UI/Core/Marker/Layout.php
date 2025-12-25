<?php

namespace App\Layout\Components\UI\Core\Marker;

use App\Layout\LayoutBase;

class Layout extends LayoutBase
{
    public static function drawMarker(
        string     $className = '',
        string     $icon = 'true',
		string     $img = '',
        MarkerSize $size = MarkerSize::Medium,
        array      $attributes = []
    ): void
    {
        static::draw(compact(
                'className',
                'icon',
				'img',
                'attributes'
            ) + [
                'size' => $size->value,
            ]
        );
    }
}