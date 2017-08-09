package service.basicFunctions;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import database.basicFunctions.dao.UserConnADao;
import database.models.UserConnA;

@Service("userConnAService")
public class UserConnAServiceImpl implements UserConnAService{
	
	@Autowired
	private UserConnADao userConnADao;
	
	public UserConnA insert(UserConnA userConn) {
		return userConnADao.save(userConn);
	}

	public void update(UserConnA userConn) {
		userConnADao.update(userConn);
	}

	public List<UserConnA> getByHql(String hql) {
		return userConnADao.getByHql(hql);
	}

	public UserConnA find(Integer id) {
		return userConnADao.find(id);
	}

	public int getNum(Date date, Date date2) {
		String hql = " from UserConnA where status = 1 and addTime < '"+ new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(date)+"'"
				+ "and addTime >'"+ new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(date2)+"' "
						+ "and userGo = 1 and likeGo = 1";
		List<UserConnA> list = userConnADao.getByHql(hql);
		if(list!=null){
			return list.size();
		}
		return 0;
	}

}
