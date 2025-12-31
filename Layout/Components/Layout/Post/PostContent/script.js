document.addEventListener('DOMContentLoaded', () => {
    const items = document.querySelectorAll('.feedback-group');

    items.forEach(group => {
        if (group.dataset.init) {
            return;
        }

        group.dataset.init = true;
        const id = group.dataset.id;
        const path = group.dataset.path;
        const type = group.dataset.type;
        const like = group.querySelector('.feedback-btn[data-action="like"]');

        const likeValue = like.querySelector('.feedback-btn__value');

        let voted = null;

        if (localStorage.getItem(`${path}.${type}.likes.${id}`)) {
            like.classList.add('feedback-btn_active');
            voted = 'like';
        }

        like.addEventListener('click', (ev) => {
            ev.stopPropagation();

            if (voted === 'like') {
                like.classList.remove('feedback-btn_active');
                const newLikeCount = parseInt(likeValue.textContent) - 1;
                likeValue.textContent = `${newLikeCount}`;

                makeFeedback(id, '1', 'unset')
                    .then(() => {
                        localStorage.removeItem(`${path}.${type}.likes.${id}`);
                        console.log('Like removed successfully');
                    })
                    .catch((err) => {
                        console.error('Like removal failed:', err);
                        like.classList.add('feedback-btn_active');
                        likeValue.textContent = `${newLikeCount + 1}`;
                    });

                voted = null;
            }
            else if (!voted) {
                like.classList.add('feedback-btn_active');
                const newLikeCount = parseInt(likeValue.textContent) + 1;
                likeValue.textContent = `${newLikeCount}`;

                makeFeedback(id, '1', 'like')
                    .then(() => {
                        localStorage.setItem(`${path}.${type}.likes.${id}`, '1');
                        console.log('Like saved successfully');
                    })
                    .catch((err) => {
                        console.error('Like failed:', err);
                        like.classList.remove('feedback-btn_active');
                        likeValue.textContent = `${newLikeCount - 1}`;
                    });

                voted = 'like';
            }
        });
    });
})