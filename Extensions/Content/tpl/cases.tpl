<?php
/** @var array $content */

$index = $content->loadFrom('/');

use App\Extensions\Cases\Model\Cases;
use App\Extensions\Cases\Model\CasesCategory;

$totalCount = CasesCategory::getTotalCount();

$q = Cases::findAdv()->where(['is_active' => 1]);
$c = (int)($_REQUEST['c'] ?? 0);
if ($c) {
    $q->andWhere(['cc_id' => $c]);
}

$perPage = 16;
$page = max(0, (int)($_REQUEST['page'] ?? 0));
$count = (int)$q->select('count(*)')->fetchScalar();
$pages = max(1, (int)ceil($count / $perPage));
if ($page > $pages - 1) {
    $page = $pages - 1;
}
$cases = $q->select('*')
    ->limit($perPage . ' offset ' . ($page * $perPage))
    ->orderBy('npp DESC')
    ->all();

App\Layout\Components\Common\Header\Layout::draw([
    'subtitle' => $index['params']['header_logo-text'],
]);
?>

<main>
    <?php
        App\Layout\Components\UI\Core\BreadCrumbs\Layout::draw();

        App\Layout\Components\Common\PageHeading\Layout::drawPageHeading(
            count: $totalCount,
            style: App\Layout\Components\Common\PageHeading\PageHeadingStyle::Secondary
        );

        App\Layout\Components\Layout\Case\CasesSection\Layout::draw([
            'items' => $cases,
            'cats' => $c,
            'pagination' => [
                'page' => $page,
                'pages' => $pages,
                'name' => 'page',
            ],
        ]);

        App\Layout\Components\Common\FormFeedback\Layout::draw([
            'title' => $index['params']['form-feedback_title'],
            'desc' => $index['params']['form-feedback_desc'],
      	    'image' => $index['params']['form-feedback-img'],
        ]);

        App\Layout\Components\Common\Seo\Layout::draw([
            'seo-title' => $this->review->seo_title ?? '',
            'seo-desc' => $this->review->seo_desc ?? '',
            'seo2-title' => $this->review->seo2_title ?? '',
            'seo2-desc' => $this->review->seo2_desc ?? '',
        ]);
    ?>
</main>

<?php
App\Layout\Components\Common\Footer\Layout::draw();
?>
