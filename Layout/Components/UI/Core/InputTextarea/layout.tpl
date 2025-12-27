<?php
/** @var array $data */

$inputClasses = [
	'input-textarea',
	"input-textarea-pos_{$data['labelPos']}",
	"input-textarea-style_{$data['style']}",
	"input-textarea-size_{$data['size']}",
	"input-textarea-theme_{$data['theme']}",
	$data['className'] ?? ''
];
?>

<div class="<?= implode(' ', $inputClasses) ?>">
	<div class="input-textarea__wrapper">
		<?php if ($data['labelPos'] === 'standard'): ?>
			<label class="input-textarea__label" for="<?= $data['id'] ?>">
				<?= $data['labelText'] ?>
			</label>
		<?php endif; ?>

		<div class="input-textarea__input-container">
			<textarea class="input-textarea__field" id="<?= $data['id'] ?>" <?= buildAttrs($data['attributes']) ?>><?= $data['text'] ?></textarea>
		</div>
		<span class="input-textarea__error-message hidden"></span>
	</div>
</div>