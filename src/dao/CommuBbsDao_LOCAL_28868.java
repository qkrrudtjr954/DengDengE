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

public class CommuBbsDao implements iCommuBbsDao {
   private static CommuBbsDao comDao = new CommuBbsDao();

   public CommuBbsDao() {
      DBConnection.initConnect();
   }

   public CommuBbsDao getInstance() {

      return comDao;
   }
   
   
   // 메인 리스트
   @Override
   public List<CommuBbsDto> getCommulist() {
      List<CommuBbsDto> list = new ArrayList<>();

      String sql = " SELECT a.seq, a.TITLE as title, target_user_seq, READCOUNT, a.reg_date as reg_date, a.last_update as last_update, a.del, b.title as category_name, c.email as user_email  "
            + " FROM COMMUBBS A, CATEGORY B,  DENGUSER c" 
            + " WHERE A.TARGET_CATEGORY = B.TARGET_CATEGORY AND a.target_user_seq = c.seq AND a.DEL=0"
            + " ORDER BY a.REG_DATE DESC ";

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
                  rs.getString(i++), // title
                  "", // String pic1
                  "", // String content
                  rs.getInt(i++), // int target_user_seq
                  0, // int target_category
                  rs.getInt(i++), // int readcount
                  rs.getString(i++), // String reg_date
                  rs.getString(i++), // String last_update
                  rs.getInt(i++), // int del
                  rs.getString(i++),// category_name
                  rs.getString(i++)); //String user_email
            list.add(dto);
         }
         System.out.println("5/6 getCommulist Success");

      } catch (SQLException e) {
         System.out.println("getCommulist fail");
         System.out.println(e.getMessage());
         System.out.println(e.getErrorCode());
         System.out.println(e.getSQLState());

      } finally {
         DBClose.close(psmt, conn, rs);

      }

      return list;
   }

   // 글 읽거나 가져오기
   @Override
   public CommuBbsDto getCommu(int seq) {
      String sql = " SELECT a.seq, a.TITLE as title, content, a.target_user_seq, a.target_category, "
            + " readcount, a.last_update as last_update, del, b.title as category_name, c.email as user_email "
            + " FROM COMMUBBS A, CATEGORY B, DENGUSER c "
            + " WHERE A.TARGET_CATEGORY = B.TARGET_CATEGORY AND a.target_user_seq = c.seq AND A.SEQ=?";

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

         System.out.println("글읽기 sql = " + sql);

         rs = psmt.executeQuery();
         System.out.println("4/6 S getCommu");

         while (rs.next()) {
            int i = 1;
            
            
            dto = new CommuBbsDto(rs.getInt(i++), //seq, 
                           rs.getString(i++), //title, 
                           "", //pic1, 
                           rs.getString(i++), //content, 
                           rs.getInt(i++), //target_user_seq, 
                           rs.getInt(i++), //target_category, 
                           rs.getInt(i++), //readcount, 
                           "", //reg_date,
                           rs.getString(i++), //last_update,
                           rs.getInt(i++), //del, 
                           rs.getString(i++), //category_name,
                           rs.getString(i++)); //user_email);
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

   // 조회수 올리기
   @Override
   public void readCount(int seq) {
      System.out.println("readcount");
      String sql = " UPDATE  COMMUBBS  SET  " + " READCOUNT=READCOUNT+1 " + " WHERE SEQ=? ";
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

   // 글쓰기
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

         count = -1;

      } finally {
         DBClose.close(psmt, conn, rs);
      }

      return count > 0 ? true : false;
   }

   // 삭제하기
   @Override
   public boolean delCommu(int seq) {
      String sql = " UPDATE COMMUBBS " + " SET DEL=1 " + " WHERE SEQ=? ";

      int count = 0;
      Connection conn = null;
      PreparedStatement psmt = null;

      try {
         conn = DBConnection.makeConnection();
         psmt = conn.prepareStatement(sql);
         psmt.setInt(1, seq);
         count = psmt.executeUpdate();
         System.out.println("3/6 delete");
      } catch (SQLException e) {
         e.printStackTrace();
         System.out.println("delete fail");
      } finally {
         DBClose.close(psmt, conn, null);
      }

      return count > 0 ? true : false;
   }

   // 수정하기
   @Override
   public boolean udtCommu(CommuBbsDto comdto) {
      String sql = " UPDATE COMMUBBS SET  " + " TITLE=?, CONTENT=?, LAST_UPDATE=sysdate " + " WHERE SEQ=? ";
      System.out.println("sql: " + sql);
      int count = 0;
      Connection conn = null;
      PreparedStatement psmt = null;
      System.out.println("1/6 S udtCommu");
      try {
         conn = DBConnection.makeConnection();
         psmt = conn.prepareStatement(sql);
         psmt.setString(1, comdto.getTitle());
         psmt.setString(2, comdto.getContent());
         psmt.setInt(3, comdto.getSeq());
         System.out.println("2/6 S udtCommu");
         count = psmt.executeUpdate();
         System.out.println("3/6 S udtCommu");

      } catch (SQLException e) {
         e.printStackTrace();
         System.out.println("FAIL S udtCommu");
      } finally {
         DBClose.close(psmt, conn, null);
         System.out.println("4/6 S udtCommu");
      }
      System.out.println("5/6 S udtCommu");
      return count > 0 ? true : false;

   }

   // 카테고리별 불러오기
   @Override
   public List<CommuBbsDto> getCategory(int target_category) {
      List<CommuBbsDto> list = new ArrayList<>();

      String sql = " SELECT a.seq, a.TITLE as title, target_user_seq, READCOUNT, a.reg_date, a.last_update as last_update, del, b.title as category_name, a.READCOUNT, c.email as user_email  "
            + " FROM COMMUBBS A, CATEGORY B, DENGUSER c"
            + " WHERE A.TARGET_CATEGORY = B.TARGET_CATEGORY AND a.target_user_seq = c.seq AND DEL=0 AND a.target_category=? "
            + " ORDER BY a.REG_DATE DESC ";

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
                  rs.getString(i++), // title
                  "", // String pic1
                  "", // String content
                  rs.getInt(i++), // int target_user_seq
                  0, // int target_category
                  rs.getInt(i++), // int readcount
                  rs.getString(i++), // String reg_date
                  rs.getString(i++), // String last_update
                  rs.getInt(i++), // int del
                  rs.getString(i++), // category_name
                  rs.getString(i++)); //user_email 
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

   // 검색하기
   public List<CommuBbsDto> getFindCommulist(String Searchtype, String SearchWord) {
      List<CommuBbsDto> list = new ArrayList<>();

      String sql = " SELECT a.seq, a.TITLE as title, target_user_seq, READCOUNT, a.reg_date as reg_date, a.last_update as last_update, a.del, b.title as category_name, c.email as user_email  "
            + " FROM COMMUBBS A, CATEGORY B,  DENGUSER c" 
            + " WHERE A.TARGET_CATEGORY = B.TARGET_CATEGORY AND a.target_user_seq = c.seq AND DEL=0 "
            + " AND " + Searchtype + " LIKE '%" + SearchWord + "%'" + " ORDER BY a.REG_DATE DESC ";

      Connection conn = null;
      PreparedStatement psmt = null;
      ResultSet rs = null;

      try {
         conn = DBConnection.makeConnection();
         System.out.println("2/6 getFindCommulist Success");

         psmt = conn.prepareStatement(sql);
         System.out.println("sql = " + sql);
         System.out.println("3/6 getFindCommulist Success");

         rs = psmt.executeQuery();
         System.out.println("4/6 getFindCommulist Success");

         while (rs.next()) {
            int i = 1;

            CommuBbsDto dto = new CommuBbsDto(rs.getInt(i++), // seq
                  rs.getString(i++), // title
                  "", // String pic1
                  "", // String content
                  rs.getInt(i++), // int target_user_seq
                  0, // int target_category
                  rs.getInt(i++), // int readcount
                  rs.getString(i++), // String reg_date
                  rs.getString(i++), // String last_update
                  rs.getInt(i++), // int del
                  rs.getString(i++), // category_name
                  rs.getString(i++)); //user_email
            list.add(dto);
         }
         System.out.println("5/6 getFindCommulist Success");

      } catch (SQLException e) {
         System.out.println("getFindCommulist fail");
         System.out.println(e.getMessage());
         System.out.println(e.getErrorCode());
         System.out.println(e.getSQLState());

      } finally {
         DBClose.close(psmt, conn, rs);

      }

      return list;
   }
   

/*   CREATE TABLE LIKETABLE(
   SEQ NUMBER(8) PRIMARY KEY, 
   TARGET_USER_SEQ NUMBER(8),
   FOREIGN KEY (TARGET_USER_SEQ) REFERENCES denguser(seq),
   TARGET_BBS_SEQ NUMBER(8),
   FOREIGN KEY (TARGET_BBS_SEQ) REFERENCES COMMUBBS(seq)
   );*/
   
   @Override
   public boolean Prevent_duplication(int target_user_seq, int target_bbs_seq) {
      String sql = "select*from liketable where BBS_CATEGORY = 3 AND target_user_seq = ? and target_bbs_seq = ? ";
      

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
   
   public void likeTB_insert(int target_user_seq, int target_bbs_seq) {
      String sql = "INSERT INTO LIKETABLE (SEQ, BBS_CATEGORY, TARGET_USER_SEQ, TARGET_BBS_SEQ) "
            + " VALUES(LIKE_SEQ.NEXTVAL, 3, ?, ?) ";
      
      
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
   
   public void likeTB_delete(int target_user_seq, int target_bbs_seq) {
      String sql = " delete from liketable where BBS_CATEGORY = 3 AND target_user_seq = ? and target_bbs_seq = ? ";
      
      
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

   
   public int getLikeCount(int bbs_seq) {
      String sql = " select count(*) as likecount from liketable where BBS_CATEGORY = 3 AND target_bbs_seq = ?  ";
      
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