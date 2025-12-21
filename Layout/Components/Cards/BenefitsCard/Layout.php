<?php

namespace App\Layout\Components\Cards\BenefitsCard;

use App\Layout\LayoutBase;

class Layout extends LayoutBase
{
    public static function drawBenefitsCard(
        string               $className = '',
		string               $image = '',
        string               $title = '',
        string               $text = '',
		BenefitsCardStyle    $style = BenefitsCardStyle::Main,
        array                $attributes = []
    ): void
    {
        static::draw(compact(
                'className',
                'title',
                'text',
				'image',
                'attributes'
            )+ [
				'style' => $style->value,
            ]
        );
    }
}