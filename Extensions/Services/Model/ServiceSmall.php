<?php

namespace App\Extensions\Services\Model;

use Simflex\Core\ModelBase;

/**
 * @property int sm_id
 * @property int npp
 * @property boolean is_active
 * @property string alias
 * @property string path
 * @property string name
 * @property string icon
 * @property string shortly
 *
 * @property string banner_image
 * @property string banner_title
 * @property string banner_subtitle
 * @property text banner_desc
 * @property string banner_card_title
 * @property text banner_card_text
 * @property string banner_card_button_text
 * @property string banner_card_button_link
 * @property text banner_items
 *
 * @property string about_title
 * @property string about_title_accent
 * @property text about_desc
 * @property string about_subtitle_left
 * @property text about_desc_left
 * @property text about_bullits
 * @property text about_accent_text
 * @property text about_items
 * @property string about_image
 * @property string about_offer_title
 * @property text about_offer_desc
 * @property string about_offer_price
 * @property string about_offer_time
 * @property string  about_offer_button_text
 *
 * @property string stages_title
 * @property text stages_desc
 * @property text stages_cards
 * @property string stages_image
 * @property string stages_offer_title
 * @property text stages_offer_desc
 * @property string stages_offer_button_text
 *
 * @property string risks_title
 * @property string risks_title_accent
 * @property text risks_desc
 * @property text risks_tap
 * @property string risks_callback_title
 * @property text risks_callback_desc
 *
 * @property string o_serv_title
 * @property string o_serv_title_accent
 * @property text o_serv_desc
 * @property text o_serv_items
 *
 * @property string benefits_title
 * @property string benefits_title_accent
 * @property text benefits_description
 * @property text benefits_items
 *
 * @property string faq_title
 * @property text faq_desc
 * @property text faq_faq
 *
 * @property string form_title
 * @property text form_desc
 * @property string form_image
 *
 * @property string seo_title
 * @property text seo_desc
 * @property string seo_title_2
 * @property text seo_desc_2
 *
 * @property string meta_title
 * @property text meta_de
 * @property text meta_kw
 */

class ServiceSmall extends ModelBase
{
    protected static $table = 'service_small';

    protected static $primaryKeyName = 'sm_id';

    public function getBannerItems(): array
    {
        return json_decode($this->banner_items, true)['v'] ?? [];
    }
    public function getBullitsList(): array
    {
        return json_decode($this->about_bullits, true)['v'] ?? [];
    }
    public function getAboutItems(): array
    {
        return json_decode($this->about_items, true)['v'] ?? [];
    }
    public function getStageCards(): array
    {
        return json_decode($this->stages_cards, true)['v'] ?? [];
    }
    public function getRisks(): array
    {
        return json_decode($this->risks_tap, true)['v'] ?? [];
    }
    public function getBenefitsItems(): array
    {
        return json_decode($this->benefits_items, true)['v'] ?? [];
    }
    public function getFaqs(): array
    {
        return json_decode($this->faq_faq, true)['v'] ?? [];
    }
}