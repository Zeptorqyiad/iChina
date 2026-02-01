<?php

namespace App\Extensions\Cases\Model;

use Simflex\Core\ModelBase;

/**
 * @property int cases_id
 * @property int npp
 * @property int is_active
 * @property string name
 * @property text short
 * @property text company
 * @property string alias
 * @property string photo
 * @property string photo_min
 *
 * @property string nav_title
 * @property text link_to
 * @property text tini
 * @property string title_s
 * @property text text_s
 * @property text text_steps
 * @property text text_s_bottom
 *
 * @property string title_third
 * @property text text_third
 * @property string image_third
 * @property string desc_third
 * @property text image_list
 * @property string desc_third_image
 * @property text benefits
 *
 * @property string fourth_title
 * @property text fourth_text
 * @property string fourth_button_text_1
 * @property string fourth_button_link_1
 * @property string fourth_button_text_2
 * @property string fourth_button_link_2
 * @property string video
 * @property string video_desc
 * @property string video_v
 * @property string video_v_desc
 * @property text video_v_text
 * @property string date
 *
 * @property string meta_kw
 * @property string meta_desc
 * @property string meta_title
 * @property string seo_title
 * @property text seo_desc
 * @property string seo2_title
 * @property text seo2_desc
 */

class Cases extends ModelBase
{
    protected static $table = 'cases';
    protected static $primaryKeyName = 'cases_id';

    public function getLinkTo(): array
    {
        return json_decode($this->link_to, true)['v'] ?? [];
    }
    public function getSteps(): array
    {
        return json_decode($this->text_steps, true)['v'] ?? [];
    }
    public function getImages(): array
    {
        return json_decode($this->image_list, true)['v'] ?? [];
    }
    public function getBenefits(): array
    {
        return json_decode($this->benefits, true)['v'] ?? [];
    }
}