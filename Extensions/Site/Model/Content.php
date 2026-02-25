<?php

namespace App\Extensions\Site\Model;

use App\Extensions\Site\Model\Faq;
use Simflex\Core\ModelBase;

/**
 * @property int content_id
 */

class Content extends ModelBase
{
    protected static $table = 'content';
    protected static $primaryKeyName = 'content_id';

}