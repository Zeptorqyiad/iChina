<?php

namespace App\Layout\Components\UI\Core\InputTextarea;

use App\Layout\LayoutBase;

class Layout extends LayoutBase
{
	public static function drawInputTextarea(
		string                $className = '',
		string                $id = '',
		string                $labelText = '',
		string                $text = '',
		InputTextareaLabelPos $labelPos = InputTextareaLabelPos::Hidden,
		InputTextareaStyle    $style = InputTextareaStyle::Filled,
		InputTextareaSize     $size = InputTextareaSize::Medium,
		InputTextareaTheme    $theme = InputTextareaTheme::Light,
		array                 $attributes = []
	): void
	{
		static::draw(compact('className', 'id', 'labelText', 'text', 'attributes') + [
				'style' => $style->value,
				'labelPos' => $labelPos->value,
				'size' => $size->value,
				'theme' => $theme->value,
			]);
	}
}

?>