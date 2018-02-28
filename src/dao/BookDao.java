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
   
   public List<BookDto> getBookList() {
      String sql = " SELECT A.SEQ, A.TARGET_USER_SEQ, A.TARGET_USER_EMAIL, A.CONTENT "
            + " FROM BOOK A, DENGUSER B "
            + " WHERE A.TARGET_USER_SEQ = B.SEQ "
            + " AND A.TARGET_USER_EMAIL = B.EMAIL ";
      System.out.println("s"+sql);
      
      Connection conn = null;
      PreparedStatement psmt = null;
      ResultSet rs = null;
      
      List<BookDto> list = new ArrayList<BookDto>();

       try {
            conn = DBConnection.makeConnection();
            System.out.println("1/6 S getBookList");
            psmt = conn.prepareStatement(sql);
            System.out.println("2/6 S getBookList");
            rs = psmt.executeQuery();
            System.out.println("3/6 S getBookList");
            
            while(rs.next()) {
               int i = 1;
               BookDto bookDto = new BookDto();
                  bookDto.setSeq(rs.getInt("SEQ"));            //seq, 
                  bookDto.setUser_seq(rs.getInt("TARGET_USER_SEQ"));            //user_seq, 
                  bookDto.setUser_email(rs.getString("TARGET_USER_EMAIL"));               //user_email, 
                  bookDto.setContent(rs.getString("CONTENT"));            //content
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
   
   public boolean checkBook(int seq) {
      String sql = " SELECT A.SEQ, A.TARGET_USER_SEQ, A.TARGET_USER_EMAIL, A.CONTENT "
            + " FROM BOOK A, DENGUSER B "
            + " WHERE A.TARGET_USER_SEQ = B.SEQ "
            + " AND A.TARGET_USER_EMAIL = B.EMAIL "
            + " AND A.SEQ=? ";
      System.out.println("s"+sql);
      
      Connection conn = null;
      PreparedStatement psmt = null;
      ResultSet rs = null;
      
      int count = 0;
      
      try {
         conn = DBConnection.makeConnection();
         System.out.println("1/6 S checkBook");
            
         psmt = conn.prepareStatement(sql);
         psmt.setInt(1, seq);
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
   
   public boolean addBook(BookDto bookDto) {
      String sql = " INSERT INTO BOOK(SEQ, TARGET_USER_SEQ,"
            + " TARGET_USER_EMAIL,  CONTENT) "
            + " VALUES(BOOK_SEQ.NEXTVAL, ?, ?, ?) ";
      
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
         System.out.println("2/6 S addBook");
         System.out.println(sql);
         count = psmt.executeUpdate();
         System.out.println("3/6 S addBook");
         
      } catch (SQLException e) {
         System.out.println("wirteAnimalBbs fail");
            System.out.println(e.getMessage());
            System.out.println(e.getErrorCode());
            System.out.println(e.getSQLState());
      }finally{
         DBClose.close(psmt, conn, rs);   
         System.out.println("4/6 S addBook");
      }
      
      return count>0?true:false;
   }
}