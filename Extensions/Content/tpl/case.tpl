<?php
/** @var array $content */

$index = $content->loadFrom('/');

App\Layout\Components\Common\Header\Layout::draw([
    'subtitle' => $index['params']['header_logo-text'],
]);
?>

<main>
    <?php
    App\Layout\Components\UI\Core\BreadCrumbs\Layout::draw();

    App\Layout\Components\Common\PageHeading\Layout::drawPageHeading();

    App\Layout\Components\Layout\Case\CaseFs\Layout::draw([
        'image' => $this->case->photo,
        'name' => $this->case->name,
        'company' => $this->case->company,
        'short' => $this->case->short,
    ]);

    App\Layout\Components\Layout\Case\CaseArticle\Layout::draw([
        'nav-title' => $this->case->nav_title,
        'link' => $this->case->link_to ?? [
            [
                'link' => '##',
                'title' => 'Задача'
            ],[
                'link' => '##',
                'title' => 'Наше решение'
            ],
        ],

        'tini' => $this->case->tini ?? 'Задача:',

        'title-s' => $this->case->title_s ?? 'Наше решение:',
        'text-s' => $this->case->text_s ?? 'Текст',
        'steps' => [
            [
                'number' => '1',
                'text' => 'Анализ ТЗ и подбор 6 потенциальных фабрик на отраслевых выставках;',
            ],[
                'number' => '2',
                'text' => 'Выездные аудиты трёх фабрик, проверка сертификатов, производственных линий и логистики;',
            ],[
                'number' => '3',
                'text' => 'Переговоры и закрепление условий в международном договоре с положениями о штрафах и гарантии качества;',
            ],[
                'number' => '4',
                'text' => 'Подготовка образцов и пилотной партии; тесты на соответствие стандартам;',
            ],[
                'number' => '5',
                'text' => 'Массовое производство и поэтапная инспекция (PPC → IPC → FRI);',
            ],[
                'number' => '6',
                'text' => 'Организация ЖД-контейнеров, растаможка «белая» и доставка до склада RBT.ru.',
            ],
        ],
        'text-s-bottom' => $this->case->text_s_bottom ?? 'Текст',

        'title-third' => $this->case->title_third ?? 'Результат:',
        'text-third' => $this->case->text_third ?? 'Текст',
        'image-third' => $this->case->image_third ?? '/assets/images/Main/plug.png',
        'desc-third' => $this->case->desc_third ?? 'Description',
        'image-list' => $this->case->image_list ?? [
            [
                'image' => '/assets/images/Main/plug.png',
            ],[
                'image' => '/assets/images/Main/plug.png',
            ],
        ],
        'desc-third-image' => $this->case->desc_third_image ?? 'Description',
        'text-third-after' => $this->case->text_third_after ?? 'Текст',
        'benefits' => $this->case->benefits ?? [
            [
                'title' => '2 контейнера',
                'text' => 'Снижение брака благодаря контролю на этапе IPC',
            ],[
                'title' => '2 контейнера',
                'text' => 'Снижение брака благодаря контролю на этапе IPC',
            ],[
                'title' => '2 контейнера',
                'text' => 'Снижение брака благодаря контролю на этапе IPC',
            ],
        ],

        // Ещё четвертая секция
    ]);

    App\Layout\Components\Sliders\CasesSlider\Layout::draw([
        'title' => 'Другие наши кейсы',
        'link' => '/cases/',
    ]);

    App\Layout\Components\Common\FormFeedback\Layout::draw([
            'title' => $index['params']['form-feedback_title'] ?? 'Обратная связь',
            'desc' => $index['params']['form-feedback_desc'] ?? 'Оставьте заявку, чтобы получить консультацию',
    ]);

    App\Layout\Components\Common\Seo\Layout::draw([
            'seo-title' => $this->case->seo_title,
            'seo-desc' => $this->case->seo_desc,
            'seo2-title' => $this->case->seo2_title,
            'seo2-desc' => $this->case->seo2_desc,
    ]);
    ?>
</main>

<?php
App\Layout\Components\Common\Footer\Layout::draw();
?>