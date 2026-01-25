<?php

use Simflex\Admin\Migration\Struct;
use \Simflex\Core\DB\Schema;

return new class implements \Simflex\Core\DB\Migration {
    public function up(Schema $s)
    {
        $s->createTable('service_small', function (Schema\Table $c) {
            $c->id('sm_id');
            $c->integer('npp');
            $c->boolean('is_active');
            $c->string('alias');
            $c->string('path');
            $c->string('name');

            $c->string('banner_image');
            $c->string('banner_title');
            $c->string('banner_subtitle');
            $c->text('banner_desc');
            $c->string('banner_card_title');
            $c->text('banner_card_text');
            $c->string('banner_card_button_text');
            $c->string('banner_card_button_link');
            $c->text('banner_items');

            $c->string('about_title');
            $c->string('about_title_accent');
            $c->text('about_desc');
            $c->string('about_subtitle_left');
            $c->text('about_desc_left');
            $c->text('about_bullits');
            $c->text('about_accent_text');
            $c->text('about_items');
            $c->string('about_image');
            $c->string('about_offer_title');
            $c->text('about_offer_desc');
            $c->string('about_offer_price');
            $c->string('about_offer_time');
            $c->string('about_offer_button_text');

            $c->string('stages_title');
            $c->text('stages_desc');
            $c->text('stages_cards');
            $c->string('stages_image');
            $c->string('stages_offer_title');
            $c->text('stages_offer_desc');
            $c->string('stages_offer_button_text');

            $c->string('risks_title');
            $c->string('risks_title_accent');
            $c->text('risks_desc');
            $c->text('risks_tap');
            $c->string('risks_callback_title');
            $c->text('risks_callback_desc');

            $c->string('o_serv_title');
            $c->string('o_serv_title_accent');
            $c->text('o_serv_desc');
            $c->text('o_serv_items');

            $c->string('benefits_title');
            $c->string('benefits_title_accent');
            $c->text('benefits_description');
            $c->text('benefits_items');

            $c->string('faq_title');
            $c->string('faq_desc');
            $c->text('faq_faq');

            $c->string('form_title');
            $c->text('form_desc');
            $c->string('form_image');

            $c->string('seo_title');
            $c->text('seo_desc');
            $c->string('seo_title_2');
            $c->text('seo_desc_2');
        });
    }

    public function down(Schema $s)
    {
        $s->dropTable('service_small');
    }
};
