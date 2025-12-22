<?php

namespace App\Layout\Components\Cards\CategoryCard;

use App\Layout\Components\Cards\BenefitCard\BenefitCardStyle;
use App\Layout\LayoutBase;

class Layout extends LayoutBase
{
    public static function drawCategoryCard(
        string             $className = '',
        string             $link = '',
        string             $title = '',
        string             $icon = '',
        string             $img = '',
        CategoryCardColor  $color = CategoryCardColor::Main,
        CategoryCardStyle  $style = CategoryCardStyle::Primary,
        array              $attributes = []
    ): void
    {
        static::draw(compact(
                'className',
                'link',
                'title',
                'icon',
                'img',
                'attributes'
            ) + [
                'color' => $color->value,
                'style' => $style->value
            ]
        );
    }
}