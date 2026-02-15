<?php
/** @var array $content */

$index = $content->loadFrom('/');

$q = App\Extensions\Blog\Model\Blog::findAdv();
$items = $q->select('*')
        ->limit(15)
        ->orderBy('npp')
        ->andWhere(['is_active' => 1])
        ->andWhere('blog_id != ' . (int)$this->post->blog_id)
        ->all();

App\Layout\Components\Common\Header\Layout::draw([
	'subtitle' => $index['params']['header_logo-text'],
]);
?>

<main>
	<?php
	App\Layout\Components\UI\Core\BreadCrumbs\Layout::draw();

	App\Layout\Components\Common\PageHeading\Layout::drawPageHeading();

	if (!empty($this->post->video_horizontal) || !empty($this->post->video_vertical) || !empty($this->post->video)) {
		App\Layout\Components\Layout\Post\PostHeading\Layout::drawPostHeading(
			className: 'video',
			date: Simflex\Core\Time::normal($this->post->date),
			category: $this->post->category->name,
			views: $this->post->views,
			categoryId: $this->post->category->bc_id
		);

		App\Layout\Components\Layout\Post\VideoContent\Layout::draw([
			'title' => $this->post->name,
			'description' => $this->post->short,
			'video_h' => $this->post->video_horizontal,
			'video_v' => $this->post->video_vertical,
			'video' => $this->post->video,
		]);
	} else {
		App\Layout\Components\Layout\Post\PostHeading\Layout::drawPostHeading(
			date: Simflex\Core\Time::normal($this->post->date),
			category: $this->post->category->name,
			views: $this->post->views,
			categoryId: $this->post->category->bc_id,
		);

		App\Layout\Components\Layout\Post\PostFs\Layout::draw([
			'title' => $this->post->name,
			'description' => $this->post->short,
			'imgBig' => $this->post->photo,
			'imgMob' => $this->post->photo_mob,
		]);
	}

	App\Layout\Components\Layout\Post\PostContent\Layout::draw([
		'id' => $this->post->blog_id,
		'content' => $this->post->content,
		'views' => $this->post->views,
		'date' => Simflex\Core\Time::normal($this->post->date),
		'likes' => $this->post->likes,
		'dislikes' => $this->post->dislikes ?? 0,
	]);

	App\Layout\Components\Sliders\BlogSlider\Layout::draw([
		'title' => 'Другие статьи',
		'link' => '/blog/',
		'cards' => $items,
	]);

	App\Layout\Components\Common\FormFeedback\Layout::draw([
		'title' => $index['params']['form-feedback_title'] ?? 'Обратная связь',
		'desc' => $index['params']['form-feedback_desc'] ?? 'Оставьте заявку, чтобы получить консультацию',
        'image' => $index['params']['form-feedback-img'],
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
