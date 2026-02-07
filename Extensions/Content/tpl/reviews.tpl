<?php
/** @var array $content */

use App\Extensions\Reviews\Model\Reviews;

$index = $content->loadFrom('/');

$q = Reviews::findAdv()->where(['is_active' => 1]);

$totalCount = Reviews::getTotalCount();

$perPage = 16;
$page = max(0, (int)($_REQUEST['page'] ?? 0));
$count = (int)$q->select('count(*)')->fetchScalar();
$pages = max(1, (int)ceil($count / $perPage));
if ($page > $pages - 1) {
    $page = $pages - 1;
}
$cards = $q->select('*')
    ->limit($perPage . ' offset ' . ($page * $perPage))
    ->orderBy('npp DESC')
    ->all();

App\Layout\Components\Common\Header\Layout::draw();
?>

<main>
	<?php
        App\Layout\Components\Common\PageHeading\Layout::drawPageHeading(
            count: $totalCount,
            style: App\Layout\Components\Common\PageHeading\PageHeadingStyle::Secondary
        );

		App\Layout\Components\Layout\Reviews\ReviewsContent\Layout::draw([
			'cards' => $cards,
            'pagination' => [
                'page' => $page,
                'pages' => $pages,
                'name' => 'page',
            ],
		]);

		App\Layout\Components\Common\FormFeedback\Layout::draw([
			'title' => $index['params']['form-feedback_title'],
			'desc' => $index['params']['form-feedback_desc'],
            'image' => $index['params']['form-feedback-img']
		]);

		App\Layout\Components\Common\Seo\Layout::draw([
			'seo-title' => $this->review->seo_title ?? '',
			'seo-desc' => $this->review->seo_desc ?? '',
			'seo2-title' => $this->review->seo2_title ?? '',
			'seo2-desc' => $this->review->seo2_desc ?? '',
		]);
	?>
</main>

<?php App\Layout\Components\Common\Footer\Layout::draw(); ?>
