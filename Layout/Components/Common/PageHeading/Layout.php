<?php

namespace App\Layout\Components\Common\PageHeading;

use App\Layout\LayoutBase;

class Layout extends LayoutBase
{
    public static function drawPageHeading(
        string             $className = '',
        bool               $backButton = true,
		string             $count = '',
        PageHeadingStyle   $style = PageHeadingStyle::Primary
    ): void
    {
        static::draw(compact(
                'className',
                'backButton',
				'count',
            )+ [
                'style' => $style->value
            ]
        );
    }
}