<?php

namespace App\Extensions\Site\Model;

use Simflex\Core\ModelBase;

/**
 * @property int doc_id
 * @property int npp
 * @property int doc_category_id
 * @property text text
 * @property string name
 *
 * @property DocumentsCategory category
 */

class Documents extends ModelBase
{
    protected static $table = 'documents';
    protected static $primaryKeyName = 'doc_id';

    public function offsetGetCategory(): DocumentsCategory
    {
        return DocumentsCategory::findOne(['doc_category_id' => $this->doc_category_id]);
    }
}