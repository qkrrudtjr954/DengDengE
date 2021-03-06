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
		/*String sql = " SELECT A.SEQ, A.TITLE, A.NAME, A.AGE, "
				+ " A.KINDS, A.TYPE, A.LOCATION, A.MEDICINE, A.NEUTRALIZATION, "
				+ " A.GENDER, A.DESCRIPTTION, A.PIC1, A.CONTENT, "
				+ " A.TARGET_USER_SEQ, A.TARGET_CONTACT, A.TARGET_DESCRIPTION, "
				+ " A.REG_DATE, A.LAST_UPDATE, A.DEL, A.READCOUNT, A.TARGET_COMPLETE_EMAIL, B.EMAIL AS USER_EMAIL "
				+ " FROM ANIMALBBS A, DENGUSER B "
				+ " WHERE A.TARGET_USER_SEQ = B.SEQ "
				+ " AND A.DEL NOT IN 1"
				+ " ORDER BY REG_DATE DESC ";*/
		
		String sql = " SELECT A.SEQ, A.TITLE, A.NAME, A.AGE,  A.KINDS, A.TYPE, A.LOCATION, A.MEDICINE, A.NEUTRALIZATION,  "
				+ " A.GENDER, A.DESCRIPTTION, A.PIC1, A.CONTENT,  A.TARGET_USER_SEQ, A.TARGET_CONTACT, A.TARGET_DESCRIPTION,  "
				+ " A.REG_DATE, A.LAST_UPDATE, A.DEL, A.READCOUNT, A.TARGET_COMPLETE_EMAIL, B.EMAIL AS USER_EMAIL,	 "
				+ " (select count(*) from liketable b where a.seq = b.target_bbs_seq and b.bbs_category=1) as LIKECOUNT  "
				+ " FROM ANIMALBBS A,  DENGUSER B "
				+ " WHERE A.TARGET_USER_SEQ = B.SEQ  AND A.DEL NOT IN 1 "
				+ " ORDER BY REG_DATE DESC  ";
		
		

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
				aniBbsDto.setComplete_email("TARGET_COMPLETE_EMAIL");
				aniBbsDto.setLikecount(rs.getInt("LIKECOUNT"));
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
		System.out.println("aniBbsDto:"+aniBbsDto.toString());
		String sql = " INSERT INTO ANIMALBBS(SEQ, TITLE, NAME, AGE, "
				+ " KINDS, TYPE, LOCATION, MEDICINE, NEUTRALIZATION, GENDER, "
				+ " DESCRIPTTION, PIC1, CONTENT, "
				+ " TARGET_USER_SEQ, TARGET_CONTACT, TARGET_DESCRIPTION, "
				+ " REG_DATE, LAST_UPDATE, DEL, READCOUNT, TARGET_COMPLETE_EMAIL)  "
				+ " VALUES(ANIMALBBS_SEQ.NEXTVAL, ?, ?, ?, "
				+ " ?, ?, ?, ?, ?, ?, "
				+ " ?, ?, ?, "
				+ " ?, ?, ?, SYSDATE, SYSDATE, 0, 0, ?) ";
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
			psmt.setString(16, aniBbsDto.getComplete_email());
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
		String sql = " SELECT A.SEQ, A.TITLE, A.NAME, A.AGE, "
				+ " A.KINDS, A.TYPE, A.LOCATION, A.MEDICINE, A.NEUTRALIZATION, "
				+ " A.GENDER, A.DESCRIPTTION, A.PIC1, A.CONTENT, "
				+ " A.TARGET_USER_SEQ, A.TARGET_CONTACT, A.TARGET_DESCRIPTION, "
				+ " A.REG_DATE, A.LAST_UPDATE, A.DEL, A.READCOUNT, A.TARGET_COMPLETE_EMAIL, B.EMAIL AS USER_EMAIL "
				+ " FROM ANIMALBBS A, DENGUSER B "
				+ " WHERE  A.TARGET_USER_SEQ = B.SEQ AND A.SEQ=? ";
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
						rs.getInt(i++),
						rs.getString(i++),
						rs.getString(i++)	
						);
						
						
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
	public boolean updateAnimalBbs(AnimalBbsDto aniBbsDto) {
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
			psmt.setInt(3, aniBbsDto.getSeq());
		
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
	
	
	
	// 입양하기 글 사진수정
		public boolean updateAnimalBbsPic1(AnimalBbsDto aniBbsDto) {
			String sql = " UPDATE ANIMALBBS SET TITLE=?, "
					+ " CONTENT=?, PIC1= ? WHERE SEQ=?";
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
				psmt.setString(3, aniBbsDto.getPic1());
				psmt.setInt(4, aniBbsDto.getSeq());
			
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
	   
	   // 검색
	   public List<AnimalBbsDto> getFindBbslist(String Searchtype, String Searchtext){
		   System.out.println("s");
		      List<AnimalBbsDto> list = new ArrayList<>();

		      
				String sql = " SELECT A.SEQ, A.TITLE, A.NAME, A.AGE, "
						+ " A.KINDS, A.TYPE, A.LOCATION, A.MEDICINE, A.NEUTRALIZATION, "
						+ " A.GENDER, A.DESCRIPTTION, A.PIC1, A.CONTENT, "
						+ " A.TARGET_USER_SEQ, A.TARGET_CONTACT, A.TARGET_DESCRIPTION, "
						+ " A.REG_DATE, A.LAST_UPDATE, A.DEL, A.READCOUNT, B.EMAIL AS USER_EMAIL "
						+ " FROM ANIMALBBS A,  DENGUSER B "
						+ " WHERE A.TARGET_USER_SEQ = B.SEQ AND A.DEL NOT IN 1 "
						+ " AND " + Searchtype + " LIKE '%" + Searchtext + "%'"
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
	   // 버튼별 검색 지역
	   public List<AnimalBbsDto> getFindBtnlist(String searchBtn){
		   System.out.println("s");
		      List<AnimalBbsDto> list = new ArrayList<>();
		      
				String sql = " SELECT A.SEQ, A.TITLE, A.NAME, A.AGE, "
						+ " A.KINDS, A.TYPE, A.LOCATION, A.MEDICINE, A.NEUTRALIZATION, "
						+ " A.GENDER, A.DESCRIPTTION, A.PIC1, A.CONTENT, "
						+ " A.TARGET_USER_SEQ, A.TARGET_CONTACT, A.TARGET_DESCRIPTION, "
						+ " A.REG_DATE, A.LAST_UPDATE, A.DEL, A.READCOUNT, B.EMAIL AS USER_EMAIL "
						+ " FROM ANIMALBBS A, DENGUSER B "
						+ " WHERE A.TARGET_USER_SEQ = B.SEQ "
						+ " AND A.DEL NOT IN 1 AND A.TYPE LIKE '" +searchBtn+"%' "
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
	   
	   // 버튼별 검색 지역
	   public List<AnimalBbsDto> getFindBtnlistlocal(String searchBtn1){
		   System.out.println("s");
		      List<AnimalBbsDto> list = new ArrayList<>();
		      
				String sql = " SELECT A.SEQ, A.TITLE, A.NAME, A.AGE, "
						+ " A.KINDS, A.TYPE, A.LOCATION, A.MEDICINE, A.NEUTRALIZATION, "
						+ " A.GENDER, A.DESCRIPTTION, A.PIC1, A.CONTENT, "
						+ " A.TARGET_USER_SEQ, A.TARGET_CONTACT, A.TARGET_DESCRIPTION, "
						+ " A.REG_DATE, A.LAST_UPDATE, A.DEL, A.READCOUNT, B.EMAIL AS USER_EMAIL "
						+ " FROM ANIMALBBS A, DENGUSER B "
						+ " WHERE A.TARGET_USER_SEQ = B.SEQ "
						+ " AND A.DEL NOT IN 1 AND A.LOCATION LIKE '"+searchBtn1+"%' "
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
	   
	// 예약확정
		public boolean bookBbs(int seq, String complete_email) {
			System.out.println("bbs:"+seq+" "+complete_email);
			String sql = " UPDATE ANIMALBBS SET "
					+ " DEL=200, TARGET_COMPLETE_EMAIL=? "
					+ " WHERE SEQ=? ";
			System.out.println("sql"+sql);
			Connection conn = null;
			PreparedStatement psmt = null;
			
			int count = 0;
			
			try {
				conn = DBConnection.makeConnection();
				System.out.println("1/6 S bookBbs");
				psmt =conn.prepareStatement(sql);
				psmt.setString(1, complete_email);
				psmt.setInt(2, seq);
				
				
				System.out.println("2/6 S bookBbs");
				count = psmt.executeUpdate();
				System.out.println("3/6 S bookBbs");
			} catch (SQLException e) {
				System.out.println("4/6 S bookBbs");
				System.out.println(e.getMessage());
			}finally{
				DBClose.close(psmt, conn, null);	
				System.out.println("5/6 S bookBbs");
			}
			return count>0?true:false;
		}
	   
	//좋아요 추가
	   public void likeTB_insert(int target_user_seq, int target_bbs_seq) {
			String sql = "INSERT INTO LIKETABLE (SEQ, BBS_CATEGORY, TARGET_USER_SEQ, TARGET_BBS_SEQ) "
					+ " VALUES(LIKE_SEQ.NEXTVAL, 1, ?, ?) ";
			
			
			Connection conn = null;
			PreparedStatement psmt = null;
			ResultSet rs = null;

			try {
				conn = DBConnection.makeConnection();
				System.out.println("2/6 likeTB_insert Success");

				psmt = conn.prepareStatement(sql);
				System.out.println("3/6 likeTB_insert Success");

				psmt.setInt(1, target_user_seq);	
				psmt.setInt(2,target_bbs_seq);
				
				System.out.println(sql);
				psmt.executeUpdate();
				System.out.println("4/6 likeTB_insert Success");

			} catch (SQLException e) {
				System.out.println("likeTB_insert fail");
				System.out.println(e.getMessage());
				System.out.println(e.getErrorCode());
				System.out.println(e.getSQLState());
				

			} finally {
				DBClose.close(psmt, conn, rs);
			}



		}
	//좋아요 삭제
	   public void likeTB_delete(int target_user_seq, int target_bbs_seq) {
			String sql = " delete from liketable where BBS_CATEGORY = 1 AND target_user_seq = ? and target_bbs_seq = ? ";
			
			
			Connection conn = null;
			PreparedStatement psmt = null;
			ResultSet rs = null;

			try {
				conn = DBConnection.makeConnection();
				System.out.println("2/6 likeTB_delete Success");

				psmt = conn.prepareStatement(sql);
				System.out.println("3/6 likeTB_delete Success");

				psmt.setInt(1, target_user_seq);	
				psmt.setInt(2,target_bbs_seq);
				
				System.out.println(sql);
				psmt.executeUpdate();
				System.out.println("4/6 likeTB_delete Success");

			} catch (SQLException e) {
				System.out.println("likeTB_delete fail");
				System.out.println(e.getMessage());
				System.out.println(e.getErrorCode());
				System.out.println(e.getSQLState());

				
			} finally {
				DBClose.close(psmt, conn, rs);
			}

			
		}
  
	//중복방지
	   public boolean Prevent_duplication(int target_user_seq, int target_bbs_seq) {
			String sql = "select*from liketable where BBS_CATEGORY = 1 AND target_user_seq = ? and target_bbs_seq = ? ";
			

			int count = 0;

			Connection conn = null;
			PreparedStatement psmt = null;
			ResultSet rs = null;

			try {
				conn = DBConnection.makeConnection();
				System.out.println("2/6 Prevent_duplication Success");

				psmt = conn.prepareStatement(sql);
				System.out.println("3/6 Prevent_duplication Success");

				psmt.setInt(1, target_user_seq);	
				psmt.setInt(2,target_bbs_seq);
				
				System.out.println(sql);
				count = psmt.executeUpdate();
				System.out.println("4/6 Prevent_duplication Success");

			} catch (SQLException e) {
				System.out.println("Prevent_duplication fail");
				System.out.println(e.getMessage());
				System.out.println(e.getErrorCode());
				System.out.println(e.getSQLState());

				count = -1;

			} finally {
				DBClose.close(psmt, conn, rs);
			}

			return count > 0 ? true : false;
		}
	   
	//좋아요 불러오기 
		public int getLikeCount(int bbs_seq) {
			String sql = " select count(*) as likecount from liketable where BBS_CATEGORY = 1 AND target_bbs_seq = ?  ";
			
			int like_count = 0;
			
			Connection conn = DBConnection.makeConnection();
			PreparedStatement psmt = null;
			ResultSet rs = null;
			try {
				psmt = conn.prepareStatement(sql);
				psmt.setInt(1, bbs_seq);
				
				rs = psmt.executeQuery();
				
				if(rs.next()) {
					like_count = rs.getInt("likecount");
				}
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} finally {
				DBClose.close(psmt, conn, rs);
			}
			
			return like_count;
		}
}



















