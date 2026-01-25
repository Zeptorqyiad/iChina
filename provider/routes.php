<?php

return [
	'/' => App\Extensions\Content\Content::class,
	'/reviews' => App\Extensions\Reviews\Component\Reviews::class,
	'/cases' => App\Extensions\Cases\Component\Cases::class,
	'/blog' => App\Extensions\Blog\Component\Blog::class,
	'/documents' => App\Extensions\Site\Components\Documents::class,
    '/services' => App\Extensions\Services\Component\Service::class,
];