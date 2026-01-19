document.addEventListener('DOMContentLoaded', () => {
    const modal = document.querySelector('.service-modal')
    const header = document.querySelector('.header')

    if (!modal || !header) return

    function updateHeaderClass() {
        if (modal.classList.contains('active')) {
            header.classList.add('over-modal', 'modal-open')
        } else {
            header.classList.remove('over-modal', 'modal-open')
        }
    }

    updateHeaderClass()

    const observer = new MutationObserver((mutations) => {
        mutations.forEach((mutation) => {
            if (mutation.attributeName === 'class') {
                updateHeaderClass()
            }
        })
    })

    observer.observe(modal, {
        attributes: true,
        attributeFilter: ['class']
    })

    document.addEventListener('click', (e) => {
        if (e.target === modal) {
            setTimeout(updateHeaderClass, 10)
        }

        if (e.target.closest('.modal-close')) {
            setTimeout(updateHeaderClass, 10)
        }
    })
})