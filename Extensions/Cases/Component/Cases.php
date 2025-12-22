<?php

namespace App\Extensions\Cases\Component;

use Simflex\Core\Container;
use Simflex\Core\Factory;
use Simflex\Core\Log;
use App\Extensions\Breadcrumbs\Breadcrumbs;
use Simflex\Core\Page;
use Simflex\Core\Request;
use Simflex\Extensions\Content\Content;
use Simflex\Extensions\Content\Model\ModelContent;

class Cases extends Content
{
  protected ?\App\Extensions\Cases\Model\Cases $case;
  protected string $path = '/cases/';
  protected int $c = 0;

  public function __construct(protected Request $request, protected Factory $factory)
  {
    parent::__construct($this->factory);
  }

  public function get($path = ''): ?ModelContent
  {
    $ret = parent::get($this->path);
    if ($this->case) {
      $ret['title'] = $this->case->name;
    }
    return $ret;
  }

  protected function content(): void
  {
    $this->c = $this->request->request('c', 0);

    $this->case = \App\Extensions\Cases\Model\Cases::findOne([
        'alias' => Container::getRequest()->getUrlLastPart()
    ]);

    if ($this->case) {
      $this->path = '/cases/case/';
    }

    parent::content();
  }
}
