package dao;

import java.util.List;

import dto.CategoryDto;
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
	public boolean udtCommu(CommuBbsDto comdto);

	//카테고리 별로 구분
	public List<CommuBbsDto> getCategory(int target_category);

	public List<CommuBbsDto> getFindCommulist(String Searchtype, String SearchWord);

	public boolean Prevent_duplication(int target_user_seq, int target_bbs_seq);

	public void likeTB_delete(int target_user_seq, int target_bbs_seq);

	public void likeTB_insert(int target_user_seq, int target_bbs_seq);
	
	public List<CategoryDto> getCategories();

	public int getLikeCount(int bbs_seq);
}
