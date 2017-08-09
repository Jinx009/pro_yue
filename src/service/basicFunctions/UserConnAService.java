package service.basicFunctions;

import java.util.Date;
import java.util.List;

import database.models.UserConnA;

public interface UserConnAService {
	public UserConnA insert(UserConnA userConn);
	
	public void update(UserConnA userConn);
	
	public List<UserConnA> getByHql(String hql);

	public UserConnA find(Integer id);

	public int getNum(Date date, Date date2);

}
