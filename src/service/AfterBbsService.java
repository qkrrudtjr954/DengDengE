package service;

import java.util.List;

import dao.AfterBbsDao;
import dto.AfterBbsDto;

public class AfterBbsService {
	
	private static AfterBbsService afterBbsService = null; 
	public AfterBbsDao afterBbsDao;
	
	private AfterBbsService() {
		afterBbsDao = new AfterBbsDao();
	}
	
	public static AfterBbsService getInstance() {
		if(afterBbsService==null) {
			afterBbsService = new AfterBbsService();
			
		}
		return afterBbsService;
	}
	//list
	public List<AfterBbsDto> getAfterlBbsList(){
		return afterBbsDao.getAfterlBbsList();
	}
	
	//bbs글쓰기
	public boolean wirteAfterBbs(AfterBbsDto dto) {
		return afterBbsDao.wirteAfterBbs(dto);		
	}
	//디테일
	public AfterBbsDto detailAfterlBbs(int seq) {
		return afterBbsDao.detailAfterlBbs(seq);
	}
	
	//수정
	public boolean AfrerBbsUpdate(AfterBbsDto bbs) {
		return afterBbsDao.AfrerBbsUpdate(bbs);	
	}
	
	//수정할때 가져오기
	public AfterBbsDto getBbs(int seq) {
		return afterBbsDao.getBbs(seq);
		
	}
	
	public boolean AfterdeletBbs(int seq) {
		return afterBbsDao.AfterdeletBbs(seq);
	}
	
	
	//조회수
	public void readCount(int seq) {
        afterBbsDao.readCount(seq);
    }
	
	public List<AfterBbsDto> getFindAfterlist(String Searchtype, String SearchWord){
		return afterBbsDao.getFindAfterlist(Searchtype, SearchWord);
	}
	
	
	public boolean Prevent_duplication(int target_user_seq, int target_bbs_seq) {
		return afterBbsDao.Prevent_duplication(target_user_seq, target_bbs_seq);
	}

	public void likeTB_delete(int target_user_seq, int target_bbs_seq) {
		afterBbsDao.likeTB_delete(target_user_seq, target_bbs_seq);
	}

	public void likeTB_insert(int target_user_seq, int target_bbs_seq) {
		afterBbsDao.likeTB_insert(target_user_seq, target_bbs_seq);
	}

	public int getLikeCount(int bbs_seq) {
		return afterBbsDao.getLikeCount(bbs_seq);
	}

	
	
	
	
	

}
