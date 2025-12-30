<?php

use Simflex\Admin\Migration\Struct;
use \Simflex\Core\DB\Schema;

return new class implements \Simflex\Core\DB\Migration {
    public function up(Schema $s)
    {
		$s->createTable('reviews', function (Schema\Table $c) {
			$c->id('reviews_id');
			$c->integer('npp');
			$c->string('name');
			$c->string('short');
			$c->date('date');
			$c->boolean('is_active');
			$c->string('photo');
			$c->string('alias');
			$c->string('path');
			$c->string('photo_mob');
			$c->text('content');
			$c->string('video_horizontal');
			$c->string('video_vertical');
			$c->string('meta_kw');
			$c->string('meta_desc');
			$c->string('meta_title');
			$c->string('seo_title');
			$c->string('seo_desc');
			$c->string('seo2_title');
			$c->string('seo2_desc');
		});
    }

    public function down(Schema $s)
    {
		$s->dropTable('reviews');
    }
};