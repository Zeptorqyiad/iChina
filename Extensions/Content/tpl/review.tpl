<?php
/** @var array $content */

$index = $content->loadFrom('/');

$q = App\Extensions\Blog\Model\Blog::findAdv();
$items = $q->select('*')
	->limit(15)
	->orderBy('date desc')
	->andWhere(['is_active' => 1])
	->all();

App\Layout\Components\Common\Header\Layout::draw([
	'subtitle' => $index['params']['header_logo-text'],
]);
?>

<main>
	<?php
	App\Layout\Components\UI\Core\BreadCrumbs\Layout::draw();

	App\Layout\Components\Common\PageHeading\Layout::drawPageHeading();

	App\Layout\Components\Layouts\Post\PostHeading\Layout::drawPostHeading(
		date: Simflex\Core\Time::normal($this->review->date),
		category: $this->review->category->name,
		views: $this->review->views,
		categoryId: $this->review->category->bc_id,
	);

	App\Layout\Components\Layouts\Post\PostFs\Layout::drawPostFs(
		title: $this->post->name,
		description: $this->post->short,
		imgBig: $this->post->photo,
		imgMob: $this->post->photo_mob,
	);

	App\Layout\Components\Layouts\Post\PostContent\Layout::drawPostContent(
		id: $this->post->blog_id,
		content: $this->post->content ?? '',
		views: $this->post->views,
		date: Simflex\Core\Time::normal($this->post->date),
		likes: $this->post->likes ?? 0,
		dislikes: $this->post->dislikes ?? 0,
	);

	App\Layout\Components\Common\SliderSections\BlogSlider\Layout::draw([
		'title' => 'Другие отзывы',
		'link' => '/reviews/',
		'cards' => $items,
	]);

	App\Layout\Components\Common\FormFeedback\Layout::draw([
		'title' => $index['params']['form-feedback_title'] ?? 'Обратная связь',
		'desc' => $index['params']['form-feedback_desc'] ?? 'Оставьте заявку, чтобы получить консультацию',
	]);

	App\Layout\Components\Common\Seo\Layout::draw([
		'seo-title' => $this->post->seo_title,
		'seo-desc' => $this->post->seo_desc,
		'seo2-title' => $this->post->seo2_title,
		'seo2-desc' => $this->post->seo2_desc,
	]);
	?>
</main>

<?php
App\Layout\Components\Common\Footer\Layout::draw();
?>
