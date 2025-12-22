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
 * @property text content
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

    public function getContent(): array
    {
        return json_decode($this->content, true)['v'] ?? [];
    }
}