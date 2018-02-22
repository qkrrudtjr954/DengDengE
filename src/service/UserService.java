package service;

import dao.UserDao;

public class UserService{
	// service는 dao만 콜할 수 있습니다.
	private static UserService userService = null;
	private UserService() {
		
	}
	public static UserService getInstance() {
		if(userService==null) {
			userService = new UserService();
		}
		
		return userService;
	}
	
	// service 는 dao를 singleton으로 호출합니다.
}
