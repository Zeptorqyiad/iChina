//!===========================================================
//! MODAL MANAGER
//!===========================================================
/**
 * Class representing a single modal dialog.
 */
class Modal {
    /**
     * Create a modal instance.
     * @param {string} id - The ID of the modal element in the DOM.
     */
    constructor(id) {
        this.id = id;
        this.modalContent = document.getElementById(id);
        if (!this.modalContent) {
            console.error(`Modal content element not found for id: ${id}`);
            return;
        }
        this.isClosing = false;

        // Bind the transition end handler to this instance.
        this.handleTransitionEnd = this.handleTransitionEnd.bind(this);
        this.modalContent.addEventListener('transitionend', this.handleTransitionEnd);
    }

    /**
     * Opens the modal by displaying it and triggering the CSS transition.
     */
    open() {
        if (!this.modalContent) return;
        this.modalContent.style.display = 'block';
        requestAnimationFrame(() => {
            requestAnimationFrame(() => {
                this.modalContent.classList.add('active');
            });
        });
    }

    /**
     * Closes the modal by triggering the CSS transition to fade it out.
     */
    close() {
        if (!this.modalContent || this.isClosing) return;
        this.isClosing = true;
        // Remove the active class to trigger the fade-out transition.
        this.modalContent.classList.remove('active');
    }

    /**
     * Handles the transition end event.
     * Once the modal has finished fading out, it hides the element.
     * @param {TransitionEvent} e - The transition end event.
     */
    handleTransitionEnd(e) {
        if (e.target !== this.modalContent) return;
        if (this.isClosing && !this.modalContent.classList.contains('active')) {
            this.modalContent.style.display = 'none';
            this.isClosing = false;
        }
    }
}

/**
 * Class to manage multiple modals with a common overlay.
 * When opening a new modal while another is open, the current modal closes first,
 * then the new one opens automatically.
 */
class ModalManager {
    constructor() {
        /** @type {Map<string, Modal>} */
        this.modals = new Map();
        /** @type {Modal|null} */
        this.currentModal = null;
        /** @type {string|null} */
        this.queuedModalId = null;
        /** @type {Object|null} */
        this.queuedData = null;

        // Look for the common overlay element. Create it if it doesn’t exist.
        this.overlay = document.getElementById('modal-overlay');
        if (!this.overlay) {
            this.overlay = document.createElement('div');
            this.overlay.id = 'modal-overlay';
            this.overlay.className = 'modal-overlay';
            this.overlay.style.display = 'none';
            document.body.appendChild(this.overlay);
        }

        // Bind event handlers.
        this.handleOverlayTransitionEnd = this.handleOverlayTransitionEnd.bind(this);
        this.handleKeyDown = this.handleKeyDown.bind(this);

        this.overlay.addEventListener('transitionend', this.handleOverlayTransitionEnd);
        this.overlay.addEventListener('click', () => {
            if (this.currentModal) {
                this.close(this.currentModal.id);
            }
        });
        document.addEventListener('keydown', this.handleKeyDown);
    }

    /**
     * Registers a modal with the given ID if not already registered.
     * @param {string} id - The ID of the modal element.
     */
    registerModal(id) {
        if (!this.modals.has(id)) {
            const modal = new Modal(id);
            if (modal.modalContent) {
                this.modals.set(id, modal);
            }
        }
    }

    /**
     * Opens the modal with the specified ID and passes the provided data.
     * @param {string} id - The ID of the modal to open.
     * @param {Object} [data={}] - The dataset to pass to the modal.
     */
    open(id, data = {}) {
        if (this.currentModal && this.currentModal.id !== id) {
            this.queuedModalId = id;
            this.queuedData = data;
            this.close(this.currentModal.id);
            return;
        }
        this.registerModal(id);
        const modal = this.modals.get(id);
        if (!modal) return;

        this.currentModal = modal;

        // Dispatch custom event with the data
        if (modal.modalContent) {
            modal.modalContent.dispatchEvent(new CustomEvent('modalopen', {detail: data}));
        }

        // Show and animate the overlay
        this.overlay.style.display = 'block';
        requestAnimationFrame(() => {
            requestAnimationFrame(() => {
                this.overlay.classList.add('active');
            });
        });

        const scrollEl = document.scrollingElement || document.documentElement;
        scrollEl.style.overflow = 'hidden';
        modal.open();
    }

    /**
     * Closes the modal with the specified ID.
     * @param {string} id - The ID of the modal to close.
     */
    close(id) {
        const modal = this.modals.get(id);
        if (!modal) return;

        modal.close();

        if (!this.queuedModalId) {
            this.overlay.classList.remove('active');
            const scrollEl = document.scrollingElement || document.documentElement;
            scrollEl.style.overflow = '';
        }
        this.currentModal = null;

        const transitionDuration = parseFloat(getComputedStyle(modal.modalContent).transitionDuration) * 1000;
        setTimeout(() => {
            if (this.queuedModalId) {
                const queuedId = this.queuedModalId;
                const queuedData = this.queuedData || {};
                this.queuedModalId = null;
                this.queuedData = null;
                this.open(queuedId, queuedData);
            }
        }, transitionDuration || 300);
    }

