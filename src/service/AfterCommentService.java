package service;

import dao.AfterCommentDao;

public class AfterCommentService {
	
	private static AfterCommentService afterCommentService = null;
	public AfterCommentDao afterCommentDao;
	
	private AfterCommentService() {
		afterCommentDao = new AfterCommentDao();
	}
	
	public static AfterCommentService getInstance() {
		if(afterCommentService==null) {
			afterCommentService = new AfterCommentService();
			
		}
		return afterCommentService;
		
	}
	
	
	

}
