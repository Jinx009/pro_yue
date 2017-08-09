package database.basicFunctions.dao;

import java.util.List;

import javax.persistence.Query;

import org.springframework.stereotype.Repository;

import database.common.BaseDaoImpl;
import database.models.UserA;

@Repository("userADao")
public class UserADaoImp extends BaseDaoImpl<UserA> implements UserADao{

	@SuppressWarnings("unchecked")
	public List<UserA> getByHql(String hql) {
		Query query = em.createQuery(hql);
		List<UserA> list = query.getResultList();
		if(null!=list&&!list.isEmpty()){
			return list;
		}
		return null;
	}

	public UserA insert(UserA user) {
		return save(user);
	}

	public void updateUser(UserA user) {
		update(user);
	}

}
