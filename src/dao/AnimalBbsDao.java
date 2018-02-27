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
	
	public AnimalBbsDao() {
		DBConnection.initConnect();
	}
	
	

	// 글목록
	public List<AnimalBbsDto> getAnimalBbsList() {
		String sql = " SELECT SEQ, TITLE, NAME, AGE, "
				+ " KINDS, TYPE, LOCATION, MEDICINE, NEUTRALIZATION, "
				+ " GENDER, DESCRIPTTION, PIC1, CONTENT, "
				+ " TARGET_USER_SEQ, TARGET_CONTACT, TARGET_DESCRIPTION, "
				+ " REG_DATE, LAST_UPDATE, DEL, READCOUNT "
				+ " FROM ANIMALBBS "
				+ " WHERE DEL=0 ";
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
				aniBbsDto.setName(rs.getString("NAME"));
				aniBbsDto.setAge(rs.getInt("AGE"));
				aniBbsDto.setKinds(rs.getString("KINDS"));
				aniBbsDto.setType(rs.getString("TYPE"));
				aniBbsDto.setLocation(rs.getString("LOCATION"));
				aniBbsDto.setMedicine(rs.getInt("MEDICINE"));
				aniBbsDto.setNeutralization(rs.getInt("NEUTRALIZATION"));
				aniBbsDto.setGender(rs.getInt("GENDER"));
				aniBbsDto.setDescripttion(rs.getString("DESCRIPTTION"));
				aniBbsDto.setPic1(rs.getString("PIC1"));
				aniBbsDto.setContent(rs.getString("CONTENT"));
				aniBbsDto.setUserSeq(rs.getInt("TARGET_USER_SEQ"));
				aniBbsDto.setContact(rs.getString("TARGET_CONTACT"));
				aniBbsDto.setDescription(rs.getString("TARGET_DESCRIPTION"));
				aniBbsDto.setReg_date(rs.getString("REG_DATE"));
				aniBbsDto.setLast_update(rs.getString("LAST_UPDATE"));
				aniBbsDto.setDel(rs.getInt("DEL"));
				aniBbsDto.setReadcount(rs.getInt("READCOUNT"));
				
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
		System.out.println("접속");
		String sql = " INSERT INTO ANIMALBBS(SEQ, TITLE, NAME, AGE, "
				+ " KINDS, TYPE, LOCATION, MEDICINE, NEUTRALIZATION, GENDER, "
				+ " DESCRIPTTION, PIC1, CONTENT, "
				+ " TARGET_USER_SEQ, TARGET_CONTACT, TARGET_DESCRIPTION, "
				+ " REG_DATE, LAST_UPDATE, DEL, READCOUNT)  "
				+ " VALUES(ANIMALBBS_SEQ.NEXTVAL, ?, ?, ?, "
				+ " ?, ?, ?, ?, ?, ?, "
				+ " ?, ?, ?, "
				+ " ?, ?, ?, SYSDATE, SYSDATE, 0, 0) ";
		int count = 0;
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		
		try {
			conn = DBConnection.makeConnection();
			System.out.println("1/6 S wirteAnimalBbs");
			psmt = conn.prepareStatement(sql);
			
			psmt.setString(1, aniBbsDto.getTitle());
			psmt.setString(2, aniBbsDto.getName());
			psmt.setInt(3, aniBbsDto.getAge());
			
			psmt.setString(4, aniBbsDto.getKinds());
			psmt.setString(5, aniBbsDto.getType());
			psmt.setString(6, aniBbsDto.getLocation());
			psmt.setInt(7, aniBbsDto.getMedicine());
			psmt.setInt(8, aniBbsDto.getNeutralization());
			psmt.setInt(9, aniBbsDto.getGender());
			
			psmt.setString(10, aniBbsDto.getDescripttion());
			psmt.setString(11, aniBbsDto.getPic1());
			psmt.setString(12, aniBbsDto.getContent());
			
			psmt.setInt(13, aniBbsDto.getUserSeq());
			psmt.setString(14, aniBbsDto.getContact());
			psmt.setString(15, aniBbsDto.getDescription());
			System.out.println("2/6 S wirteAnimalBbs");
			System.out.println(sql);
			count = psmt.executeUpdate();
			System.out.println("3/6 S wirteAnimalBbs");
			
		} catch (SQLException e) {			
			System.out.println("wirteAnimalBbs fail");
	         System.out.println(e.getMessage());
	         System.out.println(e.getErrorCode());
	         System.out.println(e.getSQLState());
		} finally{
			DBClose.close(psmt, conn, rs);	
			System.out.println("4/6 S wirteAnimalBbs");
		}
		
		return count>0?true:false;
	}
	
	// 입양하기 글 디테일
	public AnimalBbsDto detailAnimalBbs(int seq) {
		String sql = " SELECT SEQ, TITLE, NAME, AGE, "
				+ " KINDS, TYPE, LOCATION, MEDICINE, NEUTRALIZATION, "
				+ " GENDER, DESCRIPTTION, PIC1, CONTENT, "
				+ " TARGET_USER_SEQ, TARGET_CONTACT, TARGET_DESCRIPTION, "
				+ " REG_DATE, LAST_UPDATE, DEL, READCOUNT "
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
				dto = new AnimalBbsDto(
										rs.getInt(i++), 
										rs.getString(i++), 
										rs.getString(i++), 
										rs.getInt(i++), 
										rs.getString(i++), 
										rs.getString(i++),
										rs.getString(i++), 
										rs.getInt(i++), 
										rs.getInt(i++), 
										rs.getInt(i++), 
										rs.getString(i++), 
										rs.getString(i++), 
										rs.getString(i++), 
										rs.getInt(i++),  
										rs.getString(i++),
										rs.getString(i++),
										rs.getString(i++),
										rs.getString(i++),
										rs.getInt(i++),
										rs.getInt(i++));
						
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
				+ " DEL=1 "
				+ " WHERE SEQ=? ";
				
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
			psmt.setString(2, aniBbsDto.getContent());
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
	
		//조회수 올리기
	   public void readCount(int seq) {
	      System.out.println("readcount");
	   String sql = " UPDATE  ANIMALBBS  SET  "  
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
	   
	   public List<AnimalBbsDto> getFindBbslist(String Searchtype, String Searchtext){
		   System.out.println("s");
		      List<AnimalBbsDto> list = new ArrayList<>();

		      
				String sql = " SELECT SEQ, TITLE, NAME, AGE, "
						+ " KINDS, TYPE, LOCATION, MEDICINE, NEUTRALIZATION, "
						+ " GENDER, DESCRIPTTION, PIC1, CONTENT, "
						+ " TARGET_USER_SEQ, TARGET_CONTACT, TARGET_DESCRIPTION, "
						+ " REG_DATE, LAST_UPDATE, DEL, READCOUNT "
						+ " FROM ANIMALBBS "
						+ " WHERE DEL=0 AND " + Searchtype + " LIKE '%" + Searchtext + "%'"
		            + " ORDER BY REG_DATE DESC ";
		   
		      Connection conn = null;
		      PreparedStatement psmt = null;
		      ResultSet rs = null;
		      

		      try {
		         conn = DBConnection.makeConnection();
		         System.out.println("2/6 getFindBbslist Success");

		         psmt = conn.prepareStatement(sql);
		         System.out.println("sql = " + sql);
		         System.out.println("3/6 getFindBbslist Success");
		         
		      
		         rs = psmt.executeQuery();
		         System.out.println("4/6 getFindBbslist Success");

		         while (rs.next()) {
		            int i = 1;

		            AnimalBbsDto aniBbsDto = new AnimalBbsDto(); //category_name
		            aniBbsDto.setSeq(rs.getInt("SEQ"));
					aniBbsDto.setTitle(rs.getString("TITLE"));
					aniBbsDto.setName(rs.getString("NAME"));
					aniBbsDto.setAge(rs.getInt("AGE"));
					aniBbsDto.setKinds(rs.getString("KINDS"));
					aniBbsDto.setType(rs.getString("TYPE"));
					aniBbsDto.setLocation(rs.getString("LOCATION"));
					aniBbsDto.setMedicine(rs.getInt("MEDICINE"));
					aniBbsDto.setNeutralization(rs.getInt("NEUTRALIZATION"));
					aniBbsDto.setGender(rs.getInt("GENDER"));
					aniBbsDto.setDescripttion(rs.getString("DESCRIPTTION"));
					aniBbsDto.setPic1(rs.getString("PIC1"));
					aniBbsDto.setContent(rs.getString("CONTENT"));
					aniBbsDto.setUserSeq(rs.getInt("TARGET_USER_SEQ"));
					aniBbsDto.setContact(rs.getString("TARGET_CONTACT"));
					aniBbsDto.setDescription(rs.getString("TARGET_DESCRIPTION"));
					aniBbsDto.setReg_date(rs.getString("REG_DATE"));
					aniBbsDto.setLast_update(rs.getString("LAST_UPDATE"));
					aniBbsDto.setDel(rs.getInt("DEL"));
					aniBbsDto.setReadcount(rs.getInt("READCOUNT"));
		            list.add(aniBbsDto);
		         }
		         System.out.println("5/6 getFindBbslist Success");

		      } catch (SQLException e) {
		         System.out.println("getFindBbslist fail");
		         System.out.println(e.getMessage());
		         System.out.println(e.getErrorCode());
		         System.out.println(e.getSQLState());

		      } finally {
		         DBClose.close(psmt, conn, rs);
		      
		      }

		      return list;
		   }
	   /*
	   public List<AnimalBbsDto> getSearchBbsList(String type, String text) {
			Connection conn = null;
			PreparedStatement psmt = null;
			ResultSet rs = null;
				
			List<AnimalBbsDto> bbslist = new ArrayList<AnimalBbsDto>();
				
			try {
				conn = DBConnection.makeConnection();

					
				//글의 갯수 알아보기
				String totalSql="";
					
				String Text = "'%"+text+"%'";
					
				if(type.equals("title")){
					totalSql = " SELECT COUNT(SEQ) FROM BBS WHERE TITLE LIKE "+Text;
				}
				else if(type.equals("id")){
					totalSql = " SELECT COUNT(SEQ) FROM BBS WHERE ID LIKE "+Text;
				}
				else{
					totalSql = " SELECT COUNT(SEQ) FROM BBS WHERE CONTENT LIKE "+Text;
				}
					
				System.out.println("CountSearchBbsList sql : "+totalSql);
					
				psmt= conn.prepareStatement(totalSql);
				rs = psmt.executeQuery();
					
				int totalCount = 0;
				
					
				psmt.close();
				rs.close();
						
				String sql ="";
							
				if(type.equals("title")){
					sql = " SELECT * FROM "
					+ " (SELECT * FROM (SELECT * FROM BBS WHERE TITLE LIKE "+Text+" ORDER BY REF ASC, STEP DESC) "
					+ " WHERE ROWNUM <="+paging.getStartNum()+" ORDER BY REF DESC, STEP ASC) "
					+ " WHERE ROWNUM <="+paging.getCountPerPage();
				}
				else if(type.equals("id")){
					sql = " SELECT * FROM "
					+ " (SELECT * FROM (SELECT * FROM BBS WHERE ID LIKE "+Text+" ORDER BY REF ASC, STEP DESC) "
					+ " WHERE ROWNUM <="+paging.getStartNum()+" ORDER BY REF DESC, STEP ASC) "
					+ " WHERE ROWNUM <="+paging.getCountPerPage();
				}
				else{
				        sql = " SELECT * FROM "
					+ " (SELECT * FROM (SELECT * FROM BBS WHERE CONTENT LIKE "+Text+" ORDER BY REF ASC, STEP DESC) "
					+ " WHERE ROWNUM <="+paging.getStartNum()+" ORDER BY REF DESC, STEP ASC) "
					+ " WHERE ROWNUM <="+paging.getCountPerPage();
				}
				
				System.out.println("getSearchBbsList sql : "+sql);
				
				psmt = conn.prepareStatement(sql);
				rs = psmt.executeQuery();
				while(rs.next()){
					int i = 1;
					BbsDto dto = new BbsDto(
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
						rs.getInt(i++));	// readcount
					bbslist.add(dto);				
				}
			} 
			catch (SQLException e) {
				e.printStackTrace();
			}
			finally{
				DBClose.close(psmt, conn, rs);
			}
				return bbslist;	
		}
	*/
	   
	/*
	// 페이징 처리
	public List<AnimalBbsDto> getAnimalBbspaging(paginBean paging) {
		return null;
	}
	*/
	   
	   
}



















