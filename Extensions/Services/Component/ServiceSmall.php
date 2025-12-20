<?php

namespace App\Extensions\Services\Component;

use Simflex\Core\Container;
use Simflex\Core\Factory;
use App\Extensions\Breadcrumbs\Breadcrumbs;
use Simflex\Core\Request;
use Simflex\Extensions\Content\Content;
use Simflex\Extensions\Content\Model\ModelContent;

class ServiceSmall extends Content
{
    protected ?\App\Extensions\Services\Model\ServiceSmall $service;
    protected string $path = '';
    protected int $c = 0;

    public function __construct(protected Request $request, protected Factory $factory)
    {
        parent::__construct($this->factory);
    }

    public function get($path = '/services/service_small/'): ?ModelContent
    {
        $ret = parent::get($this->path);
        if ($this->service) {
            $ret['title'] = $this->service->name;
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

        $this->service = \App\Extensions\Services\Model\ServiceSmall::findOne(['alias' => Container::getRequest()->getUrlLastPart()]);
        if ($this->service) {
            Breadcrumbs::remove('/services/service_small/');
            Breadcrumbs::add($this->service->name, '/services/' . $this->service->alias . '/');
            $this->path = '/services/service_small/';
        }

        parent::content();
    }
}