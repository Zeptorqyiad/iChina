<?php
/** @var array $content */

use App\Extensions\Reviews\Model\Reviews;

$index = $content->loadFrom('/');

$q = Reviews::findAdv()->where(['is_active' => 1]);

$totalCount = Reviews::getTotalCount();

$pag = $_REQUEST['page'] ?? 0;
$count = $q->select('count(*)')->fetchScalar();
$cards = $q->select('*')->limit('16 offset ' . ($pag * 16))->orderBy('npp DESC')->all();

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
		]);

		App\Layout\Components\Common\FormFeedback\Layout::draw([
			'title' => $index['params']['form-feedback_title'] ?? 'Обратная связь',
			'desc' => $index['params']['form-feedback_desc'] ?? 'Оставьте заявку, чтобы получить консультацию',
//      	'image' => $content['params']['form-feedback-img'] ?? '/assets/images/Main/plug.png',
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
