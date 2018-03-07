package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import db.DBClose;
import db.DBConnection;
import dto.CategoryDto;
import dto.SendMaster;


public class SendMsgDao {
	
	private static SendMsgDao sendMsg = new SendMsgDao();

	public SendMsgDao() {
		DBConnection.initConnect();
	}

	public SendMsgDao getInstance() {

		return sendMsg;
	}
	
	
	
	public boolean sendToMaster(SendMaster sendMaster) {
		String sql = " INSERT INTO SENDMASTER( SEQ, TARGET_USER_SEQ, CATEGORY, TITLE, EMAIL, CONTENT, COMPLETE, REG_DATE ) "
				+ "	VALUES (SENDMASTER_SEQ.NEXTVAL, ?, ?, ?, ?, ?, 0, SYSDATE) ";
		int count = 0;
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;

		try {
			conn = DBConnection.makeConnection();
			System.out.println("2/6 sendToMaster Success");

			psmt = conn.prepareStatement(sql);
			System.out.println("3/6 sendToMaster Success");
			
			psmt.setInt(1, sendMaster.getTarget_user_seq());
			psmt.setString(2, sendMaster.getCategory());
			psmt.setString(3, sendMaster.getTitle());
			psmt.setString(4, sendMaster.getEmail());
			psmt.setString(5, sendMaster.getContent());

			System.out.println(sql);
			count = psmt.executeUpdate();
			System.out.println("4/6 sendToMaster Success");

		} catch (SQLException e) {
			System.out.println("sendToMaster fail");
			System.out.println(e.getMessage());
			System.out.println(e.getErrorCode());
			System.out.println(e.getSQLState());

			count = -1;

		} finally {
			DBClose.close(psmt, conn, rs);
		}

		return count > 0 ? true : false;
	}


}
