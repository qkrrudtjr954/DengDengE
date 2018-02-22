package service;

import dao.AfterBbsDao;

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
	
	
	
	
	

}
