document.addEventListener('DOMContentLoaded', () => {
    const allForms = document.querySelectorAll('.form-feedback__form');

    if (!allForms.length) return;

    const pageTitle = (document.title || '').split('|')[0].trim();
    const pageUrl = window.location.href;

    allForms.forEach((form) => {
        const fromInput = form.querySelector('input[name="from"]');
        const fromUriInput = form.querySelector('input[name="from_uri"]');
        const fromTitleInput = form.querySelector('input[name="from_title"]');

        if (fromInput) fromInput.value = pageUrl;
        if (fromUriInput) fromUriInput.value = pageUrl;
        if (fromTitleInput) fromTitleInput.value = pageTitle;
    });

    const validatorsMap = new Map();
    allForms.forEach((form) => {
        const validators = [
            new BasicTextValidator(form, '.form__text-input--name input'),
            new PhoneValidator(form, '.form__text-input--phone input'),
        ];
        validatorsMap.set(form, validators);
    });

    allForms.forEach((form) => {
        form.addEventListener('submit', async (e) => {
            e.preventDefault();
            if (form.dataset.submitting === '1') {
                return;
            }
            form.dataset.submitting = '1';

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
                form.dataset.submitting = '0';
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
