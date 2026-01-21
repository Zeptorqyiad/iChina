<?php

use Simflex\Admin\Migration\Struct;
use \Simflex\Core\DB\Schema;

return new class implements \Simflex\Core\DB\Migration {
    public function up(Schema $s)
    {
        $s->createTable('main_slider', function (Schema\Table $c) {
            $c->id('main_slider_id');
            $c->integer('npp');
            $c->boolean('is_active');
            $c->string('title');
            $c->text('subtitle');
            $c->string('cardTitle');
            $c->text('cardText');
            $c->string('buttonText');
            $c->string('buttonLink');
            $c->string('serviceCardTitle');
            $c->string('serviceCardText');
            $c->string('serviceCardLink');
            $c->text('bullets');
        });
    }

    public function down(Schema $s)
    {
        $s->dropTable('main_slider');
    }
};