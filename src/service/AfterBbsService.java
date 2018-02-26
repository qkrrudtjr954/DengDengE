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
	public boolean wirtelAfterBbs(AfterBbsDto dto) {
		return afterBbsDao.wirtelAfterBbs(dto);		
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
	
	
	
	
	
	
	
	

}
