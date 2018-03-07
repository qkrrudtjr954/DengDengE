package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.apache.coyote.http11.filters.VoidOutputFilter;

import db.DBClose;
import db.DBConnection;
import dto.AnimalBbsDto;
import dto.BookDto;

public class BookDao {

	public BookDao() {
		DBConnection.initConnect();
	}
	
	// 예약리스트 
	public List<BookDto> getBookList(int listseq) {
		String sql = " SELECT A.SEQ, A.TARGET_USER_SEQ, A.TARGET_USER_EMAIL, A.CONTENT, A.TARGET_LIST_SEQ, A.TARGET_COMPLETE_EMAIL, A.DEL "
				+ " FROM BOOK A, ANIMALBBS B "
				+ " WHERE A.TARGET_LIST_SEQ = B.SEQ "
				+ " AND A.TARGET_LIST_SEQ=? "
				+ " AND A.DEL NOT IN 1 ";
		System.out.println("s"+sql);
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		List<BookDto> list = new ArrayList<BookDto>();

		 try {
				conn = DBConnection.makeConnection();
				System.out.println("1/6 S getBookList");
				psmt = conn.prepareStatement(sql);
				psmt.setInt(1, listseq);
				System.out.println("2/6 S getBookList");
				rs = psmt.executeQuery();
				System.out.println("3/6 S getBookList");
				
				while(rs.next()) {
					int i = 1;
					BookDto bookDto = new BookDto();
						bookDto.setSeq(rs.getInt("SEQ"));				//seq, 
						bookDto.setUser_seq(rs.getInt("TARGET_USER_SEQ"));				//user_seq, 
						bookDto.setUser_email(rs.getString("TARGET_USER_EMAIL"));					//user_email, 
						bookDto.setContent(rs.getString("CONTENT"));				//content
						list.add(bookDto);
				}				
				System.out.println("4/6 S getBookList");
			} catch (SQLException e) {
				System.out.println("F getBookList");
			}finally {
				DBClose.close(psmt, conn, rs);
				System.out.println("5/6 S getBookList");
			}
			 return list;	
	}
	
	// 예약상태 확인
	public boolean checkBook(String email, int listseq) {
		String sql = " SELECT A.SEQ, A.TARGET_USER_SEQ, A.TARGET_USER_EMAIL, A.CONTENT, A.TARGET_LIST_SEQ "
				+ " FROM BOOK A, ANIMALBBS B "
				+ " WHERE A.TARGET_LIST_SEQ = B.SEQ "
				+ " AND A.TARGET_USER_EMAIL LIKE '"+email+"%'"
				+ " AND A.TARGET_LIST_SEQ  LIKE '" +listseq+ "%'";
		System.out.println("s"+sql);
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		int count = 0;
		
		try {
			conn = DBConnection.makeConnection();
			System.out.println("1/6 S checkBook");
				
			psmt = conn.prepareStatement(sql);
			System.out.println("2/6 S checkBook");
				
			count = psmt.executeUpdate();
			System.out.println("3/6 S checkBook");
				
		} catch (SQLException e) {			
			System.out.println(e.getMessage());
		} finally{
			DBClose.close(psmt, conn,null);
			System.out.println("4/6 S checkBook");
		}
					
		return count>0?true:false;

	}
	
	// 예약하기
	public boolean addBook(BookDto bookDto) {
		System.out.println(bookDto.toString());
		String sql = " INSERT INTO BOOK(SEQ, TARGET_USER_SEQ,"
				+ " TARGET_USER_EMAIL,  CONTENT, TARGET_LIST_SEQ, TARGET_COMPLETE_EMAIL, DEL) "
				+ " VALUES(BOOK_SEQ.NEXTVAL, ?, ?, ?, ?, ?, 0) ";
		
		int count = 0;
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		
		try {
			conn = DBConnection.makeConnection();
			System.out.println("1/6 S addBook");
			psmt = conn.prepareStatement(sql);
			
			psmt.setInt(1, bookDto.getUser_seq());
			psmt.setString(2, bookDto.getUser_email());
			psmt.setString(3, bookDto.getContent());
			psmt.setInt(4, bookDto.getSeq());
			psmt.setString(5, bookDto.getUser_email());
			System.out.println("2/6 S addBook");
			
			System.out.println(sql);
			count = psmt.executeUpdate();
			System.out.println("3/6 S addBook");
			
		} catch (SQLException e) {
			System.out.println("addBook fail");
	         System.out.println(e.getMessage());
	         System.out.println(e.getErrorCode());
	         System.out.println(e.getSQLState());
		}finally{
			DBClose.close(psmt, conn, rs);	
			System.out.println("4/6 S addBook");
		}
		
		
		return count>0?true:false;
	}
	
	// 예약확정
	public boolean finalBook(int listseq, String complete_email) {
		System.out.println("book:"+listseq+" "+complete_email);
		String sql = " UPDATE BOOK SET "
				+ " DEL=200, TARGET_COMPLETE_EMAIL=? "
				+ " WHERE TARGET_LIST_SEQ=?, ";
		System.out.println("sql"+sql);
		Connection conn = null;
		PreparedStatement psmt = null;
		
		int count = 0;
		
		try {
			conn = DBConnection.makeConnection();
			System.out.println("1/6 S finalBook");
			psmt =conn.prepareStatement(sql);
			
			psmt.setString(1, complete_email);
			psmt.setInt(2, listseq);
			
		
			
			System.out.println("2/6 S finalBook");
			count = psmt.executeUpdate();
			System.out.println("3/6 S finalBook");
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}finally{
			DBClose.close(psmt, conn, null);	
			System.out.println("4/6 S finalBook");
		}
		return count>0?true:false;
	}
}
