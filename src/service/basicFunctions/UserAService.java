package service.basicFunctions;

import java.util.List;

import database.models.UserA;

public interface UserAService {
	public UserA getByOpenId(String openId);

	public UserA save(UserA user);
	
	public void update(UserA user);

	public UserA findById(Integer userId);
	
	public List<UserA> getByHql(String hql);

}
