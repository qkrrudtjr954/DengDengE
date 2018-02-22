package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


import db.DBClose;
import db.DBConnection;
import dto.AnimalBbsDto;

public class AnimalBbsDao {
/*	
	+ getAnimalBbsList() : List<AnimalDto>
	+ wirteAimalBbs(AnimalBbsDto dto) : boolean
	+ detailAnimalBbs(int seq) : AnimalDto 
	+ deletBbs(int seq) : boolean
	+ getAnimalBbspaging(paginBean paging) : 
	List<AnimalDto>
*/
	// 글목록
	public List<AnimalBbsDto> getAnimalBbsList() {
		String sql = " SELECT SEQ, TITLE, NAME, AGE, "
				+ " KINDS, TYPE, LOCATION, MEDICINE, NEUTRALIZATION, "
				+ " GENDER, DESCRIPTTION, PIC1, CONTENT "
				+ " TARGET_USER_SEQ, TARGET_CONTACT, TARGET_DESCRIPTION, "
				+ " REG_DATE, LAST_UPDATE, DEL "
				+ " FROM ANIMALBBS ";
		System.out.println("s"+sql);
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		List<AnimalBbsDto> list = new ArrayList<AnimalBbsDto>();
		
		 try {
			conn = DBConnection.makeConnection();
			System.out.println("1/6 S getAnimalBbsList");
			psmt = conn.prepareStatement(sql);
			System.out.println("2/6 S getAnimalBbsList");
			rs = psmt.executeQuery();
			System.out.println("3/6 S getAnimalBbsList");
			
			while(rs.next()) {
				AnimalBbsDto aniBbsDto = new AnimalBbsDto();
				aniBbsDto.setSeq(rs.getInt("SEQ"));
				aniBbsDto.setTitle(rs.getString("TITLE"));
				aniBbsDto.setTitle(rs.getString("NAME"));
				aniBbsDto.setSeq(rs.getInt("AGE"));
				aniBbsDto.setTitle(rs.getString("KINDS"));
				aniBbsDto.setTitle(rs.getString("TYPE"));
				aniBbsDto.setTitle(rs.getString("LOCATION"));
				aniBbsDto.setSeq(rs.getInt("MEDICINE"));
				aniBbsDto.setSeq(rs.getInt("NEUTRALIZATION"));
				aniBbsDto.setSeq(rs.getInt("GENDER"));
				aniBbsDto.setTitle(rs.getString("DESCRIPTTION"));
				aniBbsDto.setTitle(rs.getString("PIC1"));
				aniBbsDto.setTitle(rs.getString("CONTENT"));
				aniBbsDto.setSeq(rs.getInt("TARGET_USER_SEQ"));
				aniBbsDto.setPic1(rs.getString("TARGET_CONTACT"));
				aniBbsDto.setPic1(rs.getString("TARGET_DESCRIPTION"));
				aniBbsDto.setPic1(rs.getString("REG_DATE"));
				aniBbsDto.setPic1(rs.getString("LAST_UPDATE"));
				aniBbsDto.setSeq(rs.getInt("DEL"));
				
				list.add(aniBbsDto);
			}
			System.out.println("4/6 S getAnimalBbsList");
		} catch (SQLException e) {
			System.out.println("F getAnimalBbsList");
		}finally {
			DBClose.close(psmt, conn, rs);
			System.out.println("5/6 S getAnimalBbsList");
		}
		 return list;		
	}
	
	// 입양하기 글 작성
	public boolean wirteAnimalBbs(AnimalBbsDto aniBbsDto) {
		String sql = " INSERT INTO ANIMALBBS(SEQ, TITLE, NAME, AGE, "
				+ " KINDS, TYPE, LOCATION, MEDICINE, NEUTRALIZATION, GENDER,  "
				+ " DESCRIPTTION, PIC1, CONTENT "
				+ " TARGET_USER_SEQ, TARGET_CONTACT, TARGET_DESCRIPTION, "
				+ " REG_DATE, LAST_UPDATE, DEL) "
				+ " VALUES(SEQ_ANIMALBBS.NEXTVAL, ?, ?, ?, "
				+ " ?, ?, ?, ?, ?, ? "
				+ " ?, ?, ?, "
				+ " ?, ?, ?, SYSDATE, SYSDATE, 0) ";
		int count = 0;
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		
		try {
			conn = DBConnection.makeConnection();
			System.out.println("1/6 S wirteAnimalBbs");
			psmt = conn.prepareStatement(sql);
			
			psmt.setString(1, aniBbsDto.getTitle());
			psmt.setString(1, aniBbsDto.getName());
			psmt.setInt(3, aniBbsDto.getAge());
			
			psmt.setString(4, aniBbsDto.getKinds());
			psmt.setString(5, aniBbsDto.getType());
			psmt.setString(6, aniBbsDto.getLocation());
			psmt.setInt(7, aniBbsDto.getMedicine());
			psmt.setInt(8, aniBbsDto.getNeutralization());
			psmt.setInt(9, aniBbsDto.getGender());
			
			psmt.setString(10, aniBbsDto.getDescripttion());
			psmt.setString(11, aniBbsDto.getPic1());
			psmt.setString(12, aniBbsDto.getCotent());
			
			psmt.setInt(13, aniBbsDto.getUserSeq());
			psmt.setString(14, aniBbsDto.getContact());
			psmt.setString(15, aniBbsDto.getDescription());
			System.out.println("2/6 S wirteAnimalBbs");
			count = psmt.executeUpdate();
			System.out.println("3/6 S wirteAnimalBbs");
			
		} catch (SQLException e) {			
			System.out.println("wirteAnimalBbs fail");
		} finally{
			DBClose.close(psmt, conn, rs);	
			System.out.println("4/6 S wirteAnimalBbs");
		}
		
		return count>0?true:false;
	}
	
