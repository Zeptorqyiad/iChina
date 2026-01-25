<?php

use Simflex\Admin\Migration\Struct;
use \Simflex\Core\DB\Schema;

return new class implements \Simflex\Core\DB\Migration {
    public function up(Schema $s)
    {
        $s->createTable('service_big', function (Schema\Table $c) {
            $c->id('sb_id');
            $c->integer('npp');
            $c->boolean('is_active');
            $c->string('name');
            $c->string('alias');
            $c->string('path');
            $c->string('icon');

            $c->string('banner_image');
            $c->string('banner_service_title');
            $c->string('banner_service_subtitle');
            $c->text('banner_service_desc');
            $c->string('banner_card_title');
            $c->text('banner_card_text');
            $c->string('banner_card_button_text');
            $c->string('banner_card_button_link');
            $c->text('banner_card_items');

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
            $c->string('about_offer_buttons_text');

            $c->string('about_us_title');
            $c->string('about_us_title_accent');
            $c->string('about_us_title_third');
            $c->text('about_us_benefits');
            $c->string('about_us_title_why');
            $c->text('about_us_items_why');
            $c->text('about_us_card_text_why');
            $c->text('about_us_description_why');
            $c->string('about_us_callback_title');
            $c->text('about_us_callback_desc');

            $c->string('benefits_title');
            $c->string('benefits_title_accent');
            $c->text('benefits_description');
            $c->text('benefits_items');

            $c->string('types_title');
            $c->text('types_desc');
            $c->text('types_badge');

            $c->string('cta_title');
            $c->text('cta_subtitle');
            $c->text('cta_text');
            $c->string('cta_image');

            $c->string('options_title');
            $c->string('options_title_accent');
            $c->text('options_desc');
            $c->text('options_items');

            $c->string('another_about_title');
            $c->string('another_about_title_accent');
            $c->text('another_about_desc');
            $c->string('another_about_subtitle_left');
            $c->text('another_about_desc_left');
            $c->text('another_about_bullits');
            $c->string('another_about_callback_title');
            $c->text('another_about_callback_desc');

            $c->string('stages_title');
            $c->text('stages_desc');
            $c->text('stages_cards');
            $c->string('stages_offer_image');
            $c->string('stages_offer_title');
            $c->text('stages_offer_desc');
            $c->string('stages_offer_button_text');

            $c->string('risks_title');
            $c->string('risks_title_accent');
            $c->text('risks_desc');
            $c->text('risks_questions');
            $c->string('risks_callback_title');
            $c->text('risks_callback_desc');

            $c->string('map_title');
            $c->text('map_desc');
            $c->string('addresses_title');
            $c->string('map_image');
            $c->string('map_image_t');

            $c->string('route_map_title');
            $c->string('route_map_title_accent');
            $c->text('route_map_desc');
            $c->text('route_map_items');

            $c->string('o_serv_title');
            $c->string('o_serv_title_accent');
            $c->text('o_serv_desc');
            $c->text('o_serv_items');

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
        $s->dropTable('service_big');
    }
};
