package dao;

import dto.User;

public interface iUserDao {
	public User getUserByEmailAndPassword(User user);
}
