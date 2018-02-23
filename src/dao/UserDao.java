package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import db.DBConnection;
import dto.User;

public class UserDao implements iUserDao{
	
	public UserDao() {
		DBConnection.initConnect();
	}

	@Override
	public User getUserByEmailAndPassword(User user) {
		String sql = " select * from denguser where email=? and password=? ";
		System.out.println(">>>>> UserDao .getUserByEmailAndPassword() sql : "+sql);
		
		Connection conn = DBConnection.makeConnection();
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		User result = new User();
		
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, user.getEmail());
			psmt.setString(2, user.getPassword());
			
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				result.setAuthor(rs.getInt("author"));
				result.setEmail(rs.getString("email"));
				result.setLast_update(rs.getString("last_update"));
				result.setPassword(rs.getString("password"));
				result.setReg_date(rs.getString("reg_date"));
				result.setSeq(rs.getInt("seq"));
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;
	}

	public User getUserByEmail(String email) {
		String sql = " select * from denguser where email=? ";
		System.out.println(">>>>> UserDao .getUserByEmail() sql : "+sql);
		
		Connection conn = DBConnection.makeConnection();
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		User result = new User();
		
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, email);
			
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				result.setAuthor(rs.getInt("author"));
				result.setEmail(rs.getString("email"));
				result.setLast_update(rs.getString("last_update"));
				result.setPassword(rs.getString("password"));
				result.setReg_date(rs.getString("reg_date"));
				result.setSeq(rs.getInt("seq"));
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;
	}

	public boolean addUser(User user) {
		String sql = " insert into denguser(seq, email, password, reg_date, last_update, auth) values(denguser_seq.nextval, ?, ?, sysdate, sysdate, 0) ";
		System.out.println(">>>>> UserDao .addUser() sql : "+sql);
		
		Connection conn = DBConnection.makeConnection();
		PreparedStatement psmt = null;
		int count = 0;
		
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, user.getEmail());
			psmt.setString(2, user.getPassword());
			
			count = psmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return (count > 0) ? true : false;
	}
	
}