    /**
     * Handles the overlay’s transition end event.
     * @param {TransitionEvent} e - The transition end event.
     */
    handleOverlayTransitionEnd(e) {
        if (e.target !== this.overlay) return;
        if (!this.overlay.classList.contains('active')) {
            this.overlay.style.display = 'none';
        }
    }

    /**
     * Handles keydown events.
     * @param {KeyboardEvent} e - The keydown event.
     */
    handleKeyDown(e) {
        if (e.key === 'Escape' && this.currentModal) {
            this.close(this.currentModal.id);
        }
    }
}

// Expose the modalManager globally.
window.modalManager = new ModalManager();

//!===========================================================
//! SWIPER MANAGER
//!===========================================================
/**
 * @class SwiperManager
 * @classdesc Manages Swiper.js slider instances with a singleton pattern.
 * Provides centralized control for creating, retrieving, updating, and destroying Swiper instances.
 * Maintains a registry of all Swiper instances and applies default configuration.
 *
 * @example
 * // Create a new Swiper instance with custom config
 * swiperManager.create('.swiper-container', {
 *   direction: 'vertical',
 *   pagination: { el: '.swiper-pagination' }
 * });
 */
class SwiperManager {
    /**
     * @constructor
     * @description Initializes a new SwiperManager with default configuration.
     * Creates an empty Map to track Swiper instances.
     */
    constructor() {
        /**
         * @member {Map} instances
         * @description Map storing active Swiper instances with CSS selectors as keys
         * @memberof SwiperManager
         */
        this.instances = new Map();
        this.defaultConfig = {
            direction: 'horizontal',
            loop: true,
            grabCursor: true,
            threshold: 5,
            lazy: true,
        };
    }

    /**
     * @method create
     * @description Creates a new Swiper instance or returns existing one
     * @param {string|HTMLElement} selector - CSS selector or DOM element
     * @param {Object} [customConfig={}] - Custom Swiper configuration
     * @returns {Swiper} Created or existing Swiper instance
     * @throws {Error} If Swiper library is not loaded
     */
    create(selector, customConfig = {}) {
        if (this.instances.has(selector)) {
            console.warn(`Swiper instance for ${selector} already exists`);
            return this.instances.get(selector);
        }

        const config = {
            ...this.defaultConfig,
            ...customConfig
        };

        const instance = new Swiper(selector, config);
        this.instances.set(selector, instance);

        return instance;
    }

    /**
     * @method get
     * @description Retrieves a Swiper instance by selector
     * @param {string} selector - Original CSS selector used for creation
     * @returns {Swiper|null} Found Swiper instance or null
     */
    get(selector) {
        return this.instances.get(selector);
    }

    /**
     * @method destroy
     * @description Destroys a Swiper instance and removes from registry
     * @param {string} selector - CSS selector used during creation
     */
    destroy(selector) {
        const instance = this.instances.get(selector);
        if (instance) {
            instance.destroy(true, true);
            this.instances.delete(selector);
        }
    }

    /**
     * @method destroyAll
     * @description Destroys all managed Swiper instances and clears registry
     */
    destroyAll() {
        this.instances.forEach((instance, selector) => {
            this.destroy(selector);
        });
    }

    /**
     * @method update
     * @description Updates an existing Swiper instance with new configuration
     * @param {string} selector - CSS selector of instance to update
     * @param {Object} [newConfig={}] - New configuration to merge
     * @returns {Swiper|null} Recreated instance or null if not found
     */
    update(selector, newConfig = {}) {
        const instance = this.instances.get(selector);
        if (!instance) return null;

        this.destroy(selector);
        return this.create(selector, {...instance.params, ...newConfig});
    }
}

/**
 * @global
 * @type {SwiperManager}
 * @description Singleton instance of SwiperManager for application-wide use
 */
const swiperManager = new SwiperManager();

//!===========================================================
//! COPY TO CLIPBOARD
//!===========================================================
/**
 * @class ShareLink
 * Handles copying the current URL with UTM parameters to clipboard,
 * providing fallback support, UI feedback, and debouncing.
 */
class ShareLink {
    /**
     * @param {string} selector - CSS selector for share buttons.
     * @param {Object} options - Optional configuration.
     * @param {string} [options.utm='utm_source=clipboard&utm_medium=copy&utm_campaign=share'] - UTM query string to append.
     * @param {number} [options.debounceDelay=300] - Debounce delay in ms.
     */
    constructor(selector = '.share-button', options = {}) {
        this.selector = selector;
        this.utm = options.utm || 'utm_source=clipboard&utm_medium=copy&utm_campaign=share';
        this.debounceDelay = options.debounceDelay || 300;
        this.revertTimeouts = new WeakMap();
        this.attachHandlers();
    }

