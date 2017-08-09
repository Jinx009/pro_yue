package database.basicFunctions.dao;

import database.common.BaseDao;
import database.models.QRCode;

public interface QRcodeDao extends BaseDao<QRCode>{

	public QRCode getByKey(String key);
	
}
