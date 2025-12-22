<?php

namespace App\Layout\Components\Cards\TitleCard;

use App\Layout\LayoutBase;

class Layout extends LayoutBase {
    public static function drawTitleCard(
        string             $className = '',
        string             $title = '',
		string             $titleAccent = '',
        string             $desc = '',
        bool               $separator = false,
        array              $attributes = []
    ): void
    {
        static::draw(compact(
                'className',
                'title',
				'titleAccent',
                'desc',
                'separator',
                'attributes'
            )
        );
    }
}