<?php

use Simflex\Admin\Migration\Struct;
use \Simflex\Core\DB\Schema;

return new class implements \Simflex\Core\DB\Migration {
    public function up(Schema $s)
    {
		$s->createTable('cases_category', function (Schema\Table $c) {
			$c->id('cc_id');
			$c->integer('npp');
			$c->string('name');
			$c->string('type');
		});
    }

    public function down(Schema $s)
    {
		$s->dropTable('cases_category');
    }
};