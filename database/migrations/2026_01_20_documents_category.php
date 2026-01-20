<?php

use Simflex\Admin\Migration\Struct;
use \Simflex\Core\DB\Schema;

return new class implements \Simflex\Core\DB\Migration {
    public function up(Schema $s)
    {
        $s->createTable('documents_category', function (Schema\Table $c) {
            $c->id('doc_category_id');
            $c->integer('npp');
            $c->string('name');
            $c->string('anchor');
        });
    }

    public function down(Schema $s)
    {
        $s->dropTable('documents_category');
    }
};