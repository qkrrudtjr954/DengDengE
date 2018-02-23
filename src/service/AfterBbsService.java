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
	
	public List<AfterBbsDto> getAfterlBbsList(){
		return afterBbsDao.getAfterlBbsList();
	}
	
	
	

}
