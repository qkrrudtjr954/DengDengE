
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
	public User getUserByEmail(String email) {
		return userDao.getUserByEmail(email);
	}
	public User addUser(User user) {
		boolean result = userDao.addUser(user);
		
		User returnUser = new User();
		
		if(result) {
			returnUser = userDao.getUserByEmail(user.getEmail());
		}
		
		return returnUser;
	}
	
	
	public boolean UserUpdate(User Userdto) {
		return userDao.UserUpdate(Userdto);
	}
	
	
	
	// service 는 dao를 singleton으로 호출합니다.
}
