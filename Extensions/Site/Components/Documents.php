<?php

namespace App\Extensions\Site\Components;

use Simflex\Core\Container;
use Simflex\Core\Factory;
use Simflex\Core\Log;
use App\Extensions\Breadcrumbs\Breadcrumbs;
use Simflex\Core\Page;
use Simflex\Core\Request;
use Simflex\Extensions\Content\Content;
use Simflex\Extensions\Content\Model\ModelContent;

class Documents extends Content
{
    protected ?\App\Extensions\Site\Model\Documents $document;
    protected string $path = '/documents/';
    protected int $c = 0;

    public function __construct(protected Request $request, protected Factory $factory)
    {
        parent::__construct($this->factory);
    }

    public function get($path = ''): ?ModelContent
    {
        $ret = parent::get($this->path);
        if ($this->document) {
            $ret['title'] = $this->document->name;
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

        $this->document = \App\Extensions\Site\Model\Documents::findOne(['alias' => Container::getRequest()->getUrlLastPart()]);
        if ($this->document) {
            Breadcrumbs::remove('/documents/document/');
            Breadcrumbs::add($this->document->name, '/documents/' . $this->document->alias . '/');
            $this->path = '/documents/document/';

            $this->document->save();
        }

        parent::content();
    }
}