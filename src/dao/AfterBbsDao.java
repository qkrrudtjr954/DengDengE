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
	
	//current_user 세션 저장
	//After 게시판 화면 출력
	public List<AfterBbsDto> getAfterlBbsList(){
		String sql = "SELECT SEQ, TITLE, PIC1, CONTENT, TARGET_USER_SEQ, "
				+ " REG_DATE, LAST_UPDATE, "
				+ "	WDATE, PARENT, DEL, "
				+ " FROM AFTERBBS ";
		
		
		List<AfterBbsDto> list = new ArrayList<AfterBbsDto>();
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;		
		
		try {
			conn = DBConnection.makeConnection();
			System.out.println("2/6 getAfterlBbsList Success");
			
			psmt = conn.prepareStatement(sql);
			System.out.println("3/6 getAfterlBbsList Success");
			
			rs = psmt.executeQuery();
			System.out.println("4/6 getAfterlBbsList Success");
			
			while(rs.next()){
				int i = 1;
				
				
				
				AfterBbsDto dto = new AfterBbsDto();
				dto.setSeq(rs.getInt("SEQ"));
				dto.setTitle(rs.getString("TITLE"));
				dto.setPic1(rs.getString("PIC1"));
				dto.setContent(rs.getString("CONTENT"));
				dto.setUserSeq(rs.getInt("TARGET_USER_SEQ"));
				dto.setRdate(rs.getString("REG_DATE"));
				dto.setLdate(rs.getString("LAST_UPDATE"));
										
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
	
	//After list 글쓰기
	public boolean wirtelAfterBbs(AfterBbsDto dto) {
		return false;
		
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
