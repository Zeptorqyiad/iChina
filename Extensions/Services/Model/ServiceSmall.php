<?php

namespace App\Extensions\Services\Model;

use Simflex\Core\ModelBase;

/**
 * @property int service_small_id
 * @property int npp
 * @property boolean is_active
 * @property string alias
 * @property string path
 * @property string name
 *
 * @property string fs_title
 * @property string fs_desc
 * @property string fs_image
 * @property table fs_offer_list
 *
 * @property string stages_title
 * @property string stages_desc
 * @property table stages_cards
 *
 * @property string risks_title
 * @property string risks_desc
 * @property table risks_text
 * @property string risks_callback_title
 * @property string risks_callback_desc
 *
 * @property string other_services_title
 * @property string other_services_desc
 * @property table other_services_services
 *
 * @property string faq_title
 * @property string faq_desc
 * @property table faq_faq
 *
 * @property table seo_items
 */

class ServiceSmall extends ModelBase
{
    protected static $table = 'service_small';

    protected static $primaryKeyName = 'service_small_id';

    public function getOfferList(): array
    {
        return json_decode($this->fs_offer_list, true)['v'] ?? [];
    }
    public function getStagesCards(): array
    {
        return json_decode($this->stages_cards, true)['v'] ?? [];
    }
    public function getRisksText(): array
    {
        return json_decode($this->risks_text, true)['v'] ?? [];
    }
    public function getOtherServicesCards(): array
    {
        return json_decode($this->other_services_services, true)['v'] ?? [];
    }
    public function getFaqCards(): array
    {
        return json_decode($this->faq_faq, true)['v'] ?? [];
    }
    public function getSeoItems(): array
    {
        return json_decode($this->seo_items, true)['v'] ?? [];
    }
}