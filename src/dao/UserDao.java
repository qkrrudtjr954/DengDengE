package dao;

public class UserDao {
	private static UserDao userDao = null;
	private UserDao() {
		
	}
	public UserDao getInstance() {
		if(userDao==null) {
			userDao = new UserDao();
		}
		
		return userDao;
	}
}
