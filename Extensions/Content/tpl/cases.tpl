<?php
/** @var array $content */

$index = $content->loadFrom('/');

use App\Extensions\Cases\Model\Cases;
use App\Extensions\Cases\Model\CasesCategory;

$totalCount = CasesCategory::getTotalCount();

$q = Cases::findAdv()->where(['is_active' => 1]);
$c = $_REQUEST['c'] ?? 0;
if ($this->c) {
    $q->andWhere(['cases_id' => $this->c]);
}


$pag = $_REQUEST['page'] ?? 0;
$count = $q->select('count(*)')->fetchScalar();
$cases = $q->select('*')->limit('16 offset ' . ($pag * 16))->orderBy('npp DESC')->all();

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
        ]);
    ?>
</main>

<?php
App\Layout\Components\Common\Footer\Layout::draw();
?>
