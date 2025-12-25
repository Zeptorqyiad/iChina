<?php

namespace App\Layout\Components\Cards\StepCard;

use App\Layout\LayoutBase;

class Layout extends LayoutBase
{
    public static function drawStepCard(
        string           $className = '',
        string           $title = '',
        string           $descr = '',
        string           $icon = '',
        string           $number = '',
        StepCardStyle    $style = StepCardStyle::Outline,
        string           $button = '',
        array            $attributes = []
    ): void
    {
        static::draw(compact(
                'className',
                'title',
                'descr',
                'icon',
                'number',
                'button',
                'attributes'
            ) + [
                'style' => $style->value
            ]
        );
    }
}