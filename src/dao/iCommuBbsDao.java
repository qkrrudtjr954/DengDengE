package dao;

import java.util.List;

import dto.CommuBbsDto;

public interface iCommuBbsDao {
	
	//리스트 불러오기
	public List<CommuBbsDto> getCommulist();
	
	//글 내용 불러오기
	public CommuBbsDto getCommu(int seq);
	
	//조회수
	public void readCount(int seq);
	
	//글쓰기
	public boolean writeCommu(CommuBbsDto comdto);
	
	//삭제
	public boolean delCommu(int seq);
	
	//수정 
	public boolean udtCommu(int seq, CommuBbsDto comdto);
	

}
