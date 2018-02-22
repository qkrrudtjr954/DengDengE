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
	private static CommuBbsDao comDao = null;
	public CommuBbsDao() {
		// TODO Auto-generated constructor stub
	}
	public CommuBbsDao getInstance() {
		if(comDao==null) {
			comDao = new CommuBbsDao();
		}
		
		return comDao;
	}
	
	@Override
	public List<CommuBbsDto> getCommulist() {
		List<CommuBbsDto> list = new ArrayList<>();

		String sql = "SELECT*FROM COMMUBBS "
					+ " ORDER BY REG_DATE DESC ";
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;

		try {
			conn = DBConnection.makeConnection();
			System.out.println("2/6 getCommulist Success");

			psmt = conn.prepareStatement(sql);
			System.out.println("3/6 getCommulist Success");

			rs = psmt.executeQuery();
			System.out.println("4/6 getCommulist Success");

			while (rs.next()) {
				int i = 1;
				//int seq, String title, String pic1, String content, int target_user_seq, int target_category,
				//int readcount, String reg_date, String last_update, int del

				CommuBbsDto dto = new CommuBbsDto(rs.getInt(i++), // seq
												rs.getString(i++),// title
												rs.getString(i++),// String pic1 
												rs.getString(i++),//String content
												rs.getInt(i++),//int target_user_seq
												rs.getInt(i++),//int target_category
												rs.getInt(i++),//int readcount
												rs.getString(i++),//String reg_date
												rs.getString(i++),//String last_update 
												rs.getInt(i++));//int del
				list.add(dto);
			}
			System.out.println("5/6 getCommulist Success");

		} catch (SQLException e) {
			System.out.println("getCommulist fail");
		} finally {
			DBClose.close(psmt, conn, rs);
			System.out.println("6/6 getCommulist Success");
		}

		return list;
	}
	@Override
	public CommuBbsDto getCommu(int seq) {
		// TODO Auto-generated method stub
		return null;
	}
	@Override
	public void readCount(int seq) {
		// TODO Auto-generated method stub
		
	}
	@Override
	public boolean writeCommu(CommuBbsDto comdto) {
		String sql = "INSERT INTO COMMUBBS(SEQ, TITLE, PIC1, CONTENT, TARGET_USER_SEQ, "
				+ " TARGET_CATEGORY, READCOUNT, REG_DATE, LAST_UPDATE, DEL ) "
				+ " VALUES(COMMUBBS_SEQ.NEXTVAL, ?, ?, ?, ?, ?, 0, SYSDATE, SYSDATE, 0) ";

		System.out.println(sql);

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
			psmt.setString(2, comdto.getPic1());
			psmt.setString(3, comdto.getContent());
			psmt.setInt(4, comdto.getTarget_user_seq());
			psmt.setInt(5, comdto.getTarget_category());

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
