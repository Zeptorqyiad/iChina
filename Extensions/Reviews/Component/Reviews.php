<?php

namespace App\Extensions\Reviews\Component;

use Simflex\Core\Container;
use Simflex\Core\Factory;
use Simflex\Core\Log;
use App\Extensions\Breadcrumbs\Breadcrumbs;
use Simflex\Core\Page;
use Simflex\Core\Request;
use Simflex\Extensions\Content\Content;
use Simflex\Extensions\Content\Model\ModelContent;

class Reviews extends Content
{
    protected ?\App\Extensions\Reviews\Model\Reviews $review;
    protected string $path = '/reviews/';
    protected int $c = 0;

    public function __construct(protected Request $request, protected Factory $factory)
    {
        parent::__construct($this->factory);
    }

    public function get($path = ''): ?ModelContent
    {
        $ret = parent::get($this->path);
        if ($this->review) {
            $ret['title'] = $this->review->category->name;
        }

        return $ret;
    }
    protected function content(): void
    {
        if ($act = $this->request->request('action')) {
            if (method_exists($this, $act)) {
                exit(json_encode($this->{$act}(), JSON_UNESCAPED_UNICODE));
            }
        }

        $this->c = $this->request->request('c', 0);

        $this->review = \App\Extensions\Reviews\Model\Reviews::findOne(['alias' => Container::getRequest()->getUrlLastPart()]);
        if ($this->review) {
            Breadcrumbs::remove('/reviews/review/');
            Breadcrumbs::add($this->review->name, '/reviews/' . $this->review->alias . '/');
            $this->path = '/reviews/review/';

            Page::$override['description'] = $this->review->meta_desc;
            Page::$override['keywords'] = $this->review->meta_kw;

            if($this->review->meta_title) {
                Page::$override['title'] = $this->review->meta_title;
            } else {
                Page::$override['title'] = $this->review->name;
            }

            $this->review->save();
        }

        parent::content();
    }
}