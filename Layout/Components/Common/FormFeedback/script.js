document.addEventListener('DOMContentLoaded', () => {
    const forms = document.querySelectorAll('.form-feedback__form');

    if (!forms.length) return;

    const validatorsMap = new Map();
    forms.forEach((form) => {
        const validators = [
            new BasicTextValidator(form, '.form__text-input--name input'),
            new PhoneValidator(form, '.form__text-input--phone input'),
        ];
        validatorsMap.set(form, validators);
    });

    forms.forEach((form) => {
        form.addEventListener('submit', async (e) => {
            e.preventDefault();

            const submitBtn = form.querySelector('[type="submit"]');
            const policyCheckbox = form.querySelector('#' + form.id + '_policy');
            const validators = validatorsMap.get(form);

            let isValid = true;
            validators.forEach((validator) => {
                if (!validator.areAllInputsValid()) {
                    isValid = false;
                }
            });

            if (!policyCheckbox || !policyCheckbox.checked) {
                isValid = false;
            }
            if (!isValid) {
                console.warn('Validation failed');
                return;
            }

            toggleLoading(submitBtn, true);

            const fd = new FormData(form);

            try {
                const res = await fetch('/form/', { method: 'POST', body: fd });
                const data = await res.json();

                modalManager.open(data.success ? 'success-modal' : 'error-modal');
            } catch {
                modalManager.open('error-modal');
            } finally {
                toggleLoading(submitBtn, false);
            }
        });
    });

    function toggleLoading(button, isLoading) {
        button.disabled = isLoading;
        if (isLoading) {
            button.classList.add('loading');
        } else {
            button.classList.remove('loading');
        }
    }
});