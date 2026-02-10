<?php

namespace App\Layout\Components\Common\OtherServices;

use App\Layout\LayoutBase;
use Simflex\Core\DB;

class Layout extends LayoutBase
{
    private const ITEM_CLASSES = ['first', 'second', 'third', 'fouth', 'fivth'];

    public static function draw(array $data = [])
    {
        $data['items'] = self::buildItems($data);
        parent::draw($data);
    }

    private static function buildItems(array $data): array
    {
        $ids = self::extractIds($data);
        if (!$ids) {
            return [];
        }

        $ids = array_slice($ids, 0, 5);
        $rows = self::loadServicesByIds($ids);
        if (!$rows) {
            return [];
        }

        $items = [];
        foreach ($ids as $index => $id) {
            if (!isset($rows[$id])) {
                continue;
            }

            $row = $rows[$id];
            $items[] = [
                'className' => self::ITEM_CLASSES[$index] ?? '',
                'title' => $row['name'] ?? '',
                'desc' => $row['shortly'] ?? '',
                'link' => !empty($row['alias']) ? '/services/' . $row['alias'] . '/' : '#',
                'icon' => $row['icon'] ?? '',
            ];
        }

        return $items;
    }

    private static function extractIds(array $data): array
    {
        $items = $data['items'] ?? null;
        if ($items === null) {
            $items = [];
            for ($i = 1; $i <= 5; $i++) {
                if (isset($data['card-' . $i])) {
                    $items[] = $data['card-' . $i];
                }
            }
        }

        if (is_string($items)) {
            $decoded = json_decode($items, true);
            if (is_array($decoded)) {
                $items = $decoded['v'] ?? $decoded;
            } else {
                $items = array_map('trim', explode(',', $items));
            }
        } elseif (is_array($items) && isset($items['v']) && is_array($items['v'])) {
            $items = $items['v'];
        }

        if (!is_array($items)) {
            return [];
        }

        $ids = [];
        foreach ($items as $item) {
            $id = $item;
            if (is_array($item)) {
                $id = $item['id'] ?? $item['service_id'] ?? $item['value'] ?? null;
            }

            $id = (int)$id;
            if ($id > 0) {
                $ids[] = $id;
            }
        }

        return $ids;
    }

    private static function loadServicesByIds(array $ids): array
    {
        $ids = array_values(array_unique(array_map('intval', $ids)));
        if (!$ids) {
            return [];
        }

        $q = DB::query(
            'SELECT service_id, name, shortly, alias, icon FROM service WHERE service_id IN (' . implode(',', $ids) . ')'
        );

        $rows = [];
        while ($row = DB::fetch($q)) {
            $rows[(int)$row['service_id']] = $row;
        }

        return $rows;
    }
}
