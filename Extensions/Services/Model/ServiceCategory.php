<?php

namespace App\Extensions\Services\Model;

use Simflex\Core\ModelBase;

/**
 * @property int category_id
 * @property int npp
 * @property boolean is_active
 * @property string name
 * @property string subtitle
 * @property string short
 */

class ServiceCategory extends ModelBase
{
    protected static $table = 'service_category';
    protected static $primaryKeyName = 'category_id';

}
