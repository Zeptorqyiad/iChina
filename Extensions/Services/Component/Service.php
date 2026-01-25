<?php

namespace App\Extensions\Services\Component;

use Simflex\Core\Container;
use Simflex\Core\Factory;
use App\Extensions\Breadcrumbs\Breadcrumbs;
use Simflex\Core\Request;
use Simflex\Extensions\Content\Content;
use Simflex\Extensions\Content\Model\ModelContent;
use App\Extensions\Services\Model\ServiceSmall as ServiceSmallModel;
use App\Extensions\Services\Model\ServiceBig as ServiceBigModel;

class Service extends Content
{
    protected $service;
    protected string $path = '';
    protected int $c = 0;

    public function __construct(protected Request $request, protected Factory $factory)
    {
        parent::__construct($this->factory);
    }

    public function get($path = '/services/'): ?ModelContent
    {
        $effectivePath = $this->path ?: ($path ?: Container::getRequest()->getPath());
        $ret = parent::get($effectivePath);

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

        $alias = Container::getRequest()->getUrlLastPart();

        if ($alias && $alias !== 'services') {
            $this->service = ServiceSmallModel::findOne(['alias' => $alias]);
            $templatePath = '/services/service_small/';

            if (!$this->service) {
                $this->service = ServiceBigModel::findOne(['alias' => $alias]);
                $templatePath = '/services/service_big/';
            }

            if ($this->service) {
                Breadcrumbs::remove($templatePath);
                Breadcrumbs::add($this->service->name, '/services/' . $this->service->alias . '/');

                $this->path = $templatePath;
            }
        }

        parent::content();
    }
}