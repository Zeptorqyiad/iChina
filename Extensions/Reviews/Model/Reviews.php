<?php

namespace App\Extensions\Reviews\Model;

use Simflex\Core\ModelBase;

/**
 * @property int reviews_id
 * @property int npp
 * @property string name
 * @property string short
 * @property string date
 * @property boolean is_active
 * @property string photo
 * @property string alias
 * @property string path
 * @property string photo_mob
 * @property string content
 * @property string video_horizontal
 * @property string video_vertical
 * @property string meta_kw
 * @property string meta_desc
 * @property string meta_title
 * @property string seo_title
 * @property string seo_desc
 * @property string seo2_title
 * @property string seo2_desc
 */

class Reviews extends ModelBase
{
    protected static $table = 'reviews';
    protected static $primaryKeyName = 'reviews_id';

    public function getContent(): array
    {
        return json_decode($this->content, true)['v'] ?? [];
    }

	public static function getTotalCount()
	{
		return Reviews::findAdv()->where('is_active = 1')->select('count(*)')->fetchScalar();
	}
}