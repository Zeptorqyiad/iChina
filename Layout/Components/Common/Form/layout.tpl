<?php
/** @var array $data */

$formId = uniqid('form_');
?>

<form id="<?= $formId ?>"
      class="form <?= $data['className'] ?? '' ?>" <?= buildAttrs($data['attributes'] ?? []) ?>
      enctype="multipart/form-data"
      method="post"
>
    <div class="form__inputs">
        <?php
            App\Layout\Components\UI\Core\TextInput\Layout::drawInput(
                className: 'form__text-input form__text-input--name item-a',
                labelText: 'Имя*',
                labelPos: App\Layout\Components\UI\Core\TextInput\TextInputLabelPos::Standard,
                id: $formId . '_name',
                attributes: [
                    'name' => 'name',
                    'type' => 'text',
                    'required' => 'true',
                    'placeholder' => 'Иван',
                    'autocomplete' => 'given-name',
                ]
            );
            App\Layout\Components\UI\Core\TextInput\Layout::drawInput(
                className: 'form__text-input form__text-input--phone item-b',
                labelText: 'Телефон*',
                labelPos: App\Layout\Components\UI\Core\TextInput\TextInputLabelPos::Standard,
                id: $formId . '_phone',
                attributes: [
                    'name' => 'phone',
                    'type' => 'tel',
                    'placeholder' => '+7 (999) 999-99-99',
                    'required' => 'true',
                    'autocomplete' => 'tel',
                ]
            );
            App\Layout\Components\UI\Core\TextInput\Layout::drawInput(
                className: 'form__text-input form__text-input--email item-c',
                labelText: 'E-mail',
                labelPos: App\Layout\Components\UI\Core\TextInput\TextInputLabelPos::Standard,
                id: $formId . '_email',
                attributes: [
                    'name' => 'email',
                    'type' => 'email',
                    'placeholder' => 'example@example.ru',
                    'autocomplete' => 'email',
                ]
            );
            App\Layout\Components\UI\Core\InputTextarea\Layout::drawInputTextarea(
                className: 'form__text-input form__text-input--textarea item-d',
                id: $formId . '_textarea',
                labelText: 'Комментарий',
                labelPos: App\Layout\Components\UI\Core\InputTextarea\InputTextareaLabelPos::Standard,
                attributes: [
                    'name' => 'textarea',
                    'type' => 'textarea',
                    'placeholder' => 'Что вас интересует?',
                ]
            );
        ?>
    </div>

    <div class="form__controls">
        <?php
        App\Layout\Components\UI\Core\Checkbox\Layout::drawCheckbox(
            policy: true,
            attributes: [
                'id' => $formId . '_policy',
                'required' => 'true',
                'type' => 'checkbox'
            ]
        );

        App\Layout\Components\UI\Core\Buttons\Button\Layout::drawButton(
            className: 'form__button-submit',
            text: 'Отправить заявку',
            loader: true,
            attributes: [
                'type' => 'submit',
                'onclick' => $data['nonModal'],
            ]
        );
        ?>
    </div>
</form>