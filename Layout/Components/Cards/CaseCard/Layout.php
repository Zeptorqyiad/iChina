<?php

namespace App\Layout\Components\Cards\CaseCard;

use App\Layout\LayoutBase;

class Layout extends LayoutBase
{
    public static function drawCaseCard(
        string             $className = '',
        string             $name = '',
        string             $short = '',
        string             $photo = '',
        string             $link = '',
        string             $badge = '',
        $badgeStyle = null,
        array              $attributes = []
    ): void
    {
        static::draw(compact(
                'className',
                'name',
                'short',
                'photo',
                'link',
                'badge',
                'badgeStyle',
                'attributes'
            )
        );
    }
}
