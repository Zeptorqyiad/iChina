document.addEventListener('DOMContentLoaded', () => {
    const header = document.querySelector('.header')

    if (!header) return

    function handleScroll() {
        if (window.scrollY > 10) {
            header.classList.add('scrolled')
        } else {
            header.classList.remove('scrolled')
        }
    }

    document.addEventListener('scroll', handleScroll);
})