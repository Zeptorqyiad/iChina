<?php

namespace App\Layout\Components\Cards\CertificateCard;

use App\Layout\LayoutBase;

class Layout extends LayoutBase
{
    public static function drawCertificateCard(
        string                   $className = '',
        string                   $title = '',
        string                   $text = '',
		string                   $image = '',
		CertificateCardStyle     $style = CertificateCardStyle::Main,
        array                    $attributes = []
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