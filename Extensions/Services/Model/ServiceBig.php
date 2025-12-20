<?php

namespace App\Extensions\Services\Model;

use Simflex\Core\ModelBase;

/**
 * @property int sb_id
 * @property int npp
 * @property boolean is_active
 * @property string name
 * @property string alias
 * @property string path
 *
 * @property string fs_title
 * @property text fs_desc
 * @property string fs_image
 * @property string fs_price
 * @property string fs_time
 *
 * @property string about_title
 * @property text about_desc
 * @property string about_sub_left
 * @property text about_desc_left
 * @property text about_bullits
 * @property text about_accent_text
 * @property text about_items
 * @property string about_image
 * @property string about_offer_title
 * @property string about_offer_desc
 * @property string about_offer_price
 * @property string about_offer_time
 * @property string about_offer_text
 *
 * @property string service_benefit_title
 * @property string service_benefit_desc
 * @property table service_benefit_cards
 *
 * @property string consist_title
 * @property text consist_desc
 * @property text consist_badges
 *
 * @property string types_title
 * @property text types_desc
 * @property text types_badge
 * @property string types_image
 * @property string types_image_t
 * @property string types_image_guarantee
 * @property string types_card_text
 * @property string types_card_icon
 * @property text types_card_desc
 *
 * @property string other_service_title
 * @property text other_service_desc
 * @property string other_service_sub_left
 * @property text other_service_desc_left
 * @property text other_service_acc_text
 * @property string other_sevice_cc_title
 * @property text other_service_cc_desc
 *
 * @property string stages_title
 * @property text stages_desc
 * @property text stages_cards
 * @property string stages_image
 * @property string stages_off_title
 * @property text stages_off_desc
 * @property string stages_off_text
 * @property string stages_off_time
 * @property string stages_off_price
 *
 * @property string another_stages_title
 * @property text another_stages_desc
 * @property text another_stages_cards
 *
 * @property string risks_title
 * @property text risks_desc
 * @property text risks_text
 * @property string risks_callback_title
 * @property text risks_callback_desc
 *
 * @property string tables_title
 * @property text tables_desc
 * @property string tables_table_title
 * @property string tables_table_second_title
 * @property string tables_table_second_city_1
 * @property string tables_table_second_city_2
 * @property string tables_table_second_city_3
 * @property string tables_contnent_title
 * @property text tables_desc_content
 * @property text tables_accent_descr
 *
 * @property string options_title
 * @property text options_desc
 * @property text options_items
 *
 * @property string route_map_title
 * @property text route_map_desc
 * @property text route_map_items
 * @property text route_map_callback_title
 * @property text route_map_callback_desc
 *
 * @property string another_about_title
 * @property text another_about_desc
 * @property string another_about_sub_left
 * @property text another_about_desc_left
 * @property string another_about_sub_right
 * @property text another_about_desc_right
 *
 * @property string other_serv_title
 * @property text other_serv_desc
 * @property text other_serv_links
 *
 * @property string faq_title
 * @property text faq_desc
 * @property text faq_items
 *
 * @property string seo_title
 * @property text seo_desc
 * @property string seo2_title
 * @property text seo2_desc
 */

class ServiceBig extends ModelBase
{
    protected static $table = 'service_big';
    protected static $primaryKeyName = 'sb_id';

}