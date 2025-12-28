<?php

namespace App\Layout\Components\Common\PageHeading;

use App\Layout\LayoutBase;

class Layout extends LayoutBase
{
    public static function drawPageHeading(
        string             $className = '',
		string             $count = '',
        PageHeadingStyle   $style = PageHeadingStyle::Primary
    ): void
    {
        static::draw(compact(
                'className',
				'count',
            )+ [
                'style' => $style->value
            ]
        );
    }
}