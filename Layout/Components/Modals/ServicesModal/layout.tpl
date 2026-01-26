<?php
/** @var array $data */

?>

<div id="service-modal" class="modal service-modal wrapper" role="dialog" aria-modal="true">
    <ul class="service-modal__content">
        <li class="service-modal__item">
            <a class="service-modal__item--link" draggable="false" href="##">
                <img src="/assets/images/Main/modalServices.png" alt="">
                Отдел ВЭД на аутсорсе
            </a>
            <a class="service-modal__item--link" draggable="false" href="##">
                <img src="/assets/images/Main/modalServices.png" alt="">
                ВЭД под ключ
            </a>
            <a class="service-modal__item--link" draggable="false" href="##">
                <img src="/assets/images/Main/modalServices.png" alt="">
                Поиск поставщика и расчет
            </a>
        </li>
        <li class="service-modal__item">
            <a class="service-modal__item--link" draggable="false" href="##">
                <img src="/assets/images/Main/modalServices.png" alt="">
                Аудит поставщика
            </a>
            <a class="service-modal__item--link" draggable="false" href="##">
                <img src="/assets/images/Main/modalServices.png" alt="">
                Сопровождение на фабрику, выставках
            </a>
            <a class="service-modal__item--link" draggable="false" href="##">
                <img src="/assets/images/Main/modalServices.png" alt="">
                Финансовая логистика
            </a>
        </li>
        <li class="service-modal__item">
            <a class="service-modal__item--link" draggable="false" href="##">
                <img src="/assets/images/Main/modalServices.png" alt="">
                Контроль производства
            </a>
            <a class="service-modal__item--link" draggable="false" href="##">
                <img src="/assets/images/Main/modalServices.png" alt="">
                Выстраивание ВЭД в компании
            </a>
            <a class="service-modal__item--link" draggable="false" href="##">
                <img src="/assets/images/Main/modalServices.png" alt="">
                Подбор кода ТНВЭД
            </a>
        </li>
        <li class="service-modal__item">
            <a class="service-modal__item--link" draggable="false" href="##">
                <img src="/assets/images/Main/modalServices.png" alt="">
                Таможенное сопровождение
            </a>
            <a class="service-modal__item--link" draggable="false" href="##">
                <img src="/assets/images/Main/modalServices.png" alt="">
                Услуга
            </a>
            <?php App\Layout\Components\UI\Core\Buttons\Button\Layout::drawButton(
                className: 'service-modal__item--btn',
                text: 'Смотреть все',
                link: '/services/',
                style: App\Layout\Components\UI\Core\Buttons\Button\ButtonStyle::Secondary,
                size: App\Layout\Components\UI\Core\Buttons\Button\ButtonSize::Large,
            ); ?>
        </li>
    </ul>
</div>