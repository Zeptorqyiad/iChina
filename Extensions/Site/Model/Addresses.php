<?php

namespace App\Extensions\Site\Model;

use App\Extensions\Site\Model\Faq;
use Simflex\Core\ModelBase;

/**
 * @property int addresses_id
 * @property int npp
 * @property string title
 * @property string address
 * @property string type
 * @property boolean is_active
 */
class Addresses extends ModelBase
{
    protected static $table = 'addresses';
    protected static $primaryKeyName = 'addresses_id';

}