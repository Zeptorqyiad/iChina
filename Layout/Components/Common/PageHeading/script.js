document.addEventListener('DOMContentLoaded', () => {
    const link = document.querySelector('.page-heading__back-title')

    if (!link) return

    link.addEventListener('click', (event) => {
        event.preventDefault()
        history.back()
    })
})