    /**
     * Adds click event listeners with debounce to matching buttons.
     */
    attachHandlers() {
        const handler = this.debounce(this.handleCopy.bind(this), this.debounceDelay);
        document.querySelectorAll(this.selector)
            .forEach(btn => btn.addEventListener('click', handler));
    }

    /**
     * Returns the current page URL without hash, with appended UTM parameters.
     * @returns {string}
     */
    getUrlWithUtm() {
        const url = new URL(window.location.href.split('#')[0]);
        const utmParams = new URLSearchParams(this.utm);
        utmParams.forEach((value, key) => url.searchParams.set(key, value));
        return url.toString();
    }

    /**
     * Attempts to write text to clipboard using the modern API.
     * @param {string} text
     * @returns {Promise<boolean>}
     */
    async copyToClipboard(text) {
        if (navigator.clipboard && window.isSecureContext) {
            await navigator.clipboard.writeText(text);
            return true;
        }
        return false;
    }

    /**
     * Fallback copy method using a temporary textarea element.
     * @param {string} text
     * @returns {boolean}
     */
    fallbackCopy(text) {
        const textarea = document.createElement('textarea');
        textarea.value = text;
        textarea.style.position = 'fixed';
        textarea.style.top = '-1000px';
        textarea.style.left = '-1000px';
        document.body.appendChild(textarea);
        textarea.focus();
        textarea.select();
        const success = document.execCommand('copy');
        document.body.removeChild(textarea);
        return success;
    }

    /**
     * Notifies the user about success or failure.
     * @param {boolean} success
     */
    notify(success) {
        const message = success ? 'Ссылка скопирована!' : 'Не удалось скопировать ссылку.';
        if (typeof toastManager !== 'undefined') {
            toastManager.show({message, type: success ? 'default' : 'error'});
        }
    }

    /**
     * Updates button UI to indicate copy success, reverts after delay.
     * @param {HTMLElement} button
     */
    updateButtonUI(button) {
        const svgUse = button.querySelector('svg use');
        const textEl = button.querySelector('.btn__text');
        if (!svgUse || !textEl) return;

        // Cache default states
        button.dataset.defaultIconHref ??= svgUse.getAttribute('href');
        button.dataset.defaultText ??= textEl.textContent;

        // Clear existing revert timeout
        if (this.revertTimeouts.has(button)) {
            clearTimeout(this.revertTimeouts.get(button));
        }

        // Update UI
        svgUse.setAttribute('href', '/assets/icons/icons.svg#icon-true');
        textEl.textContent = 'Скопировано!';

        // Schedule UI revert
        const timeoutId = setTimeout(() => {
            svgUse.setAttribute('href', button.dataset.defaultIconHref);
            textEl.textContent = button.dataset.defaultText;
            this.revertTimeouts.delete(button);
        }, 2000);
        this.revertTimeouts.set(button, timeoutId);
    }

    /**
     * Handles the copy action: gets the UTM URL, copies it, and updates UI.
     * @param {Event} event
     */
    async handleCopy(event) {
        const button = event.currentTarget;
        const url = this.getUrlWithUtm();
        let success = false;

        try {
            success = await this.copyToClipboard(url);
            if (!success) {
                success = this.fallbackCopy(url);
            }
        } catch (e) {
            console.error('Copy failed:', e);
        }

        this.notify(success);
        if (success) {
            this.updateButtonUI(button);
        }
    }

    /**
     * Debounce function (leading edge only).
     * @param {Function} fn
     * @param {number} delay
     * @returns {Function}
     */
    debounce(fn, delay) {
        let timer = null;
        return function (...args) {
            if (timer) return;
            fn.apply(this, args);
            timer = setTimeout(() => {
                timer = null;
            }, delay);
        };
    }
}

const shareLinksHandler = new ShareLink();

//!===========================================================
//! LAZY LOADING IMAGES
//!===========================================================
(function () {
    'use strict';

    function lazyLoadImages() {
        const images = document.querySelectorAll('img[data-src]');

        images.forEach(image => {
            image.style.visibility = 'hidden';

            const preloader = new Image();

            preloader.onload = function () {
                image.src = preloader.src;

                image.style.visibility = 'visible';

                image.removeAttribute('data-src');
            };

            preloader.onerror = function () {
                console.error('Failed to load image:', preloader.src);
            };

            preloader.src = image.getAttribute('data-src');
        });
    }

    if (document.readyState === 'loading') {
        document.addEventListener('DOMContentLoaded', lazyLoadImages);
    } else {
        lazyLoadImages();
    }
})();