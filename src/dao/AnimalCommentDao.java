package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import db.DBClose;
import db.DBConnection;
import dto.AfterCommentDto;
import dto.AnimalCommentDto;

public class AnimalCommentDao {
	
	/*+ answer(int seq , AnimalComment dto)  : boolean*/
	
	public boolean answer(int seq, AnimalCommentDao anicDto) {
		return false;
	}
	
	public AnimalCommentDto getComment(int preseq) {
		String sql = " select * from animalcomment where seq = ?";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		AnimalCommentDto dto = new AnimalCommentDto();
		
		try {
			conn = DBConnection.makeConnection();
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, preseq);
			
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				dto.setContent(rs.getString("content"));
				dto.setDepth(rs.getInt("depth"));
				dto.setRef(rs.getInt("target_after_seq"));
				dto.setReg_date(rs.getString("reg_date"));
				dto.setSeq(rs.getInt("seq"));
				dto.setStep(rs.getInt("step"));
				dto.setTarget_user_seq(rs.getInt("target_user_seq"));
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return dto;
		
	}
	
	public void updateStep(AnimalCommentDto comment) {
		String sql = " update animalcomment set step = step+1 where step >= ? and target_after_seq = ? ";
		
		System.out.println(">>>>> AnimalCommentDto .updateStep() sql : "+sql);
		
		Connection conn = null;
		PreparedStatement psmt = null;
		int count = -1;
		
		try {
			conn = DBConnection.makeConnection();
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, comment.getStep()+1);
			psmt.setInt(2, comment.getRef());
			
			count = psmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	public boolean addComment(AnimalCommentDto comment) {
		
		String sql = " insert into animalcomment(seq, depth, target_after_seq, step, reg_date, target_user_seq, content, target_user_email ) " + 
				" values (aftercomment_seq.nextval, ?, ?, ?, sysdate, ?, ?, ? ) ";
		
		System.out.println(">>>>> AnimalCommentDto .addComment() sql : "+sql);
		
		
		Connection conn = null;
		PreparedStatement psmt = null;
		int count = -1;
		
		
		try {
			conn = DBConnection.makeConnection();
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, comment.getDepth()+1);
			psmt.setInt(2, comment.getRef());
			psmt.setInt(3, comment.getStep()+1);
			psmt.setInt(4, comment.getTarget_user_seq());
			psmt.setString(5, comment.getContent());
			psmt.setString(6, comment.getUser_email());
			
			count = psmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return (count > 0) ? true: false;
		
	}
	
	public List<AnimalCommentDto> getAllComments(int ref){
		String sql = " select * from animalcomment where target_after_seq = ? order by step asc";
		
		System.out.println(">>>>> AnimalCommentDto .getAllComments() sql : "+sql);
		
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		List<AnimalCommentDto> list = new ArrayList<>();
		
		try {
			conn = DBConnection.makeConnection();
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, ref);
			
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				AnimalCommentDto dto = new AnimalCommentDto();
				dto.setContent(rs.getString("content"));
				dto.setDepth(rs.getInt("depth"));
				dto.setRef(rs.getInt("target_after_seq"));
				dto.setReg_date(rs.getString("reg_date"));
				dto.setSeq(rs.getInt("seq"));
				dto.setStep(rs.getInt("step"));
				dto.setTarget_user_seq(rs.getInt("target_user_seq"));
				dto.setUser_email(rs.getString("target_user_email"));
				
				System.out.println(dto);
				
				list.add(dto);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBClose.close(psmt, conn, rs);
		}
		
		return list;
		
	}
	
	public int getCommentsLength(int ref) {
		String sql = " select count(*) as num from animalcomment where target_after_seq = ? and del = 0 ";
		
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		int length = 0;
		
		try {
			conn = DBConnection.makeConnection();
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, ref);
			
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				length = rs.getInt("num");
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return length;
		
		
	}
	
	
	
	
	
	
	
}
