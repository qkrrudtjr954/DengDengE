package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.List;

import db.DBConnection;
import dto.User;

public class UserDao {
	private static UserDao userDao = null;
	private UserDao() {
		DBConnection.initConnect();
	}
	public UserDao getInstance() {
		if(userDao==null) {
			userDao = new UserDao();
		}
		
		return userDao;
	}
	
	
}
