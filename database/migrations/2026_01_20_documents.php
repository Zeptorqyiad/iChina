<?php

use Simflex\Admin\Migration\Struct;
use \Simflex\Core\DB\Schema;

return new class implements \Simflex\Core\DB\Migration {
    public function up(Schema $s)
    {
        $s->createTable('documents', function (Schema\Table $c) {
            $c->id('doc_id');
            $c->integer('npp');
            $c->integer('doc_category_id')->foreignKey('documents_category');
            $c->string('text');
        });
    }

    public function down(Schema $s)
    {
        $s->dropTable('documents');
    }
};