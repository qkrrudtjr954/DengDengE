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

public class AfterCommentDao {
	
	//After 답글
	
	public boolean AfterAnswer(int seq , AfterCommentDto bbs) {
		return false;
	}

	public AfterCommentDto getComment(int preseq) {
		String sql = " select * from aftercomment where seq = ?";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		AfterCommentDto dto = new AfterCommentDto();
		
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

	public void updateStep(AfterCommentDto comment) {
		String sql = " update aftercomment set step = step+1 where step >= ? and target_after_seq = ? ";
		
		System.out.println(">>>>> AfterCommentDao .updateStep() sql : "+sql);
		
		Connection conn = null;
		PreparedStatement psmt = null;
		int count = -1;
		
		try {
			conn = DBConnection.makeConnection();
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, comment.getStep());
			psmt.setInt(2, comment.getRef());
			
			count = psmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public boolean addComment(AfterCommentDto comment) {
		/*
		dto.setContent(rs.getString("content"));
		dto.setDepth(rs.getInt("depth"));
		dto.setLast_update(rs.getString("last_update"));
		dto.setRef(rs.getInt("ref"));
		dto.setReg_date(rs.getString("reg_date"));
		dto.setSeq(rs.getInt("seq"));
		dto.setStep(rs.getInt("step"));
		dto.setTarget_user_seq(rs.getInt("target_user_seq"));*/
		
		String sql = " insert into aftercomment(seq, depth, target_after_seq, step, reg_date, target_user_seq, content) " + 
				" values (aftercomment_seq.nextval, ?, ?, ?, sysdate, ?, ? ) ";
		
		System.out.println(">>>>> AfterCommentDao .addComment() sql : "+sql);
		
		Connection conn = null;
		PreparedStatement psmt = null;
		int count = -1;
		
		try {
			conn = DBConnection.makeConnection();
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, comment.getDepth());
			psmt.setInt(2, comment.getRef());
			psmt.setInt(3, comment.getStep());
			psmt.setInt(4, comment.getTarget_user_seq());
			psmt.setString(5, comment.getContent());
			
			count = psmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return (count > 0) ? true: false;
	}

	public List<AfterCommentDto> getAllComments(int ref) {
		String sql = " select * from aftercomment where target_after_seq = ? order by step asc";
		
		System.out.println(">>>>> AfterCommentDao .getAllComments() sql : "+sql);
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		List<AfterCommentDto> list = new ArrayList<>();
		
		try {
			conn = DBConnection.makeConnection();
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, ref);
			
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				AfterCommentDto dto = new AfterCommentDto();
				dto.setContent(rs.getString("content"));
				dto.setDepth(rs.getInt("depth"));
				dto.setRef(rs.getInt("target_after_seq"));
				dto.setReg_date(rs.getString("reg_date"));
				dto.setSeq(rs.getInt("seq"));
				dto.setStep(rs.getInt("step"));
				dto.setTarget_user_seq(rs.getInt("target_user_seq"));
				
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
		String sql = " select count(*) as num from aftercomment where target_after_seq = ? and del = 0 ";
		
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
