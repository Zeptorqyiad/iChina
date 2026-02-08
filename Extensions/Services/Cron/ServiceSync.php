<?php

namespace App\Extensions\Services\Cron;

use Simflex\Core\DB;

class ServiceSync
{
    public static function sync(): void
    {
        DB::query(
            "INSERT INTO `service` (`type`, `ref_id`,
  `npp`, `is_active`, `name`, `alias`, `icon`, `shortly`)
               SELECT 'big', `sb_id`, `npp`, `is_active`,
  `name`, `alias`, `icon`, `shortly`
               FROM `service_big`
               ON DUPLICATE KEY UPDATE
                  `npp` = VALUES(`npp`),
                  `is_active` = VALUES(`is_active`),
                  `name` = VALUES(`name`),
                  `alias` = VALUES(`alias`),
                  `icon` = VALUES(`icon`),
                  `shortly` = VALUES(`shortly`)"
        );

        DB::query(
            "INSERT INTO `service` (`type`, `ref_id`,
  `npp`, `is_active`, `name`, `alias`, `icon`, `shortly`)
               SELECT 'small', `sm_id`, `npp`, `is_active`,
  `name`, `alias`, `icon`, `shortly`
               FROM `service_small`
               ON DUPLICATE KEY UPDATE
                  `npp` = VALUES(`npp`),
                  `is_active` = VALUES(`is_active`),
                  `name` = VALUES(`name`),
                  `alias` = VALUES(`alias`),
                  `icon` = VALUES(`icon`),
                  `shortly` = VALUES(`shortly`)"
        );

        DB::query("TRUNCATE TABLE `service_p2c`");

        DB::query(
            "INSERT INTO `service_p2c` (`category_id`,
  `service_id`)
               SELECT p.`category_id`, s.`service_id`
               FROM `service_p2c_big` p
               JOIN `service` s ON s.`type` = 'big' AND
  s.`ref_id` = p.`sb_id`"
        );

        DB::query(
            "INSERT INTO `service_p2c` (`category_id`,
  `service_id`)
               SELECT p.`category_id`, s.`service_id`
               FROM `service_p2c_small` p
               JOIN `service` s ON s.`type` = 'small' AND
  s.`ref_id` = p.`sm_id`"
        );
    }
}