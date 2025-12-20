<?php

namespace App\Extensions\Blog\Model;

use Simflex\Core\ModelBase;

/**
 * @property int blog_id
 * @property int npp
 * @property string name
 * @property string short
 * @property string date
 * @property string photo
 * @property string alias
 * @property string path
 * @property string content
 * @property int bc_id
 * @property string photo_mob
 * @property int likes
 * @property int dislikes
 * @property boolean pinned
 * @property boolean is_active
 * @property int views
 * @property string meta_kw
 * @property string meta_desc
 * @property string meta_title
 * @property string seo_title
 * @property string seo_desc
 * @property string seo2_title
 * @property string seo2_desc
 *
 * @property BlogCategory category
 */

class Blog extends ModelBase
{
    protected static $table = 'blog';
    protected static $primaryKeyName = 'blog_id';

    public function offsetGetCategory(): BlogCategory
    {
        return new BlogCategory($this->bc_id);
    }

    public function getContent(): array
    {
        return json_decode($this->content, true)['v'] ?? [];
    }
}