package database.basicFunctions.dao;

import java.util.List;

import database.common.BaseDao;
import database.models.UserConnA;

public interface UserConnADao extends BaseDao<UserConnA>{
	public List<UserConnA> getByHql(String hql);
}
