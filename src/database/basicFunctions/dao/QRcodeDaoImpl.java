package database.basicFunctions.dao;


import java.util.List;

import org.springframework.stereotype.Repository;

import database.common.BaseDaoImpl;
import database.common.QueryParam;
import database.common.OrderFilter.OrderType;
import database.models.QRCode;

@Repository("QRCodeDao")
public class QRcodeDaoImpl extends BaseDaoImpl<QRCode> implements QRcodeDao{

	public QRCode getByKey(String key) {
		QueryParam queryParam = QueryParam.getInstance();
		queryParam.addParam("keyword",key);
		return findByCriteriaForUnique(queryParam);
	}

	public List<QRCode> findAllByTime() {
		QueryParam queryParam = QueryParam.getInstance();
		queryParam.addOrder(OrderType.DESC,"createTime");
		return findByCriteria(queryParam);
	}

}
