<?php

namespace App\Extensions\Reviews\Model;

use Simflex\Core\ModelBase;

/**
 * @property int rev_id
 * @property int npp
 * @property string name
 * @property string type
 */

class ReviewsCategory extends ModelBase
{
    protected static $table = 'reviews_category';
    protected static $primaryKeyName = 'rev_id';

    public function getContent(): array
    {
        return json_decode($this->content, true)['v'] ?? [];
    }
}