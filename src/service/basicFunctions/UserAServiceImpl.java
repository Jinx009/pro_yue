package service.basicFunctions;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import database.basicFunctions.dao.UserADao;
import database.models.UserA;

@Service("userAService")
public class UserAServiceImpl implements UserAService{

	@Autowired
	private UserADao userADao;
	
	
	public UserA getByOpenId(String openId) {
		StringBuffer buffer = new StringBuffer();
		buffer.append(" FROM UserA WHERE  openid ='");
		buffer.append(openId);
		buffer.append("'  ");
		List<UserA> list = userADao.getByHql(buffer.toString());
		if(null!=list&&!list.isEmpty()){
			return list.get(0);
		}
		return null;
	}

	public UserA save(UserA user) {
		return userADao.save(user);
	}

	public void update(UserA user) {
		userADao.update(user);
	}

	public UserA findById(Integer userId) {
		return userADao.find(userId);
	}

	public List<UserA> getByHql(String hql) {
		return userADao.getByHql(hql);
	}
}
