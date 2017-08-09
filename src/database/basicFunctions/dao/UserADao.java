package database.basicFunctions.dao;

import java.util.List;

import database.common.BaseDao;
import database.models.UserA;

public interface UserADao extends BaseDao<UserA>{

	public List<UserA> getByHql(String hql);
	
	public UserA insert(UserA user);
	
	public void updateUser(UserA user);

}
