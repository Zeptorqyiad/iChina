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
 * @property string icon
 * @property string shortly
 *
 * @property string banner_image
 * @property string banner_service_title
 * @property string banner_service_subtitle
 * @property text banner_service_desc
 * @property string banner_card_title
 * @property text banner_card_text
 * @property string banner_card_button_text
 * @property string banner_card_button_link
 * @property text banner_card_items
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
 * @property string about_offer_buttons_text
 *
 * @property string about_us_title
 * @property string about_us_title_accent
 * @property string about_us_title_third
 * @property text about_us_benefits
 * @property string about_us_title_why
 * @property text about_us_items_why
 * @property text about_us_card_text_why
 * @property text about_us_description_why
 * @property string about_us_callback_title
 * @property text about_us_callback_desc
 *
 * @property string benefits_title
 * @property string benefits_title_accent
 * @property text benefits_description
 * @property text benefits_items
 *
 * @property string types_title
 * @property text types_desc
 * @property text types_badge
 *
 * @property string cta_title
 * @property text cta_subtitle
 * @property text cta_text
 * @property string cta_image
 *
 * @property string options_title
 * @property string options_title_accent
 * @property text options_desc
 * @property text options_items
 *
 * @property string another_about_title
 * @property string another_about_title_accent
 * @property text another_about_desc
 * @property string another_about_subtitle_left
 * @property text another_about_desc_left
 * @property text another_about_bullits
 * @property string another_about_callback_title
 * @property text another_about_callback_desc
 *
 * @property string stages_title
 * @property text stages_desc
 * @property text stages_cards
 * @property string stages_offer_image
 * @property string stages_offer_title
 * @property text stages_offer_desc
 * @property string stages_offer_button_text
 *
 * @property string risks_title
 * @property string risks_title_accent
 * @property text risks_desc
 * @property text risks_questions
 * @property string risks_callback_title
 * @property text risks_callback_desc
 *
 * @property string o_serv_title
 * @property string o_serv_title_accent
 * @property text o_serv_desc
 * @property text o_serv_items
 *
 * @property string faq_title 90
 * @property text faq_desc 91
 * @property text faq_faq 92
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

class ServiceBig extends ModelBase
{
    protected static $table = 'service_big';
    protected static $primaryKeyName = 'sb_id';

    public function getBannerItems(): array
    {
        return json_decode($this->banner_card_items, true)['v'] ?? [];
    }
    public function getAboutItems(): array
    {
        return json_decode($this->about_items, true)['v'] ?? [];
    }
    public function getAboutBullitsList(): array
    {
        return json_decode($this->about_bullits, true)['v'] ?? [];
    }
    public function getAnotherAboutBullitsList(): array
    {
        return json_decode($this->another_about_bullits, true)['v'] ?? [];
    }
    public function getStageCards(): array
    {
        return json_decode($this->stages_cards, true)['v'] ?? [];
    }
    public function getAboutBenefits(): array
    {
        return json_decode($this->about_us_benefits, true)['v'] ?? [];
    }
    public function getAboutUsItemsWhy(): array
    {
        return json_decode($this->about_us_items_why, true)['v'] ?? [];
    }
    public function getBenefitsItems(): array
    {
        return json_decode($this->benefits_items, true)['v'] ?? [];
    }
    public function getTypes(): array
    {
        return json_decode($this->types_badge, true)['v'] ?? [];
    }
    public function getOptions(): array
    {
        return json_decode($this->options_items, true) ?? [];
    }
    public function getQuestions(): array
    {
        return json_decode($this->risks_questions, true)['v'] ?? [];
    }
    public function getFaqs(): array
    {
        return json_decode($this->faq_faq, true)['v'] ?? [];
    }
}
