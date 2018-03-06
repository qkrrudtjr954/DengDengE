package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import db.DBClose;
import db.DBConnection;
import dto.CalendarDto;

public class CalendarDao {
	
	public CalendarDao() {
		DBConnection.initConnect();
	}
	
	public List<CalendarDto> getEvents(){
		List<CalendarDto> list = new ArrayList<>();
		
		String sql = " select * from event ";
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		conn = DBConnection.makeConnection();
		try {
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				CalendarDto dto = new CalendarDto();
				dto.setContent(rs.getString("content"));
				dto.setEnd(rs.getString("end_date"));
				dto.setLocation(rs.getString("location"));
				dto.setSeq(rs.getInt("seq"));
				dto.setTitle(rs.getString("title"));
				dto.setStart(rs.getString("start_date"));
				
				list.add(dto);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBClose.close(psmt, conn, rs);
		}
		System.out.println(list);
		return list;
	}
	
	public CalendarDto getEvent(int seq) {
		CalendarDto event = new CalendarDto();
		
		String sql = " select * from event where seq = ?";
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		conn = DBConnection.makeConnection();
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, seq);
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				event.setContent(rs.getString("content"));
				event.setEnd(rs.getString("end_date"));
				event.setLocation(rs.getString("location"));
				event.setSeq(rs.getInt("seq"));
				event.setTitle(rs.getString("title"));
				event.setStart(rs.getString("start_date"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBClose.close(psmt, conn, rs);
		}
		System.out.println(event);
		return event;
	}

}
