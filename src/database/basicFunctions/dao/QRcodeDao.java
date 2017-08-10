package database.basicFunctions.dao;

import java.util.List;

import database.common.BaseDao;
import database.models.QRCode;

public interface QRcodeDao extends BaseDao<QRCode>{

	public QRCode getByKey(String key);

	public List<QRCode> findAllByTime();
	
}
