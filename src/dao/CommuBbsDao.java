package dao;

import java.beans.Statement;
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
	//메인 리스트 
	@Override
	public List<CommuBbsDto> getCommulist() {
		List<CommuBbsDto> list = new ArrayList<>();

		
		String sql = " SELECT a.seq, a.TITLE as title, target_user_seq, a.reg_date as reg_date, del, b.title as category_name  "
				+ " FROM COMMUBBS A, CATEGORY B "
				+ " WHERE A.TARGET_CATEGORY = B.TARGET_CATEGORY AND DEL=0"
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

				CommuBbsDto dto = new CommuBbsDto(rs.getInt(i++), // seq
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
			System.out.println("writeCommu fail");
			System.out.println(e.getMessage());
			System.out.println(e.getErrorCode());
			System.out.println(e.getSQLState());

		} finally {
			DBClose.close(psmt, conn, rs);
		
		}

		return list;
	}
	
	
	
	//글 읽거나 가져오기 
	@Override
	public CommuBbsDto getCommu(int seq) {
		String sql = " SELECT a.seq, a.TITLE as title, content, target_user_seq, a.target_category, "
				+ " readcount, a.reg_date as reg_date, del, b.title as category_name  "
				+ " FROM COMMUBBS A, CATEGORY B "
				+ " WHERE A.TARGET_CATEGORY = B.TARGET_CATEGORY AND A.SEQ=?";

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
			
			System.out.println("글읽기 sql = "+ sql);

			rs = psmt.executeQuery();
			System.out.println("4/6 S getCommu");

			while (rs.next()) {
				int i = 1;
				dto = new CommuBbsDto(rs.getInt(i++), // seq
						rs.getString(i++),// title
						"",// String pic1 
						rs.getString(i++),//String content
						rs.getInt(i++),//int target_user_seq
						rs.getInt(i++),//int target_category
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
	
	
	
	//조회수 올리기
	@Override
	public void readCount(int seq) {
		System.out.println("readcount");
	String sql = " UPDATE  COMMUBBS  SET  "  
				+ " READCOUNT=READCOUNT+1 " 
				+ " WHERE SEQ=? ";
	System.out.println("readcount sql : " + sql);

	Connection conn = null;
	PreparedStatement psmt = null;
	ResultSet rs = null;

	try {
		conn = DBConnection.makeConnection();
		psmt = conn.prepareStatement(sql);
		System.out.println("1/6 readCount");
		psmt.setInt(1, seq);
		System.out.println("2/6 readCount");
		psmt.executeUpdate();
		System.out.println("3/6 readCount");
	} catch (SQLException e) {
		e.printStackTrace();
		System.out.println("fail readCount");
	} finally {
		DBClose.close(psmt, conn, rs);
	}
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
	
	
	
	//삭제하기
	@Override
	public boolean delCommu(int seq) {
		String sql=" UPDATE COMMUBBS "
				+ " SET DEL=1 "
				+ " WHERE SEQ=? ";
		
		int count = 0;
		Connection conn=null;
		PreparedStatement psmt=null;
		
		try {
			conn = DBConnection.makeConnection();			
			psmt=conn.prepareStatement(sql);
			psmt.setInt(1, seq);			
			count = psmt.executeUpdate();
			System.out.println("3/6 delete");
		} catch (SQLException e) {			
			e.printStackTrace();
			System.out.println("delete fail");
		} finally{
			DBClose.close(psmt, conn, null);			
		}
				
		return count>0?true:false;
	}
	
	
	
	
	//수정하기
	@Override
	public boolean udtCommu(int seq, CommuBbsDto comdto) {
		// TODO Auto-generated method stub
		return false;
	}

	
	
	//카테고리별 불러오기 
	@Override
	public List<CommuBbsDto> getCategory(int target_category) {
		List<CommuBbsDto> list = new ArrayList<>();

		
		String sql = " SELECT a.seq, a.TITLE as title, target_user_seq, a.reg_date as reg_date, del, b.title as category_name  "
				+ " FROM COMMUBBS A, CATEGORY B "
				+ " WHERE A.TARGET_CATEGORY = B.TARGET_CATEGORY AND DEL=0 AND a.target_category=? "
				+ " ORDER BY REG_DATE DESC ";
	
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;

		try {
			conn = DBConnection.makeConnection();
			System.out.println("2/6 getCategory Success");

			psmt = conn.prepareStatement(sql);
			System.out.println("sql = " + sql);
			psmt.setInt(1, target_category);
			System.out.println("3/6 getCategory Success");

			rs = psmt.executeQuery();
			System.out.println("4/6 getCategory Success");

			while (rs.next()) {
				int i = 1;

				CommuBbsDto dto = new CommuBbsDto(rs.getInt(i++), // seq
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
			System.out.println("5/6 getCategory Success");

		} catch (SQLException e) {
			System.out.println("getCategory fail");
			System.out.println(e.getMessage());
			System.out.println(e.getErrorCode());
			System.out.println(e.getSQLState());

		} finally {
			DBClose.close(psmt, conn, rs);
		
		}

		return list;
	}
	
	
}
