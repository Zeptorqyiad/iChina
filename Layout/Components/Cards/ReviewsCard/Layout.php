<?php

namespace App\Layout\Components\Cards\ReviewsCard;

use App\Layout\LayoutBase;

class Layout extends LayoutBase
{
    public static function drawReviewsCard(
        string           $className = '',
        int              $reviews_id = 0,
        string           $title = '',
        string           $text = '',
        string           $badge = '',
        string           $photo = '',
        string           $photoMob = '',
        string           $video = '',
        string           $video_h = '',
        string           $video_v = '',
        string           $path = '',

        array            $attributes = []
    ): void
    {
        static::draw(compact(
                'className',
                'reviews_id',
                'title',
                'text',
                'badge',
                'photo',
                'video',
                'video_h',
                'video_v',
                'photoMob',
                'path',
                'attributes'
            )
        );
    }
}