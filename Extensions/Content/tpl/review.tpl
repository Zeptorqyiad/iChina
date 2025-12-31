<?php
/** @var array $content */

$index = $content->loadFrom('/');
use App\Extensions\Reviews\Model\Reviews;

$q = Reviews::findAdv();
$items = $q->select('*')
	->limit(15)
	->orderBy('npp')
	->andWhere(['is_active' => 1])
	->all();

App\Layout\Components\Common\Header\Layout::draw();
?>

<main>
	<?php
	App\Layout\Components\UI\Core\BreadCrumbs\Layout::draw();

	App\Layout\Components\Common\PageHeading\Layout::drawPageHeading();

	if (!empty($this->review->video_horizontal) || !empty($this->review->video_vertical) || !empty($this->review->video)) {
		App\Layout\Components\Layout\Post\PostHeading\Layout::drawPostHeading(
			className: 'video',
			date: Simflex\Core\Time::normal($this->review->date),
			category: $this->review->category->name,
			views: $this->review->views,
			categoryId: $this->review->category->bc_id
		);

		App\Layout\Components\Layout\Post\VideoContent\Layout::draw([
			'title' => $this->review->name,
			'description' => $this->review->short,
			'video_h' => $this->review->video_horizontal,
			'video_v' => $this->review->video_vertical,
			'video' => $this->review->video,
		]);
	} else {
		App\Layout\Components\Layout\Post\PostHeading\Layout::drawPostHeading(
			date: Simflex\Core\Time::normal($this->review->date) ?? '',
			category: $this->review->category->name ?? '',
			categoryId: $this->review->category->rev_id ?? 0,
		);

		App\Layout\Components\Layout\Post\PostFs\Layout::draw([
			'title' => $this->review->name,
			'description' => $this->review->short,
			'imgBig' => $this->review->photo,
			'imgMob' => $this->review->photo_mob,
		]);
	}

	App\Layout\Components\Layout\Post\PostContent\Layout::draw([
		'id' => $this->review->blog_id,
		'content' => $this->review->content,
		'date' => Simflex\Core\Time::normal($this->review->date),
	]);

	App\Layout\Components\Sliders\BlogSlider\Layout::draw([
		'title' => 'Другие отзывы',
		'link' => '/reviews/',
		'cards' => $items,
	]);

	App\Layout\Components\Common\FormFeedback\Layout::draw([
		'title' => $index['params']['form-feedback_title'] ?? 'Обратная связь',
		'desc' => $index['params']['form-feedback_desc'] ?? 'Оставьте заявку, чтобы получить консультацию',
	]);

	App\Layout\Components\Common\Seo\Layout::draw([
		'seo-title' => $this->review->seo_title,
		'seo-desc' => $this->review->seo_desc,
		'seo2-title' => $this->review->seo2_title,
		'seo2-desc' => $this->review->seo2_desc,
	]);
	?>
</main>

<?php
App\Layout\Components\Common\Footer\Layout::draw();
?>
