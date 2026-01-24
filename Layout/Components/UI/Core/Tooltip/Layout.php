<?php

namespace App\Layout\Components\UI\Core\Tooltip;

use App\Layout\LayoutBase;

class Layout extends LayoutBase
{
    public static function drawTooltip(
        string             $className = '',
        string             $title = '',
        string             $subtitle = '',
        TooltipTheme       $theme = TooltipTheme::Light,
        TooltipPosition    $position = TooltipPosition::Bottom,
        TooltipSide        $side = TooltipSide::Center,
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
                'position' => $position->value,
                'side' => $position->value
            ]
        );
    }
}