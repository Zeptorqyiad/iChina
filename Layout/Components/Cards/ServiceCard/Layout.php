<?php

namespace App\Layout\Components\Cards\ServiceCard;

use App\Layout\LayoutBase;

class Layout extends LayoutBase
{
    public static function drawServiceCard(
        string               $className = '',
        string               $title = '',
        string               $desc = '',
        string               $link = '',
		string               $image = '',
		ServiceCardStyle     $style = ServiceCardStyle::Main,
        array                $attributes = []
    ): void
    {
        static::draw(compact(
                'className',
                'title',
                'desc',
                'link',
				'image',
                'attributes'
            )+ [
				'style' => $style->value,
            ]
        );
    }
}