package service;

import dao.AnimalCommentDao;

public class AnimalCommentService {
	private static AnimalCommentService aniComService;
	public AnimalCommentDao aniComManagaer;
	
	private AnimalCommentService() {
		aniComManagaer = new AnimalCommentDao();
	}
	
	public static AnimalCommentService getInstance() {
		if(aniComService == null) {
			aniComService = new AnimalCommentService();
		}
		return aniComService;
	}
	
	public boolean answer(int seq, AnimalCommentDao anicDto) {
		return false;
	}
}
