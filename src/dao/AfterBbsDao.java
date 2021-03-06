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
		String sql = "SELECT A.SEQ, A.TITLE, A.PIC1, A.CONTENT, A.TARGET_USER_SEQ,  "
				+ " A.REG_DATE, A.LAST_UPDATE, A.DEL, A.READCOUNT,B.EMAIL AS USER_EMAIL,"
				+ " (select count(*) from liketable b where a.seq = b.target_bbs_seq and b.bbs_category=2) as likecount   "
				+ " FROM AFTERBBS A, DENGUSER B  "
				+ " WHERE A.TARGET_USER_SEQ = B.SEQ AND DEL=0 "
				+ " ORDER BY REG_DATE DESC ";
		
		
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
												rs.getInt(i++),
												rs.getInt(i++),
												rs.getString(i++),
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
	public boolean wirteAfterBbs(AfterBbsDto dto) {
		String sql = "INSERT INTO AFTERBBS(SEQ, TITLE, "
				+ " PIC1, CONTENT, TARGET_USER_SEQ, REG_DATE, "
				+ " LAST_UPDATE, DEL ,READCOUNT) "
				+ " VALUES(AFTERBBS_SEQ .NEXTVAL, ?, "
				+ " ?, ?, ?, SYSDATE, SYSDATE , 0,0) ";
				
				
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
			psmt.setInt(4, dto.getTarget_user_seq());
			
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
	
	/*String sql = "SELECT SEQ, TITLE, PIC1, CONTENT, TARGET_USER_SEQ, "
			+ " REG_DATE, LAST_UPDATE, DEL "
			+ " FROM AFTERBBS ";*/
	
	
	
	
	
	
	//After list detail 
	public AfterBbsDto detailAfterlBbs(int seq) {
		String sql = " SELECT A.SEQ, A.TITLE, A.PIC1, A.CONTENT, A.TARGET_USER_SEQ, "
				+ " A.REG_DATE, A.LAST_UPDATE, A.DEL,A.READCOUNT,B.EMAIL AS USER_EMAIL "
				+ " FROM AFTERBBS A, DENGUSER B "
				+ " WHERE A.SEQ=? AND A.TARGET_USER_SEQ = B.SEQ ";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		AfterBbsDto dto = null;
		
		try {
			conn = DBConnection.makeConnection();
			System.out.println("2/6 S detailAfterlBbs");
			
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, seq);
			System.out.println("3/6 S detailAfterlBbs");
			
			rs = psmt.executeQuery();
			System.out.println("4/6 S detailAfterlBbs");
			
			if(rs.next()){
				int i = 1;
				dto = new AfterBbsDto(
						rs.getInt(i++),//int seq, 
						rs.getString(i++),//String title, 
						rs.getString(i++),//String pic1, 
						rs.getString(i++),//String content, 
						rs.getInt(i++),//int userSeq, 
						rs.getString(i++),//String rdate, 
						rs.getString(i++),//String ldate,
						rs.getInt(i++),
						rs.getInt(i++),
						rs.getString(i++));
			}
			System.out.println("5/6 S detailAfterlBbs");
			
		} catch (SQLException e) {			
			e.printStackTrace();
		} finally{
			DBClose.close(psmt, conn, rs);			
			System.out.println("6/6 S detailAfterlBbs");
		}
		
		return dto;
		
	}
	//After list 수정
	public boolean  AfrerBbsUpdate(AfterBbsDto bbs) {
		String sql=" UPDATE AFTERBBS SET  "
				+" TITLE=?, CONTENT=? "
				+ " WHERE SEQ=? ";
		System.out.println("sql: "+ sql);
		int count = 0;
		Connection conn=null;
		PreparedStatement psmt=null;
		System.out.println("1/6 S AfrerBbsUpdate");
		try {
			conn = DBConnection.makeConnection();			
			psmt=conn.prepareStatement(sql);
			psmt.setString(1, bbs.getTitle());
			psmt.setString(2, bbs.getContent());
			psmt.setInt(3, bbs.getSeq());
			System.out.println("2/6 S AfrerBbsUpdate");
			count = psmt.executeUpdate();
			System.out.println("3/6 S AfrerBbsUpdate");
			
		} catch (SQLException e) {			
			e.printStackTrace();
		} finally{
			DBClose.close(psmt, conn, null);	
			System.out.println("4/6 S AfrerBbsUpdate");
		}
		System.out.println("5/6 S AfrerBbsUpdate");
		return count>0?true:false;
		
	}
	
	public boolean  AfrerBbsUpdateWithPic1(AfterBbsDto bbs) {
		String sql=" UPDATE AFTERBBS SET  "
				+" TITLE=?, CONTENT=?, PIC1 = ? "
				+ " WHERE SEQ=? ";
		
		System.out.println("sql: "+ sql);
		int count = 0;
		Connection conn=null;
		PreparedStatement psmt=null;
		System.out.println("1/6 S AfrerBbsUpdate");
		try {
			conn = DBConnection.makeConnection();			
			psmt=conn.prepareStatement(sql);
			psmt.setString(1, bbs.getTitle());
			psmt.setString(2, bbs.getContent());
			psmt.setString(3, bbs.getPic1());
			psmt.setInt(4, bbs.getSeq());
			
			System.out.println("2/6 S AfrerBbsUpdate");
			count = psmt.executeUpdate();
			System.out.println("3/6 S AfrerBbsUpdate");
			
		} catch (SQLException e) {			
			e.printStackTrace();
		} finally{
			DBClose.close(psmt, conn, null);	
			System.out.println("4/6 S AfrerBbsUpdate");
		}
		System.out.println("5/6 S AfrerBbsUpdate");
		return count>0?true:false;
		
	}
	
	
	
	
	
	
	// 수정할때 가져오기
	public AfterBbsDto getBbs(int seq) {
		String sql = " SELECT A.SEQ, A.TITLE, A.PIC1, A.CONTENT, A.TARGET_USER_SEQ, "
				+ " A.REG_DATE, A.LAST_UPDATE, A.DEL, A.READCOUNT, B.EMAIL AS USER_EMAIL  "
				+ " FROM AFTERBBS A, DENGUSER B "
				+ " WHERE A.SEQ=? AND A.TARGET_USER_SEQ = B.SEQ ";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		AfterBbsDto dto = null;
		
		try {
			conn = DBConnection.makeConnection();
			System.out.println("2/6 S getBbs");
			
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, seq);
			System.out.println("3/6 S getBbs");
			
			rs = psmt.executeQuery();
			System.out.println("4/6 S getBbs");
			
			while(rs.next()){
				int i = 1;
				dto = new AfterBbsDto(
						rs.getInt(i++),//int seq, 
						rs.getString(i++),//String title, 
						rs.getString(i++),//String pic1, 
						rs.getString(i++),//String content, 
						rs.getInt(i++),//int userSeq, 
						rs.getString(i++),//String rdate, 
						rs.getString(i++),//String ldate,
						rs.getInt(i++),
						rs.getInt(i++),
						rs.getString(i++));
			}
			System.out.println("5/6 S getBbs");
			
		} catch (SQLException e) {			
			e.printStackTrace();
		} finally{
			DBClose.close(psmt, conn, rs);			
			System.out.println("6/6 S getBbs");
		}
		
		return dto;
		
	}
	
	
	
	
	
	// After list 삭제
	public boolean AfterdeletBbs(int seq) {
	     String sql=" UPDATE AFTERBBS "
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
	
	
	
	//paging 화면
	public List<AfterBbsDto> getAfterBbsPagingList(AfterPagingDto paging){
		return null;
		
	}
	
	
	public void readCount(int seq) {
	      System.out.println("readcount");
	   String sql = " UPDATE  AFTERBBS  SET  "  
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
	
	
	/*String sql = " SELECT A.SEQ, A.TITLE, A.PIC1, A.CONTENT, A.TARGET_USER_SEQ, "
			+ " A.REG_DATE, A.LAST_UPDATE, A.DEL, A.READCOUNT, B.EMAIL AS USER_EMAIL  "
			+ " FROM AFTERBBS A, DENGUSER B "
			+ " WHERE A.SEQ=? AND A.TARGET_USER_SEQ = B.SEQ ";*/
	
	
	
	//After Bbs list 검색
	public List<AfterBbsDto> getFindAfterlist(String Searchtype, String SearchWord){
		
	      List<AfterBbsDto> list = new ArrayList<>();
	      
	      
	      String sql = "SELECT A.SEQ, A.TITLE, A.PIC1, A.CONTENT, A.TARGET_USER_SEQ, "
					+ " A.REG_DATE, A.LAST_UPDATE, A.DEL, A.READCOUNT , B.EMAIL AS USER_EMAIL  "
					+ " FROM AFTERBBS A, DENGUSER B  "
					+ " WHERE A.DEL=0 AND " + Searchtype + " LIKE '%" + SearchWord + "%' AND A.TARGET_USER_SEQ = B.SEQ "
		              + " ORDER BY REG_DATE DESC ";

	      
	      

	   
	      Connection conn = null;
	      PreparedStatement psmt = null;
	      ResultSet rs = null;

	      try {
	         conn = DBConnection.makeConnection();
	         System.out.println("2/6 getFindAfterlist Success");

	         psmt = conn.prepareStatement(sql);
	         System.out.println("sql = " + sql);
	         System.out.println("3/6 getFindAfterlist Success");
	         
	      
	         rs = psmt.executeQuery();
	         System.out.println("4/6 getFindAfterlist Success");

	         while (rs.next()) {
	            int i = 1;
	            
	      

	            AfterBbsDto dto = new AfterBbsDto(rs.getInt(i++), // seq
								            		rs.getString(i++),//String title, 
								            		rs.getString(i++),//String pic1, 
								            		rs.getString(i++),//String content, 
								    				rs.getInt(i++),//int userSeq, 
								    				rs.getString(i++),//String rdate, 
								    				rs.getString(i++),//String ldate,
								    				rs.getInt(i++), //del
								    				rs.getInt(i++),//readcount
								    				rs.getString(i++)); 
	            list.add(dto);
	         }
	         System.out.println("5/6 getFindAfterlist Success");

	      } catch (SQLException e) {
	         System.out.println("getFindAfterlist fail");
	         System.out.println(e.getMessage());
	         System.out.println(e.getErrorCode());
	         System.out.println(e.getSQLState());

	      } finally {
	         DBClose.close(psmt, conn, rs);
	      
	      }

	      return list;

	
	}
	
	//좋아요 추가
	   public void likeTB_insert(int target_user_seq, int target_bbs_seq) {
			String sql = "INSERT INTO LIKETABLE (SEQ, BBS_CATEGORY, TARGET_USER_SEQ, TARGET_BBS_SEQ) "
					+ " VALUES(LIKE_SEQ.NEXTVAL, 2, ?, ?) ";
			
			
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
			String sql = " delete from liketable where BBS_CATEGORY = 2 AND target_user_seq = ? and target_bbs_seq = ? ";
			
			
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
			String sql = "select*from liketable where BBS_CATEGORY = 2 AND target_user_seq = ? and target_bbs_seq = ? ";
			

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
			String sql = " select count(*) as likecount from liketable where BBS_CATEGORY = 2 AND target_bbs_seq = ?  ";
			
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
