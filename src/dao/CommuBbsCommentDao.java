package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import db.DBClose;
import db.DBConnection;
import dto.CommuBbsComment;

public class CommuBbsCommentDao {
	
	public CommuBbsComment getComment(int preseq) {
		String sql = " select * from commucomment where seq = ?";
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		CommuBbsComment dto = new CommuBbsComment();
		
		
		try {
			conn = DBConnection.makeConnection();
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, preseq);
			
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				dto.setContent(rs.getString("content"));
				dto.setDepth(rs.getInt("depth"));
				dto.setRef(rs.getInt("target_commu_seq"));
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
	
	public void updateStep(CommuBbsComment comment) {
		String sql = " update commucomment set step = step+1 where step >= ? and target_commu_seq = ? ";
		
		System.out.println(">>>>> CommuBbsComment .updateStep() sql : "+sql);
		
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
	
	public boolean addComment(CommuBbsComment comment) {
		String sql = " insert into commucomment(seq, depth, target_commu_seq, step, reg_date, target_user_seq, content, target_user_email, del ) " + 
				" values (commucomment_seq.nextval, ?, ?, ?, sysdate, ?, ?, ?, 0 ) ";
		
		
		System.out.println(">>>>> CommuBbsComment .addComment() sql : "+sql);
		
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
	
	public List<CommuBbsComment> getAllComments(int ref){
		String sql = " select * from commucomment where target_commu_seq = ? and del = 0 order by step asc";
		
		
		System.out.println(">>>>> CommuBbsComment .getAllComments() sql : "+sql);
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		List<CommuBbsComment> list = new ArrayList<>();
		
		try {
			conn = DBConnection.makeConnection();
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, ref);
			
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				CommuBbsComment dto = new CommuBbsComment();
				dto.setContent(rs.getString("content"));
				dto.setDepth(rs.getInt("depth"));
				dto.setRef(rs.getInt("target_commu_seq"));
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
		String sql = " select count(*) as num from commucomment where target_commu_seq = ? and del = 0 ";
		
		
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
	
	public boolean deleteComment(int seq) {
		/*System.out.println("delcomment" +seq);*/
		String sql = " update commucomment set del = 1 where seq = ? ";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		int count = -1;
		
		try {
			conn = DBConnection.makeConnection();
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, seq);
			
			count = psmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return (count > 0) ? true: false;
	}
	
	public int getTargetUserSeq(int seq) {
		String sql = "select target_user_seq from commucomment where seq = ? ";
		
		System.out.println(">>>>> CommuBbsComment .getTargetUserSeq() sql : "+sql);
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		int target_user_seq = 0;
		
		try {
			conn = DBConnection.makeConnection();
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, seq);
			
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				target_user_seq = rs.getInt("target_user_seq");
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBClose.close(psmt, conn, rs);
		}
		
		return target_user_seq;
	}
	
	
	
	
	
	
	

}