	// 입양하기 글 디테일
	public AnimalBbsDto detailAnimalBbs(int seq) {
		String sql = " SELECT SEQ,  "
				+ "  "
				+ " FROM ANIMALBBS "
				+ " WHERE SEQ=? ";
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		AnimalBbsDto dto = null;
		
		try {
			conn = DBConnection.makeConnection();
			System.out.println("1/6 S detailAnimalBbs");
			
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, seq);
			System.out.println("2/6 S detailAnimalBbs");
			
			rs = psmt.executeQuery();
			System.out.println("3/6 S detailAnimalBbs");
			
			while(rs.next()){
				int i = 1;
				/*dto = new BbsDto(
						rs.getInt(i++),	// seq 
						rs.getString(i++),	// id 
						rs.getInt(i++),	// ref 
						rs.getInt(i++), // step 
						rs.getInt(i++), // depth 
						rs.getString(i++), // title
						rs.getString(i++), // content 
						rs.getString(i++), // wdate 
						rs.getInt(i++),    // parent 
						rs.getInt(i++),		//	del 
						rs.getInt(i++));	// readcount*/
				}
			System.out.println("4/6 S detailAnimalBbs");
		} catch (SQLException e) {			
			e.printStackTrace();
		} finally{
			DBClose.close(psmt, conn, rs);		
			System.out.println("5/6 S detailAnimalBbs");

		}
		
		return dto;
		
	}
	
	// 입양하기 글 삭제
	public boolean deleteAnimalBbs(int seq) {
		String sql = " UPDATE ANIMALBBS SET "
				+ " DEL=1 WHERE SEQ=?";
				
			Connection conn = null;
			PreparedStatement psmt = null;		
				
			int count = 0;
				
				
			try {
				conn = DBConnection.makeConnection();
				System.out.println("1/6 S detailAnimalBbs");
					
				psmt = conn.prepareStatement(sql);
				psmt.setInt(1, seq);
				System.out.println("2/6 S detailAnimalBbs");
					
				count = psmt.executeUpdate();
				System.out.println("3/6 S detailAnimalBbs");
					
			} catch (SQLException e) {			
				System.out.println(e.getMessage());
			} finally{
				DBClose.close(psmt, conn,null);
				System.out.println("4/6 S detailAnimalBbs");
			}
						
			return count>0?true:false;
	}
	
	// 입양하기 글 수정
	public boolean updateAnimalBbs(int seq, AnimalBbsDto aniBbsDto) {
		String sql = " UPDATE ANIMALBBS SET TITLE=?, "
				+ " CONTENT=? WHERE SEQ=?";
		System.out.println("s:"+sql);
			
		Connection conn = null;
		PreparedStatement psmt = null;		
			
		int count = 0;
			
			
		try {
			conn = DBConnection.makeConnection();
			System.out.println("1/6 S detailAnimalBbs");
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, aniBbsDto.getTitle());
			psmt.setString(1, aniBbsDto.getCotent());
			psmt.setInt(3, seq);
		
			System.out.println("2/6 S detailAnimalBbs");
				
			count = psmt.executeUpdate();
			System.out.println("3/6 S detailAnimalBbs");
				
		} catch (SQLException e) {			
			System.out.println(e.getMessage());
		} finally{
			DBClose.close(psmt, conn,null);
			System.out.println("4/6 S detailAnimalBbs");
		}
					
		return count>0?true:false;
	}
	
	/*
	// 페이징 처리
	public List<AnimalBbsDto> getAnimalBbspaging(paginBean paging) {
		return null;
	}
	*/
}



















