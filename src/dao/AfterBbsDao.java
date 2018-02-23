package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import Paging.AfterPagingDto;
import db.DBClose;
import db.DBConnection;
import dto.AfterBbsDto;

public class AfterBbsDao {
	
	
	 /* seq number(8) primary key,
	    title varchar2(100),
	    pic1 varchar2(200),
	    content varchar2(4000),
	    TARGET_USER_SEQ NUMBER(8),
	    FOREIGN KEY (TARGET_USER_SEQ) REFERENCES denguser(seq),
	    REG_DATE DATE,
	    LAST_UPDATE DATE,
	    DEL NUMBER(1)

	*/
	
	
	public AfterBbsDao() {
		DBConnection.initConnect();
	}
	
	//current_user 세션 저장
	//After 게시판 화면 출력
	public List<AfterBbsDto> getAfterlBbsList(){
		String sql = "SELECT SEQ, TITLE, PIC1, CONTENT, TARGET_USER_SEQ, "
				+ " REG_DATE, LAST_UPDATE, DEL "
				+ " FROM AFTERBBS ";
		
		
		List<AfterBbsDto> list = new ArrayList<AfterBbsDto>();
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;		
		
		try {
			conn = DBConnection.makeConnection();
			System.out.println("2/6 getAfterlBbsList Success");
			
			psmt = conn.prepareStatement(sql);
			System.out.println("spl = " + sql);
			System.out.println("3/6 getAfterlBbsList Success");
			
			rs = psmt.executeQuery();
			System.out.println("4/6 getAfterlBbsList Success");
			
			while(rs.next()){
				int i = 1;
				
				AfterBbsDto dto = new AfterBbsDto(rs.getInt(i++),//int seq, 
												rs.getString(i++),//String title, 
												rs.getString(i++),//String pic1, 
												rs.getString(i++),//String content, 
												rs.getInt(i++),//int userSeq, 
												rs.getString(i++),//String rdate, 
												rs.getString(i++),//String ldate,
												rs.getInt(i++));
				
						
				
				list.add(dto);
										
			}		
			System.out.println("5/6 getAfterlBbsList Success");
			
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("getAfterlBbsList fail");
		} finally{
			DBClose.close(psmt, conn, rs);
			System.out.println("6/6 getAfterlBbsList Success");
		}
		
		return list;
		
	}
	/*
	"SELECT SEQ, TITLE, PIC1, CONTENT, TARGET_USER_SEQ, "
	+ " REG_DATE, LAST_UPDATE, DEL "
	+ " FROM AFTERBBS ";
	*/
	//After list 글쓰기
	public boolean wirtelAfterBbs(AfterBbsDto dto) {
		String sql = "INSERT INTO AFTERBBS(SEQ, TITLE, "
				+ " PIC1, CONTENT, TARGET_USER_SEQ, REG_DATE, "
				+ " LAST_UPDATE, DEL) "
				+ " VALUES(AFTERBBS_SEQ .NEXTVAL, ?, "
				+ " ?, ?, ?, SYSDATE, SYSDATE , 0) ";
				
				
		int count = 0;
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		
		try {
			conn = DBConnection.makeConnection();
			System.out.println("2/6 wirtelAfterBbs Success");

			
			psmt = conn.prepareStatement(sql);
			System.out.println("3/6 wirtelAfterBbs Success");

			
			psmt.setString(1, dto.getTitle());
			psmt.setString(2, dto.getPic1());
			psmt.setString(3, dto.getContent());
			psmt.setInt(4, dto.getUserSeq());
			
			count = psmt.executeUpdate();
			System.out.println("4/6 wirtelAfterBbs Success");

			
		} catch (SQLException e) {			
			System.out.println("wirtelAfterBbs fail");
		} finally{
			DBClose.close(psmt, conn, rs);
			System.out.println("5/6 wirtelAfterBbs Success");
		}
		
		return count>0?true:false;
		
		
		
	}
	
	//After list detail 
	public AfterBbsDto detailAfterlBbs(AfterBbsDto dto) {
		return dto;
		
	}
	
	
	// After list 삭제
	public boolean AfterdeletBbs(int seq) {
		return false;
		
	}
	
	
	
	//paging 화면
	public List<AfterBbsDto> getAfterBbsPagingList(AfterPagingDto paging){
		return null;
		
	}
	
	
	
	
	


	
	
	
	
	

}
