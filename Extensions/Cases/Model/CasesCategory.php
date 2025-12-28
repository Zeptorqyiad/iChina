<?php
namespace App\Extensions\Cases\Model;

use Simflex\Core\ModelBase;

/**
 * @property int cc_id
 * @property int npp
 * @property string name
 * @property string type
 */
class CasesCategory extends ModelBase
{
	protected static $table = 'cases_category';
	protected static $primaryKeyName = 'cc_id';

	public function getCount()
	{
		return Cases::findAdv()->where('cc_id = ' . $this->cc_id . ' AND is_active = 1')->select('count(*)')->fetchScalar();
	}

	public static function getTotalCount()
	{
		return Cases::findAdv()->where('is_active = 1')->select('count(*)')->fetchScalar();
	}
}