package service;

import dao.UserDao;
import dto.User;

public class UserService{
	// service는 dao만 콜할 수 있습니다.
	public static UserService userService = null;
	private UserDao userDao = null;
	private UserService() {
		userDao = new UserDao();
	}
	public static UserService getInstance() {
		if(userService==null) {
			userService = new UserService();
		}
		
		return userService;
	}
	
	public User getUserByEmailAndPassword(User user) {
		return userDao.getUserByEmailAndPassword(user);
	}
	
	// service 는 dao를 singleton으로 호출합니다.
}
