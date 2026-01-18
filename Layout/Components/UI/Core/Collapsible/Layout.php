<?php

namespace App\Layout\Components\UI\Core\Collapsible;

use App\Layout\LayoutBase;

class Layout extends LayoutBase
{
    public static function drawCollapsible(
        string $className = '',
        string $text = '',
        string $link = '',
        string $badge = '',
        array  $options = [],
        array  $attributes = [],
        bool   $serviceRoute = true,
    ): void
    {
        static::draw(compact(
                'className',
                'text',
                'link',
                'badge',
                'options',
                'attributes',
                'serviceRoute',
            ) + [

            ]
        );
    }
}