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
		String sql = " SELECT SEQ, TITLE, PIC1 "
				+ " FROM ANIMALBBS ";
		
		
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
				aniBbsDto.setPic1(rs.getString("PIC1"));
				
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
	public boolean wirteAnimalBbs(AnimalBbsDto anibDto) {
		return false;
	}
	
	// 입양하기 글 디테일
	public AnimalBbsDto detailAnimalBbs(int seq) {
		return null;
	}
	
	// 입양하기 글 삭제
	public boolean deleteBbs(int seq) {
		return false;
	}
	
	/*
	// 페이징 처리
	public List<AnimalBbsDto> getAnimalBbspaging(paginBean paging) {
		return null;
	}
	*/
}



















