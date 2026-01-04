<?php

namespace App\Layout\Components\Layout\Blog\MediaCard;

use App\Layout\LayoutBase;

class Layout extends LayoutBase
{
    public static function drawMediaCard(
        string           $className = '',
        int              $blog_id = 0,
        string           $title = '',
        string           $text = '',
        string           $badge = '',
        string           $photo = '',
        string           $photoMob = '',
        string           $video = '',
        string           $video_h = '',
        string           $video_v = '',
        string           $likes = '' ?? 0,
        int              $views = 0,
        string           $path = '',

        array            $attributes = []
    ): void
    {
        static::draw(compact(
                'className',
                'blog_id',
                'title',
                'text',
                'badge',
                'photo',
                'video',
                'video_h',
                'video_v',
                'photoMob',
                'likes',
                'views',
                'path',
                'attributes'
            )
        );
    }
}