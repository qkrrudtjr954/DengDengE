package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import db.DBClose;
import db.DBConnection;
import dto.CommuBbsDto;

public class CommuBbsDao implements iCommuBbsDao{
	private static CommuBbsDao comDao = new CommuBbsDao();
	
	public CommuBbsDao() {
		DBConnection.initConnect();
	}
	
	public CommuBbsDao getInstance() {
		
		return comDao;
	}
	
	@Override
	public List<CommuBbsDto> getCommulist() {
		List<CommuBbsDto> list = new ArrayList<>();

		/*String sql = "SELECT TITLE, TARGET_USER_SEQ, TARGET_CATEGORY, REG_DATE "*/
	/*	String sql = "SELECT * "
				+ "	FROM COMMUBBS "
				+ " ORDER BY REG_DATE DESC ";*/
		
		String sql = " SELECT a.TITLE as title, target_user_seq, a.reg_date as reg_date, del, b.title as category_name  "
				+ " FROM COMMUBBS A, CATEGORY B "
				+ " WHERE A.TARGET_CATEGORY = B.TARGET_CATEGORY "
				+ " ORDER BY REG_DATE DESC ";
	
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;

		try {
			conn = DBConnection.makeConnection();
			System.out.println("2/6 getCommulist Success");

			psmt = conn.prepareStatement(sql);
			System.out.println("sql = " + sql);
			System.out.println("3/6 getCommulist Success");

			rs = psmt.executeQuery();
			System.out.println("4/6 getCommulist Success");

			while (rs.next()) {
				int i = 1;
				//int seq, String title, String pic1, String content, int target_user_seq, int target_category,
				//int readcount, String reg_date, String last_update, int del

				CommuBbsDto dto = new CommuBbsDto(0, // seq
												rs.getString(i++),// title
												"",// String pic1 
												"",//String content
												rs.getInt(i++),//int target_user_seq
												0,//int target_category
												0,//int readcount
												rs.getString(i++),//String reg_date
												"",//String last_update 
												rs.getInt(i++),//int del
												rs.getString(i++)); //category_name
				list.add(dto);
			}
			System.out.println("5/6 getCommulist Success");

		} catch (SQLException e) {
			System.out.println("getCommulist fail");
		} finally {
			   try {
				   if(rs != null) {
				    rs.close();
				   }

				  if(psmt != null) {
				     psmt.close();
				  }
				  if(conn !=null) {
					  conn.close();
				  }
			   } catch (SQLException e) {
			   }
		}

		return list;
	}
	//글 읽거나 가져오기 
	@Override
	public CommuBbsDto getCommu(int seq) {
		String sql = " SELECT a.TITLE as title, target_user_seq, a.reg_date as reg_date, del, b.title as category_name  "
				+ " FROM COMMUBBS A, CATEGORY B "
				+ " WHERE A.TARGET_CATEGORY = B.TARGET_CATEGORY ";

		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;

		CommuBbsDto dto = null;

		try {
			conn = DBConnection.makeConnection();
			System.out.println("2/6 S getCommu");

			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, seq);
			System.out.println("3/6 S getCommu");

			rs = psmt.executeQuery();
			System.out.println("4/6 S getCommu");

			while (rs.next()) {
				int i = 1;
				dto = new CommuBbsDto(rs.getInt(i++), // seq
						rs.getString(i++),// title
						"",// String pic1 
						rs.getString(i++),//String content
						rs.getInt(i++),//int target_user_seq
						0,//int target_category
						rs.getInt(i++),//int readcount
						rs.getString(i++),//String reg_date
						"",//String last_update 
						rs.getInt(i++),//int del
						rs.getString(i++)); //category_name
			}
			System.out.println("5/6 S getCommu");

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBClose.close(psmt, conn, rs);
			System.out.println("6/6 S getBbs");
		}

		return dto;
	}
	@Override
	public void readCount(int seq) {
		// TODO Auto-generated method stub
		
	}
	//글쓰기
	@Override
	public boolean writeCommu(CommuBbsDto comdto) {
		String sql = "INSERT INTO COMMUBBS(SEQ, TITLE, PIC1, CONTENT, TARGET_USER_SEQ, "
				+ " TARGET_CATEGORY, READCOUNT, REG_DATE, LAST_UPDATE, DEL ) "
				+ " VALUES(COMMUBBS_SEQ.NEXTVAL, ?, '', ?, ?, ?, 0, SYSDATE, SYSDATE, 0) ";



		int count = 0;

		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;

		try {
			conn = DBConnection.makeConnection();
			System.out.println("2/6 writeCommu Success");

			psmt = conn.prepareStatement(sql);
			System.out.println("3/6 writeCommu Success");

			psmt.setString(1, comdto.getTitle());
			psmt.setString(2, comdto.getContent());
			psmt.setInt(3, comdto.getTarget_user_seq());
			psmt.setInt(4, comdto.getTarget_category());
			
			System.out.println(sql);
			count = psmt.executeUpdate();
			System.out.println("4/6 writeCommu Success");

		} catch (SQLException e) {
			System.out.println("writeCommu fail");
			System.out.println(e.getMessage());
			System.out.println(e.getErrorCode());
			System.out.println(e.getSQLState());

		} finally {
			DBClose.close(psmt, conn, rs);
		}

		return count > 0 ? true : false;
	}
	@Override
	public boolean delCommu(int seq) {
		// TODO Auto-generated method stub
		return false;
	}
	@Override
	public boolean udtCommu(int seq, CommuBbsDto comdto) {
		// TODO Auto-generated method stub
		return false;
	}
	
	
}
