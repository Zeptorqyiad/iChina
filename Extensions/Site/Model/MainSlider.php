<?php

namespace App\Extensions\Site\Model;

use Simflex\Core\ModelBase;

/**
 * @property int main_slider_id
 * @property int npp
 * @property int is_active
 * @property string image
 * @property string title
 * @property text subtitle
 * @property string cardTitle
 * @property text cardText
 * @property string buttonText
 * @property string buttonLink
 * @property string serviceCardTitle
 * @property string serviceCardText
 * @property string serviceCardLink
 */

class MainSlider extends ModelBase
{
    protected static $table = 'main_slider';
    protected static $primaryKeyName = 'main_slider_id';
}