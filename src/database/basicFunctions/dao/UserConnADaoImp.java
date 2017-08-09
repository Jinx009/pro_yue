package database.basicFunctions.dao;

import java.util.List;

import javax.persistence.Query;

import org.springframework.stereotype.Repository;

import database.common.BaseDaoImpl;
import database.models.UserConnA;

@Repository("userConnADao")
public class UserConnADaoImp  extends BaseDaoImpl<UserConnA> implements UserConnADao{
	@SuppressWarnings("unchecked")
	public List<UserConnA> getByHql(String hql) {
		Query query = em.createQuery(hql);
		List<UserConnA> list = query.getResultList();
		if(null!=list&&!list.isEmpty()){
			return list;
		}
		return null;
	}
}
