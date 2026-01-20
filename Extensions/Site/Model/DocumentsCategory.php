<?php

namespace App\Extensions\Site\Model;

use Simflex\Core\ModelBase;

/**
 * @property int doc_category_id
 * @property int npp
 * @property string name
 * @property string anchor
 */

class DocumentsCategory extends ModelBase
{
    protected static $table = 'documents_category';
    protected static $primaryKeyName = 'doc_category_id';

    public function getChildrenDocuments()
    {
        return Documents::find(['doc_category_id' => $this->doc_category_id]);
    }
}