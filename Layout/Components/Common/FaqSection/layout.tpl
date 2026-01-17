<?php
/** @var array $data */

//$cats = App\Extensions\Site\Model\FaqCategory::findAdv()->all();

// Создаем класс-заглушку для модели категории
class FakeCategory
{
    public $anchor;
    public $name;
    public $children = [];

    public function __construct($anchor, $name, $children)
    {
        $this->anchor = $anchor;
        $this->name = $name;
        $this->children = $children;
    }

    public function getChildren()
    {
        return $this->children;
    }
}

// Создаем класс-заглушку для модели FAQ
class FakeFaq
{
    public $question;
    public $answer;

    public function __construct($question, $answer)
    {
        $this->question = $question;
        $this->answer = $answer;
    }
}

// Создаем тестовые данные
$cats = [
        new FakeCategory('general', 'Общие вопросы', [
                new FakeFaq('Как работает ваш сервис?', 'Наш сервис предоставляет удобные инструменты для решения ваших задач.'),
                new FakeFaq('Сколько стоит использование?', 'У нас есть различные тарифные планы, включая бесплатный вариант.'),
                new FakeFaq('Какие гарантии вы предоставляете?', 'Мы гарантируем безопасность данных и круглосуточную поддержку.'),
                new FakeFaq('Как зарегистрироваться?', 'Нажмите кнопку "Регистрация" и заполните простую форму.'),
                new FakeFaq('Как с вами связаться?', 'Вы можете связаться с нами через форму обратной связи или по email.'),
        ]),
        new FakeCategory('technical', 'Технические вопросы', [
                new FakeFaq('Какие браузеры поддерживаются?', 'Мы поддерживаем все современные браузеры: Chrome, Firefox, Safari, Edge.'),
                new FakeFaq('Нужно ли устанавливать программное обеспечение?', 'Нет, наш сервис полностью работает в браузере.'),
                new FakeFaq('Как часто обновляется сервис?', 'Мы выпускаем обновления каждые 2-3 недели.'),
                new FakeFaq('Есть ли мобильное приложение?', 'Да, у нас есть мобильные приложения для iOS и Android.'),
        ]),
        new FakeCategory('payments', 'Оплата и тарифы', [
                new FakeFaq('Какие способы оплаты доступны?', 'Мы принимаем банковские карты, PayPal и другие популярные платежные системы.'),
                new FakeFaq('Можно ли отменить подписку?', 'Да, вы можете отменить подписку в любой момент.'),
                new FakeFaq('Предоставляется ли возврат средств?', 'Да, мы предоставляем возврат средств в течение 14 дней.'),
                new FakeFaq('Есть ли пробный период?', 'Да, у нас есть 14-дневный пробный период для всех тарифов.'),
        ])
];
?>

<section class="faq-section">
    <?php
    App\Layout\Components\Common\NavList\Layout::draw();
    ?>
    <div class="faq-section__container container">
        <?php App\Layout\Components\Common\NavSticky\Layout::draw(); ?>

        <div class="faq-section__body">
            <?php foreach ($cats as $c): ?>
                <?php if ($children = $c->getChildren()): ?>
                    <div class="faq-section__category" id="<?= $c->anchor ?>">
                        <h3 class="faq-section__category-title"><?= $c->name ?></h3>

                        <div class="faq-section__category-list-wrap">
                            <ul class="faq-section__category-list" role="tablist">
                                <?php foreach ($children as $index => $item) {
                                    if ($index % 2 === 0) {
                                        App\Layout\Components\UI\Core\Accordion\Layout::drawAccordion(
                                            className: 'faq-section__category-item',
                                            title: $item->question,
                                            description: $item->answer,
                                            size: App\Layout\Components\UI\Core\Accordion\AccordionSize::Medium
                                        );
                                    }
                                } ?>
                            </ul>

                            <ul class="faq-section__category-list" role="tablist">
                                <?php foreach ($children as $index => $item) {
                                    if ($index % 2 === 1) {
                                        App\Layout\Components\UI\Core\Accordion\Layout::drawAccordion(
                                            className: 'faq-section__category-item',
                                            title: $item->question,
                                            description: $item->answer,
                                            size: App\Layout\Components\UI\Core\Accordion\AccordionSize::Medium
                                        );
                                    }
                                } ?>
                            </ul>
                        </div>
                    </div>
                <?php endif; ?>
            <?php endforeach; ?>
        </div>
    </div>
</section>
